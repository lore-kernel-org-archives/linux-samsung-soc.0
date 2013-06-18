From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/4] drm/exynos: add support for exynos5420 mixer
Date: Tue, 18 Jun 2013 18:19:36 +0530
Message-ID: <1371559778-9359-3-git-send-email-rahul.sharma@samsung.com>
References: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42892 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404Ab3FRM2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 08:28:22 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOL00MLD9ANUT80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Jun 2013 21:28:01 +0900 (KST)
In-reply-to: <1371559778-9359-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add support for exynos5420 mixer IP in the drm mixer driver.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |   49 +++++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/regs-mixer.h   |    7 +++++
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 2fe6d33..d51ff36 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -78,6 +78,7 @@ struct mixer_resources {
 enum mixer_version_id {
 	MXR_VER_0_0_0_16,
 	MXR_VER_16_0_33_0,
+	MXR_VER_128_0_0_184,
 };
 
 struct mixer_context {
@@ -283,17 +284,19 @@ static void mixer_cfg_scan(struct mixer_context *ctx, unsigned int height)
 	val = (ctx->interlace ? MXR_CFG_SCAN_INTERLACE :
 				MXR_CFG_SCAN_PROGRASSIVE);
 
-	/* choosing between porper HD and SD mode */
-	if (height <= 480)
-		val |= MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD;
-	else if (height <= 576)
-		val |= MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD;
-	else if (height <= 720)
-		val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
-	else if (height <= 1080)
-		val |= MXR_CFG_SCAN_HD_1080 | MXR_CFG_SCAN_HD;
-	else
-		val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
+	if (ctx->mxr_ver != MXR_VER_128_0_0_184) {
+		/* choosing between proper HD and SD mode */
+		if (height <= 480)
+			val |= MXR_CFG_SCAN_NTSC | MXR_CFG_SCAN_SD;
+		else if (height <= 576)
+			val |= MXR_CFG_SCAN_PAL | MXR_CFG_SCAN_SD;
+		else if (height <= 720)
+			val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
+		else if (height <= 1080)
+			val |= MXR_CFG_SCAN_HD_1080 | MXR_CFG_SCAN_HD;
+		else
+			val |= MXR_CFG_SCAN_HD_720 | MXR_CFG_SCAN_HD;
+	}
 
 	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_SCAN_MASK);
 }
@@ -557,6 +560,14 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 	/* setup geometry */
 	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), win_data->fb_width);
 
+	/* setup display size */
+	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
+		win == MIXER_DEFAULT_WIN) {
+		val  = MXR_MXR_RES_HEIGHT(win_data->fb_height);
+		val |= MXR_MXR_RES_WIDTH(win_data->fb_width);
+		mixer_reg_write(res, MXR_RESOLUTION, val);
+	}
+
 	val  = MXR_GRP_WH_WIDTH(win_data->crtc_width);
 	val |= MXR_GRP_WH_HEIGHT(win_data->crtc_height);
 	val |= MXR_GRP_WH_H_SCALE(x_ratio);
@@ -581,7 +592,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 	mixer_cfg_layer(ctx, win, true);
 
 	/* layer update mandatory for mixer 16.0.33.0 */
-	if (ctx->mxr_ver == MXR_VER_16_0_33_0)
+	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
+		ctx->mxr_ver == MXR_VER_128_0_0_184)
 		mixer_layer_update(ctx);
 
 	mixer_run(ctx);
@@ -816,6 +828,7 @@ static void mixer_win_disable(void *ctx, int win)
 
 static int mixer_check_mode(void *ctx, struct drm_display_mode *mode)
 {
+	struct mixer_context *mixer_ctx = ctx;
 	u32 w, h;
 
 	w = mode->hdisplay;
@@ -825,6 +838,10 @@ static int mixer_check_mode(void *ctx, struct drm_display_mode *mode)
 		mode->hdisplay, mode->vdisplay, mode->vrefresh,
 		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0);
 
+	if (mixer_ctx->mxr_ver == MXR_VER_0_0_0_16 ||
+		mixer_ctx->mxr_ver == MXR_VER_128_0_0_184)
+		return 0;
+
 	if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
 		(w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
 		(w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
@@ -1115,6 +1132,11 @@ static int vp_resources_init(struct exynos_drm_hdmi_context *ctx,
 	return 0;
 }
 
+static struct mixer_drv_data exynos5420_mxr_drv_data = {
+	.version = MXR_VER_128_0_0_184,
+	.is_vp_enabled = 0,
+};
+
 static struct mixer_drv_data exynos5250_mxr_drv_data = {
 	.version = MXR_VER_16_0_33_0,
 	.is_vp_enabled = 0,
@@ -1139,6 +1161,9 @@ static struct platform_device_id mixer_driver_types[] = {
 
 static struct of_device_id mixer_match_types[] = {
 	{
+		.compatible = "samsung,exynos5420-mixer",
+		.data	= &exynos5420_mxr_drv_data,
+	}, {
 		.compatible = "samsung,exynos5250-mixer",
 		.data	= &exynos5250_mxr_drv_data,
 	}, {
diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
index 5d8dbc0..4537026 100644
--- a/drivers/gpu/drm/exynos/regs-mixer.h
+++ b/drivers/gpu/drm/exynos/regs-mixer.h
@@ -44,6 +44,9 @@
 #define MXR_CM_COEFF_Y			0x0080
 #define MXR_CM_COEFF_CB			0x0084
 #define MXR_CM_COEFF_CR			0x0088
+#define MXR_MO				0x0304
+#define MXR_RESOLUTION			0x0310
+
 #define MXR_GRAPHIC0_BASE_S		0x2024
 #define MXR_GRAPHIC1_BASE_S		0x2044
 
@@ -119,6 +122,10 @@
 #define MXR_GRP_WH_WIDTH(x)		MXR_MASK_VAL(x, 26, 16)
 #define MXR_GRP_WH_HEIGHT(x)		MXR_MASK_VAL(x, 10, 0)
 
+/* bits for MXR_RESOLUTION */
+#define MXR_MXR_RES_HEIGHT(x)		MXR_MASK_VAL(x, 26, 16)
+#define MXR_MXR_RES_WIDTH(x)		MXR_MASK_VAL(x, 10, 0)
+
 /* bits for MXR_GRAPHICn_SXY */
 #define MXR_GRP_SXY_SX(x)		MXR_MASK_VAL(x, 26, 16)
 #define MXR_GRP_SXY_SY(x)		MXR_MASK_VAL(x, 10, 0)
-- 
1.7.10.4
