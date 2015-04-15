From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 6/6] drm/exynos: mixer: add more pixel formats
Date: Wed, 15 Apr 2015 17:02:00 +0200
Message-ID: <1429110120-7043-7-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56672 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755663AbbDOPEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Apr 2015 11:04:21 -0400
In-Reply-To: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The mixer natively support RGB565, ARGB4444 and ARGB1555
so expose these formats. Also, since being of 16-bit size,
these formats have a lower bandwidth requirement, making
them useful in situations where this is a bottleneck.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 512f7b3..7dec7c7 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -127,6 +127,11 @@ static const u8 filter_cr_horiz_tap4[] = {
 static const uint32_t mixer_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB4444,
 };
 
 static const uint32_t vp_formats[] = {
@@ -556,30 +561,32 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 	unsigned int x_ratio = 0, y_ratio = 0;
 	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
 	dma_addr_t dma_addr;
-	unsigned int fmt, blend;
+	unsigned int fmt, blend = 0;
 	u32 val;
 
 	plane = &ctx->planes[win];
 
 	switch (plane->pixel_format) {
 	case DRM_FORMAT_ARGB4444:
-		fmt = MIXER_PIXELFORMAT_ARGB4444;
 		blend = 1;
+	case DRM_FORMAT_XRGB4444:
+		fmt = MIXER_PIXELFORMAT_ARGB4444;
 		break;
 
 	case DRM_FORMAT_ARGB8888:
-		fmt = MIXER_PIXELFORMAT_ARGB8888;
 		blend = 1;
-		break;
-
 	case DRM_FORMAT_XRGB8888:
 		fmt = MIXER_PIXELFORMAT_ARGB8888;
-		blend = 0;
+		break;
+
+	case DRM_FORMAT_ARGB1555:
+		blend = 1;
+	case DRM_FORMAT_XRGB1555:
+		fmt = MIXER_PIXELFORMAT_ARGB1555;
 		break;
 
 	case DRM_FORMAT_RGB565:
 		fmt = MIXER_PIXELFORMAT_RGB565;
-		blend = 0;
 		break;
 
 	default:
-- 
2.0.5
