From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 7/9] drm/exynos: add BYTE_PITCH cap for all supported planes
Date: Tue, 22 Aug 2017 16:19:42 +0200
Message-ID: <20170822141944.8138-8-tjakobi@math.uni-bielefeld.de>
References: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55878 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932513AbdHVOXQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 10:23:16 -0400
In-Reply-To: <20170822141944.8138-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Both FIMD and DECON5433 support a pitch in bytes.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 5792ca88ab7a..62b50e0685b0 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -546,6 +546,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		ctx->configs[win].num_pixel_formats = ARRAY_SIZE(decon_formats);
 		ctx->configs[win].zpos = win;
 		ctx->configs[win].type = decon_win_types[tmp];
+		ctx->configs[win].capabilities = EXYNOS_DRM_PLANE_CAP_BYTE_PITCH;
 
 		ret = exynos_plane_init(drm_dev, &ctx->planes[win], win,
 					&ctx->configs[win]);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 60f93cad6643..e88597f6d356 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -986,6 +986,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
 		ctx->configs[i].zpos = i;
 		ctx->configs[i].type = fimd_win_types[i];
+		ctx->configs[i].capabilities = EXYNOS_DRM_PLANE_CAP_BYTE_PITCH;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[i], i,
 					&ctx->configs[i]);
 		if (ret)
-- 
2.13.0
