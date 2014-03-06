From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 2/4] drm: add ioctl to write into binary blob KMS properties
Date: Thu, 06 Mar 2014 13:32:51 +0530
Message-ID: <1394092973-13423-3-git-send-email-rahul.sharma@samsung.com>
References: <1394092973-13423-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42837 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751105AbaCFIEN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 03:04:13 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2000BDE930BJ00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Mar 2014 17:04:12 +0900 (KST)
In-reply-to: <1394092973-13423-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, inki.dae@samsung.com, prashanth.g@samsung.com, seanpaul@chromium.org, marcheu@chromium.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, r.sh.open@gmail.com, ajaykumar.rs@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Add a new ioctl to common drm framework which can be used to
set variable length binary data from the user space. 'Blob'
is the only KMS property which can hold more than 64 bits. So
far, it has been implemented as read only property for user
application (only used for EDID data).

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/drm_crtc.c  |   73 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_drv.c   |    1 +
 include/drm/drm_crtc.h      |    2 ++
 include/uapi/drm/drm.h      |    1 +
 include/uapi/drm/drm_mode.h |    8 +++++
 5 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 9a2215c..a2b87a5 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -3300,7 +3300,6 @@ static bool drm_property_change_is_valid(struct drm_property *property,
 			valid_mask |= (1ULL << property->values[i]);
 		return !(value & ~valid_mask);
 	} else if (property->flags & DRM_MODE_PROP_BLOB) {
-		/* Only the driver knows */
 		return true;
 	} else {
 		int i;
@@ -3492,6 +3491,78 @@ out:
 	return ret;
 }
 
+int drm_mode_setblob_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv)
+{
+	struct drm_mode_object *arg_obj;
+	struct drm_mode_object *blob_obj;
+	struct drm_mode_object *prop_obj;
+	struct drm_property *property;
+	struct drm_mode_set_blob *arg = data;
+	struct drm_property_blob *blob;
+	int ret = -EINVAL, i;
+	void __user *blob_ptr;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return -EINVAL;
+
+	drm_modeset_lock_all(dev);
+
+	blob_obj = drm_mode_object_find(dev, arg->blob_id, DRM_MODE_OBJECT_BLOB);
+	if (!blob_obj)
+		goto done;
+
+	blob = obj_to_blob(blob_obj);
+
+	arg_obj = drm_mode_object_find(dev, arg->obj_id, arg->obj_type);
+	if (!arg_obj)
+		goto done;
+
+	if (!arg_obj->properties)
+		goto done;
+
+	for (i = 0; i < arg_obj->properties->count; i++)
+		if (arg_obj->properties->values[i] == arg->blob_id)
+			break;
+
+	if (i == arg_obj->properties->count)
+		goto done;
+
+	prop_obj = drm_mode_object_find(dev, arg_obj->properties->ids[i],
+					DRM_MODE_OBJECT_PROPERTY);
+	if (!prop_obj)
+		goto done;
+	property = obj_to_property(prop_obj);
+
+	if (!drm_property_change_is_valid(property, arg->blob_id))
+		goto done;
+
+	if (arg->length == blob->length) {
+		blob_ptr = (void __user *)(unsigned long)arg->data;
+		if (copy_from_user(blob->data, blob_ptr, blob->length)) {
+			ret = -EFAULT;
+			goto done;
+		}
+	}
+
+	switch (arg_obj->type) {
+	case DRM_MODE_OBJECT_CONNECTOR:
+		ret = drm_mode_connector_set_obj_prop(arg_obj, property,
+						      arg->blob_id);
+		break;
+	case DRM_MODE_OBJECT_CRTC:
+		ret = drm_mode_crtc_set_obj_prop(arg_obj, property, arg->blob_id);
+		break;
+	case DRM_MODE_OBJECT_PLANE:
+		ret = drm_mode_plane_set_obj_prop(arg_obj, property, arg->blob_id);
+		break;
+	}
+
+done:
+	drm_modeset_unlock_all(dev);
+	return ret;
+}
+
 int drm_mode_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 345be03..7cdb501 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -167,6 +167,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_OBJ_GETPROPERTIES, drm_mode_obj_get_properties_ioctl, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_OBJ_SETPROPERTY, drm_mode_obj_set_property_ioctl, DRM_MASTER|DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CURSOR2, drm_mode_cursor2_ioctl, DRM_MASTER|DRM_CONTROL_ALLOW|DRM_UNLOCKED),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_SETPROPBLOB, drm_mode_setblob_ioctl, DRM_MASTER|DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index f764654..82f2016 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1124,6 +1124,8 @@ extern int drm_mode_getproperty_ioctl(struct drm_device *dev,
 				      void *data, struct drm_file *file_priv);
 extern int drm_mode_getblob_ioctl(struct drm_device *dev,
 				  void *data, struct drm_file *file_priv);
+extern int drm_mode_setblob_ioctl(struct drm_device *dev,
+				void *data, struct drm_file *file_priv);
 extern int drm_mode_connector_property_set_ioctl(struct drm_device *dev,
 					      void *data, struct drm_file *file_priv);
 extern int drm_mode_getencoder(struct drm_device *dev,
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index b06c8ed..d91139b 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -760,6 +760,7 @@ struct drm_prime_handle {
 #define DRM_IOCTL_MODE_OBJ_GETPROPERTIES	DRM_IOWR(0xB9, struct drm_mode_obj_get_properties)
 #define DRM_IOCTL_MODE_OBJ_SETPROPERTY	DRM_IOWR(0xBA, struct drm_mode_obj_set_property)
 #define DRM_IOCTL_MODE_CURSOR2		DRM_IOWR(0xBB, struct drm_mode_cursor2)
+#define DRM_IOCTL_MODE_SETPROPBLOB	DRM_IOWR(0xBC, struct drm_mode_set_blob)
 
 /**
  * Device specific ioctls should only be in their respective headers
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index f104c26..1d8216d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -295,6 +295,14 @@ struct drm_mode_get_blob {
 	__u64 data;
 };
 
+struct drm_mode_set_blob {
+	__u32 blob_id;
+	__u32 obj_id;
+	__u32 obj_type;
+	__u32 length;
+	__u64 data;
+};
+
 struct drm_mode_fb_cmd {
 	__u32 fb_id;
 	__u32 width, height;
-- 
1.7.9.5
