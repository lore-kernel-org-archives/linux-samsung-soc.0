Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4792BC74A5B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 26 Mar 2023 12:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjCZMiB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Mar 2023 08:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjCZMiA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Mar 2023 08:38:00 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C487F7A8B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Mar 2023 05:37:58 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id gPd9pANE3TpvfgPd9p9CXS; Sun, 26 Mar 2023 14:37:56 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Mar 2023 14:37:56 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] iommu/exynos: Use the devm_clk_get_optional() helper
Date:   Sun, 26 Mar 2023 14:37:50 +0200
Message-Id: <99c0d5ce643737ee0952df41fd60433a0bbeb447.1679834256.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use devm_clk_get_optional() instead of hand writing it.
This saves some loC and improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iommu/exynos-iommu.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 483aaaeb6dae..867f409e0325 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -747,22 +747,16 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	data->clk = devm_clk_get(dev, "sysmmu");
-	if (PTR_ERR(data->clk) == -ENOENT)
-		data->clk = NULL;
-	else if (IS_ERR(data->clk))
+	data->clk = devm_clk_get_optional(dev, "sysmmu");
+	if (IS_ERR(data->clk))
 		return PTR_ERR(data->clk);
 
-	data->aclk = devm_clk_get(dev, "aclk");
-	if (PTR_ERR(data->aclk) == -ENOENT)
-		data->aclk = NULL;
-	else if (IS_ERR(data->aclk))
+	data->aclk = devm_clk_get_optional(dev, "aclk");
+	if (IS_ERR(data->aclk))
 		return PTR_ERR(data->aclk);
 
-	data->pclk = devm_clk_get(dev, "pclk");
-	if (PTR_ERR(data->pclk) == -ENOENT)
-		data->pclk = NULL;
-	else if (IS_ERR(data->pclk))
+	data->pclk = devm_clk_get_optional(dev, "pclk");
+	if (IS_ERR(data->pclk))
 		return PTR_ERR(data->pclk);
 
 	if (!data->clk && (!data->aclk || !data->pclk)) {
@@ -770,10 +764,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 		return -ENOSYS;
 	}
 
-	data->clk_master = devm_clk_get(dev, "master");
-	if (PTR_ERR(data->clk_master) == -ENOENT)
-		data->clk_master = NULL;
-	else if (IS_ERR(data->clk_master))
+	data->clk_master = devm_clk_get_optional(dev, "master");
+	if (IS_ERR(data->clk_master))
 		return PTR_ERR(data->clk_master);
 
 	data->sysmmu = dev;
-- 
2.34.1

