From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 06/12] drm/bridge: ptn3460: support drm_panel
Date: Wed, 27 Aug 2014 19:59:40 +0530
Message-ID: <1409149783-12416-7-git-send-email-ajaykumar.rs@samsung.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18492 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934508AbaH0Ojw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:39:52 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY00IVEZEDOV70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 23:39:49 +0900 (KST)
In-reply-to: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add drm_panel calls to the driver to make the panel and
bridge work together in tandem.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig   |    1 +
 drivers/gpu/drm/bridge/ptn3460.c |   37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 7e63a52..d35fb68 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -12,6 +12,7 @@ config DRM_PTN3460
 	tristate "PTN3460 DP/LVDS bridge"
 	depends on OF
 	depends on I2C
+	select DRM_PANEL
 	help
 	  ptn3460 eDP-LVDS bridge chip driver.
 
diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index 651640a..3cb3a7c 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -20,6 +20,8 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 
+#include <drm/drm_panel.h>
+
 #include "bridge/ptn3460.h"
 
 #include "drm_crtc.h"
@@ -38,6 +40,7 @@ struct ptn3460_bridge {
 	struct i2c_client *client;
 	struct drm_bridge bridge;
 	struct edid *edid;
+	struct drm_panel *panel;
 	int gpio_pd_n;
 	int gpio_rst_n;
 	u32 edid_emulation;
@@ -137,6 +140,11 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
 	}
 
+	if (drm_panel_prepare(ptn_bridge->panel)) {
+		DRM_ERROR("failed to prepare panel\n");
+		return;
+	}
+
 	/*
 	 * There's a bug in the PTN chip where it falsely asserts hotplug before
 	 * it is fully functional. We're forced to wait for the maximum start up
@@ -153,6 +161,12 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 
 static void ptn3460_enable(struct drm_bridge *bridge)
 {
+	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
+
+	if (drm_panel_enable(ptn_bridge->panel)) {
+		DRM_ERROR("failed to enable panel\n");
+		return;
+	}
 }
 
 static void ptn3460_disable(struct drm_bridge *bridge)
@@ -164,6 +178,11 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 	ptn_bridge->enabled = false;
 
+	if (drm_panel_disable(ptn_bridge->panel)) {
+		DRM_ERROR("failed to disable panel\n");
+		return;
+	}
+
 	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
 		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
 
@@ -173,6 +192,12 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 static void ptn3460_post_disable(struct drm_bridge *bridge)
 {
+	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
+
+	if (drm_panel_unprepare(ptn_bridge->panel)) {
+		DRM_ERROR("failed to unprepare panel\n");
+		return;
+	}
 }
 
 static void ptn3460_bridge_destroy(struct drm_bridge *bridge)
@@ -274,6 +299,9 @@ int ptn3460_bridge_attach(struct drm_bridge *bridge)
 	drm_mode_connector_attach_encoder(&ptn_bridge->connector,
 							bridge->encoder);
 
+	if (ptn_bridge->panel)
+		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
+
 	return ret;
 }
 
@@ -291,6 +319,7 @@ static int ptn3460_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
+	struct device_node *panel_node;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -298,6 +327,14 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
+	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
+	if (panel_node) {
+		ptn_bridge->panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (!ptn_bridge->panel)
+			return -EPROBE_DEFER;
+	}
+
 	ptn_bridge->client = client;
 	ptn_bridge->gpio_pd_n = of_get_named_gpio(dev->of_node,
 							"powerdown-gpio", 0);
-- 
1.7.9.5
