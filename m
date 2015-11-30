From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 13/22] drm/exynos: fix clipping when scaling is enabled
Date: Mon, 30 Nov 2015 14:53:28 +0100
Message-ID: <1448891617-18830-14-git-send-email-m.szyprowski@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:49874 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753983AbbK3Nxy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:53:54 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM009XQRXRQFB0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Nov 2015 13:53:51 +0000 (GMT)
In-reply-to: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch fixes calculation of src x/y offset for negative crtc x/y
values when scaling is enabled. This fixes possible IOMMU fault when
scaling is enabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 9eaa8627175f..427aeec78a28 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -85,25 +85,26 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	src_w = state->src_w >> 16;
 	src_h = state->src_h >> 16;
 
+	/* set ratio */
+	exynos_state->h_ratio = (src_w << 16) / crtc_w;
+	exynos_state->v_ratio = (src_h << 16) / crtc_h;
+
+	/* clip to visible area */
 	actual_w = exynos_plane_get_size(crtc_x, crtc_w, mode->hdisplay);
 	actual_h = exynos_plane_get_size(crtc_y, crtc_h, mode->vdisplay);
 
 	if (crtc_x < 0) {
 		if (actual_w)
-			src_x -= crtc_x;
+			src_x += ((-crtc_x) * exynos_state->h_ratio) >> 16;
 		crtc_x = 0;
 	}
 
 	if (crtc_y < 0) {
 		if (actual_h)
-			src_y -= crtc_y;
+			src_y += ((-crtc_y) * exynos_state->v_ratio) >> 16;
 		crtc_y = 0;
 	}
 
-	/* set ratio */
-	exynos_state->h_ratio = (src_w << 16) / crtc_w;
-	exynos_state->v_ratio = (src_h << 16) / crtc_h;
-
 	/* set drm framebuffer data. */
 	exynos_state->src.x = src_x;
 	exynos_state->src.y = src_y;
-- 
1.9.2
