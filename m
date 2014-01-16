From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2] drm/exynos: Fix multiplatform breakage for ipp/gsc
Date: Thu, 16 Jan 2014 11:57:57 +0530
Message-ID: <1389853677-3485-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:57373 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046AbaAPGcM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jan 2014 01:32:12 -0500
Received: by mail-pd0-f181.google.com with SMTP id p10so2176253pdj.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2014 22:32:11 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org

There is no need to include "plat/map-base.h" in ipp driver. Remove
this and enable this driver for multi-platform.

However gsc driver is not multiplatform compliant yet, so make the
compilation conditional upon !ARCH_MULTIPLATFORM.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes for V2:
* Made compilation of exynos_drm_gsc.c conditional on
 !ARCH_MULTIPLATFORM.

 drivers/gpu/drm/exynos/Kconfig          |    4 ++--
 drivers/gpu/drm/exynos/exynos_drm_ipp.c |    1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index f227f54..6e1a1a2 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -51,7 +51,7 @@ config DRM_EXYNOS_G2D
 
 config DRM_EXYNOS_IPP
 	bool "Exynos DRM IPP"
-	depends on DRM_EXYNOS && !ARCH_MULTIPLATFORM
+	depends on DRM_EXYNOS
 	help
 	  Choose this option if you want to use IPP feature for DRM.
 
@@ -69,6 +69,6 @@ config DRM_EXYNOS_ROTATOR
 
 config DRM_EXYNOS_GSC
 	bool "Exynos DRM GSC"
-	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5
+	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !ARCH_MULTIPLATFORM
 	help
 	  Choose this option if you want to use Exynos GSC for DRM.
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index d519a4e..eefb429 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -16,7 +16,6 @@
 #include <linux/types.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
-#include <plat/map-base.h>
 
 #include <drm/drmP.h>
 #include <drm/exynos_drm.h>
-- 
1.7.9.5
