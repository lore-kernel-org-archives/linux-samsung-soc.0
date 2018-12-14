From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 4/6] drm/exynos: plane: Minor cleanup
Date: Fri, 14 Dec 2018 13:10:19 +0100
Message-ID: <1544789421-5265-5-git-send-email-c.manszewski@samsung.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
        <CGME20181214121036eucas1p13237f995477f1a630c16fb452ba94598@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Use available drm_plane pointer, for consistency.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index df0508e0e49e..cf352d980eee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -303,7 +303,7 @@ int exynos_plane_init(struct drm_device *dev,
 				       BIT(DRM_MODE_BLEND_COVERAGE);
 	struct drm_plane *plane = &exynos_plane->base;
 
-	err = drm_universal_plane_init(dev, &exynos_plane->base,
+	err = drm_universal_plane_init(dev, plane,
 				       1 << dev->mode_config.num_crtc,
 				       &exynos_plane_funcs,
 				       config->pixel_formats,
@@ -314,12 +314,12 @@ int exynos_plane_init(struct drm_device *dev,
 		return err;
 	}
 
-	drm_plane_helper_add(&exynos_plane->base, &plane_helper_funcs);
+	drm_plane_helper_add(plane, &plane_helper_funcs);
 
 	exynos_plane->index = index;
 	exynos_plane->config = config;
 
-	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos,
+	exynos_plane_attach_zpos_property(plane, config->zpos,
 			   !(config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS));
 
 	if (config->capabilities & EXYNOS_DRM_PLANE_CAP_PIX_BLEND)
-- 
2.7.4
