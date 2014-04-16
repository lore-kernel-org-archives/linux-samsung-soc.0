From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 3/7] drm/panel: Add driver for exynos_dp based panels
Date: Wed, 16 Apr 2014 20:03:02 +0530
Message-ID: <1397658786-26138-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63607 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161089AbaDPOdj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:33:39 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N44009SROG2LH50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 23:33:39 +0900 (KST)
In-reply-to: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, a.hajda@samsung.com, treding@nvidia.com, kyungmin.park@samsung.com, seanpaul@google.com, abrestic@chromium.org, rahul.sharma@samsung.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This patch adds a simple driver to handle all the LCD and LED
powerup/down routines needed to support eDP/eDP-LVDS panels
supported on exynos boards.

Most of the eDP/LVDS panels need this sequence for powerup:
	-- LCD unit powerup/LCD_EN
	-- video data on
	-- LED unit powerup/BL_EN

The LCD and LED units are usually powered up via regulators,
and almost on all boards, we will have a BL_EN pin to enable/
disable the backlight. Sometimes, we can have LCD_EN switches
as well. The routines in this driver can be used to control
panel power sequence on such boards.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/panel/exynos-dp-panel.txt  |  32 ++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-exynos-dp.c            | 213 +++++++++++++++++++++
 4 files changed, 255 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
 create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c

diff --git a/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
new file mode 100644
index 0000000..a1428d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
@@ -0,0 +1,32 @@
+exynos_DP_panel/DP_to_LVDS_panel
+==================================
+
+Required properties:
+  - compatible: "samsung,exynos-dp-panel"
+
+Optional properties:
+	-samsung,lcd-en-gpio:
+		eDP panel LCD poweron GPIO.
+			Indicates which GPIO needs to be powered up as output
+			to powerup/enable the switch to the LCD panel.
+	-samsung,led-en-gpio:
+		eDP panel LED enable GPIO.
+			Indicates which GPIO needs to be powered up as output
+			to enable the backlight.
+	-samsung,power-up-delay:
+		eDP panel powerup delay value in ms.
+			Delay in ms needed for the eDP panel to properly
+			powerup after giving powerup signals to the panel.
+	-samsung,power-down-delay:
+		eDP panel powerdown delay value in ms.
+			Delay in ms needed for the eDP panel to properly
+			powerdown after giving powerdown signals to the panel.
+
+Example:
+
+	dp-panel {
+		compatible = "samsung,exynos-dp-panel";
+		samsung,led-en-gpio = <&gpx3 0 1>;
+		samsung,power-up-delay = <40>;
+		samsung,power-down-delay = <50>;
+	};
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4ec874d..ea9d5ac 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -30,4 +30,13 @@ config DRM_PANEL_S6E8AA0
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_EXYNOS_DP
+	tristate "support for DP panels"
+	depends on OF && DRM_PANEL && DRM_EXYNOS_DP
+	help
+	  DRM panel driver for DP panels and LVDS connected via DP bridges
+	  that need at most a regulator for LCD unit, a regulator for LED unit
+	  and/or enable GPIOs for LCD or LED units. Delay values can also be
+	  specified to support powerup and powerdown process.
+
 endmenu
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 8b92921..30311a4 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_LD9040) += panel-ld9040.o
 obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
+obj-$(CONFIG_DRM_PANEL_EXYNOS_DP) += panel-exynos-dp.o
diff --git a/drivers/gpu/drm/panel/panel-exynos-dp.c b/drivers/gpu/drm/panel/panel-exynos-dp.c
new file mode 100644
index 0000000..e85a7b2
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-exynos-dp.c
@@ -0,0 +1,213 @@
+/*
+ * Exynos DP panel driver
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd
+ *
+ * Ajay Kumar <ajaykumar.rs@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/component.h>
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_panel.h>
+
+struct panel_exynos_dp {
+	struct drm_panel	base;
+	struct regulator	*bck_fet;
+	struct regulator	*lcd_fet;
+	int			led_en_gpio;
+	int			lcd_en_gpio;
+	int			power_up_delay;
+	int			power_down_delay;
+	bool			enabled;
+};
+
+static inline struct panel_exynos_dp *to_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_exynos_dp, base);
+}
+
+static int panel_exynos_dp_disable(struct drm_panel *panel)
+{
+	struct panel_exynos_dp *dp_panel = to_panel(panel);
+	bool enable_delay = false;
+
+	if (!dp_panel->enabled)
+		return 0;
+
+	if (gpio_is_valid(dp_panel->led_en_gpio))
+		gpio_set_value(dp_panel->led_en_gpio, 0);
+
+	if (!IS_ERR_OR_NULL(dp_panel->bck_fet))
+		regulator_disable(dp_panel->bck_fet);
+
+	if (gpio_is_valid(dp_panel->lcd_en_gpio)) {
+		gpio_set_value(dp_panel->lcd_en_gpio, 0);
+		enable_delay = true;
+	}
+
+	if (!IS_ERR_OR_NULL(dp_panel->lcd_fet)) {
+		regulator_disable(dp_panel->lcd_fet);
+		enable_delay = true;
+	}
+
+	if (enable_delay)
+		msleep(dp_panel->power_down_delay);
+
+	dp_panel->enabled = false;
+
+	return 0;
+}
+
+static int panel_exynos_dp_pre_enable(struct drm_panel *panel)
+{
+	struct panel_exynos_dp *dp_panel = to_panel(panel);
+	bool enable_delay = false;
+
+	if (dp_panel->enabled)
+		return 0;
+
+	if (!IS_ERR_OR_NULL(dp_panel->lcd_fet)) {
+		if (regulator_enable(dp_panel->lcd_fet))
+			DRM_ERROR("Failed to enable LCD fet\n");
+		enable_delay = true;
+	}
+
+	if (gpio_is_valid(dp_panel->lcd_en_gpio)) {
+		gpio_set_value(dp_panel->lcd_en_gpio, 1);
+		enable_delay = true;
+	}
+
+	if (enable_delay)
+		msleep(dp_panel->power_up_delay);
+
+	return 0;
+}
+
+static int panel_exynos_dp_enable(struct drm_panel *panel)
+{
+	struct panel_exynos_dp *dp_panel = to_panel(panel);
+
+	if (dp_panel->enabled)
+		return 0;
+
+	if (!IS_ERR_OR_NULL(dp_panel->bck_fet))
+		if (regulator_enable(dp_panel->bck_fet))
+				DRM_ERROR("Failed to enable LED fet\n");
+
+	if (gpio_is_valid(dp_panel->led_en_gpio))
+		gpio_set_value(dp_panel->led_en_gpio, 1);
+
+	dp_panel->enabled = true;
+
+	return 0;
+}
+
+static const struct drm_panel_funcs panel_exynos_dp_funcs = {
+	.disable = panel_exynos_dp_disable,
+	.pre_enable = panel_exynos_dp_pre_enable,
+	.enable = panel_exynos_dp_enable,
+};
+
+static int panel_exynos_dp_probe(struct platform_device *pdev)
+{
+	struct panel_exynos_dp *dp_panel;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	dp_panel = devm_kzalloc(dev, sizeof(*dp_panel), GFP_KERNEL);
+	if (!dp_panel)
+		return -ENOMEM;
+
+	dp_panel->enabled = false;
+
+	dp_panel->lcd_en_gpio = of_get_named_gpio(dev->of_node,
+						"samsung,lcd-en-gpio", 0);
+	dp_panel->led_en_gpio = of_get_named_gpio(dev->of_node,
+						"samsung,led-en-gpio", 0);
+
+	of_property_read_u32(dev->of_node, "samsung,power-up-delay",
+						&dp_panel->power_up_delay);
+	of_property_read_u32(dev->of_node, "samsung,power-down-delay",
+						&dp_panel->power_down_delay);
+
+	dp_panel->lcd_fet = devm_regulator_get(dev, "lcd_vdd");
+	if (IS_ERR(dp_panel->lcd_fet))
+		return PTR_ERR(dp_panel->lcd_fet);
+
+	dp_panel->bck_fet = devm_regulator_get(dev, "vcd_led");
+	if (IS_ERR(dp_panel->bck_fet))
+		return PTR_ERR(dp_panel->bck_fet);
+
+	if (gpio_is_valid(dp_panel->lcd_en_gpio)) {
+		ret = devm_gpio_request_one(dev, dp_panel->lcd_en_gpio,
+					GPIOF_OUT_INIT_LOW, "lcd_en_gpio");
+		if (ret) {
+			DRM_ERROR("failed to get lcd-en gpio [%d]\n", ret);
+			return ret;
+		}
+	} else {
+		dp_panel->lcd_en_gpio = -ENODEV;
+	}
+
+	if (gpio_is_valid(dp_panel->led_en_gpio)) {
+		ret = devm_gpio_request_one(dev, dp_panel->led_en_gpio,
+					GPIOF_OUT_INIT_LOW, "led_en_gpio");
+		if (ret) {
+			DRM_ERROR("failed to get led-en gpio [%d]\n", ret);
+			return ret;
+		}
+	} else {
+		dp_panel->led_en_gpio = -ENODEV;
+	}
+
+	drm_panel_init(&dp_panel->base);
+	dp_panel->base.dev = dev;
+	dp_panel->base.funcs = &panel_exynos_dp_funcs;
+
+	ret = drm_panel_add(&dp_panel->base);
+	if (ret < 0)
+		return ret;
+
+	dev_set_drvdata(dev, dp_panel);
+
+	return 0;
+}
+
+static int panel_exynos_dp_remove(struct platform_device *pdev)
+{
+	struct panel_exynos_dp *dp_panel = dev_get_drvdata(&pdev->dev);
+
+	drm_panel_detach(&dp_panel->base);
+	drm_panel_remove(&dp_panel->base);
+
+	panel_exynos_dp_disable(&dp_panel->base);
+
+	return 0;
+}
+
+static const struct of_device_id exynos_dp_panel_dt_match[] = {
+	{ .compatible = "samsung,exynos-dp-panel" },
+	{},
+};
+
+struct platform_driver exynos_dp_panel_driver = {
+	.driver = {
+		.name = "exynos-dp-panel",
+		.owner = THIS_MODULE,
+		.of_match_table = exynos_dp_panel_dt_match,
+	},
+	.probe = panel_exynos_dp_probe,
+	.remove = panel_exynos_dp_remove,
+};
-- 
1.8.1.2
