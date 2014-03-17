From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/9] drm/exynos: delay fbdev initialization until an output is
 connected
Date: Mon, 17 Mar 2014 11:27:17 +0100
Message-ID: <1395052045-23848-2-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34331 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932626AbaCQK2C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 06:28:02 -0400
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Denis Carikli <denis@eukrea.com>

In case fbdev is initialized before any output is connected,
fb resolution defaults to 1024x768. After that any output with
bigger resolution is ignored and fbdev is not displayed.
The patch postpones fbdev initialization to avoid such situation.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 16 ++++------------
 drivers/gpu/drm/exynos/exynos_drm_fb.c  |  3 +++
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index c8869de..25f45b8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -109,24 +109,15 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
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
 
+	/* force connectors detection */
+	drm_helper_hpd_irq_event(dev);
+
 	return 0;
 
-err_drm_device:
-	exynos_drm_device_unregister(dev);
 err_vblank:
 	drm_vblank_cleanup(dev);
 err_display_cleanup:
@@ -571,6 +562,7 @@ out_hdmi:
 	platform_driver_unregister(&fimd_driver);
 out_fimd:
 #endif
+
 #ifdef CONFIG_DRM_EXYNOS_DP
 	platform_driver_unregister(&dp_driver);
 out_dp:
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
-- 
1.8.3.2
