From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 7/7] drm/bridge: ptn3460: add drm_panel controls
Date: Wed, 16 Apr 2014 20:03:06 +0530
Message-ID: <1397658786-26138-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63630 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161089AbaDPOds (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:33:48 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N44006R6OGBUL70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 23:33:47 +0900 (KST)
In-reply-to: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, a.hajda@samsung.com, treding@nvidia.com, kyungmin.park@samsung.com, seanpaul@google.com, abrestic@chromium.org, rahul.sharma@samsung.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

attach ptn3460 connector to drm_panel and support drm_panel routines,
if a valid drm_panel object is passed to ptn3460_init.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig          |  1 +
 drivers/gpu/drm/bridge/ptn3460.c        | 17 ++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_dp_core.c | 15 +++++++++++----
 include/drm/bridge/ptn3460.h            |  6 ++++--
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 884923f..3bc6845 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -2,4 +2,5 @@ config DRM_PTN3460
 	tristate "PTN3460 DP/LVDS bridge"
 	depends on DRM
 	select DRM_KMS_HELPER
+	select DRM_PANEL
 	---help---
diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index f1d2afc..736c7a8 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -24,6 +24,7 @@
 #include "drm_edid.h"
 #include "drm_crtc.h"
 #include "drm_crtc_helper.h"
+#include <drm/drm_panel.h>
 
 #include "bridge/ptn3460.h"
 
@@ -38,6 +39,7 @@ struct ptn3460_bridge {
 	struct i2c_client *client;
 	struct drm_encoder *encoder;
 	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	struct edid *edid;
 	int gpio_pd_n;
 	int gpio_rst_n;
@@ -126,6 +128,8 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
 	}
 
+	drm_panel_pre_enable(ptn_bridge->panel);
+
 	/*
 	 * There's a bug in the PTN chip where it falsely asserts hotplug before
 	 * it is fully functional. We're forced to wait for the maximum start up
@@ -142,6 +146,9 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 
 static void ptn3460_enable(struct drm_bridge *bridge)
 {
+	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
+
+	drm_panel_enable(ptn_bridge->panel);
 }
 
 static void ptn3460_disable(struct drm_bridge *bridge)
@@ -153,6 +160,8 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 	ptn_bridge->enabled = false;
 
+	drm_panel_disable(ptn_bridge->panel);
+
 	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
 		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
 
@@ -265,7 +274,8 @@ struct drm_connector_funcs ptn3460_connector_funcs = {
 };
 
 int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node)
+		struct i2c_client *client, struct device_node *node,
+		struct drm_panel *panel)
 {
 	int ret;
 	struct drm_bridge *bridge;
@@ -324,6 +334,11 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 		goto err;
 	}
 
+	if (panel) {
+		ptn_bridge->panel = panel;
+		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
+	}
+
 	bridge->driver_private = ptn_bridge;
 	encoder->bridge = bridge;
 	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 6beeab6..7f550b6 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -989,13 +989,14 @@ static bool find_bridge(const char *compat, struct bridge_init *bridge)
 
 /* returns the number of bridges attached */
 static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
-		struct drm_encoder *encoder)
+		struct drm_encoder *encoder, struct drm_panel *panel)
 {
 	struct bridge_init bridge;
 	int ret;
 
 	if (find_bridge("nxp,ptn3460", &bridge)) {
-		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node);
+		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node,
+									panel);
 		if (!ret)
 			return 1;
 	}
@@ -1012,9 +1013,15 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	dp->encoder = encoder;
 
 	/* Pre-empt DP connector creation if there's a bridge */
-	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
-	if (ret)
+	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder, dp->drm_panel);
+	if (ret) {
+		/* Also set "dp->drm_panel = NULL" so that we don't end up
+		 * controlling panel power both in exynos_dp and bridge
+		 * DPMS routines.
+		 */
+		dp->drm_panel = NULL;
 		return 0;
+	}
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
diff --git a/include/drm/bridge/ptn3460.h b/include/drm/bridge/ptn3460.h
index ff62344..570cebb 100644
--- a/include/drm/bridge/ptn3460.h
+++ b/include/drm/bridge/ptn3460.h
@@ -18,16 +18,18 @@ struct drm_device;
 struct drm_encoder;
 struct i2c_client;
 struct device_node;
+struct drm_panel;
 
 #if defined(CONFIG_DRM_PTN3460) || defined(CONFIG_DRM_PTN3460_MODULE)
 
 int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node);
+		struct i2c_client *client, struct device_node *node,
+		struct drm_panel *panel);
 #else
 
 static inline int ptn3460_init(struct drm_device *dev,
 		struct drm_encoder *encoder, struct i2c_client *client,
-		struct device_node *node)
+		struct device_node *node, struct drm_panel *panel)
 {
 	return 0;
 }
-- 
1.8.1.2
