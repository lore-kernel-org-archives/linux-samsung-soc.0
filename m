From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 8/9] tests/exynos: remove connector_find_plane
Date: Wed, 10 Jun 2015 15:42:27 +0200
Message-ID: <1433943748-15849-9-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33653 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964995AbbFJNs0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jun 2015 09:48:26 -0400
In-Reply-To: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

No test uses DRM planes at the moment so this function
is never called.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 1ec7340..59de4ba 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -112,37 +112,6 @@ static void connector_find_mode(int fd, struct connector *c,
 		c->crtc = c->encoder->crtc_id;
 }
 
-static int connector_find_plane(int fd, unsigned int *plane_id)
-{
-	drmModePlaneRes *plane_resources;
-	drmModePlane *ovr;
-	int i;
-
-	plane_resources = drmModeGetPlaneResources(fd);
-	if (!plane_resources) {
-		fprintf(stderr, "drmModeGetPlaneResources failed: %s\n",
-			strerror(errno));
-		return -1;
-	}
-
-	for (i = 0; i < plane_resources->count_planes; i++) {
-		plane_id[i] = 0;
-
-		ovr = drmModeGetPlane(fd, plane_resources->planes[i]);
-		if (!ovr) {
-			fprintf(stderr, "drmModeGetPlane failed: %s\n",
-				strerror(errno));
-			continue;
-		}
-
-		if (ovr->possible_crtcs & (1 << 0))
-			plane_id[i] = ovr->plane_id;
-		drmModeFreePlane(ovr);
-	}
-
-	return 0;
-}
-
 static int drm_set_crtc(struct exynos_device *dev, struct connector *c,
 			unsigned int fb_id)
 {
-- 
2.0.5
