From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 2/8] drm/exynos: mixer: enable NV12MT support for the video plane
Date: Wed,  9 Aug 2017 13:48:51 +0200
Message-ID: <20170809114857.4945-3-tjakobi@math.uni-bielefeld.de>
References: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55071 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752409AbdHILty (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 07:49:54 -0400
In-Reply-To: <20170809114857.4945-1-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The video processor supports a tiled version of the NV12 format,
known as NV12MT in V4L2 terms. The support was removed in commit
083500baefd5f4c215a5a93aef2492c1aa775828 due to not being a real
pixel format, but rather NV12 with a special memory layout.

With the introduction of FB modifiers, we can now properly support
this format again.

Tested with a hacked up modetest from libdrm's test suite on
an ODROID-X2 (Exynos4412).

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_mixer.c     |  6 +++++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index a93de321706b..43afab4bebc3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -91,6 +91,7 @@ struct exynos_drm_plane {
 #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
 #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
 #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
+#define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
 
 /*
  * Exynos DRM plane configuration structure.
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index d48fd7c918f8..87e32dbd8eda 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -238,4 +238,6 @@ void exynos_drm_mode_config_init(struct drm_device *dev)
 
 	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
 	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
+
+	dev->mode_config.allow_fb_modifiers = true;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 611b6fd65433..bd3825617b06 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -180,6 +180,29 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 };
 
 static int
+exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
+			      struct exynos_drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->base.fb;
+
+	switch (fb->modifier) {
+	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
+		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
+			return -ENOTSUPP;
+		break;
+
+	case 0:
+		break;
+
+	default:
+		DRM_ERROR("unsupported pixel format modifier");
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
 exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 			    struct exynos_drm_plane_state *state)
 {
@@ -223,6 +246,10 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
+	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
+	if (ret)
+		return ret;
+
 	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index c6d6f6d42900..4c894d97aba3 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -148,7 +148,8 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.pixel_formats = vp_formats,
 		.num_pixel_formats = ARRAY_SIZE(vp_formats),
 		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE |
-				EXYNOS_DRM_PLANE_CAP_ZPOS,
+				EXYNOS_DRM_PLANE_CAP_ZPOS |
+				EXYNOS_DRM_PLANE_CAP_TILE,
 	},
 };
 
@@ -500,6 +501,9 @@ static void vp_video_buffer(struct mixer_context *ctx,
 		return;
 	}
 
+	if (fb->modifier == DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
+		tiled_mode = true;
+
 	luma_addr[0] = exynos_drm_fb_dma_addr(fb, 0);
 	chroma_addr[0] = exynos_drm_fb_dma_addr(fb, 1);
 
-- 
2.13.0
