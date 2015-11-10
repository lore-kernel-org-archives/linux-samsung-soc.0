From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 11/25] drm/exynos: introduce exynos_drm_plane_state structure
Date: Tue, 10 Nov 2015 14:23:27 +0100
Message-ID: <1447161821-1877-12-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64213 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099AbbKJNY4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:56 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00AJEP9GUMA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:52 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch introduces exynos_drm_plane_state structure, which subclasses
drm_plane_state and holds precalculated data suitable for configuring
Exynos hardware.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  21 ++---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  21 ++---
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  56 +++++++-----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  33 +++----
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 125 +++++++++++++++++++-------
 drivers/gpu/drm/exynos/exynos_mixer.c         |  61 +++++++------
 6 files changed, 197 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index a3161b0428b9..27039468364b 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -260,9 +260,10 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 static void decon_update_plane(struct exynos_drm_crtc *crtc,
 			       struct exynos_drm_plane *plane)
 {
+	struct exynos_drm_plane_state *state =
+				to_exynos_plane_state(plane->base.state);
 	struct decon_context *ctx = crtc->ctx;
-	struct drm_plane_state *state = plane->base.state;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = state->base.fb;
 	unsigned int win = plane->zpos;
 	unsigned int bpp = fb->bits_per_pixel >> 3;
 	unsigned int pitch = fb->pitches[0];
@@ -272,11 +273,11 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return;
 
-	val = COORDINATE_X(plane->crtc_x) | COORDINATE_Y(plane->crtc_y);
+	val = COORDINATE_X(state->crtc.x) | COORDINATE_Y(state->crtc.y);
 	writel(val, ctx->addr + DECON_VIDOSDxA(win));
 
-	val = COORDINATE_X(plane->crtc_x + plane->crtc_w - 1) |
-		COORDINATE_Y(plane->crtc_y + plane->crtc_h - 1);
+	val = COORDINATE_X(state->crtc.x + state->crtc.w - 1) |
+		COORDINATE_Y(state->crtc.y + state->crtc.h - 1);
 	writel(val, ctx->addr + DECON_VIDOSDxB(win));
 
 	val = VIDOSD_Wx_ALPHA_R_F(0x0) | VIDOSD_Wx_ALPHA_G_F(0x0) |
@@ -289,15 +290,15 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 
 	writel(dma_addr, ctx->addr + DECON_VIDW0xADD0B0(win));
 
-	val = dma_addr + pitch * plane->crtc_h;
+	val = dma_addr + pitch * state->src.h;
 	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
 
 	if (ctx->out_type != IFTYPE_HDMI)
-		val = BIT_VAL(pitch - plane->crtc_w * bpp, 27, 14)
-			| BIT_VAL(plane->crtc_w * bpp, 13, 0);
+		val = BIT_VAL(pitch - state->crtc.w * bpp, 27, 14)
+			| BIT_VAL(state->crtc.w * bpp, 13, 0);
 	else
-		val = BIT_VAL(pitch - plane->crtc_w * bpp, 29, 15)
-			| BIT_VAL(plane->crtc_w * bpp, 14, 0);
+		val = BIT_VAL(pitch - state->crtc.w * bpp, 29, 15)
+			| BIT_VAL(state->crtc.w * bpp, 14, 0);
 	writel(val, ctx->addr + DECON_VIDW0xADD2(win));
 
 	decon_win_set_pixfmt(ctx, win, fb);
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 15e1e165020f..7868d30d8eac 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -399,9 +399,10 @@ static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
 static void decon_update_plane(struct exynos_drm_crtc *crtc,
 			       struct exynos_drm_plane *plane)
 {
+	struct exynos_drm_plane_state *state =
+				to_exynos_plane_state(plane->base.state);
 	struct decon_context *ctx = crtc->ctx;
-	struct drm_plane_state *state = plane->base.state;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = state->base.fb;
 	int padding;
 	unsigned long val, alpha;
 	unsigned int last_x;
@@ -434,22 +435,22 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	writel(fb->height, ctx->regs + VIDW_WHOLE_Y(win));
 
 	/* offset from the start of the buffer to read */
-	writel(plane->src_x, ctx->regs + VIDW_OFFSET_X(win));
-	writel(plane->src_y, ctx->regs + VIDW_OFFSET_Y(win));
+	writel(state->src.x, ctx->regs + VIDW_OFFSET_X(win));
+	writel(state->src.y, ctx->regs + VIDW_OFFSET_Y(win));
 
 	DRM_DEBUG_KMS("start addr = 0x%lx\n",
 			(unsigned long)val);
 	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
-			plane->crtc_w, plane->crtc_h);
+			state->crtc.w, state->crtc.h);
 
-	val = VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
-		VIDOSDxA_TOPLEFT_Y(plane->crtc_y);
+	val = VIDOSDxA_TOPLEFT_X(state->crtc.x) |
+		VIDOSDxA_TOPLEFT_Y(state->crtc.y);
 	writel(val, ctx->regs + VIDOSD_A(win));
 
-	last_x = plane->crtc_x + plane->crtc_w;
+	last_x = state->crtc.x + state->crtc.w;
 	if (last_x)
 		last_x--;
-	last_y = plane->crtc_y + plane->crtc_h;
+	last_y = state->crtc.y + state->crtc.h;
 	if (last_y)
 		last_y--;
 
@@ -458,7 +459,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	writel(val, ctx->regs + VIDOSD_B(win));
 
 	DRM_DEBUG_KMS("osd pos: tx = %d, ty = %d, bx = %d, by = %d\n",
-			plane->crtc_x, plane->crtc_y, last_x, last_y);
+			state->crtc.x, state->crtc.y, last_x, last_y);
 
 	/* OSD alpha */
 	alpha = VIDOSDxC_ALPHA0_R_F(0x0) |
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index dc41ffb26eb9..482ed2c2ed89 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -38,22 +38,44 @@ enum exynos_drm_output_type {
 	EXYNOS_DISPLAY_TYPE_VIDI,
 };
 
+struct exynos_drm_rect {
+	unsigned int x, y;
+	unsigned int w, h;
+};
+
 /*
- * Exynos drm common overlay structure.
+ * Exynos drm plane state structure.
  *
- * @base: plane object
- * @src_x: offset x on a framebuffer to be displayed.
- *	- the unit is screen coordinates.
- * @src_y: offset y on a framebuffer to be displayed.
- *	- the unit is screen coordinates.
- * @src_w: width of a partial image to be displayed from framebuffer.
- * @src_h: height of a partial image to be displayed from framebuffer.
- * @crtc_x: offset x on hardware screen.
- * @crtc_y: offset y on hardware screen.
- * @crtc_w: window width to be displayed (hardware screen).
- * @crtc_h: window height to be displayed (hardware screen).
+ * @base: plane_state object (contains drm_framebuffer pointer)
+ * @src: rectangle of the source image data to be displayed (clipped to
+ *       visible part).
+ * @crtc: rectangle of the target image position on hardware screen
+ *       (clipped to visible part).
  * @h_ratio: horizontal scaling ratio, 16.16 fixed point
  * @v_ratio: vertical scaling ratio, 16.16 fixed point
+ *
+ * this structure consists plane state data that will be applied to hardware
+ * specific overlay info.
+ */
+
+struct exynos_drm_plane_state {
+	struct drm_plane_state base;
+	struct exynos_drm_rect crtc;
+	struct exynos_drm_rect src;
+	unsigned int h_ratio;
+	unsigned int v_ratio;
+};
+
+static inline struct exynos_drm_plane_state *
+to_exynos_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct exynos_drm_plane_state, base);
+}
+
+/*
+ * Exynos drm common overlay structure.
+ *
+ * @base: plane object
  * @zpos: order of overlay layer(z position).
  *
  * this structure is common to exynos SoC and its contents would be copied
@@ -62,16 +84,6 @@ enum exynos_drm_output_type {
 
 struct exynos_drm_plane {
 	struct drm_plane base;
-	unsigned int src_x;
-	unsigned int src_y;
-	unsigned int src_w;
-	unsigned int src_h;
-	unsigned int crtc_x;
-	unsigned int crtc_y;
-	unsigned int crtc_w;
-	unsigned int crtc_h;
-	unsigned int h_ratio;
-	unsigned int v_ratio;
 	unsigned int zpos;
 	struct drm_framebuffer *pending_fb;
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index d39e960a837f..40fa621e3963 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -641,9 +641,10 @@ static void fimd_atomic_flush(struct exynos_drm_crtc *crtc,
 static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 			      struct exynos_drm_plane *plane)
 {
+	struct exynos_drm_plane_state *state =
+				to_exynos_plane_state(plane->base.state);
 	struct fimd_context *ctx = crtc->ctx;
-	struct drm_plane_state *state = plane->base.state;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = state->base.fb;
 	dma_addr_t dma_addr;
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
@@ -654,8 +655,8 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	if (ctx->suspended)
 		return;
 
-	offset = plane->src_x * bpp;
-	offset += plane->src_y * pitch;
+	offset = state->src.x * bpp;
+	offset += state->src.y * pitch;
 
 	/* buffer start address */
 	dma_addr = exynos_drm_fb_dma_addr(fb, 0) + offset;
@@ -663,18 +664,18 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
 
 	/* buffer end address */
-	size = pitch * plane->crtc_h;
+	size = pitch * state->crtc.h;
 	val = (unsigned long)(dma_addr + size);
 	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
 
 	DRM_DEBUG_KMS("start addr = 0x%lx, end addr = 0x%lx, size = 0x%lx\n",
 			(unsigned long)dma_addr, val, size);
 	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
-			plane->crtc_w, plane->crtc_h);
+			state->crtc.w, state->crtc.h);
 
 	/* buffer size */
-	buf_offsize = pitch - (plane->crtc_w * bpp);
-	line_size = plane->crtc_w * bpp;
+	buf_offsize = pitch - (state->crtc.w * bpp);
+	line_size = state->crtc.w * bpp;
 	val = VIDW_BUF_SIZE_OFFSET(buf_offsize) |
 		VIDW_BUF_SIZE_PAGEWIDTH(line_size) |
 		VIDW_BUF_SIZE_OFFSET_E(buf_offsize) |
@@ -682,16 +683,16 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	writel(val, ctx->regs + VIDWx_BUF_SIZE(win, 0));
 
 	/* OSD position */
-	val = VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
-		VIDOSDxA_TOPLEFT_Y(plane->crtc_y) |
-		VIDOSDxA_TOPLEFT_X_E(plane->crtc_x) |
-		VIDOSDxA_TOPLEFT_Y_E(plane->crtc_y);
+	val = VIDOSDxA_TOPLEFT_X(state->crtc.x) |
+		VIDOSDxA_TOPLEFT_Y(state->crtc.y) |
+		VIDOSDxA_TOPLEFT_X_E(state->crtc.x) |
+		VIDOSDxA_TOPLEFT_Y_E(state->crtc.y);
 	writel(val, ctx->regs + VIDOSD_A(win));
 
-	last_x = plane->crtc_x + plane->crtc_w;
+	last_x = state->crtc.x + state->crtc.w;
 	if (last_x)
 		last_x--;
-	last_y = plane->crtc_y + plane->crtc_h;
+	last_y = state->crtc.y + state->crtc.h;
 	if (last_y)
 		last_y--;
 
@@ -701,14 +702,14 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	writel(val, ctx->regs + VIDOSD_B(win));
 
 	DRM_DEBUG_KMS("osd pos: tx = %d, ty = %d, bx = %d, by = %d\n",
-			plane->crtc_x, plane->crtc_y, last_x, last_y);
+			state->crtc.x, state->crtc.y, last_x, last_y);
 
 	/* OSD size */
 	if (win != 3 && win != 4) {
 		u32 offset = VIDOSD_D(win);
 		if (win == 0)
 			offset = VIDOSD_C(win);
-		val = plane->crtc_w * plane->crtc_h;
+		val = state->crtc.w * state->crtc.h;
 		writel(val, ctx->regs + offset);
 
 		DRM_DEBUG_KMS("osd size = 0x%x\n", (unsigned int)val);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index c725409421b8..365a738042e2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -56,19 +56,35 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 	return size;
 }
 
-static void exynos_plane_mode_set(struct drm_plane *plane,
-				  struct drm_crtc *crtc,
-				  struct drm_framebuffer *fb,
-				  int crtc_x, int crtc_y,
-				  unsigned int crtc_w, unsigned int crtc_h,
-				  uint32_t src_x, uint32_t src_y,
-				  uint32_t src_w, uint32_t src_h)
+static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
+
 {
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	struct drm_plane_state *state = &exynos_state->base;
+	struct drm_crtc *crtc = exynos_state->base.crtc;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	int crtc_x, crtc_y;
+	unsigned int crtc_w, crtc_h;
+	unsigned int src_x, src_y;
+	unsigned int src_w, src_h;
 	unsigned int actual_w;
 	unsigned int actual_h;
 
+	/*
+	 * The original src/dest coordinates are stored in exynos_state->base,
+	 * but we want to keep another copy internal to our driver that we can
+	 * clip/modify ourselves.
+	 */
+
+	crtc_x = state->crtc_x;
+	crtc_y = state->crtc_y;
+	crtc_w = state->crtc_w;
+	crtc_h = state->crtc_h;
+
+	src_x = state->src_x >> 16;
+	src_y = state->src_y >> 16;
+	src_w = state->src_w >> 16;
+	src_h = state->src_h >> 16;
+
 	actual_w = exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay);
 	actual_h = exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay);
 
@@ -85,46 +101,93 @@ static void exynos_plane_mode_set(struct drm_plane *plane,
 	}
 
 	/* set ratio */
-	exynos_plane->h_ratio = (src_w << 16) / crtc_w;
-	exynos_plane->v_ratio = (src_h << 16) / crtc_h;
+	exynos_state->h_ratio = (src_w << 16) / crtc_w;
+	exynos_state->v_ratio = (src_h << 16) / crtc_h;
 
 	/* set drm framebuffer data. */
-	exynos_plane->src_x = src_x;
-	exynos_plane->src_y = src_y;
-	exynos_plane->src_w = (actual_w * exynos_plane->h_ratio) >> 16;
-	exynos_plane->src_h = (actual_h * exynos_plane->v_ratio) >> 16;
+	exynos_state->src.x = src_x;
+	exynos_state->src.y = src_y;
+	exynos_state->src.w = (actual_w * exynos_state->h_ratio) >> 16;
+	exynos_state->src.h = (actual_h * exynos_state->v_ratio) >> 16;
 
 	/* set plane range to be displayed. */
-	exynos_plane->crtc_x = crtc_x;
-	exynos_plane->crtc_y = crtc_y;
-	exynos_plane->crtc_w = actual_w;
-	exynos_plane->crtc_h = actual_h;
+	exynos_state->crtc.x = crtc_x;
+	exynos_state->crtc.y = crtc_y;
+	exynos_state->crtc.w = actual_w;
+	exynos_state->crtc.h = actual_h;
 
 	DRM_DEBUG_KMS("plane : offset_x/y(%d,%d), width/height(%d,%d)",
-			exynos_plane->crtc_x, exynos_plane->crtc_y,
-			exynos_plane->crtc_w, exynos_plane->crtc_h);
+			exynos_state->crtc.x, exynos_state->crtc.y,
+			exynos_state->crtc.w, exynos_state->crtc.h);
+}
 
-	plane->crtc = crtc;
+static void exynos_drm_plane_reset(struct drm_plane *plane)
+{
+	struct exynos_drm_plane_state *exynos_state;
+
+	if (plane->state) {
+		exynos_state = to_exynos_plane_state(plane->state);
+		if (exynos_state->base.fb)
+			drm_framebuffer_unreference(exynos_state->base.fb);
+		kfree(exynos_state);
+		plane->state = NULL;
+	}
+
+	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
+	if (exynos_state) {
+		plane->state = &exynos_state->base;
+		plane->state->plane = plane;
+	}
+}
+
+static struct drm_plane_state *
+exynos_drm_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct exynos_drm_plane_state *exynos_state;
+	struct exynos_drm_plane_state *copy;
+
+	exynos_state = to_exynos_plane_state(plane->state);
+	copy = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
+	if (!copy)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
+	return &copy->base;
+}
+
+static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
+					   struct drm_plane_state *old_state)
+{
+	struct exynos_drm_plane_state *old_exynos_state =
+					to_exynos_plane_state(old_state);
+	__drm_atomic_helper_plane_destroy_state(plane, old_state);
+	kfree(old_exynos_state);
 }
 
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
 	.destroy	= drm_plane_cleanup,
-	.reset = drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	.reset		= exynos_drm_plane_reset,
+	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
+	.atomic_destroy_state = exynos_drm_plane_destroy_state,
 };
 
 static int exynos_plane_atomic_check(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_plane_state *exynos_state =
+						to_exynos_plane_state(state);
+	int ret = 0;
 
-	if (!state->fb)
+	if (!state->crtc || !state->fb)
 		return 0;
 
-	return 0;
+	/* translate state into exynos_state */
+	exynos_plane_mode_set(exynos_state);
+
+	return ret;
 }
 
 static void exynos_plane_atomic_update(struct drm_plane *plane,
@@ -137,12 +200,7 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 	if (!state->crtc)
 		return;
 
-	exynos_plane_mode_set(plane, state->crtc, state->fb,
-			      state->crtc_x, state->crtc_y,
-			      state->crtc_w, state->crtc_h,
-			      state->src_x >> 16, state->src_y >> 16,
-			      state->src_w >> 16, state->src_h >> 16);
-
+	plane->crtc = state->crtc;
 	exynos_plane->pending_fb = state->fb;
 
 	if (exynos_crtc->ops->update_plane)
@@ -159,8 +217,7 @@ static void exynos_plane_atomic_disable(struct drm_plane *plane,
 		return;
 
 	if (exynos_crtc->ops->disable_plane)
-		exynos_crtc->ops->disable_plane(exynos_crtc,
-						exynos_plane);
+		exynos_crtc->ops->disable_plane(exynos_crtc, exynos_plane);
 }
 
 static const struct drm_plane_helper_funcs plane_helper_funcs = {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index efb5d0435558..c3bd8cace37a 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -400,10 +400,11 @@ static void mixer_stop(struct mixer_context *ctx)
 static void vp_video_buffer(struct mixer_context *ctx,
 			    struct exynos_drm_plane *plane)
 {
+	struct exynos_drm_plane_state *state =
+				to_exynos_plane_state(plane->base.state);
 	struct mixer_resources *res = &ctx->mixer_res;
-	struct drm_plane_state *state = plane->base.state;
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_display_mode *mode = &state->crtc->mode;
+	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_display_mode *mode = &state->base.crtc->mode;
 	unsigned long flags;
 	dma_addr_t luma_addr[2], chroma_addr[2];
 	bool tiled_mode = false;
@@ -460,24 +461,24 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[0]) |
 		VP_IMG_VSIZE(fb->height / 2));
 
-	vp_reg_write(res, VP_SRC_WIDTH, plane->src_w);
-	vp_reg_write(res, VP_SRC_HEIGHT, plane->src_h);
+	vp_reg_write(res, VP_SRC_WIDTH, state->src.w);
+	vp_reg_write(res, VP_SRC_HEIGHT, state->src.h);
 	vp_reg_write(res, VP_SRC_H_POSITION,
-			VP_SRC_H_POSITION_VAL(plane->src_x));
-	vp_reg_write(res, VP_SRC_V_POSITION, plane->src_y);
+			VP_SRC_H_POSITION_VAL(state->src.x));
+	vp_reg_write(res, VP_SRC_V_POSITION, state->src.y);
 
-	vp_reg_write(res, VP_DST_WIDTH, plane->crtc_w);
-	vp_reg_write(res, VP_DST_H_POSITION, plane->crtc_x);
+	vp_reg_write(res, VP_DST_WIDTH, state->crtc.w);
+	vp_reg_write(res, VP_DST_H_POSITION, state->crtc.x);
 	if (ctx->interlace) {
-		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_h / 2);
-		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y / 2);
+		vp_reg_write(res, VP_DST_HEIGHT, state->crtc.h / 2);
+		vp_reg_write(res, VP_DST_V_POSITION, state->crtc.y / 2);
 	} else {
-		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_h);
-		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y);
+		vp_reg_write(res, VP_DST_HEIGHT, state->crtc.h);
+		vp_reg_write(res, VP_DST_V_POSITION, state->crtc.y);
 	}
 
-	vp_reg_write(res, VP_H_RATIO, plane->h_ratio);
-	vp_reg_write(res, VP_V_RATIO, plane->v_ratio);
+	vp_reg_write(res, VP_H_RATIO, state->h_ratio);
+	vp_reg_write(res, VP_V_RATIO, state->v_ratio);
 
 	vp_reg_write(res, VP_ENDIAN_MODE, VP_ENDIAN_MODE_LITTLE);
 
@@ -509,15 +510,18 @@ static void mixer_layer_update(struct mixer_context *ctx)
 static int mixer_setup_scale(const struct exynos_drm_plane *plane,
 		unsigned int *x_ratio, unsigned int *y_ratio)
 {
-	if (plane->crtc_w != plane->src_w) {
-		if (plane->crtc_w == 2 * plane->src_w)
+	struct exynos_drm_plane_state *state =
+				to_exynos_plane_state(plane->base.state);
+
+	if (state->crtc.w != state->src.w) {
+		if (state->crtc.w == 2 * state->src.w)
 			*x_ratio = 1;
 		else
 			goto fail;
 	}
 
-	if (plane->crtc_h != plane->src_h) {
-		if (plane->crtc_h == 2 * plane->src_h)
+	if (state->crtc.h != state->src.h) {
+		if (state->crtc.h == 2 * state->src.h)
 			*y_ratio = 1;
 		else
 			goto fail;
@@ -533,10 +537,11 @@ fail:
 static void mixer_graph_buffer(struct mixer_context *ctx,
 			       struct exynos_drm_plane *plane)
 {
+	struct exynos_drm_plane_state *state =
+				to_exynos_plane_state(plane->base.state);
 	struct mixer_resources *res = &ctx->mixer_res;
-	struct drm_plane_state *state = plane->base.state;
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_display_mode *mode = &state->crtc->mode;
+	struct drm_framebuffer *fb = state->base.fb;
+	struct drm_display_mode *mode = &state->base.crtc->mode;
 	unsigned long flags;
 	unsigned int win = plane->zpos;
 	unsigned int x_ratio = 0, y_ratio = 0;
@@ -572,13 +577,13 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	if (mixer_setup_scale(plane, &x_ratio, &y_ratio))
 		return;
 
-	dst_x_offset = plane->crtc_x;
-	dst_y_offset = plane->crtc_y;
+	dst_x_offset = state->crtc.x;
+	dst_y_offset = state->crtc.y;
 
 	/* converting dma address base and source offset */
 	dma_addr = exynos_drm_fb_dma_addr(fb, 0)
-		+ (plane->src_x * fb->bits_per_pixel >> 3)
-		+ (plane->src_y * fb->pitches[0]);
+		+ (state->src.x * fb->bits_per_pixel >> 3)
+		+ (state->src.y * fb->pitches[0]);
 	src_x_offset = 0;
 	src_y_offset = 0;
 
@@ -606,8 +611,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 		mixer_reg_write(res, MXR_RESOLUTION, val);
 	}
 
-	val  = MXR_GRP_WH_WIDTH(plane->src_w);
-	val |= MXR_GRP_WH_HEIGHT(plane->src_h);
+	val  = MXR_GRP_WH_WIDTH(state->src.w);
+	val |= MXR_GRP_WH_HEIGHT(state->src.h);
 	val |= MXR_GRP_WH_H_SCALE(x_ratio);
 	val |= MXR_GRP_WH_V_SCALE(y_ratio);
 	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
-- 
1.9.2
