From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 25/25] drm/exynos: add support for plane scaling
Date: Tue, 10 Nov 2015 14:23:41 +0100
Message-ID: <1447161821-1877-26-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11143 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753112AbbKJNZE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:25:04 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00JHKP9PIWA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:25:01 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds support for plane scaling. Minor changes were needed to
use existing Exynos IPP integration code for enabling scaling feature.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  8 +++++---
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c | 22 ++++++++++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h |  8 ++++++--
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index e24285b148c2..0d0c451b4f6b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -57,7 +57,8 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 	return size;
 }
 
-static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
+static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state,
+				  const struct exynos_drm_plane_config *config)
 
 {
 	struct drm_plane_state *state = &exynos_state->base;
@@ -86,7 +87,8 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	src_w = state->src_w >> 16;
 	src_h = state->src_h >> 16;
 
-	exynos_plane_ipp_setup(exynos_state, &src_x, &src_y, &src_w, &src_h);
+	exynos_plane_ipp_setup(exynos_state, config, &src_x, &src_y, &src_w,
+			       &src_h, &crtc_w, &crtc_h);
 
 	/* set ratio */
 	exynos_state->h_ratio = (src_w << 16) / crtc_w;
@@ -245,7 +247,7 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	/* translate state into exynos_state */
-	exynos_plane_mode_set(exynos_state);
+	exynos_plane_mode_set(exynos_state, exynos_plane->config);
 
 	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
 	if (ret)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
index 126d0bde2ccf..2d12eb391262 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
@@ -121,15 +121,24 @@ static int exynos_plane_ipp_transform(struct exynos_drm_plane_state *state)
 }
 
 void exynos_plane_ipp_setup(struct exynos_drm_plane_state *state,
+			    const struct exynos_drm_plane_config *config,
 			    unsigned int *src_x, unsigned int *src_y,
-			    unsigned int *src_w, unsigned int *src_h)
+			    unsigned int *src_w, unsigned int *src_h,
+			    unsigned int *crtc_w, unsigned int *crtc_h)
 {
 	int rotation = state->base.rotation;
 	int pre_x, pre_y, post_x, post_y;
 
 	state->rotation = rotation;
 
-	if (rotation == 0 || rotation == BIT(DRM_ROTATE_0))
+	/* check if ipp is really needed */
+	if (rotation == BIT(DRM_ROTATE_0) &&
+	    (*src_w == *crtc_w ||
+		((config->capabilities & EXYNOS_DRM_PLANE_CAP_DOUBLE_X) &&
+		*src_w * 2 == *crtc_w)) &&
+	    (*src_h == *crtc_h ||
+		((config->capabilities & EXYNOS_DRM_PLANE_CAP_DOUBLE_Y) &&
+		*src_h * 2 == *crtc_h)))
 		return;
 
 	state->ipp_needed = true;
@@ -183,6 +192,15 @@ void exynos_plane_ipp_setup(struct exynos_drm_plane_state *state,
 		swap(state->ipp_dst.w, state->ipp_dst.h);
 		break;
 	}
+
+	/* apply scalling */
+	state->ipp_dst.w = state->ipp_dst.w * *crtc_w / *src_w;
+	state->ipp_dst.h = state->ipp_dst.h * *crtc_h / *src_h;
+
+	*src_x = *src_x * *crtc_w / *src_w;
+	*src_y = *src_y * *crtc_h / *src_h;
+	*src_w = *crtc_w;
+	*src_h = *crtc_h;
 }
 
 int exynos_plane_ipp_check(struct exynos_drm_plane *plane,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h
index defb4f95e075..1709bb1a26e4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h
@@ -15,8 +15,10 @@
 #ifdef CONFIG_DRM_EXYNOS_PLANE_IPP
 
 void exynos_plane_ipp_setup(struct exynos_drm_plane_state *state,
+			    const struct exynos_drm_plane_config *config,
 			    unsigned int *src_x, unsigned int *src_y,
-			    unsigned int *src_w, unsigned int *src_h);
+			    unsigned int *src_w, unsigned int *src_h,
+			    unsigned int *crtc_w, unsigned int *crtc_h);
 
 int exynos_plane_ipp_check(struct exynos_drm_plane *plane,
 			   struct exynos_drm_plane_state *state);
@@ -34,8 +36,10 @@ int exynos_plane_ipp_attach_properties(struct drm_device *dev,
 
 static inline
 void exynos_plane_ipp_setup(struct exynos_drm_plane_state *state,
+			    const struct exynos_drm_plane_config *config,
 			    unsigned int *src_x, unsigned int *src_y,
-			    unsigned int *src_w, unsigned int *src_h)
+			    unsigned int *src_w, unsigned int *src_h,
+			    unsigned int *crtc_w, unsigned int *crtc_h)
 {
 }
 
-- 
1.9.2
