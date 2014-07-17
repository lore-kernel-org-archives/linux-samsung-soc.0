From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RESEND PATCH V5 03/12] drm/exynos: dp: modify driver to support
 drm_panel
Date: Fri, 18 Jul 2014 02:13:49 +0530
Message-ID: <1405629839-12086-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33622 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752334AbaGQUrB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:47:01 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V00BHRJ2CZW70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:47:00 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Ajay Kumar <ajaykumar.rs@samsung.com>

Add drm_panel controls to support powerup/down of the
eDP panel, if one is present at the sink side.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/video/exynos_dp.txt        |    2 +
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   45 ++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    2 +
 4 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/video/exynos_dp.txt
index 53dbccf..c029a09 100644
--- a/Documentation/devicetree/bindings/video/exynos_dp.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
@@ -51,6 +51,8 @@ Required properties for dp-controller:
 			LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
 	- display-timings: timings for the connected panel as described by
 		Documentation/devicetree/bindings/video/display-timing.txt
+	-edp-panel:
+		phandle for the edp/lvds drm_panel node.
 
 Optional properties for dp-controller:
 	-interlaced:
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 178d2a9..fd1c070 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -52,6 +52,7 @@ config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
 	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
 	default DRM_EXYNOS
+	select DRM_PANEL
 	help
 	  This enables support for DP device.
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index a94b114..b3d0d9b 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -28,6 +28,7 @@
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
 
 #include "exynos_drm_drv.h"
@@ -1029,6 +1030,9 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	drm_connector_register(connector);
 	drm_mode_connector_attach_encoder(connector, encoder);
 
+	if (dp->edp_panel)
+		drm_panel_attach(dp->edp_panel, &dp->connector);
+
 	return 0;
 }
 
@@ -1063,11 +1067,13 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
 		return;
 
+	drm_panel_prepare(dp->edp_panel);
 	clk_prepare_enable(dp->clock);
 	exynos_dp_phy_init(dp);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
 	exynos_dp_setup(dp);
+	drm_panel_enable(dp->edp_panel);
 }
 
 static void exynos_dp_poweroff(struct exynos_dp_device *dp)
@@ -1075,10 +1081,12 @@ static void exynos_dp_poweroff(struct exynos_dp_device *dp)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
+	drm_panel_disable(dp->edp_panel);
 	disable_irq(dp->irq);
 	flush_work(&dp->hotplug_work);
 	exynos_dp_phy_exit(dp);
 	clk_disable_unprepare(dp->clock);
+	drm_panel_unprepare(dp->edp_panel);
 }
 
 static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
@@ -1209,8 +1217,17 @@ err:
 static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
 {
 	int ret;
+	struct device_node *videomode_parent;
+
+	/* Receive video timing info from panel node
+	 * if there is a panel node
+	 */
+	if (dp->panel_node)
+		videomode_parent = dp->panel_node;
+	else
+		videomode_parent = dp->dev->of_node;
 
-	ret = of_get_videomode(dp->dev->of_node, &dp->panel.vm,
+	ret = of_get_videomode(videomode_parent, &dp->panel.vm,
 			OF_USE_NATIVE_MODE);
 	if (ret) {
 		DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
@@ -1224,16 +1241,10 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
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
 
@@ -1307,7 +1318,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	disable_irq(dp->irq);
 
 	dp->drm_dev = drm_dev;
-	exynos_dp_display.ctx = dp;
 
 	platform_set_drvdata(pdev, &exynos_dp_display);
 
@@ -1334,6 +1344,8 @@ static const struct component_ops exynos_dp_ops = {
 
 static int exynos_dp_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct exynos_dp_device *dp;
 	int ret;
 
 	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
@@ -1341,6 +1353,21 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dp = devm_kzalloc(&pdev->dev, sizeof(struct exynos_dp_device),
+				GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	dp->panel_node = of_parse_phandle(dev->of_node, "edp-panel", 0);
+	if (dp->panel_node) {
+		dp->edp_panel = of_drm_find_panel(dp->panel_node);
+		of_node_put(dp->panel_node);
+		if (!dp->edp_panel)
+			return -EPROBE_DEFER;
+	}
+
+	exynos_dp_display.ctx = dp;
+
 	ret = component_add(&pdev->dev, &exynos_dp_ops);
 	if (ret)
 		exynos_drm_component_del(&pdev->dev,
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index 02cc4f9..3c29e4e 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -146,9 +146,11 @@ struct link_train {
 
 struct exynos_dp_device {
 	struct device		*dev;
+	struct device_node	*panel_node;
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
 	struct drm_encoder	*encoder;
+	struct drm_panel	*edp_panel;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
-- 
1.7.9.5
