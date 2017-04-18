From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/7] drm/exynos/dsi: refactor panel detection logic
Date: Tue, 18 Apr 2017 14:39:59 +0200
Message-ID: <1492519203-23537-4-git-send-email-a.hajda@samsung.com>
References: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
 <CGME20170418124013eucas1p13103c8630a1acd86d607d02d95916786@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46152 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753212AbdDRMkR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 08:40:17 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOL00EL0V72VI90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Apr 2017 13:40:14 +0100 (BST)
In-reply-to: <1492519203-23537-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Description of drm_helper_hpd_irq_event clearly states that drivers
supporting hotplug events per connector should use different helper -
drm_kms_helper_hotplug_event. To achieve it following changes have
been performed:
- moved down all DSI ops - they require exynos_dsi_disable function
to be defined earlier,
- simplified exynos_dsi_detect - there is no real detection, it just
returns if panel is attached,
- DSI attach/detach callbacks attaches/detaches DRM panel and sets
connector status and other context fields accordingly, all this is
performed under mutex, as these callbacks are asynchronous.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 204 ++++++++++++++++----------------
 1 file changed, 103 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 3ae459f..515090f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,7 +254,6 @@ struct exynos_dsi {
 	struct drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
-	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct device *dev;
 
@@ -1329,12 +1328,13 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
+static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
+				      struct device *panel)
 {
 	int ret;
 	int te_gpio_irq;
 
-	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
+	dsi->te_gpio = of_get_named_gpio(panel->of_node, "te-gpios", 0);
 	if (dsi->te_gpio == -ENOENT)
 		return 0;
 
@@ -1374,85 +1374,6 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
 	}
 }
 
-static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
-				  struct mipi_dsi_device *device)
-{
-	struct exynos_dsi *dsi = host_to_dsi(host);
-
-	dsi->lanes = device->lanes;
-	dsi->format = device->format;
-	dsi->mode_flags = device->mode_flags;
-	dsi->panel_node = device->dev.of_node;
-
-	/*
-	 * This is a temporary solution and should be made by more generic way.
-	 *
-	 * If attached panel device is for command mode one, dsi should register
-	 * TE interrupt handler.
-	 */
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO)) {
-		int ret = exynos_dsi_register_te_irq(dsi);
-
-		if (ret)
-			return ret;
-	}
-
-	if (dsi->connector.dev)
-		drm_helper_hpd_irq_event(dsi->connector.dev);
-
-	return 0;
-}
-
-static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
-				  struct mipi_dsi_device *device)
-{
-	struct exynos_dsi *dsi = host_to_dsi(host);
-
-	exynos_dsi_unregister_te_irq(dsi);
-
-	dsi->panel_node = NULL;
-
-	if (dsi->connector.dev)
-		drm_helper_hpd_irq_event(dsi->connector.dev);
-
-	return 0;
-}
-
-static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
-				        const struct mipi_dsi_msg *msg)
-{
-	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct exynos_dsi_transfer xfer;
-	int ret;
-
-	if (!(dsi->state & DSIM_STATE_ENABLED))
-		return -EINVAL;
-
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = exynos_dsi_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
-
-	ret = mipi_dsi_create_packet(&xfer.packet, msg);
-	if (ret < 0)
-		return ret;
-
-	xfer.rx_len = msg->rx_len;
-	xfer.rx_payload = msg->rx_buf;
-	xfer.flags = msg->flags;
-
-	ret = exynos_dsi_transfer(dsi, &xfer);
-	return (ret < 0) ? ret : xfer.rx_done;
-}
-
-static const struct mipi_dsi_host_ops exynos_dsi_ops = {
-	.attach = exynos_dsi_host_attach,
-	.detach = exynos_dsi_host_detach,
-	.transfer = exynos_dsi_host_transfer,
-};
-
 static void exynos_dsi_enable(struct drm_encoder *encoder)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
@@ -1508,25 +1429,7 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 static enum drm_connector_status
 exynos_dsi_detect(struct drm_connector *connector, bool force)
 {
-	struct exynos_dsi *dsi = connector_to_dsi(connector);
-
-	if (!dsi->panel) {
-		dsi->panel = of_drm_find_panel(dsi->panel_node);
-		if (dsi->panel)
-			drm_panel_attach(dsi->panel, &dsi->connector);
-	} else if (!dsi->panel_node) {
-		struct drm_encoder *encoder;
-
-		encoder = platform_get_drvdata(to_platform_device(dsi->dev));
-		exynos_dsi_disable(encoder);
-		drm_panel_detach(dsi->panel);
-		dsi->panel = NULL;
-	}
-
-	if (dsi->panel)
-		return connector_status_connected;
-
-	return connector_status_disconnected;
+	return connector->status;
 }
 
 static void exynos_dsi_connector_destroy(struct drm_connector *connector)
@@ -1576,6 +1479,7 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
 		return ret;
 	}
 
+	connector->status = connector_status_disconnected;
 	drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
 	drm_mode_connector_attach_encoder(connector, encoder);
 
@@ -1612,6 +1516,104 @@ static const struct drm_encoder_funcs exynos_dsi_encoder_funcs = {
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
+static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
+				  struct mipi_dsi_device *device)
+{
+	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct drm_device *drm = dsi->connector.dev;
+
+	/*
+	 * This is a temporary solution and should be made by more generic way.
+	 *
+	 * If attached panel device is for command mode one, dsi should register
+	 * TE interrupt handler.
+	 */
+	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
+		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
+
+		if (ret)
+			return ret;
+	}
+
+	mutex_lock(&drm->mode_config.mutex);
+
+	dsi->lanes = device->lanes;
+	dsi->format = device->format;
+	dsi->mode_flags = device->mode_flags;
+	dsi->panel = of_drm_find_panel(device->dev.of_node);
+	if (dsi->panel) {
+		drm_panel_attach(dsi->panel, &dsi->connector);
+		dsi->connector.status = connector_status_connected;
+	}
+
+	mutex_unlock(&drm->mode_config.mutex);
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	return 0;
+}
+
+static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
+				  struct mipi_dsi_device *device)
+{
+	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct drm_device *drm = dsi->connector.dev;
+
+	mutex_lock(&drm->mode_config.mutex);
+
+	if (dsi->panel) {
+		exynos_dsi_disable(&dsi->encoder);
+		drm_panel_detach(dsi->panel);
+		dsi->panel = NULL;
+		dsi->connector.status = connector_status_disconnected;
+	}
+
+	mutex_unlock(&drm->mode_config.mutex);
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	exynos_dsi_unregister_te_irq(dsi);
+
+	return 0;
+}
+
+static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
+					const struct mipi_dsi_msg *msg)
+{
+	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct exynos_dsi_transfer xfer;
+	int ret;
+
+	if (!(dsi->state & DSIM_STATE_ENABLED))
+		return -EINVAL;
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = exynos_dsi_init(dsi);
+		if (ret)
+			return ret;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
+
+	ret = mipi_dsi_create_packet(&xfer.packet, msg);
+	if (ret < 0)
+		return ret;
+
+	xfer.rx_len = msg->rx_len;
+	xfer.rx_payload = msg->rx_buf;
+	xfer.flags = msg->flags;
+
+	ret = exynos_dsi_transfer(dsi, &xfer);
+	return (ret < 0) ? ret : xfer.rx_done;
+}
+
+static const struct mipi_dsi_host_ops exynos_dsi_ops = {
+	.attach = exynos_dsi_host_attach,
+	.detach = exynos_dsi_host_detach,
+	.transfer = exynos_dsi_host_transfer,
+};
+
 static int exynos_dsi_of_read_u32(const struct device_node *np,
 				  const char *propname, u32 *out_value)
 {
-- 
2.7.4
