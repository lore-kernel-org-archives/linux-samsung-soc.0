From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/3] drm: simplify initialization of rotation property
Date: Mon, 11 Jan 2016 12:03:05 +0100
Message-ID: <1452510185-22801-4-git-send-email-m.szyprowski@samsung.com>
References: <1452510185-22801-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56016 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932443AbcAKLDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 06:03:46 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0S00MR6C27V3A0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Jan 2016 11:03:43 +0000 (GMT)
In-reply-to: <1452510185-22801-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

This patch simplifies initialization of generic rotation property and
aligns the code to match recently introduced function for intializing
generic zpos property. It also adds missing documentation.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 10 ++++------
 drivers/gpu/drm/drm_crtc.c                      | 26 +++++++++++++++++++------
 drivers/gpu/drm/i915/intel_display.c            |  6 ++----
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |  3 +--
 drivers/gpu/drm/omapdrm/omap_drv.c              |  3 +--
 include/drm/drm_crtc.h                          |  4 ++--
 6 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 1ffe9c329c46..4f9606cdf0f2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -967,12 +967,10 @@ atmel_hlcdc_plane_create_properties(struct drm_device *dev)
 	if (!props->alpha)
 		return ERR_PTR(-ENOMEM);
 
-	dev->mode_config.rotation_property =
-			drm_mode_create_rotation_property(dev,
-							  BIT(DRM_ROTATE_0) |
-							  BIT(DRM_ROTATE_90) |
-							  BIT(DRM_ROTATE_180) |
-							  BIT(DRM_ROTATE_270));
+	drm_mode_create_rotation_property(dev, BIT(DRM_ROTATE_0) |
+					       BIT(DRM_ROTATE_90) |
+					       BIT(DRM_ROTATE_180) |
+					       BIT(DRM_ROTATE_270));
 	if (!dev->mode_config.rotation_property)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index e33866084b70..890c5925e6db 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -5861,10 +5861,20 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_mode_config_cleanup);
 
-struct drm_property *drm_mode_create_rotation_property(struct drm_device *dev,
-						       unsigned int supported_rotations)
+/**
+ * drm_mode_create_rotation_property - create generic rotation property
+ * @dev: DRM device
+ * @supported_rotations: bitmask of supported rotation modes
+ *
+ * This function initializes generic rotation property and enables support
+ * for it in drm core. Drivers can then attach this property to planes to enable
+ * support for different rotation modes.
+ */
+int drm_mode_create_rotation_property(struct drm_device *dev,
+				      unsigned int supported_rotations)
 {
-	static const struct drm_prop_enum_list props[] = {
+	struct drm_property *prop;
+	static const struct drm_prop_enum_list values[] = {
 		{ DRM_ROTATE_0,   "rotate-0" },
 		{ DRM_ROTATE_90,  "rotate-90" },
 		{ DRM_ROTATE_180, "rotate-180" },
@@ -5873,9 +5883,13 @@ struct drm_property *drm_mode_create_rotation_property(struct drm_device *dev,
 		{ DRM_REFLECT_Y,  "reflect-y" },
 	};
 
-	return drm_property_create_bitmask(dev, 0, "rotation",
-					   props, ARRAY_SIZE(props),
-					   supported_rotations);
+	prop = drm_property_create_bitmask(dev, 0, "rotation", values,
+				ARRAY_SIZE(values), supported_rotations);
+	if (!prop)
+		return -ENOMEM;
+
+	dev->mode_config.rotation_property = prop;
+	return 0;
 }
 EXPORT_SYMBOL(drm_mode_create_rotation_property);
 
diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 02f6ccb848a9..5b7ba46491a0 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -14042,8 +14042,7 @@ void intel_create_rotation_property(struct drm_device *dev, struct intel_plane *
 		if (INTEL_INFO(dev)->gen >= 9)
 			flags |= BIT(DRM_ROTATE_90) | BIT(DRM_ROTATE_270);
 
-		dev->mode_config.rotation_property =
-			drm_mode_create_rotation_property(dev, flags);
+		drm_mode_create_rotation_property(dev, flags);
 	}
 	if (dev->mode_config.rotation_property)
 		drm_object_attach_property(&plane->base.base,
@@ -14179,8 +14178,7 @@ static struct drm_plane *intel_cursor_plane_create(struct drm_device *dev,
 
 	if (INTEL_INFO(dev)->gen >= 4) {
 		if (!dev->mode_config.rotation_property)
-			dev->mode_config.rotation_property =
-				drm_mode_create_rotation_property(dev,
+			drm_mode_create_rotation_property(dev,
 							BIT(DRM_ROTATE_0) |
 							BIT(DRM_ROTATE_180));
 		if (dev->mode_config.rotation_property)
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
index 432c09836b0e..8defeec0d453 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
@@ -76,8 +76,7 @@ static void mdp5_plane_install_rotation_property(struct drm_device *dev,
 		return;
 
 	if (!dev->mode_config.rotation_property)
-		dev->mode_config.rotation_property =
-			drm_mode_create_rotation_property(dev,
+		drm_mode_create_rotation_property(dev,
 			BIT(DRM_REFLECT_X) | BIT(DRM_REFLECT_Y));
 
 	if (dev->mode_config.rotation_property)
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index dfafdb602ad2..c6ce2b31f1c5 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -304,8 +304,7 @@ static int omap_modeset_init_properties(struct drm_device *dev)
 	struct omap_drm_private *priv = dev->dev_private;
 
 	if (priv->has_dmm) {
-		dev->mode_config.rotation_property =
-			drm_mode_create_rotation_property(dev,
+		drm_mode_create_rotation_property(dev,
 				BIT(DRM_ROTATE_0) | BIT(DRM_ROTATE_90) |
 				BIT(DRM_ROTATE_180) | BIT(DRM_ROTATE_270) |
 				BIT(DRM_REFLECT_X) | BIT(DRM_REFLECT_Y));
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13035e2c5e51..7fe38dc8244a 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -2488,8 +2488,8 @@ extern int drm_format_plane_cpp(uint32_t format, int plane);
 extern int drm_format_horz_chroma_subsampling(uint32_t format);
 extern int drm_format_vert_chroma_subsampling(uint32_t format);
 extern const char *drm_get_format_name(uint32_t format);
-extern struct drm_property *drm_mode_create_rotation_property(struct drm_device *dev,
-							      unsigned int supported_rotations);
+extern int drm_mode_create_rotation_property(struct drm_device *dev,
+					     unsigned int supported_rotations);
 extern unsigned int drm_rotation_simplify(unsigned int rotation,
 					  unsigned int supported_rotations);
 
-- 
1.9.2
