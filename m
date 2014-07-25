From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support driver
 model
Date: Sat, 26 Jul 2014 00:52:08 +0530
Message-ID: <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48602 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759679AbaGYTZ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:25:28 -0400
In-reply-to: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This patch tries to seperate drm_bridge implementation
into 2 parts, a drm part and a non_drm part.

A set of helper functions are defined in this patch to make
bridge driver probe independent of the drm flow.

The bridge devices register themselves on a lookup table
when they get probed by calling "drm_bridge_add_for_lookup".

The parent encoder driver waits till the bridge is available in the
lookup table(by calling "of_drm_find_bridge") and then continues with
its initialization.

The encoder driver should call "drm_bridge_attach_encoder" to pass on
the drm_device and the encoder pointers to the bridge object.

Now that the drm_device pointer is available, the encoder then calls
"bridge->funcs->post_encoder_init" to allow the bridge to continue
registering itself with the drm core.

Also, non driver model based ptn3460 driver is removed in this patch.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/drm/bridge/ptn3460.txt     |   27 --
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/bridge/Kconfig                     |   12 +-
 drivers/gpu/drm/bridge/Makefile                    |    2 -
 drivers/gpu/drm/bridge/ptn3460.c                   |  343 --------------------
 drivers/gpu/drm/drm_bridge.c                       |   89 +++++
 drivers/gpu/drm/drm_crtc.c                         |    9 +-
 drivers/gpu/drm/exynos/Kconfig                     |    3 +-
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   57 ++--
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |    3 +-
 include/drm/bridge/ptn3460.h                       |   37 ---
 include/drm/drm_crtc.h                             |   16 +-
 13 files changed, 147 insertions(+), 453 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
 delete mode 100644 drivers/gpu/drm/bridge/ptn3460.c
 create mode 100644 drivers/gpu/drm/drm_bridge.c
 delete mode 100644 include/drm/bridge/ptn3460.h

diff --git a/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt b/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
deleted file mode 100644
index 52b93b2..0000000
--- a/Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-ptn3460 bridge bindings
-
-Required properties:
-	- compatible: "nxp,ptn3460"
-	- reg: i2c address of the bridge
-	- powerdown-gpio: OF device-tree gpio specification
-	- reset-gpio: OF device-tree gpio specification
-	- edid-emulation: The EDID emulation entry to use
-		+-------+------------+------------------+
-		| Value | Resolution | Description      |
-		|   0   |  1024x768  | NXP Generic      |
-		|   1   |  1920x1080 | NXP Generic      |
-		|   2   |  1920x1080 | NXP Generic      |
-		|   3   |  1600x900  | Samsung LTM200KT |
-		|   4   |  1920x1080 | Samsung LTM230HT |
-		|   5   |  1366x768  | NXP Generic      |
-		|   6   |  1600x900  | ChiMei M215HGE   |
-		+-------+------------+------------------+
-
-Example:
-	lvds-bridge@20 {
-		compatible = "nxp,ptn3460";
-		reg = <0x20>;
-		powerdown-gpio = <&gpy2 5 1 0 0>;
-		reset-gpio = <&gpx1 5 1 0 0>;
-		edid-emulation = <5>;
-	};
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index af9a609..14a8b45 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -20,6 +20,7 @@ drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
 drm-$(CONFIG_PCI) += ati_pcigart.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
+drm-$(CONFIG_DRM_BRIDGE) += drm_bridge.o
 
 drm-usb-y   := drm_usb.o
 
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 884923f..1e2f96c 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -1,5 +1,9 @@
-config DRM_PTN3460
-	tristate "PTN3460 DP/LVDS bridge"
+config DRM_BRIDGE
+	tristate
 	depends on DRM
-	select DRM_KMS_HELPER
-	---help---
+	help
+	  Bridge registration and lookup framework.
+
+menu "bridge chips"
+	depends on DRM_BRIDGE
+endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index b4733e1..be16eca 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,3 +1 @@
 ccflags-y := -Iinclude/drm
-
-obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridge/ptn3460.c
deleted file mode 100644
index d466696..0000000
--- a/drivers/gpu/drm/bridge/ptn3460.c
+++ /dev/null
@@ -1,343 +0,0 @@
-/*
- * NXP PTN3460 DP/LVDS bridge driver
- *
- * Copyright (C) 2013 Google, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/delay.h>
-
-#include "drmP.h"
-#include "drm_edid.h"
-#include "drm_crtc.h"
-#include "drm_crtc_helper.h"
-
-#include "bridge/ptn3460.h"
-
-#define PTN3460_EDID_ADDR			0x0
-#define PTN3460_EDID_EMULATION_ADDR		0x84
-#define PTN3460_EDID_ENABLE_EMULATION		0
-#define PTN3460_EDID_EMULATION_SELECTION	1
-#define PTN3460_EDID_SRAM_LOAD_ADDR		0x85
-
-struct ptn3460_bridge {
-	struct drm_connector connector;
-	struct i2c_client *client;
-	struct drm_encoder *encoder;
-	struct drm_bridge *bridge;
-	struct edid *edid;
-	int gpio_pd_n;
-	int gpio_rst_n;
-	u32 edid_emulation;
-	bool enabled;
-};
-
-static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
-		u8 *buf, int len)
-{
-	int ret;
-
-	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
-	if (ret <= 0) {
-		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret;
-	}
-
-	ret = i2c_master_recv(ptn_bridge->client, buf, len);
-	if (ret <= 0) {
-		DRM_ERROR("Failed to recv i2c data, ret=%d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char addr,
-		char val)
-{
-	int ret;
-	char buf[2];
-
-	buf[0] = addr;
-	buf[1] = val;
-
-	ret = i2c_master_send(ptn_bridge->client, buf, ARRAY_SIZE(buf));
-	if (ret <= 0) {
-		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ptn3460_select_edid(struct ptn3460_bridge *ptn_bridge)
-{
-	int ret;
-	char val;
-
-	/* Load the selected edid into SRAM (accessed at PTN3460_EDID_ADDR) */
-	ret = ptn3460_write_byte(ptn_bridge, PTN3460_EDID_SRAM_LOAD_ADDR,
-			ptn_bridge->edid_emulation);
-	if (ret) {
-		DRM_ERROR("Failed to transfer edid to sram, ret=%d\n", ret);
-		return ret;
-	}
-
-	/* Enable EDID emulation and select the desired EDID */
-	val = 1 << PTN3460_EDID_ENABLE_EMULATION |
-		ptn_bridge->edid_emulation << PTN3460_EDID_EMULATION_SELECTION;
-
-	ret = ptn3460_write_byte(ptn_bridge, PTN3460_EDID_EMULATION_ADDR, val);
-	if (ret) {
-		DRM_ERROR("Failed to write edid value, ret=%d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void ptn3460_pre_enable(struct drm_bridge *bridge)
-{
-	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
-	int ret;
-
-	if (ptn_bridge->enabled)
-		return;
-
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_set_value(ptn_bridge->gpio_pd_n, 1);
-
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n)) {
-		gpio_set_value(ptn_bridge->gpio_rst_n, 0);
-		udelay(10);
-		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
-	}
-
-	/*
-	 * There's a bug in the PTN chip where it falsely asserts hotplug before
-	 * it is fully functional. We're forced to wait for the maximum start up
-	 * time specified in the chip's datasheet to make sure we're really up.
-	 */
-	msleep(90);
-
-	ret = ptn3460_select_edid(ptn_bridge);
-	if (ret)
-		DRM_ERROR("Select edid failed ret=%d\n", ret);
-
-	ptn_bridge->enabled = true;
-}
-
-static void ptn3460_enable(struct drm_bridge *bridge)
-{
-}
-
-static void ptn3460_disable(struct drm_bridge *bridge)
-{
-	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
-
-	if (!ptn_bridge->enabled)
-		return;
-
-	ptn_bridge->enabled = false;
-
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
-		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
-
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_set_value(ptn_bridge->gpio_pd_n, 0);
-}
-
-static void ptn3460_post_disable(struct drm_bridge *bridge)
-{
-}
-
-void ptn3460_bridge_destroy(struct drm_bridge *bridge)
-{
-	struct ptn3460_bridge *ptn_bridge = bridge->driver_private;
-
-	drm_bridge_cleanup(bridge);
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_free(ptn_bridge->gpio_pd_n);
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
-		gpio_free(ptn_bridge->gpio_rst_n);
-	/* Nothing else to free, we've got devm allocated memory */
-}
-
-struct drm_bridge_funcs ptn3460_bridge_funcs = {
-	.pre_enable = ptn3460_pre_enable,
-	.enable = ptn3460_enable,
-	.disable = ptn3460_disable,
-	.post_disable = ptn3460_post_disable,
-	.destroy = ptn3460_bridge_destroy,
-};
-
-int ptn3460_get_modes(struct drm_connector *connector)
-{
-	struct ptn3460_bridge *ptn_bridge;
-	u8 *edid;
-	int ret, num_modes;
-	bool power_off;
-
-	ptn_bridge = container_of(connector, struct ptn3460_bridge, connector);
-
-	if (ptn_bridge->edid)
-		return drm_add_edid_modes(connector, ptn_bridge->edid);
-
-	power_off = !ptn_bridge->enabled;
-	ptn3460_pre_enable(ptn_bridge->bridge);
-
-	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-	if (!edid) {
-		DRM_ERROR("Failed to allocate edid\n");
-		return 0;
-	}
-
-	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
-			EDID_LENGTH);
-	if (ret) {
-		kfree(edid);
-		num_modes = 0;
-		goto out;
-	}
-
-	ptn_bridge->edid = (struct edid *)edid;
-	drm_mode_connector_update_edid_property(connector, ptn_bridge->edid);
-
-	num_modes = drm_add_edid_modes(connector, ptn_bridge->edid);
-
-out:
-	if (power_off)
-		ptn3460_disable(ptn_bridge->bridge);
-
-	return num_modes;
-}
-
-struct drm_encoder *ptn3460_best_encoder(struct drm_connector *connector)
-{
-	struct ptn3460_bridge *ptn_bridge;
-
-	ptn_bridge = container_of(connector, struct ptn3460_bridge, connector);
-
-	return ptn_bridge->encoder;
-}
-
-struct drm_connector_helper_funcs ptn3460_connector_helper_funcs = {
-	.get_modes = ptn3460_get_modes,
-	.best_encoder = ptn3460_best_encoder,
-};
-
-enum drm_connector_status ptn3460_detect(struct drm_connector *connector,
-		bool force)
-{
-	return connector_status_connected;
-}
-
-void ptn3460_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
-struct drm_connector_funcs ptn3460_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = ptn3460_detect,
-	.destroy = ptn3460_connector_destroy,
-};
-
-int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node)
-{
-	int ret;
-	struct drm_bridge *bridge;
-	struct ptn3460_bridge *ptn_bridge;
-
-	bridge = devm_kzalloc(dev->dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge) {
-		DRM_ERROR("Failed to allocate drm bridge\n");
-		return -ENOMEM;
-	}
-
-	ptn_bridge = devm_kzalloc(dev->dev, sizeof(*ptn_bridge), GFP_KERNEL);
-	if (!ptn_bridge) {
-		DRM_ERROR("Failed to allocate ptn bridge\n");
-		return -ENOMEM;
-	}
-
-	ptn_bridge->client = client;
-	ptn_bridge->encoder = encoder;
-	ptn_bridge->bridge = bridge;
-	ptn_bridge->gpio_pd_n = of_get_named_gpio(node, "powerdown-gpio", 0);
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n)) {
-		ret = gpio_request_one(ptn_bridge->gpio_pd_n,
-				GPIOF_OUT_INIT_HIGH, "PTN3460_PD_N");
-		if (ret) {
-			DRM_ERROR("Request powerdown-gpio failed (%d)\n", ret);
-			return ret;
-		}
-	}
-
-	ptn_bridge->gpio_rst_n = of_get_named_gpio(node, "reset-gpio", 0);
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n)) {
-		/*
-		 * Request the reset pin low to avoid the bridge being
-		 * initialized prematurely
-		 */
-		ret = gpio_request_one(ptn_bridge->gpio_rst_n,
-				GPIOF_OUT_INIT_LOW, "PTN3460_RST_N");
-		if (ret) {
-			DRM_ERROR("Request reset-gpio failed (%d)\n", ret);
-			gpio_free(ptn_bridge->gpio_pd_n);
-			return ret;
-		}
-	}
-
-	ret = of_property_read_u32(node, "edid-emulation",
-			&ptn_bridge->edid_emulation);
-	if (ret) {
-		DRM_ERROR("Can't read edid emulation value\n");
-		goto err;
-	}
-
-	ret = drm_bridge_init(dev, bridge, &ptn3460_bridge_funcs);
-	if (ret) {
-		DRM_ERROR("Failed to initialize bridge with drm\n");
-		goto err;
-	}
-
-	bridge->driver_private = ptn_bridge;
-	encoder->bridge = bridge;
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
-
-	return 0;
-
-err:
-	if (gpio_is_valid(ptn_bridge->gpio_pd_n))
-		gpio_free(ptn_bridge->gpio_pd_n);
-	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
-		gpio_free(ptn_bridge->gpio_rst_n);
-	return ret;
-}
-EXPORT_SYMBOL(ptn3460_init);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
new file mode 100644
index 0000000..84645e6
--- /dev/null
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -0,0 +1,89 @@
+/*
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sub license,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+
+#include <drm/drm_crtc.h>
+
+static DEFINE_MUTEX(bridge_lock);
+static LIST_HEAD(bridge_lookup);
+
+int drm_bridge_add_for_lookup(struct drm_bridge *bridge)
+{
+	mutex_lock(&bridge_lock);
+	list_add_tail(&bridge->head, &bridge_lookup);
+	mutex_unlock(&bridge_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_add_for_lookup);
+
+void drm_bridge_remove_from_lookup(struct drm_bridge *bridge)
+{
+	mutex_lock(&bridge_lock);
+	list_del_init(&bridge->head);
+	mutex_unlock(&bridge_lock);
+}
+EXPORT_SYMBOL(drm_bridge_remove_from_lookup);
+
+int drm_bridge_attach_encoder(struct drm_bridge *bridge,
+				struct drm_encoder *encoder)
+{
+	if (!bridge || !encoder)
+		return -EINVAL;
+
+	if (bridge->encoder)
+		return -EBUSY;
+
+	encoder->bridge = bridge;
+	bridge->encoder = encoder;
+	bridge->drm_dev = encoder->dev;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_attach_encoder);
+
+#ifdef CONFIG_OF
+struct drm_bridge *of_drm_find_bridge(struct device_node *np)
+{
+	struct drm_bridge *bridge;
+
+	mutex_lock(&bridge_lock);
+
+	list_for_each_entry(bridge, &bridge_lookup, head) {
+		if (bridge->dev->of_node == np) {
+			mutex_unlock(&bridge_lock);
+			return bridge;
+		}
+	}
+
+	mutex_unlock(&bridge_lock);
+	return NULL;
+}
+EXPORT_SYMBOL(of_drm_find_bridge);
+#endif
+
+MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
+MODULE_DESCRIPTION("DRM bridge infrastructure");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 1ccf5cb..436e75d 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -993,7 +993,6 @@ EXPORT_SYMBOL(drm_connector_unplug_all);
  * drm_bridge_init - initialize a drm transcoder/bridge
  * @dev: drm device
  * @bridge: transcoder/bridge to set up
- * @funcs: bridge function table
  *
  * Initialises a preallocated bridge. Bridges should be
  * subclassed as part of driver connector objects.
@@ -1001,8 +1000,7 @@ EXPORT_SYMBOL(drm_connector_unplug_all);
  * Returns:
  * Zero on success, error code on failure.
  */
-int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
-		const struct drm_bridge_funcs *funcs)
+int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge)
 {
 	int ret;
 
@@ -1012,8 +1010,7 @@ int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
 	if (ret)
 		goto out;
 
-	bridge->dev = dev;
-	bridge->funcs = funcs;
+	bridge->drm_dev = dev;
 
 	list_add_tail(&bridge->head, &dev->mode_config.bridge_list);
 	dev->mode_config.num_bridge++;
@@ -1032,7 +1029,7 @@ EXPORT_SYMBOL(drm_bridge_init);
  */
 void drm_bridge_cleanup(struct drm_bridge *bridge)
 {
-	struct drm_device *dev = bridge->dev;
+	struct drm_device *dev = bridge->drm_dev;
 
 	drm_modeset_lock_all(dev);
 	drm_mode_object_put(dev, &bridge->base);
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 7f9f6f9..bdef294 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -51,9 +51,10 @@ config DRM_EXYNOS_DSI
 
 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
-	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
+	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS
 	default DRM_EXYNOS
 	select DRM_PANEL
+	select DRM_BRIDGE
 	help
 	  This enables support for DP device.
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 49356cc..055a9e1 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -28,7 +28,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_panel.h>
-#include <drm/bridge/ptn3460.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_dp_core.h"
@@ -986,33 +985,23 @@ static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
 	.best_encoder = exynos_dp_best_encoder,
 };
 
-static bool find_bridge(const char *compat, struct bridge_init *bridge)
+static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
+					struct drm_encoder *encoder)
 {
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
-/* returns the number of bridges attached */
-static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
-		struct drm_encoder *encoder)
-{
-	struct bridge_init bridge;
 	int ret;
 
-	if (find_bridge("nxp,ptn3460", &bridge)) {
-		ret = ptn3460_init(dev, encoder, bridge.client, bridge.node);
-		if (!ret)
-			return 1;
+	dp->bridge->connector_polled = DRM_CONNECTOR_POLL_HPD;
+	ret = drm_bridge_attach_encoder(dp->bridge, encoder);
+	if (ret) {
+		DRM_ERROR("Failed to attach bridge to encoder\n");
+		return ret;
 	}
-	return 0;
+
+	/* Allow the bridge to continue with rest of initialization */
+	if (dp->bridge->funcs && dp->bridge->funcs->post_encoder_init)
+		return dp->bridge->funcs->post_encoder_init(dp->bridge);
+
+	return -ENODEV;
 }
 
 static int exynos_dp_create_connector(struct exynos_drm_display *display,
@@ -1025,9 +1014,11 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
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
 
@@ -1279,7 +1270,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	if (!dp->panel) {
+	if (!dp->panel && !dp->bridge) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
 			return ret;
@@ -1370,7 +1361,7 @@ static const struct component_ops exynos_dp_ops = {
 static int exynos_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
+	struct device_node *panel_node, *bridge_node;
 	struct exynos_dp_device *dp;
 	int ret;
 
@@ -1392,6 +1383,14 @@ static int exynos_dp_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 	}
 
+	bridge_node = of_parse_phandle(dev->of_node, "bridge", 0);
+	if (bridge_node) {
+		dp->bridge = of_drm_find_bridge(bridge_node);
+		of_node_put(bridge_node);
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
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f6cf745..0309539 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -221,8 +221,9 @@ struct drm_bridge *hdmi_bridge_init(struct hdmi *hdmi)
 	hdmi_bridge->hdmi = hdmi_reference(hdmi);
 
 	bridge = &hdmi_bridge->base;
+	bridge->funcs = &hdmi_bridge_funcs;
 
-	drm_bridge_init(hdmi->dev, bridge, &hdmi_bridge_funcs);
+	drm_bridge_init(hdmi->dev, bridge);
 
 	return bridge;
 
diff --git a/include/drm/bridge/ptn3460.h b/include/drm/bridge/ptn3460.h
deleted file mode 100644
index ff62344..0000000
--- a/include/drm/bridge/ptn3460.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/*
- * Copyright (C) 2013 Google, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef _DRM_BRIDGE_PTN3460_H_
-#define _DRM_BRIDGE_PTN3460_H_
-
-struct drm_device;
-struct drm_encoder;
-struct i2c_client;
-struct device_node;
-
-#if defined(CONFIG_DRM_PTN3460) || defined(CONFIG_DRM_PTN3460_MODULE)
-
-int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
-		struct i2c_client *client, struct device_node *node);
-#else
-
-static inline int ptn3460_init(struct drm_device *dev,
-		struct drm_encoder *encoder, struct i2c_client *client,
-		struct device_node *node)
-{
-	return 0;
-}
-
-#endif
-
-#endif
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index e529b68..e5a41ad 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -619,6 +619,7 @@ struct drm_plane {
 
 /**
  * drm_bridge_funcs - drm_bridge control functions
+ * @post_encoder_init: called by the parent encoder
  * @mode_fixup: Try to fixup (or reject entirely) proposed mode for this bridge
  * @disable: Called right before encoder prepare, disables the bridge
  * @post_disable: Called right after encoder prepare, for lockstepped disable
@@ -628,6 +629,7 @@ struct drm_plane {
  * @destroy: make object go away
  */
 struct drm_bridge_funcs {
+	int (*post_encoder_init)(struct drm_bridge *bridge);
 	bool (*mode_fixup)(struct drm_bridge *bridge,
 			   const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
@@ -648,15 +650,19 @@ struct drm_bridge_funcs {
  * @base: base mode object
  * @funcs: control functions
  * @driver_private: pointer to the bridge driver's internal context
+ * @connector_polled: polled flag needed for registering connector
  */
 struct drm_bridge {
-	struct drm_device *dev;
+	struct device *dev;
+	struct drm_device *drm_dev;
+	struct drm_encoder *encoder;
 	struct list_head head;
 
 	struct drm_mode_object base;
 
 	const struct drm_bridge_funcs *funcs;
 	void *driver_private;
+	int connector_polled;
 };
 
 /**
@@ -895,8 +901,12 @@ extern void drm_connector_cleanup(struct drm_connector *connector);
 /* helper to unplug all connectors from sysfs for device */
 extern void drm_connector_unplug_all(struct drm_device *dev);
 
-extern int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge,
-			   const struct drm_bridge_funcs *funcs);
+extern int drm_bridge_add_for_lookup(struct drm_bridge *bridge);
+extern void drm_bridge_remove_from_lookup(struct drm_bridge *bridge);
+extern struct drm_bridge *of_drm_find_bridge(struct device_node *np);
+extern int drm_bridge_attach_encoder(struct drm_bridge *bridge,
+				struct drm_encoder *encoder);
+extern int drm_bridge_init(struct drm_device *dev, struct drm_bridge *bridge);
 extern void drm_bridge_cleanup(struct drm_bridge *bridge);
 
 extern int drm_encoder_init(struct drm_device *dev,
-- 
1.7.9.5
