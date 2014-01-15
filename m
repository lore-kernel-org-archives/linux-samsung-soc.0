From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] drm/exynos: Fix multiplatform breakage for ipp
Date: Wed, 15 Jan 2014 17:27:33 +0530
Message-ID: <1389787053-18228-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:59430 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbaAOMBo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jan 2014 07:01:44 -0500
Received: by mail-pa0-f53.google.com with SMTP id lj1so1049778pab.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2014 04:01:44 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, arnd@arndb.de

There is no need to include "plat/map-base.h" in ipp driver. Remove
this and enable this driver for multi-platform.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 drivers/gpu/drm/exynos/Kconfig          |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index f227f54..3af44c2 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -51,7 +51,7 @@ config DRM_EXYNOS_G2D
 
 config DRM_EXYNOS_IPP
 	bool "Exynos DRM IPP"
-	depends on DRM_EXYNOS && !ARCH_MULTIPLATFORM
+	depends on DRM_EXYNOS
 	help
 	  Choose this option if you want to use IPP feature for DRM.
 
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
