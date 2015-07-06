From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 08/23] drm/exynos: use drm atomic state directly
Date: Mon,  6 Jul 2015 11:20:09 -0300
Message-ID: <1436192424-18194-9-git-send-email-gustavo@padovan.org>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:35464 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbbGFOU5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jul 2015 10:20:57 -0400
Received: by qget71 with SMTP id t71so69540638qge.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jul 2015 07:20:56 -0700 (PDT)
In-Reply-To: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

For some fields the use of struct exynos_drm_plane filled with data from
the plane state just creates a source of duplicated information and
overhead.  Here we change the crtc drivers to access the plane state
directly simplifying the code by not relying on a exynos internal struct.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 21 +++++----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 23 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 29 ++++++------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 12 -----
 drivers/gpu/drm/exynos/exynos_mixer.c         | 65 ++++++++++++++-------------
 5 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 6dc2be2..dd41390 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -152,15 +152,15 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 #define OFFSIZE(x)		(((x) & 0x3fff) << 14)
 #define PAGEWIDTH(x)		((x) & 0x3fff)
 
-static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
+static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
+				 struct drm_framebuffer *fb)
 {
-	struct exynos_drm_plane *plane = &ctx->planes[win];
 	unsigned long val;
 
 	val = readl(ctx->addr + DECON_WINCONx(win));
 	val &= ~WINCONx_BPPMODE_MASK;
 
-	switch (plane->pixel_format) {
+	switch (fb->pixel_format) {
 	case DRM_FORMAT_XRGB1555:
 		val |= WINCONx_BPPMODE_16BPP_I1555;
 		val |= WINCONx_HAWSWP_F;
@@ -186,7 +186,7 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
 		return;
 	}
 
-	DRM_DEBUG_KMS("bpp = %u\n", plane->bpp);
+	DRM_DEBUG_KMS("bpp = %u\n", fb->bits_per_pixel);
 
 	/*
 	 * In case of exynos, setting dma-burst to 16Word causes permanent
@@ -196,7 +196,7 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
 	 * movement causes unstable DMA which results into iommu crash/tear.
 	 */
 
-	if (plane->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+	if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
 		val &= ~WINCONx_BURSTLEN_MASK;
 		val |= WINCONx_BURSTLEN_8WORD;
 	}
@@ -223,7 +223,10 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 			       struct exynos_drm_plane *plane)
 {
 	struct decon_context *ctx = crtc->ctx;
+	struct drm_plane_state *state = plane->base.state;
 	unsigned int win = plane->zpos;
+	unsigned int bpp = state->fb->bits_per_pixel >> 3;
+	unsigned int pitch = state->fb->pitches[0];
 	u32 val;
 
 	if (ctx->suspended)
@@ -248,14 +251,14 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 
 	writel(plane->dma_addr[0], ctx->addr + DECON_VIDW0xADD0B0(win));
 
-	val = plane->dma_addr[0] + plane->pitch * plane->crtc_height;
+	val = plane->dma_addr[0] + pitch * plane->crtc_height;
 	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
 
-	val = OFFSIZE(plane->pitch - plane->crtc_width * (plane->bpp >> 3))
-		| PAGEWIDTH(plane->crtc_width * (plane->bpp >> 3));
+	val = OFFSIZE(pitch - plane->crtc_width * bpp)
+		| PAGEWIDTH(plane->crtc_width * bpp);
 	writel(val, ctx->addr + DECON_VIDW0xADD2(win));
 
-	decon_win_set_pixfmt(ctx, win);
+	decon_win_set_pixfmt(ctx, win, state->fb);
 
 	/* window enable */
 	val = readl(ctx->addr + DECON_WINCONx(win));
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 79b74d2..7f00a20 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -271,16 +271,16 @@ static void decon_disable_vblank(struct exynos_drm_crtc *crtc)
 	}
 }
 
-static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
+static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
+				 struct drm_framebuffer *fb)
 {
-	struct exynos_drm_plane *plane = &ctx->planes[win];
 	unsigned long val;
 	int padding;
 
 	val = readl(ctx->regs + WINCON(win));
 	val &= ~WINCONx_BPPMODE_MASK;
 
-	switch (plane->pixel_format) {
+	switch (fb->pixel_format) {
 	case DRM_FORMAT_RGB565:
 		val |= WINCONx_BPPMODE_16BPP_565;
 		val |= WINCONx_BURSTLEN_16WORD;
@@ -329,7 +329,7 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
 		break;
 	}
 
-	DRM_DEBUG_KMS("bpp = %d\n", plane->bpp);
+	DRM_DEBUG_KMS("bpp = %d\n", fb->bits_per_pixel);
 
 	/*
 	 * In case of exynos, setting dma-burst to 16Word causes permanent
@@ -339,8 +339,8 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win)
 	 * movement causes unstable DMA which results into iommu crash/tear.
 	 */
 
-	padding = (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
-	if (plane->fb_width + padding < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+	padding = (fb->pitches[0] / (fb->bits_per_pixel >> 3)) - fb->width;
+	if (fb->width + padding < MIN_FB_WIDTH_FOR_16WORD_BURST) {
 		val &= ~WINCONx_BURSTLEN_MASK;
 		val |= WINCONx_BURSTLEN_8WORD;
 	}
@@ -387,11 +387,14 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
+	struct drm_plane_state *state = plane->base.state;
 	int padding;
 	unsigned long val, alpha;
 	unsigned int last_x;
 	unsigned int last_y;
 	unsigned int win = plane->zpos;
+	unsigned int bpp = state->fb->bits_per_pixel >> 3;
+	unsigned int pitch = state->fb->pitches[0];
 
 	if (ctx->suspended)
 		return;
@@ -413,11 +416,11 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	val = (unsigned long)plane->dma_addr[0];
 	writel(val, ctx->regs + VIDW_BUF_START(win));
 
-	padding = (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
+	padding = (pitch / bpp) - state->fb->width;
 
 	/* buffer size */
-	writel(plane->fb_width + padding, ctx->regs + VIDW_WHOLE_X(win));
-	writel(plane->fb_height, ctx->regs + VIDW_WHOLE_Y(win));
+	writel(state->fb->width + padding, ctx->regs + VIDW_WHOLE_X(win));
+	writel(state->fb->height, ctx->regs + VIDW_WHOLE_Y(win));
 
 	/* offset from the start of the buffer to read */
 	writel(plane->src_x, ctx->regs + VIDW_OFFSET_X(win));
@@ -468,7 +471,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 
 	writel(alpha, ctx->regs + VIDOSD_D(win));
 
-	decon_win_set_pixfmt(ctx, win);
+	decon_win_set_pixfmt(ctx, win, state->fb);
 
 	/* hardware window 0 doesn't support color key. */
 	if (win != 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index b7bcaf7..68f1904 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -486,9 +486,9 @@ static void fimd_commit(struct exynos_drm_crtc *crtc)
 }
 
 
-static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
+static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
+				struct drm_framebuffer *fb)
 {
-	struct exynos_drm_plane *plane = &ctx->planes[win];
 	unsigned long val;
 
 	val = WINCONx_ENWIN;
@@ -498,11 +498,11 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 	 * So the request format is ARGB8888 then change it to XRGB8888.
 	 */
 	if (ctx->driver_data->has_limited_fmt && !win) {
-		if (plane->pixel_format == DRM_FORMAT_ARGB8888)
-			plane->pixel_format = DRM_FORMAT_XRGB8888;
+		if (fb->pixel_format == DRM_FORMAT_ARGB8888)
+			fb->pixel_format = DRM_FORMAT_XRGB8888;
 	}
 
-	switch (plane->pixel_format) {
+	switch (fb->pixel_format) {
 	case DRM_FORMAT_C8:
 		val |= WINCON0_BPPMODE_8BPP_PALETTE;
 		val |= WINCONx_BURSTLEN_8WORD;
@@ -538,7 +538,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 		break;
 	}
 
-	DRM_DEBUG_KMS("bpp = %d\n", plane->bpp);
+	DRM_DEBUG_KMS("bpp = %d\n", fb->bits_per_pixel);
 
 	/*
 	 * In case of exynos, setting dma-burst to 16Word causes permanent
@@ -548,7 +548,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 	 * movement causes unstable DMA which results into iommu crash/tear.
 	 */
 
-	if (plane->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+	if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
 		val &= ~WINCONx_BURSTLEN_MASK;
 		val |= WINCONx_BURSTLEN_4WORD;
 	}
@@ -618,10 +618,13 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 			      struct exynos_drm_plane *plane)
 {
 	struct fimd_context *ctx = crtc->ctx;
+	struct drm_plane_state *state = plane->base.state;
 	dma_addr_t dma_addr;
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
 	unsigned int win = plane->zpos;
+	unsigned int bpp = state->fb->bits_per_pixel >> 3;
+	unsigned int pitch = state->fb->pitches[0];
 
 	if (ctx->suspended)
 		return;
@@ -640,8 +643,8 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	fimd_shadow_protect_win(ctx, win, true);
 
 
-	offset = plane->src_x * (plane->bpp >> 3);
-	offset += plane->src_y * plane->pitch;
+	offset = plane->src_x * bpp;
+	offset += plane->src_y * pitch;
 
 	/* buffer start address */
 	dma_addr = plane->dma_addr[0] + offset;
@@ -649,7 +652,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
 
 	/* buffer end address */
-	size = plane->pitch * plane->crtc_height;
+	size = pitch * plane->crtc_height;
 	val = (unsigned long)(dma_addr + size);
 	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
 
@@ -659,8 +662,8 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 			plane->crtc_width, plane->crtc_height);
 
 	/* buffer size */
-	buf_offsize = plane->pitch - (plane->crtc_width * (plane->bpp >> 3));
-	line_size = plane->crtc_width * (plane->bpp >> 3);
+	buf_offsize = pitch - (plane->crtc_width * bpp);
+	line_size = plane->crtc_width * bpp;
 	val = VIDW_BUF_SIZE_OFFSET(buf_offsize) |
 		VIDW_BUF_SIZE_PAGEWIDTH(line_size) |
 		VIDW_BUF_SIZE_OFFSET_E(buf_offsize) |
@@ -700,7 +703,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 		DRM_DEBUG_KMS("osd size = 0x%x\n", (unsigned int)val);
 	}
 
-	fimd_win_set_pixfmt(ctx, win);
+	fimd_win_set_pixfmt(ctx, win, state->fb);
 
 	/* hardware window 0 doesn't support color key. */
 	if (win != 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index b5aa5b7..9602797 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -99,24 +99,12 @@ static void exynos_plane_mode_set(struct drm_plane *plane,
 	exynos_plane->src_y = src_y;
 	exynos_plane->src_width = (actual_w * exynos_plane->h_ratio) >> 16;
 	exynos_plane->src_height = (actual_h * exynos_plane->v_ratio) >> 16;
-	exynos_plane->fb_width = fb->width;
-	exynos_plane->fb_height = fb->height;
-	exynos_plane->bpp = fb->bits_per_pixel;
-	exynos_plane->pitch = fb->pitches[0];
-	exynos_plane->pixel_format = fb->pixel_format;
 
 	/* set plane range to be displayed. */
 	exynos_plane->crtc_x = crtc_x;
 	exynos_plane->crtc_y = crtc_y;
 	exynos_plane->crtc_width = actual_w;
 	exynos_plane->crtc_height = actual_h;
-
-	/* set drm mode data. */
-	exynos_plane->mode_width = mode->hdisplay;
-	exynos_plane->mode_height = mode->vdisplay;
-	exynos_plane->refresh = mode->vrefresh;
-	exynos_plane->scan_flag = mode->flags;
-
 	DRM_DEBUG_KMS("plane : offset_x/y(%d,%d), width/height(%d,%d)",
 			exynos_plane->crtc_x, exynos_plane->crtc_y,
 			exynos_plane->crtc_width, exynos_plane->crtc_height);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 1f05b0d..f041bb7 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -380,19 +380,20 @@ static void mixer_stop(struct mixer_context *ctx)
 		usleep_range(10000, 12000);
 }
 
-static void vp_video_buffer(struct mixer_context *ctx, unsigned int win)
+static void vp_video_buffer(struct mixer_context *ctx,
+			    struct exynos_drm_plane *plane)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
+	struct drm_plane_state *state = plane->base.state;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_display_mode *mode = &state->crtc->mode;
 	unsigned long flags;
-	struct exynos_drm_plane *plane;
 	dma_addr_t luma_addr[2], chroma_addr[2];
 	bool tiled_mode = false;
 	bool crcb_mode = false;
 	u32 val;
 
-	plane = &ctx->planes[win];
-
-	switch (plane->pixel_format) {
+	switch (fb->pixel_format) {
 	case DRM_FORMAT_NV12:
 		crcb_mode = false;
 		break;
@@ -401,21 +402,21 @@ static void vp_video_buffer(struct mixer_context *ctx, unsigned int win)
 		break;
 	default:
 		DRM_ERROR("pixel format for vp is wrong [%d].\n",
-				plane->pixel_format);
+				fb->pixel_format);
 		return;
 	}
 
 	luma_addr[0] = plane->dma_addr[0];
 	chroma_addr[0] = plane->dma_addr[1];
 
-	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		ctx->interlace = true;
 		if (tiled_mode) {
 			luma_addr[1] = luma_addr[0] + 0x40;
 			chroma_addr[1] = chroma_addr[0] + 0x40;
 		} else {
-			luma_addr[1] = luma_addr[0] + plane->pitch;
-			chroma_addr[1] = chroma_addr[0] + plane->pitch;
+			luma_addr[1] = luma_addr[0] + fb->pitches[0];
+			chroma_addr[1] = chroma_addr[0] + fb->pitches[0];
 		}
 	} else {
 		ctx->interlace = false;
@@ -436,11 +437,11 @@ static void vp_video_buffer(struct mixer_context *ctx, unsigned int win)
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);
 
 	/* setting size of input image */
-	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->pitch) |
-		VP_IMG_VSIZE(plane->fb_height));
+	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(fb->pitches[0]) |
+		VP_IMG_VSIZE(fb->height));
 	/* chroma height has to reduced by 2 to avoid chroma distorions */
-	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->pitch) |
-		VP_IMG_VSIZE(plane->fb_height / 2));
+	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[0]) |
+		VP_IMG_VSIZE(fb->height / 2));
 
 	vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
 	vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
@@ -469,9 +470,9 @@ static void vp_video_buffer(struct mixer_context *ctx, unsigned int win)
 	vp_reg_write(res, VP_TOP_C_PTR, chroma_addr[0]);
 	vp_reg_write(res, VP_BOT_C_PTR, chroma_addr[1]);
 
-	mixer_cfg_scan(ctx, plane->mode_height);
-	mixer_cfg_rgb_fmt(ctx, plane->mode_height);
-	mixer_cfg_layer(ctx, win, true);
+	mixer_cfg_scan(ctx, mode->vdisplay);
+	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
+	mixer_cfg_layer(ctx, plane->zpos, true);
 	mixer_run(ctx);
 
 	mixer_vsync_set_update(ctx, true);
@@ -512,20 +513,22 @@ fail:
 	return -ENOTSUPP;
 }
 
-static void mixer_graph_buffer(struct mixer_context *ctx, unsigned int win)
+static void mixer_graph_buffer(struct mixer_context *ctx,
+			       struct exynos_drm_plane *plane)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
+	struct drm_plane_state *state = plane->base.state;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_display_mode *mode = &state->crtc->mode;
 	unsigned long flags;
-	struct exynos_drm_plane *plane;
+	unsigned int win = plane->zpos;
 	unsigned int x_ratio = 0, y_ratio = 0;
 	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
 	dma_addr_t dma_addr;
 	unsigned int fmt;
 	u32 val;
 
-	plane = &ctx->planes[win];
-
-	switch (plane->pixel_format) {
+	switch (fb->pixel_format) {
 	case DRM_FORMAT_XRGB4444:
 		fmt = MXR_FORMAT_ARGB4444;
 		break;
@@ -557,12 +560,12 @@ static void mixer_graph_buffer(struct mixer_context *ctx, unsigned int win)
 
 	/* converting dma address base and source offset */
 	dma_addr = plane->dma_addr[0]
-		+ (plane->src_x * plane->bpp >> 3)
-		+ (plane->src_y * plane->pitch);
+		+ (plane->src_x * fb->bits_per_pixel >> 3)
+		+ (plane->src_y * fb->pitches[0]);
 	src_x_offset = 0;
 	src_y_offset = 0;
 
-	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE)
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		ctx->interlace = true;
 	else
 		ctx->interlace = false;
@@ -576,13 +579,13 @@ static void mixer_graph_buffer(struct mixer_context *ctx, unsigned int win)
 
 	/* setup geometry */
 	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win),
-			plane->pitch / (plane->bpp >> 3));
+			fb->pitches[0] / (fb->bits_per_pixel >> 3));
 
 	/* setup display size */
 	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
 		win == MIXER_DEFAULT_WIN) {
-		val  = MXR_MXR_RES_HEIGHT(plane->mode_height);
-		val |= MXR_MXR_RES_WIDTH(plane->mode_width);
+		val  = MXR_MXR_RES_HEIGHT(mode->vdisplay);
+		val |= MXR_MXR_RES_WIDTH(mode->hdisplay);
 		mixer_reg_write(res, MXR_RESOLUTION, val);
 	}
 
@@ -605,8 +608,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, unsigned int win)
 	/* set buffer address to mixer */
 	mixer_reg_write(res, MXR_GRAPHIC_BASE(win), dma_addr);
 
-	mixer_cfg_scan(ctx, plane->mode_height);
-	mixer_cfg_rgb_fmt(ctx, plane->mode_height);
+	mixer_cfg_scan(ctx, mode->vdisplay);
+	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
 	mixer_cfg_layer(ctx, win, true);
 
 	/* layer update mandatory for mixer 16.0.33.0 */
@@ -937,9 +940,9 @@ static void mixer_update_plane(struct exynos_drm_crtc *crtc,
 	mutex_unlock(&mixer_ctx->mixer_mutex);
 
 	if (plane->zpos > 1 && mixer_ctx->vp_enabled)
-		vp_video_buffer(mixer_ctx, plane->zpos);
+		vp_video_buffer(mixer_ctx, plane);
 	else
-		mixer_graph_buffer(mixer_ctx, plane->zpos);
+		mixer_graph_buffer(mixer_ctx, plane);
 }
 
 static void mixer_disable_plane(struct exynos_drm_crtc *crtc,
-- 
2.1.0
