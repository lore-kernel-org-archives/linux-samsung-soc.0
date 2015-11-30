From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 11/22] drm/exynos: add generic check for plane state
Date: Mon, 30 Nov 2015 14:53:26 +0100
Message-ID: <1448891617-18830-12-git-send-email-m.szyprowski@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53289 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754254AbbK3Nxz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:53:55 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM00BU9RXQYTB0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Nov 2015 13:53:50 +0000 (GMT)
In-reply-to: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds generic check for plane state - display area dimensions,
so drivers can always assume that they get valid plane state to set.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  3 +++
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_mixer.c     |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6f8a296a3115..82bbd7f4b316 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -89,6 +89,9 @@ struct exynos_drm_plane {
 	struct drm_framebuffer *pending_fb;
 };
 
+#define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
+#define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
+
 /*
  * Exynos DRM plane configuration structure.
  *
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index b620d7a76799..9eaa8627175f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -173,6 +173,36 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
 };
 
+static int
+exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
+			    struct exynos_drm_plane_state *state)
+{
+	bool width_ok = false, height_ok = false;
+
+	if (config->capabilities & EXYNOS_DRM_PLANE_CAP_SCALE)
+		return 0;
+
+	if (state->src.w == state->crtc.w)
+		width_ok = true;
+
+	if (state->src.h == state->crtc.h)
+		height_ok = true;
+
+	if ((config->capabilities & EXYNOS_DRM_PLANE_CAP_DOUBLE) &&
+	    state->h_ratio == (1 << 15))
+		width_ok = true;
+
+	if ((config->capabilities & EXYNOS_DRM_PLANE_CAP_DOUBLE) &&
+	    state->v_ratio == (1 << 15))
+		height_ok = true;
+
+	if (width_ok & height_ok)
+		return 0;
+
+	DRM_DEBUG_KMS("scaling mode is not supported");
+	return -ENOTSUPP;
+}
+
 static int exynos_plane_atomic_check(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
@@ -187,6 +217,7 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
+	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index a229f86d221a..4190285798ef 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -117,16 +117,19 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.type = DRM_PLANE_TYPE_PRIMARY,
 		.pixel_formats = mixer_formats,
 		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
+		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE,
 	}, {
 		.zpos = 1,
 		.type = DRM_PLANE_TYPE_CURSOR,
 		.pixel_formats = mixer_formats,
 		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
+		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE,
 	}, {
 		.zpos = 2,
 		.type = DRM_PLANE_TYPE_OVERLAY,
 		.pixel_formats = vp_formats,
 		.num_pixel_formats = ARRAY_SIZE(vp_formats),
+		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE,
 	},
 };
 
-- 
1.9.2
