From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 3/9] drm/exynos: mixer: simplify vp_video_buffer()
Date: Tue, 22 Aug 2017 16:19:38 +0200
Message-ID: <20170822141944.8138-4-tjakobi@math.uni-bielefeld.de>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55859 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932510AbdHVOUl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 10:20:41 -0400
In-Reply-To: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

DRM core already checks in drm_atomic_plane_check() if the
pixelformat is valid. Hence we can drop the default case of
the switch statement and collapse most of the code.

Also rename the two booleans to reflect what true/false
actually means, and to avoid mixing CrCb/NV21 descriptions.

No functional change.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 4c894d97aba3..beef4d6c41ca 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -484,32 +484,18 @@ static void vp_video_buffer(struct mixer_context *ctx,
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
@@ -529,8 +515,8 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_LINE_SKIP);
 
 	/* setup format */
-	val = (crcb_mode ? VP_MODE_NV21 : VP_MODE_NV12);
-	val |= (tiled_mode ? VP_MODE_MEM_TILED : VP_MODE_MEM_LINEAR);
+	val = (is_nv21 ? VP_MODE_NV21 : VP_MODE_NV12);
+	val |= (is_tiled ? VP_MODE_MEM_TILED : VP_MODE_MEM_LINEAR);
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);
 
 	/* setting size of input image */
-- 
2.13.0
