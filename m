From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 1/2] drm/exynos: remove DRM_EXYNOS_GEM_MAP_OFFSET ioctl
Date: Wed, 17 Sep 2014 22:48:45 +0900
Message-ID: <1410961726-2533-2-git-send-email-inki.dae@samsung.com>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57024 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755689AbaIQNsu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 09:48:50 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NC100B4WT1CP2C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Sep 2014 22:48:48 +0900 (KST)
In-reply-to: <1410961726-2533-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, daniel@ffwll.ch, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This interface and relevant codes aren't used anymore.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |    3 ---
 drivers/gpu/drm/exynos/exynos_drm_gem.c |   17 -----------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |    4 ----
 include/uapi/drm/exynos_drm.h           |   18 ------------------
 4 files changed, 42 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9b00e4e..10ad3d4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -282,9 +282,6 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
 static const struct drm_ioctl_desc exynos_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_CREATE, exynos_drm_gem_create_ioctl,
 			DRM_UNLOCKED | DRM_AUTH),
-	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_MAP_OFFSET,
-			exynos_drm_gem_map_offset_ioctl, DRM_UNLOCKED |
-			DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_MMAP,
 			exynos_drm_gem_mmap_ioctl, DRM_UNLOCKED | DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_GET,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 15db801..2f3665d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -318,23 +318,6 @@ void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
 	drm_gem_object_unreference_unlocked(obj);
 }
 
-int exynos_drm_gem_map_offset_ioctl(struct drm_device *dev, void *data,
-				    struct drm_file *file_priv)
-{
-	struct drm_exynos_gem_map_off *args = data;
-
-	DRM_DEBUG_KMS("handle = 0x%x, offset = 0x%lx\n",
-			args->handle, (unsigned long)args->offset);
-
-	if (!(dev->driver->driver_features & DRIVER_GEM)) {
-		DRM_ERROR("does not support GEM.\n");
-		return -ENODEV;
-	}
-
-	return exynos_drm_gem_dumb_map_offset(file_priv, dev, args->handle,
-			&args->offset);
-}
-
 int exynos_drm_gem_mmap_buffer(struct file *filp,
 				      struct vm_area_struct *vma)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 1592c0b..8e46094 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -111,10 +111,6 @@ void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
 					unsigned int gem_handle,
 					struct drm_file *filp);
 
-/* get buffer offset to map to user space. */
-int exynos_drm_gem_map_offset_ioctl(struct drm_device *dev, void *data,
-				    struct drm_file *file_priv);
-
 /*
  * mmap the physically continuous memory that a gem object contains
  * to user space.
diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
index d584412..67a751c 100644
--- a/include/uapi/drm/exynos_drm.h
+++ b/include/uapi/drm/exynos_drm.h
@@ -33,20 +33,6 @@ struct drm_exynos_gem_create {
 };
 
 /**
- * A structure for getting buffer offset.
- *
- * @handle: a pointer to gem object created.
- * @pad: just padding to be 64-bit aligned.
- * @offset: relatived offset value of the memory region allocated.
- *	- this value should be set by user.
- */
-struct drm_exynos_gem_map_off {
-	unsigned int handle;
-	unsigned int pad;
-	uint64_t offset;
-};
-
-/**
  * A structure for mapping buffer.
  *
  * @handle: a handle to gem object created.
@@ -316,7 +302,6 @@ struct drm_exynos_ipp_cmd_ctrl {
 };
 
 #define DRM_EXYNOS_GEM_CREATE		0x00
-#define DRM_EXYNOS_GEM_MAP_OFFSET	0x01
 #define DRM_EXYNOS_GEM_MMAP		0x02
 /* Reserved 0x03 ~ 0x05 for exynos specific gem ioctl */
 #define DRM_EXYNOS_GEM_GET		0x04
@@ -336,9 +321,6 @@ struct drm_exynos_ipp_cmd_ctrl {
 #define DRM_IOCTL_EXYNOS_GEM_CREATE		DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_GEM_CREATE, struct drm_exynos_gem_create)
 
-#define DRM_IOCTL_EXYNOS_GEM_MAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + \
-		DRM_EXYNOS_GEM_MAP_OFFSET, struct drm_exynos_gem_map_off)
-
 #define DRM_IOCTL_EXYNOS_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_GEM_MMAP, struct drm_exynos_gem_mmap)
 
-- 
1.7.9.5
