From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: gem: Drop NONCONTIG flag for buffers allocated
 without IOMMU
Date: Tue, 31 Oct 2017 17:28:13 +0100
Message-ID: <20171031162813.1546-1-m.szyprowski@samsung.com>
References: <CGME20171031162824eucas1p1d15c2ea1d529edd18e16506b26669b91@eucas1p1.samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marian Mihailescu <mihailescu2m@gmail.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

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
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 02f978bb9261..476c00fe1998 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -227,6 +227,13 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
 	if (IS_ERR(exynos_gem))
 		return exynos_gem;
 
+	/*
+	 * when no IOMMU is available, all allocated buffers are contiguous
+	 * anyway, so drop EXYNOS_BO_NONCONTIG flag
+	 */
+	if (!is_drm_iommu_supported(dev))
+		flags &= ~EXYNOS_BO_NONCONTIG;
+
 	/* set memory type and cache attribute from user side. */
 	exynos_gem->flags = flags;
 
-- 
2.14.2
