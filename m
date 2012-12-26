From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] video: drm: exynos: mie bypass enable for fimd
Date: Wed, 26 Dec 2012 01:37:34 -0500
Message-ID: <1356503854-28100-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30918 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759Ab2LZGPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 01:15:13 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFM00FH6K16FYQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Dec 2012 15:15:11 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MFM00CQ9K15TP40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Dec 2012 15:15:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, kgene.kim@samsung.com

Bypasses the mie for fimd by parsing the register and bit offset values
from "mie-bypass" node, if "mie-bypass" node is present in the dts file.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bf0d9ba..f8ad259 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -118,6 +118,12 @@ static const struct of_device_id fimd_driver_dt_match[] = {
 MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
 #endif
 
+struct mie_bypass {
+	u32				enable_bypass;
+	void __iomem			*bypass_reg;
+	u32				bypass_bit_offset;
+};
+
 static inline struct fimd_driver_data *drm_fimd_get_driver_data(
 	struct platform_device *pdev)
 {
@@ -133,6 +139,41 @@ static inline struct fimd_driver_data *drm_fimd_get_driver_data(
 		platform_get_device_id(pdev)->driver_data;
 }
 
+static struct mie_bypass *parse_mie_bypass_for_fimd(struct device *dev,
+					struct device_node *mie_bypass_node)
+{
+	struct mie_bypass *bypass_data;
+	u32 phy_address;
+
+	bypass_data = devm_kzalloc(dev,	sizeof(*bypass_data), GFP_KERNEL);
+	if (!bypass_data) {
+		dev_err(dev, "memory allocation for bypass data failed\n");
+		return ERR_PTR(-ENOMEM);
+	}
+	of_property_read_u32(mie_bypass_node, "samsung,mie-bypass-enable",
+			&bypass_data->enable_bypass);
+	of_property_read_u32(mie_bypass_node, "samsung,disp1blk-cfg-reg",
+			&phy_address);
+	of_property_read_u32(mie_bypass_node, "samsung,bypass-bit-offset",
+			&bypass_data->bypass_bit_offset);
+
+	bypass_data->bypass_reg = ioremap(phy_address, SZ_4);
+	if (!bypass_data->bypass_reg) {
+		dev_err(dev, "failed to ioremap phy_address\n");
+		return ERR_PTR(-ENOMEM);
+	}
+	return bypass_data;
+}
+
+static void mie_bypass_for_fimd(struct mie_bypass *bypass_data)
+{
+	u32 reg;
+
+	reg = __raw_readl(bypass_data->bypass_reg);
+	reg |= (1 << bypass_data->bypass_bit_offset);
+	__raw_writel(reg, bypass_data->bypass_reg);
+}
+
 static bool fimd_display_is_connected(struct device *dev)
 {
 	DRM_DEBUG_KMS("%s\n", __FILE__);
@@ -906,12 +947,26 @@ static int __devinit fimd_probe(struct platform_device *pdev)
 	struct exynos_drm_fimd_pdata *pdata;
 	struct exynos_drm_panel_info *panel;
 	struct resource *res;
+	struct device_node *mie_bypass_node;
+	struct mie_bypass *bypass_data = NULL;
 	int win;
 	int ret = -EINVAL;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
 	pdata = pdev->dev.platform_data;
+	if (pdev->dev.of_node) {
+		mie_bypass_node = of_find_node_by_name(pdev->dev.of_node,
+							"mie-bypass");
+		if (mie_bypass_node) {
+			bypass_data = parse_mie_bypass_for_fimd(&pdev->dev,
+							mie_bypass_node);
+			if (IS_ERR(bypass_data))
+				return PTR_ERR(bypass_data);
+			if (bypass_data->enable_bypass)
+				mie_bypass_for_fimd(bypass_data);
+		}
+	}
 	if (!pdata) {
 		dev_err(dev, "no platform data specified\n");
 		return -EINVAL;
-- 
1.8.0
