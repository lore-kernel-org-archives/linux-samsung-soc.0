From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 22/25] drm/exynos: gem: simplify access to exynos gem object
Date: Tue, 10 Nov 2015 14:23:38 +0100
Message-ID: <1447161821-1877-23-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55191 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753109AbbKJNZC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:25:02 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL007K0P9MNBA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:59 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Replace calls to exynos_drm_gem_get_{dma_addr,size}, by a simpler
function exynos_drm_gem_get(). This lets the caller to get access to
exynos_drm_gem object and extract any information about GEM object
without searching object tree for getting each parameter.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 48 +++++++++++++-----------------
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 52 +++++----------------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h | 23 +++++----------
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 41 ++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |  2 +-
 5 files changed, 52 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index c17efdb238a6..7c83e64f9f1c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -179,7 +179,7 @@ struct g2d_buf_desc {
 struct g2d_buf_info {
 	unsigned int		map_nr;
 	enum g2d_reg_type	reg_types[MAX_REG_TYPE_NR];
-	unsigned long		handles[MAX_REG_TYPE_NR];
+	void			*obj[MAX_REG_TYPE_NR];
 	unsigned int		types[MAX_REG_TYPE_NR];
 	struct g2d_buf_desc	descs[MAX_REG_TYPE_NR];
 };
@@ -360,11 +360,10 @@ add_to_list:
 }
 
 static void g2d_userptr_put_dma_addr(struct drm_device *drm_dev,
-					unsigned long obj,
+					void *obj,
 					bool force)
 {
-	struct g2d_cmdlist_userptr *g2d_userptr =
-					(struct g2d_cmdlist_userptr *)obj;
+	struct g2d_cmdlist_userptr *g2d_userptr = obj;
 	struct page **pages;
 
 	if (!obj)
@@ -407,7 +406,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct drm_device *drm_dev,
 					unsigned long userptr,
 					unsigned long size,
 					struct drm_file *filp,
-					unsigned long *obj)
+					void **obj)
 {
 	struct drm_exynos_file_private *file_priv = filp->driver_priv;
 	struct exynos_drm_g2d_private *g2d_priv = file_priv->g2d_priv;
@@ -434,7 +433,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct drm_device *drm_dev,
 			 */
 			if (g2d_userptr->size == size) {
 				atomic_inc(&g2d_userptr->refcount);
-				*obj = (unsigned long)g2d_userptr;
+				*obj = g2d_userptr;
 
 				return &g2d_userptr->dma_addr;
 			}
@@ -517,7 +516,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct drm_device *drm_dev,
 		g2d_userptr->in_pool = true;
 	}
 
-	*obj = (unsigned long)g2d_userptr;
+	*obj = g2d_userptr;
 
 	return &g2d_userptr->dma_addr;
 
@@ -549,9 +548,7 @@ static void g2d_userptr_free_all(struct drm_device *drm_dev,
 
 	list_for_each_entry_safe(g2d_userptr, n, &g2d_priv->userptr_list, list)
 		if (g2d_userptr->in_pool)
-			g2d_userptr_put_dma_addr(drm_dev,
-						(unsigned long)g2d_userptr,
-						true);
+			g2d_userptr_put_dma_addr(drm_dev, g2d_userptr, true);
 
 	g2d->current_pool = 0;
 }
@@ -706,26 +703,23 @@ static int g2d_map_cmdlist_gem(struct g2d_data *g2d,
 		buf_desc = &buf_info->descs[reg_type];
 
 		if (buf_info->types[reg_type] == BUF_TYPE_GEM) {
-			unsigned long size;
+			struct exynos_drm_gem *exynos_gem;
 
-			size = exynos_drm_gem_get_size(drm_dev, handle, file);
-			if (!size) {
+			exynos_gem = exynos_drm_gem_get(drm_dev, handle, file);
+			if (IS_ERR(exynos_gem)) {
 				ret = -EFAULT;
 				goto err;
 			}
 
 			if (!g2d_check_buf_desc_is_valid(buf_desc, reg_type,
-									size)) {
+							 exynos_gem->size)) {
+				exynos_drm_gem_put(drm_dev, exynos_gem);
 				ret = -EFAULT;
 				goto err;
 			}
 
-			addr = exynos_drm_gem_get_dma_addr(drm_dev, handle,
-								file);
-			if (IS_ERR(addr)) {
-				ret = -EFAULT;
-				goto err;
-			}
+			addr = &exynos_gem->dma_addr;
+			buf_info->obj[reg_type] = exynos_gem;
 		} else {
 			struct drm_exynos_g2d_userptr g2d_userptr;
 
@@ -745,7 +739,7 @@ static int g2d_map_cmdlist_gem(struct g2d_data *g2d,
 							g2d_userptr.userptr,
 							g2d_userptr.size,
 							file,
-							&handle);
+							&buf_info->obj[reg_type]);
 			if (IS_ERR(addr)) {
 				ret = -EFAULT;
 				goto err;
@@ -754,7 +748,6 @@ static int g2d_map_cmdlist_gem(struct g2d_data *g2d,
 
 		cmdlist->data[reg_pos + 1] = *addr;
 		buf_info->reg_types[i] = reg_type;
-		buf_info->handles[reg_type] = handle;
 	}
 
 	return 0;
@@ -775,22 +768,21 @@ static void g2d_unmap_cmdlist_gem(struct g2d_data *g2d,
 	for (i = 0; i < buf_info->map_nr; i++) {
 		struct g2d_buf_desc *buf_desc;
 		enum g2d_reg_type reg_type;
-		unsigned long handle;
+		void *obj;
 
 		reg_type = buf_info->reg_types[i];
 
 		buf_desc = &buf_info->descs[reg_type];
-		handle = buf_info->handles[reg_type];
+		obj = buf_info->obj[reg_type];
 
 		if (buf_info->types[reg_type] == BUF_TYPE_GEM)
-			exynos_drm_gem_put_dma_addr(subdrv->drm_dev, handle,
-							filp);
+			exynos_drm_gem_put(subdrv->drm_dev, obj);
 		else
-			g2d_userptr_put_dma_addr(subdrv->drm_dev, handle,
+			g2d_userptr_put_dma_addr(subdrv->drm_dev, obj,
 							false);
 
 		buf_info->reg_types[i] = REG_TYPE_NONE;
-		buf_info->handles[reg_type] = 0;
+		buf_info->obj[reg_type] = NULL;
 		buf_info->types[reg_type] = 0;
 		memset(buf_desc, 0x00, sizeof(*buf_desc));
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index b5db6e6cc043..382e65df5c03 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -169,26 +169,6 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
 	kfree(exynos_gem);
 }
 
-unsigned long exynos_drm_gem_get_size(struct drm_device *dev,
-						unsigned int gem_handle,
-						struct drm_file *file_priv)
-{
-	struct exynos_drm_gem *exynos_gem;
-	struct drm_gem_object *obj;
-
-	obj = drm_gem_object_lookup(dev, file_priv, gem_handle);
-	if (!obj) {
-		DRM_ERROR("failed to lookup gem object.\n");
-		return 0;
-	}
-
-	exynos_gem = to_exynos_gem(obj);
-
-	drm_gem_object_unreference_unlocked(obj);
-
-	return exynos_gem->size;
-}
-
 static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
 						  unsigned long size)
 {
@@ -279,11 +259,10 @@ int exynos_drm_gem_create_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-dma_addr_t *exynos_drm_gem_get_dma_addr(struct drm_device *dev,
-					unsigned int gem_handle,
-					struct drm_file *filp)
+struct exynos_drm_gem *exynos_drm_gem_get(struct drm_device *dev,
+					  unsigned int gem_handle,
+					  struct drm_file *filp)
 {
-	struct exynos_drm_gem *exynos_gem;
 	struct drm_gem_object *obj;
 
 	obj = drm_gem_object_lookup(dev, filp, gem_handle);
@@ -292,30 +271,13 @@ dma_addr_t *exynos_drm_gem_get_dma_addr(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	exynos_gem = to_exynos_gem(obj);
-
-	return &exynos_gem->dma_addr;
+	return to_exynos_gem(obj);
 }
 
-void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
-					unsigned int gem_handle,
-					struct drm_file *filp)
+void exynos_drm_gem_put(struct drm_device *dev,
+			struct exynos_drm_gem *exynos_gem)
 {
-	struct drm_gem_object *obj;
-
-	obj = drm_gem_object_lookup(dev, filp, gem_handle);
-	if (!obj) {
-		DRM_ERROR("failed to lookup gem object.\n");
-		return;
-	}
-
-	drm_gem_object_unreference_unlocked(obj);
-
-	/*
-	 * decrease obj->refcount one more time because we has already
-	 * increased it at exynos_drm_gem_get_dma_addr().
-	 */
-	drm_gem_object_unreference_unlocked(obj);
+	drm_gem_object_unreference_unlocked(&exynos_gem->base);
 }
 
 static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem *exynos_gem,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 9ca5047959ec..d4a49985c8ab 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -72,32 +72,25 @@ int exynos_drm_gem_create_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_priv);
 
 /*
- * get dma address from gem handle and this function could be used for
+ * get exynos drm object from gem handle, this function could be used for
  * other drivers such as 2d/3d acceleration drivers.
  * with this function call, gem object reference count would be increased.
  */
-dma_addr_t *exynos_drm_gem_get_dma_addr(struct drm_device *dev,
-					unsigned int gem_handle,
-					struct drm_file *filp);
+struct exynos_drm_gem *exynos_drm_gem_get(struct drm_device *dev,
+					  unsigned int gem_handle,
+					  struct drm_file *filp);
 
 /*
- * put dma address from gem handle and this function could be used for
- * other drivers such as 2d/3d acceleration drivers.
- * with this function call, gem object reference count would be decreased.
+ * put exynos drm object acquired from exynos_drm_gem_get(),
+ * gem object reference count would be decreased.
  */
-void exynos_drm_gem_put_dma_addr(struct drm_device *dev,
-					unsigned int gem_handle,
-					struct drm_file *filp);
+void exynos_drm_gem_put(struct drm_device *dev,
+			struct exynos_drm_gem *exynos_gem);
 
 /* get buffer information to memory region allocated by gem. */
 int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_priv);
 
-/* get buffer size to gem handle. */
-unsigned long exynos_drm_gem_get_size(struct drm_device *dev,
-						unsigned int gem_handle,
-						struct drm_file *file_priv);
-
 /* free gem object. */
 void exynos_drm_gem_free_object(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 408a14a9a180..0404e18d84cc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -488,10 +488,9 @@ static int ipp_validate_mem_node(struct drm_device *drm_dev,
 		plane_size = width * height * bpp;
 		img_size += plane_size;
 
-		if (m_node->buf_info.handles[i]) {
-			size = exynos_drm_gem_get_size(drm_dev,
-					m_node->buf_info.handles[i],
-					c_node->filp);
+		if (m_node->buf_info.obj[i]) {
+			size = m_node->buf_info.obj[i]->size;
+
 			if (plane_size > size) {
 				DRM_ERROR(
 					"buffer %d is smaller than required\n",
@@ -529,10 +528,9 @@ static int ipp_put_mem_node(struct drm_device *drm_dev,
 
 	/* put gem buffer */
 	for_each_ipp_planar(i) {
-		unsigned long handle = m_node->buf_info.handles[i];
-		if (handle)
-			exynos_drm_gem_put_dma_addr(drm_dev, handle,
-							c_node->filp);
+		struct exynos_drm_gem *obj = m_node->buf_info.obj[i];
+		if (obj)
+			exynos_drm_gem_put(drm_dev, obj);
 	}
 
 	list_del(&m_node->list);
@@ -570,30 +568,23 @@ static struct drm_exynos_ipp_mem_node
 
 		/* get dma address by handle */
 		if (qbuf->handle[i]) {
-			dma_addr_t *addr;
-			unsigned long size;
+			struct exynos_drm_gem *exynos_gem;
 
-			addr = exynos_drm_gem_get_dma_addr(drm_dev,
-					qbuf->handle[i], c_node->filp);
-			if (IS_ERR(addr)) {
-				DRM_ERROR("failed to get addr.\n");
-				ipp_put_mem_node(drm_dev, c_node, m_node);
-				return ERR_PTR(-EFAULT);
-			}
+			exynos_gem = exynos_drm_gem_get(drm_dev,
+						qbuf->handle[i], c_node->filp);
 
-			size = exynos_drm_gem_get_size(drm_dev,
-					qbuf->handle[i], c_node->filp);
-			if (!size) {
-				DRM_ERROR("failed to get size.\n");
+			if (IS_ERR(exynos_gem)) {
+				DRM_ERROR("failed to get gem.\n");
 				ipp_put_mem_node(drm_dev, c_node, m_node);
 				return ERR_PTR(-EFAULT);
 			}
 
-			buf_info->handles[i] = qbuf->handle[i];
-			buf_info->base[i] = *addr;
-			buf_info->size[i] = (uint64_t)size;
+			buf_info->obj[i] = exynos_gem;
+			buf_info->base[i] = exynos_gem->dma_addr;
+			buf_info->size[i] = exynos_gem->size;
 			DRM_DEBUG_KMS("i[%d]base[%pad]hd[0x%lx]sz[%llx]\n", i,
-				      &buf_info->base[i], buf_info->handles[i],
+				      &buf_info->base[i],
+				      (long unsigned)qbuf->handle[i],
 				      buf_info->size[i]);
 		}
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index d4f0b588220b..1dc13bf57b16 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -88,7 +88,7 @@ struct drm_exynos_ipp_cmd_node {
  * @size: Y, Cb, Cr each planar size.
  */
 struct drm_exynos_ipp_buf_info {
-	unsigned long	handles[EXYNOS_DRM_PLANAR_MAX];
+	struct exynos_drm_gem	*obj[EXYNOS_DRM_PLANAR_MAX];
 	dma_addr_t	base[EXYNOS_DRM_PLANAR_MAX];
 	uint64_t	size[EXYNOS_DRM_PLANAR_MAX];
 };
-- 
1.9.2
