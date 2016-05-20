From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] iommu/exynos: Suppress unbinding to prevent system failure
Date: Fri, 20 May 2016 15:48:21 +0200
Message-ID: <1463752114-23653-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45654 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755126AbcETNsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 May 2016 09:48:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org

Removal of IOMMU driver cannot be done reliably, so Exynos IOMMU driver
doesn't support this operation. It is essential for system operation, so
it makes sense to prevent unbinding by disabling bind/unbind sysfs
feature for SYSMMU controller driver to avoid kernel ops or trashing
memory caused by such operation.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
CC: stable@vger.kernel.org  # v4.2+
---
 drivers/iommu/exynos-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 558a40d3a6a0..d365c40a7b84 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -681,6 +681,7 @@ static struct platform_driver exynos_sysmmu_driver __refdata = {
 		.name		= "exynos-sysmmu",
 		.of_match_table	= sysmmu_of_match,
 		.pm		= &sysmmu_pm_ops,
+		.suppress_bind_attrs = true,
 	}
 };
 
-- 
1.9.2
