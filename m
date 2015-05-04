From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 19/25] iommu: exynos: remove unneeded code
Date: Mon, 04 May 2015 10:16:14 +0200
Message-ID: <1430727380-10912-20-git-send-email-m.szyprowski@samsung.com>
References: <1430727380-10912-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35580 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752081AbbEDIRX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 04:17:23 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNT008ZBGCXY150@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 May 2015 09:17:21 +0100 (BST)
In-reply-to: <1430727380-10912-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linaro-mm-sig@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Cho KyongHo <pullip.cho@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

Once driver initialization has been moved from initcall to of_xlate()
callback, this patch is no longer needed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/exynos-iommu.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 6e6b502ee2c9..821797328c52 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1126,15 +1126,8 @@ static bool init_done;
 
 static int __init exynos_iommu_init(void)
 {
-	struct device_node *np;
 	int ret;
 
-	np = of_find_matching_node(NULL, sysmmu_of_match);
-	if (!np)
-		return 0;
-
-	of_node_put(np);
-
 	lv2table_kmem_cache = kmem_cache_create("exynos-iommu-lv2table",
 				LV2TABLE_SIZE, LV2TABLE_SIZE, 0, NULL);
 	if (!lv2table_kmem_cache) {
-- 
1.9.2
