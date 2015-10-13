From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] drm/exynos/gem: remove DMA-mapping hacks used for
 constructing page array
Date: Tue, 13 Oct 2015 13:47:20 +0200
Message-ID: <1444736840-22883-1-git-send-email-m.szyprowski@samsung.com>
References: <561CE317.4020209@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15035 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751733AbbJMLrk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 07:47:40 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NW5006PMQ3EBG10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2015 12:47:38 +0100 (BST)
In-reply-to: <561CE317.4020209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Exynos GEM objects contains an array of pointers to the pages, which the
allocated buffer consists of. Till now the code used some hacks (like
relying on DMA-mapping internal structures or using ARM-specific
dma_to_pfn helper) to build this array. This patch fixes this by adding
proper call to dma_get_sgtable_attrs() and using the acquired scatter-list
to construct needed array. This approach is more portable (work also for
ARM64) and finally fixes the layering violation that was present in this
code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Patch is based on exynos-drm-next branch.

v2: use drm_prime_sg_to_page_addr_arrays()
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 58 +++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 29f48756e72f..183aa4a74686 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -25,6 +25,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 	struct drm_device *dev = exynos_gem->base.dev;
 	enum dma_attr attr;
 	unsigned int nr_pages;
+	struct sg_table sgt;
+	int ret = -ENOMEM;
 
 	if (exynos_gem->dma_addr) {
 		DRM_DEBUG_KMS("already allocated.\n");
@@ -56,13 +58,10 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 
 	nr_pages = exynos_gem->size >> PAGE_SHIFT;
 
-	if (!is_drm_iommu_supported(dev)) {
-		exynos_gem->pages = drm_calloc_large(nr_pages,
-						     sizeof(struct page *));
-		if (!exynos_gem->pages) {
-			DRM_ERROR("failed to allocate pages.\n");
-			return -ENOMEM;
-		}
+	exynos_gem->pages = drm_calloc_large(nr_pages, sizeof(struct page *));
+	if (!exynos_gem->pages) {
+		DRM_ERROR("failed to allocate pages.\n");
+		return -ENOMEM;
 	}
 
 	exynos_gem->cookie = dma_alloc_attrs(dev->dev, exynos_gem->size,
@@ -70,30 +69,40 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 					     &exynos_gem->dma_attrs);
 	if (!exynos_gem->cookie) {
 		DRM_ERROR("failed to allocate buffer.\n");
-		if (exynos_gem->pages)
-			drm_free_large(exynos_gem->pages);
-		return -ENOMEM;
+		goto err_free;
 	}
 
-	if (exynos_gem->pages) {
-		dma_addr_t start_addr;
-		unsigned int i = 0;
-
-		start_addr = exynos_gem->dma_addr;
-		while (i < nr_pages) {
-			exynos_gem->pages[i] =
-				pfn_to_page(dma_to_pfn(dev->dev, start_addr));
-			start_addr += PAGE_SIZE;
-			i++;
-		}
-	} else {
-		exynos_gem->pages = exynos_gem->cookie;
+	ret = dma_get_sgtable_attrs(dev->dev, &sgt, exynos_gem->cookie,
+				    exynos_gem->dma_addr, exynos_gem->size,
+				    &exynos_gem->dma_attrs);
+	if (ret < 0) {
+		DRM_ERROR("failed to get sgtable.\n");
+		goto err_dma_free;
+	}
+
+	if (drm_prime_sg_to_page_addr_arrays(&sgt, exynos_gem->pages, NULL,
+					     nr_pages)) {
+		DRM_ERROR("invalid sgtable.\n");
+		ret = -EINVAL;
+		goto err_sgt_free;
 	}
 
+	sg_free_table(&sgt);
+
 	DRM_DEBUG_KMS("dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
 
 	return 0;
+
+err_sgt_free:
+	sg_free_table(&sgt);
+err_dma_free:
+	dma_free_attrs(dev->dev, exynos_gem->size, exynos_gem->cookie,
+		       exynos_gem->dma_addr, &exynos_gem->dma_attrs);
+err_free:
+	drm_free_large(exynos_gem->pages);
+
+	return ret;
 }
 
 static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
@@ -112,8 +121,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 			(dma_addr_t)exynos_gem->dma_addr,
 			&exynos_gem->dma_attrs);
 
-	if (!is_drm_iommu_supported(dev))
-		drm_free_large(exynos_gem->pages);
+	drm_free_large(exynos_gem->pages);
 }
 
 static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
-- 
1.9.2
