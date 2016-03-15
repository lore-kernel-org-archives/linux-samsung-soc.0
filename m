From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: fix adjusted_mode pointer in exynos_plane_mode_set
Date: Tue, 15 Mar 2016 12:38:02 +0100
Message-ID: <1458041882-10994-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30106 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932428AbcCOLiR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2016 07:38:17 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O420067BWBQ9690@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2016 11:38:14 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

exynos_plane_mode_set should use adjusted_mode from the same atomic state as
plane state. Otherwise it will result in incorrect behavior in case
crtc mode changes.

The patch fixes bug with black console framebuffer in case of command mode
panels.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index d8622723..50185ac 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -11,9 +11,10 @@
 
 #include <drm/drmP.h>
 
-#include <drm/exynos_drm.h>
-#include <drm/drm_plane_helper.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/exynos_drm.h>
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_fb.h"
@@ -57,11 +58,12 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 }
 
 static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
-
 {
 	struct drm_plane_state *state = &exynos_state->base;
-	struct drm_crtc *crtc = exynos_state->base.crtc;
-	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	struct drm_crtc *crtc = state->crtc;
+	struct drm_crtc_state *crtc_state =
+			drm_atomic_get_existing_crtc_state(state->state, crtc);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	int crtc_x, crtc_y;
 	unsigned int crtc_w, crtc_h;
 	unsigned int src_x, src_y;
-- 
1.9.1
