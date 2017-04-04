From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 3/8] drm/exynos: mixer: simplify {vp_video,mixer_graph}_buffer()
Date: Tue,  4 Apr 2017 16:02:56 +0200
Message-ID: <1491314581-18086-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1491314581-18086-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40552 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754278AbdDDODu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 10:03:50 -0400
In-Reply-To: <1491314581-18086-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

DRM core already checks the validity of the pixelformats, to we
can simplify the checks here. The same applies to the FB modifier,
which is now check in common Exynos plane code.

Also rename the booleans to reflect what true/false actually
encodes.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 35edbf2..32970fb 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -485,32 +485,18 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	unsigned int priority = state->base.normalized_zpos + 1;
 	unsigned long flags;
 	dma_addr_t luma_addr[2], chroma_addr[2];
-	bool tiled_mode = false;
-	bool crcb_mode = false;
+	bool is_tiled, is_nv21;
 	u32 val;
 
-	switch (fb->format->format) {
-	case DRM_FORMAT_NV12:
-		crcb_mode = false;
-		break;
-	case DRM_FORMAT_NV21:
-		crcb_mode = true;
-		break;
-	default:
-		DRM_ERROR("pixel format for vp is wrong [%d].\n",
-				fb->format->format);
-		return;
-	}
-
-	if (fb->modifier == DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
-		tiled_mode = true;
+	is_nv21 = (fb->format->format == DRM_FORMAT_NV21);
+	is_tiled = (fb->modifier == DRM_FORMAT_MOD_SAMSUNG_64_32_TILE);
 
 	luma_addr[0] = exynos_drm_fb_dma_addr(fb, 0);
 	chroma_addr[0] = exynos_drm_fb_dma_addr(fb, 1);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
-		if (tiled_mode) {
+		if (is_tiled) {
 			luma_addr[1] = luma_addr[0] + 0x40;
 			chroma_addr[1] = chroma_addr[0] + 0x40;
 		} else {
@@ -530,8 +516,8 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_LINE_SKIP);
 
 	/* setup format */
-	val = (crcb_mode ? VP_MODE_NV21 : VP_MODE_NV12);
-	val |= (tiled_mode ? VP_MODE_MEM_TILED : VP_MODE_MEM_LINEAR);
+	val = (is_nv21 ? VP_MODE_NV21 : VP_MODE_NV12);
+	val |= (is_tiled ? VP_MODE_MEM_TILED : VP_MODE_MEM_LINEAR);
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);
 
 	/* setting size of input image */
@@ -621,12 +607,9 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
+	default:
 		fmt = MXR_FORMAT_ARGB8888;
 		break;
-
-	default:
-		DRM_DEBUG_KMS("pixelformat unsupported by mixer\n");
-		return;
 	}
 
 	/* ratio is already checked by common plane code */
-- 
2.7.3
