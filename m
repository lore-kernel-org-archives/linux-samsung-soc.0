From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 05/14] drm/exynos/fimd: embed manager into private context
Date: Mon, 17 Nov 2014 09:54:18 +0100
Message-ID: <1416214467-6179-6-git-send-email-a.hajda@samsung.com>
References: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35040 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668AbaKQIzE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 03:55:04 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF600GL1E8K7E40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 08:57:56 +0000 (GMT)
In-reply-to: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

exynos_drm_manager is used by internal Exynos DRM framework for
representing crtc. As it should be mapped 1:1 to fimd private context
it seems more reasonable to embed it directly in that context.
As a result further code simplification will be possible.
Moreover it will be possible to handle multiple FIMD devices in the system.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 62 ++++++++++++++------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index c949099..6cda128 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -89,8 +89,6 @@
 /* FIMD has totally five hardware windows. */
 #define WINDOWS_NR	5
 
-#define get_fimd_manager(mgr)	platform_get_drvdata(to_platform_device(dev))
-
 struct fimd_driver_data {
 	unsigned int timing_base;
 	unsigned int lcdblk_offset;
@@ -151,6 +149,7 @@ struct fimd_win_data {
 };
 
 struct fimd_context {
+	struct exynos_drm_manager	manager;
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct clk			*bus_clk;
@@ -952,8 +951,7 @@ static void fimd_dpms(struct exynos_drm_manager *mgr, int mode)
 
 static void fimd_trigger(struct device *dev)
 {
-	struct exynos_drm_manager *mgr = get_fimd_manager(dev);
-	struct fimd_context *ctx = mgr->ctx;
+	struct fimd_context *ctx = dev_get_drvdata(dev);
 	struct fimd_driver_data *driver_data = ctx->driver_data;
 	void *timing_base = ctx->regs + driver_data->timing_base;
 	u32 reg;
@@ -1019,11 +1017,6 @@ static struct exynos_drm_manager_ops fimd_manager_ops = {
 	.te_handler = fimd_te_handler,
 };
 
-static struct exynos_drm_manager fimd_manager = {
-	.type = EXYNOS_DISPLAY_TYPE_LCD,
-	.ops = &fimd_manager_ops,
-};
-
 static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 {
 	struct fimd_context *ctx = (struct fimd_context *)dev_id;
@@ -1059,11 +1052,11 @@ out:
 
 static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
-	struct fimd_context *ctx = fimd_manager.ctx;
+	struct fimd_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
 
-	fimd_mgr_initialize(&fimd_manager, drm_dev);
-	exynos_drm_crtc_create(&fimd_manager);
+	fimd_mgr_initialize(&ctx->manager, drm_dev);
+	exynos_drm_crtc_create(&ctx->manager);
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
@@ -1074,15 +1067,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 static void fimd_unbind(struct device *dev, struct device *master,
 			void *data)
 {
-	struct exynos_drm_manager *mgr = dev_get_drvdata(dev);
-	struct fimd_context *ctx = fimd_manager.ctx;
+	struct fimd_context *ctx = dev_get_drvdata(dev);
 
-	fimd_dpms(mgr, DRM_MODE_DPMS_OFF);
+	fimd_dpms(&ctx->manager, DRM_MODE_DPMS_OFF);
 
 	if (ctx->display)
 		exynos_dpi_remove(dev);
 
-	fimd_mgr_remove(mgr);
+	fimd_mgr_remove(&ctx->manager);
 }
 
 static const struct component_ops fimd_component_ops = {
@@ -1098,21 +1090,20 @@ static int fimd_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret = -EINVAL;
 
-	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
-					fimd_manager.type);
-	if (ret)
-		return ret;
-
-	if (!dev->of_node) {
-		ret = -ENODEV;
-		goto err_del_component;
-	}
+	if (!dev->of_node)
+		return -ENODEV;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx) {
-		ret = -ENOMEM;
-		goto err_del_component;
-	}
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->manager.type = EXYNOS_DISPLAY_TYPE_LCD;
+	ctx->manager.ops = &fimd_manager_ops;
+
+	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
+				       ctx->manager.type);
+	if (ret)
+		return ret;
 
 	ctx->dev = dev;
 	ctx->suspended = true;
@@ -1200,28 +1191,27 @@ static int fimd_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&ctx->wait_vsync_queue);
 	atomic_set(&ctx->wait_vsync_event, 0);
+	ctx->manager.ctx = ctx;
 
-	platform_set_drvdata(pdev, &fimd_manager);
-
-	fimd_manager.ctx = ctx;
+	platform_set_drvdata(pdev, ctx);
 
 	ctx->display = exynos_dpi_probe(dev);
 	if (IS_ERR(ctx->display))
 		return PTR_ERR(ctx->display);
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
-	ret = component_add(&pdev->dev, &fimd_component_ops);
+	ret = component_add(dev, &fimd_component_ops);
 	if (ret)
 		goto err_disable_pm_runtime;
 
 	return ret;
 
 err_disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 err_del_component:
-	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
+	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CRTC);
 	return ret;
 }
 
-- 
1.9.1
