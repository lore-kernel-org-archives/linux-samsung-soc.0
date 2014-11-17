From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 01/14] drm/exynos/mixer: embed manager into private context
Date: Mon, 17 Nov 2014 09:54:14 +0100
Message-ID: <1416214467-6179-2-git-send-email-a.hajda@samsung.com>
References: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50244 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751435AbaKQIy7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 03:54:59 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF600GNXE88BZ40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 08:57:44 +0000 (GMT)
In-reply-to: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

exynos_drm_manager is used by internal Exynos DRM framework for
representing crtc. As it should be mapped 1:1 to fimd private context
it seems more reasonable to embed it directly in that context.
As a result further code simplification will be possible.
Moreover it will be possible to handle multiple mixer devices in the system.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 86 +++++++++++++++++------------------
 1 file changed, 41 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 4858170e..2c5d8e7 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -40,8 +40,6 @@
 #include "exynos_drm_iommu.h"
 #include "exynos_mixer.h"
 
-#define get_mixer_manager(dev)	platform_get_drvdata(to_platform_device(dev))
-
 #define MIXER_WIN_NR		3
 #define MIXER_DEFAULT_WIN	0
 
@@ -91,6 +89,7 @@ enum mixer_flag_bits {
 };
 
 struct mixer_context {
+	struct exynos_drm_manager manager;
 	struct platform_device *pdev;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
@@ -1170,11 +1169,6 @@ static struct exynos_drm_manager_ops mixer_manager_ops = {
 	.win_disable		= mixer_win_disable,
 };
 
-static struct exynos_drm_manager mixer_manager = {
-	.type			= EXYNOS_DISPLAY_TYPE_HDMI,
-	.ops			= &mixer_manager_ops,
-};
-
 static struct mixer_drv_data exynos5420_mxr_drv_data = {
 	.version = MXR_VER_128_0_0_184,
 	.is_vp_enabled = 0,
@@ -1232,46 +1226,17 @@ MODULE_DEVICE_TABLE(of, mixer_match_types);
 
 static int mixer_bind(struct device *dev, struct device *manager, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	struct mixer_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	struct mixer_context *ctx;
-	struct mixer_drv_data *drv;
 	int ret;
 
-	dev_info(dev, "probe start\n");
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx) {
-		DRM_ERROR("failed to alloc mixer context.\n");
-		return -ENOMEM;
-	}
-
-	if (dev->of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(mixer_match_types, dev->of_node);
-		drv = (struct mixer_drv_data *)match->data;
-	} else {
-		drv = (struct mixer_drv_data *)
-			platform_get_device_id(pdev)->driver_data;
-	}
-
-	ctx->pdev = pdev;
-	ctx->dev = dev;
-	ctx->vp_enabled = drv->is_vp_enabled;
-	ctx->has_sclk = drv->has_sclk;
-	ctx->mxr_ver = drv->version;
-	init_waitqueue_head(&ctx->wait_vsync_queue);
-	atomic_set(&ctx->wait_vsync_event, 0);
-
-	mixer_manager.ctx = ctx;
-	ret = mixer_initialize(&mixer_manager, drm_dev);
+	ret = mixer_initialize(&ctx->manager, drm_dev);
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, &mixer_manager);
-	ret = exynos_drm_crtc_create(&mixer_manager);
+	ret = exynos_drm_crtc_create(&ctx->manager);
 	if (ret) {
-		mixer_mgr_remove(&mixer_manager);
+		mixer_mgr_remove(&ctx->manager);
 		return ret;
 	}
 
@@ -1282,11 +1247,9 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 
 static void mixer_unbind(struct device *dev, struct device *master, void *data)
 {
-	struct exynos_drm_manager *mgr = dev_get_drvdata(dev);
+	struct mixer_context *ctx = dev_get_drvdata(dev);
 
-	dev_info(dev, "remove successful\n");
-
-	mixer_mgr_remove(mgr);
+	mixer_mgr_remove(&ctx->manager);
 
 	pm_runtime_disable(dev);
 }
@@ -1298,10 +1261,43 @@ static const struct component_ops mixer_component_ops = {
 
 static int mixer_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct mixer_drv_data *drv;
+	struct mixer_context *ctx;
 	int ret;
 
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		DRM_ERROR("failed to alloc mixer context.\n");
+		return -ENOMEM;
+	}
+
+	ctx->manager.type = EXYNOS_DISPLAY_TYPE_HDMI;
+	ctx->manager.ops = &mixer_manager_ops;
+
+	if (dev->of_node) {
+		const struct of_device_id *match;
+
+		match = of_match_node(mixer_match_types, dev->of_node);
+		drv = (struct mixer_drv_data *)match->data;
+	} else {
+		drv = (struct mixer_drv_data *)
+			platform_get_device_id(pdev)->driver_data;
+	}
+
+	ctx->pdev = pdev;
+	ctx->dev = dev;
+	ctx->vp_enabled = drv->is_vp_enabled;
+	ctx->has_sclk = drv->has_sclk;
+	ctx->mxr_ver = drv->version;
+	init_waitqueue_head(&ctx->wait_vsync_queue);
+	atomic_set(&ctx->wait_vsync_event, 0);
+	ctx->manager.ctx = ctx;
+
+	platform_set_drvdata(pdev, ctx);
+
 	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
-					mixer_manager.type);
+					ctx->manager.type);
 	if (ret)
 		return ret;
 
-- 
1.9.1
