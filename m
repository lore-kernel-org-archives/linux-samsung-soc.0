From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] drm/exynos: use real device for DMA-mapping operations
Date: Thu, 18 Feb 2016 14:34:17 +0100
Message-ID: <1455802457-4550-3-git-send-email-m.szyprowski@samsung.com>
References: <1455802457-4550-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:50739 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425399AbcBRNef (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Feb 2016 08:34:35 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2Q00KO6WDKTE90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 18 Feb 2016 13:34:32 +0000 (GMT)
In-reply-to: <1455802457-4550-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch changes device pointer provided to all calls to DMA-mapping
subsystem from the virtual exynos-drm 'device' to the real device pointer
of one of the CRTC devices (decon, fimd or mixer). This way no more hacks
will be needed to configure proper DMA-mapping address space on the common
virtual exynos-drm device. This change also removes the need for some
hacks in IOMMU related code. It also finally solves the problem of Exynos
DRM driver not working on ARM64 architecture, which provides noop-based
DMA-mapping operations for virtual platform devices.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 42 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  8 ++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c   |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_gem.c   | 14 +++++------
 drivers/gpu/drm/exynos/exynos_drm_iommu.c | 37 ++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_iommu.h |  5 ++--
 7 files changed, 67 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 5ab8f1240d7b..c7fce7ffeef5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -130,6 +130,8 @@ static void exynos_drm_atomic_work(struct work_struct *work)
 	exynos_atomic_commit_complete(commit);
 }
 
+static struct device *exynos_drm_get_dma_device(void);
+
 static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 {
 	struct exynos_drm_private *private;
@@ -147,6 +149,16 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	dev_set_drvdata(dev->dev, dev);
 	dev->dev_private = (void *)private;
 
+	/* the first real CRTC device is used for all dma mapping operations */
+	private->dma_dev = exynos_drm_get_dma_device();
+	if (!private->dma_dev) {
+		DRM_ERROR("no device found for DMA mapping operations.\n");
+		ret = -ENODEV;
+		goto err_free_private;
+	}
+	DRM_INFO("Exynos DRM: using %s device for DMA mapping operations\n",
+		 dev_name(private->dma_dev));
+
 	/*
 	 * create mapping to manage iommu table and set a pointer to iommu
 	 * mapping structure to iommu_mapping of private data.
@@ -502,6 +514,7 @@ struct exynos_drm_driver_info {
 
 #define DRM_COMPONENT_DRIVER	BIT(0)	/* supports component framework */
 #define DRM_VIRTUAL_DEVICE	BIT(1)	/* create virtual platform device */
+#define DRM_DMA_DEVICE		BIT(2)	/* can be used for dma allocations */
 
 #define DRV_PTR(drv, cond) (IS_ENABLED(cond) ? &drv : NULL)
 
@@ -512,16 +525,16 @@ struct exynos_drm_driver_info {
 static struct exynos_drm_driver_info exynos_drm_drivers[] = {
 	{
 		DRV_PTR(fimd_driver, CONFIG_DRM_EXYNOS_FIMD),
-		DRM_COMPONENT_DRIVER
+		DRM_COMPONENT_DRIVER | DRM_DMA_DEVICE
 	}, {
 		DRV_PTR(exynos5433_decon_driver, CONFIG_DRM_EXYNOS5433_DECON),
-		DRM_COMPONENT_DRIVER
+		DRM_COMPONENT_DRIVER | DRM_DMA_DEVICE
 	}, {
 		DRV_PTR(decon_driver, CONFIG_DRM_EXYNOS7_DECON),
-		DRM_COMPONENT_DRIVER
+		DRM_COMPONENT_DRIVER | DRM_DMA_DEVICE
 	}, {
 		DRV_PTR(mixer_driver, CONFIG_DRM_EXYNOS_MIXER),
-		DRM_COMPONENT_DRIVER
+		DRM_COMPONENT_DRIVER | DRM_DMA_DEVICE
 	}, {
 		DRV_PTR(mic_driver, CONFIG_DRM_EXYNOS_MIC),
 		DRM_COMPONENT_DRIVER
@@ -629,6 +642,27 @@ static struct platform_driver exynos_drm_platform_driver = {
 	},
 };
 
+static struct device *exynos_drm_get_dma_device(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(exynos_drm_drivers); ++i) {
+		struct exynos_drm_driver_info *info = &exynos_drm_drivers[i];
+		struct device *dev;
+
+		if (!info->driver || !(info->flags & DRM_DMA_DEVICE))
+			continue;
+
+		while ((dev = bus_find_device(&platform_bus_type, NULL,
+					    &info->driver->driver,
+					    (void *)platform_bus_type.match))) {
+			put_device(dev);
+			return dev;
+		}
+	}
+	return NULL;
+}
+
 static void exynos_drm_unregister_devices(void)
 {
 	int i;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 34a139b2fb8d..303056311c0c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -219,8 +219,10 @@ struct exynos_drm_private {
 	struct drm_crtc *crtc[MAX_CRTC];
 	struct drm_property *plane_zpos_property;
 
+	struct device *dma_dev;
 	unsigned long da_start;
 	unsigned long da_space_size;
+	void *mapping;
 
 	unsigned int pipe;
 
@@ -230,6 +232,12 @@ struct exynos_drm_private {
 	wait_queue_head_t	wait;
 };
 
+static inline struct device *to_dma_dev(struct drm_device *dev)
+{
+	struct exynos_drm_private *priv = dev->dev_private;
+	return priv->dma_dev;
+}
+
 /*
  * Exynos drm sub driver structure.
  *
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 8baabd813ff5..4ae860c44f1d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -50,7 +50,7 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
 	if (vm_size > exynos_gem->size)
 		return -EINVAL;
 
-	ret = dma_mmap_attrs(helper->dev->dev, vma, exynos_gem->cookie,
+	ret = dma_mmap_attrs(to_dma_dev(helper->dev), vma, exynos_gem->cookie,
 			     exynos_gem->dma_addr, exynos_gem->size,
 			     &exynos_gem->dma_attrs);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index c17efdb238a6..c2223a8861df 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -259,7 +259,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
 	init_dma_attrs(&g2d->cmdlist_dma_attrs);
 	dma_set_attr(DMA_ATTR_WRITE_COMBINE, &g2d->cmdlist_dma_attrs);
 
-	g2d->cmdlist_pool_virt = dma_alloc_attrs(subdrv->drm_dev->dev,
+	g2d->cmdlist_pool_virt = dma_alloc_attrs(to_dma_dev(subdrv->drm_dev),
 						G2D_CMDLIST_POOL_SIZE,
 						&g2d->cmdlist_pool, GFP_KERNEL,
 						&g2d->cmdlist_dma_attrs);
@@ -293,7 +293,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
 	return 0;
 
 err:
-	dma_free_attrs(subdrv->drm_dev->dev, G2D_CMDLIST_POOL_SIZE,
+	dma_free_attrs(to_dma_dev(subdrv->drm_dev), G2D_CMDLIST_POOL_SIZE,
 			g2d->cmdlist_pool_virt,
 			g2d->cmdlist_pool, &g2d->cmdlist_dma_attrs);
 	return ret;
@@ -306,7 +306,7 @@ static void g2d_fini_cmdlist(struct g2d_data *g2d)
 	kfree(g2d->cmdlist_node);
 
 	if (g2d->cmdlist_pool_virt && g2d->cmdlist_pool) {
-		dma_free_attrs(subdrv->drm_dev->dev, G2D_CMDLIST_POOL_SIZE,
+		dma_free_attrs(to_dma_dev(subdrv->drm_dev), G2D_CMDLIST_POOL_SIZE,
 				g2d->cmdlist_pool_virt,
 				g2d->cmdlist_pool, &g2d->cmdlist_dma_attrs);
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 037436d18422..f15ade86f771 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -65,7 +65,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 		return -ENOMEM;
 	}
 
-	exynos_gem->cookie = dma_alloc_attrs(dev->dev, exynos_gem->size,
+	exynos_gem->cookie = dma_alloc_attrs(to_dma_dev(dev), exynos_gem->size,
 					     &exynos_gem->dma_addr, GFP_KERNEL,
 					     &exynos_gem->dma_attrs);
 	if (!exynos_gem->cookie) {
@@ -73,7 +73,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 		goto err_free;
 	}
 
-	ret = dma_get_sgtable_attrs(dev->dev, &sgt, exynos_gem->cookie,
+	ret = dma_get_sgtable_attrs(to_dma_dev(dev), &sgt, exynos_gem->cookie,
 				    exynos_gem->dma_addr, exynos_gem->size,
 				    &exynos_gem->dma_attrs);
 	if (ret < 0) {
@@ -98,7 +98,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 err_sgt_free:
 	sg_free_table(&sgt);
 err_dma_free:
-	dma_free_attrs(dev->dev, exynos_gem->size, exynos_gem->cookie,
+	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
 		       exynos_gem->dma_addr, &exynos_gem->dma_attrs);
 err_free:
 	drm_free_large(exynos_gem->pages);
@@ -118,7 +118,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 	DRM_DEBUG_KMS("dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
 
-	dma_free_attrs(dev->dev, exynos_gem->size, exynos_gem->cookie,
+	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
 			&exynos_gem->dma_attrs);
 
@@ -335,7 +335,7 @@ static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem *exynos_gem,
 	if (vm_size > exynos_gem->size)
 		return -EINVAL;
 
-	ret = dma_mmap_attrs(drm_dev->dev, vma, exynos_gem->cookie,
+	ret = dma_mmap_attrs(to_dma_dev(drm_dev), vma, exynos_gem->cookie,
 			     exynos_gem->dma_addr, exynos_gem->size,
 			     &exynos_gem->dma_attrs);
 	if (ret < 0) {
@@ -381,7 +381,7 @@ int exynos_gem_map_sgt_with_dma(struct drm_device *drm_dev,
 
 	mutex_lock(&drm_dev->struct_mutex);
 
-	nents = dma_map_sg(drm_dev->dev, sgt->sgl, sgt->nents, dir);
+	nents = dma_map_sg(to_dma_dev(drm_dev), sgt->sgl, sgt->nents, dir);
 	if (!nents) {
 		DRM_ERROR("failed to map sgl with dma.\n");
 		mutex_unlock(&drm_dev->struct_mutex);
@@ -396,7 +396,7 @@ void exynos_gem_unmap_sgt_from_dma(struct drm_device *drm_dev,
 				struct sg_table *sgt,
 				enum dma_data_direction dir)
 {
-	dma_unmap_sg(drm_dev->dev, sgt->sgl, sgt->nents, dir);
+	dma_unmap_sg(to_dma_dev(drm_dev), sgt->sgl, sgt->nents, dir);
 }
 
 void exynos_drm_gem_free_object(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.c b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
index d73b9ad35b7a..146ac88078ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
@@ -30,7 +30,6 @@ int drm_create_iommu_mapping(struct drm_device *drm_dev)
 {
 	struct dma_iommu_mapping *mapping = NULL;
 	struct exynos_drm_private *priv = drm_dev->dev_private;
-	struct device *dev = drm_dev->dev;
 
 	if (!priv->da_start)
 		priv->da_start = EXYNOS_DEV_ADDR_START;
@@ -43,18 +42,9 @@ int drm_create_iommu_mapping(struct drm_device *drm_dev)
 	if (IS_ERR(mapping))
 		return PTR_ERR(mapping);
 
-	dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
-					GFP_KERNEL);
-	if (!dev->dma_parms)
-		goto error;
-
-	dma_set_max_seg_size(dev, 0xffffffffu);
-	dev->archdata.mapping = mapping;
+	priv->mapping = mapping;
 
 	return 0;
-error:
-	arm_iommu_release_mapping(mapping);
-	return -ENOMEM;
 }
 
 /*
@@ -67,9 +57,9 @@ error:
  */
 void drm_release_iommu_mapping(struct drm_device *drm_dev)
 {
-	struct device *dev = drm_dev->dev;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	arm_iommu_release_mapping(dev->archdata.mapping);
+	arm_iommu_release_mapping(priv->mapping);
 }
 
 /*
@@ -84,10 +74,10 @@ void drm_release_iommu_mapping(struct drm_device *drm_dev)
 int drm_iommu_attach_device(struct drm_device *drm_dev,
 				struct device *subdrv_dev)
 {
-	struct device *dev = drm_dev->dev;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	int ret;
 
-	if (!dev->archdata.mapping)
+	if (!priv->mapping)
 		return 0;
 
 	subdrv_dev->dma_parms = devm_kzalloc(subdrv_dev,
@@ -101,23 +91,12 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 	if (subdrv_dev->archdata.mapping)
 		arm_iommu_detach_device(subdrv_dev);
 
-	ret = arm_iommu_attach_device(subdrv_dev, dev->archdata.mapping);
+	ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
 	if (ret < 0) {
 		DRM_DEBUG_KMS("failed iommu attach.\n");
 		return ret;
 	}
 
-	/*
-	 * Set dma_ops to drm_device just one time.
-	 *
-	 * The dma mapping api needs device object and the api is used
-	 * to allocate physial memory and map it with iommu table.
-	 * If iommu attach succeeded, the sub driver would have dma_ops
-	 * for iommu and also all sub drivers have same dma_ops.
-	 */
-	if (get_dma_ops(dev) == get_dma_ops(NULL))
-		set_dma_ops(dev, get_dma_ops(subdrv_dev));
-
 	return 0;
 }
 
@@ -133,8 +112,8 @@ int drm_iommu_attach_device(struct drm_device *drm_dev,
 void drm_iommu_detach_device(struct drm_device *drm_dev,
 				struct device *subdrv_dev)
 {
-	struct device *dev = drm_dev->dev;
-	struct dma_iommu_mapping *mapping = dev->archdata.mapping;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct dma_iommu_mapping *mapping = priv->mapping;
 
 	if (!mapping || !mapping->domain)
 		return;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.h b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
index dc1b5441f491..c1584f24d23d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.h
@@ -29,9 +29,8 @@ void drm_iommu_detach_device(struct drm_device *dev_dev,
 
 static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
 {
-	struct device *dev = drm_dev->dev;
-
-	return dev->archdata.mapping ? true : false;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	return priv->mapping ? true : false;
 }
 
 #else
-- 
1.9.2
