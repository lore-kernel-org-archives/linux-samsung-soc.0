From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 9/9] drm/exynos: unify exynos_drm_plane names with drm core
Date: Wed,  3 Jun 2015 11:30:32 -0300
Message-ID: <1433341832-2686-9-git-send-email-gustavo@padovan.org>
References: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:33710 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755220AbbFCObF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 10:31:05 -0400
Received: by ykfr66 with SMTP id r66so4180173ykf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 07:31:04 -0700 (PDT)
In-Reply-To: <1433341832-2686-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Rename crtc_{widht,height} to crtc_{w,h} and src_{width,height} to
src_{w,h} to make it similar to the atomic state names.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 14 +++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.h    | 16 ++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 14 +++++++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.c  | 11 ++++++-----
 drivers/gpu/drm/exynos/exynos_mixer.c      | 22 +++++++++++-----------
 5 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 7a99237..4e63a9c 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -442,25 +442,25 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	DRM_DEBUG_KMS("start addr = 0x%lx\n",
 			(unsigned long)val);
 	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
-			plane->crtc_width, plane->crtc_height);
+			plane->crtc_w, plane->crtc_h);
 
 	/*
 	 * OSD position.
 	 * In case the window layout goes of LCD layout, DECON fails.
 	 */
-	if ((plane->crtc_x + plane->crtc_width) > mode->hdisplay)
-		plane->crtc_x = mode->hdisplay - plane->crtc_width;
-	if ((plane->crtc_y + plane->crtc_height) > mode->vdisplay)
-		plane->crtc_y = mode->vdisplay - plane->crtc_height;
+	if ((plane->crtc_x + plane->crtc_w) > mode->hdisplay)
+		plane->crtc_x = mode->hdisplay - plane->crtc_w;
+	if ((plane->crtc_y + plane->crtc_h) > mode->vdisplay)
+		plane->crtc_y = mode->vdisplay - plane->crtc_h;
 
 	val = VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
 		VIDOSDxA_TOPLEFT_Y(plane->crtc_y);
 	writel(val, ctx->regs + VIDOSD_A(win));
 
-	last_x = plane->crtc_x + plane->crtc_width;
+	last_x = plane->crtc_x + plane->crtc_w;
 	if (last_x)
 		last_x--;
-	last_y = plane->crtc_y + plane->crtc_height;
+	last_y = plane->crtc_y + plane->crtc_h;
 	if (last_y)
 		last_y--;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b83d487..7c6196e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -51,12 +51,12 @@ enum exynos_drm_output_type {
  *	- the unit is screen coordinates.
  * @src_y: offset y on a framebuffer to be displayed.
  *	- the unit is screen coordinates.
- * @src_width: width of a partial image to be displayed from framebuffer.
- * @src_height: height of a partial image to be displayed from framebuffer.
+ * @src_w: width of a partial image to be displayed from framebuffer.
+ * @src_h: height of a partial image to be displayed from framebuffer.
  * @crtc_x: offset x on hardware screen.
  * @crtc_y: offset y on hardware screen.
- * @crtc_width: window width to be displayed (hardware screen).
- * @crtc_height: window height to be displayed (hardware screen).
+ * @crtc_w: window width to be displayed (hardware screen).
+ * @crtc_h: window height to be displayed (hardware screen).
  * @h_ratio: horizontal scaling ratio, 16.16 fixed point
  * @v_ratio: vertical scaling ratio, 16.16 fixed point
  * @dma_addr: array of bus(accessed by dma) address to the memory region
@@ -73,12 +73,12 @@ struct exynos_drm_plane {
 	struct drm_plane base;
 	unsigned int src_x;
 	unsigned int src_y;
-	unsigned int src_width;
-	unsigned int src_height;
+	unsigned int src_w;
+	unsigned int src_h;
 	unsigned int crtc_x;
 	unsigned int crtc_y;
-	unsigned int crtc_width;
-	unsigned int crtc_height;
+	unsigned int crtc_w;
+	unsigned int crtc_h;
 	unsigned int h_ratio;
 	unsigned int v_ratio;
 	dma_addr_t dma_addr[MAX_FB_BUFFER];
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2ece83b..920727b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -659,18 +659,18 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
 
 	/* buffer end address */
-	size = pitch * plane->crtc_height;
+	size = pitch * plane->crtc_h;
 	val = (unsigned long)(dma_addr + size);
 	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
 
 	DRM_DEBUG_KMS("start addr = 0x%lx, end addr = 0x%lx, size = 0x%lx\n",
 			(unsigned long)dma_addr, val, size);
 	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
-			plane->crtc_width, plane->crtc_height);
+			plane->crtc_w, plane->crtc_h);
 
 	/* buffer size */
-	buf_offsize = pitch - (plane->crtc_width * bpp);
-	line_size = plane->crtc_width * bpp;
+	buf_offsize = pitch - (plane->crtc_w * bpp);
+	line_size = plane->crtc_w * bpp;
 	val = VIDW_BUF_SIZE_OFFSET(buf_offsize) |
 		VIDW_BUF_SIZE_PAGEWIDTH(line_size) |
 		VIDW_BUF_SIZE_OFFSET_E(buf_offsize) |
@@ -684,10 +684,10 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 		VIDOSDxA_TOPLEFT_Y_E(plane->crtc_y);
 	writel(val, ctx->regs + VIDOSD_A(win));
 
-	last_x = plane->crtc_x + plane->crtc_width;
+	last_x = plane->crtc_x + plane->crtc_w;
 	if (last_x)
 		last_x--;
-	last_y = plane->crtc_y + plane->crtc_height;
+	last_y = plane->crtc_y + plane->crtc_h;
 	if (last_y)
 		last_y--;
 
@@ -704,7 +704,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 		u32 offset = VIDOSD_D(win);
 		if (win == 0)
 			offset = VIDOSD_C(win);
-		val = plane->crtc_width * plane->crtc_height;
+		val = plane->crtc_w * plane->crtc_h;
 		writel(val, ctx->regs + offset);
 
 		DRM_DEBUG_KMS("osd size = 0x%x\n", (unsigned int)val);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 9602797..bebc957 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -97,17 +97,18 @@ static void exynos_plane_mode_set(struct drm_plane *plane,
 	/* set drm framebuffer data. */
 	exynos_plane->src_x = src_x;
 	exynos_plane->src_y = src_y;
-	exynos_plane->src_width = (actual_w * exynos_plane->h_ratio) >> 16;
-	exynos_plane->src_height = (actual_h * exynos_plane->v_ratio) >> 16;
+	exynos_plane->src_w = (actual_w * exynos_plane->h_ratio) >> 16;
+	exynos_plane->src_h = (actual_h * exynos_plane->v_ratio) >> 16;
 
 	/* set plane range to be displayed. */
 	exynos_plane->crtc_x = crtc_x;
 	exynos_plane->crtc_y = crtc_y;
-	exynos_plane->crtc_width = actual_w;
-	exynos_plane->crtc_height = actual_h;
+	exynos_plane->crtc_w = actual_w;
+	exynos_plane->crtc_h = actual_h;
+
 	DRM_DEBUG_KMS("plane : offset_x/y(%d,%d), width/height(%d,%d)",
 			exynos_plane->crtc_x, exynos_plane->crtc_y,
-			exynos_plane->crtc_width, exynos_plane->crtc_height);
+			exynos_plane->crtc_w, exynos_plane->crtc_h);
 
 	plane->crtc = crtc;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 4fbafc9..f8ef8c6 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -443,19 +443,19 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[0]) |
 		VP_IMG_VSIZE(fb->height / 2));
 
-	vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
-	vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
+	vp_reg_write(res, VP_SRC_WIDTH, plane->src_w);
+	vp_reg_write(res, VP_SRC_HEIGHT, plane->src_h);
 	vp_reg_write(res, VP_SRC_H_POSITION,
 			VP_SRC_H_POSITION_VAL(plane->src_x));
 	vp_reg_write(res, VP_SRC_V_POSITION, plane->src_y);
 
-	vp_reg_write(res, VP_DST_WIDTH, plane->crtc_width);
+	vp_reg_write(res, VP_DST_WIDTH, plane->crtc_w);
 	vp_reg_write(res, VP_DST_H_POSITION, plane->crtc_x);
 	if (ctx->interlace) {
-		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height / 2);
+		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_h / 2);
 		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y / 2);
 	} else {
-		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height);
+		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_h);
 		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y);
 	}
 
@@ -492,15 +492,15 @@ static void mixer_layer_update(struct mixer_context *ctx)
 static int mixer_setup_scale(const struct exynos_drm_plane *plane,
 		unsigned int *x_ratio, unsigned int *y_ratio)
 {
-	if (plane->crtc_width != plane->src_width) {
-		if (plane->crtc_width == 2 * plane->src_width)
+	if (plane->crtc_w != plane->src_w) {
+		if (plane->crtc_w == 2 * plane->src_w)
 			*x_ratio = 1;
 		else
 			goto fail;
 	}
 
-	if (plane->crtc_height != plane->src_height) {
-		if (plane->crtc_height == 2 * plane->src_height)
+	if (plane->crtc_h != plane->src_h) {
+		if (plane->crtc_h == 2 * plane->src_h)
 			*y_ratio = 1;
 		else
 			goto fail;
@@ -589,8 +589,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 		mixer_reg_write(res, MXR_RESOLUTION, val);
 	}
 
-	val  = MXR_GRP_WH_WIDTH(plane->src_width);
-	val |= MXR_GRP_WH_HEIGHT(plane->src_height);
+	val  = MXR_GRP_WH_WIDTH(plane->src_w);
+	val |= MXR_GRP_WH_HEIGHT(plane->src_h);
 	val |= MXR_GRP_WH_H_SCALE(x_ratio);
 	val |= MXR_GRP_WH_V_SCALE(y_ratio);
 	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
-- 
2.1.0
