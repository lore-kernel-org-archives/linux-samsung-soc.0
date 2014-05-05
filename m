From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC V2 2/3] drm/bridge: add a dummy panel driver to support lvds
 bridges
Date: Tue, 06 May 2014 01:22:27 +0530
Message-ID: <1399319548-16567-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1399319548-16567-1-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: joshi@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

implement basic panel controls as a drm_bridge so that
the existing bridges can make use of it.

The driver assumes that it is the last entity in the bridge chain.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../bindings/drm/bridge/bridge_panel.txt           |  45 ++++
 drivers/gpu/drm/bridge/Kconfig                     |   6 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/bridge_panel.c              | 240 +++++++++++++++++++++
 include/drm/bridge/bridge_panel.h                  |  37 ++++
 5 files changed, 329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
 create mode 100644 drivers/gpu/drm/bridge/bridge_panel.c
 create mode 100644 include/drm/bridge/bridge_panel.h

diff --git a/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
new file mode 100644
index 0000000..0f916b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
@@ -0,0 +1,45 @@
+Simple panel interface for chaining along with bridges
+
+Required properties:
+  - compatible: "drm-bridge,panel"
+
+Optional properties:
+	-lcd-en-gpio:
+		eDP panel LCD poweron GPIO.
+			Indicates which GPIO needs to be powered up as output
+			to powerup/enable the switch to the LCD panel.
+	-led-en-gpio:
+		eDP panel LED enable GPIO.
+			Indicates which GPIO needs to be powered up as output
+			to enable the backlight.
+	-panel-pre-enable-delay:
+		delay value in ms required for panel_pre_enable process
+			Delay in ms needed for the eDP panel LCD unit to
+			powerup, and delay needed between panel_VCC and
+			video_enable.
+	-panel-enable-delay:
+		delay value in ms required for panel_enable process
+			Delay in ms needed for the eDP panel backlight/LED unit
+			to powerup, and delay needed between video_enable and
+			BL_EN.
+	-panel-disable-delay:
+		delay value in ms required for panel_disable process
+			Delay in ms needed for the eDP panel backlight/LED unit
+			powerdown, and delay needed between BL_DISABLE and
+			video_disable.
+	-panel-post-disable-delay:
+		delay value in ms required for panel_post_disable process
+			Delay in ms needed for the eDP panel LCD unit to
+			to powerdown, and delay between video_disable and
+			panel_VCC going down.
+
+Example:
+
+	bridge-panel {
+		compatible = "drm-bridge,panel";
+		led-en-gpio = <&gpx3 0 1>;
+		panel-pre-enable-delay = <40>;
+		panel-enable-delay = <20>;
+		panel-disable-delay = <20>;
+		panel-post-disable-delay = <30>;
+	};
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 884923f..654c5ea 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -3,3 +3,9 @@ config DRM_PTN3460
 	depends on DRM
 	select DRM_KMS_HELPER
 	---help---
+
+config DRM_BRIDGE_PANEL
+	tristate "dummy bridge panel"
+	depends on DRM
+	select DRM_KMS_HELPER
+	---help---
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index b4733e1..bf433cf 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,3 +1,4 @@
 ccflags-y := -Iinclude/drm
 
 obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
+obj-$(CONFIG_DRM_BRIDGE_PANEL) += bridge_panel.o
diff --git a/drivers/gpu/drm/bridge/bridge_panel.c b/drivers/gpu/drm/bridge/bridge_panel.c
new file mode 100644
index 0000000..807118a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/bridge_panel.c
@@ -0,0 +1,240 @@
+/*
+ * Copyright (C) 2014 Samsung Electronics Co., Ltd.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+#include <linux/regulator/consumer.h>
+
+#include "drmP.h"
+
+#include "bridge/bridge_panel.h"
+
+enum panel_state {
+	PRE_ENABLE,
+	ENABLE,
+	DISABLE,
+	POST_DISABLE,
+};
+
+struct bridge_panel {
+	struct drm_connector	connector;
+	struct i2c_client	*client;
+	struct drm_encoder	*encoder;
+	struct drm_bridge	*bridge;
+	struct regulator	*backlight_fet;
+	struct regulator	*lcd_fet;
+	int			led_en_gpio;
+	int			lcd_en_gpio;
+	int			panel_pre_enable_delay;
+	int			panel_enable_delay;
+	int			panel_disable_delay;
+	int			panel_post_disable_delay;
+	enum panel_state	panel_state;
+};
+
+static void bridge_panel_pre_enable(struct drm_bridge *bridge)
+{
+	struct bridge_panel *panel = bridge->driver_private;
+
+	if (panel->panel_state != POST_DISABLE) {
+		DRM_ERROR("invoking bridge_panel_pre_enable " \
+					"from an improper state\n");
+		return;
+	}
+
+	if (!IS_ERR_OR_NULL(panel->lcd_fet))
+		if (regulator_enable(panel->lcd_fet))
+			DRM_ERROR("Failed to enable LCD fet\n");
+
+	if (gpio_is_valid(panel->lcd_en_gpio))
+		gpio_set_value(panel->lcd_en_gpio, 1);
+
+	msleep(panel->panel_pre_enable_delay);
+
+	panel->panel_state = PRE_ENABLE;
+}
+
+static void bridge_panel_enable(struct drm_bridge *bridge)
+{
+	struct bridge_panel *panel = bridge->driver_private;
+
+	if (panel->panel_state != PRE_ENABLE) {
+		DRM_ERROR("invoking bridge_panel_enable " \
+					"from an improper state\n");
+		return;
+	}
+
+	if (!IS_ERR_OR_NULL(panel->backlight_fet))
+		if (regulator_enable(panel->backlight_fet))
+				DRM_ERROR("Failed to enable LED fet\n");
+
+	msleep(panel->panel_enable_delay);
+
+	if (gpio_is_valid(panel->led_en_gpio))
+		gpio_set_value(panel->led_en_gpio, 1);
+
+	panel->panel_state = ENABLE;
+
+}
+
+static void bridge_panel_disable(struct drm_bridge *bridge)
+{
+	struct bridge_panel *panel = bridge->driver_private;
+
+	if (panel->panel_state != ENABLE) {
+		DRM_ERROR("invoking bridge_panel_disable " \
+					"from an improper state\n");
+		return;
+	}
+
+	if (gpio_is_valid(panel->led_en_gpio))
+		gpio_set_value(panel->led_en_gpio, 0);
+
+	if (!IS_ERR_OR_NULL(panel->backlight_fet))
+		regulator_disable(panel->backlight_fet);
+
+	msleep(panel->panel_disable_delay);
+
+	panel->panel_state = DISABLE;
+}
+
+static void bridge_panel_post_disable(struct drm_bridge *bridge)
+{
+	struct bridge_panel *panel = bridge->driver_private;
+
+	if (panel->panel_state != DISABLE) {
+		DRM_ERROR("invoking bridge_panel_post_disable " \
+					"from an improper state\n");
+		return;
+	}
+
+	if (gpio_is_valid(panel->lcd_en_gpio))
+		gpio_set_value(panel->lcd_en_gpio, 0);
+
+	if (!IS_ERR_OR_NULL(panel->lcd_fet))
+		regulator_disable(panel->lcd_fet);
+
+	msleep(panel->panel_post_disable_delay);
+
+	panel->panel_state = POST_DISABLE;
+}
+
+void bridge_panel_destroy(struct drm_bridge *bridge)
+{
+	struct bridge_panel *panel = bridge->driver_private;
+
+	drm_bridge_cleanup(bridge);
+
+	if (gpio_is_valid(panel->lcd_en_gpio))
+		gpio_free(panel->lcd_en_gpio);
+	if (gpio_is_valid(panel->led_en_gpio))
+		gpio_free(panel->led_en_gpio);
+	/* Nothing else to free, we've got devm allocated memory */
+}
+
+struct drm_bridge_funcs bridge_panel_funcs = {
+	.pre_enable = bridge_panel_pre_enable,
+	.enable = bridge_panel_enable,
+	.disable = bridge_panel_disable,
+	.post_disable = bridge_panel_post_disable,
+	.destroy = bridge_panel_destroy,
+};
+
+int bridge_panel_init(struct drm_device *dev, struct drm_encoder *encoder,
+		struct i2c_client *client, struct device_node *node)
+{
+	int ret;
+	struct drm_bridge *bridge;
+	struct bridge_panel *panel;
+
+	bridge = devm_kzalloc(dev->dev, sizeof(*bridge), GFP_KERNEL);
+	if (!bridge) {
+		DRM_ERROR("Failed to allocate drm bridge\n");
+		return -ENOMEM;
+	}
+
+	panel = devm_kzalloc(dev->dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel) {
+		DRM_ERROR("Failed to allocate bridge panel\n");
+		return -ENOMEM;
+	}
+
+	panel->client = client;
+	panel->encoder = encoder;
+	panel->bridge = bridge;
+
+	panel->panel_state = POST_DISABLE;
+
+	panel->lcd_en_gpio = of_get_named_gpio(node, "lcd-en-gpio", 0);
+	panel->lcd_en_gpio = of_get_named_gpio(node, "led-en-gpio", 0);
+
+	of_property_read_u32(node, "panel-pre-enable-delay",
+					&panel->panel_pre_enable_delay);
+	of_property_read_u32(node, "panel-enable-delay",
+					&panel->panel_enable_delay);
+	of_property_read_u32(node, "panel-disable-delay",
+					&panel->panel_disable_delay);
+	of_property_read_u32(node, "panel-post-disable-delay",
+					&panel->panel_post_disable_delay);
+
+	panel->lcd_fet = devm_regulator_get(dev->dev, "lcd_vdd");
+	if (IS_ERR(panel->lcd_fet))
+		return PTR_ERR(panel->lcd_fet);
+
+	panel->backlight_fet = devm_regulator_get(dev->dev, "vcd_led");
+	if (IS_ERR(panel->backlight_fet))
+		return PTR_ERR(panel->backlight_fet);
+
+	if (gpio_is_valid(panel->lcd_en_gpio)) {
+		ret = devm_gpio_request_one(dev->dev, panel->lcd_en_gpio,
+					GPIOF_OUT_INIT_LOW, "lcd_en_gpio");
+		if (ret) {
+			DRM_ERROR("failed to get lcd-en gpio [%d]\n", ret);
+			return ret;
+		}
+	} else {
+		panel->lcd_en_gpio = -ENODEV;
+	}
+
+	if (gpio_is_valid(panel->led_en_gpio)) {
+		ret = devm_gpio_request_one(dev->dev, panel->led_en_gpio,
+					GPIOF_OUT_INIT_LOW, "led_en_gpio");
+		if (ret) {
+			DRM_ERROR("failed to get led-en gpio [%d]\n", ret);
+			return ret;
+		}
+	} else {
+		panel->led_en_gpio = -ENODEV;
+	}
+
+	ret = drm_bridge_init(dev, bridge, encoder, &bridge_panel_funcs);
+	if (ret) {
+		DRM_ERROR("Failed to initialize bridge with drm\n");
+		goto err;
+	}
+
+	bridge->driver_private = panel;
+
+	return 0;
+
+err:
+	if (gpio_is_valid(panel->lcd_en_gpio))
+		gpio_free(panel->lcd_en_gpio);
+	if (gpio_is_valid(panel->led_en_gpio))
+		gpio_free(panel->led_en_gpio);
+	return ret;
+}
+EXPORT_SYMBOL(bridge_panel_init);
diff --git a/include/drm/bridge/bridge_panel.h b/include/drm/bridge/bridge_panel.h
new file mode 100644
index 0000000..4a1b218
--- /dev/null
+++ b/include/drm/bridge/bridge_panel.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright (C) 2014 Samsung Electronics Co., Ltd.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DRM_BRIDGE_PANEL_H_
+#define _DRM_BRIDGE_PANEL_H_
+
+struct drm_device;
+struct drm_encoder;
+struct i2c_client;
+struct device_node;
+
+#if defined(CONFIG_DRM_BRIDGE_PANEL)
+
+int bridge_panel_init(struct drm_device *dev, struct drm_encoder *encoder,
+			struct i2c_client *client, struct device_node *node);
+#else
+
+static inline int bridge_panel_init(struct drm_device *dev,
+		struct drm_encoder *encoder, struct i2c_client *client,
+		struct device_node *node)
+{
+	return 0;
+}
+
+#endif
+
+#endif
-- 
1.8.1.2
