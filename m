From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V3 4/5] driver: Include the modified FIMD header file
Date: Tue, 07 Aug 2012 15:07:58 +0530
Message-ID: <1344332279-16736-5-git-send-email-l.krishna@samsung.com>
References: <1344332279-16736-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58468 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753383Ab2HGJWV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 05:22:21 -0400
In-reply-to: <1344332279-16736-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, m.szyprowski@samsung.com

The fimd register headers have been moved to include/video/
hence, modifying the driver files accordingly.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    2 +-
 drivers/video/s3c-fb.c                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a68d2b3..24c0bd4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -19,8 +19,8 @@
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 
+#include <video/samsung_fimd.h>
 #include <drm/exynos_drm.h>
-#include <plat/regs-fb-v4.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_fbdev.h"
diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 69bf9d0..901729e 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -25,8 +25,8 @@
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
 
+#include <video/samsung_fimd.h>
 #include <mach/map.h>
-#include <plat/regs-fb-v4.h>
 #include <plat/fb.h>
 
 /* This driver will export a number of framebuffer interfaces depending
-- 
1.7.0.4
