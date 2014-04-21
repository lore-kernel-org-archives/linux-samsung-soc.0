From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 7/9] drm/bridge: ptn3460: add drm_panel controls
Date: Tue, 22 Apr 2014 04:09:16 +0530
Message-ID: <1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57832 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754527AbaDUWkB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:40:01 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00FAWKAOW9A0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 07:40:00 +0900 (KST)
In-reply-to: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

attach ptn3460 connector to drm_panel and support drm_panel routines,
if a valid drm_panel object is passed to ptn3460_init.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
	Address few coding style comments from Jingoo Han

 drivers/gpu/drm/bridge/Kconfig          |    1 +
 drivers/gpu/drm/bridge/ptn3460.c        |   20 +++++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_dp_core.c |   16 ++++++++++++----
 include/drm/bridge/ptn3460.h            |    6 ++++--
 4 files changed, 36 insertions(+), 7 deletions(-)

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
index f1d2afc..3920202 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -19,6 +19,7 @@
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/delay.h>
+#include <drm/drm_panel.h>
 
 #include "drmP.h"
 #include "drm_edid.h"
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
@@ -142,6 +146,10 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 
 static void ptn3460_enable(struct drm_bridge *bridge)
 {
+	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
+
+	if (ptn_bridge->enabled)
+		drm_panel_enable(ptn_bridge->panel);
 }
 
 static void ptn3460_disable(struct drm_bridge *bridge)
@@ -153,6 +161,9 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 	ptn_bridge->enabled = false;
 
+	drm_panel_disable(ptn_bridge->panel);
+	drm_panel_post_disable(ptn_bridge->panel);
+
 	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
 		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
 
@@ -198,6 +209,7 @@ int ptn3460_get_modes(struct drm_connector *connector)
 
 	power_off = !ptn_bridge->enabled;
 	ptn3460_pre_enable(ptn_bridge->bridge);
+	ptn3460_enable(ptn_bridge->bridge);
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid) {
@@ -265,7 +277,8 @@ struct drm_connector_funcs ptn3460_connector_funcs = {
 };
 
 int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node)
+		struct i2c_client *client, struct device_node *node,
+		struct drm_panel *panel)
 {
 	int ret;
 	struct drm_bridge *bridge;
@@ -324,6 +337,11 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
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
index dbc5ccc..4853f31 100644
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
+				panel);
 		if (!ret)
 			return 1;
 	}
@@ -1012,9 +1013,16 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	dp->encoder = encoder;
 
 	/* Pre-empt DP connector creation if there's a bridge */
-	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
-	if (ret)
+	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder, dp->drm_panel);
+	if (ret) {
+		/*
+		 * Also set "dp->drm_panel = NULL" so that we don't end up
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
1.7.9.5
