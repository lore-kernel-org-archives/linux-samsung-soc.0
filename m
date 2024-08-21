Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF491A2857;
	Wed, 21 Aug 2024 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224294; cv=none; b=CPVfk0Fc85BAKFp9w7BQBWubPbUeADEb3IqlLd9gDE6iS3aJHvAkyN6AlGriF38xaAjbK/mB00Rlab9Nhp6YTBZc4MUw5cH6wB1fA42oB3XMBosg2s9MD01q9zf9apFT4CN9M+OYrjNJkCj/7fG7u2+P6eh5XqJlGGIjf8/Eio8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224294; c=relaxed/simple;
	bh=5Lv2XgdhWWT8SKyDbubnYK67QobQT9NUGseIhseS/W8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pggIqWx8uWnpwtygzUyqXxOeHqRtN5zhpgIBkBkpmWAKhkpPH/+X0o+NbzD96hS5wqkvsUGGJvvvz1iwpOtFeDQ1kqeeUbCn30ex1stuFiPo9LHfYHWqfwxJaZKeR1RB4kEpPU4apGCCN7aGpTPL9Pa4oR5vNdXG0JU8l2z8Cdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wpcny6b84z609Q;
	Wed, 21 Aug 2024 15:06:46 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id D0B2E1401E0;
	Wed, 21 Aug 2024 15:11:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 21 Aug
 2024 15:11:28 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<krzk@kernel.org>, <alim.akhtar@samsung.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2] usb: ehci-exynos: Simplify with scoped for each OF child loop
Date: Wed, 21 Aug 2024 15:18:56 +0800
Message-ID: <20240821071856.2335529-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2:
- Update the commit subject.
- Spilit into 2 patches.
- Add Reviewed-by.
---
 drivers/usb/host/ehci-exynos.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index f40bc2a7a124..e3a961d3f5fc 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -48,7 +48,6 @@ struct exynos_ehci_hcd {
 static int exynos_ehci_get_phy(struct device *dev,
 				struct exynos_ehci_hcd *exynos_ehci)
 {
-	struct device_node *child;
 	struct phy *phy;
 	int phy_number, num_phys;
 	int ret;
@@ -66,26 +65,22 @@ static int exynos_ehci_get_phy(struct device *dev,
 		return 0;
 
 	/* Get PHYs using legacy bindings */
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &phy_number);
 		if (ret) {
 			dev_err(dev, "Failed to parse device tree\n");
-			of_node_put(child);
 			return ret;
 		}
 
 		if (phy_number >= PHY_NUMBER) {
 			dev_err(dev, "Invalid number of PHYs\n");
-			of_node_put(child);
 			return -EINVAL;
 		}
 
 		phy = devm_of_phy_optional_get(dev, child, NULL);
 		exynos_ehci->phy[phy_number] = phy;
-		if (IS_ERR(phy)) {
-			of_node_put(child);
+		if (IS_ERR(phy))
 			return PTR_ERR(phy);
-		}
 	}
 
 	exynos_ehci->legacy_phy = true;
-- 
2.34.1

