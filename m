From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFC 1/2] drm: add support for framebuffer processors
Date: Mon, 22 Aug 2016 11:44:34 +0200
Message-ID: <1471859077-15679-2-git-send-email-m.szyprowski@samsung.com>
References: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43608 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753951AbcHVJo7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 05:44:59 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OCB00MPB1QWWN40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2016 10:44:56 +0100 (BST)
In-reply-to: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Stone <daniel@fooishbar.org>, Enrico Weigelt <enrico.weigelt@gr13.net>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>

This patch extends DRM API with generic support for hardware modules, which
can be used for processing image data from the one memory buffer to
another. Typical memory-to-memory operations are: rotation, scaling, colour
space conversion or mix of them. I named such hardware modules a
framebuffer processors.

The new API is heavily inspired by atomic KMS approach - it is also
based on DRM objects and their properties. A new DRM object is introduced:
framebuffer processor (called fbproc for convenience). Such fbproc objects
have a set of standard DRM properties, which describes the operation to be
performed by respective hardware module. In typical case those properties
are a source fb id and rectangle (x, y, width, height) and destination fb
id and rectangle. Optionally a rotation property can be also specified if
supported by the given hardware. To perform an operation on image data,
userspace provides a set of properties and their values for given fbproc
object in a similar way as object and properties are provided for
performing atomic page flip / mode setting.

The API consists of the 3 new ioctls:
- DRM_IOCTL_MODE_GETFBPROCRESOURCES: to enumerate all available fbproc
  objects,
- DRM_IOCTL_MODE_GETFBPROC: to query capabilities of given fbproc object,
- DRM_IOCTL_MODE_FBPROC: to perform operation described by given property
  set.

The proposed API is extensible. Drivers can attach their own, custom
properties to add support for more advanced picture processing (for example
blending).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/Makefile            |   3 +-
 drivers/gpu/drm/drm_atomic.c        |   5 +
 drivers/gpu/drm/drm_crtc.c          |   6 +
 drivers/gpu/drm/drm_crtc_internal.h |  12 +
 drivers/gpu/drm/drm_fbproc.c        | 754 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c         |   3 +
 include/drm/drmP.h                  |  10 +
 include/drm/drm_crtc.h              | 211 ++++++++++
 include/drm/drm_irq.h               |  14 +
 include/uapi/drm/drm.h              |  13 +
 include/uapi/drm/drm_mode.h         |  39 ++
 11 files changed, 1069 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_fbproc.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0238bf8bc8c3..9ff4e04d8071 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -12,7 +12,8 @@ drm-y       :=	drm_auth.o drm_bufs.o drm_cache.o \
 		drm_info.o drm_debugfs.o drm_encoder_slave.o \
 		drm_trace_points.o drm_global.o drm_prime.o \
 		drm_rect.o drm_vma_manager.o drm_flip_work.o \
-		drm_modeset_lock.o drm_atomic.o drm_bridge.o
+		drm_modeset_lock.o drm_atomic.o drm_bridge.o \
+		drm_fbproc.o
 
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index fa3930757972..5338c2898db2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1059,6 +1059,11 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 				plane->state, property, val);
 		break;
 	}
+	case DRM_MODE_OBJECT_FBPROC: {
+		struct drm_fbproc *fbproc = obj_to_fbproc(obj);
+		ret = drm_fbproc_get_property(fbproc, property, val);
+		break;
+	}
 	default:
 		ret = -EINVAL;
 		break;
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index e92bb9d3f90f..091d33516335 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1540,6 +1540,7 @@ void drm_modeset_unregister_all(struct drm_device *dev)
 static int drm_mode_create_standard_properties(struct drm_device *dev)
 {
 	struct drm_property *prop;
+	int ret;
 
 	/*
 	 * Standard properties (apply to all connectors)
@@ -1689,6 +1690,10 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.gamma_lut_size_property = prop;
 
+	ret = drm_fbproc_create_properties(dev);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -5692,6 +5697,7 @@ void drm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.property_list);
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
+	INIT_LIST_HEAD(&dev->mode_config.fbproc_list);
 	idr_init(&dev->mode_config.crtc_idr);
 	idr_init(&dev->mode_config.tile_idr);
 	ida_init(&dev->mode_config.connector_ida);
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 0c34e6d906d1..bbdea67cefdf 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -132,3 +132,15 @@ void drm_modeset_unregister_all(struct drm_device *dev);
 /* drm_blend.c */
 int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
 				     struct drm_atomic_state *state);
+
+/* drm_fbproc.c */
+int drm_fbproc_create_properties(struct drm_device *dev);
+int drm_fbproc_get_property(struct drm_fbproc *fbproc,
+			     struct drm_property *property, uint64_t *val);
+
+int drm_mode_getfbproc_res(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+int drm_mode_getfbproc(struct drm_device *dev, void *data,
+                      struct drm_file *file_priv);
+int drm_mode_fbproc_ioctl(struct drm_device *dev,
+			  void *data, struct drm_file *file_priv);
diff --git a/drivers/gpu/drm/drm_fbproc.c b/drivers/gpu/drm/drm_fbproc.c
new file mode 100644
index 000000000000..49aa9e0ee992
--- /dev/null
+++ b/drivers/gpu/drm/drm_fbproc.c
@@ -0,0 +1,754 @@
+/*
+ * Copyright (C) 2016 Samsung Electronics Co.Ltd
+ * Authors:
+ *	Marek Szyprowski <m.szyprowski@samsung.com>
+ *
+ * DRM core framebuffer processor (fbproc) related functions
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+
+#include <drm/drmP.h>
+#include <drm/drm_mode.h>
+
+#include "drm_crtc_internal.h"
+
+/**
+ * drm_fbproc_create_properties - Initialize standard fbproc properties
+ * @dev: DRM device
+ *
+ * Initializes all standard fbproc properties.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_fbproc_create_properties(struct drm_device *dev)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_ATOMIC,
+			"SRC_FB_ID", DRM_MODE_OBJECT_FB);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_src_fb = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"SRC_X", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_src_x = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"SRC_Y", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_src_y = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"SRC_W", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_src_w = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"SRC_H", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_src_h = prop;
+
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_ATOMIC,
+			"DST_FB_ID", DRM_MODE_OBJECT_FB);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_dst_fb = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"DST_X", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_dst_x = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"DST_Y", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_dst_y = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"DST_W", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_dst_w = prop;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"DST_H", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.fbproc_dst_h = prop;
+
+	return 0;
+}
+
+static unsigned int drm_num_fbprocs(struct drm_device *dev)
+{
+	unsigned int num = 0;
+	struct drm_fbproc *tmp;
+
+	drm_for_each_fbproc(tmp, dev) {
+		num++;
+	}
+
+	return num;
+}
+
+/**
+ * drm_fbproc_init - Initialize a new framebuffer processor object
+ * @dev: DRM device
+ * @fbproc: fbproc object to init
+ * @funcs: callbacks for the new fbproc object
+ * @caps: bitmask of fbproc capabilities (%DRM_FBPROC_CAP_*)
+ * @src_fmts: array of supported source fb formats (%DRM_FORMAT_*)
+ * @src_fmt_count: number of elements in @src_fmts
+ * @dst_fmts: array of supported destination fb formats (%DRM_FORMAT_*)
+ * @dst_fmt_count: number of elements in @dst_fmts
+ * @name: printf style format string, or NULL for the default name
+ *
+ * Initializes a fbproc object.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_fbproc_init(struct drm_device *dev, struct drm_fbproc *fbproc,
+		       const struct drm_fbproc_funcs *funcs, unsigned int caps,
+		       const uint32_t *src_fmts, unsigned int src_fmt_count,
+		       const uint32_t *dst_fmts, unsigned int dst_fmt_count,
+		       const char *name, ...)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	int ret;
+
+	ret = drm_mode_object_get(dev, &fbproc->base, DRM_MODE_OBJECT_FBPROC);
+	if (ret)
+		return ret;
+
+	fbproc->base.properties = &fbproc->properties;
+	fbproc->dev = dev;
+	fbproc->funcs = funcs;
+	fbproc->capabilities = caps;
+	fbproc->src_format_count = src_fmt_count;
+	fbproc->dst_format_count = dst_fmt_count;
+
+	if (name) {
+		va_list ap;
+
+		va_start(ap, name);
+		fbproc->name = kvasprintf(GFP_KERNEL, name, ap);
+		va_end(ap);
+	} else {
+		fbproc->name = kasprintf(GFP_KERNEL, "fbproc-%d",
+					drm_num_fbprocs(dev));
+	}
+	if (!fbproc->name)
+		goto free;
+
+	fbproc->src_format_types = kmemdup(src_fmts,
+				  sizeof(uint32_t) * src_fmt_count, GFP_KERNEL);
+	if (!fbproc->src_format_types)
+		goto free;
+
+	fbproc->dst_format_types = kmemdup(dst_fmts,
+				  sizeof(uint32_t) * dst_fmt_count, GFP_KERNEL);
+	if (!fbproc->dst_format_types)
+		goto free;
+
+	list_add_tail(&fbproc->head, &config->fbproc_list);
+	fbproc->index = config->num_fbproc++;
+
+	drm_object_attach_property(&fbproc->base, config->fbproc_src_fb, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_src_x, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_src_y, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_src_w, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_src_h, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_dst_fb, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_dst_x, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_dst_y, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_dst_w, 0);
+	drm_object_attach_property(&fbproc->base, config->fbproc_dst_h, 0);
+
+	return 0;
+
+free:
+	kfree(fbproc->dst_format_types);
+	kfree(fbproc->src_format_types);
+	kfree(fbproc->name);
+	drm_mode_object_unregister(dev, &fbproc->base);
+	return -ENOMEM;
+
+}
+EXPORT_SYMBOL(drm_fbproc_init);
+
+/**
+ * drm_mode_getfbproc_res - enumerate all fbproc resources
+ * @dev: DRM device
+ * @data: ioctl data
+ * @file_priv: DRM file info
+ *
+ * Construct a list of fbproc ids to return to the user.
+ *
+ * Called by the user via ioctl.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_getfbproc_res(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	struct drm_mode_get_fbproc_res *resp = data;
+	struct drm_mode_config *config;
+	struct drm_fbproc *fbproc;
+	uint32_t __user *fbproc_ptr;
+	unsigned int count, copied = 0;
+
+	if (!drm_core_check_feature(dev, DRIVER_FBPROC))
+		return -EINVAL;
+
+	config = &dev->mode_config;
+	count = config->num_fbproc;
+
+	/*
+	 * This ioctl is called twice, once to determine how much space is
+	 * needed, and the 2nd time to fill it.
+	 */
+	if (count && resp->count_fbprocs >= count) {
+		fbproc_ptr = (uint32_t __user *)
+					(unsigned long)resp->fbproc_id_ptr;
+
+		/* Processor lists are invariant, no locking needed. */
+		drm_for_each_fbproc(fbproc, dev) {
+			if (put_user(fbproc->base.id, fbproc_ptr + copied))
+				return -EFAULT;
+			copied++;
+		}
+	}
+	resp->count_fbprocs = count;
+
+	return 0;
+}
+
+/**
+ * drm_mode_getfbproc - get framebuffer processor configuration
+ * @dev: DRM device
+ * @data: ioctl data
+ * @file_priv: DRM file info
+ *
+ * Construct a fbproc configuration structure to return to the user.
+ *
+ * Called by the user via ioctl.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_getfbproc(struct drm_device *dev, void *data,
+		      struct drm_file *file_priv)
+{
+	struct drm_mode_get_fbproc *resp = data;
+	struct drm_fbproc *fbproc;
+	uint32_t __user *format_ptr;
+
+	if (!drm_core_check_feature(dev, DRIVER_FBPROC))
+		return -EINVAL;
+
+	fbproc = drm_fbproc_find(dev, resp->fbproc_id);
+	if (!fbproc)
+		return -ENOENT;
+
+	resp->fbproc_id = fbproc->base.id;
+	resp->capabilities = fbproc->capabilities;
+
+	/*
+	 * This ioctl is called twice, once to determine how much space is
+	 * needed, and the 2nd time to fill it.
+	 */
+	if (fbproc->src_format_count &&
+	    (resp->src_format_count >= fbproc->src_format_count)) {
+		format_ptr = (uint32_t __user *)
+				(unsigned long)resp->src_format_type_ptr;
+		if (copy_to_user(format_ptr, fbproc->src_format_types,
+				 sizeof(uint32_t) * fbproc->src_format_count))
+			return -EFAULT;
+	}
+	if (fbproc->dst_format_count &&
+	    (resp->dst_format_count >= fbproc->dst_format_count)) {
+		format_ptr = (uint32_t __user *)
+				(unsigned long)resp->dst_format_type_ptr;
+		if (copy_to_user(format_ptr, fbproc->dst_format_types,
+				 sizeof(uint32_t) * fbproc->dst_format_count))
+			return -EFAULT;
+	}
+	resp->src_format_count = fbproc->src_format_count;
+	resp->dst_format_count = fbproc->dst_format_count;
+
+	return 0;
+}
+
+/**
+ * drm_atomic_task_init - init new fbproc task
+ * @fbproc: fbproc object for this task
+ * @task: task structure to initialize
+ *
+ * Default implementation for filling in a new fbproc task.
+ * This is useful for drivers that subclass the fbproc task.
+ */
+int drm_fbproc_task_init(struct drm_fbproc *fbproc,
+			 struct drm_fbproc_task *task)
+{
+	drm_mode_object_reference(&fbproc->base);
+	task->dev = fbproc->dev;
+	task->fbproc = fbproc;
+	task->src_w = task->dst_w = UINT_MAX;
+	task->src_h = task->dst_h = UINT_MAX;
+	task->rotation = DRM_ROTATE_0;
+
+	DRM_DEBUG_FBPROC("Allocated task %p\n", task);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_fbproc_task_init);
+
+/**
+ * drm_fbproc_task_clear - clear base fbproc task
+ * @fbproc: fbproc object for this task
+ * @task: task structure to clear
+ *
+ * Default implementation for clearing fbproc task.
+ * This is useful for drivers that subclass the fbproc task.
+ */
+void drm_fbproc_task_clear(struct drm_fbproc *fbproc,
+			   struct drm_fbproc_task *task)
+{
+	DRM_DEBUG_ATOMIC("Clearing task %p\n", task);
+
+	if (task->fbproc) {
+		drm_mode_object_unreference(&task->fbproc->base);
+		task->fbproc = NULL;
+	}
+	if (task->src_fb) {
+		drm_framebuffer_unreference(task->src_fb);
+		task->src_fb = NULL;
+	}
+	if (task->dst_fb) {
+		drm_framebuffer_unreference(task->dst_fb);
+		task->dst_fb = NULL;
+	}
+	if (task->event) {
+		drm_event_cancel_free(fbproc->dev, &task->event->base);
+		task->event = NULL;
+	}
+}
+EXPORT_SYMBOL(drm_fbproc_task_clear);
+
+static inline struct drm_fbproc_task *
+	drm_fbproc_task_alloc(struct drm_fbproc *fbproc)
+{
+	struct drm_fbproc_task *task;
+
+	if (!fbproc->funcs->task_alloc) {
+		task = kzalloc(sizeof(*task), GFP_KERNEL);
+		if (!task)
+			return NULL;
+		if (drm_fbproc_task_init(fbproc, task) < 0) {
+			kfree(task);
+			return NULL;
+		}
+		return task;
+	}
+	return fbproc->funcs->task_alloc(fbproc);
+}
+
+static void drm_fbproc_task_free(struct drm_fbproc *fbproc,
+				 struct drm_fbproc_task *task)
+{
+	DRM_DEBUG_FBPROC("Freeing task %p\n", task);
+
+	if (!fbproc->funcs->task_free) {
+		drm_fbproc_task_clear(fbproc, task);
+		kfree(task);
+	} else {
+		fbproc->funcs->task_free(fbproc, task);
+	}
+}
+
+/**
+ * drm_fbproc_get_property - get default values for fbproc properties
+ * @fbproc: fbproc object read a property from
+ * @property: the property to get
+ * @val: return location for the property value
+ *
+ * This function handles generic/core properties and calls out to
+ * object's ->get_property() for custom properties.
+ *
+ * RETURNS:
+ * Zero on success, error code on failure
+ */
+int drm_fbproc_get_property(struct drm_fbproc *fbproc,
+			    struct drm_property *property, uint64_t *val)
+{
+	struct drm_device *dev = fbproc->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	/* Default values for mandatory properties, nothing interesting */
+	if (property == config->fbproc_src_fb ||
+	    property == config->fbproc_src_x ||
+	    property == config->fbproc_src_y ||
+	    property == config->fbproc_src_w ||
+	    property == config->fbproc_src_h ||
+	    property == config->fbproc_dst_fb ||
+	    property == config->fbproc_dst_x ||
+	    property == config->fbproc_dst_y ||
+	    property == config->fbproc_dst_w ||
+	    property == config->fbproc_dst_h) {
+		*val = 0;
+	} else if (property == fbproc->rotation_property) {
+		*val = DRM_ROTATE_0;
+	} else if (fbproc->funcs->get_property) {
+		return fbproc->funcs->get_property(fbproc, property, val);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int drm_fbproc_set_property(struct drm_fbproc_task *task,
+		struct drm_property *prop, uint64_t prop_value)
+{
+	struct drm_device *dev = task->dev;
+	struct drm_fbproc *fbproc = task->fbproc;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_mode_object *ref;
+	struct drm_framebuffer *fb;
+	int ret = 0;
+
+	if (!drm_property_change_valid_get(prop, prop_value, &ref))
+		return -EINVAL;
+
+	if (prop == config->fbproc_src_fb) {
+		fb = drm_framebuffer_lookup(dev, prop_value);
+		if (task->src_fb)
+			drm_framebuffer_unreference(task->src_fb);
+		task->src_fb = fb;
+	} else if (prop == config->fbproc_src_x) {
+		task->src_x = prop_value;
+	} else if (prop == config->fbproc_src_y) {
+		task->src_y = prop_value;
+	} else if (prop == config->fbproc_src_w) {
+		task->src_w = prop_value;
+	} else if (prop == config->fbproc_src_h) {
+		task->src_h = prop_value;
+	} else if (prop == config->fbproc_dst_fb) {
+		fb = drm_framebuffer_lookup(dev, prop_value);
+		if (task->dst_fb)
+			drm_framebuffer_unreference(task->dst_fb);
+		task->dst_fb = fb;
+	} else if (prop == config->fbproc_dst_x) {
+		task->dst_x = prop_value;
+	} else if (prop == config->fbproc_dst_y) {
+		task->dst_y = prop_value;
+	} else if (prop == config->fbproc_dst_w) {
+		task->dst_w = prop_value;
+	} else if (prop == config->fbproc_dst_h) {
+		task->dst_h = prop_value;
+	} else if (prop == fbproc->rotation_property) {
+		task->rotation = prop_value;
+	} else if (fbproc->funcs->set_property) {
+		ret = fbproc->funcs->set_property(fbproc, task, prop,
+						  prop_value);
+	} else {
+		ret = -EINVAL;
+	}
+
+	drm_property_change_valid_put(prop, ref);
+	return ret;
+}
+
+static struct drm_pending_fbproc_event *drm_fbproc_create_event(
+			struct drm_device *dev, struct drm_file *file_priv,
+			uint64_t user_data)
+{
+	struct drm_pending_fbproc_event *e = NULL;
+	int ret;
+
+	e = kzalloc(sizeof(*e), GFP_KERNEL);
+	if (!e)
+		return NULL;
+
+	e->event.base.type = DRM_EVENT_FBPROC_COMPLETE;
+	e->event.base.length = sizeof(e->event);
+	e->event.user_data = user_data;
+
+	if (file_priv) {
+		ret = drm_event_reserve_init(dev, file_priv, &e->base,
+					     &e->event.base);
+		if (ret) {
+			kfree(e);
+			return NULL;
+		}
+	}
+
+	return e;
+}
+
+static void drm_fbproc_send_event(struct drm_device *dev,
+				  struct drm_fbproc *fbproc,
+				  struct drm_pending_fbproc_event *e)
+{
+	struct timeval now = ktime_to_timeval(ktime_get());
+
+	e->event.tv_sec = now.tv_sec;
+	e->event.tv_usec = now.tv_usec;
+	e->event.sequence = atomic_inc_return(&fbproc->sequence);
+
+	drm_send_event(dev, &e->base);
+}
+
+static inline bool drm_fb_check_format(struct drm_framebuffer *fb,
+				const uint32_t *formats, int format_counts)
+{
+	while (format_counts--)
+		if (*formats++ == fb->pixel_format)
+			return true;
+	return false;
+}
+
+static int drm_fbproc_check_only(struct drm_fbproc_task *task)
+{
+	struct drm_fbproc *fbproc = task->fbproc;
+	int ret = 0;
+
+	DRM_DEBUG_FBPROC("checking %p\n", task);
+
+	if (!task->src_fb || !task->dst_fb)
+		return -EINVAL;
+
+	if (!drm_fb_check_format(task->src_fb, fbproc->src_format_types,
+				 fbproc->src_format_count))
+		return -EINVAL;
+
+	if (!drm_fb_check_format(task->dst_fb, fbproc->dst_format_types,
+				 fbproc->dst_format_count))
+		return -EINVAL;
+
+	if (task->src_w == UINT_MAX)
+		task->src_w = task->src_fb->width << 16;
+	if (task->src_h == UINT_MAX)
+		task->src_h = task->src_fb->height << 16;
+	if (task->dst_w == UINT_MAX)
+		task->dst_w = task->dst_fb->width << 16;
+	if (task->dst_h == UINT_MAX)
+		task->dst_h = task->dst_fb->height << 16;
+
+	if (task->src_x + task->src_w > (task->src_fb->width << 16) ||
+	    task->src_y + task->src_h > (task->src_fb->height << 16) ||
+	    task->dst_x + task->dst_w > (task->dst_fb->width << 16) ||
+	    task->dst_y + task->dst_h > (task->dst_fb->height << 16))
+		return -EINVAL;
+
+	if (!(fbproc->capabilities & DRM_FBPROC_CAP_CROP) &&
+	    (task->src_x || task->src_y || task->dst_x || task->dst_y))
+		return -EINVAL;
+
+	if (!(fbproc->capabilities & DRM_FBPROC_CAP_ROTATE) &&
+	    task->rotation != DRM_ROTATE_0)
+		return -EINVAL;
+
+	if (!(fbproc->capabilities & DRM_FBPROC_CAP_SCALE) &&
+	    (task->src_w != task->dst_w || task->src_h != task->dst_h))
+		return -EINVAL;
+
+	if (!(fbproc->capabilities & DRM_FBPROC_CAP_CONVERT) &&
+	    task->src_fb->pixel_format != task->dst_fb->pixel_format)
+		return -EINVAL;
+
+	if (!(fbproc->capabilities & DRM_FBPROC_CAP_FB_MODIFIERS) &&
+	    ((task->src_fb->flags & DRM_MODE_FB_MODIFIERS) ||
+	     (task->dst_fb->flags & DRM_MODE_FB_MODIFIERS)))
+		return -EINVAL;
+
+	if (fbproc->funcs->check)
+		ret = fbproc->funcs->check(fbproc, task);
+
+	return ret;
+}
+
+static int drm_fbproc_really_commit(struct drm_fbproc *fbproc,
+				     struct drm_fbproc_task *task)
+{
+	int ret = -ENOTSUPP;
+
+	if (fbproc->funcs->commit)
+		ret = fbproc->funcs->commit(fbproc, task);
+	if (ret == 0 && task->event) {
+		drm_fbproc_send_event(task->dev, fbproc, task->event);
+		/* ensure event won't be canceled on task free */
+		task->event = NULL;
+	}
+
+	drm_fbproc_task_free(fbproc, task);
+	return ret;
+}
+
+static int drm_fbproc_commit(struct drm_fbproc_task *task)
+{
+	struct drm_fbproc *fbproc = task->fbproc;
+
+	DRM_DEBUG_FBPROC("processing %p\n", task);
+
+	return drm_fbproc_really_commit(fbproc, task);
+}
+
+static void drm_fbproc_work(struct work_struct *work)
+{
+	struct drm_fbproc_task *task = container_of(work,
+					struct drm_fbproc_task, commit_work);
+	struct drm_fbproc *fbproc = task->fbproc;
+
+	drm_fbproc_really_commit(fbproc, task);
+}
+
+static int drm_fbproc_nonblocking_commit(struct drm_fbproc_task *task)
+{
+	DRM_DEBUG_FBPROC("nonblocking processing %p\n", task);
+
+	INIT_WORK(&task->commit_work, drm_fbproc_work);
+	schedule_work(&task->commit_work);
+
+	return 0;
+}
+
+/**
+ * drm_mode_fbproc_ioctl - perform operation on framebuffer processor object
+ * @dev: DRM device
+ * @data: ioctl data
+ * @file_priv: DRM file info
+ *
+ * Construct a fbproc task from the set of properties provided from the user
+ * and try to schedule it to framebuffer processor hardware.
+ *
+ * Called by the user via ioctl.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_fbproc_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	struct drm_mode_fbproc *arg = data;
+	uint32_t __user *props_ptr =
+		(uint32_t __user *)(unsigned long)(arg->props_ptr);
+	uint64_t __user *prop_values_ptr =
+		(uint64_t __user *)(unsigned long)(arg->prop_values_ptr);
+	struct drm_fbproc *fbproc;
+	struct drm_fbproc_task *task;
+	int ret = 0;
+	unsigned int i;
+
+	if (!drm_core_check_feature(dev, DRIVER_FBPROC))
+		return -EINVAL;
+
+	if (arg->flags & ~DRM_MODE_FBPROC_FLAGS)
+		return -EINVAL;
+
+	if (arg->reserved)
+		return -EINVAL;
+
+	/* can't test and expect an event at the same time. */
+	if ((arg->flags & DRM_MODE_FBPROC_TEST_ONLY) &&
+			(arg->flags & DRM_MODE_FBPROC_EVENT))
+		return -EINVAL;
+
+	fbproc = drm_fbproc_find(dev, arg->fbproc_id);
+	if (!fbproc)
+		return -ENOENT;
+
+	task = drm_fbproc_task_alloc(fbproc);
+	if (!task) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	for (i = 0; i < arg->count_props; i++) {
+		uint32_t prop_id;
+		uint64_t prop_value;
+		struct drm_property *prop;
+
+		if (get_user(prop_id, props_ptr + i)) {
+			ret = -EFAULT;
+			goto free;
+		}
+
+		prop = drm_property_find(dev, prop_id);
+		if (!prop) {
+			ret = -ENOENT;
+			goto free;
+		}
+
+		if (copy_from_user(&prop_value, prop_values_ptr + i,
+				   sizeof(prop_value))) {
+			ret = -EFAULT;
+			goto free;
+		}
+
+		ret = drm_fbproc_set_property(task, prop, prop_value);
+		if (ret)
+			goto free;
+	}
+
+	if (arg->flags & DRM_MODE_FBPROC_EVENT) {
+		struct drm_pending_fbproc_event *e;
+
+		e = drm_fbproc_create_event(dev, file_priv, arg->user_data);
+		if (!e) {
+			ret = -ENOMEM;
+			goto free;
+		}
+		task->event = e;
+	}
+
+	ret = drm_fbproc_check_only(task);
+	if (ret)
+		goto free;
+	/*
+	 * Queue task for processing on the hardware. task object will be
+	 * then freed in the last step of drm_fbproc_really_commit()
+	 */
+	if (!(arg->flags & DRM_MODE_FBPROC_TEST_ONLY)) {
+		if (arg->flags & DRM_MODE_FBPROC_NONBLOCK)
+			ret = drm_fbproc_nonblocking_commit(task);
+		else
+			ret = drm_fbproc_commit(task);
+		goto unreference;
+	}
+free:
+	drm_fbproc_task_free(fbproc, task);
+unreference:
+	drm_mode_object_unreference(&fbproc->base);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index bb51ee97956d..a818409d0a0d 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -621,6 +621,9 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_ATOMIC, drm_mode_atomic_ioctl, DRM_MASTER|DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATEPROPBLOB, drm_mode_createblob_ioctl, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_DESTROYPROPBLOB, drm_mode_destroyblob_ioctl, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETFBPROCRESOURCES, drm_mode_getfbproc_res, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETFBPROC, drm_mode_getfbproc, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_FBPROC, drm_mode_fbproc_ioctl, DRM_CONTROL_ALLOW|DRM_UNLOCKED),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index 856c174bd730..e7061a794871 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -114,6 +114,9 @@ struct dma_buf_attachment;
  * VBL: used for verbose debug message in the vblank code
  *	  This is the category used by the DRM_DEBUG_VBL() macro.
  *
+ * FBPROC: used for verbose debug message in the fbproc code
+ *	  This is the category used by the DRM_DEBUG_FBPROC() macro.
+ *
  * Enabling verbose debug messages is done through the drm.debug parameter,
  * each category being enabled by a bit.
  *
@@ -133,6 +136,7 @@ struct dma_buf_attachment;
 #define DRM_UT_PRIME		0x08
 #define DRM_UT_ATOMIC		0x10
 #define DRM_UT_VBL		0x20
+#define DRM_UT_FBPROC		0x40
 
 extern __printf(2, 3)
 void drm_ut_debug_printk(const char *function_name,
@@ -158,6 +162,7 @@ void drm_err(const char *format, ...);
 #define DRIVER_RENDER			0x8000
 #define DRIVER_ATOMIC			0x10000
 #define DRIVER_KMS_LEGACY_CONTEXT	0x20000
+#define DRIVER_FBPROC			0x40000
 
 /***********************************************************************/
 /** \name Macros to make printk easier */
@@ -231,6 +236,11 @@ void drm_err(const char *format, ...);
 		if (unlikely(drm_debug & DRM_UT_VBL))			\
 			drm_ut_debug_printk(__func__, fmt, ##args);	\
 	} while (0)
+#define DRM_DEBUG_FBPROC(fmt, args...)					\
+	do {								\
+		if (unlikely(drm_debug & DRM_UT_FBPROC))		\
+			drm_ut_debug_printk(__func__, fmt, ##args);	\
+	} while (0)
 
 /*@}*/
 
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index b618b506b04d..e8bda245d299 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -292,9 +292,11 @@ struct drm_crtc;
 struct drm_connector;
 struct drm_encoder;
 struct drm_pending_vblank_event;
+struct drm_pending_fbproc_event;
 struct drm_plane;
 struct drm_bridge;
 struct drm_atomic_state;
+struct drm_fbproc;
 
 struct drm_crtc_helper_funcs;
 struct drm_encoder_helper_funcs;
@@ -1760,6 +1762,153 @@ struct drm_plane {
 	struct drm_property *zpos_property;
 };
 
+struct drm_fbproc_task;
+
+/**
+ * struct drm_fbproc_funcs - drm_fbproc control functions
+ */
+struct drm_fbproc_funcs {
+	/**
+	 * @task_alloc:
+	 *
+	 * This optional hook can be used by drivers that want to subclass struct
+	 * &drm_fbproc_task to be able to track their own driver-private global
+	 * task. If this hook is implemented, drivers must also implement
+	 * @task_free.
+	 *
+	 * RETURNS:
+	 *
+	 * A new &drm_fbproc_task on success or NULL on failure.
+	 */
+	struct drm_fbproc_task *(*task_alloc)(struct drm_fbproc *fbproc);
+
+	/**
+	 * @task_free:
+	 *
+	 * This hook needs driver private resources and the &drm_fbproc_task
+	 * itself.
+	 *
+	 * Drivers that implement this must call drm_fbproc_task_clear()
+	 * to release common resources.
+	 */
+	void (*task_free)(struct drm_fbproc *fbproc,
+			  struct drm_fbproc_task *task);
+
+	/**
+	 * @check:
+	 *
+	 * This is the optional hook to validate an fbproc task. This function
+	 * must reject any task which the hardware or driver doesn't support.
+	 * This includes but is of course not limited to:
+	 *
+	 *  - Checking that the framebuffers, scaling and placement
+	 *    requirements and so on are within the limits of the hardware.
+	 *
+	 *  - The driver does not need to repeat basic input validation like
+	 *    done in the drm_fbproc_check_only() function. The core does
+	 *    that before calling this hook.
+	 *
+	 * RETURNS:
+	 *
+	 * 0 on success or one of the below negative error codes:
+	 *
+	 *  - -EINVAL, if any of the above constraints are violated.
+	 */
+	int (*check)(struct drm_fbproc *fbproc,
+		     struct drm_fbproc_task *task);
+
+	/**
+	 * @commit:
+	 *
+	 * This is the main entry point to start framebuffer processing
+	 * in the hardware. The drm_fbproc_task has been already validated.
+	 *
+	 * RETURNS:
+	 *
+	 * 0 on success or negative error codes in case of failure.
+	 */
+	int (*commit)(struct drm_fbproc *fbproc,
+		      struct drm_fbproc_task *task);
+
+	/**
+	 * @get_property:
+	 *
+	 * Reads out the default value of the decoded driver-private property.
+	 * This is used to implement the MODE_GETPROPERTY IOCTL.
+	 *
+	 * This callback is optional if the driver does not support any
+	 * driver-private properties.
+	 *
+	 * RETURNS:
+	 *
+	 * 0 on success, -EINVAL if the property isn't implemented by the
+	 * driver.
+	 */
+
+	int (*get_property)(struct drm_fbproc *fbproc,
+			    struct drm_property *property, uint64_t *val);
+
+	/**
+	 * @set_property:
+	 *
+	 * Decode a driver-private property value and store the decoded value
+	 * into the passed-in task structure. Since the fbproc core decodes all
+	 * standardized properties (even for extensions beyond the core set of
+	 * properties which might not be implemented by all drivers) this
+	 * requires drivers to subclass the state structure.
+	 *
+	 * This callback is optional if the driver does not support any
+	 * driver-private atomic properties.
+	 *
+	 * RETURNS:
+	 *
+	 * 0 if the property has been found, -EINVAL if the property isn't
+	 * implemented by the driver. No other validation is allowed by the
+	 * driver. The core already checks that the property value is within
+	 * the range (integer, valid enum value, ...) the driver set when
+	 * registering the property.
+	 */
+	int (*set_property)(struct drm_fbproc *fbproc,
+			    struct drm_fbproc_task *task,
+			    struct drm_property *property, uint64_t val);
+};
+
+/**
+ * struct drm_fbproc - central DRM framebuffer processor control structure
+ * @dev: DRM device this plane belongs to
+ * @head: for list management
+ * @name: human readable name, can be overwritten by the driver
+ * @base: base mode object
+ * @index: position inside the mode_config.list, invariant over the lifetime
+ * @funcs: helper functions
+ * @capabilities: hardware capabilities
+ * @sequence: counter for processed tasks
+ * @src_format_types: array of supported source fb formats
+ * @src_format_count: number of elements in @src_format_types
+ * @properties: property tracking for this object
+ * @rotation_property: optional rotation property
+ */
+struct drm_fbproc {
+	struct drm_device *dev;
+	struct list_head head;
+
+	char *name;
+	struct drm_mode_object base;
+	unsigned int index;
+	const struct drm_fbproc_funcs *funcs;
+	unsigned int capabilities;
+	atomic_t sequence;
+
+	uint32_t *src_format_types;
+	unsigned int src_format_count;
+	uint32_t *dst_format_types;
+	unsigned int dst_format_count;
+
+	struct drm_object_properties properties;
+
+	struct drm_property *rotation_property;
+};
+
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
  * @attach: Called during drm_bridge_attach
@@ -2059,6 +2208,36 @@ struct drm_atomic_state {
 	struct work_struct commit_work;
 };
 
+/**
+ */
+struct drm_fbproc_task {
+	struct drm_device *dev;
+	struct drm_fbproc *fbproc;
+
+	struct drm_framebuffer *src_fb;
+
+	/* Source values are 16.16 fixed point */
+	uint32_t src_x, src_y;
+	uint32_t src_h, src_w;
+
+	struct drm_framebuffer *dst_fb;
+
+	/* Destination values are 16.16 fixed point */
+	uint32_t dst_x, dst_y;
+	uint32_t dst_h, dst_w;
+
+	unsigned int rotation;
+
+	/**
+	 * @commit_work:
+	 *
+	 * Work item which can be used by the driver or helpers to execute the
+	 * commit without blocking.
+	 */
+	struct work_struct commit_work;
+
+	struct drm_pending_fbproc_event *event;
+};
 
 /**
  * struct drm_mode_set - new values for a CRTC config change
@@ -2452,6 +2631,9 @@ struct drm_mode_config {
 	int num_crtc;
 	struct list_head crtc_list;
 
+	int num_fbproc;
+	struct list_head fbproc_list;
+
 	struct list_head property_list;
 
 	int min_width, min_height;
@@ -2694,6 +2876,17 @@ struct drm_mode_config {
 	 */
 	struct drm_property *suggested_y_property;
 
+	struct drm_property *fbproc_src_fb;
+	struct drm_property *fbproc_src_x;
+	struct drm_property *fbproc_src_y;
+	struct drm_property *fbproc_src_w;
+	struct drm_property *fbproc_src_h;
+	struct drm_property *fbproc_dst_fb;
+	struct drm_property *fbproc_dst_x;
+	struct drm_property *fbproc_dst_y;
+	struct drm_property *fbproc_dst_w;
+	struct drm_property *fbproc_dst_h;
+
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
 
@@ -2748,6 +2941,7 @@ struct drm_mode_config {
 #define obj_to_property(x) container_of(x, struct drm_property, base)
 #define obj_to_blob(x) container_of(x, struct drm_property_blob, base)
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
+#define obj_to_fbproc(x) container_of(x, struct drm_fbproc, base)
 
 struct drm_prop_enum_list {
 	int type;
@@ -2866,6 +3060,12 @@ extern void drm_crtc_get_hv_timing(const struct drm_display_mode *mode,
 extern int drm_crtc_force_disable(struct drm_crtc *crtc);
 extern int drm_crtc_force_disable_all(struct drm_device *dev);
 
+extern int drm_fbproc_init(struct drm_device *dev, struct drm_fbproc *fbproc,
+		       const struct drm_fbproc_funcs *funcs, unsigned int caps,
+		       const uint32_t *src_fmts, unsigned int src_fmt_count,
+		       const uint32_t *dst_fmts, unsigned int dst_fmt_count,
+		       const char *name, ...);
+
 extern void drm_encoder_cleanup(struct drm_encoder *encoder);
 
 extern const char *drm_get_connector_status_name(enum drm_connector_status status);
@@ -3046,6 +3246,14 @@ static inline struct drm_property *drm_property_find(struct drm_device *dev,
 	return mo ? obj_to_property(mo) : NULL;
 }
 
+static inline struct drm_fbproc *drm_fbproc_find(struct drm_device *dev,
+		uint32_t id)
+{
+	struct drm_mode_object *mo;
+	mo = drm_mode_object_find(dev, id, DRM_MODE_OBJECT_FBPROC);
+	return mo ? obj_to_fbproc(mo) : NULL;
+}
+
 /*
  * Extract a degamma/gamma LUT value provided by user and round it to the
  * precision supported by the hardware.
@@ -3162,6 +3370,9 @@ assert_drm_connector_list_read_locked(struct drm_mode_config *mode_config)
 	     &fb->head != (&(dev)->mode_config.fb_list);			\
 	     fb = list_next_entry(fb, head))
 
+#define drm_for_each_fbproc(fbproc, dev) \
+	list_for_each_entry(fbproc, &(dev)->mode_config.fbproc_list, head)
+
 /* drm_edid.c */
 bool drm_probe_ddc(struct i2c_adapter *adapter);
 struct edid *drm_get_edid(struct drm_connector *connector,
diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
index 2401b14d301f..1d77ac822106 100644
--- a/include/drm/drm_irq.h
+++ b/include/drm/drm_irq.h
@@ -29,6 +29,20 @@
 /**
  * struct drm_pending_vblank_event - pending vblank event tracking
  */
+struct drm_pending_fbproc_event {
+	/**
+	 * @base: Base structure for tracking pending DRM events.
+	 */
+	struct drm_pending_event base;
+	/**
+	 * @event: Actual event which will be sent to userspace.
+	 */
+	struct drm_event_fbproc event;
+};
+
+/**
+ * struct drm_pending_vblank_event - pending vblank event tracking
+ */
 struct drm_pending_vblank_event {
 	/**
 	 * @base: Base structure for tracking pending DRM events.
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 452675fb55d9..90f455832d6d 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -812,6 +812,9 @@ extern "C" {
 #define DRM_IOCTL_MODE_ATOMIC		DRM_IOWR(0xBC, struct drm_mode_atomic)
 #define DRM_IOCTL_MODE_CREATEPROPBLOB	DRM_IOWR(0xBD, struct drm_mode_create_blob)
 #define DRM_IOCTL_MODE_DESTROYPROPBLOB	DRM_IOWR(0xBE, struct drm_mode_destroy_blob)
+#define DRM_IOCTL_MODE_GETFBPROCRESOURCES DRM_IOWR(0xBF, struct drm_mode_get_fbproc_res)
+#define DRM_IOCTL_MODE_GETFBPROC	DRM_IOWR(0xC0, struct drm_mode_get_fbproc)
+#define DRM_IOCTL_MODE_FBPROC		DRM_IOWR(0xC1, struct drm_mode_fbproc)
 
 /**
  * Device specific ioctls should only be in their respective headers
@@ -843,6 +846,7 @@ struct drm_event {
 
 #define DRM_EVENT_VBLANK 0x01
 #define DRM_EVENT_FLIP_COMPLETE 0x02
+#define DRM_EVENT_FBPROC_COMPLETE 0x03
 
 struct drm_event_vblank {
 	struct drm_event base;
@@ -853,6 +857,15 @@ struct drm_event_vblank {
 	__u32 reserved;
 };
 
+struct drm_event_fbproc {
+	struct drm_event base;
+	__u64 user_data;
+	__u32 tv_sec;
+	__u32 tv_usec;
+	__u32 sequence;
+	__u32 reserved;
+};
+
 /* typedef area */
 #ifndef __KERNEL__
 typedef struct drm_clip_rect drm_clip_rect_t;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 49a72659b801..83e4c684be26 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -326,6 +326,21 @@ struct drm_mode_connector_set_property {
 	__u32 connector_id;
 };
 
+struct drm_mode_get_fbproc_res {
+	__u64 fbproc_id_ptr;
+	__u32 count_fbprocs;
+};
+
+struct drm_mode_get_fbproc {
+	__u32 fbproc_id;
+	__u32 capabilities;
+
+	__u32 src_format_count;
+	__u32 dst_format_count;
+	__u64 src_format_type_ptr;
+	__u64 dst_format_type_ptr;
+};
+
 #define DRM_MODE_OBJECT_CRTC 0xcccccccc
 #define DRM_MODE_OBJECT_CONNECTOR 0xc0c0c0c0
 #define DRM_MODE_OBJECT_ENCODER 0xe0e0e0e0
@@ -334,6 +349,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_FBPROC 0x88888888
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -627,6 +643,29 @@ struct drm_mode_destroy_blob {
 	__u32 blob_id;
 };
 
+#define DRM_FBPROC_CAP_CROP		  0x01
+#define DRM_FBPROC_CAP_ROTATE		  0x02
+#define DRM_FBPROC_CAP_SCALE		  0x04
+#define DRM_FBPROC_CAP_CONVERT		  0x08
+#define DRM_FBPROC_CAP_FB_MODIFIERS	0x1000
+
+#define DRM_MODE_FBPROC_EVENT		0x01
+#define DRM_MODE_FBPROC_TEST_ONLY	0x02
+#define DRM_MODE_FBPROC_NONBLOCK	0x04
+
+#define DRM_MODE_FBPROC_FLAGS (DRM_MODE_FBPROC_EVENT |\
+		DRM_MODE_FBPROC_TEST_ONLY | DRM_MODE_FBPROC_NONBLOCK)
+
+struct drm_mode_fbproc {
+	__u32 fbproc_id;
+	__u32 flags;
+	__u32 count_props;
+	__u64 props_ptr;
+	__u64 prop_values_ptr;
+	__u64 reserved;
+	__u64 user_data;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
1.9.1
