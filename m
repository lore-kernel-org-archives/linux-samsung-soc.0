From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 05/12] drm/exynos: dp: support drm_bridge
Date: Wed, 27 Aug 2014 19:59:39 +0530
Message-ID: <1409149783-12416-6-git-send-email-ajaykumar.rs@samsung.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25912 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934508AbaH0OjC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:39:02 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY004UCZD14050@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 23:39:01 +0900 (KST)
In-reply-to: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Modify driver to support drm_bridge.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig          |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c |   38 +++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_dp_core.h |    1 +
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 4c0e071..bdef294 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -54,6 +54,7 @@ config DRM_EXYNOS_DP
 	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS
 	default DRM_EXYNOS
 	select DRM_PANEL
+	select DRM_BRIDGE
 	help
 	  This enables support for DP device.
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 61ce6e4..a8a8b87 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -987,9 +987,17 @@ static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
 };
 
 /* returns the number of bridges attached */
-static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
+static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 		struct drm_encoder *encoder)
 {
+	int ret;
+
+	ret = drm_bridge_attach(dp->bridge, encoder);
+	if (ret) {
+		DRM_ERROR("Failed to attach bridge to encoder\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1003,9 +1011,11 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	dp->encoder = encoder;
 
 	/* Pre-empt DP connector creation if there's a bridge */
-	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
-	if (ret)
-		return 0;
+	if (dp->bridge) {
+		ret = exynos_drm_attach_lcd_bridge(dp, encoder);
+		if (!ret)
+			return 0;
+	}
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
@@ -1257,7 +1267,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	if (!dp->panel) {
+	if (!dp->panel && !dp->bridge) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
 			return ret;
@@ -1348,7 +1358,7 @@ static const struct component_ops exynos_dp_ops = {
 static int exynos_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
+	struct device_node *node;
 	struct exynos_dp_device *dp;
 	int ret;
 
@@ -1362,14 +1372,22 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
-	if (panel_node) {
-		dp->panel = of_drm_find_panel(panel_node);
-		of_node_put(panel_node);
+	node = of_parse_phandle(dev->of_node, "panel", 0);
+	if (node) {
+		dp->panel = of_drm_find_panel(node);
+		of_node_put(node);
 		if (!dp->panel)
 			return -EPROBE_DEFER;
 	}
 
+	node = of_parse_phandle(dev->of_node, "bridge", 0);
+	if (node) {
+		dp->bridge = of_drm_find_bridge(node);
+		of_node_put(node);
+		if (!dp->bridge)
+			return -EPROBE_DEFER;
+	}
+
 	exynos_dp_display.ctx = dp;
 
 	ret = component_add(&pdev->dev, &exynos_dp_ops);
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index a1aee69..3b0ba93 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -150,6 +150,7 @@ struct exynos_dp_device {
 	struct drm_connector	connector;
 	struct drm_encoder	*encoder;
 	struct drm_panel	*panel;
+	struct drm_bridge	*bridge;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
-- 
1.7.9.5
