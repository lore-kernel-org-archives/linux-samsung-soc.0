Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B60C43461
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 20:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 529FB2067C
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 20:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgICUvy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 16:51:54 -0400
Received: from foss.arm.com ([217.140.110.172]:41068 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgICUvy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 16:51:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B99B1045;
        Thu,  3 Sep 2020 13:51:53 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 623DB3F68F;
        Thu,  3 Sep 2020 13:51:52 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: Drop local dma_parms
Date:   Thu,  3 Sep 2020 21:51:48 +0100
Message-Id: <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices"), struct platform_device already provides a
dma_parms structure, so we can save allocating another one.

Also the DMA segment size is simply a size, not a bitmask.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 26 +------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 58b89ec11b0e..9f25a5ebbf7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -31,23 +31,6 @@
 #define EXYNOS_DEV_ADDR_START	0x20000000
 #define EXYNOS_DEV_ADDR_SIZE	0x40000000
 
-static inline int configure_dma_max_seg_size(struct device *dev)
-{
-	if (!dev->dma_parms)
-		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
-	if (!dev->dma_parms)
-		return -ENOMEM;
-
-	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
-	return 0;
-}
-
-static inline void clear_dma_max_seg_size(struct device *dev)
-{
-	kfree(dev->dma_parms);
-	dev->dma_parms = NULL;
-}
-
 /*
  * drm_iommu_attach_device- attach device to iommu mapping
  *
@@ -69,9 +52,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		return -EINVAL;
 	}
 
-	ret = configure_dma_max_seg_size(subdrv_dev);
-	if (ret)
-		return ret;
+	dma_set_max_seg_size(subdrv_dev, UINT_MAX);
 
 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
 		/*
@@ -89,9 +70,6 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		ret = iommu_attach_device(priv->mapping, subdrv_dev);
 	}
 
-	if (ret)
-		clear_dma_max_seg_size(subdrv_dev);
-
 	return ret;
 }
 
@@ -114,8 +92,6 @@ static void drm_iommu_detach_device(struct drm_device *drm_dev,
 		arm_iommu_attach_device(subdrv_dev, *dma_priv);
 	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 		iommu_detach_device(priv->mapping, subdrv_dev);
-
-	clear_dma_max_seg_size(subdrv_dev);
 }
 
 int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
-- 
2.28.0.dirty

