From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2] drm/exynos: use drm generic mmap interface
Date: Thu, 18 Sep 2014 14:19:01 +0900
Message-ID: <1411017541-24450-1-git-send-email-inki.dae@samsung.com>
References: <1410961726-2533-3-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32129 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090AbaIRFTE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 01:19:04 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NC3003CP03QSR10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 18 Sep 2014 14:19:02 +0900 (KST)
In-reply-to: <1410961726-2533-3-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, daniel@ffwll.ch, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch removes DRM_EXYNOS_GEM_MMAP ictrl feature specific
to Exynos drm and instead uses drm generic mmap.

We had used the interface specific to Exynos drm to do mmap directly,
not to use demand paging which maps each page with physical memory
at page fault handler. We don't need the specific mmap interface
because the drm generic mmap which uses vm offset manager stuff can
also do mmap directly.

This patch makes a userspace region to be mapped with whole physical
memory region allocated by userspace request when mmap system call is
requested.

Changelog v2:
- do not set VM_IO, VM_DONTEXPEND and VM_DONTDUMP. These flags were already
  set by drm_gem_mmap
- do not include <linux/anon_inodes.h>, which isn't needed anymore.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |   26 ---------
 drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 -
 drivers/gpu/drm/exynos/exynos_drm_gem.c |   89 ++++++-------------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |   10 ----
 include/uapi/drm/exynos_drm.h           |   22 --------
 5 files changed, 16 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 10ad3d4..928c514 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -15,7 +15,6 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
 
-#include <linux/anon_inodes.h>
 #include <linux/component.h>
 
 #include <drm/exynos_drm.h>
@@ -149,10 +148,6 @@ static int exynos_drm_unload(struct drm_device *dev)
 	return 0;
 }
 
-static const struct file_operations exynos_drm_gem_fops = {
-	.mmap = exynos_drm_gem_mmap_buffer,
-};
-
 static int exynos_drm_suspend(struct drm_device *dev, pm_message_t state)
 {
 	struct drm_connector *connector;
@@ -191,7 +186,6 @@ static int exynos_drm_resume(struct drm_device *dev)
 static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct drm_exynos_file_private *file_priv;
-	struct file *anon_filp;
 	int ret;
 
 	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
@@ -204,21 +198,8 @@ static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
 	if (ret)
 		goto err_file_priv_free;
 
-	anon_filp = anon_inode_getfile("exynos_gem", &exynos_drm_gem_fops,
-					NULL, 0);
-	if (IS_ERR(anon_filp)) {
-		ret = PTR_ERR(anon_filp);
-		goto err_subdrv_close;
-	}
-
-	anon_filp->f_mode = FMODE_READ | FMODE_WRITE;
-	file_priv->anon_filp = anon_filp;
-
 	return ret;
 
-err_subdrv_close:
-	exynos_drm_subdrv_close(dev, file);
-
 err_file_priv_free:
 	kfree(file_priv);
 	file->driver_priv = NULL;
@@ -234,7 +215,6 @@ static void exynos_drm_preclose(struct drm_device *dev,
 static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct exynos_drm_private *private = dev->dev_private;
-	struct drm_exynos_file_private *file_priv;
 	struct drm_pending_vblank_event *v, *vt;
 	struct drm_pending_event *e, *et;
 	unsigned long flags;
@@ -260,10 +240,6 @@ static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
 	}
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 
-	file_priv = file->driver_priv;
-	if (file_priv->anon_filp)
-		fput(file_priv->anon_filp);
-
 	kfree(file->driver_priv);
 	file->driver_priv = NULL;
 }
@@ -282,8 +258,6 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
 static const struct drm_ioctl_desc exynos_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_CREATE, exynos_drm_gem_create_ioctl,
 			DRM_UNLOCKED | DRM_AUTH),
-	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_MMAP,
-			exynos_drm_gem_mmap_ioctl, DRM_UNLOCKED | DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_GET,
 			exynos_drm_gem_get_ioctl, DRM_UNLOCKED),
 	DRM_IOCTL_DEF_DRV(EXYNOS_VIDI_CONNECTION,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 69a6fa3..d22e640 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -240,7 +240,6 @@ struct exynos_drm_g2d_private {
 struct drm_exynos_file_private {
 	struct exynos_drm_g2d_private	*g2d_priv;
 	struct device			*ipp_dev;
-	struct file			*anon_filp;
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 2f3665d..0d5b969 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -318,23 +318,16 @@ void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
 	drm_gem_object_unreference_unlocked(obj);
 }
 
-int exynos_drm_gem_mmap_buffer(struct file *filp,
+int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem_obj *exynos_gem_obj,
 				      struct vm_area_struct *vma)
 {
-	struct drm_gem_object *obj = filp->private_data;
-	struct exynos_drm_gem_obj *exynos_gem_obj = to_exynos_gem_obj(obj);
-	struct drm_device *drm_dev = obj->dev;
+	struct drm_device *drm_dev = exynos_gem_obj->base.dev;
 	struct exynos_drm_gem_buf *buffer;
 	unsigned long vm_size;
 	int ret;
 
-	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
-
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
-	vma->vm_private_data = obj;
-	vma->vm_ops = drm_dev->driver->gem_vm_ops;
-
-	update_vm_cache_attr(exynos_gem_obj, vma);
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_pgoff = 0;
 
 	vm_size = vma->vm_end - vma->vm_start;
 
@@ -356,60 +349,6 @@ int exynos_drm_gem_mmap_buffer(struct file *filp,
 		return ret;
 	}
 
-	/*
-	 * take a reference to this mapping of the object. And this reference
-	 * is unreferenced by the corresponding vm_close call.
-	 */
-	drm_gem_object_reference(obj);
-
-	drm_vm_open_locked(drm_dev, vma);
-
-	return 0;
-}
-
-int exynos_drm_gem_mmap_ioctl(struct drm_device *dev, void *data,
-			      struct drm_file *file_priv)
-{
-	struct drm_exynos_file_private *exynos_file_priv;
-	struct drm_exynos_gem_mmap *args = data;
-	struct drm_gem_object *obj;
-	struct file *anon_filp;
-	unsigned long addr;
-
-	if (!(dev->driver->driver_features & DRIVER_GEM)) {
-		DRM_ERROR("does not support GEM.\n");
-		return -ENODEV;
-	}
-
-	mutex_lock(&dev->struct_mutex);
-
-	obj = drm_gem_object_lookup(dev, file_priv, args->handle);
-	if (!obj) {
-		DRM_ERROR("failed to lookup gem object.\n");
-		mutex_unlock(&dev->struct_mutex);
-		return -EINVAL;
-	}
-
-	exynos_file_priv = file_priv->driver_priv;
-	anon_filp = exynos_file_priv->anon_filp;
-	anon_filp->private_data = obj;
-
-	addr = vm_mmap(anon_filp, 0, args->size, PROT_READ | PROT_WRITE,
-			MAP_SHARED, 0);
-
-	drm_gem_object_unreference(obj);
-
-	if (IS_ERR_VALUE(addr)) {
-		mutex_unlock(&dev->struct_mutex);
-		return (int)addr;
-	}
-
-	mutex_unlock(&dev->struct_mutex);
-
-	args->mapped = addr;
-
-	DRM_DEBUG_KMS("mapped = 0x%lx\n", (unsigned long)args->mapped);
-
 	return 0;
 }
 
@@ -693,16 +632,20 @@ int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	exynos_gem_obj = to_exynos_gem_obj(obj);
 
 	ret = check_gem_flags(exynos_gem_obj->flags);
-	if (ret) {
-		drm_gem_vm_close(vma);
-		drm_gem_free_mmap_offset(obj);
-		return ret;
-	}
-
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
+	if (ret)
+		goto err_close_vm;
 
 	update_vm_cache_attr(exynos_gem_obj, vma);
 
+	ret = exynos_drm_gem_mmap_buffer(exynos_gem_obj, vma);
+	if (ret)
+		goto err_close_vm;
+
+	return ret;
+
+err_close_vm:
+	drm_gem_vm_close(vma);
+	drm_gem_free_mmap_offset(obj);
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 8e46094..09d021b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -111,16 +111,6 @@ void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
 					unsigned int gem_handle,
 					struct drm_file *filp);
 
-/*
- * mmap the physically continuous memory that a gem object contains
- * to user space.
- */
-int exynos_drm_gem_mmap_ioctl(struct drm_device *dev, void *data,
-			      struct drm_file *file_priv);
-
-int exynos_drm_gem_mmap_buffer(struct file *filp,
-				      struct vm_area_struct *vma);
-
 /* map user space allocated by malloc to pages. */
 int exynos_drm_gem_userptr_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_priv);
diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
index 67a751c..5575ed1 100644
--- a/include/uapi/drm/exynos_drm.h
+++ b/include/uapi/drm/exynos_drm.h
@@ -33,24 +33,6 @@ struct drm_exynos_gem_create {
 };
 
 /**
- * A structure for mapping buffer.
- *
- * @handle: a handle to gem object created.
- * @pad: just padding to be 64-bit aligned.
- * @size: memory size to be mapped.
- * @mapped: having user virtual address mmaped.
- *	- this variable would be filled by exynos gem module
- *	of kernel side with user virtual address which is allocated
- *	by do_mmap().
- */
-struct drm_exynos_gem_mmap {
-	unsigned int handle;
-	unsigned int pad;
-	uint64_t size;
-	uint64_t mapped;
-};
-
-/**
  * A structure to gem information.
  *
  * @handle: a handle to gem object created.
@@ -302,7 +284,6 @@ struct drm_exynos_ipp_cmd_ctrl {
 };
 
 #define DRM_EXYNOS_GEM_CREATE		0x00
-#define DRM_EXYNOS_GEM_MMAP		0x02
 /* Reserved 0x03 ~ 0x05 for exynos specific gem ioctl */
 #define DRM_EXYNOS_GEM_GET		0x04
 #define DRM_EXYNOS_VIDI_CONNECTION	0x07
@@ -321,9 +302,6 @@ struct drm_exynos_ipp_cmd_ctrl {
 #define DRM_IOCTL_EXYNOS_GEM_CREATE		DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_GEM_CREATE, struct drm_exynos_gem_create)
 
-#define DRM_IOCTL_EXYNOS_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + \
-		DRM_EXYNOS_GEM_MMAP, struct drm_exynos_gem_mmap)
-
 #define DRM_IOCTL_EXYNOS_GEM_GET	DRM_IOWR(DRM_COMMAND_BASE + \
 		DRM_EXYNOS_GEM_GET,	struct drm_exynos_gem_info)
 
-- 
1.7.9.5
