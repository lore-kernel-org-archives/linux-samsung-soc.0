From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: remove unnecessary function declaration
Date: Mon, 27 Nov 2017 17:06:37 +0900
Message-ID: <1511769997-3223-1-git-send-email-inki.dae@samsung.com>
References: <CGME20171127080639epcas2p3d6ab12d9a00fc55af2b7b09741052704@epcas2p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49161 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdK0IGl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 03:06:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, Inki Dae <inki.dae@samsung.com>

Removed exynos_drm_get_dma_device funtion declaration on top
of exynos_drm_drv.c file.

We can remove this declaration by moving the implementation
of this function upwards.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 44 ++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index a6ff3a5..27e423b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -37,8 +37,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static struct device *exynos_drm_get_dma_device(void);
-
 int exynos_atomic_check(struct drm_device *dev,
 			struct drm_atomic_state *state)
 {
@@ -301,6 +299,27 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
+static struct device *exynos_drm_get_dma_device(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(exynos_drm_drivers); ++i) {
+		struct exynos_drm_driver_info *info = &exynos_drm_drivers[i];
+		struct device *dev;
+
+		if (!info->driver || !(info->flags & DRM_DMA_DEVICE))
+			continue;
+
+		while ((dev = bus_find_device(&platform_bus_type, NULL,
+					    &info->driver->driver,
+					    (void *)platform_bus_type.match))) {
+			put_device(dev);
+			return dev;
+		}
+	}
+	return NULL;
+}
+
 static int exynos_drm_bind(struct device *dev)
 {
 	struct exynos_drm_private *private;
@@ -469,27 +488,6 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 	},
 };
 
-static struct device *exynos_drm_get_dma_device(void)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(exynos_drm_drivers); ++i) {
-		struct exynos_drm_driver_info *info = &exynos_drm_drivers[i];
-		struct device *dev;
-
-		if (!info->driver || !(info->flags & DRM_DMA_DEVICE))
-			continue;
-
-		while ((dev = bus_find_device(&platform_bus_type, NULL,
-					    &info->driver->driver,
-					    (void *)platform_bus_type.match))) {
-			put_device(dev);
-			return dev;
-		}
-	}
-	return NULL;
-}
-
 static void exynos_drm_unregister_devices(void)
 {
 	int i;
-- 
1.9.1
