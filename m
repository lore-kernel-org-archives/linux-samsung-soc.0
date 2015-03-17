From: Daniel Stone <daniels@collabora.com>
Subject: [PATCH] drm: Exynos: Respect framebuffer pitch for FIMD/Mixer
Date: Tue, 17 Mar 2015 13:24:58 +0000
Message-ID: <1426598698-31095-1-git-send-email-daniels@collabora.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:53347 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681AbbCQNZD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 09:25:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, t.stanislaws@samsung.com

When performing a modeset, use the framebuffer pitch value to set FIMD
IMG_SIZE and Mixer SPAN registers. These are both defined as pitch - the
distance between contiguous lines (bytes for FIMD, pixels for mixer).

Fixes display on Snow (1366x768).

Signed-off-by: Daniel Stone <daniels@collabora.com>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |  8 +++++---
 drivers/gpu/drm/exynos/exynos_mixer.c    | 17 ++++++++++-------
 2 files changed, 15 insertions(+), 10 deletions(-)

The VP parts are untested as I don't have Exynos4 hardware, and the
spec is uselessly vague. It does seem to look like the right fix however,
and in the case where the buffer is naturally aligned (pitch == width*bpp),
there should be no change, as bpp==8 for video buffers.

FIMD/GRP and Mixer behaviour have been manually verified on Snow (5250
with eDP/LVDS bridge and HDMI out).

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 925fc69..0d5681f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -147,6 +147,7 @@ struct fimd_win_data {
 	unsigned int		ovl_height;
 	unsigned int		fb_width;
 	unsigned int		fb_height;
+	unsigned int		fb_pitch;
 	unsigned int		bpp;
 	unsigned int		pixel_format;
 	dma_addr_t		dma_addr;
@@ -537,13 +538,14 @@ static void fimd_win_mode_set(struct exynos_drm_crtc *crtc,
 	win_data->offset_y = plane->crtc_y;
 	win_data->ovl_width = plane->crtc_width;
 	win_data->ovl_height = plane->crtc_height;
+	win_data->fb_pitch = plane->pitch;
 	win_data->fb_width = plane->fb_width;
 	win_data->fb_height = plane->fb_height;
 	win_data->dma_addr = plane->dma_addr[0] + offset;
 	win_data->bpp = plane->bpp;
 	win_data->pixel_format = plane->pixel_format;
-	win_data->buf_offsize = (plane->fb_width - plane->crtc_width) *
-				(plane->bpp >> 3);
+	win_data->buf_offsize =
+		plane->pitch - (plane->crtc_width * (plane->bpp >> 3));
 	win_data->line_size = plane->crtc_width * (plane->bpp >> 3);
 
 	DRM_DEBUG_KMS("offset_x = %d, offset_y = %d\n",
@@ -709,7 +711,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
 
 	/* buffer end address */
-	size = win_data->fb_width * win_data->ovl_height * (win_data->bpp >> 3);
+	size = win_data->fb_pitch * win_data->ovl_height * (win_data->bpp >> 3);
 	val = (unsigned long)(win_data->dma_addr + size);
 	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 3518bc4..2e3bc57 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -55,6 +55,7 @@ struct hdmi_win_data {
 	unsigned int		fb_x;
 	unsigned int		fb_y;
 	unsigned int		fb_width;
+	unsigned int		fb_pitch;
 	unsigned int		fb_height;
 	unsigned int		src_width;
 	unsigned int		src_height;
@@ -438,7 +439,7 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	} else {
 		luma_addr[0] = win_data->dma_addr;
 		chroma_addr[0] = win_data->dma_addr
-			+ (win_data->fb_width * win_data->fb_height);
+			+ (win_data->fb_pitch * win_data->fb_height);
 	}
 
 	if (win_data->scan_flags & DRM_MODE_FLAG_INTERLACE) {
@@ -447,8 +448,8 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 			luma_addr[1] = luma_addr[0] + 0x40;
 			chroma_addr[1] = chroma_addr[0] + 0x40;
 		} else {
-			luma_addr[1] = luma_addr[0] + win_data->fb_width;
-			chroma_addr[1] = chroma_addr[0] + win_data->fb_width;
+			luma_addr[1] = luma_addr[0] + win_data->fb_pitch;
+			chroma_addr[1] = chroma_addr[0] + win_data->fb_pitch;
 		}
 	} else {
 		ctx->interlace = false;
@@ -469,10 +470,10 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);
 
 	/* setting size of input image */
-	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(win_data->fb_width) |
+	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(win_data->fb_pitch) |
 		VP_IMG_VSIZE(win_data->fb_height));
 	/* chroma height has to reduced by 2 to avoid chroma distorions */
-	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(win_data->fb_width) |
+	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(win_data->fb_pitch) |
 		VP_IMG_VSIZE(win_data->fb_height / 2));
 
 	vp_reg_write(res, VP_SRC_WIDTH, win_data->src_width);
@@ -559,7 +560,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 	/* converting dma address base and source offset */
 	dma_addr = win_data->dma_addr
 		+ (win_data->fb_x * win_data->bpp >> 3)
-		+ (win_data->fb_y * win_data->fb_width * win_data->bpp >> 3);
+		+ (win_data->fb_y * win_data->fb_pitch);
 	src_x_offset = 0;
 	src_y_offset = 0;
 
@@ -576,7 +577,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 		MXR_GRP_CFG_FORMAT_VAL(fmt), MXR_GRP_CFG_FORMAT_MASK);
 
 	/* setup geometry */
-	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), win_data->fb_width);
+	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win),
+			win_data->fb_pitch / (win_data->bpp >> 3));
 
 	/* setup display size */
 	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
@@ -961,6 +963,7 @@ static void mixer_win_mode_set(struct exynos_drm_crtc *crtc,
 	win_data->fb_y = plane->fb_y;
 	win_data->fb_width = plane->fb_width;
 	win_data->fb_height = plane->fb_height;
+	win_data->fb_pitch = plane->pitch;
 	win_data->src_width = plane->src_width;
 	win_data->src_height = plane->src_height;
 
-- 
2.3.2
