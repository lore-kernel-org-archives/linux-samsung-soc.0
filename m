Received: from mail-m1973171.qiye.163.com (mail-m1973171.qiye.163.com [220.197.31.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3932C2ABF;
	Thu, 31 Jul 2025 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753967418; cv=none; b=cnOfPZsBopDxXiFHszaHmMm5qupBC0IUzfAyuuSLdBFcqaA+RMjz9Ze0zHS27n3snIz7WippCbPW2zMs9lUdl5rk/d9cG7Nc1YmZ6Z5zzS9WzRYpmCS/kcr2cjhmBYk0Vzr6iquPCjcS0vwYXrLjlpDF6CCQA1NtDF1Am/kvtAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753967418; c=relaxed/simple;
	bh=uuaUkbC3S5n6BFtv2VLpCSkSBRTOm2vf2tx85nIUUEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RqtX+pwTiZ5nokGY8sUICqJyMpQPkAgxea9IKzL+HhkvGfky4yySEAtLkpgULI8+vA+Oaa0CBTfl7BOH5kJiZoYNytQwohAUzyIOQumVaSLT9wQDqcnV/7JOmkRgrhT8RTU+SBoNnLj4sG6Es2NxLDkKyNU7TLloWHfOjjSJCLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id decea274;
	Thu, 31 Jul 2025 16:34:00 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [PATCH] memory: samsung: exynos-srom: Fix of_iomap leak in exynos_srom_probe
Date: Thu, 31 Jul 2025 16:33:40 +0800
Message-Id: <20250731083340.1057564-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985f9de4ea0229kunm049fa475e108a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR9KVh5MTEMeSBlIQktJSFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

The current error handling in exynos_srom_probe() has a resource leak
in the of_platform_populate() failure path. When this function fails
after successful resource allocation, srom->reg_base is not released.

To fix this issue, replace of_iomap() with
devm_platform_ioremap_resource(). devm_platform_ioremap_resource()
is a specialized function for platform devices.
It allows 'srom->reg_base' to be automatically released whether the
probe function succeeds or fails.

Besides, use IS_ERR() instead of !srom->reg_base
as the return value of devm_platform_ioremap_resource()
can either be a pointer to the remapped memory or
an ERR_PTR() encoded error code if the operation fails.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 drivers/memory/samsung/exynos-srom.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/samsung/exynos-srom.c
index e73dd330af47..d913fb901973 100644
--- a/drivers/memory/samsung/exynos-srom.c
+++ b/drivers/memory/samsung/exynos-srom.c
@@ -121,20 +121,18 @@ static int exynos_srom_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	srom->dev = dev;
-	srom->reg_base = of_iomap(np, 0);
-	if (!srom->reg_base) {
+	srom->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(srom->reg_base)) {
 		dev_err(&pdev->dev, "iomap of exynos srom controller failed\n");
-		return -ENOMEM;
+		return PTR_ERR(srom->reg_base);
 	}
 
 	platform_set_drvdata(pdev, srom);
 
 	srom->reg_offset = exynos_srom_alloc_reg_dump(exynos_srom_offsets,
 						      ARRAY_SIZE(exynos_srom_offsets));
-	if (!srom->reg_offset) {
-		iounmap(srom->reg_base);
+	if (!srom->reg_offset)
 		return -ENOMEM;
-	}
 
 	for_each_child_of_node(np, child) {
 		if (exynos_srom_configure_bank(srom, child)) {
-- 
2.20.1

