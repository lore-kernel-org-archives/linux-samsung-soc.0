From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 6/8] drm/exynos: add BYTE_PITCH cap for all supported planes
Date: Tue,  4 Apr 2017 16:02:59 +0200
Message-ID: <1491314581-18086-7-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1491314581-18086-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40568 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752841AbdDDOE1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 10:04:27 -0400
In-Reply-To: <1491314581-18086-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Both FIMD and DECON5433 support a pitch in bytes.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 0fd6f7a..099e22e 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -533,6 +533,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		ctx->configs[win].num_pixel_formats = ARRAY_SIZE(decon_formats);
 		ctx->configs[win].zpos = win;
 		ctx->configs[win].type = decon_win_types[tmp];
+		ctx->configs[win].capabilities = EXYNOS_DRM_PLANE_CAP_BYTE_PITCH;
 
 		ret = exynos_plane_init(drm_dev, &ctx->planes[win], win,
 					1 << ctx->pipe, &ctx->configs[win]);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a9fa444..ae738b8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1007,6 +1007,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
 		ctx->configs[i].zpos = i;
 		ctx->configs[i].type = fimd_win_types[i];
+		ctx->configs[i].capabilities = EXYNOS_DRM_PLANE_CAP_BYTE_PITCH;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[i], i,
 					1 << ctx->pipe, &ctx->configs[i]);
 		if (ret)
-- 
2.7.3
