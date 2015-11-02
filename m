From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/7] drm/exynos/hdmi: use array specifier for HDMI-PHY
 configurations
Date: Mon, 02 Nov 2015 14:16:41 +0100
Message-ID: <1446470205-15606-4-git-send-email-a.hajda@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43755 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532AbbKBNSA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 08:18:00 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX600BB9VLXO790@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Nov 2015 13:17:58 +0000 (GMT)
In-reply-to: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

HDMI-PHY configurations are stored as array pointer and count pair,
we can re-use existing helpers to simplify their initialization.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 3b92d87..5ff68db 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -90,6 +90,16 @@ static const char * const supply[] = {
 	"vdd_pll",
 };
 
+struct hdmiphy_config {
+	int pixel_clock;
+	u8 conf[32];
+};
+
+struct hdmiphy_configs {
+	int count;
+	const struct hdmiphy_config *data;
+};
+
 struct string_array_spec {
 	int count;
 	const char * const *data;
@@ -99,9 +109,8 @@ struct string_array_spec {
 
 struct hdmi_driver_data {
 	unsigned int type;
-	const struct hdmiphy_config *phy_confs;
-	unsigned int phy_conf_count;
 	unsigned int is_apb_phy:1;
+	struct hdmiphy_configs phy_confs;
 	struct string_array_spec clk_gates;
 	/*
 	 * Array of triplets (p_off, p_on, clock), where p_off and p_on are
@@ -145,11 +154,6 @@ static inline struct hdmi_context *connector_to_hdmi(struct drm_connector *c)
 	return container_of(c, struct hdmi_context, connector);
 }
 
-struct hdmiphy_config {
-	int pixel_clock;
-	u8 conf[32];
-};
-
 /* list of phy config settings */
 static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	{
@@ -521,27 +525,24 @@ static const char * const hdmi_clk_muxes4[] = {
 
 static const struct hdmi_driver_data exynos5420_hdmi_driver_data = {
 	.type		= HDMI_TYPE14,
-	.phy_confs	= hdmiphy_5420_configs,
-	.phy_conf_count	= ARRAY_SIZE(hdmiphy_5420_configs),
 	.is_apb_phy	= 1,
+	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_5420_configs),
 	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
 static const struct hdmi_driver_data exynos4212_hdmi_driver_data = {
 	.type		= HDMI_TYPE14,
-	.phy_confs	= hdmiphy_v14_configs,
-	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v14_configs),
 	.is_apb_phy	= 0,
+	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_v14_configs),
 	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
 static const struct hdmi_driver_data exynos4210_hdmi_driver_data = {
 	.type		= HDMI_TYPE13,
-	.phy_confs	= hdmiphy_v13_configs,
-	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v13_configs),
 	.is_apb_phy	= 0,
+	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_v13_configs),
 	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
@@ -1067,10 +1068,11 @@ static int hdmi_get_modes(struct drm_connector *connector)
 
 static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 {
+	const struct hdmiphy_configs *confs = &hdata->drv_data->phy_confs;
 	int i;
 
-	for (i = 0; i < hdata->drv_data->phy_conf_count; i++)
-		if (hdata->drv_data->phy_confs[i].pixel_clock == pixel_clock)
+	for (i = 0; i < confs->count; i++)
+		if (confs->data[i].pixel_clock == pixel_clock)
 			return i;
 
 	DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
@@ -1611,7 +1613,7 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	}
 
 	ret = hdmiphy_reg_write_buf(hdata, 0,
-			hdata->drv_data->phy_confs[i].conf, 32);
+			hdata->drv_data->phy_confs.data[i].conf, 32);
 	if (ret) {
 		DRM_ERROR("failed to configure hdmiphy\n");
 		return;
-- 
1.9.1
