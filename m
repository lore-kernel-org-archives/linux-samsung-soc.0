From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 5/5] drm/exynos: separate dpi from fimd
Date: Thu, 17 Apr 2014 14:50:29 +0900
Message-ID: <1397713829-25776-6-git-send-email-inki.dae@samsung.com>
References: <1397713829-25776-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13910 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161202AbaDQFus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 01:50:48 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4500F1PUW89730@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Apr 2014 14:50:32 +0900 (KST)
In-reply-to: <1397713829-25776-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, seanpaul@chromium.org, a.hajda@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Inki Dae <inki.dae@samsung.com>

From: Andrzej Hajda <a.hajda@samsung.com>

The patch separates dpi related routines from fimd.

Changelog v2:
- Rename ctx->dpi to ctx->display

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  |   40 +++++------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   15 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |  109 ++++++++++++------------------
 3 files changed, 69 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index ac206e7..03cb126 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -40,20 +40,10 @@ exynos_dpi_detect(struct drm_connector *connector, bool force)
 {
 	struct exynos_dpi *ctx = connector_to_dpi(connector);
 
-	/* panels supported only by boot-loader are always connected */
-	if (!ctx->panel_node)
-		return connector_status_connected;
-
-	if (!ctx->panel) {
-		ctx->panel = of_drm_find_panel(ctx->panel_node);
-		if (ctx->panel)
-			drm_panel_attach(ctx->panel, &ctx->connector);
-	}
+	if (!ctx->panel->connector)
+		drm_panel_attach(ctx->panel, &ctx->connector);
 
-	if (ctx->panel)
-		return connector_status_connected;
-
-	return connector_status_disconnected;
+	return connector_status_connected;
 }
 
 static void exynos_dpi_connector_destroy(struct drm_connector *connector)
@@ -291,8 +281,10 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 			return -ENOMEM;
 
 		ret = of_get_videomode(dn, vm, 0);
-		if (ret < 0)
+		if (ret < 0) {
+			devm_kfree(dev, vm);
 			return ret;
+		}
 
 		ctx->vm = vm;
 
@@ -305,27 +297,35 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 	return 0;
 }
 
-int exynos_dpi_probe(struct drm_device *drm_dev, struct device *dev)
+struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
 {
 	struct exynos_dpi *ctx;
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
-		return -ENOMEM;
+		return NULL;
 
 	ctx->dev = dev;
 	exynos_dpi_display.ctx = ctx;
 	ctx->dpms_mode = DRM_MODE_DPMS_OFF;
 
 	ret = exynos_dpi_parse_dt(ctx);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		devm_kfree(dev, ctx);
+		return NULL;
+	}
+
+	if (ctx->panel_node) {
+		ctx->panel = of_drm_find_panel(ctx->panel_node);
+		if (!ctx->panel)
+			return ERR_PTR(-EPROBE_DEFER);
+	}
 
-	return exynos_drm_create_enc_conn(drm_dev, &exynos_dpi_display);
+	return &exynos_dpi_display;
 }
 
-int exynos_dpi_remove(struct drm_device *drm_dev, struct device *dev)
+int exynos_dpi_remove(struct device *dev)
 {
 	struct drm_encoder *encoder = exynos_dpi_display.encoder;
 	struct exynos_dpi *ctx = exynos_dpi_display.ctx;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 3aee01b..d955f60 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -334,17 +334,12 @@ int exynos_platform_device_ipp_register(void);
 void exynos_platform_device_ipp_unregister(void);
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
-int exynos_dpi_probe(struct drm_device *drm_dev, struct device *dev);
-int exynos_dpi_remove(struct drm_device *drm_dev, struct device *dev);
-struct device_node *exynos_dpi_of_find_panel_node(struct device *dev);
+struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
+int exynos_dpi_remove(struct device *dev);
 #else
-static inline int exynos_dpi_probe(struct drm_device *drm_dev,
-					struct device *dev) { return 0; }
-static inline int exynos_dpi_remove(struct drm_device *drm_dev,
-					struct device *dev) { return 0; }
-static inline struct device_node
-			*exynos_dpi_of_find_panel_node(struct device *dev)
-{ return NULL; }
+static inline struct exynos_drm_display *
+exynos_dpi_probe(struct device *dev) { return 0; }
+static inline int exynos_dpi_remove(struct device *dev) { return 0; }
 #endif
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bab870c..a6d6386 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -24,7 +24,6 @@
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
 #include <video/samsung_fimd.h>
-#include <drm/drm_panel.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
@@ -124,6 +123,7 @@ struct fimd_context {
 
 	struct exynos_drm_panel_info panel;
 	struct fimd_driver_data *driver_data;
+	struct exynos_drm_display *display;
 };
 
 static const struct of_device_id fimd_driver_dt_match[] = {
@@ -853,12 +853,49 @@ out:
 
 static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	struct fimd_context *ctx = fimd_manager.ctx;
 	struct drm_device *drm_dev = data;
+	int win;
+
+	fimd_mgr_initialize(&fimd_manager, drm_dev);
+	exynos_drm_crtc_create(&fimd_manager);
+	if (ctx->display)
+		exynos_drm_create_enc_conn(drm_dev, ctx->display);
+
+	for (win = 0; win < WINDOWS_NR; win++)
+		fimd_clear_win(ctx, win);
+
+	return 0;
+
+}
+
+static void fimd_unbind(struct device *dev, struct device *master,
+			void *data)
+{
+	struct exynos_drm_manager *mgr = dev_get_drvdata(dev);
+	struct fimd_context *ctx = fimd_manager.ctx;
+	struct drm_crtc *crtc = mgr->crtc;
+
+	fimd_dpms(mgr, DRM_MODE_DPMS_OFF);
+
+	if (ctx->display)
+		exynos_dpi_remove(dev);
+
+	fimd_mgr_remove(mgr);
+
+	crtc->funcs->destroy(crtc);
+}
+
+static const struct component_ops fimd_component_ops = {
+	.bind	= fimd_bind,
+	.unbind = fimd_unbind,
+};
+
+static int fimd_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	struct fimd_context *ctx;
-	struct device_node *dn;
 	struct resource *res;
-	int win;
 	int ret = -EINVAL;
 
 	if (!dev->of_node)
@@ -914,68 +951,10 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	platform_set_drvdata(pdev, &fimd_manager);
 
 	fimd_manager.ctx = ctx;
-	fimd_mgr_initialize(&fimd_manager, drm_dev);
-
-	exynos_drm_crtc_create(&fimd_manager);
-
-	dn = exynos_dpi_of_find_panel_node(&pdev->dev);
-	if (dn) {
-		/*
-		 * It should be called after exynos_drm_crtc_create call
-		 * because exynos_dpi_probe call will try to find same lcd
-		 * type of manager to setup possible_crtcs.
-		 */
-		exynos_dpi_probe(drm_dev, dev);
-	}
-
-	for (win = 0; win < WINDOWS_NR; win++)
-		fimd_clear_win(ctx, win);
-
-	return 0;
-}
-
-static void fimd_unbind(struct device *dev, struct device *master,
-			void *data)
-{
-	struct exynos_drm_manager *mgr = dev_get_drvdata(dev);
-	struct drm_crtc *crtc = mgr->crtc;
-	struct device_node *dn;
 
-	fimd_dpms(mgr, DRM_MODE_DPMS_OFF);
-
-	dn = exynos_dpi_of_find_panel_node(dev);
-	if (dn)
-		exynos_dpi_remove(mgr->drm_dev, dev);
-
-	fimd_mgr_remove(mgr);
-
-	crtc->funcs->destroy(crtc);
-}
-
-static const struct component_ops fimd_component_ops = {
-	.bind	= fimd_bind,
-	.unbind = fimd_unbind,
-};
-
-static int fimd_probe(struct platform_device *pdev)
-{
-	struct device_node *dn;
-
-	/* Check if fimd node has port node. */
-	dn = exynos_dpi_of_find_panel_node(&pdev->dev);
-	if (dn) {
-		struct drm_panel *panel;
-
-		/*
-		 * Do not bind if there is the port node but a drm_panel
-		 * isn't added to panel_list yet.
-		 * In this case, fimd_probe will be called by defered probe
-		 * again after the drm_panel is added to panel_list.
-		 */
-		panel = of_drm_find_panel(dn);
-		if (!panel)
-			return -EPROBE_DEFER;
-	}
+	ctx->display = exynos_dpi_probe(dev);
+	if (IS_ERR(ctx->display))
+		return PTR_ERR(ctx->display);
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
1.7.9.5
