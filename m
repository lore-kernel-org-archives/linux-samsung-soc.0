From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/2] drm/exynos: mixer: cleanup pixelformat handling
Date: Thu, 23 Apr 2015 14:12:25 +0200
Message-ID: <1429791146-4410-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42206 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965508AbbDWMM0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 08:12:26 -0400
In-Reply-To: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index fbec750..1bd23ee 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -44,6 +44,12 @@
 #define MIXER_WIN_NR		3
 #define MIXER_DEFAULT_WIN	0
 
+/* The pixelformats that are natively supported by the mixer. */
+#define MIXER_PIXELFORMAT_RGB565 4
+#define MIXER_PIXELFORMAT_ARGB1555 5
+#define MIXER_PIXELFORMAT_ARGB4444 6
+#define MIXER_PIXELFORMAT_ARGB8888 7
+
 struct mixer_resources {
 	int			irq;
 	void __iomem		*mixer_regs;
@@ -531,20 +537,26 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 
 	plane = &ctx->planes[win];
 
-	#define RGB565 4
-	#define ARGB1555 5
-	#define ARGB4444 6
-	#define ARGB8888 7
+	switch (plane->pixel_format) {
+	case DRM_FORMAT_XRGB4444:
+		fmt = MIXER_PIXELFORMAT_ARGB4444;
+		break;
+
+	case DRM_FORMAT_XRGB1555:
+		fmt = MIXER_PIXELFORMAT_ARGB1555;
+		break;
 
-	switch (plane->bpp) {
-	case 16:
-		fmt = ARGB4444;
+	case DRM_FORMAT_RGB565:
+		fmt = MIXER_PIXELFORMAT_RGB565;
 		break;
-	case 32:
-		fmt = ARGB8888;
+
+	case DRM_FORMAT_XRGB8888:
+		fmt = MIXER_PIXELFORMAT_ARGB8888;
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
