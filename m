From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 7/8] drm/bridge: Add i2c based driver for ptn3460 bridge
Date: Sat, 26 Jul 2014 00:52:09 +0530
Message-ID: <1406316130-4744-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44240 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760748AbaGYTZb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:25:31 -0400
In-reply-to: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Sean Paul <seanpaul@chromium.org>, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Sean Paul <seanpaul@chromium.org>

This patch adds ptn3460 as module_i2c_driver.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/video/bridge/ptn3460.txt   |   27 ++
 drivers/gpu/drm/bridge/Kconfig                     |   10 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/ptn3460.c                   |  405 ++++++++++++++++++++
 4 files changed, 444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/ptn3460.txt
 create mode 100644 drivers/gpu/drm/bridge/ptn3460.c

diff --git a/Documentation/devicetree/bindings/video/bridge/ptn3460.txt b/Documentation/devicetree/bindings/video/bridge/ptn3460.txt
new file mode 100644
index 0000000..03366c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/ptn3460.txt
@@ -0,0 +1,27 @@
+ptn3460 bridge bindings
+
+Required properties:
+	- compatible: "nxp,ptn3460"
+	- reg: i2c address of the bridge
+	- powerdown-gpios: OF device-tree gpio specification
+	- reset-gpios: OF device-tree gpio specification
+	- edid-emulation: The EDID emulation entry to use
+		+-------+------------+------------------+
+		| Value | Resolution | Description      |
+		|   0   |  1024x768  | NXP Generic      |
+		|   1   |  1920x1080 | NXP Generic      |
+		|   2   |  1920x1080 | NXP Generic      |
+		|   3   |  1600x900  | Samsung LTM200KT |
+		|   4   |  1920x1080 | Samsung LTM230HT |
+		|   5   |  1366x768  | NXP Generic      |
+		|   6   |  1600x900  | ChiMei M215HGE   |
+		+-------+------------+------------------+
+
+Example:
+	lvds-bridge@20 {
+		compatible = "nxp,ptn3460";
+		reg = <0x20>;
+		powerdown-gpios = <&gpy2 5 1 0 0>;
+		reset-gpios = <&gpx1 5 1 0 0>;
+		edid-emulation = <5>;
+	};
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 1e2f96c..0b12d16 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -6,4 +6,14 @@ config DRM_BRIDGE
 
 menu "bridge chips"
 	depends on DRM_BRIDGE
+
+config DRM_PTN3460
+	tristate "NXP ptn3460 eDP/LVDS bridge"
+	depends on DRM && DRM_BRIDGE
+	depends on OF
+	depends on I2C
+	select DRM_PANEL
+	help
+	  ptn3460 eDP-LVDS bridge chip driver.
+
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index be16eca..b4733e1 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1 +1,3 @@
 ccflags-y := -Iinclude/drm
+
+obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
new file mode 100644
index 0000000..f41302a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ptn3460.c
@@ -0,0 +1,405 @@
+/*
+ * NXP PTN3460 DP/LVDS bridge driver
+ *
+ * Copyright (C) 2013 Google, Inc.
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
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+#include <drm/drm_panel.h>
+
+#include "drmP.h"
+#include "drm_edid.h"
+#include "drm_crtc.h"
+#include "drm_crtc_helper.h"
+
+#define PTN3460_EDID_ADDR			0x0
+#define PTN3460_EDID_EMULATION_ADDR		0x84
+#define PTN3460_EDID_ENABLE_EMULATION		0
+#define PTN3460_EDID_EMULATION_SELECTION	1
+#define PTN3460_EDID_SRAM_LOAD_ADDR		0x85
+
+struct ptn3460_bridge {
+	struct drm_connector connector;
+	struct i2c_client *client;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	struct edid *edid;
+	struct gpio_desc *gpio_pd_n;
+	struct gpio_desc *gpio_rst_n;
+	u32 edid_emulation;
+	bool enabled;
+};
+
+static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
+		u8 *buf, int len)
+{
+	int ret;
+
+	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
+	if (ret <= 0) {
+		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
+		return ret;
+	}
+
+	ret = i2c_master_recv(ptn_bridge->client, buf, len);
+	if (ret <= 0) {
+		DRM_ERROR("Failed to recv i2c data, ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char addr,
+		char val)
+{
+	int ret;
+	char buf[2];
+
+	buf[0] = addr;
+	buf[1] = val;
+
+	ret = i2c_master_send(ptn_bridge->client, buf, ARRAY_SIZE(buf));
+	if (ret <= 0) {
+		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ptn3460_select_edid(struct ptn3460_bridge *ptn_bridge)
+{
+	int ret;
+	char val;
+
+	/* Load the selected edid into SRAM (accessed at PTN3460_EDID_ADDR) */
+	ret = ptn3460_write_byte(ptn_bridge, PTN3460_EDID_SRAM_LOAD_ADDR,
+			ptn_bridge->edid_emulation);
+	if (ret) {
+		DRM_ERROR("Failed to transfer edid to sram, ret=%d\n", ret);
+		return ret;
+	}
+
+	/* Enable EDID emulation and select the desired EDID */
+	val = 1 << PTN3460_EDID_ENABLE_EMULATION |
+		ptn_bridge->edid_emulation << PTN3460_EDID_EMULATION_SELECTION;
+
+	ret = ptn3460_write_byte(ptn_bridge, PTN3460_EDID_EMULATION_ADDR, val);
+	if (ret) {
+		DRM_ERROR("Failed to write edid value, ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ptn3460_pre_enable(struct drm_bridge *bridge)
+{
+	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
+	int ret;
+
+	if (ptn_bridge->enabled)
+		return;
+
+	gpiod_set_value(ptn_bridge->gpio_pd_n, 1);
+
+	gpiod_set_value(ptn_bridge->gpio_rst_n, 0);
+	udelay(10);
+	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
+
+	drm_panel_prepare(ptn_bridge->panel);
+
+	/*
+	 * There's a bug in the PTN chip where it falsely asserts hotplug before
+	 * it is fully functional. We're forced to wait for the maximum start up
+	 * time specified in the chip's datasheet to make sure we're really up.
+	 */
+	msleep(90);
+
+	ret = ptn3460_select_edid(ptn_bridge);
+	if (ret)
+		DRM_ERROR("Select edid failed ret=%d\n", ret);
+
+	ptn_bridge->enabled = true;
+}
+
+static void ptn3460_enable(struct drm_bridge *bridge)
+{
+	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
+
+	drm_panel_enable(ptn_bridge->panel);
+}
+
+static void ptn3460_disable(struct drm_bridge *bridge)
+{
+	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
+
+	if (!ptn_bridge->enabled)
+		return;
+
+	ptn_bridge->enabled = false;
+
+	drm_panel_disable(ptn_bridge->panel);
+
+	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
+	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
+}
+
+static void ptn3460_post_disable(struct drm_bridge *bridge)
+{
+	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
+
+	drm_panel_unprepare(ptn_bridge->panel);
+}
+
+void ptn3460_bridge_destroy(struct drm_bridge *bridge)
+{
+	drm_bridge_cleanup(bridge);
+}
+
+int ptn3460_get_modes(struct drm_connector *connector)
+{
+	struct ptn3460_bridge *ptn_bridge;
+	u8 *edid;
+	int ret, num_modes;
+	bool power_off;
+
+	ptn_bridge = container_of(connector, struct ptn3460_bridge, connector);
+
+	if (ptn_bridge->edid)
+		return drm_add_edid_modes(connector, ptn_bridge->edid);
+
+	power_off = !ptn_bridge->enabled;
+	ptn3460_pre_enable(ptn_bridge->bridge);
+
+	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	if (!edid) {
+		DRM_ERROR("Failed to allocate edid\n");
+		return 0;
+	}
+
+	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
+			EDID_LENGTH);
+	if (ret) {
+		kfree(edid);
+		num_modes = 0;
+		goto out;
+	}
+
+	ptn_bridge->edid = (struct edid *)edid;
+	drm_mode_connector_update_edid_property(connector, ptn_bridge->edid);
+
+	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
+
+out:
+	if (power_off)
+		ptn3460_disable(ptn_bridge->bridge);
+
+	return num_modes;
+}
+
+struct drm_encoder *ptn3460_best_encoder(struct drm_connector *connector)
+{
+	struct ptn3460_bridge *ptn_bridge;
+
+	ptn_bridge = container_of(connector, struct ptn3460_bridge, connector);
+
+	return ptn_bridge->bridge->encoder;
+}
+
+struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
+	.get_modes = ptn3460_get_modes,
+	.best_encoder = ptn3460_best_encoder,
+};
+
+enum drm_connector_status ptn3460_detect(struct drm_connector *connector,
+		bool force)
+{
+	return connector_status_connected;
+}
+
+void ptn3460_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_cleanup(connector);
+}
+
+struct drm_connector_funcs ptn3460_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = ptn3460_detect,
+	.destroy = ptn3460_connector_destroy,
+};
+
+int ptn3460_post_encoder_init(struct drm_bridge *bridge)
+{
+	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
+	int ret;
+
+	/* bridge is attached to encoder.
+	 * safe to remove it from the bridge_lookup table.
+	 */
+	drm_bridge_remove_from_lookup(bridge);
+
+	ret = drm_bridge_init(bridge->drm_dev, bridge);
+	if (ret) {
+		DRM_ERROR("Failed to initialize bridge with drm\n");
+		return ret;
+	}
+
+	/* connector implementation */
+	ptn_bridge->connector.polled = bridge->connector_polled;
+
+	ret = drm_connector_init(bridge->drm_dev, &ptn_bridge->connector,
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
+	if (ptn_bridge->panel)
+		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
+
+	return ret;
+}
+
+struct drm_bridge_funcs ptn3460_bridge_funcs = {
+	.post_encoder_init = ptn3460_post_encoder_init,
+	.pre_enable = ptn3460_pre_enable,
+	.enable = ptn3460_enable,
+	.disable = ptn3460_disable,
+	.post_disable = ptn3460_post_disable,
+	.destroy = ptn3460_bridge_destroy,
+};
+
+static int ptn3460_probe(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct device *dev = &(client->dev);
+	struct device_node *panel_node;
+	struct drm_bridge *bridge;
+	struct ptn3460_bridge *ptn_bridge;
+	int ret;
+
+	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
+	if (!bridge) {
+		DRM_ERROR("Failed to allocate drm bridge\n");
+		return -ENOMEM;
+	}
+
+	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
+	if (!ptn_bridge) {
+		DRM_ERROR("Failed to allocate ptn bridge\n");
+		return -ENOMEM;
+	}
+
+	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
+	if (panel_node) {
+		ptn_bridge->panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (!ptn_bridge->panel)
+			return -EPROBE_DEFER;
+	}
+
+	bridge->dev = dev;
+	bridge->driver_private = ptn_bridge;
+	bridge->funcs = &ptn3460_bridge_funcs;
+
+	ptn_bridge->client = client;
+	ptn_bridge->bridge = bridge;
+
+	ptn_bridge->gpio_pd_n = devm_gpiod_get(&client->dev, "powerdown");
+	if (IS_ERR(ptn_bridge->gpio_pd_n)) {
+		ret = PTR_ERR(ptn_bridge->gpio_pd_n);
+		DRM_ERROR("cannot get gpio_pd_n %d\n", ret);
+		return ret;
+	} else {
+		ret = gpiod_direction_output(ptn_bridge->gpio_pd_n, 1);
+		if (ret) {
+			DRM_ERROR("cannot configure gpio_pd_n\n");
+			return ret;
+		}
+	}
+
+	ptn_bridge->gpio_rst_n = devm_gpiod_get(&client->dev, "reset");
+	if (IS_ERR(ptn_bridge->gpio_rst_n)) {
+		ret = PTR_ERR(ptn_bridge->gpio_rst_n);
+		DRM_ERROR("cannot get gpio_rst_n %d\n", ret);
+		return ret;
+	} else {
+		/*
+		 * Request the reset pin low to avoid the bridge being
+		 * initialized prematurely
+		 */
+		ret = gpiod_direction_output(ptn_bridge->gpio_rst_n, 0);
+		if (ret) {
+			DRM_ERROR("cannot configure gpio_pd_n\n");
+			return ret;
+		}
+	}
+
+	ret = of_property_read_u32(dev->of_node, "edid-emulation",
+			&ptn_bridge->edid_emulation);
+	if (ret) {
+		DRM_ERROR("Can't read edid emulation value\n");
+		return -ENODEV;
+	}
+
+	i2c_set_clientdata(client, ptn_bridge);
+
+	drm_bridge_add_for_lookup(bridge);
+
+	return 0;
+}
+
+static int ptn3460_remove(struct i2c_client *client)
+{
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
+struct i2c_driver ptn3460_driver = {
+	.id_table	= ptn3460_i2c_table,
+	.probe		= ptn3460_probe,
+	.remove		= ptn3460_remove,
+	.driver		= {
+		.name	= "nxp,ptn3460",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(ptn3460_match),
+	},
+};
+module_i2c_driver(ptn3460_driver);
+
+MODULE_AUTHOR("Sean Paul <seanpaul@chromium.org>");
+MODULE_DESCRIPTION("NXP ptn3460 eDP-LVDS converter driver");
+MODULE_LICENSE("GPL");
-- 
1.7.9.5
