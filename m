From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFC code example] example code for testing fbproc drivers
Date: Mon, 22 Aug 2016 11:44:37 +0200
Message-ID: <1471859077-15679-5-git-send-email-m.szyprowski@samsung.com>
References: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:36995 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752440AbcHVJpB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 05:45:01 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OCB009PB1QYF840@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2016 10:44:58 +0100 (BST)
In-reply-to: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Stone <daniel@fooishbar.org>, Enrico Weigelt <enrico.weigelt@gr13.net>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>

This is simple example how DRM FBProc API can be used from
userspace. The code allocates 2 dumb framebuffers, fill first with
test pattern and then performs 180 degree rotation of the image data.

TODO: add code to release all allocated resources

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 rotate.c | 336 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)
 create mode 100644 rotate.c

diff --git a/rotate.c b/rotate.c
new file mode 100644
index 0000000..ff4aae0
--- /dev/null
+++ b/rotate.c
@@ -0,0 +1,336 @@
+/*
+ * Copyright (C) 2016 Samsung Electronics Co.Ltd
+ * Authors: Marek Szyprowski <m.szyprowski@samsung.com>
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
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/select.h>
+#include <sys/mman.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <string.h>
+#include <signal.h>
+#include <time.h>
+#include <errno.h>
+
+#include <xf86drm.h>
+#include <xf86drmMode.h>
+#include <drm_fourcc.h>
+
+/* missing rotation property bits */
+#define DRM_ROTATE_0	0x01
+#define DRM_ROTATE_90	0x02
+#define DRM_ROTATE_180	0x04
+#define DRM_ROTATE_270	0x08
+#define DRM_REFLECT_X	0x10
+#define DRM_REFLECT_Y	0x20
+
+struct bo
+{
+	int fd;
+	void *ptr;
+	size_t size;
+	size_t offset;
+	size_t pitch;
+	int width;
+	int height;
+	unsigned handle;
+	unsigned fb_id;
+};
+
+struct bo *bo_create_dumb(int fd, unsigned int width, unsigned int height,
+			  unsigned int bpp)
+{
+	struct drm_mode_create_dumb arg;
+	struct bo *bo;
+	int ret;
+
+	bo = calloc(1, sizeof(*bo));
+	if (bo == NULL) {
+		fprintf(stderr, "failed to allocate buffer object\n");
+		return NULL;
+	}
+
+	memset(&arg, 0, sizeof(arg));
+	arg.bpp = bpp;
+	arg.width = width;
+	arg.height = height;
+
+	ret = drmIoctl(fd, DRM_IOCTL_MODE_CREATE_DUMB, &arg);
+	if (ret) {
+		fprintf(stderr, "failed to create dumb buffer: %s\n",
+			strerror(errno));
+		free(bo);
+		return NULL;
+	}
+
+	bo->fd = fd;
+	bo->handle = arg.handle;
+	bo->size = arg.size;
+	bo->pitch = arg.pitch;
+	bo->width = width;
+	bo->height = height;
+
+	return bo;
+}
+
+int bo_map(struct bo *bo)
+{
+	struct drm_mode_map_dumb arg;
+	void *map;
+	int ret;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.handle = bo->handle;
+
+	ret = drmIoctl(bo->fd, DRM_IOCTL_MODE_MAP_DUMB, &arg);
+	if (ret)
+		return ret;
+
+	map = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		       bo->fd, arg.offset);
+	if (map == MAP_FAILED)
+		return -EINVAL;
+
+	bo->ptr = map;
+
+	return 0;
+}
+
+void bo_unmap(struct bo *bo)
+{
+	if (!bo->ptr)
+		return;
+
+	munmap(bo->ptr, bo->size);
+	bo->ptr = NULL;
+}
+
+void bo_destroy(struct bo *bo)
+{
+	struct drm_mode_destroy_dumb arg;
+	int ret;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.handle = bo->handle;
+
+	ret = drmIoctl(bo->fd, DRM_IOCTL_MODE_DESTROY_DUMB, &arg);
+	if (ret)
+		fprintf(stderr, "failed to destroy dumb buffer: %s\n",
+			strerror(errno));
+
+	free(bo);
+}
+
+int bo_add_fb(struct bo *bo, uint32_t format, uint32_t flags)
+{
+	int ret;
+	uint32_t handles[4] = {bo->handle};
+	uint32_t pitches[4] = {bo->pitch};
+	uint32_t offsets[4] = {};
+
+
+	ret = drmModeAddFB2(bo->fd, bo->width, bo->height,
+			format, handles, pitches, offsets,
+			&bo->fb_id, flags);
+	if (ret) {
+		printf("failed to create fb ret=%d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+struct bo *bo_create_dumb_fb_xrgb(int fd, unsigned int width, unsigned int height)
+{
+	struct bo *bo;
+
+	bo = bo_create_dumb(fd, width, height, 32);
+	bo_map(bo);
+	bo_add_fb(bo, DRM_FORMAT_XRGB8888, 0);
+
+	return bo;
+}
+
+uint32_t get_prop_id(int fd, drmModeObjectPropertiesPtr props, const char *name)
+{
+	drmModePropertyPtr p;
+	uint32_t i, prop_id = 0; /* Property ID should always be > 0 */
+
+	for (i = 0; !prop_id && i < props->count_props; i++) {
+		p = drmModeGetProperty(fd, props->props[i]);
+		if (!strcmp(p->name, name))
+			prop_id = p->prop_id;
+		drmModeFreeProperty(p);
+	}
+	if (!prop_id)
+		printf("Could not find %s property\n", name);
+	return prop_id;
+}
+
+
+int process_fb(int fd, int rotation, int src_fb_id, int sx, int sy, int sw, int sh,
+	       int dst_fb_id, int dx, int dy, int dw, int dh)
+{
+	drmModeObjectPropertiesPtr props;
+	drmModeFBProcResPtr res;
+	drmModeFBProcPtr fbproc;
+	drmModeFBProcReqPtr req;
+	uint32_t id, pid;
+	int i, ret;
+
+	res = drmModeGetFBProcResources(fd);
+	if (!res) {
+		printf("failed to get fbproc resources\n");
+		return 0;
+	}
+
+	if (res->count_fbprocs == 0) {
+		printf("no fbproc object found\n");
+		return 0;
+	}
+
+	id = res->fbprocs[0];
+	drmModeFreeFBProcResources(res);
+
+	fbproc = drmModeGetFBProc(fd, id);
+
+	if (!(fbproc->capabilities & DRM_FBPROC_CAP_ROTATE)) {
+		printf("fbproc has no rotation capability\n");
+		return 0;
+	}
+
+	req = drmModeFBProcReqAlloc();
+	if (!req) {
+		printf("Failed to allocate the request\n");
+		return 0;
+	}
+
+	drmModeFBProcReqSetCursor(req, 0);
+
+	props = drmModeObjectGetProperties(fd, id, DRM_MODE_OBJECT_FBPROC);
+
+	pid = get_prop_id(fd, props, "SRC_FB_ID");
+	if (drmModeFBProcReqAddProperty(req, pid, src_fb_id) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "SRC_X");
+	if (drmModeFBProcReqAddProperty(req, pid, sx << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "SRC_Y");
+	if (drmModeFBProcReqAddProperty(req, pid, sy << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "SRC_W");
+	if (drmModeFBProcReqAddProperty(req, pid, sw << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "SRC_H");
+	if (drmModeFBProcReqAddProperty(req, pid, sh << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "DST_FB_ID");
+	if (drmModeFBProcReqAddProperty(req, pid, dst_fb_id) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "DST_X");
+	if (drmModeFBProcReqAddProperty(req, pid, dx << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "DST_Y");
+	if (drmModeFBProcReqAddProperty(req, pid, dy << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "DST_W");
+	if (drmModeFBProcReqAddProperty(req, pid, dw << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "DST_H");
+	if (drmModeFBProcReqAddProperty(req, pid, dh << 16) < 0)
+		return 0;
+
+	pid = get_prop_id(fd, props, "rotation");
+	if (drmModeFBProcReqAddProperty(req, pid, rotation) < 0)
+		return 0;
+
+	drmModeFreeObjectProperties(props);
+
+	ret = drmModeFBProcReqCommit(fd, id, req, 0, NULL);
+	if (ret) {
+		printf("failed to commit fbproc request: %d\n", ret);
+		return 0;
+	}
+
+	drmModeFBProcReqFree(req);
+
+	return 1;
+}
+
+int main(int argc, char *argv[])
+{
+	struct bo *buf1, *buf2;
+	int fd;
+	int ret;
+	int width = 640;
+	int height = 480;
+	int val = 1, x, y;
+
+	fd = open("/dev/dri/card0", O_RDWR);
+	drmSetClientCap(fd, DRM_CLIENT_CAP_ATOMIC, 1);
+
+	buf1 = bo_create_dumb_fb_xrgb(fd, width, height);
+	buf2 = bo_create_dumb_fb_xrgb(fd, width, height);
+
+	/* draw test pattern to buffer1 */
+	for (y = 0; y < height; y++) {
+		uint32_t *p = buf1->ptr + buf1->pitch * y;
+
+		for (x = 0; x < width; x++)
+			*p++ = val++ & 0xffffff;
+	}
+
+	ret = process_fb(fd, DRM_ROTATE_180, buf1->fb_id, 0, 0, width, height,
+			 buf2->fb_id, 0, 0, width, height);
+
+	if (ret = 1) {
+		printf("Buffer processed, checking processed buffer... ");
+
+		for (y = 0; y < height; y++) {
+			uint32_t *p1 = buf1->ptr + buf1->pitch * y;
+			uint32_t *p2 = buf2->ptr + buf1->pitch * (height - y - 1);
+
+			for (x = 0; x < width; x++)
+				if (*(p1 + x) != *(p2 + width - x - 1)) {
+					printf("failed at (%d,%d) %06x != %06x.\n",
+						x, y, *(p1 + x),
+						*(p2 + width - x - 1));
+					return;
+				}
+		}
+		printf("okay.\n");
+	}
+
+	return 0;
+}
-- 
1.9.1
