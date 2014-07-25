From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V6 2/8] drm/panel: Add support for prepare and unprepare
 routines
Date: Sat, 26 Jul 2014 00:52:04 +0530
Message-ID: <1406316130-4744-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44221 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336AbaGYTZU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:25:20 -0400
In-reply-to: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Now that we have 2 new callbacks(prepare and unprepare) for drm_panel,
make changes in all the drm drivers which use the drm_panel framework
to support the new callbacks.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c |    8 +++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |    7 +++++
 drivers/gpu/drm/panel/panel-ld9040.c    |   18 +++++++++--
 drivers/gpu/drm/panel/panel-s6e8aa0.c   |   18 +++++++++--
 drivers/gpu/drm/panel/panel-simple.c    |   51 ++++++++++++++++++++++++-------
 drivers/gpu/drm/tegra/output.c          |    2 ++
 6 files changed, 85 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 3aa1c7e..fa08f05 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -125,14 +125,18 @@ static int exynos_dpi_create_connector(struct exynos_drm_display *display,
 
 static void exynos_dpi_poweron(struct exynos_dpi *ctx)
 {
-	if (ctx->panel)
+	if (ctx->panel) {
+		drm_panel_prepare(ctx->panel);
 		drm_panel_enable(ctx->panel);
+	}
 }
 
 static void exynos_dpi_poweroff(struct exynos_dpi *ctx)
 {
-	if (ctx->panel)
+	if (ctx->panel) {
 		drm_panel_disable(ctx->panel);
+		drm_panel_unprepare(ctx->panel);
+	}
 }
 
 static void exynos_dpi_dpms(struct exynos_drm_display *display, int mode)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 5e78d45..2f58e45 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1333,6 +1333,12 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
 	if (ret < 0)
 		return ret;
 
+	ret = drm_panel_prepare(dsi->panel);
+	if (ret < 0) {
+		exynos_dsi_poweroff(dsi);
+		return ret;
+	}
+
 	ret = drm_panel_enable(dsi->panel);
 	if (ret < 0) {
 		exynos_dsi_poweroff(dsi);
@@ -1354,6 +1360,7 @@ static void exynos_dsi_disable(struct exynos_dsi *dsi)
 
 	exynos_dsi_set_display_enable(dsi, false);
 	drm_panel_disable(dsi->panel);
+	drm_panel_unprepare(dsi->panel);
 	exynos_dsi_poweroff(dsi);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
diff --git a/drivers/gpu/drm/panel/panel-ld9040.c b/drivers/gpu/drm/panel/panel-ld9040.c
index db1601f..046d9fe 100644
--- a/drivers/gpu/drm/panel/panel-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-ld9040.c
@@ -214,7 +214,7 @@ static int ld9040_power_off(struct ld9040 *ctx)
 	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 }
 
-static int ld9040_disable(struct drm_panel *panel)
+static int ld9040_unprepare(struct drm_panel *panel)
 {
 	struct ld9040 *ctx = panel_to_ld9040(panel);
 
@@ -228,7 +228,12 @@ static int ld9040_disable(struct drm_panel *panel)
 	return ld9040_power_off(ctx);
 }
 
-static int ld9040_enable(struct drm_panel *panel)
+static int ld9040_disable(struct drm_panel *panel)
+{
+	return 0;
+}
+
+static int ld9040_prepare(struct drm_panel *panel)
 {
 	struct ld9040 *ctx = panel_to_ld9040(panel);
 	int ret;
@@ -242,11 +247,16 @@ static int ld9040_enable(struct drm_panel *panel)
 	ret = ld9040_clear_error(ctx);
 
 	if (ret < 0)
-		ld9040_disable(panel);
+		ld9040_unprepare(panel);
 
 	return ret;
 }
 
+static int ld9040_enable(struct drm_panel *panel)
+{
+	return 0;
+}
+
 static int ld9040_get_modes(struct drm_panel *panel)
 {
 	struct drm_connector *connector = panel->connector;
@@ -272,7 +282,9 @@ static int ld9040_get_modes(struct drm_panel *panel)
 }
 
 static const struct drm_panel_funcs ld9040_drm_funcs = {
+	.unprepare = ld9040_unprepare,
 	.disable = ld9040_disable,
+	.prepare = ld9040_prepare,
 	.enable = ld9040_enable,
 	.get_modes = ld9040_get_modes,
 };
diff --git a/drivers/gpu/drm/panel/panel-s6e8aa0.c b/drivers/gpu/drm/panel/panel-s6e8aa0.c
index 06e57a2..51c657a 100644
--- a/drivers/gpu/drm/panel/panel-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-s6e8aa0.c
@@ -887,7 +887,7 @@ static int s6e8aa0_power_off(struct s6e8aa0 *ctx)
 	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 }
 
-static int s6e8aa0_disable(struct drm_panel *panel)
+static int s6e8aa0_unprepare(struct drm_panel *panel)
 {
 	struct s6e8aa0 *ctx = panel_to_s6e8aa0(panel);
 
@@ -900,7 +900,12 @@ static int s6e8aa0_disable(struct drm_panel *panel)
 	return s6e8aa0_power_off(ctx);
 }
 
-static int s6e8aa0_enable(struct drm_panel *panel)
+static int s6e8aa0_disable(struct drm_panel *panel)
+{
+	return 0;
+}
+
+static int s6e8aa0_prepare(struct drm_panel *panel)
 {
 	struct s6e8aa0 *ctx = panel_to_s6e8aa0(panel);
 	int ret;
@@ -913,11 +918,16 @@ static int s6e8aa0_enable(struct drm_panel *panel)
 	ret = ctx->error;
 
 	if (ret < 0)
-		s6e8aa0_disable(panel);
+		s6e8aa0_unprepare(panel);
 
 	return ret;
 }
 
+static int s6e8aa0_enable(struct drm_panel *panel)
+{
+	return 0;
+}
+
 static int s6e8aa0_get_modes(struct drm_panel *panel)
 {
 	struct drm_connector *connector = panel->connector;
@@ -943,7 +953,9 @@ static int s6e8aa0_get_modes(struct drm_panel *panel)
 }
 
 static const struct drm_panel_funcs s6e8aa0_drm_funcs = {
+	.unprepare = s6e8aa0_unprepare,
 	.disable = s6e8aa0_disable,
+	.prepare = s6e8aa0_prepare,
 	.enable = s6e8aa0_enable,
 	.get_modes = s6e8aa0_get_modes,
 };
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a251361..fb0cfe2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -45,7 +45,8 @@ struct panel_desc {
 
 struct panel_simple {
 	struct drm_panel base;
-	bool enabled;
+	bool panel_enabled;
+	bool backlight_enabled;
 
 	const struct panel_desc *desc;
 
@@ -93,11 +94,28 @@ static int panel_simple_get_fixed_modes(struct panel_simple *panel)
 	return num;
 }
 
+static int panel_simple_unprepare(struct drm_panel *panel)
+{
+	struct panel_simple *p = to_panel_simple(panel);
+
+	if (!p->panel_enabled)
+		return 0;
+
+	if (p->enable_gpio)
+		gpiod_set_value_cansleep(p->enable_gpio, 0);
+
+	regulator_disable(p->supply);
+
+	p->panel_enabled = false;
+
+	return 0;
+}
+
 static int panel_simple_disable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->enabled)
+	if (!p->backlight_enabled)
 		return 0;
 
 	if (p->backlight) {
@@ -105,21 +123,17 @@ static int panel_simple_disable(struct drm_panel *panel)
 		backlight_update_status(p->backlight);
 	}
 
-	if (p->enable_gpio)
-		gpiod_set_value_cansleep(p->enable_gpio, 0);
-
-	regulator_disable(p->supply);
-	p->enabled = false;
+	p->backlight_enabled = false;
 
 	return 0;
 }
 
-static int panel_simple_enable(struct drm_panel *panel)
+static int panel_simple_prepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 	int err;
 
-	if (p->enabled)
+	if (p->panel_enabled)
 		return 0;
 
 	err = regulator_enable(p->supply);
@@ -131,12 +145,24 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->enable_gpio)
 		gpiod_set_value_cansleep(p->enable_gpio, 1);
 
+	p->panel_enabled = true;
+
+	return 0;
+}
+
+static int panel_simple_enable(struct drm_panel *panel)
+{
+	struct panel_simple *p = to_panel_simple(panel);
+
+	if (p->backlight_enabled)
+		return 0;
+
 	if (p->backlight) {
 		p->backlight->props.power = FB_BLANK_UNBLANK;
 		backlight_update_status(p->backlight);
 	}
 
-	p->enabled = true;
+	p->backlight_enabled = true;
 
 	return 0;
 }
@@ -164,6 +190,8 @@ static int panel_simple_get_modes(struct drm_panel *panel)
 
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
+	.unprepare = panel_simple_unprepare,
+	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 };
@@ -178,7 +206,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
+	panel->panel_enabled = false;
+	panel->backlight_enabled = false;
 	panel->desc = desc;
 
 	panel->supply = devm_regulator_get(dev, "power");
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 446837e..b574ee6 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -139,9 +139,11 @@ static void tegra_encoder_dpms(struct drm_encoder *encoder, int mode)
 
 	if (mode != DRM_MODE_DPMS_ON) {
 		drm_panel_disable(panel);
+		drm_panel_unprepare(panel);
 		tegra_output_disable(output);
 	} else {
 		tegra_output_enable(output);
+		drm_panel_prepare(panel);
 		drm_panel_enable(panel);
 	}
 }
-- 
1.7.9.5
