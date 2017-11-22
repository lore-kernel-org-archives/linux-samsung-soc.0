From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] drm/exynos: gem: Drop NONCONTIG flag for buffers
 allocated without IOMMU
Date: Wed, 22 Nov 2017 14:14:47 +0100
Message-ID: <20171122131447.25627-1-m.szyprowski@samsung.com>
References: <CGME20171122131501eucas1p1557c57b70990b11084228e64d54726c2@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36987 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751244AbdKVNPF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Nov 2017 08:15:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marian Mihailescu <mihailescu2m@gmail.com>, stable@vger.kernel.org

When no IOMMU is available, all GEM buffers allocated by Exynos DRM driver
are contiguous, because of the underlying dma_alloc_attrs() function
provides only such buffers. In such case it makes no sense to keep
BO_NONCONTIG flag for the allocated GEM buffers. This allows to avoid
failures for buffer contiguity checks in the subsequent operations on GEM
objects.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
CC: stable@vger.kernel.org # v4.4+
---
This issue is there since commit 0519f9a12d011 ("drm/exynos: add iommu
support for exynos drm framework"), but this patch applies cleanly
only to v4.4+ kernel releases due changes in the surrounding code.

Changelog:
v2:
- added warning message when buffer flags are updadated (requested by Inki)

v1: https://patchwork.kernel.org/patch/10034919/
- initial version
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 077de014d610..4400efe3974a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -247,6 +247,15 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
 	if (IS_ERR(exynos_gem))
 		return exynos_gem;
 
+	if (!is_drm_iommu_supported(dev) && (flags & EXYNOS_BO_NONCONTIG)) {
+		/*
+		 * when no IOMMU is available, all allocated buffers are
+		 * contiguous anyway, so drop EXYNOS_BO_NONCONTIG flag
+		 */
+		flags &= ~EXYNOS_BO_NONCONTIG;
+		DRM_WARN("Non-contiguous allocation is not supported without IOMMU, falling back to contiguous buffer\n");
+	}
+
 	/* set memory type and cache attribute from user side. */
 	exynos_gem->flags = flags;
 
-- 
2.14.2
