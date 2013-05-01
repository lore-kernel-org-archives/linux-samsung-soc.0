From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH] drm/exynos: fimd: Get signal polarities from device tree
Date: Wed,  1 May 2013 21:06:09 +0200
Message-ID: <1367435169-15025-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:41110 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756120Ab3EATGg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 May 2013 15:06:36 -0400
Received: by mail-ee0-f52.google.com with SMTP id d41so761566eek.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2013 12:06:35 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, t.figa@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>

This patch modifies the driver to perform two stage parsing of video
timings from device tree, to get timing information as struct videomode,
which contains more data than struct fb_videomode.

Thanks to this change, information about polarity of control signals
(VSYNC, HSYNC, VDEN, VCLK) can be retrieved, in addition to standard
video timings.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a1669d4..9023efa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -21,7 +21,9 @@
 #include <linux/pm_runtime.h>
 
 #include <video/of_display_timing.h>
+#include <video/of_videomode.h>
 #include <video/samsung_fimd.h>
+#include <video/videomode.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
@@ -928,18 +930,30 @@ static int fimd_probe(struct platform_device *pdev)
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
 	if (pdev->dev.of_node) {
+		struct videomode vm;
+
 		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 		if (!pdata) {
 			DRM_ERROR("memory allocation for pdata failed\n");
 			return -ENOMEM;
 		}
 
-		ret = of_get_fb_videomode(dev->of_node, &pdata->panel.timing,
-					OF_USE_NATIVE_MODE);
+		ret = of_get_videomode(dev->of_node, &vm, OF_USE_NATIVE_MODE);
 		if (ret) {
 			DRM_ERROR("failed: of_get_fb_videomode() : %d\n", ret);
 			return ret;
 		}
+
+		fb_videomode_from_videomode(&vm, &pdata->panel.timing);
+
+		if (vm.flags & DISPLAY_FLAGS_VSYNC_LOW)
+			pdata->vidcon1 |= VIDCON1_INV_VSYNC;
+		if (vm.flags & DISPLAY_FLAGS_HSYNC_LOW)
+			pdata->vidcon1 |= VIDCON1_INV_HSYNC;
+		if (vm.flags & DISPLAY_FLAGS_DE_LOW)
+			pdata->vidcon1 |= VIDCON1_INV_VDEN;
+		if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+			pdata->vidcon1 |= VIDCON1_INV_VCLK;
 	} else {
 		pdata = pdev->dev.platform_data;
 		if (!pdata) {
-- 
1.8.2.1
