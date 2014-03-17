From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 5/9] drm/exynos: restore parallel output interface support
Date: Mon, 17 Mar 2014 13:03:56 +0100
Message-ID: <1395057836-11368-1-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-6-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395052045-23848-6-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Denis Carikli <denis@eukrea.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds parallel output interface to FIMD device driver.
It also restores support for panels initialized by boot loader,
but without proper kernel driver.
Driver uses video interface bindings to find connected panel.
It uses drm_panel interface to interact with the panel.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2:
- corrected stub definitions
---
 drivers/gpu/drm/exynos/Kconfig           |   8 +
 drivers/gpu/drm/exynos/Makefile          |   1 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 339 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   8 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   4 +
 5 files changed, 360 insertions(+)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_dpi.c

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 7eea698..56f9581 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -31,6 +31,14 @@ config DRM_EXYNOS_FIMD
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
 
+config DRM_EXYNOS_DPI
+	bool "EXYNOS DRM parallel output support"
+	depends on DRM_EXYNOS
+	select DRM_PANEL
+	default n
+	help
+	  This enables support for Exynos parallel output.
+
 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
 	depends on DRM_EXYNOS && ARCH_EXYNOS
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index b1839e8..babcd52 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -11,6 +11,7 @@ exynosdrm-y := exynos_drm_drv.o exynos_drm_encoder.o \
 exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) += exynos_drm_iommu.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DMABUF) += exynos_drm_dmabuf.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_DPI)	+= exynos_drm_dpi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp_core.o exynos_dp_reg.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o exynos_mixer.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_VIDI)	+= exynos_drm_vidi.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
new file mode 100644
index 0000000..2b09c7c
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -0,0 +1,339 @@
+/*
+ * Exynos DRM Parallel output support.
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd
+ *
+ * Contacts: Andrzej Hajda <a.hajda@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_panel.h>
+
+#include <linux/regulator/consumer.h>
+
+#include <video/of_videomode.h>
+#include <video/videomode.h>
+
+#include "exynos_drm_drv.h"
+
+struct exynos_dpi {
+	struct device *dev;
+	struct device_node *panel_node;
+
+	struct drm_panel *panel;
+	struct drm_connector connector;
+	struct drm_encoder *encoder;
+
+	struct videomode *vm;
+	int dpms_mode;
+};
+
+#define connector_to_dpi(c) container_of(c, struct exynos_dpi, connector)
+
+static enum drm_connector_status
+exynos_dpi_detect(struct drm_connector *connector, bool force)
+{
+	struct exynos_dpi *ctx = connector_to_dpi(connector);
+
+	/* panels supported only by boot-loader are always connected */
+	if (!ctx->panel_node)
+		return connector_status_connected;
+
+	if (!ctx->panel) {
+		ctx->panel = of_drm_find_panel(ctx->panel_node);
+		if (ctx->panel)
+			drm_panel_attach(ctx->panel, &ctx->connector);
+	}
+
+	if (ctx->panel)
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+
+static void exynos_dpi_connector_destroy(struct drm_connector *connector)
+{
+	drm_sysfs_connector_remove(connector);
+	drm_connector_cleanup(connector);
+}
+
+static struct drm_connector_funcs exynos_dpi_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.detect = exynos_dpi_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = exynos_dpi_connector_destroy,
+};
+
+static int exynos_dpi_get_modes(struct drm_connector *connector)
+{
+	struct exynos_dpi *ctx = connector_to_dpi(connector);
+
+	/* fimd timings gets precedence over panel modes */
+	if (ctx->vm) {
+		struct drm_display_mode *mode;
+
+		mode = drm_mode_create(connector->dev);
+		if (!mode) {
+			DRM_ERROR("failed to create a new display mode\n");
+			return 0;
+		}
+		drm_display_mode_from_videomode(ctx->vm, mode);
+		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+		drm_mode_probed_add(connector, mode);
+		return 1;
+	}
+
+	if (ctx->panel)
+		return ctx->panel->funcs->get_modes(ctx->panel);
+
+	return 0;
+}
+
+static int exynos_dpi_mode_valid(struct drm_connector *connector,
+				 struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static struct drm_encoder *
+exynos_dpi_best_encoder(struct drm_connector *connector)
+{
+	struct exynos_dpi *ctx = connector_to_dpi(connector);
+
+	return ctx->encoder;
+}
+
+static struct drm_connector_helper_funcs exynos_dpi_connector_helper_funcs = {
+	.get_modes = exynos_dpi_get_modes,
+	.mode_valid = exynos_dpi_mode_valid,
+	.best_encoder = exynos_dpi_best_encoder,
+};
+
+static int exynos_dpi_create_connector(struct exynos_drm_display *display,
+				       struct drm_encoder *encoder)
+{
+	struct exynos_dpi *ctx = display->ctx;
+	struct drm_connector *connector = &ctx->connector;
+	int ret;
+
+	ctx->encoder = encoder;
+
+	if (ctx->panel_node)
+		connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	else
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	ret = drm_connector_init(encoder->dev, connector,
+				 &exynos_dpi_connector_funcs,
+				 DRM_MODE_CONNECTOR_VGA);
+	if (ret) {
+		DRM_ERROR("failed to initialize connector with drm\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &exynos_dpi_connector_helper_funcs);
+	drm_sysfs_connector_add(connector);
+	drm_mode_connector_attach_encoder(connector, encoder);
+
+	return 0;
+}
+
+static void exynos_dpi_poweron(struct exynos_dpi *ctx)
+{
+	if (ctx->panel)
+		drm_panel_enable(ctx->panel);
+}
+
+static void exynos_dpi_poweroff(struct exynos_dpi *ctx)
+{
+	if (ctx->panel)
+		drm_panel_disable(ctx->panel);
+}
+
+static void exynos_dpi_dpms(struct exynos_drm_display *display, int mode)
+{
+	struct exynos_dpi *ctx = display->ctx;
+
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		if (ctx->dpms_mode != DRM_MODE_DPMS_ON)
+				exynos_dpi_poweron(ctx);
+			break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_OFF:
+		if (ctx->dpms_mode == DRM_MODE_DPMS_ON)
+			exynos_dpi_poweroff(ctx);
+		break;
+	default:
+		break;
+	};
+	ctx->dpms_mode = mode;
+}
+
+static struct exynos_drm_display_ops exynos_dpi_display_ops = {
+	.create_connector = exynos_dpi_create_connector,
+	.dpms = exynos_dpi_dpms
+};
+
+static struct exynos_drm_display exynos_dpi_display = {
+	.type = EXYNOS_DISPLAY_TYPE_LCD,
+	.ops = &exynos_dpi_display_ops,
+};
+
+/* of_* functions will be removed after merge of of_graph patches */
+static struct device_node *
+of_get_child_by_name_reg(struct device_node *parent, const char *name, u32 reg)
+{
+	struct device_node *np;
+
+	for_each_child_of_node(parent, np) {
+		u32 r;
+
+		if (!np->name || of_node_cmp(np->name, name))
+			continue;
+
+		if (of_property_read_u32(np, "reg", &r) < 0)
+			r = 0;
+
+		if (reg == r)
+			break;
+	}
+
+	return np;
+}
+
+static struct device_node *of_graph_get_port_by_reg(struct device_node *parent,
+						    u32 reg)
+{
+	struct device_node *ports, *port;
+
+	ports = of_get_child_by_name(parent, "ports");
+	if (ports)
+		parent = ports;
+
+	port = of_get_child_by_name_reg(parent, "port", reg);
+
+	of_node_put(ports);
+
+	return port;
+}
+
+static struct device_node *
+of_graph_get_endpoint_by_reg(struct device_node *port, u32 reg)
+{
+	return of_get_child_by_name_reg(port, "endpoint", reg);
+}
+
+static struct device_node *
+of_graph_get_remote_port_parent(const struct device_node *node)
+{
+	struct device_node *np;
+	unsigned int depth;
+
+	np = of_parse_phandle(node, "remote-endpoint", 0);
+
+	/* Walk 3 levels up only if there is 'ports' node. */
+	for (depth = 3; depth && np; depth--) {
+		np = of_get_next_parent(np);
+		if (depth == 2 && of_node_cmp(np->name, "ports"))
+			break;
+	}
+	return np;
+}
+
+enum {
+	FIMD_PORT_IN0,
+	FIMD_PORT_IN1,
+	FIMD_PORT_IN2,
+	FIMD_PORT_RGB,
+	FIMD_PORT_WRB,
+};
+
+static struct device_node *exynos_dpi_of_find_panel_node(struct device *dev)
+{
+	struct device_node *np, *ep;
+
+	np = of_graph_get_port_by_reg(dev->of_node, FIMD_PORT_RGB);
+	if (!np)
+		return NULL;
+
+	ep = of_graph_get_endpoint_by_reg(np, 0);
+	of_node_put(np);
+	if (!ep)
+		return NULL;
+
+	np = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+
+	return np;
+}
+
+static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
+{
+	struct device *dev = ctx->dev;
+	struct device_node *dn = dev->of_node;
+	struct device_node *np;
+
+	ctx->panel_node = exynos_dpi_of_find_panel_node(dev);
+
+	np = of_get_child_by_name(dn, "display-timings");
+	if (np) {
+		struct videomode *vm;
+		int ret;
+
+		of_node_put(np);
+
+		vm = devm_kzalloc(dev, sizeof(*ctx->vm), GFP_KERNEL);
+		if (!vm)
+			return -ENOMEM;
+
+		ret = of_get_videomode(dn, vm, 0);
+		if (ret < 0)
+			return ret;
+
+		ctx->vm = vm;
+
+		return 0;
+	}
+
+	if (!ctx->panel_node)
+		return -EINVAL;
+
+	return 0;
+}
+
+int exynos_dpi_probe(struct device *dev)
+{
+	struct exynos_dpi *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = dev;
+	exynos_dpi_display.ctx = ctx;
+	ctx->dpms_mode = DRM_MODE_DPMS_OFF;
+
+	ret = exynos_dpi_parse_dt(ctx);
+	if (ret < 0)
+		return ret;
+
+	exynos_drm_display_register(&exynos_dpi_display);
+
+	return 0;
+}
+
+int exynos_dpi_remove(struct device *dev)
+{
+	exynos_dpi_dpms(&exynos_dpi_display, DRM_MODE_DPMS_OFF);
+	exynos_drm_display_unregister(&exynos_dpi_display);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 1c78806..2d892f3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -361,6 +361,14 @@ int exynos_platform_device_ipp_register(void);
  */
 void exynos_platform_device_ipp_unregister(void);
 
+#ifdef CONFIG_DRM_EXYNOS_DPI
+int exynos_dpi_probe(struct device *dev);
+int exynos_dpi_remove(struct device *dev);
+#else
+static inline int exynos_dpi_probe(struct device *dev) { return 0; }
+static inline int exynos_dpi_remove(struct device *dev) { return 0; }
+#endif
+
 extern struct platform_driver dp_driver;
 extern struct platform_driver fimd_driver;
 extern struct platform_driver hdmi_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 10431b0..15d6b37 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -920,6 +920,8 @@ static int fimd_probe(struct platform_device *pdev)
 	fimd_manager.ctx = ctx;
 	exynos_drm_manager_register(&fimd_manager);
 
+	exynos_dpi_probe(ctx->dev);
+
 	pm_runtime_enable(dev);
 
 	for (win = 0; win < WINDOWS_NR; win++)
@@ -932,6 +934,8 @@ static int fimd_remove(struct platform_device *pdev)
 {
 	struct exynos_drm_manager *mgr = platform_get_drvdata(pdev);
 
+	exynos_dpi_remove(&pdev->dev);
+
 	exynos_drm_manager_unregister(&fimd_manager);
 
 	fimd_dpms(mgr, DRM_MODE_DPMS_OFF);
-- 
1.8.3.2
