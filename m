From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 3/6] drm/exynos: introduce struct exynos_drm_plane_config
Date: Wed, 15 Apr 2015 17:01:57 +0200
Message-ID: <1429110120-7043-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56660 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755498AbbDOPCw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Apr 2015 11:02:52 -0400
In-Reply-To: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This struct encapsulates the configuration for a plane
object. The pixel format config is currently unused.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 17 ++++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.h    | 19 +++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 17 ++++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.c  | 14 +++++++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.h  |  3 +--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 17 ++++++++++-------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 17 ++++++++++-------
 7 files changed, 67 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 84a3638..ca70599 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -756,8 +756,8 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	struct decon_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
-	enum drm_plane_type type;
-	unsigned int zpos;
+	struct exynos_drm_plane_config plane_config = { 0 };
+	unsigned int i;
 	int ret;
 
 	ret = decon_ctx_initialize(ctx, drm_dev);
@@ -766,11 +766,14 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, zpos);
+	plane_config.possible_crtcs = 1 << ctx->pipe;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		plane_config.type = (i == ctx->default_win) ?
+			DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+		plane_config.zpos = i;
+
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], &plane_config);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4c14a89..35698f3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -116,6 +116,25 @@ struct exynos_drm_plane {
 };
 
 /*
+ * Exynos DRM plane configuration structure.
+ *
+ * @possible_crtcs: bitfield describing the valid CRTCs
+ *			for this plane.
+ * @type: plane type (primary, overlay, etc.)
+ * @zpos: z-position of the plane.
+ * @pixel_formats: supported pixel formats.
+ * @num_pixel_formats: number of elements in 'pixel_formats'.
+ */
+
+struct exynos_drm_plane_config {
+	unsigned long possible_crtcs;
+	enum drm_plane_type type;
+	unsigned int zpos;
+	const uint32_t *pixel_formats;
+	unsigned int num_pixel_formats;
+};
+
+/*
  * Exynos DRM Display Structure.
  *	- this structure is common to analog tv, digital tv and lcd panel.
  *
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 589579f..93fbaa5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -997,18 +997,21 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct exynos_drm_plane *exynos_plane;
-	enum drm_plane_type type;
-	unsigned int zpos;
+	struct exynos_drm_plane_config plane_config = { 0 };
+	unsigned int i;
 	int ret;
 
 	ctx->drm_dev = drm_dev;
 	ctx->pipe = priv->pipe++;
 
-	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, zpos);
+	plane_config.possible_crtcs = 1 << ctx->pipe;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		plane_config.type = (i == ctx->default_win) ?
+			DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+		plane_config.zpos = i;
+
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], &plane_config);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 043a6ba..d24b32a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -206,23 +206,23 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
 
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
-		      unsigned long possible_crtcs, enum drm_plane_type type,
-		      unsigned int zpos)
+		      const struct exynos_drm_plane_config *config)
 {
 	int err;
 
-	err = drm_universal_plane_init(dev, &exynos_plane->base, possible_crtcs,
+	err = drm_universal_plane_init(dev, &exynos_plane->base,
+					   config->possible_crtcs,
 				       &exynos_plane_funcs, formats,
-				       ARRAY_SIZE(formats), type);
+				       ARRAY_SIZE(formats), config->type);
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
 	}
 
-	exynos_plane->zpos = zpos;
+	exynos_plane->zpos = config->zpos;
 
-	if (type == DRM_PLANE_TYPE_OVERLAY)
-		exynos_plane_attach_zpos_property(&exynos_plane->base, zpos);
+	if (config->type == DRM_PLANE_TYPE_OVERLAY)
+		exynos_plane_attach_zpos_property(&exynos_plane->base, config->zpos);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index f360590..12189c0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -22,5 +22,4 @@ int exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 			uint32_t src_w, uint32_t src_h);
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
-		      unsigned long possible_crtcs, enum drm_plane_type type,
-		      unsigned int zpos);
+		      const struct exynos_drm_plane_config *config);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 27e84ec..ca7cc8a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -463,17 +463,20 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
-	enum drm_plane_type type;
-	unsigned int zpos;
+	struct exynos_drm_plane_config plane_config = { 0 };
+	unsigned int i;
 	int ret;
 
 	vidi_ctx_initialize(ctx, drm_dev);
 
-	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, zpos);
+	plane_config.possible_crtcs = 1 << ctx->pipe;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		plane_config.type = (i == ctx->default_win) ?
+			DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+		plane_config.zpos = i;
+
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], &plane_config);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 9c398d5..207d5c9 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1225,19 +1225,22 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	struct mixer_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
-	enum drm_plane_type type;
-	unsigned int zpos;
+	struct exynos_drm_plane_config plane_config = { 0 };
+	unsigned int i;
 	int ret;
 
 	ret = mixer_initialize(ctx, drm_dev);
 	if (ret)
 		return ret;
 
-	for (zpos = 0; zpos < MIXER_WIN_NR; zpos++) {
-		type = (zpos == MIXER_DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
-						DRM_PLANE_TYPE_OVERLAY;
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, zpos);
+	plane_config.possible_crtcs = 1 << ctx->pipe;
+
+	for (i = 0; i < MIXER_WIN_NR; i++) {
+		plane_config.type = (i == MIXER_DEFAULT_WIN) ?
+			DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+		plane_config.zpos = i;
+
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i], &plane_config);
 		if (ret)
 			return ret;
 	}
-- 
2.0.5
