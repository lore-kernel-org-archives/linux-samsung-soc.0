From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 3/4] drm: add generic blob properties for image enhancement
Date: Thu, 06 Mar 2014 13:32:52 +0530
Message-ID: <1394092973-13423-4-git-send-email-rahul.sharma@samsung.com>
References: <1394092973-13423-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34332 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751105AbaCFIEP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 03:04:15 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N20002AP932V990@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Mar 2014 17:04:14 +0900 (KST)
In-reply-to: <1394092973-13423-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, inki.dae@samsung.com, prashanth.g@samsung.com, seanpaul@chromium.org, marcheu@chromium.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, r.sh.open@gmail.com, ajaykumar.rs@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Add generic KMS blob properties to core drm framework. These
are writable blob properties which can be used to set Image
Enhancement parameters. The properties which are added here
are meant for color reproduction, color saturation and edge
enhancement.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/drm_crtc.c  |  115 +++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h      |   13 +++++
 include/uapi/drm/drm_mode.h |   41 +++++++++++++++
 3 files changed, 169 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index a2b87a5..8771abf 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1260,6 +1260,121 @@ int drm_mode_create_dirty_info_property(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_mode_create_dirty_info_property);
 
+/**
+ * drm_mode_create_color_saturation_property - create property for color saturation
+ * @dev: DRM device
+ *
+ */
+int drm_mode_create_color_saturation_property(
+			struct drm_device *dev)
+{
+	struct drm_mode_color_saturation *params;
+	struct drm_property *prop;
+	char prop_name[] = "color saturation";
+
+	if (dev->mode_config.color_saturation_property ||
+		dev->mode_config.color_saturation_blob_ptr)
+		return -EEXIST;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+			prop_name, 0);
+	if (!prop) {
+		DRM_ERROR("fail to create %s property.\n", prop_name);
+		return -ENOMEM;
+	}
+
+	dev->mode_config.color_saturation_blob_ptr =
+		drm_property_create_blob(dev, sizeof(*params),
+			NULL);
+	if (!dev->mode_config.color_saturation_blob_ptr) {
+		DRM_ERROR("failed to allocate blob for %s.\n", prop_name);
+		drm_property_destroy(dev, prop);
+		return -ENOMEM;
+	}
+
+	dev->mode_config.color_saturation_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_color_saturation_property);
+
+/**
+ * drm_mode_create_color_reproduction_property - create property for color reproduction
+ * @dev: DRM device
+ *
+ */
+int drm_mode_create_color_reproduction_property(
+			struct drm_device *dev)
+{
+	struct drm_mode_color_reproduction *params;
+	struct drm_property *prop;
+	char prop_name[] = "color reproduction";
+
+	if (dev->mode_config.color_reproduction_property ||
+		dev->mode_config.color_reproduction_blob_ptr)
+		return -EEXIST;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+			prop_name, 0);
+	if (!prop) {
+		DRM_ERROR("fail to create %s property.\n", prop_name);
+		return -ENOMEM;
+	}
+
+	dev->mode_config.color_reproduction_blob_ptr =
+		drm_property_create_blob(dev, sizeof(*params),
+			NULL);
+	if (!dev->mode_config.color_reproduction_blob_ptr) {
+		DRM_ERROR("failed to allocate blob for %s\n", prop_name);
+		drm_property_destroy(dev, prop);
+		return -ENOMEM;
+	}
+
+	dev->mode_config.color_reproduction_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_color_reproduction_property);
+
+
+/**
+ * drm_mode_create_edge_enhancement_property - create property for edge enhancement
+ * @dev: DRM device
+ *
+ */
+int drm_mode_create_edge_enhancement_property(
+			struct drm_device *dev)
+{
+	struct drm_mode_edge_enhancement *params;
+	struct drm_property *prop;
+	char prop_name[] = "edge enhancement";
+
+	if (dev->mode_config.edge_enhancement_property ||
+		dev->mode_config.edge_enhancement_blob_ptr)
+		return -EEXIST;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+			prop_name, 0);
+	if (!prop) {
+		DRM_ERROR("fail to create %s property.\n", prop_name);
+		return -ENOMEM;
+	}
+
+	dev->mode_config.edge_enhancement_blob_ptr =
+		drm_property_create_blob(dev, sizeof(*params),
+			NULL);
+	if (!dev->mode_config.edge_enhancement_blob_ptr) {
+		DRM_ERROR("failed to allocate blob for %s\n", prop_name);
+		drm_property_destroy(dev, prop);
+		return -ENOMEM;
+	}
+
+	dev->mode_config.edge_enhancement_property = prop;
+
+	return  0;
+}
+EXPORT_SYMBOL(drm_mode_create_edge_enhancement_property);
+
 static int drm_mode_group_init(struct drm_device *dev, struct drm_mode_group *group)
 {
 	uint32_t total_objects = 0;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 82f2016..df7b178 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -901,6 +901,13 @@ struct drm_mode_config {
 	/* Optional properties */
 	struct drm_property *scaling_mode_property;
 	struct drm_property *dirty_info_property;
+	struct drm_property *color_saturation_property;
+	struct drm_property *color_reproduction_property;
+	struct drm_property *edge_enhancement_property;
+
+	struct drm_property_blob *color_saturation_blob_ptr;
+	struct drm_property_blob *color_reproduction_blob_ptr;
+	struct drm_property_blob *edge_enhancement_blob_ptr;
 
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
@@ -1079,6 +1086,12 @@ extern int drm_mode_create_tv_properties(struct drm_device *dev, int num_formats
 extern int drm_mode_create_scaling_mode_property(struct drm_device *dev);
 extern int drm_mode_create_dirty_info_property(struct drm_device *dev);
 extern const char *drm_get_encoder_name(const struct drm_encoder *encoder);
+extern int drm_mode_create_color_saturation_property(
+		struct drm_device *dev);
+extern int drm_mode_create_color_reproduction_property(
+		struct drm_device *dev);
+extern int drm_mode_create_edge_enhancement_property(
+		struct drm_device *dev);
 
 extern int drm_mode_connector_attach_encoder(struct drm_connector *connector,
 					     struct drm_encoder *encoder);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1d8216d..d28f82d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -504,4 +504,45 @@ struct drm_mode_destroy_dumb {
 	uint32_t handle;
 };
 
+/* set up parameters for finer color saturation */
+struct drm_mode_color_saturation {
+	/* hue gain for individual colors */
+	uint16_t hue_gain_red;
+	uint16_t hue_gain_green;
+	uint16_t hue_gain_blue;
+	uint16_t hue_gain_cyan;
+	uint16_t hue_gain_magenta;
+	uint16_t hue_gain_yellow;
+	/* hue gain for overall display */
+	uint16_t hue_gain_overall;
+};
+
+/* set up parameters for standard color reproduction */
+struct drm_mode_color_reproduction {
+	/* 16 bit rgb value for primary colors */
+	uint16_t red_rgb[3];
+	uint16_t green_rgb[3];
+	uint16_t blue_rgb[3];
+	uint16_t cyan_rgb[3];
+	uint16_t magenta_rgb[3];
+	uint16_t yellow_rgb[3];
+	uint16_t white_rgb[3];
+	uint16_t black_rgb[3];
+};
+
+/* set up parameters for edge enhancement */
+struct drm_mode_edge_enhancement {
+	/* threshold values for edge and background*/
+	uint16_t edge_th;
+	uint16_t background_th;
+	/* postive gain */
+	uint16_t pg_edge;
+	uint16_t pg_flat;
+	uint16_t pg_background;
+	/* negative gain */
+	uint16_t ng_edge;
+	uint16_t ng_flat;
+	uint16_t ng_background;
+};
+
 #endif
-- 
1.7.9.5
