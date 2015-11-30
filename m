From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 06/22] drm/exynos: move dma_addr attribute from exynos plane
 to exynos fb
Date: Mon, 30 Nov 2015 14:53:21 +0100
Message-ID: <1448891617-18830-7-git-send-email-m.szyprowski@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53289 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753897AbbK3Nxv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:53:51 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM00BTBRXNY7B0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Nov 2015 13:53:47 +0000 (GMT)
In-reply-to: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

DMA address is a framebuffer attribute and the right place for it is
exynos_drm_framebuffer not exynos_drm_plane. This patch also introduces
helper function for getting dma address of the given framebuffer.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 13 ++++++++-----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 16 +++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  3 ---
 drivers/gpu/drm/exynos/exynos_drm_fb.c        | 16 ++++++----------
 drivers/gpu/drm/exynos/exynos_drm_fb.h        |  3 +--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 ++++++----
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 18 ------------------
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  5 ++++-
 drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++---
 9 files changed, 38 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index edfd6e390ef7..320efc3d0659 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -21,6 +21,7 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_fb.h"
 #include "exynos_drm_plane.h"
 #include "exynos_drm_iommu.h"
 
@@ -261,9 +262,11 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_plane_state *state = plane->base.state;
+	struct drm_framebuffer *fb = state->fb;
 	unsigned int win = plane->zpos;
-	unsigned int bpp = state->fb->bits_per_pixel >> 3;
-	unsigned int pitch = state->fb->pitches[0];
+	unsigned int bpp = fb->bits_per_pixel >> 3;
+	unsigned int pitch = fb->pitches[0];
+	dma_addr_t dma_addr = exynos_drm_fb_dma_addr(fb, 0);
 	u32 val;
 
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
@@ -284,9 +287,9 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 		VIDOSD_Wx_ALPHA_B_F(0x0);
 	writel(val, ctx->addr + DECON_VIDOSDxD(win));
 
-	writel(plane->dma_addr[0], ctx->addr + DECON_VIDW0xADD0B0(win));
+	writel(dma_addr, ctx->addr + DECON_VIDW0xADD0B0(win));
 
-	val = plane->dma_addr[0] + pitch * plane->crtc_h;
+	val = dma_addr + pitch * plane->crtc_h;
 	writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
 
 	if (ctx->out_type != IFTYPE_HDMI)
@@ -297,7 +300,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 			| BIT_VAL(plane->crtc_w * bpp, 14, 0);
 	writel(val, ctx->addr + DECON_VIDW0xADD2(win));
 
-	decon_win_set_pixfmt(ctx, win, state->fb);
+	decon_win_set_pixfmt(ctx, win, fb);
 
 	/* window enable */
 	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, ~0);
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 4db04f244c17..1629732574e0 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -30,6 +30,7 @@
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_plane.h"
 #include "exynos_drm_drv.h"
+#include "exynos_drm_fb.h"
 #include "exynos_drm_fbdev.h"
 #include "exynos_drm_iommu.h"
 
@@ -395,13 +396,14 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_plane_state *state = plane->base.state;
+	struct drm_framebuffer *fb = state->fb;
 	int padding;
 	unsigned long val, alpha;
 	unsigned int last_x;
 	unsigned int last_y;
 	unsigned int win = plane->zpos;
-	unsigned int bpp = state->fb->bits_per_pixel >> 3;
-	unsigned int pitch = state->fb->pitches[0];
+	unsigned int bpp = fb->bits_per_pixel >> 3;
+	unsigned int pitch = fb->pitches[0];
 
 	if (ctx->suspended)
 		return;
@@ -417,14 +419,14 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	 */
 
 	/* buffer start address */
-	val = (unsigned long)plane->dma_addr[0];
+	val = (unsigned long)exynos_drm_fb_dma_addr(fb, 0);
 	writel(val, ctx->regs + VIDW_BUF_START(win));
 
-	padding = (pitch / bpp) - state->fb->width;
+	padding = (pitch / bpp) - fb->width;
 
 	/* buffer size */
-	writel(state->fb->width + padding, ctx->regs + VIDW_WHOLE_X(win));
-	writel(state->fb->height, ctx->regs + VIDW_WHOLE_Y(win));
+	writel(fb->width + padding, ctx->regs + VIDW_WHOLE_X(win));
+	writel(fb->height, ctx->regs + VIDW_WHOLE_Y(win));
 
 	/* offset from the start of the buffer to read */
 	writel(plane->src_x, ctx->regs + VIDW_OFFSET_X(win));
@@ -466,7 +468,7 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 
 	writel(alpha, ctx->regs + VIDOSD_D(win));
 
-	decon_win_set_pixfmt(ctx, win, state->fb);
+	decon_win_set_pixfmt(ctx, win, fb);
 
 	/* hardware window 0 doesn't support color key. */
 	if (win != 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index f1eda7fa4e3c..dc41ffb26eb9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -54,8 +54,6 @@ enum exynos_drm_output_type {
  * @crtc_h: window height to be displayed (hardware screen).
  * @h_ratio: horizontal scaling ratio, 16.16 fixed point
  * @v_ratio: vertical scaling ratio, 16.16 fixed point
- * @dma_addr: array of bus(accessed by dma) address to the memory region
- *	      allocated for a overlay.
  * @zpos: order of overlay layer(z position).
  *
  * this structure is common to exynos SoC and its contents would be copied
@@ -74,7 +72,6 @@ struct exynos_drm_plane {
 	unsigned int crtc_h;
 	unsigned int h_ratio;
 	unsigned int v_ratio;
-	dma_addr_t dma_addr[MAX_FB_BUFFER];
 	unsigned int zpos;
 	struct drm_framebuffer *pending_fb;
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 49b9bc302e87..f6bdb0d6f142 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -37,6 +37,7 @@
 struct exynos_drm_fb {
 	struct drm_framebuffer	fb;
 	struct exynos_drm_gem	*exynos_gem[MAX_FB_BUFFER];
+	dma_addr_t			dma_addr[MAX_FB_BUFFER];
 };
 
 static int check_fb_gem_memory_type(struct drm_device *drm_dev,
@@ -135,6 +136,8 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 			goto err;
 
 		exynos_fb->exynos_gem[i] = exynos_gem[i];
+		exynos_fb->dma_addr[i] = exynos_gem[i]->dma_addr
+						+ mode_cmd->offsets[i];
 	}
 
 	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
@@ -189,21 +192,14 @@ err:
 	return ERR_PTR(ret);
 }
 
-struct exynos_drm_gem *exynos_drm_fb_gem(struct drm_framebuffer *fb, int index)
+dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)
 {
 	struct exynos_drm_fb *exynos_fb = to_exynos_fb(fb);
-	struct exynos_drm_gem *exynos_gem;
 
 	if (index >= MAX_FB_BUFFER)
-		return NULL;
+		return DMA_ERROR_CODE;
 
-	exynos_gem = exynos_fb->exynos_gem[index];
-	if (!exynos_gem)
-		return NULL;
-
-	DRM_DEBUG_KMS("dma_addr: 0x%lx\n", (unsigned long)exynos_gem->dma_addr);
-
-	return exynos_gem;
+	return exynos_fb->dma_addr[index];
 }
 
 static void exynos_drm_output_poll_changed(struct drm_device *dev)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exynos/exynos_drm_fb.h
index a8a75ac87e59..4aae9dd2b0d1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
@@ -22,8 +22,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 			    struct exynos_drm_gem **exynos_gem,
 			    int count);
 
-/* get gem object of a drm framebuffer */
-struct exynos_drm_gem *exynos_drm_fb_gem(struct drm_framebuffer *fb, int index);
+dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index);
 
 void exynos_drm_mode_config_init(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2c383238efff..ffcc498f5afe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -29,6 +29,7 @@
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
+#include "exynos_drm_fb.h"
 #include "exynos_drm_fbdev.h"
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_plane.h"
@@ -642,12 +643,13 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 {
 	struct fimd_context *ctx = crtc->ctx;
 	struct drm_plane_state *state = plane->base.state;
+	struct drm_framebuffer *fb = state->fb;
 	dma_addr_t dma_addr;
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
 	unsigned int win = plane->zpos;
-	unsigned int bpp = state->fb->bits_per_pixel >> 3;
-	unsigned int pitch = state->fb->pitches[0];
+	unsigned int bpp = fb->bits_per_pixel >> 3;
+	unsigned int pitch = fb->pitches[0];
 
 	if (ctx->suspended)
 		return;
@@ -656,7 +658,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 	offset += plane->src_y * pitch;
 
 	/* buffer start address */
-	dma_addr = plane->dma_addr[0] + offset;
+	dma_addr = exynos_drm_fb_dma_addr(fb, 0) + offset;
 	val = (unsigned long)dma_addr;
 	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
 
@@ -712,7 +714,7 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc,
 		DRM_DEBUG_KMS("osd size = 0x%x\n", (unsigned int)val);
 	}
 
-	fimd_win_set_pixfmt(ctx, win, state->fb);
+	fimd_win_set_pixfmt(ctx, win, fb);
 
 	/* hardware window 0 doesn't support color key. */
 	if (win != 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 179311760bb7..c725409421b8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -120,28 +120,10 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	int nr;
-	int i;
 
 	if (!state->fb)
 		return 0;
 
-	nr = drm_format_num_planes(state->fb->pixel_format);
-	for (i = 0; i < nr; i++) {
-		struct exynos_drm_gem *exynos_gem =
-					exynos_drm_fb_gem(state->fb, i);
-		if (!exynos_gem) {
-			DRM_DEBUG_KMS("gem object is null\n");
-			return -EFAULT;
-		}
-
-		exynos_plane->dma_addr[i] = exynos_gem->dma_addr +
-					    state->fb->offsets[i];
-
-		DRM_DEBUG_KMS("buffer: %d, dma_addr = 0x%lx\n",
-				i, (unsigned long)exynos_plane->dma_addr[i]);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 669362c53f49..3ce141236fad 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -24,6 +24,7 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_fb.h"
 #include "exynos_drm_plane.h"
 #include "exynos_drm_vidi.h"
 
@@ -126,11 +127,13 @@ static void vidi_update_plane(struct exynos_drm_crtc *crtc,
 			      struct exynos_drm_plane *plane)
 {
 	struct vidi_context *ctx = crtc->ctx;
+	dma_addr_t addr;
 
 	if (ctx->suspended)
 		return;
 
-	DRM_DEBUG_KMS("dma_addr = %pad\n", plane->dma_addr);
+	addr = exynos_drm_fb_dma_addr(plane->base.fb, 0);
+	DRM_DEBUG_KMS("dma_addr = %pad\n", &addr);
 
 	if (ctx->vblank_on)
 		schedule_work(&ctx->work);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 47777be1a754..f40de82848dc 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -37,6 +37,7 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_fb.h"
 #include "exynos_drm_plane.h"
 #include "exynos_drm_iommu.h"
 
@@ -422,8 +423,8 @@ static void vp_video_buffer(struct mixer_context *ctx,
 		return;
 	}
 
-	luma_addr[0] = plane->dma_addr[0];
-	chroma_addr[0] = plane->dma_addr[1];
+	luma_addr[0] = exynos_drm_fb_dma_addr(fb, 0);
+	chroma_addr[0] = exynos_drm_fb_dma_addr(fb, 1);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		ctx->interlace = true;
@@ -575,7 +576,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	dst_y_offset = plane->crtc_y;
 
 	/* converting dma address base and source offset */
-	dma_addr = plane->dma_addr[0]
+	dma_addr = exynos_drm_fb_dma_addr(fb, 0)
 		+ (plane->src_x * fb->bits_per_pixel >> 3)
 		+ (plane->src_y * fb->pitches[0]);
 	src_x_offset = 0;
-- 
1.9.2
