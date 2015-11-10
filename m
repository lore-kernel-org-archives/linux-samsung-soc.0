From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 15/25] drm/exynos: add generic check for plane state
Date: Tue, 10 Nov 2015 14:23:31 +0100
Message-ID: <1447161821-1877-16-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11119 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753113AbbKJNY5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:57 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00JHEP9JIWA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:55 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds generic check for plane state: pixel format and display
area dimensions, so drivers can always assume that they get valid plane
state to set.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 51 +++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9624855128a1..bee0696ccddc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -24,6 +24,8 @@
 
 #define DEFAULT_WIN	0
 
+#define EXYNOS_BAD_PIXEL_FORMAT 0xffffffffu
+
 #define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc, base)
 #define to_exynos_plane(x)	container_of(x, struct exynos_drm_plane, base)
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index b620d7a76799..e5af4cd5e287 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -173,6 +173,52 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
 };
 
+static int
+exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
+			      struct exynos_drm_plane_state *state)
+{
+	uint32_t format = EXYNOS_BAD_PIXEL_FORMAT;
+	int i;
+
+	for (i = 0; i < config->num_pixel_formats; i++)
+		if (config->pixel_formats[i] == state->base.fb->pixel_format)
+			format = state->base.fb->pixel_format;
+
+	if (format == EXYNOS_BAD_PIXEL_FORMAT) {
+		DRM_DEBUG_KMS("unsupported pixel format");
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
+exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
+			    struct exynos_drm_plane_state *state)
+{
+	bool width_ok = false, height_ok = false;
+
+	if (state->src.w == state->crtc.w)
+		width_ok = true;
+
+	if (state->src.h == state->crtc.h)
+		height_ok = true;
+
+	if ((config->capabilities & EXYNOS_DRM_PLANE_CAP_DOUBLE_X) &&
+	    state->h_ratio == (1 << 15))
+		width_ok = true;
+
+	if ((config->capabilities & EXYNOS_DRM_PLANE_CAP_DOUBLE_Y) &&
+	    state->v_ratio == (1 << 15))
+		height_ok = true;
+
+	if (width_ok & height_ok)
+		return 0;
+
+	DRM_DEBUG_KMS("scalling is not supported");
+	return -ENOTSUPP;
+}
+
 static int exynos_plane_atomic_check(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
@@ -187,6 +233,11 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
+	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
+	if (ret)
+		return ret;
+
+	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
 
-- 
1.9.2
