From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 3/3] drm/exynos: mixer: add 2x scaling to mixer_graph_buffer
Date: Tue,  7 Apr 2015 01:14:52 +0200
Message-ID: <1428362092-29826-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1428362092-29826-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57504 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752745AbbDFXOU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Apr 2015 19:14:20 -0400
In-Reply-To: <1428362092-29826-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo@padovan.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

While the VP (video processor) supports arbitrary scaling
of its input, the mixer just supports a simple 2x (line
doubling) scaling. Expose this functionality and exit
early when an unsupported scaling configuration is
encountered.

This was tested with modetest's DRM plane test (from
the libdrm test suite) on an Odroid-X2 (Exynos4412).

v2: Put if- and return-statement on different lines.

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 36 +++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 5ab0e32..f51011e 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -499,12 +499,36 @@ static void mixer_layer_update(struct mixer_context *ctx)
 	mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
 }
 
+static int mixer_setup_scale(const struct exynos_drm_plane *plane,
+		unsigned int *x_ratio, unsigned int *y_ratio)
+{
+	if (plane->crtc_width != plane->src_width) {
+		if (plane->crtc_width == 2 * plane->src_width)
+			*x_ratio = 1;
+		else
+			goto fail;
+	}
+
+	if (plane->crtc_height != plane->src_height) {
+		if (plane->crtc_height == 2 * plane->src_height)
+			*y_ratio = 1;
+		else
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	DRM_DEBUG_KMS("only 2x width/height scaling of plane supported\n");
+	return -ENOTSUPP;
+}
+
 static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
 	unsigned long flags;
 	struct exynos_drm_plane *plane;
-	unsigned int x_ratio, y_ratio;
+	unsigned int x_ratio = 0, y_ratio = 0;
 	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
 	dma_addr_t dma_addr;
 	unsigned int fmt;
@@ -528,9 +552,9 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 		fmt = ARGB8888;
 	}
 
-	/* 2x scaling feature */
-	x_ratio = 0;
-	y_ratio = 0;
+	/* check if mixer supports requested scaling setup */
+	if (mixer_setup_scale(plane, &x_ratio, &y_ratio))
+		return;
 
 	dst_x_offset = plane->crtc_x;
 	dst_y_offset = plane->crtc_y;
@@ -566,8 +590,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 		mixer_reg_write(res, MXR_RESOLUTION, val);
 	}
 
-	val  = MXR_GRP_WH_WIDTH(plane->crtc_width);
-	val |= MXR_GRP_WH_HEIGHT(plane->crtc_height);
+	val  = MXR_GRP_WH_WIDTH(plane->src_width);
+	val |= MXR_GRP_WH_HEIGHT(plane->src_height);
 	val |= MXR_GRP_WH_H_SCALE(x_ratio);
 	val |= MXR_GRP_WH_V_SCALE(y_ratio);
 	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
-- 
2.0.5
