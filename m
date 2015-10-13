From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos/gem: remove DMA-mapping hacks used for constructing
 page array
Date: Tue, 13 Oct 2015 12:22:29 +0200
Message-ID: <1444731749-10759-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60462 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932293AbbJMKWs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2015 06:22:48 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NW500KOSM5XIYA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2015 11:22:45 +0100 (BST)
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
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 60 +++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 29f48756e72f..e998a64a3dd0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -25,6 +25,10 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 	struct drm_device *dev = exynos_gem->base.dev;
 	enum dma_attr attr;
 	unsigned int nr_pages;
+	struct sg_table sgt;
+	struct scatterlist *s;
+	int ret = -ENOMEM;
+	int i, j;
 
 	if (exynos_gem->dma_addr) {
 		DRM_DEBUG_KMS("already allocated.\n");
@@ -56,13 +60,10 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 
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
@@ -70,30 +71,40 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
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
+	j = 0;
+	for_each_sg(sgt.sgl, s, sgt.orig_nents, i) {
+		int size = s->length >> PAGE_SHIFT;
+		struct page *page = sg_page(s);
+
+		while (size-- > 0)
+			exynos_gem->pages[j++] = page++;
 	}
 
+	sg_free_table(&sgt);
+
 	DRM_DEBUG_KMS("dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
 
 	return 0;
+
+err_dma_free:
+	dma_free_attrs(dev->dev, exynos_gem->size, exynos_gem->cookie,
+		       exynos_gem->dma_addr, &exynos_gem->dma_attrs);
+err_free:
+	drm_free_large(exynos_gem->pages);
+
+	return ret;
 }
 
 static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
@@ -112,8 +123,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 			(dma_addr_t)exynos_gem->dma_addr,
 			&exynos_gem->dma_attrs);
 
-	if (!is_drm_iommu_supported(dev))
-		drm_free_large(exynos_gem->pages);
+	drm_free_large(exynos_gem->pages);
 }
 
 static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
-- 
1.9.2
