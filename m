From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 15/15] drm/exynos: dp: Modify driver to support drm_panel
Date: Thu, 31 Jul 2014 23:12:14 +0530
Message-ID: <1406828534-10072-16-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9277 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752741AbaGaRqD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:46:03 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add drm_panel controls to support powerup/down of the
eDP panel, if one is present at the sink side.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig          |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c |   88 ++++++++++++++++++++++++-------
 drivers/gpu/drm/exynos/exynos_dp_core.h |    3 +-
 3 files changed, 71 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 9ba1aae..7f9f6f9 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -53,6 +53,7 @@ config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
 	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
 	default DRM_EXYNOS
+	select DRM_PANEL
 	help
 	  This enables support for DP device.
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 347dec9..4f3c7eb 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -16,7 +16,6 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
-#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/gpio.h>
@@ -28,6 +27,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
 
 #include "exynos_drm_drv.h"
@@ -41,7 +41,7 @@ struct bridge_init {
 	struct device_node *node;
 };
 
-static int exynos_dp_init_dp(struct exynos_dp_device *dp)
+static void exynos_dp_init_dp(struct exynos_dp_device *dp)
 {
 	exynos_dp_reset(dp);
 
@@ -58,8 +58,6 @@ static int exynos_dp_init_dp(struct exynos_dp_device *dp)
 
 	exynos_dp_init_hpd(dp);
 	exynos_dp_init_aux(dp);
-
-	return 0;
 }
 
 static int exynos_dp_detect_hpd(struct exynos_dp_device *dp)
@@ -887,6 +885,12 @@ static void exynos_dp_commit(struct exynos_drm_display *display)
 	struct exynos_dp_device *dp = display->ctx;
 	int ret;
 
+	/* Keep the panel disabled while we configure video */
+	if (dp->panel) {
+		if (drm_panel_disable(dp->panel))
+			DRM_ERROR("failed to disable the panel\n");
+	}
+
 	ret = exynos_dp_detect_hpd(dp);
 	if (ret) {
 		/* Cable has been disconnected, we're done */
@@ -917,6 +921,12 @@ static void exynos_dp_commit(struct exynos_drm_display *display)
 	ret = exynos_dp_config_video(dp);
 	if (ret)
 		dev_err(dp->dev, "unable to config video\n");
+
+	/* Safe to enable the panel now */
+	if (dp->panel) {
+		if (drm_panel_enable(dp->panel))
+			DRM_ERROR("failed to enable the panel\n");
+	}
 }
 
 static enum drm_connector_status exynos_dp_detect(
@@ -941,15 +951,18 @@ static int exynos_dp_get_modes(struct drm_connector *connector)
 	struct exynos_dp_device *dp = ctx_from_connector(connector);
 	struct drm_display_mode *mode;
 
+	if (dp->panel)
+		return drm_panel_get_modes(dp->panel);
+
 	mode = drm_mode_create(connector->dev);
 	if (!mode) {
 		DRM_ERROR("failed to create a new display mode.\n");
 		return 0;
 	}
 
-	drm_display_mode_from_videomode(&dp->panel.vm, mode);
-	mode->width_mm = dp->panel.width_mm;
-	mode->height_mm = dp->panel.height_mm;
+	drm_display_mode_from_videomode(&dp->priv.vm, mode);
+	mode->width_mm = dp->priv.width_mm;
+	mode->height_mm = dp->priv.height_mm;
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
@@ -1029,7 +1042,10 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	drm_connector_register(connector);
 	drm_mode_connector_attach_encoder(connector, encoder);
 
-	return 0;
+	if (dp->panel)
+		ret = drm_panel_attach(dp->panel, &dp->connector);
+
+	return ret;
 }
 
 static void exynos_dp_phy_init(struct exynos_dp_device *dp)
@@ -1065,6 +1081,13 @@ static void exynos_dp_poweron(struct exynos_drm_display *display)
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
 		return;
 
+	if (dp->panel) {
+		if (drm_panel_prepare(dp->panel)) {
+			DRM_ERROR("failed to setup the panel\n");
+			return;
+		}
+	}
+
 	clk_prepare_enable(dp->clock);
 	exynos_dp_phy_init(dp);
 	exynos_dp_init_dp(dp);
@@ -1079,10 +1102,22 @@ static void exynos_dp_poweroff(struct exynos_drm_display *display)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
+	if (dp->panel) {
+		if (drm_panel_disable(dp->panel)) {
+			DRM_ERROR("failed to disable the panel\n");
+			return;
+		}
+	}
+
 	disable_irq(dp->irq);
 	flush_work(&dp->hotplug_work);
 	exynos_dp_phy_exit(dp);
 	clk_disable_unprepare(dp->clock);
+
+	if (dp->panel) {
+		if (drm_panel_unprepare(dp->panel))
+			DRM_ERROR("failed to turnoff the panel\n");
+	}
 }
 
 static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
@@ -1215,7 +1250,7 @@ static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
 {
 	int ret;
 
-	ret = of_get_videomode(dp->dev->of_node, &dp->panel.vm,
+	ret = of_get_videomode(dp->dev->of_node, &dp->priv.vm,
 			OF_USE_NATIVE_MODE);
 	if (ret) {
 		DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
@@ -1229,16 +1264,10 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm_dev = data;
 	struct resource *res;
-	struct exynos_dp_device *dp;
+	struct exynos_dp_device *dp = exynos_dp_display.ctx;
 	unsigned int irq_flags;
-
 	int ret = 0;
 
-	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
-				GFP_KERNEL);
-	if (!dp)
-		return -ENOMEM;
-
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 
@@ -1250,9 +1279,11 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = exynos_dp_dt_parse_panel(dp);
-	if (ret)
-		return ret;
+	if (!dp->panel) {
+		ret = exynos_dp_dt_parse_panel(dp);
+		if (ret)
+			return ret;
+	}
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
@@ -1312,7 +1343,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	disable_irq(dp->irq);
 
 	dp->drm_dev = drm_dev;
-	exynos_dp_display.ctx = dp;
 
 	platform_set_drvdata(pdev, &exynos_dp_display);
 
@@ -1339,6 +1369,9 @@ static const struct component_ops exynos_dp_ops = {
 
 static int exynos_dp_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct device_node *panel_node;
+	struct exynos_dp_device *dp;
 	int ret;
 
 	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
@@ -1346,6 +1379,21 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
+				GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
+	if (panel_node) {
+		dp->panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (!dp->panel)
+			return -EPROBE_DEFER;
+	}
+
+	exynos_dp_display.ctx = dp;
+
 	ret = component_add(&pdev->dev, &exynos_dp_ops);
 	if (ret)
 		exynos_drm_component_del(&pdev->dev,
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index 02cc4f9..a1aee69 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -149,6 +149,7 @@ struct exynos_dp_device {
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
 	struct drm_encoder	*encoder;
+	struct drm_panel	*panel;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
@@ -162,7 +163,7 @@ struct exynos_dp_device {
 	int			dpms_mode;
 	int			hpd_gpio;
 
-	struct exynos_drm_panel_info panel;
+	struct exynos_drm_panel_info priv;
 };
 
 /* exynos_dp_reg.c */
-- 
1.7.9.5
