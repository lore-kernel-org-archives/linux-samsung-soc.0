From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/3] drm/exynos: fimd: replace struct fb_videomode with
 videomode
Date: Wed, 21 Aug 2013 16:22:01 +0200
Message-ID: <1377094923-6919-2-git-send-email-a.hajda@samsung.com>
References: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18593 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608Ab3HUOWm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 10:22:42 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRV00ITQX8B1QB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Aug 2013 15:22:40 +0100 (BST)
In-reply-to: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, t.figa@samsung.com, s.nawrocki@samsung.com

The patch replaces all occurrences of struct fb_videomode by
more accurate struct videomode. The change allows to remove
mode conversion function and simplifies clock divider calculation.
Clock configuration is moved to separate function.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_connector.c |  33 +------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 131 +++++++++++++-------------
 include/drm/exynos_drm.h                      |   3 +-
 3 files changed, 70 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c b/drivers/gpu/drm/exynos/exynos_drm_connector.c
index de7c7b2..e082efb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_connector.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c
@@ -29,35 +29,6 @@ struct exynos_drm_connector {
 	uint32_t		dpms;
 };
 
-/* convert exynos_video_timings to drm_display_mode */
-static inline void
-convert_to_display_mode(struct drm_display_mode *mode,
-			struct exynos_drm_panel_info *panel)
-{
-	struct fb_videomode *timing = &panel->timing;
-
-	mode->clock = timing->pixclock / 1000;
-	mode->vrefresh = timing->refresh;
-
-	mode->hdisplay = timing->xres;
-	mode->hsync_start = mode->hdisplay + timing->right_margin;
-	mode->hsync_end = mode->hsync_start + timing->hsync_len;
-	mode->htotal = mode->hsync_end + timing->left_margin;
-
-	mode->vdisplay = timing->yres;
-	mode->vsync_start = mode->vdisplay + timing->lower_margin;
-	mode->vsync_end = mode->vsync_start + timing->vsync_len;
-	mode->vtotal = mode->vsync_end + timing->upper_margin;
-	mode->width_mm = panel->width_mm;
-	mode->height_mm = panel->height_mm;
-
-	if (timing->vmode & FB_VMODE_INTERLACED)
-		mode->flags |= DRM_MODE_FLAG_INTERLACE;
-
-	if (timing->vmode & FB_VMODE_DOUBLE)
-		mode->flags |= DRM_MODE_FLAG_DBLSCAN;
-}
-
 static int exynos_drm_connector_get_modes(struct drm_connector *connector)
 {
 	struct exynos_drm_connector *exynos_connector =
@@ -112,7 +83,9 @@ static int exynos_drm_connector_get_modes(struct drm_connector *connector)
 			return 0;
 		}
 
-		convert_to_display_mode(mode, panel);
+		drm_display_mode_from_videomode(&panel->vm, mode);
+		mode->width_mm = panel->width_mm;
+		mode->height_mm = panel->height_mm;
 		connector->display_info.width_mm = mode->width_mm;
 		connector->display_info.height_mm = mode->height_mm;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index f8889d2..a183ea7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 
 #include <video/of_display_timing.h>
+#include <video/of_videomode.h>
 #include <video/samsung_fimd.h>
 #include <drm/exynos_drm.h>
 
@@ -36,6 +37,8 @@
  * CPU Interface.
  */
 
+#define FIMD_DEFAULT_FRAMERATE 60
+
 /* position control register for hardware window 0, 2 ~ 4.*/
 #define VIDOSD_A(win)		(VIDOSD_BASE + 0x00 + (win) * 16)
 #define VIDOSD_B(win)		(VIDOSD_BASE + 0x04 + (win) * 16)
@@ -242,7 +245,7 @@ static void fimd_commit(struct device *dev)
 {
 	struct fimd_context *ctx = get_fimd_context(dev);
 	struct exynos_drm_panel_info *panel = ctx->panel;
-	struct fb_videomode *timing = &panel->timing;
+	struct videomode *vm = &panel->vm;
 	struct fimd_driver_data *driver_data;
 	u32 val;
 
@@ -254,22 +257,22 @@ static void fimd_commit(struct device *dev)
 	writel(ctx->vidcon1, ctx->regs + driver_data->timing_base + VIDCON1);
 
 	/* setup vertical timing values. */
-	val = VIDTCON0_VBPD(timing->upper_margin - 1) |
-	       VIDTCON0_VFPD(timing->lower_margin - 1) |
-	       VIDTCON0_VSPW(timing->vsync_len - 1);
+	val = VIDTCON0_VBPD(vm->vback_porch - 1) |
+	       VIDTCON0_VFPD(vm->vfront_porch - 1) |
+	       VIDTCON0_VSPW(vm->vsync_len - 1);
 	writel(val, ctx->regs + driver_data->timing_base + VIDTCON0);
 
 	/* setup horizontal timing values.  */
-	val = VIDTCON1_HBPD(timing->left_margin - 1) |
-	       VIDTCON1_HFPD(timing->right_margin - 1) |
-	       VIDTCON1_HSPW(timing->hsync_len - 1);
+	val = VIDTCON1_HBPD(vm->hback_porch - 1) |
+	       VIDTCON1_HFPD(vm->hfront_porch - 1) |
+	       VIDTCON1_HSPW(vm->hsync_len - 1);
 	writel(val, ctx->regs + driver_data->timing_base + VIDTCON1);
 
 	/* setup horizontal and vertical display size. */
-	val = VIDTCON2_LINEVAL(timing->yres - 1) |
-	       VIDTCON2_HOZVAL(timing->xres - 1) |
-	       VIDTCON2_LINEVAL_E(timing->yres - 1) |
-	       VIDTCON2_HOZVAL_E(timing->xres - 1);
+	val = VIDTCON2_LINEVAL(vm->vactive - 1) |
+	       VIDTCON2_HOZVAL(vm->hactive - 1) |
+	       VIDTCON2_LINEVAL_E(vm->vactive - 1) |
+	       VIDTCON2_HOZVAL_E(vm->hactive - 1);
 	writel(val, ctx->regs + driver_data->timing_base + VIDTCON2);
 
 	/* setup clock source, clock divider, enable dma. */
@@ -750,45 +753,54 @@ static void fimd_subdrv_remove(struct drm_device *drm_dev, struct device *dev)
 		drm_iommu_detach_device(drm_dev, dev);
 }
 
-static int fimd_calc_clkdiv(struct fimd_context *ctx,
-			    struct fb_videomode *timing)
+static int fimd_configure_clocks(struct fimd_context *ctx, struct device *dev)
 {
-	unsigned long clk = clk_get_rate(ctx->lcd_clk);
-	u32 retrace;
-	u32 clkdiv;
-	u32 best_framerate = 0;
-	u32 framerate;
-
-	retrace = timing->left_margin + timing->hsync_len +
-				timing->right_margin + timing->xres;
-	retrace *= timing->upper_margin + timing->vsync_len +
-				timing->lower_margin + timing->yres;
-
-	/* default framerate is 60Hz */
-	if (!timing->refresh)
-		timing->refresh = 60;
-
-	clk /= retrace;
-
-	for (clkdiv = 1; clkdiv < 0x100; clkdiv++) {
-		int tmp;
-
-		/* get best framerate */
-		framerate = clk / clkdiv;
-		tmp = timing->refresh - framerate;
-		if (tmp < 0) {
-			best_framerate = framerate;
-			continue;
-		} else {
-			if (!best_framerate)
-				best_framerate = framerate;
-			else if (tmp < (best_framerate - framerate))
-				best_framerate = framerate;
-			break;
+	struct videomode *vm = &ctx->panel->vm;
+	unsigned long clk;
+
+	ctx->bus_clk = devm_clk_get(dev, "fimd");
+	if (IS_ERR(ctx->bus_clk)) {
+		dev_err(dev, "failed to get bus clock\n");
+		return PTR_ERR(ctx->bus_clk);
+	}
+
+	ctx->lcd_clk = devm_clk_get(dev, "sclk_fimd");
+	if (IS_ERR(ctx->lcd_clk)) {
+		dev_err(dev, "failed to get lcd clock\n");
+		return PTR_ERR(ctx->lcd_clk);
+	}
+
+	clk = clk_get_rate(ctx->lcd_clk);
+	if (clk == 0) {
+		dev_err(dev, "error getting sclk_fimd clock rate\n");
+		return -EINVAL;
+	}
+
+	if (vm->pixelclock == 0) {
+		unsigned long c;
+		c = vm->hactive + vm->hback_porch + vm->hfront_porch +
+		    vm->hsync_len;
+		c *= vm->vactive + vm->vback_porch + vm->vfront_porch +
+		     vm->vsync_len;
+		vm->pixelclock = c * FIMD_DEFAULT_FRAMERATE;
+		if (vm->pixelclock == 0) {
+			dev_err(dev, "incorrect display timings\n");
+			return -EINVAL;
 		}
+		dev_warn(dev, "pixel clock recalculated to %luHz (%dHz frame rate)\n",
+			 vm->pixelclock, FIMD_DEFAULT_FRAMERATE);
+	}
+	ctx->clkdiv = DIV_ROUND_UP(clk, vm->pixelclock);
+	if (ctx->clkdiv > 256) {
+		dev_warn(dev, "calculated pixel clock divider too high (%u), lowered to 256\n",
+			 ctx->clkdiv);
+		ctx->clkdiv = 256;
 	}
+	vm->pixelclock = clk / ctx->clkdiv;
+	DRM_DEBUG_KMS("pixel clock = %lu, clkdiv = %d\n", vm->pixelclock,
+		      ctx->clkdiv);
 
-	return clkdiv;
+	return 0;
 }
 
 static void fimd_clear_win(struct fimd_context *ctx, int win)
@@ -892,14 +904,15 @@ static int fimd_probe(struct platform_device *pdev)
 	int ret = -EINVAL;
 
 	if (dev->of_node) {
+		struct videomode *vm;
 		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
-		ret = of_get_fb_videomode(dev->of_node, &pdata->panel.timing,
-					OF_USE_NATIVE_MODE);
+		vm = &pdata->panel.vm;
+		ret = of_get_videomode(dev->of_node, vm, OF_USE_NATIVE_MODE);
 		if (ret) {
-			DRM_ERROR("failed: of_get_fb_videomode() : %d\n", ret);
+			DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
 			return ret;
 		}
 	} else {
@@ -920,17 +933,9 @@ static int fimd_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->bus_clk = devm_clk_get(dev, "fimd");
-	if (IS_ERR(ctx->bus_clk)) {
-		dev_err(dev, "failed to get bus clock\n");
-		return PTR_ERR(ctx->bus_clk);
-	}
-
-	ctx->lcd_clk = devm_clk_get(dev, "sclk_fimd");
-	if (IS_ERR(ctx->lcd_clk)) {
-		dev_err(dev, "failed to get lcd clock\n");
-		return PTR_ERR(ctx->lcd_clk);
-	}
+	ret = fimd_configure_clocks(ctx, dev);
+	if (ret)
+		return ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
@@ -975,12 +980,6 @@ static int fimd_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	ctx->clkdiv = fimd_calc_clkdiv(ctx, &panel->timing);
-	panel->timing.pixclock = clk_get_rate(ctx->lcd_clk) / ctx->clkdiv;
-
-	DRM_DEBUG_KMS("pixel clock = %d, clkdiv = %d\n",
-			panel->timing.pixclock, ctx->clkdiv);
-
 	for (win = 0; win < WINDOWS_NR; win++)
 		fimd_clear_win(ctx, win);
 
diff --git a/include/drm/exynos_drm.h b/include/drm/exynos_drm.h
index d6aeaf3..cb65fa1 100644
--- a/include/drm/exynos_drm.h
+++ b/include/drm/exynos_drm.h
@@ -15,6 +15,7 @@
 #define _EXYNOS_DRM_H_
 
 #include <uapi/drm/exynos_drm.h>
+#include <video/videomode.h>
 
 /**
  * A structure for lcd panel information.
@@ -24,7 +25,7 @@
  * @height_mm: physical size of lcd height.
  */
 struct exynos_drm_panel_info {
-	struct fb_videomode timing;
+	struct videomode vm;
 	u32 width_mm;
 	u32 height_mm;
 };
-- 
1.8.1.2
