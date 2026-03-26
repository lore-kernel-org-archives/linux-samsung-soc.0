Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA435372EDD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518205; cv=none; b=R+IlA2DgsrYb1vzzxUl2i1bFfsXBuMKKXSxz7qke/VhLrtkPcLRXBN4/SIdm6FHHCLRbOEAbE5hCQia0p5GdnbepA1vmAB8KCK7o/nGYxrYNrX3RqQPctNT2VetQgg+ys7XPHupOgVbJ2PMYMRMHQljnY8EFnHnblxpl7zRyvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518205; c=relaxed/simple;
	bh=BE72tce1L31n71bWUl8TGOmEDAkdgogAY52+9Yrj/tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+6WPR2dP4fVPPgmsKgyAlaM20e2GcJonxhp8WJBF2aEj/SBJ2OEDwMyzf9TUhSRsqfs09HuGxe9hZ3Avei9gT4+n9H+hcfyYunyaRLBk4LxR80gCBA1ogvkDtLyFAmylGTORNdWFKePqOPl4Ia76GMHljojjlOm0hHGPhqjfZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LTck6pdY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LTck6pdY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so394850a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518203; x=1775123003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv3DgahW+8Di+Ae6kVC5TLkHixUv+/CDEG1z0t/clqU=;
        b=LTck6pdYllWxchbgkBoSAmjxZi6W/Fko58hV0yDZkpr3Rj8VJl+QifDp7Adz/JbQX7
         bA5XjQ3I7115A8gfNRMQs/d620U8xVVQGIHxrwiJQX56EFfxVXNdbgb1qjYul19ng9N5
         yezFEEVIyfEYsDHkgHFO5Msk13fvOE4bLBhio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518203; x=1775123003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yv3DgahW+8Di+Ae6kVC5TLkHixUv+/CDEG1z0t/clqU=;
        b=cQR7hQD3ZVTdAxBk/fUdsNuOHMi4iAsdvZCTtHiQDZNXIh1tjHNsesIjbYbsxTmUYk
         LjRvDukiZjUwu4klijIP4A4AORTM0ZiLoX1aO7Wqa8SsQ78visdIKAZRUvUdCYQsZcvd
         t3bfpcmU8uA98uYsTYXLugbHwNjc7zqz62RUA1ZOZ8A2ascBp4HpHJiGJzPdjT4Wc+LZ
         aR4KrCayBjwBgeEHc2ME+veYh0YPeUaP3TmX5w2ATnUVQsHmMQ8b6nx+XdPkbplng7lR
         uwCCWN9OuHZZ9cVFKcrYMzB1CLdmYuIUM3J76FbX10gptAe9KU3Hw6jL7KqIkYj8Maci
         CY6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhxr/rijbFoQbIK7KTwnRt+GH5wjIJmb0EGm327dHFw5KC7qXGVmU0lcGZm0CnPAFTZiH2Bkjzbuch2fiyRhG3nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2cKWuZ/qXchqdKX9SJ+cQ4LLrwtDn0XfURqlqOQrPTbLBMdgV
	EfrwZaP+6xhFcuLo2IFQb5JBtYuMysxjHEwMltHYbkgFgXntlpmfIT9ZA+UQ2m4+mQ==
X-Gm-Gg: ATEYQzzlruPpxCJKihBm1lfFKE8H3hd5rdFfDOHHTT7ogARkbosvZdXMUkQqUltbP1X
	7OnAuu2zq7wZakVam+z7+A0IXYb38ogwaiEQvYf3641sYratNre9s3V/C9H8wyBT9LCkcaBPKfA
	VDE9nHCTKeuwhAU2vdecPWCU4YKYYldk6QF9RReYpFaYMoBYuwFR0FowxUaf13VX4B1AZV3Dn1O
	znCjSdcxI9pzzIo4OxnEAQEOMvQh2x5OYNP7CamkhZ8P5O+VsfmKJ4sKX7iLwL7ajco8/H1TXSA
	Rf69c7da//fP8EtNK6ik4CMLpXGJKixY1HkvSPshXIXbPNoux1hgwUTdIcegm6vCbhCmZamE9x4
	n0Q98R/lW+XDhuwrUiQsJxqSY154u7IVZXiHFJL+FZrFM2Y6Ng9B+gHILKabKZlaNKh4+nF9ZIr
	EVnmSYaNwKGaK/dFq1dpQoQRp/Hqbqj27pPZJ0vODexm6wiHFFe2jDyN6BlIQ57V2QxbTsG+rSp
	KIF73dh
X-Received: by 2002:a05:6a21:9991:b0:39b:e321:67ea with SMTP id adf61e73a8af0-39c4ada6b00mr7445920637.45.1774518203067;
        Thu, 26 Mar 2026 02:43:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/exynos: Use DRM core dedicated DMA device tracking facility
Date: Thu, 26 Mar 2026 17:43:04 +0800
Message-ID: <20260326094308.1161335-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
References: <20260326094308.1161335-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exynos driver tracks a dedicated DMA device in its private data.
The DRM core already has facilities to do this, and it is integrated
into DRM PRIME imports and GEM DMA helpers.

Convert the exynos driver to use the core's dedicated DMA device
tracking facility. Also get rid of exynos_drm_gem_prime_import() as
it is identical to drm_gem_prime_import() after the conversion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  8 --------
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 11 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 27 ++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
 6 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index ccc6b852ee7d..734741c80cbe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -8,6 +8,7 @@
 #include <linux/iommu.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
@@ -41,7 +42,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	int ret = 0;
 
-	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
+	if (get_dma_ops(drm_dev_dma_dev(drm_dev)) != get_dma_ops(subdrv_dev)) {
 		DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IOMMU\n",
 			  dev_name(subdrv_dev));
 		return -EINVAL;
@@ -93,8 +94,8 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 {
 	struct exynos_drm_private *priv = drm->dev_private;
 
-	if (!priv->dma_dev) {
-		priv->dma_dev = dev;
+	if (drm_dev_dma_dev(drm) == drm->dev) {
+		drm_dev_set_dma_dev(drm, dev);
 		DRM_INFO("Exynos DRM: using %s device for DMA mapping operations\n",
 			 dev_name(dev));
 	}
@@ -109,7 +110,7 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 			mapping = arm_iommu_create_mapping(dev,
 				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
-			mapping = iommu_get_domain_for_dev(priv->dma_dev);
+			mapping = iommu_get_domain_for_dev(dev);
 
 		if (!mapping)
 			return -ENODEV;
@@ -135,5 +136,5 @@ void exynos_drm_cleanup_dma(struct drm_device *drm)
 
 	arm_iommu_release_mapping(priv->mapping);
 	priv->mapping = NULL;
-	priv->dma_dev = NULL;
+	drm_dev_set_dma_dev(drm, NULL);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2101a74dc1ed..9ee30086879f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -109,7 +109,6 @@ static const struct drm_driver exynos_drm_driver = {
 	.open			= exynos_drm_open,
 	.postclose		= exynos_drm_postclose,
 	.dumb_create		= exynos_drm_gem_dumb_create,
-	.gem_prime_import	= exynos_drm_gem_prime_import,
 	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
 	EXYNOS_DRM_FBDEV_DRIVER_OPS,
 	.ioctls			= exynos_ioctls,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 06c29ff2aac0..1ab7195d09ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -198,7 +198,6 @@ struct drm_exynos_file_private {
  */
 struct exynos_drm_private {
 	struct device *g2d_dev;
-	struct device *dma_dev;
 	struct device *vidi_dev;
 	void *mapping;
 
@@ -208,13 +207,6 @@ struct exynos_drm_private {
 	wait_queue_head_t	wait;
 };
 
-static inline struct device *to_dma_dev(struct drm_device *dev)
-{
-	struct exynos_drm_private *priv = dev->dev_private;
-
-	return priv->dma_dev;
-}
-
 static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 348603262af0..85a3a247dfca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
 #include <linux/workqueue.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
@@ -278,7 +279,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
 
 	g2d->cmdlist_dma_attrs = DMA_ATTR_WRITE_COMBINE;
 
-	g2d->cmdlist_pool_virt = dma_alloc_attrs(to_dma_dev(g2d->drm_dev),
+	g2d->cmdlist_pool_virt = dma_alloc_attrs(drm_dev_dma_dev(g2d->drm_dev),
 						G2D_CMDLIST_POOL_SIZE,
 						&g2d->cmdlist_pool, GFP_KERNEL,
 						g2d->cmdlist_dma_attrs);
@@ -311,7 +312,7 @@ static int g2d_init_cmdlist(struct g2d_data *g2d)
 	return 0;
 
 err:
-	dma_free_attrs(to_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SIZE,
+	dma_free_attrs(drm_dev_dma_dev(g2d->drm_dev), G2D_CMDLIST_POOL_SIZE,
 			g2d->cmdlist_pool_virt,
 			g2d->cmdlist_pool, g2d->cmdlist_dma_attrs);
 	return ret;
@@ -322,7 +323,7 @@ static void g2d_fini_cmdlist(struct g2d_data *g2d)
 	kfree(g2d->cmdlist_node);
 
 	if (g2d->cmdlist_pool_virt && g2d->cmdlist_pool) {
-		dma_free_attrs(to_dma_dev(g2d->drm_dev),
+		dma_free_attrs(drm_dev_dma_dev(g2d->drm_dev),
 				G2D_CMDLIST_POOL_SIZE,
 				g2d->cmdlist_pool_virt,
 				g2d->cmdlist_pool, g2d->cmdlist_dma_attrs);
@@ -397,7 +398,7 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 		return;
 
 out:
-	dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
+	dma_unmap_sgtable(drm_dev_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
 			  DMA_BIDIRECTIONAL, 0);
 
 	unpin_user_pages_dirty_lock(g2d_userptr->pages, g2d_userptr->npages,
@@ -506,7 +507,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 
 	g2d_userptr->sgt = sgt;
 
-	ret = dma_map_sgtable(to_dma_dev(g2d->drm_dev), sgt,
+	ret = dma_map_sgtable(drm_dev_dma_dev(g2d->drm_dev), sgt,
 			      DMA_BIDIRECTIONAL, 0);
 	if (ret) {
 		DRM_DEV_ERROR(g2d->dev, "failed to map sgt with dma region.\n");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 59fd736a1fb9..9ec76163609f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -10,6 +10,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/module.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
@@ -29,7 +30,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	unsigned long attr = 0;
 
 	if (exynos_gem->dma_addr) {
-		DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "already allocated.\n");
+		DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "already allocated.\n");
 		return 0;
 	}
 
@@ -54,18 +55,18 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 		attr |= DMA_ATTR_NO_KERNEL_MAPPING;
 
 	exynos_gem->dma_attrs = attr;
-	exynos_gem->cookie = dma_alloc_attrs(to_dma_dev(dev), exynos_gem->size,
+	exynos_gem->cookie = dma_alloc_attrs(drm_dev_dma_dev(dev), exynos_gem->size,
 					     &exynos_gem->dma_addr, GFP_KERNEL,
 					     exynos_gem->dma_attrs);
 	if (!exynos_gem->cookie) {
-		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate buffer.\n");
+		DRM_DEV_ERROR(drm_dev_dma_dev(dev), "failed to allocate buffer.\n");
 		return -ENOMEM;
 	}
 
 	if (kvmap)
 		exynos_gem->kvaddr = exynos_gem->cookie;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
 	return 0;
 }
@@ -82,7 +83,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
 			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
 
-	dma_free_attrs(to_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
+	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
 			exynos_gem->dma_attrs);
 }
@@ -101,7 +102,7 @@ static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
 	if (ret)
 		return ret;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "gem handle = 0x%x\n", *handle);
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(obj->dev), "gem handle = 0x%x\n", *handle);
 
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(obj);
@@ -113,7 +114,7 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
 {
 	struct drm_gem_object *obj = &exynos_gem->base;
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "handle count = %d\n",
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(obj->dev), "handle count = %d\n",
 			  obj->handle_count);
 
 	/*
@@ -289,7 +290,7 @@ static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem *exynos_gem,
 	if (vm_size > exynos_gem->size)
 		return -EINVAL;
 
-	ret = dma_mmap_attrs(to_dma_dev(drm_dev), vma, exynos_gem->cookie,
+	ret = dma_mmap_attrs(drm_dev_dma_dev(drm_dev), vma, exynos_gem->cookie,
 			     exynos_gem->dma_addr, exynos_gem->size,
 			     exynos_gem->dma_attrs);
 	if (ret < 0) {
@@ -372,7 +373,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 
-	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(obj->dev), "flags = 0x%x\n",
 			  exynos_gem->flags);
 
 	/* non-cachable as default. */
@@ -398,12 +399,6 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 }
 
 /* low-level interface prime helpers */
-struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
-					    struct dma_buf *dma_buf)
-{
-	return drm_gem_prime_import_dev(dev, dma_buf, to_dma_dev(dev));
-}
-
 struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
@@ -415,7 +410,7 @@ struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable_attrs(to_dma_dev(drm_dev), sgt, exynos_gem->cookie,
+	ret = dma_get_sgtable_attrs(drm_dev_dma_dev(drm_dev), sgt, exynos_gem->cookie,
 				    exynos_gem->dma_addr, exynos_gem->size,
 				    exynos_gem->dma_attrs);
 	if (ret) {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 8b5bd20ae8c1..b6785f1136ab 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -94,8 +94,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_mode_create_dumb *args);
 
 /* low-level interface prime helpers */
-struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
-					    struct dma_buf *dma_buf);
 struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *
 exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
-- 
2.53.0.1018.g2bb0e51243-goog

