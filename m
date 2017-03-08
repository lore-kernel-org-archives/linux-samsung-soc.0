From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH] phy: phy-exynos-pcie: fix the wrong error return
Date: Wed, 08 Mar 2017 17:22:42 +0900
Message-ID: <20170308082242.15915-1-jh80.chung@samsung.com>
References: <CGME20170308082244epcas1p4e6509812a97b0bc9912b3deb296bae38@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45304 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752923AbdCHMi2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 07:38:28 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: kishon@ti.com, krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, linux-samsung-soc@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>

When it doesn't get the blk_base's resource, it was returned
the error about phy_base, not blk_base.
This patch is for fixing the wrong error return about blk_base.

Fixes: cf0adb8e281b ("phy: phy-exynos-pcie: Add support for Exynos PCIe PHY")

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 drivers/phy/phy-exynos-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-exynos-pcie.c b/drivers/phy/phy-exynos-pcie.c
index 4f60b83..60baf25 100644
--- a/drivers/phy/phy-exynos-pcie.c
+++ b/drivers/phy/phy-exynos-pcie.c
@@ -254,8 +254,8 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	exynos_phy->blk_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(exynos_phy->phy_base))
-		return PTR_ERR(exynos_phy->phy_base);
+	if (IS_ERR(exynos_phy->blk_base))
+		return PTR_ERR(exynos_phy->blk_base);
 
 	exynos_phy->drv_data = drv_data;
 
-- 
2.10.2
