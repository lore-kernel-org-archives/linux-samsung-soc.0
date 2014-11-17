From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 13/14] drm/exynos/dpi: embed display into private context
Date: Mon, 17 Nov 2014 09:54:26 +0100
Message-ID: <1416214467-6179-14-git-send-email-a.hajda@samsung.com>
References: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35056 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668AbaKQIzQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 03:55:16 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF600GL9E8X7E40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 08:58:09 +0000 (GMT)
In-reply-to: <1416214467-6179-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>

exynos_drm_display is used by internal Exynos DRM framework for
representing encoder:connector pair. As it should be mapped 1:1 to dpi
private context it seems more reasonable to embed it directly in that context.
As a result further code simplification will be possible.
Moreover it will be possible to handle multiple dpi devices in the system.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 39 +++++++++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |  2 +-
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 3dc678e..3acfc28 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -22,6 +22,7 @@
 #include "exynos_drm_drv.h"
 
 struct exynos_dpi {
+	struct exynos_drm_display display;
 	struct device *dev;
 	struct device_node *panel_node;
 
@@ -35,6 +36,11 @@ struct exynos_dpi {
 
 #define connector_to_dpi(c) container_of(c, struct exynos_dpi, connector)
 
+static inline struct exynos_dpi *display_to_dpi(struct exynos_drm_display *d)
+{
+	return container_of(d, struct exynos_dpi, display);
+}
+
 static enum drm_connector_status
 exynos_dpi_detect(struct drm_connector *connector, bool force)
 {
@@ -165,11 +171,6 @@ static struct exynos_drm_display_ops exynos_dpi_display_ops = {
 	.dpms = exynos_dpi_dpms
 };
 
-static struct exynos_drm_display exynos_dpi_display = {
-	.type = EXYNOS_DISPLAY_TYPE_LCD,
-	.ops = &exynos_dpi_display_ops,
-};
-
 /* of_* functions will be removed after merge of of_graph patches */
 static struct device_node *
 of_get_child_by_name_reg(struct device_node *parent, const char *name, u32 reg)
@@ -299,20 +300,22 @@ struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
 	struct exynos_dpi *ctx;
 	int ret;
 
-	ret = exynos_drm_component_add(dev,
-					EXYNOS_DEVICE_TYPE_CONNECTOR,
-					exynos_dpi_display.type);
-	if (ret)
-		return ERR_PTR(ret);
-
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
-		goto err_del_component;
+		return ERR_PTR(-ENOMEM);
 
+	ctx->display.type = EXYNOS_DISPLAY_TYPE_LCD;
+	ctx->display.ops = &exynos_dpi_display_ops;
 	ctx->dev = dev;
-	exynos_dpi_display.ctx = ctx;
+	ctx->display.ctx = ctx;
 	ctx->dpms_mode = DRM_MODE_DPMS_OFF;
 
+	ret = exynos_drm_component_add(dev,
+					EXYNOS_DEVICE_TYPE_CONNECTOR,
+					ctx->display.type);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = exynos_dpi_parse_dt(ctx);
 	if (ret < 0) {
 		devm_kfree(dev, ctx);
@@ -328,7 +331,7 @@ struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
 		}
 	}
 
-	return &exynos_dpi_display;
+	return &ctx->display;
 
 err_del_component:
 	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
@@ -336,16 +339,16 @@ err_del_component:
 	return NULL;
 }
 
-int exynos_dpi_remove(struct device *dev)
+int exynos_dpi_remove(struct exynos_drm_display *display)
 {
-	struct exynos_dpi *ctx = exynos_dpi_display.ctx;
+	struct exynos_dpi *ctx = display_to_dpi(display);
 
-	exynos_dpi_dpms(&exynos_dpi_display, DRM_MODE_DPMS_OFF);
+	exynos_dpi_dpms(&ctx->display, DRM_MODE_DPMS_OFF);
 
 	if (ctx->panel)
 		drm_panel_detach(ctx->panel);
 
-	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
+	exynos_drm_component_del(ctx->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index d8240fd..c5ad852 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -334,7 +334,7 @@ void exynos_platform_device_ipp_unregister(void);
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
 struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
-int exynos_dpi_remove(struct device *dev);
+int exynos_dpi_remove(struct exynos_drm_display *display);
 #else
 static inline struct exynos_drm_display *
 exynos_dpi_probe(struct device *dev) { return NULL; }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 2a652ab..f4d24f2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1077,7 +1077,7 @@ static void fimd_unbind(struct device *dev, struct device *master,
 	fimd_dpms(&ctx->manager, DRM_MODE_DPMS_OFF);
 
 	if (ctx->display)
-		exynos_dpi_remove(dev);
+		exynos_dpi_remove(ctx->display);
 
 	fimd_mgr_remove(&ctx->manager);
 }
-- 
1.9.1
