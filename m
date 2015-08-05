From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2 01/11] drm/exynos: split display's .dpms() into .enable() and .disable()
Date: Wed,  5 Aug 2015 20:24:12 -0300
Message-ID: <1438817060-22164-2-git-send-email-gustavo@padovan.org>
References: <1438817060-22164-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f170.google.com ([209.85.160.170]:34150 "EHLO
	mail-yk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbbHEXYa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Aug 2015 19:24:30 -0400
Received: by ykax123 with SMTP id x123so49198500yka.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Aug 2015 16:24:29 -0700 (PDT)
In-Reply-To: <1438817060-22164-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The DRM Core doesn't have a dpms() operation anymore, everything
now is enable() or disable().

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

---
v2: set dp->dpms_mode after enable/disable
---
 drivers/gpu/drm/exynos/exynos_dp_core.c     | 34 ++++-----------
 drivers/gpu/drm/exynos/exynos_drm_dpi.c     | 36 ++++------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h     |  6 ++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 44 ++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_encoder.c |  8 ++--
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 65 ++++++++++-------------------
 6 files changed, 62 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 172b800..b3bf210 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1066,8 +1066,9 @@ static void exynos_dp_phy_exit(struct exynos_dp_device *dp)
 		phy_power_off(dp->phy);
 }
 
-static void exynos_dp_poweron(struct exynos_dp_device *dp)
+static void exynos_dp_enable(struct exynos_drm_display *display)
 {
+	struct exynos_dp_device *dp = display_to_dp(display);
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
@@ -1090,8 +1091,9 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
 	exynos_dp_commit(&dp->display);
 }
 
-static void exynos_dp_poweroff(struct exynos_dp_device *dp)
+static void exynos_dp_disable(struct exynos_drm_display *display)
 {
+	struct exynos_dp_device *dp = display_to_dp(display);
 	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
@@ -1118,28 +1120,10 @@ static void exynos_dp_poweroff(struct exynos_dp_device *dp)
 	}
 }
 
-static void exynos_dp_dpms(struct exynos_drm_display *display, int mode)
-{
-	struct exynos_dp_device *dp = display_to_dp(display);
-
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		exynos_dp_poweron(dp);
-		break;
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
-	case DRM_MODE_DPMS_OFF:
-		exynos_dp_poweroff(dp);
-		break;
-	default:
-		break;
-	}
-	dp->dpms_mode = mode;
-}
-
 static struct exynos_drm_display_ops exynos_dp_display_ops = {
 	.create_connector = exynos_dp_create_connector,
-	.dpms = exynos_dp_dpms,
+	.enable = exynos_dp_enable,
+	.disable = exynos_dp_disable,
 	.commit = exynos_dp_commit,
 };
 
@@ -1319,7 +1303,7 @@ static void exynos_dp_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_dpms(&dp->display, DRM_MODE_DPMS_OFF);
+	exynos_dp_disable(&dp->display);
 }
 
 static const struct component_ops exynos_dp_ops = {
@@ -1377,7 +1361,7 @@ static int exynos_dp_suspend(struct device *dev)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_dpms(&dp->display, DRM_MODE_DPMS_OFF);
+	exynos_dp_disable(&dp->display);
 	return 0;
 }
 
@@ -1385,7 +1369,7 @@ static int exynos_dp_resume(struct device *dev)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
-	exynos_dp_dpms(&dp->display, DRM_MODE_DPMS_ON);
+	exynos_dp_enable(&dp->display);
 	return 0;
 }
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 7cb6595..e042670 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -32,7 +32,6 @@ struct exynos_dpi {
 	struct drm_encoder *encoder;
 
 	struct videomode *vm;
-	int dpms_mode;
 };
 
 #define connector_to_dpi(c) container_of(c, struct exynos_dpi, connector)
@@ -133,46 +132,30 @@ static int exynos_dpi_create_connector(struct exynos_drm_display *display,
 	return 0;
 }
 
-static void exynos_dpi_poweron(struct exynos_dpi *ctx)
+static void exynos_dpi_enable(struct exynos_drm_display *display)
 {
+	struct exynos_dpi *ctx = display_to_dpi(display);
+
 	if (ctx->panel) {
 		drm_panel_prepare(ctx->panel);
 		drm_panel_enable(ctx->panel);
 	}
 }
 
-static void exynos_dpi_poweroff(struct exynos_dpi *ctx)
+static void exynos_dpi_disable(struct exynos_drm_display *display)
 {
+	struct exynos_dpi *ctx = display_to_dpi(display);
+
 	if (ctx->panel) {
 		drm_panel_disable(ctx->panel);
 		drm_panel_unprepare(ctx->panel);
 	}
 }
 
-static void exynos_dpi_dpms(struct exynos_drm_display *display, int mode)
-{
-	struct exynos_dpi *ctx = display_to_dpi(display);
-
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		if (ctx->dpms_mode != DRM_MODE_DPMS_ON)
-				exynos_dpi_poweron(ctx);
-			break;
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
-	case DRM_MODE_DPMS_OFF:
-		if (ctx->dpms_mode == DRM_MODE_DPMS_ON)
-			exynos_dpi_poweroff(ctx);
-		break;
-	default:
-		break;
-	}
-	ctx->dpms_mode = mode;
-}
-
 static struct exynos_drm_display_ops exynos_dpi_display_ops = {
 	.create_connector = exynos_dpi_create_connector,
-	.dpms = exynos_dpi_dpms
+	.enable = exynos_dpi_enable,
+	.disable = exynos_dpi_disable,
 };
 
 /* of_* functions will be removed after merge of of_graph patches */
@@ -311,7 +294,6 @@ struct exynos_drm_display *exynos_dpi_probe(struct device *dev)
 	ctx->display.type = EXYNOS_DISPLAY_TYPE_LCD;
 	ctx->display.ops = &exynos_dpi_display_ops;
 	ctx->dev = dev;
-	ctx->dpms_mode = DRM_MODE_DPMS_OFF;
 
 	ret = exynos_dpi_parse_dt(ctx);
 	if (ret < 0) {
@@ -332,7 +314,7 @@ int exynos_dpi_remove(struct exynos_drm_display *display)
 {
 	struct exynos_dpi *ctx = display_to_dpi(display);
 
-	exynos_dpi_dpms(&ctx->display, DRM_MODE_DPMS_OFF);
+	exynos_dpi_disable(&ctx->display);
 
 	if (ctx->panel)
 		drm_panel_detach(ctx->panel);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9f23db4..5c55606 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -86,7 +86,8 @@ struct exynos_drm_plane {
  * @mode_set: convert drm_display_mode to hw specific display mode and
  *	      would be called by encoder->mode_set().
  * @check_mode: check if mode is valid or not.
- * @dpms: display device on or off.
+ * @enable: display device on.
+ * @disable: display device off.
  * @commit: apply changes to hw
  */
 struct exynos_drm_display;
@@ -102,7 +103,8 @@ struct exynos_drm_display_ops {
 				struct drm_display_mode *mode);
 	int (*check_mode)(struct exynos_drm_display *display,
 				struct drm_display_mode *mode);
-	void (*dpms)(struct exynos_drm_display *display, int mode);
+	void (*enable)(struct exynos_drm_display *display);
+	void (*disable)(struct exynos_drm_display *display);
 	void (*commit)(struct exynos_drm_display *display);
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0e58b36..281b97d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1518,16 +1518,17 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
 		dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
 }
 
-static int exynos_dsi_enable(struct exynos_dsi *dsi)
+static void exynos_dsi_enable(struct exynos_drm_display *display)
 {
+	struct exynos_dsi *dsi = display_to_dsi(display);
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
-		return 0;
+		return;
 
 	ret = exynos_dsi_poweron(dsi);
 	if (ret < 0)
-		return ret;
+		return;
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
@@ -1535,7 +1536,7 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
 	if (ret < 0) {
 		dsi->state &= ~DSIM_STATE_ENABLED;
 		exynos_dsi_poweroff(dsi);
-		return ret;
+		return;
 	}
 
 	exynos_dsi_set_display_mode(dsi);
@@ -1547,16 +1548,16 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
 		exynos_dsi_set_display_enable(dsi, false);
 		drm_panel_unprepare(dsi->panel);
 		exynos_dsi_poweroff(dsi);
-		return ret;
+		return;
 	}
 
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
-
-	return 0;
 }
 
-static void exynos_dsi_disable(struct exynos_dsi *dsi)
+static void exynos_dsi_disable(struct exynos_drm_display *display)
 {
+	struct exynos_dsi *dsi = display_to_dsi(display);
+
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return;
 
@@ -1571,26 +1572,6 @@ static void exynos_dsi_disable(struct exynos_dsi *dsi)
 	exynos_dsi_poweroff(dsi);
 }
 
-static void exynos_dsi_dpms(struct exynos_drm_display *display, int mode)
-{
-	struct exynos_dsi *dsi = display_to_dsi(display);
-
-	if (dsi->panel) {
-		switch (mode) {
-		case DRM_MODE_DPMS_ON:
-			exynos_dsi_enable(dsi);
-			break;
-		case DRM_MODE_DPMS_STANDBY:
-		case DRM_MODE_DPMS_SUSPEND:
-		case DRM_MODE_DPMS_OFF:
-			exynos_dsi_disable(dsi);
-			break;
-		default:
-			break;
-		}
-	}
-}
-
 static enum drm_connector_status
 exynos_dsi_detect(struct drm_connector *connector, bool force)
 {
@@ -1604,7 +1585,7 @@ exynos_dsi_detect(struct drm_connector *connector, bool force)
 		struct exynos_drm_display *display;
 
 		display = platform_get_drvdata(to_platform_device(dsi->dev));
-		exynos_dsi_dpms(display, DRM_MODE_DPMS_OFF);
+		exynos_dsi_disable(display);
 		drm_panel_detach(dsi->panel);
 		dsi->panel = NULL;
 	}
@@ -1698,7 +1679,8 @@ static void exynos_dsi_mode_set(struct exynos_drm_display *display,
 static struct exynos_drm_display_ops exynos_dsi_display_ops = {
 	.create_connector = exynos_dsi_create_connector,
 	.mode_set = exynos_dsi_mode_set,
-	.dpms = exynos_dsi_dpms
+	.enable = exynos_dsi_enable,
+	.disable = exynos_dsi_disable,
 };
 
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
@@ -1849,7 +1831,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_display *display = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = display_to_dsi(display);
 
-	exynos_dsi_dpms(display, DRM_MODE_DPMS_OFF);
+	exynos_dsi_disable(display);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.c b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
index 7b89fd5..0aa4a58 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.c
@@ -70,8 +70,8 @@ static void exynos_drm_encoder_enable(struct drm_encoder *encoder)
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
 	struct exynos_drm_display *display = exynos_encoder->display;
 
-	if (display->ops->dpms)
-		display->ops->dpms(display, DRM_MODE_DPMS_ON);
+	if (display->ops->enable)
+		display->ops->enable(display);
 
 	if (display->ops->commit)
 		display->ops->commit(display);
@@ -82,8 +82,8 @@ static void exynos_drm_encoder_disable(struct drm_encoder *encoder)
 	struct exynos_drm_encoder *exynos_encoder = to_exynos_encoder(encoder);
 	struct exynos_drm_display *display = exynos_encoder->display;
 
-	if (display->ops->dpms)
-		display->ops->dpms(display, DRM_MODE_DPMS_OFF);
+	if (display->ops->disable)
+		display->ops->disable(display);
 }
 
 static struct drm_encoder_helper_funcs exynos_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 448f534..9b9396a 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1723,8 +1723,9 @@ static void hdmi_commit(struct exynos_drm_display *display)
 	hdmi_conf_apply(hdata);
 }
 
-static void hdmi_poweron(struct hdmi_context *hdata)
+static void hdmi_enable(struct exynos_drm_display *display)
 {
+	struct hdmi_context *hdata = display_to_hdmi(display);
 	struct hdmi_resources *res = &hdata->res;
 
 	if (hdata->powered)
@@ -1745,16 +1746,33 @@ static void hdmi_poweron(struct hdmi_context *hdata)
 	clk_prepare_enable(res->sclk_hdmi);
 
 	hdmiphy_poweron(hdata);
-	hdmi_commit(&hdata->display);
+	hdmi_commit(display);
 }
 
-static void hdmi_poweroff(struct hdmi_context *hdata)
+static void hdmi_disable(struct exynos_drm_display *display)
 {
+	struct hdmi_context *hdata = display_to_hdmi(display);
 	struct hdmi_resources *res = &hdata->res;
+	struct drm_crtc *crtc = hdata->encoder->crtc;
+	const struct drm_crtc_helper_funcs *funcs = NULL;
 
 	if (!hdata->powered)
 		return;
 
+	/*
+	 * The SFRs of VP and Mixer are updated by Vertical Sync of
+	 * Timing generator which is a part of HDMI so the sequence
+	 * to disable TV Subsystem should be as following,
+	 *	VP -> Mixer -> HDMI
+	 *
+	 * Below codes will try to disable Mixer and VP(if used)
+	 * prior to disabling HDMI.
+	 */
+	if (crtc)
+		funcs = crtc->helper_private;
+	if (funcs && funcs->disable)
+		(*funcs->disable)(crtc);
+
 	/* HDMI System Disable */
 	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
 
@@ -1776,49 +1794,12 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
 	hdata->powered = false;
 }
 
-static void hdmi_dpms(struct exynos_drm_display *display, int mode)
-{
-	struct hdmi_context *hdata = display_to_hdmi(display);
-	struct drm_encoder *encoder = hdata->encoder;
-	struct drm_crtc *crtc = encoder->crtc;
-	const struct drm_crtc_helper_funcs *funcs = NULL;
-
-	DRM_DEBUG_KMS("mode %d\n", mode);
-
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		hdmi_poweron(hdata);
-		break;
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
-	case DRM_MODE_DPMS_OFF:
-		/*
-		 * The SFRs of VP and Mixer are updated by Vertical Sync of
-		 * Timing generator which is a part of HDMI so the sequence
-		 * to disable TV Subsystem should be as following,
-		 *	VP -> Mixer -> HDMI
-		 *
-		 * Below codes will try to disable Mixer and VP(if used)
-		 * prior to disabling HDMI.
-		 */
-		if (crtc)
-			funcs = crtc->helper_private;
-		if (funcs && funcs->disable)
-			(*funcs->disable)(crtc);
-
-		hdmi_poweroff(hdata);
-		break;
-	default:
-		DRM_DEBUG_KMS("unknown dpms mode: %d\n", mode);
-		break;
-	}
-}
-
 static struct exynos_drm_display_ops hdmi_display_ops = {
 	.create_connector = hdmi_create_connector,
 	.mode_fixup	= hdmi_mode_fixup,
 	.mode_set	= hdmi_mode_set,
-	.dpms		= hdmi_dpms,
+	.enable		= hdmi_enable,
+	.disable	= hdmi_disable,
 	.commit		= hdmi_commit,
 };
 
-- 
2.1.0
