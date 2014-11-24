From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 4/4] drm/exynos: remove struct exynos_drm_overlay
Date: Mon, 24 Nov 2014 16:21:06 -0200
Message-ID: <1416853266-10584-5-git-send-email-gustavo@padovan.org>
References: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:46139 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930AbaKXSVX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 13:21:23 -0500
Received: by mail-qc0-f177.google.com with SMTP id x3so7160374qcv.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2014 10:21:22 -0800 (PST)
In-Reply-To: <1416853266-10584-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

struct exynos_drm_overlay has no practical advantage nor serves as
important piece of the exynos API design. The only place it was used
was inside the struct exynos_plane which was just causing a extra
access overhead. Users had to access the overlay first and just then
get the plane information it contains.

This patch merges struct exynos_drm_overlay into struct exynos_plane.
It also renames struct exynos_plane to struct exynos_drm_plane.

The rational is to cut one step to access plane information.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.h  |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h   | 10 +++-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 44 ++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 85 ++++++++++++++-----------------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c  | 38 +++++++-------
 drivers/gpu/drm/exynos/exynos_mixer.c     | 50 +++++++++---------
 6 files changed, 112 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index e353d35..dbd4227 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -24,7 +24,7 @@ void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb);
 
 void exynos_drm_crtc_plane_mode_set(struct drm_crtc *crtc,
-			struct exynos_drm_overlay *overlay);
+			struct exynos_drm_plane *plane);
 void exynos_drm_crtc_plane_commit(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_enable(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index ffef077..ae0dce7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -25,6 +25,7 @@
 
 #define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc,\
 				drm_crtc)
+#define to_exynos_plane(x)	container_of(x, struct exynos_drm_plane, base)
 
 /* This enumerates device type. */
 enum exynos_drm_device_type {
@@ -47,6 +48,7 @@ enum exynos_drm_output_type {
 /*
  * Exynos drm common overlay structure.
  *
+ * @base: plane object
  * @fb_x: offset x on a framebuffer to be displayed.
  *	- the unit is screen coordinates.
  * @fb_y: offset y on a framebuffer to be displayed.
@@ -76,11 +78,14 @@ enum exynos_drm_output_type {
  * @local_path: in case of lcd type, local path mode on or off.
  * @transparency: transparency on or off.
  * @activated: activated or not.
+ * @enabled: enabled or not.
  *
  * this structure is common to exynos SoC and its contents would be copied
  * to hardware specific overlay info.
  */
-struct exynos_drm_overlay {
+
+struct exynos_drm_plane {
+	struct drm_plane base;
 	unsigned int fb_x;
 	unsigned int fb_y;
 	unsigned int fb_width;
@@ -107,6 +112,7 @@ struct exynos_drm_overlay {
 	bool local_path:1;
 	bool transparency:1;
 	bool activated:1;
+	bool enabled:1;
 };
 
 /*
@@ -188,7 +194,7 @@ struct exynos_drm_manager_ops {
 	void (*disable_vblank)(struct exynos_drm_manager *mgr);
 	void (*wait_for_vblank)(struct exynos_drm_manager *mgr);
 	void (*win_mode_set)(struct exynos_drm_manager *mgr,
-				struct exynos_drm_overlay *overlay);
+				struct exynos_drm_plane *plane);
 	void (*win_commit)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_enable)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_disable)(struct exynos_drm_manager *mgr, int zpos);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e5810d1..abd2ca9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -518,44 +518,44 @@ static void fimd_disable_vblank(struct exynos_drm_manager *mgr)
 }
 
 static void fimd_win_mode_set(struct exynos_drm_manager *mgr,
-			struct exynos_drm_overlay *overlay)
+			struct exynos_drm_plane *plane)
 {
 	struct fimd_context *ctx = mgr_to_fimd(mgr);
 	struct fimd_win_data *win_data;
 	int win;
 	unsigned long offset;
 
-	if (!overlay) {
-		DRM_ERROR("overlay is NULL\n");
+	if (!plane) {
+		DRM_ERROR("plane is NULL\n");
 		return;
 	}
 
-	win = overlay->zpos;
+	win = plane->zpos;
 	if (win == DEFAULT_ZPOS)
 		win = ctx->default_win;
 
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
-	offset = overlay->fb_x * (overlay->bpp >> 3);
-	offset += overlay->fb_y * overlay->pitch;
+	offset = plane->fb_x * (plane->bpp >> 3);
+	offset += plane->fb_y * plane->pitch;
 
-	DRM_DEBUG_KMS("offset = 0x%lx, pitch = %x\n", offset, overlay->pitch);
+	DRM_DEBUG_KMS("offset = 0x%lx, pitch = %x\n", offset, plane->pitch);
 
 	win_data = &ctx->win_data[win];
 
-	win_data->offset_x = overlay->crtc_x;
-	win_data->offset_y = overlay->crtc_y;
-	win_data->ovl_width = overlay->crtc_width;
-	win_data->ovl_height = overlay->crtc_height;
-	win_data->fb_width = overlay->fb_width;
-	win_data->fb_height = overlay->fb_height;
-	win_data->dma_addr = overlay->dma_addr[0] + offset;
-	win_data->bpp = overlay->bpp;
-	win_data->pixel_format = overlay->pixel_format;
-	win_data->buf_offsize = (overlay->fb_width - overlay->crtc_width) *
-				(overlay->bpp >> 3);
-	win_data->line_size = overlay->crtc_width * (overlay->bpp >> 3);
+	win_data->offset_x = plane->crtc_x;
+	win_data->offset_y = plane->crtc_y;
+	win_data->ovl_width = plane->crtc_width;
+	win_data->ovl_height = plane->crtc_height;
+	win_data->fb_width = plane->fb_width;
+	win_data->fb_height = plane->fb_height;
+	win_data->dma_addr = plane->dma_addr[0] + offset;
+	win_data->bpp = plane->bpp;
+	win_data->pixel_format = plane->pixel_format;
+	win_data->buf_offsize = (plane->fb_width - plane->crtc_width) *
+				(plane->bpp >> 3);
+	win_data->line_size = plane->crtc_width * (plane->bpp >> 3);
 
 	DRM_DEBUG_KMS("offset_x = %d, offset_y = %d\n",
 			win_data->offset_x, win_data->offset_y);
@@ -563,7 +563,7 @@ static void fimd_win_mode_set(struct exynos_drm_manager *mgr,
 			win_data->ovl_width, win_data->ovl_height);
 	DRM_DEBUG_KMS("paddr = 0x%lx\n", (unsigned long)win_data->dma_addr);
 	DRM_DEBUG_KMS("fb_width = %d, crtc_width = %d\n",
-			overlay->fb_width, overlay->crtc_width);
+			plane->fb_width, plane->crtc_width);
 }
 
 static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
@@ -623,8 +623,8 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 	/*
 	 * In case of exynos, setting dma-burst to 16Word causes permanent
 	 * tearing for very small buffers, e.g. cursor buffer. Burst Mode
-	 * switching which is based on overlay size is not recommended as
-	 * overlay size varies alot towards the end of the screen and rapid
+	 * switching which is based on plane size is not recommended as
+	 * plane size varies alot towards the end of the screen and rapid
 	 * movement causes unstable DMA which results into iommu crash/tear.
 	 */
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7d76861..843f741 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -18,14 +18,6 @@
 #include "exynos_drm_gem.h"
 #include "exynos_drm_plane.h"
 
-#define to_exynos_plane(x)	container_of(x, struct exynos_plane, base)
-
-struct exynos_plane {
-	struct drm_plane		base;
-	struct exynos_drm_overlay	overlay;
-	bool				enabled;
-};
-
 static const uint32_t formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -75,9 +67,8 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			  uint32_t src_x, uint32_t src_y,
 			  uint32_t src_w, uint32_t src_h)
 {
-	struct exynos_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
-	struct exynos_drm_overlay *overlay = &exynos_plane->overlay;
 	unsigned int actual_w;
 	unsigned int actual_h;
 	int nr;
@@ -92,10 +83,10 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			return -EFAULT;
 		}
 
-		overlay->dma_addr[i] = buffer->dma_addr;
+		exynos_plane->dma_addr[i] = buffer->dma_addr;
 
 		DRM_DEBUG_KMS("buffer: %d, dma_addr = 0x%lx\n",
-				i, (unsigned long)overlay->dma_addr[i]);
+				i, (unsigned long)exynos_plane->dma_addr[i]);
 	}
 
 	actual_w = exynos_plane_get_size(crtc_x, crtc_w, crtc->mode.hdisplay);
@@ -114,54 +105,52 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 	}
 
 	/* set drm framebuffer data. */
-	overlay->fb_x = src_x;
-	overlay->fb_y = src_y;
-	overlay->fb_width = fb->width;
-	overlay->fb_height = fb->height;
-	overlay->src_width = src_w;
-	overlay->src_height = src_h;
-	overlay->bpp = fb->bits_per_pixel;
-	overlay->pitch = fb->pitches[0];
-	overlay->pixel_format = fb->pixel_format;
-
-	/* set overlay range to be displayed. */
-	overlay->crtc_x = crtc_x;
-	overlay->crtc_y = crtc_y;
-	overlay->crtc_width = actual_w;
-	overlay->crtc_height = actual_h;
+	exynos_plane->fb_x = src_x;
+	exynos_plane->fb_y = src_y;
+	exynos_plane->fb_width = fb->width;
+	exynos_plane->fb_height = fb->height;
+	exynos_plane->src_width = src_w;
+	exynos_plane->src_height = src_h;
+	exynos_plane->bpp = fb->bits_per_pixel;
+	exynos_plane->pitch = fb->pitches[0];
+	exynos_plane->pixel_format = fb->pixel_format;
+
+	/* set plane range to be displayed. */
+	exynos_plane->crtc_x = crtc_x;
+	exynos_plane->crtc_y = crtc_y;
+	exynos_plane->crtc_width = actual_w;
+	exynos_plane->crtc_height = actual_h;
 
 	/* set drm mode data. */
-	overlay->mode_width = crtc->mode.hdisplay;
-	overlay->mode_height = crtc->mode.vdisplay;
-	overlay->refresh = crtc->mode.vrefresh;
-	overlay->scan_flag = crtc->mode.flags;
+	exynos_plane->mode_width = crtc->mode.hdisplay;
+	exynos_plane->mode_height = crtc->mode.vdisplay;
+	exynos_plane->refresh = crtc->mode.vrefresh;
+	exynos_plane->scan_flag = crtc->mode.flags;
 
-	DRM_DEBUG_KMS("overlay : offset_x/y(%d,%d), width/height(%d,%d)",
-			overlay->crtc_x, overlay->crtc_y,
-			overlay->crtc_width, overlay->crtc_height);
+	DRM_DEBUG_KMS("plane : offset_x/y(%d,%d), width/height(%d,%d)",
+			exynos_plane->crtc_x, exynos_plane->crtc_y,
+			exynos_plane->crtc_width, exynos_plane->crtc_height);
 
 	plane->crtc = crtc;
 
 	if (manager->ops->win_mode_set)
-		manager->ops->win_mode_set(manager, overlay);
+		manager->ops->win_mode_set(manager, exynos_plane);
 
 	return 0;
 }
 
 void exynos_plane_commit(struct drm_plane *plane)
 {
-	struct exynos_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_overlay *overlay = &exynos_plane->overlay;
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_manager *manager = to_exynos_crtc(plane->crtc)->manager;
 
 	if (manager->ops->win_commit)
-		manager->ops->win_commit(manager, overlay->zpos);
+		manager->ops->win_commit(manager, exynos_plane->zpos);
 }
 
 void exynos_plane_dpms(struct drm_plane *plane, int mode)
 {
-	struct exynos_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_overlay *overlay = &exynos_plane->overlay;
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_manager *manager;
 
 	if (mode == DRM_MODE_DPMS_ON) {
@@ -170,7 +159,7 @@ void exynos_plane_dpms(struct drm_plane *plane, int mode)
 
 		manager = to_exynos_crtc(plane->crtc)->manager;
 		if (manager->ops->win_enable)
-			manager->ops->win_enable(manager, overlay->zpos);
+			manager->ops->win_enable(manager, exynos_plane->zpos);
 
 		exynos_plane->enabled = true;
 	} else {
@@ -179,7 +168,7 @@ void exynos_plane_dpms(struct drm_plane *plane, int mode)
 
 		manager = to_exynos_crtc(plane->crtc)->manager;
 		if (manager->ops->win_disable)
-			manager->ops->win_disable(manager, overlay->zpos);
+			manager->ops->win_disable(manager, exynos_plane->zpos);
 
 		exynos_plane->enabled = false;
 	}
@@ -215,7 +204,7 @@ static int exynos_disable_plane(struct drm_plane *plane)
 
 static void exynos_plane_destroy(struct drm_plane *plane)
 {
-	struct exynos_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 
 	exynos_disable_plane(plane);
 	drm_plane_cleanup(plane);
@@ -227,11 +216,11 @@ static int exynos_plane_set_property(struct drm_plane *plane,
 				     uint64_t val)
 {
 	struct drm_device *dev = plane->dev;
-	struct exynos_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_private *dev_priv = dev->dev_private;
 
 	if (property == dev_priv->plane_zpos_property) {
-		exynos_plane->overlay.zpos = val;
+		exynos_plane->zpos = val;
 		return 0;
 	}
 
@@ -268,10 +257,10 @@ struct drm_plane *exynos_plane_init(struct drm_device *dev,
 				    unsigned long possible_crtcs,
 				    enum drm_plane_type type)
 {
-	struct exynos_plane *exynos_plane;
+	struct exynos_drm_plane *exynos_plane;
 	int err;
 
-	exynos_plane = kzalloc(sizeof(struct exynos_plane), GFP_KERNEL);
+	exynos_plane = kzalloc(sizeof(struct exynos_drm_plane), GFP_KERNEL);
 	if (!exynos_plane)
 		return ERR_PTR(-ENOMEM);
 
@@ -285,7 +274,7 @@ struct drm_plane *exynos_plane_init(struct drm_device *dev,
 	}
 
 	if (type == DRM_PLANE_TYPE_PRIMARY)
-		exynos_plane->overlay.zpos = DEFAULT_ZPOS;
+		exynos_plane->zpos = DEFAULT_ZPOS;
 	else
 		exynos_plane_attach_zpos_property(&exynos_plane->base);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 3b6fdd6..c137545 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -161,43 +161,43 @@ static void vidi_disable_vblank(struct exynos_drm_manager *mgr)
 }
 
 static void vidi_win_mode_set(struct exynos_drm_manager *mgr,
-			struct exynos_drm_overlay *overlay)
+			struct exynos_drm_plane *plane)
 {
 	struct vidi_context *ctx = manager_to_vidi(mgr);
 	struct vidi_win_data *win_data;
 	int win;
 	unsigned long offset;
 
-	if (!overlay) {
-		DRM_ERROR("overlay is NULL\n");
+	if (!plane) {
+		DRM_ERROR("plane is NULL\n");
 		return;
 	}
 
-	win = overlay->zpos;
+	win = plane->zpos;
 	if (win == DEFAULT_ZPOS)
 		win = ctx->default_win;
 
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
-	offset = overlay->fb_x * (overlay->bpp >> 3);
-	offset += overlay->fb_y * overlay->pitch;
+	offset = plane->fb_x * (plane->bpp >> 3);
+	offset += plane->fb_y * plane->pitch;
 
-	DRM_DEBUG_KMS("offset = 0x%lx, pitch = %x\n", offset, overlay->pitch);
+	DRM_DEBUG_KMS("offset = 0x%lx, pitch = %x\n", offset, plane->pitch);
 
 	win_data = &ctx->win_data[win];
 
-	win_data->offset_x = overlay->crtc_x;
-	win_data->offset_y = overlay->crtc_y;
-	win_data->ovl_width = overlay->crtc_width;
-	win_data->ovl_height = overlay->crtc_height;
-	win_data->fb_width = overlay->fb_width;
-	win_data->fb_height = overlay->fb_height;
-	win_data->dma_addr = overlay->dma_addr[0] + offset;
-	win_data->bpp = overlay->bpp;
-	win_data->buf_offsize = (overlay->fb_width - overlay->crtc_width) *
-				(overlay->bpp >> 3);
-	win_data->line_size = overlay->crtc_width * (overlay->bpp >> 3);
+	win_data->offset_x = plane->crtc_x;
+	win_data->offset_y = plane->crtc_y;
+	win_data->ovl_width = plane->crtc_width;
+	win_data->ovl_height = plane->crtc_height;
+	win_data->fb_width = plane->fb_width;
+	win_data->fb_height = plane->fb_height;
+	win_data->dma_addr = plane->dma_addr[0] + offset;
+	win_data->bpp = plane->bpp;
+	win_data->buf_offsize = (plane->fb_width - plane->crtc_width) *
+				(plane->bpp >> 3);
+	win_data->line_size = plane->crtc_width * (plane->bpp >> 3);
 
 	/*
 	 * some parts of win_data should be transferred to user side
@@ -210,7 +210,7 @@ static void vidi_win_mode_set(struct exynos_drm_manager *mgr,
 			win_data->ovl_width, win_data->ovl_height);
 	DRM_DEBUG_KMS("paddr = 0x%lx\n", (unsigned long)win_data->dma_addr);
 	DRM_DEBUG_KMS("fb_width = %d, crtc_width = %d\n",
-			overlay->fb_width, overlay->crtc_width);
+			plane->fb_width, plane->crtc_width);
 }
 
 static void vidi_win_commit(struct exynos_drm_manager *mgr, int zpos)
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 820b762..b64674a 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -922,24 +922,24 @@ static void mixer_disable_vblank(struct exynos_drm_manager *mgr)
 }
 
 static void mixer_win_mode_set(struct exynos_drm_manager *mgr,
-			struct exynos_drm_overlay *overlay)
+			struct exynos_drm_plane *plane)
 {
 	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
 	struct hdmi_win_data *win_data;
 	int win;
 
-	if (!overlay) {
-		DRM_ERROR("overlay is NULL\n");
+	if (!plane) {
+		DRM_ERROR("plane is NULL\n");
 		return;
 	}
 
 	DRM_DEBUG_KMS("set [%d]x[%d] at (%d,%d) to [%d]x[%d] at (%d,%d)\n",
-				 overlay->fb_width, overlay->fb_height,
-				 overlay->fb_x, overlay->fb_y,
-				 overlay->crtc_width, overlay->crtc_height,
-				 overlay->crtc_x, overlay->crtc_y);
+				 plane->fb_width, plane->fb_height,
+				 plane->fb_x, plane->fb_y,
+				 plane->crtc_width, plane->crtc_height,
+				 plane->crtc_x, plane->crtc_y);
 
-	win = overlay->zpos;
+	win = plane->zpos;
 	if (win == DEFAULT_ZPOS)
 		win = MIXER_DEFAULT_WIN;
 
@@ -950,27 +950,27 @@ static void mixer_win_mode_set(struct exynos_drm_manager *mgr,
 
 	win_data = &mixer_ctx->win_data[win];
 
-	win_data->dma_addr = overlay->dma_addr[0];
-	win_data->chroma_dma_addr = overlay->dma_addr[1];
-	win_data->pixel_format = overlay->pixel_format;
-	win_data->bpp = overlay->bpp;
+	win_data->dma_addr = plane->dma_addr[0];
+	win_data->chroma_dma_addr = plane->dma_addr[1];
+	win_data->pixel_format = plane->pixel_format;
+	win_data->bpp = plane->bpp;
 
-	win_data->crtc_x = overlay->crtc_x;
-	win_data->crtc_y = overlay->crtc_y;
-	win_data->crtc_width = overlay->crtc_width;
-	win_data->crtc_height = overlay->crtc_height;
+	win_data->crtc_x = plane->crtc_x;
+	win_data->crtc_y = plane->crtc_y;
+	win_data->crtc_width = plane->crtc_width;
+	win_data->crtc_height = plane->crtc_height;
 
-	win_data->fb_x = overlay->fb_x;
-	win_data->fb_y = overlay->fb_y;
-	win_data->fb_width = overlay->fb_width;
-	win_data->fb_height = overlay->fb_height;
-	win_data->src_width = overlay->src_width;
-	win_data->src_height = overlay->src_height;
+	win_data->fb_x = plane->fb_x;
+	win_data->fb_y = plane->fb_y;
+	win_data->fb_width = plane->fb_width;
+	win_data->fb_height = plane->fb_height;
+	win_data->src_width = plane->src_width;
+	win_data->src_height = plane->src_height;
 
-	win_data->mode_width = overlay->mode_width;
-	win_data->mode_height = overlay->mode_height;
+	win_data->mode_width = plane->mode_width;
+	win_data->mode_height = plane->mode_height;
 
-	win_data->scan_flags = overlay->scan_flag;
+	win_data->scan_flags = plane->scan_flag;
 }
 
 static void mixer_win_commit(struct exynos_drm_manager *mgr, int zpos)
-- 
1.9.3
