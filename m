From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3] drm/exynos: mixer: cleanup pixelformat handling
Date: Mon, 27 Apr 2015 23:11:59 +0200
Message-ID: <1430169119-5015-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49468 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965133AbbD0VME (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 17:12:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Move the defines for the pixelformats that the mixer supports out
of mixer_graph_buffer() to the top of the source.
Then select the mixer pixelformat (pf) in mixer_graph_buffer() based on
the plane's pf (and not bpp).
Also add handling of RGB565 and XRGB1555 to the switch statement and
exit early if the plane has an unsupported pf.

Partially based on 'drm/exynos: enable/disable blend based on pixel
format' by Gustavo Padovan <gustavo.padovan@collabora.co.uk>.

v2: Use the shorter MXR_FORMAT as prefix.
v3: Re-add ARGB8888 because of compatibility reasons
    (suggested by Joonyoung Shim).

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index fbec750..0474fd3 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -44,6 +44,12 @@
 #define MIXER_WIN_NR		3
 #define MIXER_DEFAULT_WIN	0
 
+/* The pixelformats that are natively supported by the mixer. */
+#define MXR_FORMAT_RGB565	4
+#define MXR_FORMAT_ARGB1555	5
+#define MXR_FORMAT_ARGB4444	6
+#define MXR_FORMAT_ARGB8888	7
+
 struct mixer_resources {
 	int			irq;
 	void __iomem		*mixer_regs;
@@ -531,20 +537,27 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 
 	plane = &ctx->planes[win];
 
-	#define RGB565 4
-	#define ARGB1555 5
-	#define ARGB4444 6
-	#define ARGB8888 7
+	switch (plane->pixel_format) {
+	case DRM_FORMAT_XRGB4444:
+		fmt = MXR_FORMAT_ARGB4444;
+		break;
+
+	case DRM_FORMAT_XRGB1555:
+		fmt = MXR_FORMAT_ARGB1555;
+		break;
 
-	switch (plane->bpp) {
-	case 16:
-		fmt = ARGB4444;
+	case DRM_FORMAT_RGB565:
+		fmt = MXR_FORMAT_RGB565;
 		break;
-	case 32:
-		fmt = ARGB8888;
+
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+		fmt = MXR_FORMAT_ARGB8888;
 		break;
+
 	default:
-		fmt = ARGB8888;
+		DRM_DEBUG_KMS("pixelformat unsupported by mixer\n");
+		return;
 	}
 
 	/* check if mixer supports requested scaling setup */
-- 
2.0.5
