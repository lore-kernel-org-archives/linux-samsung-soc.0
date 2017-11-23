From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2] drm/exynos: mixer: avoid Oops in vp_video_buffer()
Date: Thu, 23 Nov 2017 15:19:00 +0100
Message-ID: <20171123141900.30196-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:36458 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753094AbdKWOTH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 09:19:07 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

If an interlaced video mode is selected, a IOMMU pagefault is
triggered by vp_video_buffer().

Fix the most apparent bugs:
- pitch value for chroma plane
- divide by two of height and vpos

This is more like a band-aid at this point. The VP plane is
still corrupted, but at least there are no more pagefaults.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index dc5d79465f9b..a18426379e57 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -485,7 +485,7 @@ static void vp_video_buffer(struct mixer_context *ctx,
 			chroma_addr[1] = chroma_addr[0] + 0x40;
 		} else {
 			luma_addr[1] = luma_addr[0] + fb->pitches[0];
-			chroma_addr[1] = chroma_addr[0] + fb->pitches[0];
+			chroma_addr[1] = chroma_addr[0] + fb->pitches[1];
 		}
 	} else {
 		luma_addr[1] = 0;
@@ -507,25 +507,26 @@ static void vp_video_buffer(struct mixer_context *ctx,
 	vp_reg_write(ctx, VP_IMG_SIZE_Y, VP_IMG_HSIZE(fb->pitches[0]) |
 		VP_IMG_VSIZE(fb->height));
 	/* chroma plane for NV12/NV21 is half the height of the luma plane */
-	vp_reg_write(ctx, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[0]) |
+	vp_reg_write(ctx, VP_IMG_SIZE_C, VP_IMG_HSIZE(fb->pitches[1]) |
 		VP_IMG_VSIZE(fb->height / 2));
 
 	vp_reg_write(ctx, VP_SRC_WIDTH, state->src.w);
-	vp_reg_write(ctx, VP_SRC_HEIGHT, state->src.h);
 	vp_reg_write(ctx, VP_SRC_H_POSITION,
 			VP_SRC_H_POSITION_VAL(state->src.x));
-	vp_reg_write(ctx, VP_SRC_V_POSITION, state->src.y);
 
-	vp_reg_write(ctx, VP_DST_WIDTH, state->crtc.w);
-	vp_reg_write(ctx, VP_DST_H_POSITION, state->crtc.x);
 	if (test_bit(MXR_BIT_INTERLACE, &ctx->flags)) {
-		vp_reg_write(ctx, VP_DST_HEIGHT, state->crtc.h / 2);
-		vp_reg_write(ctx, VP_DST_V_POSITION, state->crtc.y / 2);
+		vp_reg_write(ctx, VP_SRC_HEIGHT, state->src.h / 2);
+		vp_reg_write(ctx, VP_SRC_V_POSITION, state->src.y / 2);
 	} else {
-		vp_reg_write(ctx, VP_DST_HEIGHT, state->crtc.h);
-		vp_reg_write(ctx, VP_DST_V_POSITION, state->crtc.y);
+		vp_reg_write(ctx, VP_SRC_HEIGHT, state->src.h);
+		vp_reg_write(ctx, VP_SRC_V_POSITION, state->src.y);
 	}
 
+	vp_reg_write(ctx, VP_DST_WIDTH, state->crtc.w);
+	vp_reg_write(ctx, VP_DST_H_POSITION, state->crtc.x);
+	vp_reg_write(ctx, VP_DST_HEIGHT, state->crtc.h);
+	vp_reg_write(ctx, VP_DST_V_POSITION, state->crtc.y);
+
 	vp_reg_write(ctx, VP_H_RATIO, state->h_ratio);
 	vp_reg_write(ctx, VP_V_RATIO, state->v_ratio);
 
-- 
2.13.5
