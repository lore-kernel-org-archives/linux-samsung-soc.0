From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/3] drm/exynos: mixer: add 2x scaling to mixer_graph_buffer
Date: Thu, 26 Mar 2015 00:17:18 +0100
Message-ID: <1427325438-3791-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49664 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750821AbbCYXRZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Mar 2015 19:17:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

While the VP (video processor) supports arbitrary scaling
of its input, the mixer just supports a simple 2x (line
doubling) scaling. Expose this functionality and exit
early when an unsupported scaling configuration is
encountered.

This was tested with modetest's DRM plane test (from
the libdrm test suite) on an Odroid-X2 (Exynos4412).

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 38 +++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index df547b6..7c38d3b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -521,12 +521,37 @@ static void mixer_layer_update(struct mixer_context *ctx)
 	mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
 }
 
+static int mixer_setup_scale(unsigned int src_w, unsigned int src_h,
+	unsigned int dst_w, unsigned int dst_h,
+	unsigned int *scale_w, unsigned int *scale_h)
+{
+	if (dst_w != src_w) {
+		if (dst_w == 2 * src_w)
+			*scale_w = 1;
+		else
+			goto fail;
+	}
+
+	if (dst_h != src_h) {
+		if (dst_h == 2 * src_h)
+			*scale_h = 1;
+		else
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	DRM_DEBUG_KMS("only 2x width/height scaling of plane supported\n");
+	return -1;
+}
+
 static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
 	unsigned long flags;
 	struct hdmi_win_data *win_data;
-	unsigned int x_ratio, y_ratio;
+	unsigned int x_ratio = 0, y_ratio = 0;
 	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
 	dma_addr_t dma_addr;
 	unsigned int fmt;
@@ -550,9 +575,10 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 		fmt = ARGB8888;
 	}
 
-	/* 2x scaling feature */
-	x_ratio = 0;
-	y_ratio = 0;
+	/* check if mixer supports scaling setup */
+	if (mixer_setup_scale(win_data->src_width, win_data->src_height,
+		win_data->crtc_width, win_data->crtc_height,
+		&x_ratio, &y_ratio)) return;
 
 	dst_x_offset = win_data->crtc_x;
 	dst_y_offset = win_data->crtc_y;
@@ -588,8 +614,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 		mixer_reg_write(res, MXR_RESOLUTION, val);
 	}
 
-	val  = MXR_GRP_WH_WIDTH(win_data->crtc_width);
-	val |= MXR_GRP_WH_HEIGHT(win_data->crtc_height);
+	val  = MXR_GRP_WH_WIDTH(win_data->src_width);
+	val |= MXR_GRP_WH_HEIGHT(win_data->src_height);
 	val |= MXR_GRP_WH_H_SCALE(x_ratio);
 	val |= MXR_GRP_WH_V_SCALE(y_ratio);
 	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
-- 
2.0.5
