From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V7 08/12] drm/bridge: ptn3460: use gpiod interface
Date: Wed, 27 Aug 2014 19:59:42 +0530
Message-ID: <1409149783-12416-9-git-send-email-ajaykumar.rs@samsung.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26035 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933698AbaH0OlL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:41:11 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY00701ZGM1640@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 23:41:10 +0900 (KST)
In-reply-to: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Modify driver to support gpiod interface.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/ptn3460.c |   88 ++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
index 1bb4d2b..6f28c13 100644
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -41,8 +41,8 @@ struct ptn3460_bridge {
 	struct drm_bridge bridge;
 	struct edid *edid;
 	struct drm_panel *panel;
-	int gpio_pd_n;
-	int gpio_rst_n;
+	struct gpio_desc *gpio_pd_n;
+	struct gpio_desc *gpio_rst_n;
 	u32 edid_emulation;
 	bool enabled;
 };
@@ -131,14 +131,11 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 	if (ptn_bridge->enabled)
 		return;
 
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_set_value(ptn_bridge->gpio_pd_n, 1);
+	gpiod_set_value(ptn_bridge->gpio_pd_n, 1);
 
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n)) {
-		gpio_set_value(ptn_bridge->gpio_rst_n, 0);
-		usleep_range(10, 20);
-		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
-	}
+	gpiod_set_value(ptn_bridge->gpio_rst_n, 0);
+	usleep_range(10, 20);
+	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
 
 	if (drm_panel_prepare(ptn_bridge->panel)) {
 		DRM_ERROR("failed to prepare panel\n");
@@ -183,11 +180,8 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 		return;
 	}
 
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
-		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
-
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_set_value(ptn_bridge->gpio_pd_n, 0);
+	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
+	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
 }
 
 static void ptn3460_post_disable(struct drm_bridge *bridge)
@@ -202,13 +196,7 @@ static void ptn3460_post_disable(struct drm_bridge *bridge)
 
 static void ptn3460_bridge_destroy(struct drm_bridge *bridge)
 {
-	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
-
 	drm_bridge_cleanup(bridge);
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_free(ptn_bridge->gpio_pd_n);
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
-		gpio_free(ptn_bridge->gpio_rst_n);
 	/* Nothing else to free, we've got devm allocated memory */
 }
 
@@ -339,39 +327,41 @@ static int ptn3460_probe(struct i2c_client *client,
 	}
 
 	ptn_bridge->client = client;
-	ptn_bridge->gpio_pd_n = of_get_named_gpio(dev->of_node,
-							"powerdown-gpio", 0);
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n)) {
-		ret = gpio_request_one(ptn_bridge->gpio_pd_n,
-				GPIOF_OUT_INIT_HIGH, "PTN3460_PD_N");
-		if (ret) {
-			dev_err(dev, "Request powerdown-gpio failed (%d)\n",
-									ret);
-			return ret;
-		}
+
+	ptn_bridge->gpio_pd_n = devm_gpiod_get(&client->dev, "powerdown");
+	if (IS_ERR(ptn_bridge->gpio_pd_n)) {
+		ret = PTR_ERR(ptn_bridge->gpio_pd_n);
+		dev_err(dev, "cannot get gpio_pd_n %d\n", ret);
+		return ret;
 	}
 
-	ptn_bridge->gpio_rst_n = of_get_named_gpio(dev->of_node,
-							"reset-gpio", 0);
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n)) {
-		/*
-		 * Request the reset pin low to avoid the bridge being
-		 * initialized prematurely
-		 */
-		ret = gpio_request_one(ptn_bridge->gpio_rst_n,
-				GPIOF_OUT_INIT_LOW, "PTN3460_RST_N");
-		if (ret) {
-			dev_err(dev, "Request reset-gpio failed (%d)\n", ret);
-			gpio_free(ptn_bridge->gpio_pd_n);
-			return ret;
-		}
+	ret = gpiod_direction_output(ptn_bridge->gpio_pd_n, 1);
+	if (ret) {
+		DRM_ERROR("cannot configure gpio_pd_n\n");
+		return ret;
+	}
+
+	ptn_bridge->gpio_rst_n = devm_gpiod_get(&client->dev, "reset");
+	if (IS_ERR(ptn_bridge->gpio_rst_n)) {
+		ret = PTR_ERR(ptn_bridge->gpio_rst_n);
+		DRM_ERROR("cannot get gpio_rst_n %d\n", ret);
+		return ret;
+	}
+	/*
+	 * Request the reset pin low to avoid the bridge being
+	 * initialized prematurely
+	 */
+	ret = gpiod_direction_output(ptn_bridge->gpio_rst_n, 0);
+	if (ret) {
+		DRM_ERROR("cannot configure gpio_rst_n\n");
+		return ret;
 	}
 
 	ret = of_property_read_u32(dev->of_node, "edid-emulation",
 			&ptn_bridge->edid_emulation);
 	if (ret) {
 		dev_err(dev, "Can't read EDID emulation value\n");
-		goto err;
+		return ret;
 	}
 
 	ptn_bridge->bridge.dev = dev;
@@ -379,18 +369,12 @@ static int ptn3460_probe(struct i2c_client *client,
 	ret = drm_bridge_add(&ptn_bridge->bridge);
 	if (ret) {
 		DRM_ERROR("Failed to add bridge\n");
-		goto err;
+		return ret;
 	}
 
 	i2c_set_clientdata(client, ptn_bridge);
 
 	return 0;
-err:
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_free(ptn_bridge->gpio_pd_n);
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
-		gpio_free(ptn_bridge->gpio_rst_n);
-	return ret;
 }
 
 static int ptn3460_remove(struct i2c_client *client)
-- 
1.7.9.5
