From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/2] drm/exynos: decon: Add support for DECON-EXT
Date: Thu, 26 Feb 2015 20:54:45 +0530
Message-ID: <1424964285-27480-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1424964285-27480-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51144 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753816AbbBZPUS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Feb 2015 10:20:18 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NKD00C59X9S2WD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Feb 2015 00:20:16 +0900 (KST)
In-reply-to: <1424964285-27480-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

* Modify DECON-INT driver to support DECON-EXT.
* Add a table of porch values needed to set timing registers of DECON-EXT.
* DECON-EXT supports only H/w Triggered COMMAND mode.
* DECON-EXT supports only one DMA window(window 1), so modify
  all window management routines to support 2 windows of DECON-INT
  and 1 window of DECON-EXT.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/video/exynos7-decon.txt    |    8 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |  229 ++++++++++++++++++--
 include/video/exynos7_decon.h                      |   13 ++
 3 files changed, 230 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos7-decon.txt b/Documentation/devicetree/bindings/video/exynos7-decon.txt
index f5f9c8d..87350c0 100644
--- a/Documentation/devicetree/bindings/video/exynos7-decon.txt
+++ b/Documentation/devicetree/bindings/video/exynos7-decon.txt
@@ -2,10 +2,14 @@ Device-Tree bindings for Samsung Exynos7 SoC display controller (DECON)
 
 DECON (Display and Enhancement Controller) is the Display Controller for the
 Exynos7 series of SoCs which transfers the image data from a video memory
-buffer to an external LCD interface.
+buffer to an external LCD/HDMI interface.
+
+Exynos7 supports DECON-INT for generating video signals for LCD.
+Exynos7 supports DECON-EXT for generating video signals for HDMI.
 
 Required properties:
-- compatible: value should be "samsung,exynos7-decon";
+- compatible: value should be "samsung,exynos7-decon-int" for DECON-INT;
+	      value should be "samsung,exynos7-decon-ext" for DECON-EXT;
 
 - reg: physical base address and length of the DECON registers set.
 
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 63f02e2..9e2d083 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -41,6 +41,28 @@
 
 #define WINDOWS_NR	2
 
+#define DECON_EXT_CH_MAPPING	0x432105
+
+enum decon_type {
+	DECON_INT,
+	DECON_EXT,
+} decon_type;
+
+struct decon_driver_data {
+	enum decon_type			decon_type;
+	unsigned int			nr_windows;
+};
+
+static struct decon_driver_data exynos7_decon_int_driver_data = {
+	.decon_type = DECON_INT,
+	.nr_windows = 2,
+};
+
+static struct decon_driver_data exynos7_decon_ext_driver_data = {
+	.decon_type = DECON_EXT,
+	.nr_windows = 1,
+};
+
 struct decon_win_data {
 	unsigned int		ovl_x;
 	unsigned int		ovl_y;
@@ -76,15 +98,28 @@ struct decon_context {
 	atomic_t			wait_vsync_event;
 
 	struct exynos_drm_panel_info panel;
+	struct decon_driver_data *driver_data;
 	struct exynos_drm_display *display;
 };
 
 static const struct of_device_id decon_driver_dt_match[] = {
-	{.compatible = "samsung,exynos7-decon"},
+	{ .compatible = "samsung,exynos7-decon-int",
+	  .data = &exynos7_decon_int_driver_data },
+	{ .compatible = "samsung,exynos7-decon-ext",
+	  .data = &exynos7_decon_ext_driver_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, decon_driver_dt_match);
 
+static inline struct decon_driver_data *drm_decon_get_driver_data(
+	struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+			of_match_device(decon_driver_dt_match, &pdev->dev);
+
+	return (struct decon_driver_data *)of_id->data;
+}
+
 static void decon_wait_for_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
@@ -106,13 +141,20 @@ static void decon_wait_for_vblank(struct exynos_drm_crtc *crtc)
 
 static void decon_clear_channel(struct decon_context *ctx)
 {
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	int win, ch_enabled = 0;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
 	/* Check if any channel is enabled. */
-	for (win = 0; win < WINDOWS_NR; win++) {
-		u32 val = readl(ctx->regs + WINCON(win));
+	for (win = 0; win < drv_data->nr_windows; win++) {
+		u32 val;
+		/* DECON EXT sw-hw window mapping */
+		if (drv_data->decon_type == DECON_EXT) {
+			if (win == 0)
+				win = 1;
+		}
+		val = readl(ctx->regs + WINCON(win));
 
 		if (val & WINCONx_ENWIN) {
 			val &= ~WINCONx_ENWIN;
@@ -187,10 +229,74 @@ static bool decon_mode_fixup(struct exynos_drm_crtc *crtc,
 	return true;
 }
 
+struct decon_ext_videomode {
+	u32 vfront_porch;
+	u32 vback_porch;
+	u32 hfront_porch;
+	u32 hback_porch;
+	u32 vsync_len;
+	u32 hsync_len;
+	u32 hactive;
+	u32 vactive;
+	u32 refresh_rate;
+};
+
+enum DECON_EXT_MODES {
+	MODE_720_480_60,
+	MODE_720_576_50,
+	MODE_1280_720_60,
+	MODE_1280_720_50,
+	MODE_1920_1080_60,
+	MODE_1920_1080_50,
+	MODE_1920_1080_30,
+	MODE_1920_1080_25,
+	MODE_1920_1080_24,
+	MODE_3840_2160_30,
+	MODE_3840_2160_25,
+	MODE_3840_2160_24,
+	MODE_4096_2160_24,
+};
+
+static struct decon_ext_videomode decon_ext_porchs[] = {
+	/*vfp vbp hfp hbp  vsa hsa xres yres fps */
+	{1, 43, 10, 92,   1, 36,  720, 480,   60},
+	{1, 47, 10, 92,   1, 42,  720, 576,   50},
+	{1, 28, 10, 192,  1, 168, 1280, 720,  60},
+	{1, 28, 10, 92,   1, 598, 1280, 720,  50},
+	{1, 43, 10, 92,   1, 178, 1920, 1080, 60},
+	{1, 43, 10, 92,   1, 618, 1920, 1080, 50},
+	{1, 43, 10, 92,   1, 178, 1920, 1080, 30},
+	{1, 43, 10, 92,   1, 618, 1920, 1080, 25},
+	{1, 43, 10, 92,   1, 728, 1920, 1080, 24},
+	{1, 88, 10, 458,  1, 92,  3840, 2160, 30},
+	{1, 88, 10, 1338, 1, 92,  3840, 2160, 25},
+	{1, 88, 10, 1558, 1, 92,  3840, 2160, 24},
+	{1, 88, 10, 1302, 1, 92,  4096, 2160, 24},
+};
+
+static void decon_ext_set_timing(struct drm_display_mode *mode,
+				struct decon_ext_videomode *ext_mode)
+{
+	mode->crtc_hdisplay = ext_mode->hactive;
+	mode->crtc_hsync_start = ext_mode->hactive + ext_mode->hfront_porch;
+	mode->crtc_hsync_end = ext_mode->hactive + ext_mode->hfront_porch
+						+ ext_mode->hsync_len;
+	mode->crtc_htotal = ext_mode->hactive + ext_mode->hfront_porch
+			+ ext_mode->hsync_len + ext_mode->hback_porch;
+	mode->crtc_vdisplay = ext_mode->vactive;
+	mode->crtc_vsync_start = ext_mode->vactive + ext_mode->vfront_porch;
+	mode->crtc_vsync_end = ext_mode->vactive + ext_mode->vfront_porch
+						+ ext_mode->vsync_len;
+	mode->crtc_vtotal = ext_mode->vactive + ext_mode->vfront_porch
+				+ ext_mode->vsync_len + ext_mode->vback_porch;
+}
+
 static void decon_commit(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	struct drm_display_mode *mode = &crtc->base.mode;
+	struct decon_ext_videomode *my_mode;
 	u32 val, clkdiv;
 
 	if (ctx->suspended)
@@ -200,6 +306,38 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	if (mode->htotal == 0 || mode->vtotal == 0)
 		return;
 
+	if (drv_data->decon_type == DECON_EXT) {
+		if ((mode->hdisplay == 720) && (mode->vdisplay == 480) &&
+						(mode->vrefresh == 60))
+			my_mode = &decon_ext_porchs[MODE_720_480_60];
+		if ((mode->hdisplay == 720) && (mode->vdisplay == 576) &&
+						(mode->vrefresh == 50))
+			my_mode = &decon_ext_porchs[MODE_720_576_50];
+		if ((mode->hdisplay == 1280) && (mode->vdisplay == 720) &&
+						(mode->vrefresh == 60))
+			my_mode = &decon_ext_porchs[MODE_1280_720_60];
+		if ((mode->hdisplay == 1280) && (mode->vdisplay == 720) &&
+						(mode->vrefresh == 50))
+			my_mode = &decon_ext_porchs[MODE_1280_720_50];
+		if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080) &&
+						(mode->vrefresh == 60))
+			my_mode = &decon_ext_porchs[MODE_1920_1080_60];
+		if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080) &&
+						(mode->vrefresh == 50))
+			my_mode = &decon_ext_porchs[MODE_1920_1080_50];
+		if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080) &&
+						(mode->vrefresh == 30))
+			my_mode = &decon_ext_porchs[MODE_1920_1080_30];
+		if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080) &&
+						(mode->vrefresh == 25))
+			my_mode = &decon_ext_porchs[MODE_1920_1080_25];
+		if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080) &&
+						(mode->vrefresh == 24))
+			my_mode = &decon_ext_porchs[MODE_1920_1080_24];
+
+		decon_ext_set_timing(mode, my_mode);
+	}
+
 	if (!ctx->i80_if) {
 		int vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
 	      /* setup vertical timing values. */
@@ -301,6 +439,7 @@ static void decon_win_mode_set(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct decon_win_data *win_data;
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	int win, padding;
 
 	if (!plane) {
@@ -312,12 +451,18 @@ static void decon_win_mode_set(struct exynos_drm_crtc *crtc,
 	if (win == DEFAULT_ZPOS)
 		win = ctx->default_win;
 
-	if (win < 0 || win >= WINDOWS_NR)
+	if (win < 0 || win >= drv_data->nr_windows)
 		return;
 
 
 	win_data = &ctx->win_data[win];
 
+	/* DECON EXT sw-hw window mapping */
+	if (drv_data->decon_type == DECON_EXT) {
+		if (win == 0)
+			win = 1;
+	}
+
 	padding = (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
 	win_data->offset_x = plane->fb_x;
 	win_data->offset_y = plane->fb_y;
@@ -340,9 +485,9 @@ static void decon_win_mode_set(struct exynos_drm_crtc *crtc,
 			plane->fb_width, plane->crtc_width);
 }
 
-static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
+static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
+					struct decon_win_data *win_data)
 {
-	struct decon_win_data *win_data = &ctx->win_data[win];
 	unsigned long val;
 
 	val = readl(ctx->regs + WINCON(win));
@@ -454,6 +599,7 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_display_mode *mode = &crtc->base.mode;
 	struct decon_win_data *win_data;
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	int win = zpos;
 	unsigned long val, alpha;
 	unsigned int last_x;
@@ -465,11 +611,17 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	if (win == DEFAULT_ZPOS)
 		win = ctx->default_win;
 
-	if (win < 0 || win >= WINDOWS_NR)
+	if (win < 0 || win >= drv_data->nr_windows)
 		return;
 
 	win_data = &ctx->win_data[win];
 
+	/* DECON EXT sw-hw window mapping */
+	if (drv_data->decon_type == DECON_EXT) {
+		if (win == 0)
+			win = 1;
+	}
+
 	/* If suspended, enable this on resume */
 	if (ctx->suspended) {
 		win_data->resume = true;
@@ -546,7 +698,7 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 
 	writel(alpha, ctx->regs + VIDOSD_D(win));
 
-	decon_win_set_pixfmt(ctx, win);
+	decon_win_set_pixfmt(ctx, win, win_data);
 
 	/* hardware window 0 doesn't support color key. */
 	if (win != 0)
@@ -572,17 +724,24 @@ static void decon_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct decon_win_data *win_data;
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	int win = zpos;
 	u32 val;
 
 	if (win == DEFAULT_ZPOS)
 		win = ctx->default_win;
 
-	if (win < 0 || win >= WINDOWS_NR)
+	if (win < 0 || win >= drv_data->nr_windows)
 		return;
 
 	win_data = &ctx->win_data[win];
 
+	/* DECON EXT sw-hw window mapping */
+	if (drv_data->decon_type == DECON_EXT) {
+		if (win == 0)
+			win = 1;
+	}
+
 	if (ctx->suspended) {
 		/* do not resume this window*/
 		win_data->resume = false;
@@ -609,10 +768,11 @@ static void decon_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 
 static void decon_window_suspend(struct decon_context *ctx)
 {
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	struct decon_win_data *win_data;
 	int i;
 
-	for (i = 0; i < WINDOWS_NR; i++) {
+	for (i = 0; i < drv_data->nr_windows; i++) {
 		win_data = &ctx->win_data[i];
 		win_data->resume = win_data->enabled;
 		if (win_data->enabled)
@@ -622,10 +782,11 @@ static void decon_window_suspend(struct decon_context *ctx)
 
 static void decon_window_resume(struct decon_context *ctx)
 {
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	struct decon_win_data *win_data;
 	int i;
 
-	for (i = 0; i < WINDOWS_NR; i++) {
+	for (i = 0; i < drv_data->nr_windows; i++) {
 		win_data = &ctx->win_data[i];
 		win_data->enabled = win_data->resume;
 		win_data->resume = false;
@@ -634,10 +795,11 @@ static void decon_window_resume(struct decon_context *ctx)
 
 static void decon_apply(struct decon_context *ctx)
 {
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	struct decon_win_data *win_data;
 	int i;
 
-	for (i = 0; i < WINDOWS_NR; i++) {
+	for (i = 0; i < drv_data->nr_windows; i++) {
 		win_data = &ctx->win_data[i];
 		if (win_data->enabled)
 			decon_win_commit(ctx->crtc, i);
@@ -650,6 +812,7 @@ static void decon_apply(struct decon_context *ctx)
 
 static void decon_init(struct decon_context *ctx)
 {
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	u32 val;
 
 	writel(VIDCON0_SWRESET, ctx->regs + VIDCON0);
@@ -657,6 +820,14 @@ static void decon_init(struct decon_context *ctx)
 	val = VIDOUTCON0_DISP_IF_0_ON;
 	if (!ctx->i80_if)
 		val |= VIDOUTCON0_RGBIF;
+
+	if (drv_data->decon_type == DECON_EXT) {
+		writel(TRIGCON_HWTRIG_AUTO_MASK |
+			TRIGCON_HWTRIGMASK_DISPIF0 |
+			TRIGCON_HWTRIGEN_I80_RGB, ctx->regs + TRIGCON);
+		val |= VIDOUTCON0_TV_MODE | VIDOUTCON0_I80IF;
+	}
+
 	writel(val, ctx->regs + VIDOUTCON0);
 
 	writel(VCLKCON0_CLKVALUP | VCLKCON0_VCLKFREE, ctx->regs + VCLKCON0);
@@ -667,6 +838,7 @@ static void decon_init(struct decon_context *ctx)
 
 static int decon_poweron(struct decon_context *ctx)
 {
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	int ret;
 
 	if (!ctx->suspended)
@@ -702,6 +874,9 @@ static int decon_poweron(struct decon_context *ctx)
 
 	decon_init(ctx);
 
+	if (drv_data->decon_type == DECON_EXT)
+		writel(DECON_EXT_CH_MAPPING, ctx->regs + WINCHMAP0);
+
 	/* if vblank was enabled status, enable it again. */
 	if (test_and_clear_bit(0, &ctx->irq_flags)) {
 		ret = decon_enable_vblank(ctx->crtc);
@@ -817,6 +992,7 @@ out:
 static int decon_bind(struct device *dev, struct device *master, void *data)
 {
 	struct decon_context *ctx = dev_get_drvdata(dev);
+	struct decon_driver_data *drv_data = ctx->driver_data;
 	struct drm_device *drm_dev = data;
 	int ret;
 
@@ -826,16 +1002,23 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
+	if (drv_data->decon_type == DECON_INT)
+		ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
 					   EXYNOS_DISPLAY_TYPE_LCD,
 					   &decon_crtc_ops, ctx);
+	else
+		ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
+					   EXYNOS_DISPLAY_TYPE_HDMI,
+					   &decon_crtc_ops, ctx);
+
 	if (IS_ERR(ctx->crtc)) {
 		decon_ctx_remove(ctx);
 		return PTR_ERR(ctx->crtc);
 	}
 
-	if (ctx->display)
-		exynos_drm_create_enc_conn(drm_dev, ctx->display);
+	if (drv_data->decon_type == DECON_INT)
+		if (ctx->display)
+			exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
 	return 0;
 
@@ -848,8 +1031,9 @@ static void decon_unbind(struct device *dev, struct device *master,
 
 	decon_dpms(ctx->crtc, DRM_MODE_DPMS_OFF);
 
-	if (ctx->display)
-		exynos_dpi_remove(ctx->display);
+	if (ctx->driver_data->decon_type == DECON_INT)
+		if (ctx->display)
+			exynos_dpi_remove(ctx->display);
 
 	decon_ctx_remove(ctx);
 }
@@ -862,11 +1046,14 @@ static const struct component_ops decon_component_ops = {
 static int decon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct decon_driver_data *drv_data;
 	struct decon_context *ctx;
 	struct device_node *i80_if_timings;
 	struct resource *res;
 	int ret;
 
+	drv_data = drm_decon_get_driver_data(pdev);
+
 	if (!dev->of_node)
 		return -ENODEV;
 
@@ -874,11 +1061,17 @@ static int decon_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
+	if (drv_data->decon_type == DECON_INT)
+		ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
 					EXYNOS_DISPLAY_TYPE_LCD);
+	else
+		ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
+					EXYNOS_DISPLAY_TYPE_HDMI);
+
 	if (ret)
 		return ret;
 
+	ctx->driver_data = drv_data;
 	ctx->dev = dev;
 	ctx->suspended = true;
 
diff --git a/include/video/exynos7_decon.h b/include/video/exynos7_decon.h
index a62b11b..d02320b 100644
--- a/include/video/exynos7_decon.h
+++ b/include/video/exynos7_decon.h
@@ -20,6 +20,7 @@
 /* VIDOUTCON0 */
 #define VIDOUTCON0				0x4
 
+#define VIDOUTCON0_TV_MODE			(0x1 << 26)
 #define VIDOUTCON0_DUAL_MASK			(0x3 << 24)
 #define VIDOUTCON0_DUAL_ON			(0x3 << 24)
 #define VIDOUTCON0_DISP_IF_1_ON			(0x2 << 24)
@@ -52,6 +53,9 @@
 
 #define SHADOWCON_WINx_PROTECT(_win)		(1 << (10 + (_win)))
 
+/* WINCHMAP0 */
+#define WINCHMAP0				0x40
+
 /* WINCONx */
 #define WINCON(_win)				(0x50 + ((_win) * 4))
 
@@ -328,6 +332,15 @@
 /* LINECNT OP THRSHOLD*/
 #define LINECNT_OP_THRESHOLD			0x630
 
+/* TRIGCON */
+#define TRIGCON					0x06B0
+#define TRIGCON_HWTRIG_AUTO_MASK		(1 << 6)
+#define TRIGCON_HWTRIGMASK_DISPIF1		(1 << 5)
+#define TRIGCON_HWTRIGMASK_DISPIF0		(1 << 4)
+#define TRIGCON_HWTRIGEN_I80_RGB		(1 << 3)
+#define TRIGCON_SWTRIGCMD_I80_RGB		(1 << 1)
+#define TRIGCON_SWTRIGEN_I80_RGB		(1 << 0)
+
 /* CRCCTRL */
 #define CRCCTRL					0x6C8
 #define CRCCTRL_CRCCLKEN			(0x1 << 2)
-- 
1.7.9.5
