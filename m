From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/5 v2] drm/exynos: remove incorrect ccflags from Makefile
Date: Wed, 24 Feb 2016 15:15:22 +0100
Message-ID: <1456323322-1212-1-git-send-email-a.hajda@samsung.com>
References: <1455191747-10247-6-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39378 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751814AbcBXOPc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Feb 2016 09:15:32 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O3200KVK29TE920@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Feb 2016 14:15:29 +0000 (GMT)
In-reply-to: <1455191747-10247-6-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Include directories are provided by core already, adding them in driver
is redundand and causes warnings in case of out-of-tree build.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2:
    - fixed include in exynos_drm_iommu.c
    - typo in commit message

 drivers/gpu/drm/exynos/Makefile             | 1 -
 drivers/gpu/drm/exynos/exynos_drm_iommu.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 6496532..968b31c 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -2,7 +2,6 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-ccflags-y := -Iinclude/drm -Idrivers/gpu/drm/exynos
 exynosdrm-y := exynos_drm_drv.o exynos_drm_crtc.o exynos_drm_fbdev.o \
 		exynos_drm_fb.o exynos_drm_gem.o exynos_drm_core.o \
 		exynos_drm_plane.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_iommu.c b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
index 89e51ed..8a54d63 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_iommu.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_iommu.c
@@ -9,7 +9,7 @@
  * option) any later version.
  */
 
-#include <drmP.h>
+#include <drm/drmP.h>
 #include <drm/exynos_drm.h>
 
 #include <linux/dma-mapping.h>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index ce59f44..f18fbe4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -20,7 +20,6 @@
 #include <drm/drmP.h>
 #include <drm/exynos_drm.h>
 #include "regs-rotator.h"
-#include "exynos_drm.h"
 #include "exynos_drm_drv.h"
 #include "exynos_drm_ipp.h"
 
-- 
1.9.1
