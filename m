From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/2] exynos: Don't use DRM_EXYNOS_GEM_{MAP_OFFSET/MMAP} ioctls
Date: Fri, 16 Jan 2015 23:57:33 +0100
Message-ID: <1421449054-2808-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49758 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750983AbbAPW5z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 17:57:55 -0500
In-Reply-To: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Hyungwon Hwang <human.hwang@samsung.com>

The ioctl DRM_EXYNOS_GEM_MAP_OFFSET and DRM_EXYNOS_GEM_MMAP are removed from
the linux kernel. This patch modifies libdrm and libkms to use drm generic
ioctls instead of the removed ioctls.

v2: The original patch was erroneous. In case the MODE_MAP_DUMB ioctl failed
    it would return the retvalue as a void-pointer. Users of libdrm would then
    happily use that ptr, eventually leading to a segfault. Change this to
    return NULL in that case and also restore the previous behaviour of logging
    to stderr.
    The other error was that 'bo->vaddr' was never filled with the mapped
    buffer address. Hence exynos_bo_map still returned NULL even if the
    buffer mapping succeeded.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_drm.c | 19 ++++++++++++-------
 libkms/exynos.c     |  7 ++++---
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/exynos/exynos_drm.c b/exynos/exynos_drm.c
index 4c7dd13..c5dd948 100644
--- a/exynos/exynos_drm.c
+++ b/exynos/exynos_drm.c
@@ -283,20 +283,25 @@ drm_public void *exynos_bo_map(struct exynos_bo *bo)
 {
 	if (!bo->vaddr) {
 		struct exynos_device *dev = bo->dev;
-		struct drm_exynos_gem_mmap req = {
-			.handle = bo->handle,
-			.size	= bo->size,
-		};
+		struct drm_mode_map_dumb arg;
+		void *map = NULL;
 		int ret;
 
-		ret = drmIoctl(dev->fd, DRM_IOCTL_EXYNOS_GEM_MMAP, &req);
+		memset(&arg, 0, sizeof(arg));
+		arg.handle = bo->handle;
+
+		ret = drmIoctl(dev->fd, DRM_IOCTL_MODE_MAP_DUMB, &arg);
 		if (ret) {
-			fprintf(stderr, "failed to mmap[%s].\n",
+			fprintf(stderr, "failed to map dumb buffer[%s].\n",
 				strerror(errno));
 			return NULL;
 		}
 
-		bo->vaddr = (void *)(uintptr_t)req.mapped;
+		map = drm_mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+				dev->fd, arg.offset);
+
+		if (map != MAP_FAILED)
+			bo->vaddr = map;
 	}
 
 	return bo->vaddr;
diff --git a/libkms/exynos.c b/libkms/exynos.c
index 92e329c..1123482 100644
--- a/libkms/exynos.c
+++ b/libkms/exynos.c
@@ -25,6 +25,7 @@
 #include <sys/ioctl.h>
 #include "xf86drm.h"
 
+#include "libdrm.h"
 #include "exynos_drm.h"
 
 struct exynos_bo
@@ -124,7 +125,7 @@ static int
 exynos_bo_map(struct kms_bo *_bo, void **out)
 {
 	struct exynos_bo *bo = (struct exynos_bo *)_bo;
-	struct drm_exynos_gem_map_off arg;
+	struct drm_mode_map_dumb arg;
 	void *map = NULL;
 	int ret;
 
@@ -137,11 +138,11 @@ exynos_bo_map(struct kms_bo *_bo, void **out)
 	memset(&arg, 0, sizeof(arg));
 	arg.handle = bo->base.handle;
 
-	ret = drmCommandWriteRead(bo->base.kms->fd, DRM_EXYNOS_GEM_MAP_OFFSET, &arg, sizeof(arg));
+	ret = drmIoctl(bo->base.kms->fd, DRM_IOCTL_MODE_MAP_DUMB, &arg);
 	if (ret)
 		return ret;
 
-	map = mmap(0, bo->base.size, PROT_READ | PROT_WRITE, MAP_SHARED, bo->base.kms->fd, arg.offset);
+	map = drm_mmap(0, bo->base.size, PROT_READ | PROT_WRITE, MAP_SHARED, bo->base.kms->fd, arg.offset);
 	if (map == MAP_FAILED)
 		return -errno;
 
-- 
2.0.5
