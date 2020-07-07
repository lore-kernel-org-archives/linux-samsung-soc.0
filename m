Return-Path: <SRS0=MXJZ=AS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49D9C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 11:08:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79CAB206B6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 11:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CeDWNT7k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgGGLIj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jul 2020 07:08:39 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56878 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGLIi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 07:08:38 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200707110836euoutp01b00b65ec52b8efa36712d6411e4caabf~fc8zeb30m2627226272euoutp01a
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jul 2020 11:08:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200707110836euoutp01b00b65ec52b8efa36712d6411e4caabf~fc8zeb30m2627226272euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594120116;
        bh=uDhfmrZERp1dMw1EVKONzpw5EU0R7ywoj2ndjBNsH9M=;
        h=From:To:Cc:Subject:Date:References:From;
        b=CeDWNT7ktEvTk9kheEEt6sm9KrcIhVVPOR1aqC5V2X/NQGDnEEb+jKSCjQ9d/P4lN
         B07PwCcrGwhpUOWtWPIraxP3noY+wWvkmtGzf5/X5/v33lt6TSLA3VFyIQk9KIqPZX
         hoR5hpOT0zoWlaRK4qYproY2jz+c27llfYYoM1Zk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200707110836eucas1p1d4328e5bc914139d2b412971361585ab~fc8zNaZSV0474604746eucas1p1U;
        Tue,  7 Jul 2020 11:08:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 38.D0.06318.4B7540F5; Tue,  7
        Jul 2020 12:08:36 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200707110836eucas1p28420a6243542acab6f65e8bd92e59000~fc8y2Ox690065200652eucas1p2J;
        Tue,  7 Jul 2020 11:08:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200707110836eusmtrp2e7647631f62875eadc0074314cd6dd61~fc8y1lekD3052730527eusmtrp26;
        Tue,  7 Jul 2020 11:08:36 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-d7-5f0457b4b2da
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 6B.66.06314.4B7540F5; Tue,  7
        Jul 2020 12:08:36 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200707110835eusmtip1de6f6c3d2057ec6d225e854a485483ba~fc8yZreZ21750217502eusmtip1x;
        Tue,  7 Jul 2020 11:08:35 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2] drm/exynos: Fix dma_parms allocation
Date:   Tue,  7 Jul 2020 13:08:27 +0200
Message-Id: <20200707110827.3760-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7djPc7pbwlniDR6/VbC4te4cq8XGGetZ
        La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
        apG+XQJXxqWpygXfBSuWz/nN3sDYw9/FyMkhIWAi8X37asYuRi4OIYEVjBI/Zj5lhXC+MEr8
        PzmfCcL5zCjRePA5M0zLxRd3oBLLgVqmbGCDa1l1eycjSBWbgKFE19suNhBbRMBNounwTLC5
        zALXGSW+/VjEDpIQFrCQ+P+3E2wsi4CqRNPd6WANvAI2Elt2zYZaJy+xesMBZpBmCYETbBLL
        u6+zQCRcJCZ9WwBVJCzx6vgWdghbRuL/TojDJQSaGSUenlvLDuH0MEpcbprBCFFlLXHn3C+g
        dRxAN2lKrN+lD2JKCDhKHN3GBGHySdx4KwhSzAxkTto2nRkizCvR0SYEMUNNYtbxdXBbD164
        BFXiIbHhUDBIWEggVqJ3VTPzBEa5WQibFjAyrmIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/d
        xAiM+9P/jn/dwbjvT9IhRgEORiUe3oQjzPFCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3K
        jy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNTqoGx2FXpoSGbo/9hW5bj3aks
        10xvz9stccpu2+owyweHhSfNj7y18P+V5Sc6gg9VZbqtvH6Ce2Fqd2HTi9cRFS+FJe5P5Ho/
        wehyms5f/qLJgSu9DT6pSPeLWglXrp67JGHj+j++pgobcgSWvjtQu/6dROvuLb4zvSc/+Fmc
        1dwkOn2XPs+lHS9uK7EUZyQaajEXFScCAEtqGdH3AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsVy+t/xu7pbwlniDWatYrO4te4cq8XGGetZ
        La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAc5SeTVF+aUmq
        QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexqWpygXfBSuWz/nN
        3sDYw9/FyMkhIWAicfHFHaYuRi4OIYGljBLv795kg0jISJyc1sAKYQtL/LnWxQZR9IlRYu/5
        T4wgCTYBQ4mut11gDSICHhLN346zgxQxC9xmlFj6YR4LSEJYwELi/99OZhCbRUBVounudLAG
        XgEbiS27ZjNDbJCXWL3hAPMERp4FjAyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAgNu27Gf
        m3cwXtoYfIhRgINRiYc34QhzvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosP
        MZoCLZ/ILCWanA+MhrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxS
        DYzWazz3JiiZnTz5mue7hZyc44O398Qf3WooW7TwSsJHvdrC6o1T/ti3K53V4VhYc7IqUPYH
        V3syg8jkW1t3/ZweumX3n7s11lPPeZY4yffu7rl/4MqfGw9iQttNYwK+zGRcIHjjnk9UxlnL
        jU6avjsz8kx0C1I3rH61fd6vPU0nPnJUh0z5/8dIiaU4I9FQi7moOBEAruWwtE4CAAA=
X-CMS-MailID: 20200707110836eucas1p28420a6243542acab6f65e8bd92e59000
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200707110836eucas1p28420a6243542acab6f65e8bd92e59000
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200707110836eucas1p28420a6243542acab6f65e8bd92e59000
References: <CGME20200707110836eucas1p28420a6243542acab6f65e8bd92e59000@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices") driver core handles allocation of the dma_parms
structure for platform device, so there is no need to manually allocate
nor free it.

Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- rebased onto current exynos-drm-next
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 27 +------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 58b89ec11b0e..5887f7f52f96 100644
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
@@ -69,10 +52,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		return -EINVAL;
 	}
 
-	ret = configure_dma_max_seg_size(subdrv_dev);
-	if (ret)
-		return ret;
-
+	dma_set_max_seg_size(subdrv_dev, DMA_BIT_MASK(32));
 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
 		/*
 		 * Keep the original DMA mapping of the sub-device and
@@ -89,9 +69,6 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		ret = iommu_attach_device(priv->mapping, subdrv_dev);
 	}
 
-	if (ret)
-		clear_dma_max_seg_size(subdrv_dev);
-
 	return ret;
 }
 
@@ -114,8 +91,6 @@ static void drm_iommu_detach_device(struct drm_device *drm_dev,
 		arm_iommu_attach_device(subdrv_dev, *dma_priv);
 	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 		iommu_detach_device(priv->mapping, subdrv_dev);
-
-	clear_dma_max_seg_size(subdrv_dev);
 }
 
 int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
-- 
2.17.1

