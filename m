From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/exynos: Use platform_register/unregister_drivers()
Date: Wed,  2 Dec 2015 17:22:36 +0100
Message-ID: <1449073356-11359-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:33033 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932783AbbLBQWj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2015 11:22:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Replace the driver-specific implementations with the ones implemented in
the core.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 42 +++++++--------------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2c6019d6a205..3152bca62127 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -678,54 +678,28 @@ static int exynos_drm_register_devices(void)
 	return 0;
 }
 
-static void exynos_drm_unregister_drivers(struct platform_driver * const *drv,
-					  int count)
-{
-	while (--count >= 0)
-		platform_driver_unregister(drv[count]);
-}
-
-static int exynos_drm_register_drivers(struct platform_driver * const *drv,
-				       int count)
-{
-	int i, ret;
-
-	for (i = 0; i < count; ++i) {
-		ret = platform_driver_register(drv[i]);
-		if (!ret)
-			continue;
-
-		while (--i >= 0)
-			platform_driver_unregister(drv[i]);
-
-		return ret;
-	}
-
-	return 0;
-}
-
 static inline int exynos_drm_register_kms_drivers(void)
 {
-	return exynos_drm_register_drivers(exynos_drm_kms_drivers,
-					ARRAY_SIZE(exynos_drm_kms_drivers));
+	return platform_register_drivers(exynos_drm_kms_drivers,
+					 ARRAY_SIZE(exynos_drm_kms_drivers));
 }
 
 static inline int exynos_drm_register_non_kms_drivers(void)
 {
-	return exynos_drm_register_drivers(exynos_drm_non_kms_drivers,
-					ARRAY_SIZE(exynos_drm_non_kms_drivers));
+	return platform_register_drivers(exynos_drm_non_kms_drivers,
+					 ARRAY_SIZE(exynos_drm_non_kms_drivers));
 }
 
 static inline void exynos_drm_unregister_kms_drivers(void)
 {
-	exynos_drm_unregister_drivers(exynos_drm_kms_drivers,
-					ARRAY_SIZE(exynos_drm_kms_drivers));
+	platform_unregister_drivers(exynos_drm_kms_drivers,
+				    ARRAY_SIZE(exynos_drm_kms_drivers));
 }
 
 static inline void exynos_drm_unregister_non_kms_drivers(void)
 {
-	exynos_drm_unregister_drivers(exynos_drm_non_kms_drivers,
-					ARRAY_SIZE(exynos_drm_non_kms_drivers));
+	platform_unregister_drivers(exynos_drm_non_kms_drivers,
+				    ARRAY_SIZE(exynos_drm_non_kms_drivers));
 }
 
 static int exynos_drm_init(void)
-- 
2.5.0
