From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V5 07/12] drm/bridge: Add a driver which binds drm_bridge with
 drm_panel
Date: Fri, 18 Jul 2014 02:13:53 +0530
Message-ID: <1405629839-12086-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50033 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752881AbaGQUrK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:47:10 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V000EKJ2KQD20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:47:08 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Ajay Kumar <ajaykumar.rs@samsung.com>

Add a dummy bridge which binds all of the drm_bridge callbacks
to corresponding drm_panel callbacks.

In theory, this is just a glue layer for the last bridge and
the panel attached to it.

This driver also implements the required drm_connector ops
for the encoder(on which the entire bridge chain is hanging off).

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig        |    7 ++
 drivers/gpu/drm/bridge/Makefile       |    1 +
 drivers/gpu/drm/bridge/panel_binder.c |  193 +++++++++++++++++++++++++++++++++
 include/drm/bridge/panel_binder.h     |   44 ++++++++
 4 files changed, 245 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/panel_binder.c
 create mode 100644 include/drm/bridge/panel_binder.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 884923f..e3fb487 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -3,3 +3,10 @@ config DRM_PTN3460
 	depends on DRM
 	select DRM_KMS_HELPER
 	---help---
+
+config DRM_PANEL_BINDER
+	tristate "bridge panel binder"
+	depends on DRM
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	---help---
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index b4733e1..ba8b5b8 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,3 +1,4 @@
 ccflags-y := -Iinclude/drm
 
 obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
+obj-$(CONFIG_DRM_PANEL_BINDER) += panel_binder.o
diff --git a/drivers/gpu/drm/bridge/panel_binder.c b/drivers/gpu/drm/bridge/panel_binder.c
new file mode 100644
index 0000000..6160ed5
--- /dev/null
+++ b/drivers/gpu/drm/bridge/panel_binder.c
@@ -0,0 +1,193 @@
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
+
+#include <drm/drm_panel.h>
+
+#include "drmP.h"
+#include "drm_crtc.h"
+#include "drm_crtc_helper.h"
+
+#include "bridge/panel_binder.h"
+
+struct panel_binder {
+	struct drm_connector	connector;
+	struct i2c_client	*client;
+	struct drm_encoder	*encoder;
+	struct drm_bridge	*bridge;
+	struct drm_panel	*panel;
+};
+
+static void panel_binder_pre_enable(struct drm_bridge *bridge)
+{
+	struct panel_binder *panel_binder = bridge->driver_private;
+
+	drm_panel_prepare(panel_binder->panel);
+}
+
+static void panel_binder_enable(struct drm_bridge *bridge)
+{
+	struct panel_binder *panel_binder = bridge->driver_private;
+
+	drm_panel_enable(panel_binder->panel);
+}
+
+static void panel_binder_disable(struct drm_bridge *bridge)
+{
+	struct panel_binder *panel_binder = bridge->driver_private;
+
+	drm_panel_disable(panel_binder->panel);
+}
+
+static void panel_binder_post_disable(struct drm_bridge *bridge)
+{
+	struct panel_binder *panel_binder = bridge->driver_private;
+
+	drm_panel_unprepare(panel_binder->panel);
+}
+
+void panel_binder_destroy(struct drm_bridge *bridge)
+{
+	struct panel_binder *panel_binder = bridge->driver_private;
+
+	drm_panel_detach(panel_binder->panel);
+	drm_bridge_cleanup(bridge);
+}
+
+struct drm_bridge_funcs panel_binder_funcs = {
+	.pre_enable = panel_binder_pre_enable,
+	.enable = panel_binder_enable,
+	.disable = panel_binder_disable,
+	.post_disable = panel_binder_post_disable,
+	.destroy = panel_binder_destroy,
+};
+
+static int panel_binder_mode_valid(struct drm_connector *connector,
+				 struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static int panel_binder_get_modes(struct drm_connector *connector)
+{
+	struct panel_binder *panel_binder;
+
+	panel_binder = container_of(connector, struct panel_binder, connector);
+
+	return panel_binder->panel->funcs->get_modes(panel_binder->panel);
+}
+
+static struct drm_encoder *panel_binder_best_encoder(struct drm_connector
+								*connector)
+{
+	struct panel_binder *panel_binder;
+
+	panel_binder = container_of(connector, struct panel_binder, connector);
+
+	return panel_binder->encoder;
+}
+
+static const struct drm_connector_helper_funcs
+					panel_binder_connector_helper_funcs = {
+	.get_modes = panel_binder_get_modes,
+	.mode_valid = panel_binder_mode_valid,
+	.best_encoder = panel_binder_best_encoder,
+};
+
+static enum drm_connector_status panel_binder_detect(struct drm_connector
+							*connector, bool force)
+{
+	return connector_status_connected;
+}
+
+static void panel_binder_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs panel_binder_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = panel_binder_detect,
+	.destroy = panel_binder_connector_destroy,
+};
+
+struct drm_bridge *panel_binder_init(struct drm_device *dev,
+					struct drm_encoder *encoder,
+					struct i2c_client *client,
+					struct device_node *node,
+					struct drm_panel *panel,
+					int connector_type,
+					uint8_t polled)
+{
+	int ret;
+	struct drm_bridge *bridge;
+	struct panel_binder *panel_binder;
+
+	if (IS_ERR_OR_NULL(panel)) {
+		DRM_ERROR("invalid drm_panel pointer\n");
+		return NULL;
+	}
+
+	bridge = devm_kzalloc(dev->dev, sizeof(*bridge), GFP_KERNEL);
+	if (!bridge) {
+		DRM_ERROR("failed to allocate drm bridge\n");
+		return NULL;
+	}
+
+	panel_binder = devm_kzalloc(dev->dev, sizeof(*panel_binder),
+								GFP_KERNEL);
+	if (!panel_binder) {
+		DRM_ERROR("failed to allocate bridge panel_binder\n");
+		return NULL;
+	}
+
+	panel_binder->client = client;
+	panel_binder->encoder = encoder;
+	panel_binder->bridge = bridge;
+	panel_binder->panel = panel;
+
+	ret = drm_bridge_init(dev, bridge, &panel_binder_funcs);
+	if (ret) {
+		DRM_ERROR("failed to initialize bridge with drm\n");
+		goto err;
+	}
+
+	bridge->driver_private = panel_binder;
+
+	drm_panel_attach(panel_binder->panel, &panel_binder->connector);
+
+	if (!encoder->bridge)
+		/* First entry in the bridge chain */
+		encoder->bridge = bridge;
+
+	panel_binder->connector.polled = polled;
+	ret = drm_connector_init(dev, &panel_binder->connector,
+			&panel_binder_connector_funcs, connector_type);
+	if (ret) {
+		DRM_ERROR("failed to initialize connector with drm\n");
+		goto err;
+	}
+	drm_connector_helper_add(&panel_binder->connector,
+			&panel_binder_connector_helper_funcs);
+	drm_connector_register(&panel_binder->connector);
+	drm_mode_connector_attach_encoder(&panel_binder->connector, encoder);
+
+	return bridge;
+
+err:
+	return NULL;
+}
+EXPORT_SYMBOL(panel_binder_init);
diff --git a/include/drm/bridge/panel_binder.h b/include/drm/bridge/panel_binder.h
new file mode 100644
index 0000000..5bed382
--- /dev/null
+++ b/include/drm/bridge/panel_binder.h
@@ -0,0 +1,44 @@
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
+struct drm_panel;
+
+#if defined(CONFIG_DRM_PANEL_BINDER) || defined(CONFIG_DRM_PANEL_BINDER_MODULE)
+struct drm_bridge *panel_binder_init(struct drm_device *dev,
+					struct drm_encoder *encoder,
+					struct i2c_client *client,
+					struct device_node *node,
+					struct drm_panel *panel,
+					int connector_type,
+					uint8_t polled);
+#else
+static inline struct drm_bridge *panel_binder_init(struct drm_device *dev,
+						struct drm_encoder *encoder,
+						struct i2c_client *client,
+						struct device_node *node,
+						struct drm_panel *panel,
+						int connector_type,
+						uint8_t polled)
+{
+	return 0;
+}
+#endif
+
+#endif
-- 
1.7.9.5
