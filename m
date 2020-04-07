Return-Path: <SRS0=NNbO=5X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2C1C2BB86
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Apr 2020 13:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E753206F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Apr 2020 13:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ud4pMDH/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgDGNnS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Apr 2020 09:43:18 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35135 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgDGNnR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Apr 2020 09:43:17 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200407134315euoutp016c30962bc74c9d205597c0d36a8dbc83~DjW2Ls_Ls2409524095euoutp01e
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Apr 2020 13:43:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200407134315euoutp016c30962bc74c9d205597c0d36a8dbc83~DjW2Ls_Ls2409524095euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586266995;
        bh=TyyQfhEc1u2kAJ8LAO4nnLnGsh3p7Of0VJXjvuRadoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ud4pMDH/2x1nHKnaj6bxTeiCkRJXnYj5qhz5UBrEIw0FQe04yVBxvRBK2t0jU880+
         axRsnvq/WSsdHc4BFl2+5zJ6wkmNosfRavmXEkWMRTa5HBJMpi54bwlW6v2raP0IaX
         ombC5RkfSXfBMvKL8nPqqcuytC8OrUSX1AHKVOyQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200407134315eucas1p11b8ea3f2d65c5a9bccc2907a2b2e413e~DjW19rk9f0333903339eucas1p11;
        Tue,  7 Apr 2020 13:43:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A2.DC.60698.3738C8E5; Tue,  7
        Apr 2020 14:43:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200407134314eucas1p1895d868d9dbf5eee08c675dd10266d81~DjW1dp0ZE2294322943eucas1p1Q;
        Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200407134314eusmtrp16623a828f9a6d1d1922a7dc36355bfc8~DjW1dH9Lf2789027890eusmtrp1O;
        Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-c8-5e8c83732941
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 50.2F.08375.2738C8E5; Tue,  7
        Apr 2020 14:43:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200407134314eusmtip1242fa0534add2d07a7157963de415d1b~DjW1BV0GN0417004170eusmtip1y;
        Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] drm/exynos: gem: Get rid of the internal 'pages' array
Date:   Tue,  7 Apr 2020 15:42:56 +0200
Message-Id: <20200407134256.9129-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407134256.9129-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87rFzT1xBnc3slncWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOYrLJiU1J7Ms
        tUjfLoEr4//Mm0wFGxIrPnT/Zm9g/OHfxcjBISFgIrGoq66LkYtDSGAFo8Tc06dZIZwvjBIz
        vvawQDifGSWO7JjM3sXICdZxadYDJhBbSGA5o8SxecwQNlDH5GseIDabgKFE19suNhBbRMBN
        ounwTLCpzALXGSW+/VgENkhYwFti/6FNjCA2i4CqxJOmVWCDeAVsJCZfvgm1TF5i9YYDYHFO
        AVuJCzt2sULUCEqcnPmEBcRmBqpp3jqbGWSBhMBkdom3h++yQTS7SJy7sQ5qkLDEq+NboGwZ
        idOTIV6TEGhmlHh4bi07hNPDKHG5aQYjRJW1xJ1zv9hAocQsoCmxfpc+RNhR4tLVi8yQwOOT
        uPFWEOIIPolJ26ZDhXklOtqEIKrVJGYdXwe39uCFS8wQtofE0Wf7WCcwKs5C8s4sJO/MQti7
        gJF5FaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmBaOf3v+NcdjPv+JB1iFOBgVOLhfZDY
        EyfEmlhWXJl7iFGCg1lJhFeqtzNOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp
        2ampBalFMFkmDk6pBsbwsB+Hime+/1VWc+mcSump2zke/fOO7Jq/xM3S1bCosIUndO5ezwt7
        Kn11Xq1xvnDgN5NJaseOJKGb0ut8n+Ssdn5UxaNTxrbOfOtXjfrH5/Pv5R58+d6/+9lrAwcl
        q/lhMTMPShWu3C8u9dzZU+d76bralRP08kPTjs7M+f7QVu3UolcMkbVKLMUZiYZazEXFiQDv
        dlzoJwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsVy+t/xu7pFzT1xBjfuKFjcWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4//Mm0wFGxIrPnT/
        Zm9g/OHfxcjJISFgInFp1gOmLkYuDiGBpYwSqy8sZIdIyEicnNbACmELS/y51sUGUfSJUeLg
        1ZssIAk2AUOJrrcgCU4OEQEPieZvx9lBipgFbjNKLP0wD6xIWMBbYv+hTYwgNouAqsSTplXM
        IDavgI3E5Ms3obbJS6zecAAszilgK3Fhxy6wzUJANZ8/PmeFqBeUODnzCdBMDqAF6hLr5wmB
        hJmBWpu3zmaewCg4C0nVLISqWUiqFjAyr2IUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMl23H
        fm7ewXhpY/AhRgEORiUe3geJPXFCrIllxZW5hxglOJiVRHilejvjhHhTEiurUovy44tKc1KL
        DzGaAr02kVlKNDkfGMt5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4
        pRoY9cTUC26FuR2deeBAX+YrrdDZgi21f6ckSOmHrtAoYty2zmjV96ObNb7cmK0ys+wdT6RC
        QI71nKB48boIoT3za0piZlXOWVA3eY0aU5kFR+29RZKz179fsGfqmooJzHd7CrsWHe9cHK1f
        9fjEWhcHCe7Nv3jOZfLoaDwWvvOwxM+MccVDlXRzJZbijERDLeai4kQAi6qhQ60CAAA=
X-CMS-MailID: 20200407134314eucas1p1895d868d9dbf5eee08c675dd10266d81
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200407134314eucas1p1895d868d9dbf5eee08c675dd10266d81
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407134314eucas1p1895d868d9dbf5eee08c675dd10266d81
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134314eucas1p1895d868d9dbf5eee08c675dd10266d81@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Internal pages array and scatter-list for them is not really needed for
anything. FBDev emulation can simply rely on the DMA-mapping framework
to create a proper kernel mapping for the buffer, while all other buffer
use cases don't really need that array at all.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  28 +----
 drivers/gpu/drm/exynos/exynos_drm_gem.c   | 124 +++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |  13 +--
 3 files changed, 42 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index e6ceaf36fb04..56a2b47e1af7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -76,7 +76,6 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 	struct fb_info *fbi;
 	struct drm_framebuffer *fb = helper->fb;
 	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
-	unsigned int nr_pages;
 	unsigned long offset;
 
 	fbi = drm_fb_helper_alloc_fbi(helper);
@@ -90,16 +89,6 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
-	nr_pages = exynos_gem->size >> PAGE_SHIFT;
-
-	exynos_gem->kvaddr = (void __iomem *) vmap(exynos_gem->pages, nr_pages,
-				VM_MAP, pgprot_writecombine(PAGE_KERNEL));
-	if (!exynos_gem->kvaddr) {
-		DRM_DEV_ERROR(to_dma_dev(helper->dev),
-			      "failed to map pages to kernel space.\n");
-		return -EIO;
-	}
-
 	offset = fbi->var.xoffset * fb->format->cpp[0];
 	offset += fbi->var.yoffset * fb->pitches[0];
 
@@ -133,18 +122,7 @@ static int exynos_drm_fbdev_create(struct drm_fb_helper *helper,
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 
-	exynos_gem = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG, size);
-	/*
-	 * If physically contiguous memory allocation fails and if IOMMU is
-	 * supported then try to get buffer from non physically contiguous
-	 * memory area.
-	 */
-	if (IS_ERR(exynos_gem) && is_drm_iommu_supported(dev)) {
-		dev_warn(dev->dev, "contiguous FB allocation failed, falling back to non-contiguous\n");
-		exynos_gem = exynos_drm_gem_create(dev, EXYNOS_BO_NONCONTIG,
-						   size);
-	}
-
+	exynos_gem = exynos_drm_gem_create(dev, EXYNOS_BO_WC, size, true);
 	if (IS_ERR(exynos_gem))
 		return PTR_ERR(exynos_gem);
 
@@ -229,12 +207,8 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 static void exynos_drm_fbdev_destroy(struct drm_device *dev,
 				      struct drm_fb_helper *fb_helper)
 {
-	struct exynos_drm_fbdev *exynos_fbd = to_exynos_fbdev(fb_helper);
-	struct exynos_drm_gem *exynos_gem = exynos_fbd->exynos_gem;
 	struct drm_framebuffer *fb;
 
-	vunmap(exynos_gem->kvaddr);
-
 	/* release drm framebuffer and real buffer */
 	if (fb_helper->fb && fb_helper->fb->funcs) {
 		fb = fb_helper->fb;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 9d4e4d321bda..3c2732380517 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -17,28 +17,23 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_gem.h"
 
-static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
+static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 {
 	struct drm_device *dev = exynos_gem->base.dev;
-	unsigned long attr;
-	unsigned int nr_pages;
-	struct sg_table sgt;
-	int ret = -ENOMEM;
+	unsigned long attr = 0;
 
 	if (exynos_gem->dma_addr) {
 		DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "already allocated.\n");
 		return 0;
 	}
 
-	exynos_gem->dma_attrs = 0;
-
 	/*
 	 * if EXYNOS_BO_CONTIG, fully physically contiguous memory
 	 * region will be allocated else physically contiguous
 	 * as possible.
 	 */
 	if (!(exynos_gem->flags & EXYNOS_BO_NONCONTIG))
-		exynos_gem->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
+		attr |= DMA_ATTR_FORCE_CONTIGUOUS;
 
 	/*
 	 * if EXYNOS_BO_WC or EXYNOS_BO_NONCACHABLE, writecombine mapping
@@ -46,61 +41,29 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 	 */
 	if (exynos_gem->flags & EXYNOS_BO_WC ||
 			!(exynos_gem->flags & EXYNOS_BO_CACHABLE))
-		attr = DMA_ATTR_WRITE_COMBINE;
+		attr |= DMA_ATTR_WRITE_COMBINE;
 	else
-		attr = DMA_ATTR_NON_CONSISTENT;
-
-	exynos_gem->dma_attrs |= attr;
-	exynos_gem->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
-
-	nr_pages = exynos_gem->size >> PAGE_SHIFT;
+		attr |= DMA_ATTR_NON_CONSISTENT;
 
-	exynos_gem->pages = kvmalloc_array(nr_pages, sizeof(struct page *),
-			GFP_KERNEL | __GFP_ZERO);
-	if (!exynos_gem->pages) {
-		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate pages.\n");
-		return -ENOMEM;
-	}
+	/* FBDev emulation requires kernel mapping */
+	if (!kvmap)
+		attr |= DMA_ATTR_NO_KERNEL_MAPPING;
 
+	exynos_gem->dma_attrs = attr;
 	exynos_gem->cookie = dma_alloc_attrs(to_dma_dev(dev), exynos_gem->size,
 					     &exynos_gem->dma_addr, GFP_KERNEL,
 					     exynos_gem->dma_attrs);
 	if (!exynos_gem->cookie) {
 		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate buffer.\n");
-		goto err_free;
-	}
-
-	ret = dma_get_sgtable_attrs(to_dma_dev(dev), &sgt, exynos_gem->cookie,
-				    exynos_gem->dma_addr, exynos_gem->size,
-				    exynos_gem->dma_attrs);
-	if (ret < 0) {
-		DRM_DEV_ERROR(to_dma_dev(dev), "failed to get sgtable.\n");
-		goto err_dma_free;
-	}
-
-	if (drm_prime_sg_to_page_addr_arrays(&sgt, exynos_gem->pages, NULL,
-					     nr_pages)) {
-		DRM_DEV_ERROR(to_dma_dev(dev), "invalid sgtable.\n");
-		ret = -EINVAL;
-		goto err_sgt_free;
+		return -ENOMEM;
 	}
 
-	sg_free_table(&sgt);
+	if (kvmap)
+		exynos_gem->kvaddr = exynos_gem->cookie;
 
 	DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
-
 	return 0;
-
-err_sgt_free:
-	sg_free_table(&sgt);
-err_dma_free:
-	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
-		       exynos_gem->dma_addr, exynos_gem->dma_attrs);
-err_free:
-	kvfree(exynos_gem->pages);
-
-	return ret;
 }
 
 static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
@@ -118,8 +81,6 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
 			exynos_gem->dma_attrs);
-
-	kvfree(exynos_gem->pages);
 }
 
 static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
@@ -203,7 +164,8 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
 
 struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
 					     unsigned int flags,
-					     unsigned long size)
+					     unsigned long size,
+					     bool kvmap)
 {
 	struct exynos_drm_gem *exynos_gem;
 	int ret;
@@ -237,7 +199,7 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
 	/* set memory type and cache attribute from user side. */
 	exynos_gem->flags = flags;
 
-	ret = exynos_drm_alloc_buf(exynos_gem);
+	ret = exynos_drm_alloc_buf(exynos_gem, kvmap);
 	if (ret < 0) {
 		drm_gem_object_release(&exynos_gem->base);
 		kfree(exynos_gem);
@@ -254,7 +216,7 @@ int exynos_drm_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct exynos_drm_gem *exynos_gem;
 	int ret;
 
-	exynos_gem = exynos_drm_gem_create(dev, args->flags, args->size);
+	exynos_gem = exynos_drm_gem_create(dev, args->flags, args->size, false);
 	if (IS_ERR(exynos_gem))
 		return PTR_ERR(exynos_gem);
 
@@ -365,7 +327,7 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	else
 		flags = EXYNOS_BO_CONTIG | EXYNOS_BO_WC;
 
-	exynos_gem = exynos_drm_gem_create(dev, flags, args->size);
+	exynos_gem = exynos_drm_gem_create(dev, flags, args->size, false);
 	if (IS_ERR(exynos_gem)) {
 		dev_warn(dev->dev, "FB allocation failed.\n");
 		return PTR_ERR(exynos_gem);
@@ -442,11 +404,24 @@ struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
 struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
-	int npages;
+	struct drm_device *drm_dev = obj->dev;
+	struct sg_table *sgt;
+	int ret;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
 
-	npages = exynos_gem->size >> PAGE_SHIFT;
+	ret = dma_get_sgtable_attrs(to_dma_dev(drm_dev), sgt, exynos_gem->cookie,
+				    exynos_gem->dma_addr, exynos_gem->size,
+				    exynos_gem->dma_attrs);
+	if (ret) {
+		DRM_ERROR("failed to get sgtable, %d\n", ret);
+		kfree(sgt);
+		return ERR_PTR(ret);
+	}
 
-	return drm_prime_pages_to_sg(exynos_gem->pages, npages);
+	return sgt;
 }
 
 struct drm_gem_object *
@@ -455,8 +430,6 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 				     struct sg_table *sgt)
 {
 	struct exynos_drm_gem *exynos_gem;
-	int npages;
-	int ret;
 
 	if (sgt->nents != 1) {
 		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
@@ -476,26 +449,8 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 	}
 
 	exynos_gem = exynos_drm_gem_init(dev, attach->dmabuf->size);
-	if (IS_ERR(exynos_gem)) {
-		ret = PTR_ERR(exynos_gem);
-		return ERR_PTR(ret);
-	}
-
-	exynos_gem->dma_addr = sg_dma_address(sgt->sgl);
-
-	npages = exynos_gem->size >> PAGE_SHIFT;
-	exynos_gem->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
-	if (!exynos_gem->pages) {
-		ret = -ENOMEM;
-		goto err;
-	}
-
-	ret = drm_prime_sg_to_page_addr_arrays(sgt, exynos_gem->pages, NULL,
-					       npages);
-	if (ret < 0)
-		goto err_free_large;
-
-	exynos_gem->sgt = sgt;
+	if (IS_ERR(exynos_gem))
+		return ERR_CAST(exynos_gem);
 
 	/*
 	 * Buffer has been mapped as contiguous into DMA address space,
@@ -507,14 +462,9 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 	else
 		exynos_gem->flags |= EXYNOS_BO_CONTIG;
 
+	exynos_gem->dma_addr = sg_dma_address(sgt->sgl);
+	exynos_gem->sgt = sgt;
 	return &exynos_gem->base;
-
-err_free_large:
-	kvfree(exynos_gem->pages);
-err:
-	drm_gem_object_release(&exynos_gem->base);
-	kfree(exynos_gem);
-	return ERR_PTR(ret);
 }
 
 void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index f00044c0b688..6ef001f890aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -21,20 +21,15 @@
  * @base: a gem object.
  *	- a new handle to this gem object would be created
  *	by drm_gem_handle_create().
- * @buffer: a pointer to exynos_drm_gem_buffer object.
- *	- contain the information to memory region allocated
- *	by user request or at framebuffer creation.
- *	continuous memory region allocated by user request
- *	or at framebuffer creation.
  * @flags: indicate memory type to allocated buffer and cache attruibute.
  * @size: size requested from user, in bytes and this size is aligned
  *	in page unit.
  * @cookie: cookie returned by dma_alloc_attrs
- * @kvaddr: kernel virtual address to allocated memory region.
+ * @kvaddr: kernel virtual address to allocated memory region (for fbdev)
  * @dma_addr: bus address(accessed by dma) to allocated memory region.
  *	- this address could be physical address without IOMMU and
  *	device address with IOMMU.
- * @pages: Array of backing pages.
+ * @dma_attrs: attrs passed dma mapping framework
  * @sgt: Imported sg_table.
  *
  * P.S. this object would be transferred to user as kms_bo.handle so
@@ -48,7 +43,6 @@ struct exynos_drm_gem {
 	void __iomem		*kvaddr;
 	dma_addr_t		dma_addr;
 	unsigned long		dma_attrs;
-	struct page		**pages;
 	struct sg_table		*sgt;
 };
 
@@ -58,7 +52,8 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem);
 /* create a new buffer with gem object */
 struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
 					     unsigned int flags,
-					     unsigned long size);
+					     unsigned long size,
+					     bool kvmap);
 
 /*
  * request gem object creation and buffer allocation as the size
-- 
2.17.1

