From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 1/2] drm/exynos: mixer: move pixelformat defines
Date: Wed, 15 Apr 2015 21:54:51 +0200
Message-ID: <1429127692-5772-2-git-send-email-tjakobi__15093.1908320219$1429194388$gmane$org@math.uni-bielefeld.de>
References: <1429127692-5772-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:58434 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753668AbbDPO0J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 10:26:09 -0400
In-Reply-To: <1429127692-5772-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Move the defines for the pixelformats that the mixer supports out
of mixer_graph_buffer() to the top of the source.
Also add handling of RGB565 and exit if the pixelformat is not
supported.

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 3e07f04..9c398d5 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -44,6 +44,11 @@
 #define MIXER_WIN_NR		3
 #define MIXER_DEFAULT_WIN	0
 
+#define MIXER_PIXELFORMAT_RGB565 4
+#define MIXER_PIXELFORMAT_ARGB1555 5
+#define MIXER_PIXELFORMAT_ARGB4444 6
+#define MIXER_PIXELFORMAT_ARGB8888 7
+
 struct mixer_resources {
 	int			irq;
 	void __iomem		*mixer_regs;
@@ -536,31 +541,30 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 
 	plane = &ctx->planes[win];
 
-	#define RGB565 4
-	#define ARGB1555 5
-	#define ARGB4444 6
-	#define ARGB8888 7
-
 	switch (plane->pixel_format) {
 	case DRM_FORMAT_ARGB4444:
-		fmt = ARGB4444;
+		fmt = MIXER_PIXELFORMAT_ARGB4444;
 		blend = 1;
 		break;
 
 	case DRM_FORMAT_ARGB8888:
-		fmt = ARGB8888;
+		fmt = MIXER_PIXELFORMAT_ARGB8888;
 		blend = 1;
 		break;
 
 	case DRM_FORMAT_XRGB8888:
-		fmt = ARGB8888;
+		fmt = MIXER_PIXELFORMAT_ARGB8888;
 		blend = 0;
 		break;
 
-	default:
-		fmt = ARGB8888;
+	case DRM_FORMAT_RGB565:
+		fmt = MIXER_PIXELFORMAT_RGB565;
 		blend = 0;
 		break;
+
+	default:
+		DRM_DEBUG_KMS("pixelformat unsupported by mixer\n");
+		return;
 	}
 
 	/* check if mixer supports requested scaling setup */
-- 
2.0.5
