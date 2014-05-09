From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC V3 3/3] drm: create and demonstrate bridge chaining using
 exynos_dp
Date: Fri, 09 May 2014 20:23:02 +0530
Message-ID: <1399647182-20951-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51192 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756928AbaEIOyt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 10:54:49 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5B00I7LARCHR50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 May 2014 23:54:48 +0900 (KST)
In-reply-to: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, a.hajda@samsung.com, inki.dae@samsung.com, daniel.vetter@ffwll.ch, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

use drm_bridge helpers to demonstrate chaining of bridges(ptn3460 and
bridge_panel) with exynos_dp encoder.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/ptn3460.c        |   60 +++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_dp_core.c |   25 ++++++++-----
 include/drm/bridge/ptn3460.h            |   15 ++++----
 3 files changed, 72 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index b171901..31ab8b3 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -126,6 +126,8 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
 	}
 
+	drm_next_bridge_pre_enable(bridge);
+
 	/*
 	 * There's a bug in the PTN chip where it falsely asserts hotplug before
 	 * it is fully functional. We're forced to wait for the maximum start up
@@ -142,6 +144,7 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 
 static void ptn3460_enable(struct drm_bridge *bridge)
 {
+	drm_next_bridge_enable(bridge);
 }
 
 static void ptn3460_disable(struct drm_bridge *bridge)
@@ -153,6 +156,8 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 	ptn_bridge->enabled = false;
 
+	drm_next_bridge_disable(bridge);
+
 	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
 		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
 
@@ -162,6 +167,7 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 static void ptn3460_post_disable(struct drm_bridge *bridge)
 {
+	drm_next_bridge_post_disable(bridge);
 }
 
 void ptn3460_bridge_destroy(struct drm_bridge *bridge)
@@ -173,6 +179,9 @@ void ptn3460_bridge_destroy(struct drm_bridge *bridge)
 		gpio_free(ptn_bridge->gpio_pd_n);
 	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
 		gpio_free(ptn_bridge->gpio_rst_n);
+
+	drm_next_bridge_destroy(bridge);
+
 	/* Nothing else to free, we've got devm allocated memory */
 }
 
@@ -189,15 +198,28 @@ int ptn3460_get_modes(struct drm_connector *connector)
 	struct ptn3460_bridge *ptn_bridge;
 	u8 *edid;
 	int ret, num_modes;
-	bool power_off;
 
 	ptn_bridge = container_of(connector, struct ptn3460_bridge, connector);
 
 	if (ptn_bridge->edid)
 		return drm_add_edid_modes(connector, ptn_bridge->edid);
 
-	power_off = !ptn_bridge->enabled;
-	ptn3460_pre_enable(ptn_bridge->bridge);
+	if (!ptn_bridge->enabled) {
+		if (gpio_is_valid(ptn_bridge->gpio_pd_n))
+			gpio_set_value(ptn_bridge->gpio_pd_n, 1);
+
+		if (gpio_is_valid(ptn_bridge->gpio_rst_n)) {
+			gpio_set_value(ptn_bridge->gpio_rst_n, 0);
+			udelay(10);
+			gpio_set_value(ptn_bridge->gpio_rst_n, 1);
+		}
+
+		msleep(90);
+
+		ret = ptn3460_select_edid(ptn_bridge);
+		if (ret)
+			DRM_ERROR("Select edid failed ret=%d\n", ret);
+	}
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid) {
@@ -219,8 +241,13 @@ int ptn3460_get_modes(struct drm_connector *connector)
 	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
 
 out:
-	if (power_off)
-		ptn3460_disable(ptn_bridge->bridge);
+	if (!ptn_bridge->enabled) {
+		if (gpio_is_valid(ptn_bridge->gpio_rst_n))
+			gpio_set_value(ptn_bridge->gpio_rst_n, 1);
+
+		if (gpio_is_valid(ptn_bridge->gpio_pd_n))
+			gpio_set_value(ptn_bridge->gpio_pd_n, 0);
+	}
 
 	return num_modes;
 }
@@ -264,8 +291,10 @@ struct drm_connector_funcs ptn3460_connector_funcs = {
 	.destroy = ptn3460_connector_destroy,
 };
 
-int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node)
+struct drm_bridge *ptn3460_init(struct drm_device *dev,
+				struct drm_encoder *encoder,
+				struct i2c_client *client,
+				struct device_node *node)
 {
 	int ret;
 	struct drm_bridge *bridge;
@@ -274,13 +303,13 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 	bridge = devm_kzalloc(dev->dev, sizeof(*bridge), GFP_KERNEL);
 	if (!bridge) {
 		DRM_ERROR("Failed to allocate drm bridge\n");
-		return -ENOMEM;
+		return NULL;
 	}
 
 	ptn_bridge = devm_kzalloc(dev->dev, sizeof(*ptn_bridge), GFP_KERNEL);
 	if (!ptn_bridge) {
 		DRM_ERROR("Failed to allocate ptn bridge\n");
-		return -ENOMEM;
+		return NULL;
 	}
 
 	ptn_bridge->client = client;
@@ -292,7 +321,7 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 				GPIOF_OUT_INIT_HIGH, "PTN3460_PD_N");
 		if (ret) {
 			DRM_ERROR("Request powerdown-gpio failed (%d)\n", ret);
-			return ret;
+			return NULL;
 		}
 	}
 
@@ -307,7 +336,7 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 		if (ret) {
 			DRM_ERROR("Request reset-gpio failed (%d)\n", ret);
 			gpio_free(ptn_bridge->gpio_pd_n);
-			return ret;
+			return NULL;
 		}
 	}
 
@@ -325,7 +354,10 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 	}
 
 	bridge->driver_private = ptn_bridge;
-	encoder->bridge = bridge;
+
+	if (!encoder->bridge)
+		/* First entry in the bridge chain */
+		encoder->bridge = bridge;
 
 	ret = drm_connector_init(dev, &ptn_bridge->connector,
 			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
@@ -338,13 +370,13 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 	drm_sysfs_connector_add(&ptn_bridge->connector);
 	drm_mode_connector_attach_encoder(&ptn_bridge->connector, encoder);
 
-	return 0;
+	return bridge;
 
 err:
 	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
 		gpio_free(ptn_bridge->gpio_pd_n);
 	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
 		gpio_free(ptn_bridge->gpio_rst_n);
-	return ret;
+	return NULL;
 }
 EXPORT_SYMBOL(ptn3460_init);
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 1cc3981..2cc31e1 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -27,6 +27,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/bridge/ptn3460.h>
+#include <drm/bridge/bridge_panel.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_dp_core.h"
@@ -979,24 +980,32 @@ static bool find_bridge(const char *compat, struct bridge_init *bridge)
 
 	bridge->client = of_find_i2c_device_by_node(bridge->node);
 	if (!bridge->client)
-		return false;
+		DRM_INFO("bridge is not an i2c device\n");
 
 	return true;
 }
 
-/* returns the number of bridges attached */
-static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
+static bool exynos_drm_attach_lcd_bridge(struct drm_device *dev,
 		struct drm_encoder *encoder)
 {
 	struct bridge_init bridge;
-	int ret;
+	struct drm_bridge *bridge_chain = NULL, *next = NULL;
+	bool connector_created = false;
 
 	if (find_bridge("nxp,ptn3460", &bridge)) {
-		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node);
-		if (!ret)
-			return 1;
+		bridge_chain = ptn3460_init(dev, encoder, bridge.client,
+								bridge.node);
+		if (bridge_chain)
+			connector_created = true;
 	}
-	return 0;
+
+	if (find_bridge("drm-bridge,panel", &bridge)) {
+		next = bridge_panel_init(dev, encoder, bridge.client,
+							bridge.node);
+		drm_bridge_add_to_chain(bridge_chain, next);
+	}
+
+	return connector_created;
 }
 
 static int exynos_dp_create_connector(struct exynos_drm_display *display,
diff --git a/include/drm/bridge/ptn3460.h b/include/drm/bridge/ptn3460.h
index ff62344..f612b9b 100644
--- a/include/drm/bridge/ptn3460.h
+++ b/include/drm/bridge/ptn3460.h
@@ -21,15 +21,18 @@ struct device_node;
 
 #if defined(CONFIG_DRM_PTN3460) || defined(CONFIG_DRM_PTN3460_MODULE)
 
-int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node);
+struct drm_bridge *ptn3460_init(struct drm_device *dev,
+				struct drm_encoder *encoder,
+				struct i2c_client *client,
+				struct device_node *node);
 #else
 
-static inline int ptn3460_init(struct drm_device *dev,
-		struct drm_encoder *encoder, struct i2c_client *client,
-		struct device_node *node)
+static inline struct drm_bridge *ptn3460_init(struct drm_device *dev,
+						struct drm_encoder *encoder,
+						struct i2c_client *client,
+						struct device_node *node)
 {
-	return 0;
+	return NULL;
 }
 
 #endif
-- 
1.7.9.5
