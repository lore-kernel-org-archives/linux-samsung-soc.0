From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFC libdrm] add support for framebuffer processor (fbproc) objects
Date: Mon, 22 Aug 2016 11:44:36 +0200
Message-ID: <1471859077-15679-4-git-send-email-m.szyprowski@samsung.com>
References: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53859 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754091AbcHVJpB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 05:45:01 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OCB003P41QXE540@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2016 10:44:58 +0100 (BST)
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
 include/drm/drm.h      |  13 ++
 include/drm/drm_mode.h |  39 ++++++
 xf86drmMode.c          | 345 +++++++++++++++++++++++++++++++++++++++++++++++++
 xf86drmMode.h          |  37 ++++++
 4 files changed, 434 insertions(+)

diff --git a/include/drm/drm.h b/include/drm/drm.h
index b4ebaa9..15691fd 100644
--- a/include/drm/drm.h
+++ b/include/drm/drm.h
@@ -794,6 +794,9 @@ struct drm_prime_handle {
 #define DRM_IOCTL_MODE_ATOMIC		DRM_IOWR(0xBC, struct drm_mode_atomic)
 #define DRM_IOCTL_MODE_CREATEPROPBLOB	DRM_IOWR(0xBD, struct drm_mode_create_blob)
 #define DRM_IOCTL_MODE_DESTROYPROPBLOB	DRM_IOWR(0xBE, struct drm_mode_destroy_blob)
+#define DRM_IOCTL_MODE_GETFBPROCRESOURCES DRM_IOWR(0xBF, struct drm_mode_get_fbproc_res)
+#define DRM_IOCTL_MODE_GETFBPROC	DRM_IOWR(0xC0, struct drm_mode_get_fbproc)
+#define DRM_IOCTL_MODE_FBPROC		DRM_IOWR(0xC1, struct drm_mode_fbproc)
 
 /**
  * Device specific ioctls should only be in their respective headers
@@ -825,6 +828,7 @@ struct drm_event {
 
 #define DRM_EVENT_VBLANK 0x01
 #define DRM_EVENT_FLIP_COMPLETE 0x02
+#define DRM_EVENT_FBPROC_COMPLETE 0x03
 
 struct drm_event_vblank {
 	struct drm_event base;
@@ -835,6 +839,15 @@ struct drm_event_vblank {
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
 typedef struct drm_clip_rect drm_clip_rect_t;
 typedef struct drm_drawable_info drm_drawable_info_t;
diff --git a/include/drm/drm_mode.h b/include/drm/drm_mode.h
index 7a7856e..03dbd04 100644
--- a/include/drm/drm_mode.h
+++ b/include/drm/drm_mode.h
@@ -320,6 +320,21 @@ struct drm_mode_connector_set_property {
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
@@ -328,6 +343,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_FBPROC 0x88888888
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -621,4 +637,27 @@ struct drm_mode_destroy_blob {
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
 #endif
diff --git a/xf86drmMode.c b/xf86drmMode.c
index f7b5948..65db2b6 100644
--- a/xf86drmMode.c
+++ b/xf86drmMode.c
@@ -1075,6 +1075,137 @@ void drmModeFreePlaneResources(drmModePlaneResPtr ptr)
 	drmFree(ptr);
 }
 
+drmModeFBProcResPtr drmModeGetFBProcResources(int fd)
+{
+	struct drm_mode_get_fbproc_res res, counts;
+	drmModeFBProcResPtr r = 0;
+
+retry:
+	memclear(res);
+	if (drmIoctl(fd, DRM_IOCTL_MODE_GETFBPROCRESOURCES, &res))
+		return 0;
+
+	counts = res;
+
+	if (res.count_fbprocs) {
+		res.fbproc_id_ptr = VOID2U64(drmMalloc(res.count_fbprocs *
+							sizeof(uint32_t)));
+		if (!res.fbproc_id_ptr)
+			goto err_allocs;
+	}
+
+	if (drmIoctl(fd, DRM_IOCTL_MODE_GETFBPROCRESOURCES, &res))
+		goto err_allocs;
+
+	if (counts.count_fbprocs < res.count_fbprocs) {
+		drmFree(U642VOID(res.fbproc_id_ptr));
+		goto retry;
+	}
+
+	if (!(r = drmMalloc(sizeof(*r))))
+		goto err_allocs;
+
+	r->count_fbprocs = res.count_fbprocs;
+	r->fbprocs = drmAllocCpy(U642VOID(res.fbproc_id_ptr),
+				  res.count_fbprocs, sizeof(uint32_t));
+	if (res.count_fbprocs && !r->fbprocs) {
+		drmFree(r->fbprocs);
+		drmFree(r);
+		r = 0;
+	}
+
+err_allocs:
+	drmFree(U642VOID(res.fbproc_id_ptr));
+
+	return r;
+}
+
+void drmModeFreeFBProcResources(drmModeFBProcResPtr ptr)
+{
+	if (!ptr)
+		return;
+
+	drmFree(ptr->fbprocs);
+	drmFree(ptr);
+}
+
+drmModeFBProcPtr drmModeGetFBProc(int fd, uint32_t fbproc_id)
+{
+	struct drm_mode_get_fbproc ovr, counts;
+	drmModeFBProcPtr r = 0;
+
+retry:
+	memclear(ovr);
+	ovr.fbproc_id = fbproc_id;
+	if (drmIoctl(fd, DRM_IOCTL_MODE_GETFBPROC, &ovr))
+		return 0;
+
+	counts = ovr;
+
+	if (ovr.src_format_count) {
+		ovr.src_format_type_ptr = VOID2U64(
+			drmMalloc(ovr.src_format_count * sizeof(uint32_t)));
+		if (!ovr.src_format_type_ptr)
+			goto err_allocs;
+	}
+
+	if (ovr.dst_format_count) {
+		ovr.dst_format_type_ptr = VOID2U64(
+			drmMalloc(ovr.dst_format_count * sizeof(uint32_t)));
+		if (!ovr.dst_format_type_ptr)
+			goto err_allocs;
+	}
+
+	if (drmIoctl(fd, DRM_IOCTL_MODE_GETFBPROC, &ovr))
+		goto err_allocs;
+
+	if (counts.src_format_count < ovr.src_format_count) {
+		drmFree(U642VOID(ovr.src_format_type_ptr));
+		drmFree(U642VOID(ovr.dst_format_type_ptr));
+		goto retry;
+	}
+
+	if (counts.dst_format_count < ovr.dst_format_count) {
+		drmFree(U642VOID(ovr.src_format_type_ptr));
+		drmFree(U642VOID(ovr.dst_format_type_ptr));
+		goto retry;
+	}
+
+	if (!(r = drmMalloc(sizeof(*r))))
+		goto err_allocs;
+
+	r->fbproc_id = ovr.fbproc_id;
+	r->capabilities = ovr.capabilities;
+	r->src_format_count = ovr.src_format_count;
+	r->dst_format_count = ovr.dst_format_count;
+	r->src_formats = drmAllocCpy(U642VOID(ovr.src_format_type_ptr),
+				 ovr.src_format_count, sizeof(uint32_t));
+	r->dst_formats = drmAllocCpy(U642VOID(ovr.dst_format_type_ptr),
+				 ovr.dst_format_count, sizeof(uint32_t));
+	if (!r->src_formats || !r->dst_formats) {
+		drmFree(r->src_formats);
+		drmFree(r->dst_formats);
+		drmFree(r);
+		r = 0;
+	}
+
+err_allocs:
+	drmFree(U642VOID(ovr.src_format_type_ptr));
+	drmFree(U642VOID(ovr.dst_format_type_ptr));
+
+	return r;
+}
+
+void drmModeFreeFBProc(drmModeFBProcPtr ptr)
+{
+	if (!ptr)
+		return;
+
+	drmFree(ptr->src_formats);
+	drmFree(ptr->dst_formats);
+	drmFree(ptr);
+}
+
 drmModeObjectPropertiesPtr drmModeObjectGetProperties(int fd,
 						      uint32_t object_id,
 						      uint32_t object_type)
@@ -1448,3 +1579,217 @@ drmModeDestroyPropertyBlob(int fd, uint32_t id)
 	destroy.blob_id = id;
 	return DRM_IOCTL(fd, DRM_IOCTL_MODE_DESTROYPROPBLOB, &destroy);
 }
+
+typedef struct _drmModeFBProcReqItem drmModeFBProcReqItem, *drmModeFBProcReqItemPtr;
+
+struct _drmModeFBProcReqItem {
+	uint32_t property_id;
+	uint64_t value;
+};
+
+struct _drmModeFBProcReq {
+	uint32_t cursor;
+	uint32_t size_items;
+	drmModeFBProcReqItemPtr items;
+};
+
+drmModeFBProcReqPtr drmModeFBProcReqAlloc(void)
+{
+	drmModeFBProcReqPtr req;
+
+	req = drmMalloc(sizeof *req);
+	if (!req)
+		return NULL;
+
+	req->items = NULL;
+	req->cursor = 0;
+	req->size_items = 0;
+
+	return req;
+}
+
+drmModeFBProcReqPtr drmModeFBProcReqDuplicate(drmModeFBProcReqPtr old)
+{
+	drmModeFBProcReqPtr new;
+
+	if (!old)
+		return NULL;
+
+	new = drmMalloc(sizeof *new);
+	if (!new)
+		return NULL;
+
+	new->cursor = old->cursor;
+	new->size_items = old->size_items;
+
+	if (old->size_items) {
+		new->items = drmMalloc(old->size_items * sizeof(*new->items));
+		if (!new->items) {
+			free(new);
+			return NULL;
+		}
+		memcpy(new->items, old->items,
+		       old->size_items * sizeof(*new->items));
+	} else {
+		new->items = NULL;
+	}
+
+	return new;
+}
+
+int drmModeFBProcReqMerge(drmModeFBProcReqPtr base, drmModeFBProcReqPtr augment)
+{
+	if (!base)
+		return -EINVAL;
+
+	if (!augment || augment->cursor == 0)
+		return 0;
+
+	if (base->cursor + augment->cursor >= base->size_items) {
+		drmModeFBProcReqItemPtr new;
+		int saved_size = base->size_items;
+
+		base->size_items = base->cursor + augment->cursor;
+		new = realloc(base->items,
+			      base->size_items * sizeof(*base->items));
+		if (!new) {
+			base->size_items = saved_size;
+			return -ENOMEM;
+		}
+		base->items = new;
+	}
+
+	memcpy(&base->items[base->cursor], augment->items,
+	       augment->cursor * sizeof(*augment->items));
+	base->cursor += augment->cursor;
+
+	return 0;
+}
+
+int drmModeFBProcReqGetCursor(drmModeFBProcReqPtr req)
+{
+	if (!req)
+		return -EINVAL;
+	return req->cursor;
+}
+
+void drmModeFBProcReqSetCursor(drmModeFBProcReqPtr req, int cursor)
+{
+	if (req)
+		req->cursor = cursor;
+}
+
+int drmModeFBProcReqAddProperty(drmModeFBProcReqPtr req,
+			     uint32_t property_id,
+			     uint64_t value)
+{
+	if (!req)
+		return -EINVAL;
+
+	if (req->cursor >= req->size_items) {
+		drmModeFBProcReqItemPtr new;
+
+		req->size_items += 16;
+		new = realloc(req->items, req->size_items * sizeof(*req->items));
+		if (!new) {
+			req->size_items -= 16;
+			return -ENOMEM;
+		}
+		req->items = new;
+	}
+
+	req->items[req->cursor].property_id = property_id;
+	req->items[req->cursor].value = value;
+	req->cursor++;
+
+	return req->cursor;
+}
+
+void drmModeFBProcReqFree(drmModeFBProcReqPtr req)
+{
+	if (!req)
+		return;
+
+	if (req->items)
+		drmFree(req->items);
+	drmFree(req);
+}
+
+static int sort_prop_list(const void *misc, const void *other)
+{
+	const drmModeFBProcReqItem *first = misc;
+	const drmModeFBProcReqItem *second = other;
+
+	return second->property_id - first->property_id;
+}
+
+int drmModeFBProcReqCommit(int fd, uint32_t fbproc_id, drmModeFBProcReqPtr req,
+			uint32_t flags,	void *user_data)
+{
+	drmModeFBProcReqPtr sorted;
+	struct drm_mode_fbproc fbproc;
+	uint32_t *props_ptr = NULL;
+	uint64_t *prop_values_ptr = NULL;
+	uint32_t i;
+	int ret = -1;
+
+	if (!req)
+		return -EINVAL;
+
+	if (req->cursor == 0)
+		return 0;
+
+	sorted = drmModeFBProcReqDuplicate(req);
+	if (sorted == NULL)
+		return -ENOMEM;
+
+	memclear(fbproc);
+
+	/* Sort the list by property ID. */
+	qsort(sorted->items, sorted->cursor, sizeof(*sorted->items),
+	      sort_prop_list);
+
+	/* Now the list is sorted, eliminate duplicate property sets. */
+	for (i = 0; i < sorted->cursor - 1; i++) {
+		if (sorted->items[i].property_id != sorted->items[i + 1].property_id)
+			continue;
+
+		memmove(&sorted->items[i], &sorted->items[i + 1],
+			(sorted->cursor - i - 1) * sizeof(*sorted->items));
+		sorted->cursor--;
+	}
+
+	props_ptr = drmMalloc(sorted->cursor * sizeof props_ptr[0]);
+	if (!props_ptr) {
+		errno = ENOMEM;
+		goto out;
+	}
+
+	prop_values_ptr = drmMalloc(sorted->cursor * sizeof prop_values_ptr[0]);
+	if (!prop_values_ptr) {
+		errno = ENOMEM;
+		goto out;
+	}
+
+	for (i = 0; i < sorted->cursor; i++) {
+		props_ptr[i] = sorted->items[i].property_id;
+		prop_values_ptr[i] = sorted->items[i].value;
+
+	}
+
+	fbproc.flags = flags;
+	fbproc.fbproc_id = fbproc_id;
+	fbproc.count_props = sorted->cursor;
+	fbproc.props_ptr = VOID2U64(props_ptr);
+	fbproc.prop_values_ptr = VOID2U64(prop_values_ptr);
+	fbproc.user_data = VOID2U64(user_data);
+
+	ret = DRM_IOCTL(fd, DRM_IOCTL_MODE_FBPROC, &fbproc);
+
+out:
+	drmFree(props_ptr);
+	drmFree(prop_values_ptr);
+	drmModeFBProcReqFree(sorted);
+
+	return ret;
+}
diff --git a/xf86drmMode.h b/xf86drmMode.h
index 4de7bbb..8faaf73 100644
--- a/xf86drmMode.h
+++ b/xf86drmMode.h
@@ -335,6 +335,20 @@ typedef struct _drmModePlaneRes {
 	uint32_t *planes;
 } drmModePlaneRes, *drmModePlaneResPtr;
 
+typedef struct _drmModeFBProcRes {
+	uint32_t count_fbprocs;
+	uint32_t *fbprocs;
+} drmModeFBProcRes, *drmModeFBProcResPtr;
+
+typedef struct _drmModeFBProc {
+	uint32_t fbproc_id;
+	uint32_t capabilities;
+	uint32_t src_format_count;
+	uint32_t dst_format_count;
+	uint32_t *src_formats;
+	uint32_t *dst_formats;
+} drmModeFBProc, *drmModeFBProcPtr;
+
 extern void drmModeFreeModeInfo( drmModeModeInfoPtr ptr );
 extern void drmModeFreeResources( drmModeResPtr ptr );
 extern void drmModeFreeFB( drmModeFBPtr ptr );
@@ -343,6 +357,8 @@ extern void drmModeFreeConnector( drmModeConnectorPtr ptr );
 extern void drmModeFreeEncoder( drmModeEncoderPtr ptr );
 extern void drmModeFreePlane( drmModePlanePtr ptr );
 extern void drmModeFreePlaneResources(drmModePlaneResPtr ptr);
+extern void drmModeFreeFBProcResources(drmModeFBProcResPtr ptr);
+extern void drmModeFreeFBProc(drmModeFBProcPtr ptr);
 
 /**
  * Retrives all of the resources associated with a card.
@@ -483,6 +499,9 @@ extern void drmModeFreeObjectProperties(drmModeObjectPropertiesPtr ptr);
 extern int drmModeObjectSetProperty(int fd, uint32_t object_id,
 				    uint32_t object_type, uint32_t property_id,
 				    uint64_t value);
+extern drmModeFBProcPtr drmModeGetFBProc(int fd, uint32_t fbproc_id);
+extern drmModeFBProcResPtr drmModeGetFBProcResources(int fd);
+
 
 
 typedef struct _drmModeAtomicReq drmModeAtomicReq, *drmModeAtomicReqPtr;
@@ -507,6 +526,24 @@ extern int drmModeCreatePropertyBlob(int fd, const void *data, size_t size,
 				     uint32_t *id);
 extern int drmModeDestroyPropertyBlob(int fd, uint32_t id);
 
+typedef struct _drmModeFBProcReq drmModeFBProcReq, *drmModeFBProcReqPtr;
+
+extern drmModeFBProcReqPtr drmModeFBProcReqAlloc(void);
+extern drmModeFBProcReqPtr drmModeFBProcReqDuplicate(drmModeFBProcReqPtr req);
+extern int drmModeFBProcReqMerge(drmModeFBProcReqPtr base,
+			      drmModeFBProcReqPtr augment);
+extern void drmModeFBProcReqFree(drmModeFBProcReqPtr req);
+extern int drmModeFBProcReqGetCursor(drmModeFBProcReqPtr req);
+extern void drmModeFBProcReqSetCursor(drmModeFBProcReqPtr req, int cursor);
+extern int drmModeFBProcReqAddProperty(drmModeFBProcReqPtr req,
+				    uint32_t property_id,
+				    uint64_t value);
+extern int drmModeFBProcReqCommit(int fd,
+			       uint32_t fbproc_id,
+			       drmModeFBProcReqPtr req,
+			       uint32_t flags,
+			       void *user_data);
+
 
 #if defined(__cplusplus)
 }
-- 
1.9.1
