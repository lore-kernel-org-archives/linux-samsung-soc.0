From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V5 04/12] drm/panel: Add driver for lvds/edp based panels
Date: Fri, 18 Jul 2014 02:13:50 +0530
Message-ID: <1405629839-12086-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33622 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752816AbaGQUrD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:47:03 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V00BUVJ2E1D70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:47:02 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

This patch adds a simple driver to handle all the LCD and LED
powerup/down routines needed to support eDP/LVDS panels.

The LCD and LED units are usually powered up via regulators,
and almost on all boards, we will have a BACKLIGHT_EN pin to
enable/ disable the backlight.
Sometimes, we can have LCD_EN switches as well.

The routines in this driver can be used to control
panel power sequence on such boards.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/gpu/drm/panel/Kconfig      |   10 ++
 drivers/gpu/drm/panel/Makefile     |    1 +
 drivers/gpu/drm/panel/panel-lvds.c |  268 ++++++++++++++++++++++++++++++++++++
 3 files changed, 279 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lvds.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4ec874d..8fe7ee5 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -30,4 +30,14 @@ config DRM_PANEL_S6E8AA0
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_EDP_LVDS
+	tristate "support for eDP/LVDS panels"
+	depends on OF && DRM_PANEL
+	select VIDEOMODE_HELPERS
+	help
+	  DRM panel driver for direct eDP panels or LVDS connected
+	  via DP bridges, that need at most a regulator for LCD unit,
+	  a regulator for LED unit and/or enable GPIOs for LCD or LED units.
+	  Delay values can also be specified to support powerup and
+	  powerdown process.
 endmenu
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 8b92921..eaafa01 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_LD9040) += panel-ld9040.o
 obj-$(CONFIG_DRM_PANEL_S6E8AA0) += panel-s6e8aa0.o
+obj-$(CONFIG_DRM_PANEL_EDP_LVDS) += panel-lvds.o
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
new file mode 100644
index 0000000..ce20587
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -0,0 +1,268 @@
+/*
+ * panel driver for lvds and eDP panels
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
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/of_videomode.h>
+#include <video/videomode.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_panel.h>
+
+struct panel_lvds {
+	struct drm_panel	base;
+	struct regulator	*backlight_fet;
+	struct regulator	*lcd_fet;
+	struct gpio_desc	*lcd_en_gpio;
+	struct gpio_desc	*led_en_gpio;
+	struct videomode	vm;
+	int			width_mm;
+	int			height_mm;
+	bool			backlight_fet_enabled;
+	bool			lcd_fet_enabled;
+	int			panel_prepare_delay;
+	int			panel_enable_delay;
+	int			panel_disable_delay;
+	int			panel_unprepare_delay;
+};
+
+static inline struct panel_lvds *to_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_lvds, base);
+}
+
+static int panel_lvds_prepare(struct drm_panel *panel)
+{
+	struct panel_lvds *lvds_panel = to_panel(panel);
+
+	if (!lvds_panel->lcd_fet_enabled) {
+		if (regulator_enable(lvds_panel->lcd_fet)) {
+			DRM_ERROR("failed to enable LCD fet\n");
+			return -EAGAIN;
+		}
+		lvds_panel->lcd_fet_enabled = true;
+	}
+
+	if (lvds_panel->lcd_en_gpio)
+		gpiod_set_value(lvds_panel->lcd_en_gpio, 1);
+
+	msleep(lvds_panel->panel_prepare_delay);
+
+	return 0;
+}
+
+static int panel_lvds_enable(struct drm_panel *panel)
+{
+	struct panel_lvds *lvds_panel = to_panel(panel);
+
+	if (!lvds_panel->backlight_fet_enabled) {
+		if (regulator_enable(lvds_panel->backlight_fet)) {
+			DRM_ERROR("failed to enable LED fet\n");
+			return -EAGAIN;
+		}
+		lvds_panel->backlight_fet_enabled = true;
+	}
+
+	msleep(lvds_panel->panel_enable_delay);
+
+	if (lvds_panel->led_en_gpio)
+		gpiod_set_value(lvds_panel->led_en_gpio, 1);
+
+	return 0;
+}
+
+static int panel_lvds_disable(struct drm_panel *panel)
+{
+	struct panel_lvds *lvds_panel = to_panel(panel);
+
+	if (lvds_panel->led_en_gpio)
+		gpiod_set_value(lvds_panel->led_en_gpio, 0);
+
+	if (lvds_panel->backlight_fet_enabled) {
+		regulator_disable(lvds_panel->backlight_fet);
+		lvds_panel->backlight_fet_enabled = false;
+	}
+
+	msleep(lvds_panel->panel_disable_delay);
+
+	return 0;
+}
+
+static int panel_lvds_unprepare(struct drm_panel *panel)
+{
+	struct panel_lvds *lvds_panel = to_panel(panel);
+
+	if (lvds_panel->lcd_en_gpio)
+		gpiod_set_value(lvds_panel->lcd_en_gpio, 0);
+
+	if (lvds_panel->lcd_fet_enabled) {
+		regulator_disable(lvds_panel->lcd_fet);
+		lvds_panel->lcd_fet_enabled = false;
+	}
+
+	msleep(lvds_panel->panel_unprepare_delay);
+
+	return 0;
+}
+
+static int panel_lvds_get_modes(struct drm_panel *panel)
+{
+	struct drm_connector *connector = panel->connector;
+	struct panel_lvds *lvds_panel = to_panel(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_create(connector->dev);
+	if (!mode) {
+		DRM_ERROR("failed to create a new display mode.\n");
+		return 0;
+	}
+
+	drm_display_mode_from_videomode(&lvds_panel->vm, mode);
+	mode->width_mm = lvds_panel->width_mm;
+	mode->height_mm = lvds_panel->height_mm;
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs panel_lvds_funcs = {
+	.unprepare = panel_lvds_unprepare,
+	.disable = panel_lvds_disable,
+	.prepare = panel_lvds_prepare,
+	.enable = panel_lvds_enable,
+	.get_modes = panel_lvds_get_modes,
+};
+
+static int panel_lvds_probe(struct platform_device *pdev)
+{
+	struct panel_lvds *panel;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	int ret;
+
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return -ENOMEM;
+
+	ret = of_get_videomode(node, &panel->vm, 0);
+	if (ret) {
+		DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
+		return ret;
+	}
+
+	panel->lcd_fet = devm_regulator_get(dev, "lcd");
+	if (IS_ERR(panel->lcd_fet))
+		return -EPROBE_DEFER;
+
+	panel->backlight_fet = devm_regulator_get(dev, "backlight");
+	if (IS_ERR(panel->backlight_fet))
+		return -EPROBE_DEFER;
+
+	of_property_read_u32(node, "panel-width-mm", &panel->width_mm);
+	of_property_read_u32(node, "panel-height-mm", &panel->height_mm);
+
+	of_property_read_u32(node, "panel-prepare-delay",
+					&panel->panel_prepare_delay);
+	of_property_read_u32(node, "panel-enable-delay",
+					&panel->panel_enable_delay);
+	of_property_read_u32(node, "panel-disable-delay",
+					&panel->panel_disable_delay);
+	of_property_read_u32(node, "panel-unprepare-delay",
+					&panel->panel_unprepare_delay);
+
+	panel->lcd_en_gpio = devm_gpiod_get(dev, "lcd-enable");
+	if (IS_ERR(panel->lcd_en_gpio)) {
+		ret = PTR_ERR(panel->lcd_en_gpio);
+		if (ret != -ENOENT) {
+			dev_err(dev, "failed to request GPIO: %d\n", ret);
+			return ret;
+		}
+		panel->lcd_en_gpio = NULL;
+	} else {
+		ret = gpiod_direction_output(panel->lcd_en_gpio, 0);
+		if (ret < 0) {
+			dev_err(dev, "failed to setup GPIO: %d\n", ret);
+			return ret;
+		}
+	}
+
+	panel->led_en_gpio = devm_gpiod_get(dev, "backlight-enable");
+	if (IS_ERR(panel->led_en_gpio)) {
+		ret = PTR_ERR(panel->led_en_gpio);
+		if (ret != -ENOENT) {
+			dev_err(dev, "failed to request GPIO: %d\n", ret);
+			return ret;
+		}
+		panel->led_en_gpio = NULL;
+	} else {
+		ret = gpiod_direction_output(panel->led_en_gpio, 0);
+		if (ret < 0) {
+			dev_err(dev, "failed to setup GPIO: %d\n", ret);
+			return ret;
+		}
+	}
+
+	drm_panel_init(&panel->base);
+	panel->base.dev = dev;
+	panel->base.funcs = &panel_lvds_funcs;
+
+	ret = drm_panel_add(&panel->base);
+	if (ret < 0)
+		return ret;
+
+	dev_set_drvdata(dev, panel);
+
+	return 0;
+}
+
+static int panel_lvds_remove(struct platform_device *pdev)
+{
+	struct panel_lvds *panel = dev_get_drvdata(&pdev->dev);
+
+	panel_lvds_disable(&panel->base);
+	panel_lvds_unprepare(&panel->base);
+
+	drm_panel_remove(&panel->base);
+
+	return 0;
+}
+
+static const struct of_device_id lvds_panel_dt_match[] = {
+	{ .compatible = "panel-lvds" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lvds_panel_dt_match);
+
+struct platform_driver lvds_panel_driver = {
+	.driver = {
+		.name = "panel_lvds",
+		.owner = THIS_MODULE,
+		.of_match_table = lvds_panel_dt_match,
+	},
+	.probe = panel_lvds_probe,
+	.remove = panel_lvds_remove,
+};
+module_platform_driver(lvds_panel_driver);
+
+MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
+MODULE_DESCRIPTION("lvds/eDP panel driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
