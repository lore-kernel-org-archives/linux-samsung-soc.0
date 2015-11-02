From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/7] drm/exynos/hdmi: code cleanup
Date: Mon, 02 Nov 2015 14:16:42 +0100
Message-ID: <1446470205-15606-5-git-send-email-a.hajda@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32219 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532AbbKBNSC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 08:18:02 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX600ED2VLZIV90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Nov 2015 13:17:59 +0000 (GMT)
In-reply-to: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The patch performs following clean-ups:
- remove unnecessary white spaces,
- remove obvious comments,
- fix tabulations,
- remove NULL initializators,
- re-order driver data.

The patch does not change driver's behavior.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 79 ++++++++++++------------------------
 1 file changed, 26 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5ff68db..13eea02 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -7,9 +7,9 @@
  *
  * Based on drivers/media/video/s5p-tv/hdmi_drv.c
  *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
  * option) any later version.
  *
  */
@@ -49,14 +49,16 @@
 
 /* AVI header and aspect ratio */
 #define HDMI_AVI_VERSION		0x02
-#define HDMI_AVI_LENGTH		0x0D
+#define HDMI_AVI_LENGTH			0x0d
 
 /* AUI header info */
-#define HDMI_AUI_VERSION	0x01
-#define HDMI_AUI_LENGTH	0x0A
-#define AVI_SAME_AS_PIC_ASPECT_RATIO 0x8
-#define AVI_4_3_CENTER_RATIO	0x9
-#define AVI_16_9_CENTER_RATIO	0xa
+#define HDMI_AUI_VERSION		0x01
+#define HDMI_AUI_LENGTH			0x0a
+
+/* AVI active format aspect ratio */
+#define AVI_SAME_AS_PIC_ASPECT_RATIO	0x08
+#define AVI_4_3_CENTER_RATIO		0x09
+#define AVI_16_9_CENTER_RATIO		0x0a
 
 enum hdmi_type {
 	HDMI_TYPE13,
@@ -154,7 +156,6 @@ static inline struct hdmi_context *connector_to_hdmi(struct drm_connector *c)
 	return container_of(c, struct hdmi_context, connector);
 }
 
-/* list of phy config settings */
 static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	{
 		.pixel_clock = 27000000,
@@ -523,26 +524,24 @@ static const char * const hdmi_clk_muxes4[] = {
 	"sclk_pixel", "sclk_hdmiphy", "mout_hdmi"
 };
 
-static const struct hdmi_driver_data exynos5420_hdmi_driver_data = {
-	.type		= HDMI_TYPE14,
-	.is_apb_phy	= 1,
-	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_5420_configs),
+static const struct hdmi_driver_data exynos4210_hdmi_driver_data = {
+	.type		= HDMI_TYPE13,
+	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_v13_configs),
 	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
 static const struct hdmi_driver_data exynos4212_hdmi_driver_data = {
 	.type		= HDMI_TYPE14,
-	.is_apb_phy	= 0,
 	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_v14_configs),
 	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
-static const struct hdmi_driver_data exynos4210_hdmi_driver_data = {
-	.type		= HDMI_TYPE13,
-	.is_apb_phy	= 0,
-	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_v13_configs),
+static const struct hdmi_driver_data exynos5420_hdmi_driver_data = {
+	.type		= HDMI_TYPE14,
+	.is_apb_phy	= 1,
+	.phy_confs	= INIT_ARRAY_SPEC(hdmiphy_5420_configs),
 	.clk_gates	= INIT_ARRAY_SPEC(hdmi_clk_gates4),
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
@@ -1154,13 +1153,11 @@ static bool hdmi_mode_fixup(struct drm_encoder *encoder,
 
 	mode_ok = hdmi_mode_valid(connector, adjusted_mode);
 
-	/* just return if user desired mode exists. */
 	if (mode_ok == MODE_OK)
 		return true;
 
 	/*
-	 * otherwise, find the most suitable mode among modes and change it
-	 * to adjusted_mode.
+	 * Find the most suitable mode and copy it to adjusted_mode.
 	 */
 	list_for_each_entry(m, &connector->modes, head) {
 		mode_ok = hdmi_mode_valid(connector, m);
@@ -1205,15 +1202,15 @@ static void hdmi_audio_init(struct hdmi_context *hdata)
 	switch (bits_per_sample) {
 	case 20:
 		data_num = 2;
-		bit_ch  = 1;
+		bit_ch = 1;
 		break;
 	case 24:
 		data_num = 3;
-		bit_ch  = 1;
+		bit_ch = 1;
 		break;
 	default:
 		data_num = 1;
-		bit_ch  = 0;
+		bit_ch = 0;
 		break;
 	}
 
@@ -1306,13 +1303,12 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
 	/* choose HDMI mode */
 	hdmi_reg_writemask(hdata, HDMI_MODE_SEL,
 		HDMI_MODE_HDMI_EN, HDMI_MODE_MASK);
-	/* Apply Video preable and Guard band in HDMI mode only */
+	/* apply video pre-amble and guard band in HDMI mode only */
 	hdmi_reg_writeb(hdata, HDMI_CON_2, 0);
 	/* disable bluescreen */
 	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_BLUE_SCR_EN);
 
 	if (hdata->dvi_mode) {
-		/* choose DVI mode */
 		hdmi_reg_writemask(hdata, HDMI_MODE_SEL,
 				HDMI_MODE_DVI_EN, HDMI_MODE_MASK);
 		hdmi_reg_writeb(hdata, HDMI_CON_2,
@@ -1384,7 +1380,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 	val = (m->hsync_start - m->hdisplay - 2);
 	val |= ((m->hsync_end - m->hdisplay - 2) << 10);
-	val |= ((m->flags & DRM_MODE_FLAG_NHSYNC)  ? 1 : 0)<<20;
+	val |= ((m->flags & DRM_MODE_FLAG_NHSYNC) ? 1 : 0)<<20;
 	hdmi_reg_writev(hdata, HDMI_V13_H_SYNC_GEN_0, 3, val);
 
 	/*
@@ -1395,7 +1391,6 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 	/* Following values & calculations differ for different type of modes */
 	if (m->flags & DRM_MODE_FLAG_INTERLACE) {
-		/* Interlaced Mode */
 		val = ((m->vsync_end - m->vdisplay) / 2);
 		val |= ((m->vsync_start - m->vdisplay) / 2) << 12;
 		hdmi_reg_writev(hdata, HDMI_V13_V_SYNC_GEN_1_0, 3, val);
@@ -1424,8 +1419,6 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST2_L, 2, 0x249);
 	} else {
-		/* Progressive Mode */
-
 		val = m->vtotal;
 		val |= (m->vtotal - m->vdisplay) << 11;
 		hdmi_reg_writev(hdata, HDMI_V13_V_BLANK_0, 3, val);
@@ -1444,7 +1437,6 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST2_L, 2, 0x248);
 	}
 
-	/* Timing generator registers */
 	hdmi_reg_writev(hdata, HDMI_TG_H_FSZ_L, 2, m->htotal);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
@@ -1466,7 +1458,7 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	hdmi_reg_writev(hdata, HDMI_V_LINE_0, 2, m->vtotal);
 	hdmi_reg_writev(hdata, HDMI_H_LINE_0, 2, m->htotal);
 	hdmi_reg_writev(hdata, HDMI_HSYNC_POL, 1,
-			(m->flags & DRM_MODE_FLAG_NHSYNC)  ? 1 : 0);
+			(m->flags & DRM_MODE_FLAG_NHSYNC) ? 1 : 0);
 	hdmi_reg_writev(hdata, HDMI_VSYNC_POL, 1,
 			(m->flags & DRM_MODE_FLAG_NVSYNC) ? 1 : 0);
 	hdmi_reg_writev(hdata, HDMI_INT_PRO_MODE, 1,
@@ -1480,7 +1472,6 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 
 	/* Following values & calculations differ for different type of modes */
 	if (m->flags & DRM_MODE_FLAG_INTERLACE) {
-		/* Interlaced Mode */
 		hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_BEF_2_0, 2,
 			(m->vsync_end - m->vdisplay) / 2);
 		hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_BEF_1_0, 2,
@@ -1513,7 +1504,6 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST3_L, 2, 0x0);
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST4_L, 2, 0x0);
 	} else {
-		/* Progressive Mode */
 		hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_BEF_2_0, 2,
 			m->vsync_end - m->vdisplay);
 		hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_BEF_1_0, 2,
@@ -1538,7 +1528,6 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 		hdmi_reg_writev(hdata, HDMI_TG_FIELD_BOT_HDMI_L, 2, 0x233);
 	}
 
-	/* Following values & calculations are same irrespective of mode type */
 	hdmi_reg_writev(hdata, HDMI_H_SYNC_START_0, 2,
 			m->hsync_start - m->hdisplay - 2);
 	hdmi_reg_writev(hdata, HDMI_H_SYNC_END_0, 2,
@@ -1562,7 +1551,6 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_AFT_PXL_5_0, 2, 0xffff);
 	hdmi_reg_writev(hdata, HDMI_V_SYNC_LINE_AFT_PXL_6_0, 2, 0xffff);
 
-	/* Timing generator registers */
 	hdmi_reg_writev(hdata, HDMI_TG_H_FSZ_L, 2, m->htotal);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
@@ -1582,10 +1570,7 @@ static void hdmi_mode_apply(struct hdmi_context *hdata)
 		hdmi_v14_mode_apply(hdata);
 
 	hdmiphy_wait_for_pll(hdata);
-
 	hdmi_clk_set_parents(hdata, true);
-
-	/* enable HDMI and timing generator */
 	hdmi_start(hdata, true);
 }
 
@@ -1593,10 +1578,9 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 {
 	hdmi_clk_set_parents(hdata, false);
 
-	/* reset hdmiphy */
 	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, ~0, HDMI_PHY_SW_RSTOUT);
 	usleep_range(10000, 12000);
-	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT,  0, HDMI_PHY_SW_RSTOUT);
+	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, 0, HDMI_PHY_SW_RSTOUT);
 	usleep_range(10000, 12000);
 }
 
@@ -1605,7 +1589,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	int ret;
 	int i;
 
-	/* pixel clock */
 	i = hdmi_find_phy_conf(hdata, hdata->current_mode.clock * 1000);
 	if (i < 0) {
 		DRM_ERROR("failed to find hdmiphy conf\n");
@@ -1626,16 +1609,11 @@ static void hdmi_conf_apply(struct hdmi_context *hdata)
 {
 	hdmiphy_conf_reset(hdata);
 	hdmiphy_conf_apply(hdata);
-
 	hdmi_start(hdata, false);
 	hdmi_conf_init(hdata);
-
 	hdmi_audio_init(hdata);
-
-	/* setting core registers */
 	hdmi_mode_apply(hdata);
 	hdmi_audio_control(hdata, true);
-
 	hdmi_regs_dump(hdata, "start");
 }
 
@@ -1669,7 +1647,6 @@ static void hdmi_enable(struct drm_encoder *encoder)
 	if (regulator_bulk_enable(ARRAY_SIZE(supply), hdata->regul_bulk))
 		DRM_DEBUG_KMS("failed to enable regulator bulk\n");
 
-	/* set pmu hdmiphy control bit to enable hdmiphy */
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 1);
 
@@ -1701,14 +1678,12 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	if (funcs && funcs->disable)
 		(*funcs->disable)(crtc);
 
-	/* HDMI System Disable */
 	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
 
 	cancel_delayed_work(&hdata->hotplug_work);
 
 	hdmi_clk_disable_gates(hdata);
 
-	/* reset pmu hdmiphy control bit to disable hdmiphy */
 	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
 			PMU_HDMI_PHY_ENABLE_BIT, 0);
 
@@ -1967,7 +1942,6 @@ static int hdmi_probe(struct platform_device *pdev)
 	if (ddc_node)
 		goto out_get_ddc_adpt;
 
-	/* DDC i2c driver */
 	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
 	if (!ddc_node) {
 		DRM_ERROR("Failed to find ddc node in device tree\n");
@@ -1985,7 +1959,6 @@ out_get_ddc_adpt:
 	if (phy_node)
 		goto out_get_phy_port;
 
-	/* hdmiphy i2c driver */
 	phy_node = of_parse_phandle(dev->of_node, "phy", 0);
 	if (!phy_node) {
 		DRM_ERROR("Failed to find hdmiphy node in device tree\n");
-- 
1.9.1
