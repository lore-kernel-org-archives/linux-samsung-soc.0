From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 2/2] drm/exynos: mixer: remove buffer count handling in vp_video_buffer()
Date: Sat, 25 Apr 2015 22:31:54 +0200
Message-ID: <1429993914-2708-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429993914-2708-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45802 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750768AbbDYUcc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Apr 2015 16:32:32 -0400
In-Reply-To: <1429993914-2708-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The video processor (VP) supports four formats: NV12, NV21 and its
tiled variants. All these formats are bi-planar, so the buffer
count in vp_video_buffer() is always 2.

While we're at it, also add support for NV21 and properly exit
if we're called with an invalid (non-VP) pixelformat.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 534a594..6fb4faa 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -388,7 +388,6 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	struct mixer_resources *res = &ctx->mixer_res;
 	unsigned long flags;
 	struct exynos_drm_plane *plane;
-	unsigned int buf_num = 1;
 	dma_addr_t luma_addr[2], chroma_addr[2];
 	bool tiled_mode = false;
 	bool crcb_mode = false;
@@ -399,27 +398,18 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	switch (plane->pixel_format) {
 	case DRM_FORMAT_NV12:
 		crcb_mode = false;
-		buf_num = 2;
 		break;
-	/* TODO: single buffer format NV12, NV21 */
+	case DRM_FORMAT_NV21:
+		crcb_mode = true;
+		break;
 	default:
-		/* ignore pixel format at disable time */
-		if (!plane->dma_addr[0])
-			break;
-
 		DRM_ERROR("pixel format for vp is wrong [%d].\n",
 				plane->pixel_format);
 		return;
 	}
 
-	if (buf_num == 2) {
-		luma_addr[0] = plane->dma_addr[0];
-		chroma_addr[0] = plane->dma_addr[1];
-	} else {
-		luma_addr[0] = plane->dma_addr[0];
-		chroma_addr[0] = plane->dma_addr[0]
-			+ (plane->pitch * plane->fb_height);
-	}
+	luma_addr[0] = plane->dma_addr[0];
+	chroma_addr[0] = plane->dma_addr[1];
 
 	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
 		ctx->interlace = true;
-- 
2.0.5
