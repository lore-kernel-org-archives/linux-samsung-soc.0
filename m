From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 17/23] drm/exynos: remove struct exynos_drm_display
Date: Tue, 23 Jun 2015 18:35:30 -0300
Message-ID: <1435095336-6196-18-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:32945 "EHLO
	mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933352AbbFWVgg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:36:36 -0400
Received: by qkhu186 with SMTP id u186so12218994qkh.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:36:35 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

This struct was just representing encoder information, it was a member of
struct exynos_drm_encoder, so any code trying to access encoder data would
have to go through the encoder struct, get the display struct and then get
the data it want.

During this patchset we also realized that the only data
exynos_drm_encoder needs to store is the drm_encoder parent and the
exynos_drm_encoder_ops.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c  | 17 ++++---
 drivers/gpu/drm/exynos/exynos_dp_core.c     | 46 +++++++++---------
 drivers/gpu/drm/exynos/exynos_dp_core.h     |  3 +-
 drivers/gpu/drm/exynos/exynos_drm_core.c    | 23 ++++-----
 drivers/gpu/drm/exynos/exynos_drm_crtc.c    |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h    |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     | 41 ++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_drv.h     | 47 ++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 57 +++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c | 75 ++++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_encoder.h |  6 +--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    | 18 +++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    | 43 +++++------------
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 47 +++++++++---------
 14 files changed, 176 insertions(+), 251 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 5057d70..ea99940 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -61,7 +61,7 @@ struct decon_context {
 	atomic_t			wait_vsync_event;
 
 	struct exynos_drm_panel_info panel;
-	struct exynos_drm_display *display;
+	struct exynos_drm_encoder *encoder;
 };
 
 static const struct of_device_id decon_driver_dt_match[] = {
@@ -690,8 +690,9 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	if (ctx->display)
-		exynos_drm_create_enc_conn(drm_dev, ctx->display);
+	if (ctx->encoder)
+		exynos_drm_create_enc_conn(drm_dev, ctx->encoder,
+					   EXYNOS_DISPLAY_TYPE_LCD);
 
 	return 0;
 
@@ -704,8 +705,8 @@ static void decon_unbind(struct device *dev, struct device *master,
 
 	decon_disable(ctx->crtc);
 
-	if (ctx->display)
-		exynos_dpi_remove(ctx->display);
+	if (ctx->encoder)
+		exynos_dpi_remove(ctx->encoder);
 
 	decon_ctx_remove(ctx);
 }
@@ -790,9 +791,9 @@ static int decon_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	ctx->display = exynos_dpi_probe(dev);
-	if (IS_ERR(ctx->display)) {
-		ret = PTR_ERR(ctx->display);
+	ctx->encoder = exynos_dpi_probe(dev);
+	if (IS_ERR(ctx->encoder)) {
+		ret = PTR_ERR(ctx->encoder);
 		goto err_iounmap;
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index d46c781..8614b4f 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -39,13 +39,13 @@
 
 static inline struct exynos_drm_crtc *dp_to_crtc(struct exynos_dp_device *dp)
 {
-	return to_exynos_crtc(dp->encoder->crtc);
+	return to_exynos_crtc(dp->encoder.base.crtc);
 }
 
-static inline struct exynos_dp_device *
-display_to_dp(struct exynos_drm_display *d)
+static inline struct exynos_dp_device *encoder_to_dp(
+						struct exynos_drm_encoder *e)
 {
-	return container_of(d, struct exynos_dp_device, display);
+	return container_of(e, struct exynos_dp_device, encoder);
 }
 
 struct bridge_init {
@@ -892,9 +892,9 @@ static void exynos_dp_hotplug(struct work_struct *work)
 		drm_helper_hpd_irq_event(dp->drm_dev);
 }
 
-static void exynos_dp_commit(struct exynos_drm_display *display)
+static void exynos_dp_commit(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dp_device *dp = display_to_dp(display);
+	struct exynos_dp_device *dp = encoder_to_dp(encoder);
 	int ret;
 
 	/* Keep the panel disabled while we configure video */
@@ -995,7 +995,7 @@ static struct drm_encoder *exynos_dp_best_encoder(
 {
 	struct exynos_dp_device *dp = ctx_from_connector(connector);
 
-	return dp->encoder;
+	return &dp->encoder.base;
 }
 
 static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
@@ -1020,15 +1020,13 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 	return 0;
 }
 
-static int exynos_dp_create_connector(struct exynos_drm_display *display,
-				struct drm_encoder *encoder)
+static int exynos_dp_create_connector(struct exynos_drm_encoder *exynos_encoder)
 {
-	struct exynos_dp_device *dp = display_to_dp(display);
+	struct exynos_dp_device *dp = encoder_to_dp(exynos_encoder);
+	struct drm_encoder *encoder = &exynos_encoder->base;
 	struct drm_connector *connector = &dp->connector;
 	int ret;
 
-	dp->encoder = encoder;
-
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (dp->bridge) {
 		ret = exynos_drm_attach_lcd_bridge(dp, encoder);
@@ -1055,9 +1053,9 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	return ret;
 }
 
-static void exynos_dp_enable(struct exynos_drm_display *display)
+static void exynos_dp_enable(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dp_device *dp = display_to_dp(display);
+	struct exynos_dp_device *dp = encoder_to_dp(encoder);
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
@@ -1077,12 +1075,12 @@ static void exynos_dp_enable(struct exynos_drm_display *display)
 	phy_power_on(dp->phy);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
-	exynos_dp_commit(&dp->display);
+	exynos_dp_commit(&dp->encoder);
 }
 
-static void exynos_dp_disable(struct exynos_drm_display *display)
+static void exynos_dp_disable(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dp_device *dp = display_to_dp(display);
+	struct exynos_dp_device *dp = encoder_to_dp(encoder);
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	if (dp->panel) {
@@ -1106,7 +1104,7 @@ static void exynos_dp_disable(struct exynos_drm_display *display)
 	}
 }
 
-static struct exynos_drm_display_ops exynos_dp_display_ops = {
+static struct exynos_drm_encoder_ops exynos_dp_encoder_ops = {
 	.create_connector = exynos_dp_create_connector,
 	.enable = exynos_dp_enable,
 	.disable = exynos_dp_disable,
@@ -1281,7 +1279,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	return exynos_drm_create_enc_conn(drm_dev, &dp->display);
+	return exynos_drm_create_enc_conn(drm_dev, &dp->encoder,
+					  EXYNOS_DISPLAY_TYPE_LCD);
 }
 
 static void exynos_dp_unbind(struct device *dev, struct device *master,
@@ -1289,7 +1288,7 @@ static void exynos_dp_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_disable(&dp->display);
+	exynos_dp_disable(&dp->encoder);
 }
 
 static const struct component_ops exynos_dp_ops = {
@@ -1308,8 +1307,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	dp->display.type = EXYNOS_DISPLAY_TYPE_LCD;
-	dp->display.ops = &exynos_dp_display_ops;
+	dp->encoder.ops = &exynos_dp_encoder_ops;
 	platform_set_drvdata(pdev, dp);
 
 	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
@@ -1347,7 +1345,7 @@ static int exynos_dp_suspend(struct device *dev)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_disable(&dp->display);
+	exynos_dp_disable(&dp->encoder);
 	return 0;
 }
 
@@ -1355,7 +1353,7 @@ static int exynos_dp_resume(struct device *dev)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_enable(&dp->display);
+	exynos_dp_enable(&dp->encoder);
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index a4e7996..f8cc202 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -147,11 +147,10 @@ struct link_train {
 };
 
 struct exynos_dp_device {
-	struct exynos_drm_display display;
+	struct exynos_drm_encoder encoder;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
 	struct drm_connector	connector;
-	struct drm_encoder	*encoder;
 	struct drm_panel	*panel;
 	struct drm_bridge	*bridge;
 	struct clk		*clock;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_core.c b/drivers/gpu/drm/exynos/exynos_drm_core.c
index 4c9f972..e386452 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_core.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_core.c
@@ -21,38 +21,33 @@
 static LIST_HEAD(exynos_drm_subdrv_list);
 
 int exynos_drm_create_enc_conn(struct drm_device *dev,
-					struct exynos_drm_display *display)
+			       struct exynos_drm_encoder *exynos_encoder,
+			       enum exynos_drm_output_type type)
 {
-	struct drm_encoder *encoder;
 	int ret;
 	unsigned long possible_crtcs = 0;
 
-	ret = exynos_drm_crtc_get_pipe_from_type(dev, display->type);
+	ret = exynos_drm_crtc_get_pipe_from_type(dev, type);
 	if (ret < 0)
 		return ret;
 
 	possible_crtcs |= 1 << ret;
 
 	/* create and initialize a encoder for this sub driver. */
-	encoder = exynos_drm_encoder_create(dev, display, possible_crtcs);
-	if (!encoder) {
+	ret = exynos_drm_encoder_create(dev, exynos_encoder, possible_crtcs);
+	if (ret) {
 		DRM_ERROR("failed to create encoder\n");
-		return -EFAULT;
+		return ret;
 	}
 
-	display->encoder = encoder;
-
-	ret = display->ops->create_connector(display, encoder);
+	ret = exynos_encoder->ops->create_connector(exynos_encoder);
 	if (ret) {
 		DRM_ERROR("failed to create connector ret = %d\n", ret);
-		goto err_destroy_encoder;
+		drm_encoder_cleanup(&exynos_encoder->base);
+		return ret;
 	}
 
 	return 0;
-
-err_destroy_encoder:
-	encoder->funcs->destroy(encoder);
-	return ret;
 }
 
 int exynos_drm_subdrv_register(struct exynos_drm_subdrv *subdrv)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 88a50b7..c872860 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -219,7 +219,7 @@ void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
 }
 
 int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
-					unsigned int out_type)
+				       enum exynos_drm_output_type out_type)
 {
 	struct drm_crtc *crtc;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index d01d49a..9e7027d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -30,7 +30,7 @@ void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb);
 
 /* This function gets pipe value to crtc device matched with out_type. */
 int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
-					unsigned int out_type);
+				       enum exynos_drm_output_type out_type);
 
 /*
  * This function calls the crtc device(manager)'s te_handler() callback
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index e042670..60a3161 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -23,22 +23,21 @@
 #include "exynos_drm_drv.h"
 
 struct exynos_dpi {
-	struct exynos_drm_display display;
+	struct exynos_drm_encoder encoder;
 	struct device *dev;
 	struct device_node *panel_node;
 
 	struct drm_panel *panel;
 	struct drm_connector connector;
-	struct drm_encoder *encoder;
 
 	struct videomode *vm;
 };
 
 #define connector_to_dpi(c) container_of(c, struct exynos_dpi, connector)
 
-static inline struct exynos_dpi *display_to_dpi(struct exynos_drm_display *d)
+static inline struct exynos_dpi *encoder_to_dpi(struct exynos_drm_encoder *e)
 {
-	return container_of(d, struct exynos_dpi, display);
+	return container_of(e, struct exynos_dpi, encoder);
 }
 
 static enum drm_connector_status
@@ -98,7 +97,7 @@ exynos_dpi_best_encoder(struct drm_connector *connector)
 {
 	struct exynos_dpi *ctx = connector_to_dpi(connector);
 
-	return ctx->encoder;
+	return &ctx->encoder.base;
 }
 
 static struct drm_connector_helper_funcs exynos_dpi_connector_helper_funcs = {
@@ -106,15 +105,14 @@ static struct drm_connector_helper_funcs exynos_dpi_connector_helper_funcs = {
 	.best_encoder = exynos_dpi_best_encoder,
 };
 
-static int exynos_dpi_create_connector(struct exynos_drm_display *display,
-				       struct drm_encoder *encoder)
+static int exynos_dpi_create_connector(
+				struct exynos_drm_encoder *exynos_encoder)
 {
-	struct exynos_dpi *ctx = display_to_dpi(display);
+	struct exynos_dpi *ctx = encoder_to_dpi(exynos_encoder);
+	struct drm_encoder *encoder = &exynos_encoder->base;
 	struct drm_connector *connector = &ctx->connector;
 	int ret;
 
-	ctx->encoder = encoder;
-
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
 	ret = drm_connector_init(encoder->dev, connector,
@@ -132,9 +130,9 @@ static int exynos_dpi_create_connector(struct exynos_drm_display *display,
 	return 0;
 }
 
-static void exynos_dpi_enable(struct exynos_drm_display *display)
+static void exynos_dpi_enable(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dpi *ctx = display_to_dpi(display);
+	struct exynos_dpi *ctx = encoder_to_dpi(encoder);
 
 	if (ctx->panel) {
 		drm_panel_prepare(ctx->panel);
@@ -142,9 +140,9 @@ static void exynos_dpi_enable(struct exynos_drm_display *display)
 	}
 }
 
-static void exynos_dpi_disable(struct exynos_drm_display *display)
+static void exynos_dpi_disable(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dpi *ctx = display_to_dpi(display);
+	struct exynos_dpi *ctx = encoder_to_dpi(encoder);
 
 	if (ctx->panel) {
 		drm_panel_disable(ctx->panel);
@@ -152,7 +150,7 @@ static void exynos_dpi_disable(struct exynos_drm_display *display)
 	}
 }
 
-static struct exynos_drm_display_ops exynos_dpi_display_ops = {
+static struct exynos_drm_encoder_ops exynos_dpi_encoder_ops = {
 	.create_connector = exynos_dpi_create_connector,
 	.enable = exynos_dpi_enable,
 	.disable = exynos_dpi_disable,
@@ -282,7 +280,7 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 	return 0;
 }
 
-struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
+struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev)
 {
 	struct exynos_dpi *ctx;
 	int ret;
@@ -291,8 +289,7 @@ struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ctx->display.type = EXYNOS_DISPLAY_TYPE_LCD;
-	ctx->display.ops = &exynos_dpi_display_ops;
+	ctx->encoder.ops = &exynos_dpi_encoder_ops;
 	ctx->dev = dev;
 
 	ret = exynos_dpi_parse_dt(ctx);
@@ -307,14 +304,14 @@ struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
 			return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	return &ctx->display;
+	return &ctx->encoder;
 }
 
-int exynos_dpi_remove(struct exynos_drm_display *display)
+int exynos_dpi_remove(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dpi *ctx = display_to_dpi(display);
+	struct exynos_dpi *ctx = encoder_to_dpi(encoder);
 
-	exynos_dpi_disable(&ctx->display);
+	exynos_dpi_disable(&ctx->encoder);
 
 	if (ctx->panel)
 		drm_panel_detach(ctx->panel);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index d9e4f28..4bd770a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -22,6 +22,7 @@
 #define MAX_PLANE	5
 #define MAX_FB_BUFFER	4
 
+#define to_exynos_encoder(x)	container_of(x, struct exynos_drm_encoder, base)
 #define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc, base)
 #define to_exynos_plane(x)	container_of(x, struct exynos_drm_plane, base)
 
@@ -77,7 +78,7 @@ struct exynos_drm_plane {
 };
 
 /*
- * Exynos DRM Display Structure.
+ * Exynos DRM Encoder Structure.
  *	- this structure is common to analog tv, digital tv and lcd panel.
  *
  * @create_connector: initialize and register a new connector
@@ -88,37 +89,30 @@ struct exynos_drm_plane {
  * @disable: display device off.
  * @commit: apply changes to hw
  */
-struct exynos_drm_display;
-struct exynos_drm_display_ops {
-	int (*create_connector)(struct exynos_drm_display *display,
-				struct drm_encoder *encoder);
-	void (*mode_fixup)(struct exynos_drm_display *display,
+struct exynos_drm_encoder;
+struct exynos_drm_encoder_ops {
+	int (*create_connector)(struct exynos_drm_encoder *encoder);
+	void (*mode_fixup)(struct exynos_drm_encoder *encoder,
 				struct drm_connector *connector,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
-	void (*mode_set)(struct exynos_drm_display *display,
+	void (*mode_set)(struct exynos_drm_encoder *encoder,
 				struct drm_display_mode *mode);
-	void (*enable)(struct exynos_drm_display *display);
-	void (*disable)(struct exynos_drm_display *display);
-	void (*commit)(struct exynos_drm_display *display);
+	void (*enable)(struct exynos_drm_encoder *encoder);
+	void (*disable)(struct exynos_drm_encoder *encoder);
+	void (*commit)(struct exynos_drm_encoder *encoder);
 };
 
 /*
- * Exynos drm display structure, maps 1:1 with an encoder/connector
+ * exynos specific encoder structure.
  *
- * @list: the list entry for this manager
+ * @drm_encoder: encoder object.
  * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
- * @encoder: encoder object this display maps to
- * @connector: connector object this display maps to
  * @ops: pointer to callbacks for exynos drm specific functionality
- * @ctx: A pointer to the display's implementation specific context
  */
-struct exynos_drm_display {
-	struct list_head list;
-	enum exynos_drm_output_type type;
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-	struct exynos_drm_display_ops *ops;
+struct exynos_drm_encoder {
+	struct drm_encoder		base;
+	struct exynos_drm_encoder_ops	*ops;
 };
 
 /*
@@ -268,12 +262,12 @@ int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file);
 void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
-struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
-int exynos_dpi_remove(struct exynos_drm_display *display);
+struct exynos_drm_encoder *exynos_dpi_probe(struct device *dev);
+int exynos_dpi_remove(struct exynos_drm_encoder *encoder);
 #else
-static inline struct exynos_drm_display *
+static inline struct exynos_drm_encoder *
 exynos_dpi_probe(struct device *dev) { return NULL; }
-static inline int exynos_dpi_remove(struct exynos_drm_display *display)
+static inline int exynos_dpi_remove(struct exynos_drm_encoder *encoder)
 {
 	return 0;
 }
@@ -283,7 +277,8 @@ void exynos_drm_atomic_work(struct work_struct *work);
 
 /* This function creates a encoder and a connector, and initializes them. */
 int exynos_drm_create_enc_conn(struct drm_device *dev,
-				struct exynos_drm_display *display);
+			       struct exynos_drm_encoder *encoder,
+			       enum exynos_drm_output_type type);
 
 extern struct platform_driver fimd_driver;
 extern struct platform_driver decon_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 58ab0a4..8ea6bbf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -270,7 +270,7 @@ struct exynos_dsi_driver_data {
 };
 
 struct exynos_dsi {
-	struct exynos_drm_display display;
+	struct exynos_drm_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
 	struct device_node *panel_node;
@@ -306,9 +306,9 @@ struct exynos_dsi {
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
-static inline struct exynos_dsi *display_to_dsi(struct exynos_drm_display *d)
+static inline struct exynos_dsi *encoder_to_dsi(struct exynos_drm_encoder *e)
 {
-	return container_of(d, struct exynos_dsi, display);
+	return container_of(e, struct exynos_dsi, encoder);
 }
 
 static struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
@@ -1118,7 +1118,7 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
 	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
-	struct drm_encoder *encoder = dsi->display.encoder;
+	struct drm_encoder *encoder = &dsi->encoder.base;
 
 	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
 		exynos_drm_crtc_te_handler(encoder->crtc);
@@ -1363,9 +1363,9 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
 		dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
 }
 
-static void exynos_dsi_enable(struct exynos_drm_display *display)
+static void exynos_dsi_enable(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dsi *dsi = display_to_dsi(display);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
@@ -1399,9 +1399,9 @@ static void exynos_dsi_enable(struct exynos_drm_display *display)
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
-static void exynos_dsi_disable(struct exynos_drm_display *display)
+static void exynos_dsi_disable(struct exynos_drm_encoder *encoder)
 {
-	struct exynos_dsi *dsi = display_to_dsi(display);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
@@ -1427,10 +1427,10 @@ exynos_dsi_detect(struct drm_connector *connector, bool force)
 		if (dsi->panel)
 			drm_panel_attach(dsi->panel, &dsi->connector);
 	} else if (!dsi->panel_node) {
-		struct exynos_drm_display *display;
+		struct exynos_drm_encoder *encoder;
 
-		display = platform_get_drvdata(to_platform_device(dsi->dev));
-		exynos_dsi_disable(display);
+		encoder = platform_get_drvdata(to_platform_device(dsi->dev));
+		exynos_dsi_disable(encoder);
 		drm_panel_detach(dsi->panel);
 		dsi->panel = NULL;
 	}
@@ -1473,7 +1473,7 @@ exynos_dsi_best_encoder(struct drm_connector *connector)
 {
 	struct exynos_dsi *dsi = connector_to_dsi(connector);
 
-	return dsi->display.encoder;
+	return &dsi->encoder.base;
 }
 
 static struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
@@ -1481,10 +1481,11 @@ static struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
 	.best_encoder = exynos_dsi_best_encoder,
 };
 
-static int exynos_dsi_create_connector(struct exynos_drm_display *display,
-				       struct drm_encoder *encoder)
+static int exynos_dsi_create_connector(
+				struct exynos_drm_encoder *exynos_encoder)
 {
-	struct exynos_dsi *dsi = display_to_dsi(display);
+	struct exynos_dsi *dsi = encoder_to_dsi(exynos_encoder);
+	struct drm_encoder *encoder = &exynos_encoder->base;
 	struct drm_connector *connector = &dsi->connector;
 	int ret;
 
@@ -1505,10 +1506,10 @@ static int exynos_dsi_create_connector(struct exynos_drm_display *display,
 	return 0;
 }
 
-static void exynos_dsi_mode_set(struct exynos_drm_display *display,
+static void exynos_dsi_mode_set(struct exynos_drm_encoder *encoder,
 			 struct drm_display_mode *mode)
 {
-	struct exynos_dsi *dsi = display_to_dsi(display);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct videomode *vm = &dsi->vm;
 
 	vm->hactive = mode->hdisplay;
@@ -1521,7 +1522,7 @@ static void exynos_dsi_mode_set(struct exynos_drm_display *display,
 	vm->hsync_len = mode->hsync_end - mode->hsync_start;
 }
 
-static struct exynos_drm_display_ops exynos_dsi_display_ops = {
+static struct exynos_drm_encoder_ops exynos_dsi_encoder_ops = {
 	.create_connector = exynos_dsi_create_connector,
 	.mode_set = exynos_dsi_mode_set,
 	.enable = exynos_dsi_enable,
@@ -1633,15 +1634,16 @@ end:
 static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_drm_display *display = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = display_to_dsi(display);
+	struct exynos_drm_encoder *encoder = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	ret = exynos_drm_create_enc_conn(drm_dev, display);
+	ret = exynos_drm_create_enc_conn(drm_dev, encoder,
+					 EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret) {
 		DRM_ERROR("Encoder create [%d] failed with %d\n",
-			  display->type, ret);
+			  EXYNOS_DISPLAY_TYPE_LCD, ret);
 		return ret;
 	}
 
@@ -1651,10 +1653,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_drm_display *display = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = display_to_dsi(display);
+	struct exynos_drm_encoder *encoder = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 
-	exynos_dsi_disable(display);
+	exynos_dsi_disable(encoder);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1675,8 +1677,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
-	dsi->display.type = EXYNOS_DISPLAY_TYPE_LCD;
-	dsi->display.ops = &exynos_dsi_display_ops;
+	dsi->encoder.ops = &exynos_dsi_encoder_ops;
 
 	/* To be checked as invalid one */
 	dsi->te_gpio = -ENOENT;
@@ -1744,7 +1745,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, &dsi->display);
+	platform_set_drvdata(pdev, &dsi->encoder);
 
 	return component_add(dev, &exynos_dsi_component_ops);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index 7ba3a2d..b9a1c93 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -18,20 +18,6 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_encoder.h"
 
-#define to_exynos_encoder(x)	container_of(x, struct exynos_drm_encoder,\
-				drm_encoder)
-
-/*
- * exynos specific encoder structure.
- *
- * @drm_encoder: encoder object.
- * @display: the display structure that maps to this encoder
- */
-struct exynos_drm_encoder {
-	struct drm_encoder		drm_encoder;
-	struct exynos_drm_display	*display;
-};
-
 static bool
 exynos_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 			       const struct drm_display_mode *mode,
@@ -39,16 +25,16 @@ exynos_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 {
 	struct drm_device *dev = encoder->dev;
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-	struct exynos_drm_display *display = exynos_encoder->display;
 	struct drm_connector *connector;
 
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		if (connector->encoder != encoder)
 			continue;
 
-		if (display->ops->mode_fixup)
-			display->ops->mode_fixup(display, connector, mode,
-					adjusted_mode);
+		if (exynos_encoder->ops->mode_fixup)
+			exynos_encoder->ops->mode_fixup(exynos_encoder,
+							connector, mode,
+							adjusted_mode);
 	}
 
 	return true;
@@ -59,31 +45,28 @@ static void exynos_drm_encoder_mode_set(struct drm_encoder *encoder,
 					 struct drm_display_mode *adjusted_mode)
 {
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-	struct exynos_drm_display *display = exynos_encoder->display;
 
-	if (display->ops->mode_set)
-		display->ops->mode_set(display, adjusted_mode);
+	if (exynos_encoder->ops->mode_set)
+		exynos_encoder->ops->mode_set(exynos_encoder, adjusted_mode);
 }
 
 static void exynos_drm_encoder_enable(struct drm_encoder *encoder)
 {
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-	struct exynos_drm_display *display = exynos_encoder->display;
 
-	if (display->ops->enable)
-		display->ops->enable(display);
+	if (exynos_encoder->ops->enable)
+		exynos_encoder->ops->enable(exynos_encoder);
 
-	if (display->ops->commit)
-		display->ops->commit(display);
+	if (exynos_encoder->ops->commit)
+		exynos_encoder->ops->commit(exynos_encoder);
 }
 
 static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
 {
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-	struct exynos_drm_display *display = exynos_encoder->display;
 
-	if (display->ops->disable)
-		display->ops->disable(display);
+	if (exynos_encoder->ops->disable)
+		exynos_encoder->ops->disable(exynos_encoder);
 }
 
 static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
@@ -93,16 +76,8 @@ static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
 	.disable	= exynos_drm_encoder_disable,
 };
 
-static void exynos_drm_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
-
-	drm_encoder_cleanup(encoder);
-	kfree(exynos_encoder);
-}
-
 static struct drm_encoder_funcs exynos_encoder_funcs = {
-	.destroy = exynos_drm_encoder_destroy,
+	.destroy = drm_encoder_cleanup,
 };
 
 void exynos_drm_encoder_setup(struct drm_device *dev)
@@ -118,23 +93,16 @@ void exynos_drm_encoder_setup(struct drm_device *dev)
 		encoder->possible_clones = clone_mask;
 }
 
-struct drm_encoder *
-exynos_drm_encoder_create(struct drm_device *dev,
-			   struct exynos_drm_display *display,
-			   unsigned long possible_crtcs)
+int exynos_drm_encoder_create(struct drm_device *dev,
+			      struct exynos_drm_encoder *exynos_encoder,
+			      unsigned long possible_crtcs)
 {
 	struct drm_encoder *encoder;
-	struct exynos_drm_encoder *exynos_encoder;
 
 	if (!possible_crtcs)
-		return NULL;
-
-	exynos_encoder = kzalloc(sizeof(*exynos_encoder), GFP_KERNEL);
-	if (!exynos_encoder)
-		return NULL;
+		return -EINVAL;
 
-	exynos_encoder->display = display;
-	encoder = &exynos_encoder->drm_encoder;
+	encoder = &exynos_encoder->base;
 	encoder->possible_crtcs = possible_crtcs;
 
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
@@ -146,10 +114,5 @@ exynos_drm_encoder_create(struct drm_device *dev,
 
 	DRM_DEBUG_KMS("encoder has been created\n");
 
-	return encoder;
-}
-
-struct exynos_drm_display *exynos_drm_get_display(struct drm_encoder *encoder)
-{
-	return to_exynos_encoder(encoder)->display;
+	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.h b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
index 26305d8..005f583 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
@@ -15,9 +15,7 @@
 #define _EXYNOS_DRM_ENCODER_H_
 
 void exynos_drm_encoder_setup(struct drm_device *dev);
-struct drm_encoder *exynos_drm_encoder_create(struct drm_device *dev,
-			struct exynos_drm_display *mgr,
-			unsigned long possible_crtcs);
-struct exynos_drm_display *exynos_drm_get_display(struct drm_encoder *encoder);
+int exynos_drm_encoder_create(struct drm_device *dev, struct exynos_drm_encoder
+			      *encoder, unsigned long possible_crtcs);
 
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 359685f..4a948af 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -168,7 +168,7 @@ struct fimd_context {
 
 	struct exynos_drm_panel_info panel;
 	struct fimd_driver_data *driver_data;
-	struct exynos_drm_display *display;
+	struct exynos_drm_encoder *encoder;
 };
 
 static const struct of_device_id fimd_driver_dt_match[] = {
@@ -973,8 +973,9 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(ctx->crtc))
 		return PTR_ERR(ctx->crtc);
 
-	if (ctx->display)
-		exynos_drm_create_enc_conn(drm_dev, ctx->display);
+	if (ctx->encoder)
+		exynos_drm_create_enc_conn(drm_dev, ctx->encoder,
+					   EXYNOS_DISPLAY_TYPE_LCD);
 
 	return fimd_iommu_attach_devices(ctx, drm_dev);
 }
@@ -988,8 +989,8 @@ static void fimd_unbind(struct device *dev, struct device *master,
 
 	fimd_iommu_detach_devices(ctx);
 
-	if (ctx->display)
-		exynos_dpi_remove(ctx->display);
+	if (ctx->encoder)
+		exynos_dpi_remove(ctx->encoder);
 }
 
 static const struct component_ops fimd_component_ops = {
@@ -1096,10 +1097,9 @@ static int fimd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	ctx->display = exynos_dpi_probe(dev);
-	if (IS_ERR(ctx->display)) {
-		return PTR_ERR(ctx->display);
-	}
+	ctx->encoder = exynos_dpi_probe(dev);
+	if (IS_ERR(ctx->encoder))
+		return PTR_ERR(ctx->encoder);
 
 	pm_runtime_enable(dev);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index ade59ee..d7f9501 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -35,11 +35,10 @@
 					connector)
 
 struct vidi_context {
-	struct exynos_drm_display	display;
+	struct exynos_drm_encoder	encoder;
 	struct platform_device		*pdev;
 	struct drm_device		*drm_dev;
 	struct exynos_drm_crtc		*crtc;
-	struct drm_encoder		*encoder;
 	struct drm_connector		connector;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct edid			*raw_edid;
@@ -55,9 +54,9 @@ struct vidi_context {
 	int				pipe;
 };
 
-static inline struct vidi_context *display_to_vidi(struct exynos_drm_display *d)
+static inline struct vidi_context *encoder_to_vidi(struct exynos_drm_encoder *e)
 {
-	return container_of(d, struct vidi_context, display);
+	return container_of(e, struct vidi_context, encoder);
 }
 
 static const char fake_edid_info[] = {
@@ -254,9 +253,7 @@ static DEVICE_ATTR(connection, 0644, vidi_show_connection,
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct vidi_context *ctx = NULL;
-	struct drm_encoder *encoder;
-	struct exynos_drm_display *display;
+	struct vidi_context *ctx = dev_get_drvdata(drm_dev->dev);
 	struct drm_exynos_vidi_connection *vidi = data;
 
 	if (!vidi) {
@@ -269,21 +266,6 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
-	list_for_each_entry(encoder, &drm_dev->mode_config.encoder_list,
-								head) {
-		display = exynos_drm_get_display(encoder);
-
-		if (display->type == EXYNOS_DISPLAY_TYPE_VIDI) {
-			ctx = display_to_vidi(display);
-			break;
-		}
-	}
-
-	if (!ctx) {
-		DRM_DEBUG_KMS("not found virtual device type encoder.\n");
-		return -EINVAL;
-	}
-
 	if (ctx->connected == vidi->connection) {
 		DRM_DEBUG_KMS("same connection request.\n");
 		return -EINVAL;
@@ -376,7 +358,7 @@ static struct drm_encoder *vidi_best_encoder(struct drm_connector *connector)
 {
 	struct vidi_context *ctx = ctx_from_connector(connector);
 
-	return ctx->encoder;
+	return &ctx->encoder.base;
 }
 
 static struct drm_connector_helper_funcs vidi_connector_helper_funcs = {
@@ -384,14 +366,13 @@ static struct drm_connector_helper_funcs vidi_connector_helper_funcs = {
 	.best_encoder = vidi_best_encoder,
 };
 
-static int vidi_create_connector(struct exynos_drm_display *display,
-				struct drm_encoder *encoder)
+static int vidi_create_connector(struct exynos_drm_encoder *exynos_encoder)
 {
-	struct vidi_context *ctx = display_to_vidi(display);
+	struct vidi_context *ctx = encoder_to_vidi(exynos_encoder);
+	struct drm_encoder *encoder = &exynos_encoder->base;
 	struct drm_connector *connector = &ctx->connector;
 	int ret;
 
-	ctx->encoder = encoder;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
 	ret = drm_connector_init(ctx->drm_dev, connector,
@@ -409,7 +390,7 @@ static int vidi_create_connector(struct exynos_drm_display *display,
 }
 
 
-static struct exynos_drm_display_ops vidi_display_ops = {
+static struct exynos_drm_encoder_ops vidi_encoder_ops = {
 	.create_connector = vidi_create_connector,
 };
 
@@ -442,7 +423,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	ret = exynos_drm_create_enc_conn(drm_dev, &ctx->display);
+	ret = exynos_drm_create_enc_conn(drm_dev, &ctx->encoder,
+					 EXYNOS_DISPLAY_TYPE_VIDI);
 	if (ret) {
 		ctx->crtc->base.funcs->destroy(&ctx->crtc->base);
 		return ret;
@@ -470,8 +452,7 @@ static int vidi_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->display.type = EXYNOS_DISPLAY_TYPE_VIDI;
-	ctx->display.ops = &vidi_display_ops;
+	ctx->encoder.ops = &vidi_encoder_ops;
 	ctx->default_win = 0;
 	ctx->pdev = pdev;
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index bb40538..a0443dc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -182,11 +182,10 @@ struct hdmi_conf_regs {
 };
 
 struct hdmi_context {
-	struct exynos_drm_display	display;
+	struct exynos_drm_encoder	encoder;
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct drm_connector		connector;
-	struct drm_encoder		*encoder;
 	bool				hpd;
 	bool				powered;
 	bool				dvi_mode;
@@ -214,9 +213,9 @@ struct hdmi_context {
 	enum hdmi_type			type;
 };
 
-static inline struct hdmi_context *display_to_hdmi(struct exynos_drm_display *d)
+static inline struct hdmi_context *encoder_to_hdmi(struct exynos_drm_encoder *e)
 {
-	return container_of(d, struct hdmi_context, display);
+	return container_of(e, struct hdmi_context, encoder);
 }
 
 struct hdmiphy_config {
@@ -1120,7 +1119,7 @@ static struct drm_encoder *hdmi_best_encoder(struct drm_connector *connector)
 {
 	struct hdmi_context *hdata = ctx_from_connector(connector);
 
-	return hdata->encoder;
+	return &hdata->encoder.base;
 }
 
 static struct drm_connector_helper_funcs hdmi_connector_helper_funcs = {
@@ -1129,14 +1128,12 @@ static struct drm_connector_helper_funcs hdmi_connector_helper_funcs = {
 	.best_encoder = hdmi_best_encoder,
 };
 
-static int hdmi_create_connector(struct exynos_drm_display *display,
-			struct drm_encoder *encoder)
+static int hdmi_create_connector(struct exynos_drm_encoder *exynos_encoder)
 {
-	struct hdmi_context *hdata = display_to_hdmi(display);
+	struct hdmi_context *hdata = encoder_to_hdmi(exynos_encoder);
 	struct drm_connector *connector = &hdata->connector;
 	int ret;
 
-	hdata->encoder = encoder;
 	connector->interlace_allowed = true;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
@@ -1149,12 +1146,12 @@ static int hdmi_create_connector(struct exynos_drm_display *display,
 
 	drm_connector_helper_add(connector, &hdmi_connector_helper_funcs);
 	drm_connector_register(connector);
-	drm_mode_connector_attach_encoder(connector, encoder);
+	drm_mode_connector_attach_encoder(connector, &exynos_encoder->base);
 
 	return 0;
 }
 
-static void hdmi_mode_fixup(struct exynos_drm_display *display,
+static void hdmi_mode_fixup(struct exynos_drm_encoder *encoder,
 				struct drm_connector *connector,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
@@ -2002,10 +1999,10 @@ static void hdmi_v14_mode_set(struct hdmi_context *hdata,
 	hdmi_set_reg(tg->tg_3d, 1, 0x0);
 }
 
-static void hdmi_mode_set(struct exynos_drm_display *display,
+static void hdmi_mode_set(struct exynos_drm_encoder *encoder,
 			struct drm_display_mode *mode)
 {
-	struct hdmi_context *hdata = display_to_hdmi(display);
+	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct drm_display_mode *m = mode;
 
 	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%s\n",
@@ -2022,9 +2019,9 @@ static void hdmi_mode_set(struct exynos_drm_display *display,
 		hdmi_v14_mode_set(hdata, mode);
 }
 
-static void hdmi_commit(struct exynos_drm_display *display)
+static void hdmi_commit(struct exynos_drm_encoder *encoder)
 {
-	struct hdmi_context *hdata = display_to_hdmi(display);
+	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 
 	mutex_lock(&hdata->hdmi_mutex);
 	if (!hdata->powered) {
@@ -2036,9 +2033,9 @@ static void hdmi_commit(struct exynos_drm_display *display)
 	hdmi_conf_apply(hdata);
 }
 
-static void hdmi_enable(struct exynos_drm_display *display)
+static void hdmi_enable(struct exynos_drm_encoder *encoder)
 {
-	struct hdmi_context *hdata = display_to_hdmi(display);
+	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct hdmi_resources *res = &hdata->res;
 
 	mutex_lock(&hdata->hdmi_mutex);
@@ -2064,14 +2061,14 @@ static void hdmi_enable(struct exynos_drm_display *display)
 	clk_prepare_enable(res->sclk_hdmi);
 
 	hdmiphy_poweron(hdata);
-	hdmi_commit(display);
+	hdmi_commit(encoder);
 }
 
-static void hdmi_disable(struct exynos_drm_display *display)
+static void hdmi_disable(struct exynos_drm_encoder *encoder)
 {
-	struct hdmi_context *hdata = display_to_hdmi(display);
+	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct hdmi_resources *res = &hdata->res;
-	struct drm_crtc *crtc = hdata->encoder->crtc;
+	struct drm_crtc *crtc = hdata->encoder.base.crtc;
 	const struct drm_crtc_helper_funcs *funcs = NULL;
 
 	mutex_lock(&hdata->hdmi_mutex);
@@ -2118,7 +2115,7 @@ out:
 	mutex_unlock(&hdata->hdmi_mutex);
 }
 
-static struct exynos_drm_display_ops hdmi_display_ops = {
+static struct exynos_drm_encoder_ops hdmi_encoder_ops = {
 	.create_connector = hdmi_create_connector,
 	.mode_fixup	= hdmi_mode_fixup,
 	.mode_set	= hdmi_mode_set,
@@ -2285,7 +2282,8 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->drm_dev = drm_dev;
 
-	return exynos_drm_create_enc_conn(drm_dev, &hdata->display);
+	return exynos_drm_create_enc_conn(drm_dev, &hdata->encoder,
+					  EXYNOS_DISPLAY_TYPE_HDMI);
 }
 
 static void hdmi_unbind(struct device *dev, struct device *master, void *data)
@@ -2338,8 +2336,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	if (!hdata)
 		return -ENOMEM;
 
-	hdata->display.type = EXYNOS_DISPLAY_TYPE_HDMI;
-	hdata->display.ops = &hdmi_display_ops;
+	hdata->encoder.ops = &hdmi_encoder_ops;
 
 	mutex_init(&hdata->hdmi_mutex);
 
-- 
2.1.0
