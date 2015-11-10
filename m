From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 21/25] drm/exynos: gem: remove old unused prototypes
Date: Tue, 10 Nov 2015 14:23:37 +0100
Message-ID: <1447161821-1877-22-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55191 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753107AbbKJNZA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:25:00 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL007J9P9MCTA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:58 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch removes old, unused function prototypes from exynos_drm_gem.h.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 37ab8b282db6..9ca5047959ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -55,8 +55,6 @@ struct exynos_drm_gem {
 	struct sg_table		*sgt;
 };
 
-struct page **exynos_gem_get_pages(struct drm_gem_object *obj, gfp_t gfpmask);
-
 /* destroy a buffer with gem object */
 void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem);
 
@@ -91,10 +89,6 @@ void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
 					unsigned int gem_handle,
 					struct drm_file *filp);
 
-/* map user space allocated by malloc to pages. */
-int exynos_drm_gem_userptr_ioctl(struct drm_device *dev, void *data,
-				      struct drm_file *file_priv);
-
 /* get buffer information to memory region allocated by gem. */
 int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_priv);
@@ -123,28 +117,6 @@ int exynos_drm_gem_fault(struct vm_area_struct *vma, struct vm_fault *vmf);
 /* set vm_flags and we can change the vm attribute to other one at here. */
 int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 
-static inline int vma_is_io(struct vm_area_struct *vma)
-{
-	return !!(vma->vm_flags & (VM_IO | VM_PFNMAP));
-}
-
-/* get a copy of a virtual memory region. */
-struct vm_area_struct *exynos_gem_get_vma(struct vm_area_struct *vma);
-
-/* release a userspace virtual memory area. */
-void exynos_gem_put_vma(struct vm_area_struct *vma);
-
-/* get pages from user space. */
-int exynos_gem_get_pages_from_userptr(unsigned long start,
-						unsigned int npages,
-						struct page **pages,
-						struct vm_area_struct *vma);
-
-/* drop the reference to pages. */
-void exynos_gem_put_pages_to_userptr(struct page **pages,
-					unsigned int npages,
-					struct vm_area_struct *vma);
-
 /* map sgt with dma region. */
 int exynos_gem_map_sgt_with_dma(struct drm_device *drm_dev,
 				struct sg_table *sgt,
-- 
1.9.2
