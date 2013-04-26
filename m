From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2] drm/exynos: hdmi: use drm_display_mode to check the
 supported modes
Date: Fri, 26 Apr 2013 19:33:58 +0530
Message-ID: <1366985038-2801-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46704 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754346Ab3DZNj1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 09:39:27 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MLV00MC679JLXK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Apr 2013 22:39:26 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Exynos hdmi driver is using drm_display_mode for setting timing values
for a supported resolution. Conversion to fb_videomode and then comparing
with the mixer/hdmi/phy limits is not required. Instead, drm_display_mode
fields cane be directly compared.

v2:
1) Removed convert_to_video_timing().
2) Corrected DRM_DEBUG_KMS to print the resolution properly.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_connector.c |   36 +------------------------
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h      |    6 ++---
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   15 +++++------
 drivers/gpu/drm/exynos/exynos_mixer.c         |   13 ++++-----
 4 files changed, 18 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c b/drivers/gpu/drm/exynos/exynos_drm_connector.c
index 8bcc13a..7259fff 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_connector.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c
@@ -58,37 +58,6 @@ convert_to_display_mode(struct drm_display_mode *mode,
 		mode->flags |= DRM_MODE_FLAG_DBLSCAN;
 }
 
-/* convert drm_display_mode to exynos_video_timings */
-static inline void
-convert_to_video_timing(struct fb_videomode *timing,
-			struct drm_display_mode *mode)
-{
-	DRM_DEBUG_KMS("%s\n", __FILE__);
-
-	memset(timing, 0, sizeof(*timing));
-
-	timing->pixclock = mode->clock * 1000;
-	timing->refresh = drm_mode_vrefresh(mode);
-
-	timing->xres = mode->hdisplay;
-	timing->right_margin = mode->hsync_start - mode->hdisplay;
-	timing->hsync_len = mode->hsync_end - mode->hsync_start;
-	timing->left_margin = mode->htotal - mode->hsync_end;
-
-	timing->yres = mode->vdisplay;
-	timing->lower_margin = mode->vsync_start - mode->vdisplay;
-	timing->vsync_len = mode->vsync_end - mode->vsync_start;
-	timing->upper_margin = mode->vtotal - mode->vsync_end;
-
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		timing->vmode = FB_VMODE_INTERLACED;
-	else
-		timing->vmode = FB_VMODE_NONINTERLACED;
-
-	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
-		timing->vmode |= FB_VMODE_DOUBLE;
-}
-
 static int exynos_drm_connector_get_modes(struct drm_connector *connector)
 {
 	struct exynos_drm_connector *exynos_connector =
@@ -168,15 +137,12 @@ static int exynos_drm_connector_mode_valid(struct drm_connector *connector,
 					to_exynos_connector(connector);
 	struct exynos_drm_manager *manager = exynos_connector->manager;
 	struct exynos_drm_display_ops *display_ops = manager->display_ops;
-	struct fb_videomode timing;
 	int ret = MODE_BAD;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
-	convert_to_video_timing(&timing, mode);
-
 	if (display_ops && display_ops->check_timing)
-		if (!display_ops->check_timing(manager->dev, (void *)&timing))
+		if (!display_ops->check_timing(manager->dev, (void *)mode))
 			ret = MODE_OK;
 
 	return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
index 6b70944..fd2ff9f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
@@ -32,11 +32,11 @@ struct exynos_hdmi_ops {
 	bool (*is_connected)(void *ctx);
 	struct edid *(*get_edid)(void *ctx,
 			struct drm_connector *connector);
-	int (*check_timing)(void *ctx, struct fb_videomode *timing);
+	int (*check_timing)(void *ctx, struct drm_display_mode *mode);
 	int (*power_on)(void *ctx, int mode);
 
 	/* manager */
-	void (*mode_set)(void *ctx, void *mode);
+	void (*mode_set)(void *ctx, struct drm_display_mode *mode);
 	void (*get_max_resol)(void *ctx, unsigned int *width,
 				unsigned int *height);
 	void (*commit)(void *ctx);
@@ -57,7 +57,7 @@ struct exynos_mixer_ops {
 	void (*win_disable)(void *ctx, int zpos);
 
 	/* display */
-	int (*check_timing)(void *ctx, struct fb_videomode *timing);
+	int (*check_timing)(void *ctx, struct drm_display_mode *mode);
 };
 
 void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 93b70e9..aeca603 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -796,18 +796,17 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 	return -EINVAL;
 }
 
-static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
+static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode)
 {
 	struct hdmi_context *hdata = ctx;
 	int ret;
 
-	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
-
-	DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", timing->xres,
-			timing->yres, timing->refresh,
-			timing->vmode);
+	DRM_DEBUG_KMS("[WxH@HzI/P at Pixel Clk]: %dx%d@%d%s at %d\n",
+		mode->hdisplay, mode->vdisplay, mode->vrefresh,
+		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? "I" : "P",
+		mode->clock * 1000);
 
-	ret = hdmi_find_phy_conf(hdata, timing->pixclock);
+	ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
 	if (ret < 0)
 		return ret;
 	return 0;
@@ -1643,7 +1642,7 @@ static void hdmi_v14_mode_set(struct hdmi_context *hdata,
 	hdmi_set_reg(tg->tg_3d, 1, 0x0);
 }
 
-static void hdmi_mode_set(void *ctx, void *mode)
+static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)
 {
 	struct hdmi_context *hdata = ctx;
 	struct drm_display_mode *m = mode;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index f08e251..67c4fd8 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -818,17 +818,17 @@ static void mixer_win_disable(void *ctx, int win)
 	mixer_ctx->win_data[win].enabled = false;
 }
 
-static int mixer_check_timing(void *ctx, struct fb_videomode *timing)
+static int mixer_check_timing(void *ctx, struct drm_display_mode *mode)
 {
 	u32 w, h;
 
-	w = timing->xres;
-	h = timing->yres;
+	w = mode->hdisplay;
+	h = mode->vdisplay;
 
 	DRM_DEBUG_KMS("%s : xres=%d, yres=%d, refresh=%d, intl=%d\n",
-		__func__, timing->xres, timing->yres,
-		timing->refresh, (timing->vmode &
-		FB_VMODE_INTERLACED) ? true : false);
+		__func__, mode->hdisplay, mode->vdisplay,
+		mode->vrefresh, (mode->flags &
+		DRM_MODE_FLAG_INTERLACE) ? true : false);
 
 	if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
 		(w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
@@ -837,6 +837,7 @@ static int mixer_check_timing(void *ctx, struct fb_videomode *timing)
 
 	return -EINVAL;
 }
+
 static void mixer_wait_for_vblank(void *ctx)
 {
 	struct mixer_context *mixer_ctx = ctx;
-- 
1.7.10.4
