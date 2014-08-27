From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 04/12] drm/bridge: ptn3460: Convert to i2c driver model
Date: Wed, 27 Aug 2014 19:59:38 +0530
Message-ID: <1409149783-12416-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25862 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934652AbaH0OiH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:38:07 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY007LHZBHMI30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 23:38:05 +0900 (KST)
In-reply-to: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Use drm_bridge helpers to modify the driver to support
i2c driver model.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig          |    6 +-
 drivers/gpu/drm/bridge/ptn3460.c        |  122 +++++++++++++++++++++----------
 drivers/gpu/drm/exynos/Kconfig          |    2 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c |   22 ------
 4 files changed, 89 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 5a8e907..7e63a52 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -10,7 +10,9 @@ menu "bridge chips"
 
 config DRM_PTN3460
 	tristate "PTN3460 DP/LVDS bridge"
-	depends on DRM_BRIDGE
-	---help---
+	depends on OF
+	depends on I2C
+	help
+	  ptn3460 eDP-LVDS bridge chip driver.
 
 endmenu
diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index a2ddc8d..651640a 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -36,7 +36,6 @@
 struct ptn3460_bridge {
 	struct drm_connector connector;
 	struct i2c_client *client;
-	struct drm_encoder *encoder;
 	struct drm_bridge bridge;
 	struct edid *edid;
 	int gpio_pd_n;
@@ -188,14 +187,6 @@ static void ptn3460_bridge_destroy(struct drm_bridge *bridge)
 	/* Nothing else to free, we've got devm allocated memory */
 }
 
-static struct drm_bridge_funcs ptn3460_bridge_funcs = {
-	.pre_enable = ptn3460_pre_enable,
-	.enable = ptn3460_enable,
-	.disable = ptn3460_disable,
-	.post_disable = ptn3460_post_disable,
-	.destroy = ptn3460_bridge_destroy,
-};
-
 static int ptn3460_get_modes(struct drm_connector *connector)
 {
 	struct ptn3460_bridge *ptn_bridge;
@@ -240,7 +231,7 @@ static struct drm_encoder *ptn3460_best_encoder(struct drm_connector *connector)
 {
 	struct ptn3460_bridge *ptn_bridge = connector_to_ptn3460(connector);
 
-	return ptn_bridge->encoder;
+	return ptn_bridge->bridge.encoder;
 }
 
 static struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
@@ -266,31 +257,62 @@ static struct drm_connector_funcs ptn3460_connector_funcs = {
 	.destroy = ptn3460_connector_destroy,
 };
 
-int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node)
+int ptn3460_bridge_attach(struct drm_bridge *bridge)
 {
+	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	int ret;
+
+	ret = drm_connector_init(bridge->drm, &ptn_bridge->connector,
+			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+	drm_connector_helper_add(&ptn_bridge->connector,
+					&ptn3460_connector_helper_funcs);
+	drm_connector_register(&ptn_bridge->connector);
+	drm_mode_connector_attach_encoder(&ptn_bridge->connector,
+							bridge->encoder);
+
+	return ret;
+}
+
+static struct drm_bridge_funcs ptn3460_bridge_funcs = {
+	.pre_enable = ptn3460_pre_enable,
+	.enable = ptn3460_enable,
+	.disable = ptn3460_disable,
+	.post_disable = ptn3460_post_disable,
+	.destroy = ptn3460_bridge_destroy,
+	.attach = ptn3460_bridge_attach,
+};
+
+static int ptn3460_probe(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
+	int ret;
 
-	ptn_bridge = devm_kzalloc(dev->dev, sizeof(*ptn_bridge), GFP_KERNEL);
+	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
 	if (!ptn_bridge) {
 		return -ENOMEM;
 	}
 
 	ptn_bridge->client = client;
-	ptn_bridge->encoder = encoder;
-	ptn_bridge->gpio_pd_n = of_get_named_gpio(node, "powerdown-gpio", 0);
+	ptn_bridge->gpio_pd_n = of_get_named_gpio(dev->of_node,
+							"powerdown-gpio", 0);
 	if (gpio_is_valid(ptn_bridge->gpio_pd_n)) {
 		ret = gpio_request_one(ptn_bridge->gpio_pd_n,
 				GPIOF_OUT_INIT_HIGH, "PTN3460_PD_N");
 		if (ret) {
-			dev_err(&client->dev,
-				"Request powerdown-gpio failed (%d)\n", ret);
+			dev_err(dev, "Request powerdown-gpio failed (%d)\n",
+									ret);
 			return ret;
 		}
 	}
 
-	ptn_bridge->gpio_rst_n = of_get_named_gpio(node, "reset-gpio", 0);
+	ptn_bridge->gpio_rst_n = of_get_named_gpio(dev->of_node,
+							"reset-gpio", 0);
 	if (gpio_is_valid(ptn_bridge->gpio_rst_n)) {
 		/*
 		 * Request the reset pin low to avoid the bridge being
@@ -299,42 +321,30 @@ int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
 		ret = gpio_request_one(ptn_bridge->gpio_rst_n,
 				GPIOF_OUT_INIT_LOW, "PTN3460_RST_N");
 		if (ret) {
-			dev_err(&client->dev,
-				"Request reset-gpio failed (%d)\n", ret);
+			dev_err(dev, "Request reset-gpio failed (%d)\n", ret);
 			gpio_free(ptn_bridge->gpio_pd_n);
 			return ret;
 		}
 	}
 
-	ret = of_property_read_u32(node, "edid-emulation",
+	ret = of_property_read_u32(dev->of_node, "edid-emulation",
 			&ptn_bridge->edid_emulation);
 	if (ret) {
-		dev_err(&client->dev, "Can't read EDID emulation value\n");
+		dev_err(dev, "Can't read EDID emulation value\n");
 		goto err;
 	}
 
+	ptn_bridge->bridge.dev = dev;
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
-	ret = drm_bridge_init(dev, &ptn_bridge->bridge);
+	ret = drm_bridge_add(&ptn_bridge->bridge);
 	if (ret) {
-		DRM_ERROR("Failed to initialize bridge with drm\n");
+		DRM_ERROR("Failed to add bridge\n");
 		goto err;
 	}
 
-	encoder->bridge = &ptn_bridge->bridge;
-
-	ret = drm_connector_init(dev, &ptn_bridge->connector,
-			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		goto err;
-	}
-	drm_connector_helper_add(&ptn_bridge->connector,
-			&ptn3460_connector_helper_funcs);
-	drm_connector_register(&ptn_bridge->connector);
-	drm_mode_connector_attach_encoder(&ptn_bridge->connector, encoder);
+	i2c_set_clientdata(client, ptn_bridge);
 
 	return 0;
-
 err:
 	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
 		gpio_free(ptn_bridge->gpio_pd_n);
@@ -342,4 +352,40 @@ err:
 		gpio_free(ptn_bridge->gpio_rst_n);
 	return ret;
 }
-EXPORT_SYMBOL(ptn3460_init);
+
+static int ptn3460_remove(struct i2c_client *client)
+{
+	struct ptn3460_bridge *ptn_bridge = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&ptn_bridge->bridge);
+
+	return 0;
+}
+
+static const struct i2c_device_id ptn3460_i2c_table[] = {
+	{"nxp,ptn3460", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ptn3460_i2c_table);
+
+static const struct of_device_id ptn3460_match[] = {
+	{ .compatible = "nxp,ptn3460" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ptn3460_match);
+
+static struct i2c_driver ptn3460_driver = {
+	.id_table	= ptn3460_i2c_table,
+	.probe		= ptn3460_probe,
+	.remove		= ptn3460_remove,
+	.driver		= {
+		.name	= "nxp,ptn3460",
+		.owner	= THIS_MODULE,
+		.of_match_table = ptn3460_match,
+	},
+};
+module_i2c_driver(ptn3460_driver);
+
+MODULE_AUTHOR("Sean Paul <seanpaul@chromium.org>");
+MODULE_DESCRIPTION("NXP ptn3460 eDP-LVDS converter driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 7f9f6f9..4c0e071 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -51,7 +51,7 @@ config DRM_EXYNOS_DSI
 
 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
-	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
+	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 4f3c7eb..61ce6e4 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -986,32 +986,10 @@ static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
 	.best_encoder = exynos_dp_best_encoder,
 };
 
-static bool find_bridge(const char *compat, struct bridge_init *bridge)
-{
-	bridge->client = NULL;
-	bridge->node = of_find_compatible_node(NULL, NULL, compat);
-	if (!bridge->node)
-		return false;
-
-	bridge->client = of_find_i2c_device_by_node(bridge->node);
-	if (!bridge->client)
-		return false;
-
-	return true;
-}
-
 /* returns the number of bridges attached */
 static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
 		struct drm_encoder *encoder)
 {
-	struct bridge_init bridge;
-	int ret;
-
-	if (find_bridge("nxp,ptn3460", &bridge)) {
-		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node);
-		if (!ret)
-			return 1;
-	}
 	return 0;
 }
 
-- 
1.7.9.5
