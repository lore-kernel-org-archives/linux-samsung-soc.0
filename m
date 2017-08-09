From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 4/8] drm/exynos: mixer: remove src offset from mixer_graph_buffer()
Date: Wed,  9 Aug 2017 13:48:53 +0200
Message-ID: <20170809114857.4945-5-tjakobi@math.uni-bielefeld.de>
References: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55080 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752260AbdHILuP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 07:50:15 -0400
In-Reply-To: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

We always translate the dma address such that the offsets of
the source image are zero. Hence we can remove manipulation of
the MXR_GRAPHIC_SXY(win) register.

We leave the register defines (in regs_mixer.h) in place, since
they document the hardware.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 8d68de85bada..28fbe79befff 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -584,7 +584,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	unsigned long flags;
 	unsigned int win = plane->index;
 	unsigned int x_ratio = 0, y_ratio = 0;
-	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
+	unsigned int dst_x_offset, dst_y_offset;
 	dma_addr_t dma_addr;
 	unsigned int fmt;
 	u32 val;
@@ -618,12 +618,10 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	dst_x_offset = state->crtc.x;
 	dst_y_offset = state->crtc.y;
 
-	/* converting dma address base and source offset */
+	/* translate dma address base s.t. the source image offset is zero */
 	dma_addr = exynos_drm_fb_dma_addr(fb, 0)
 		+ (state->src.x * fb->format->cpp[0])
 		+ (state->src.y * fb->pitches[0]);
-	src_x_offset = 0;
-	src_y_offset = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		__set_bit(MXR_BIT_INTERLACE, &ctx->flags);
@@ -654,11 +652,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 	val |= MXR_GRP_WH_V_SCALE(y_ratio);
 	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
 
-	/* setup offsets in source image */
-	val  = MXR_GRP_SXY_SX(src_x_offset);
-	val |= MXR_GRP_SXY_SY(src_y_offset);
-	mixer_reg_write(res, MXR_GRAPHIC_SXY(win), val);
-
 	/* setup offsets in display image */
 	val  = MXR_GRP_DXY_DX(dst_x_offset);
 	val |= MXR_GRP_DXY_DY(dst_y_offset);
-- 
2.13.0
