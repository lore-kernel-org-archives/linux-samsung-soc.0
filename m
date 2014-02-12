From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 02/21] drm/exynos: delay fbdev initialization until an
 output is connected
Date: Wed, 12 Feb 2014 12:31:09 +0100
Message-ID: <1392204688-4591-3-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24986 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752154AbaBLLcK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:10 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

In case fbdev is initialized before any output is connected,
fb resolution defaults to 1024x768. After that any output with
bigger resolution is ignored and fbdev is not displayed.
The patch postpones fbdev initialization to avoid such situation.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 12 ------------
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |  3 +++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  4 +++-
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index c8869de..0ef46fe 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -109,24 +109,12 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	/* setup possible_clones. */
 	exynos_drm_encoder_setup(dev);
 
-	/*
-	 * create and configure fb helper and also exynos specific
-	 * fbdev object.
-	 */
-	ret = exynos_drm_fbdev_init(dev);
-	if (ret) {
-		DRM_ERROR("failed to initialize drm fbdev\n");
-		goto err_drm_device;
-	}
-
 	drm_vblank_offdelay = VBLANK_OFF_DELAY;
 
 	platform_set_drvdata(dev->platformdev, dev);
 
 	return 0;
 
-err_drm_device:
-	exynos_drm_device_unregister(dev);
 err_vblank:
 	drm_vblank_cleanup(dev);
 err_display_cleanup:
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index c7c08d0..65a22ca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -20,6 +20,7 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_fb.h"
+#include "exynos_drm_fbdev.h"
 #include "exynos_drm_gem.h"
 #include "exynos_drm_iommu.h"
 #include "exynos_drm_crtc.h"
@@ -300,6 +301,8 @@ static void exynos_drm_output_poll_changed(struct drm_device *dev)
 
 	if (fb_helper)
 		drm_fb_helper_hotplug_event(fb_helper);
+	else
+		exynos_drm_fbdev_init(dev);
 }
 
 static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index e7c2f2d..9a5ec83 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -249,8 +249,10 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 		return 0;
 
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
-	if (!fbdev)
+	if (!fbdev) {
+		DRM_ERROR("failed to allocate fbdev.\n");
 		return -ENOMEM;
+	}
 
 	private->fb_helper = helper = &fbdev->drm_fb_helper;
 	helper->funcs = &exynos_drm_fb_helper_funcs;
-- 
1.8.3.2
