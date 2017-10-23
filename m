From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 5/9] drm/exynos: Add generic support for devices shared
 with V4L2 subsystem
Date: Mon, 23 Oct 2017 09:54:24 +0200
Message-ID: <20171023075428.7003-6-m.szyprowski@samsung.com>
References: <20171023075428.7003-1-m.szyprowski@samsung.com>
        <CGME20171023075450eucas1p24923c2a0793ac24364b97770dadd56e0@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56831 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751344AbdJWHyy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 03:54:54 -0400
In-reply-to: <20171023075428.7003-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Some hardware modules, like FIMC in Exynos4 series are shared between
V4L2 (camera support) and DRM (memory-to-memory processing) subsystems.
This patch provides a simple check to let such drivers to be used in the
driver components framework.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 17 ++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index cac0d84385d3..60ae6ae06eb2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -216,6 +216,7 @@ struct exynos_drm_driver_info {
 #define DRM_COMPONENT_DRIVER	BIT(0)	/* supports component framework */
 #define DRM_VIRTUAL_DEVICE	BIT(1)	/* create virtual platform device */
 #define DRM_DMA_DEVICE		BIT(2)	/* can be used for dma allocations */
+#define DRM_SHARED_DEVICE	BIT(3)	/* devices shared with V4L2 subsystem */
 
 #define DRV_PTR(drv, cond) (IS_ENABLED(cond) ? &drv : NULL)
 
@@ -267,6 +268,17 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
 	}
 };
 
+int exynos_drm_check_shared_device(struct device *dev)
+{
+	/*
+	 * Exynos DRM drivers handle only devices that support
+	 * the LCD Writeback data path, rest is handled by V4L2 driver
+	 */
+	if (!of_property_read_bool(dev->of_node, "samsung,lcd-wb"))
+		return -ENODEV;
+	return 0;
+}
+
 static int compare_dev(struct device *dev, void *data)
 {
 	return dev == (struct device *)data;
@@ -288,7 +300,10 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 					    &info->driver->driver,
 					    (void *)platform_bus_type.match))) {
 			put_device(p);
-			component_match_add(dev, &match, compare_dev, d);
+
+			if (!(info->flags & DRM_SHARED_DEVICE) ||
+			    exynos_drm_check_shared_device(d) == 0)
+				component_match_add(dev, &match, compare_dev, d);
 			p = d;
 		}
 		put_device(p);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b47f810d64d2..8b3b31d35168 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -275,6 +275,8 @@ static inline int exynos_dpi_bind(struct drm_device *dev,
 }
 #endif
 
+int exynos_drm_check_shared_device(struct device *dev);
+
 int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
 			 bool nonblock);
 int exynos_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
-- 
2.14.2
