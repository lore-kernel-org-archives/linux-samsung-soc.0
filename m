From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 5/8] drm/exynos: introduce BYTE_PITCH capability
Date: Wed,  9 Aug 2017 13:48:54 +0200
Message-ID: <20170809114857.4945-6-tjakobi@math.uni-bielefeld.de>
References: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55081 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752486AbdHILux (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 07:50:53 -0400
In-Reply-To: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

In some of drivers we compute something like 'pitch / cpp' at some
point, silently assuming that the pitch (which is in bytes) is
divisible by the buffer's cpp. This is not always true, in particular
DRM core does not check for pitch alignment in the common case.

Introduce a new cap which indicates that the hardware supports a
pitch with 'byte-granularity'. If the cap is not set, assume that
we need pitch aligned to cpp.

We set this cap later for the drivers/planes that support it.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 43afab4bebc3..ec32632485d2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -92,6 +92,7 @@ struct exynos_drm_plane {
 #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
 #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
 #define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
+#define EXYNOS_DRM_PLANE_CAP_BYTE_PITCH	(1 << 4)
 
 /*
  * Exynos DRM plane configuration structure.
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index bd3825617b06..734d5ba4eb99 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -185,6 +185,16 @@ exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
 {
 	struct drm_framebuffer *fb = state->base.fb;
 
+	/*
+	 * Some blocks only allow to specify a buffer pitch in terms
+	 * of pixels. In these cases, we need to ensure that the pitch
+	 * provided by userspace is divisible by the cpp.
+	 */
+	if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_BYTE_PITCH)) {
+		if (fb->pitches[0] % fb->format->cpp[0])
+			return -ENOTSUPP;
+	}
+
 	switch (fb->modifier) {
 	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
 		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
-- 
2.13.0
