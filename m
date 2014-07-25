From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V6 3/8] drm/panel: simple: Add support for auo_b133htn01 panel
Date: Sat, 26 Jul 2014 00:52:05 +0530
Message-ID: <1406316130-4744-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44221 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757205AbaGYTZW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:25:22 -0400
In-reply-to: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add panel_desc structure for auo_b133htn01 eDP panel.

Also, modify the panel_simple routines to support timing_parameter
delays if mentioned in the panel_desc structure.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 +++
 drivers/gpu/drm/panel/panel-simple.c               |   47 ++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/auo,b133htn01.txt

diff --git a/Documentation/devicetree/bindings/panel/auo,b133htn01.txt b/Documentation/devicetree/bindings/panel/auo,b133htn01.txt
new file mode 100644
index 0000000..302226b
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/auo,b133htn01.txt
@@ -0,0 +1,7 @@
+AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
+
+Required properties:
+- compatible: should be "auo,b133htn01"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index fb0cfe2..cbbb1b8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -41,6 +41,13 @@ struct panel_desc {
 		unsigned int width;
 		unsigned int height;
 	} size;
+
+	struct {
+		unsigned int prepare_stage_delay;
+		unsigned int enable_stage_delay;
+		unsigned int disable_stage_delay;
+		unsigned int unprepare_stage_delay;
+	} timing_parameter;
 };
 
 struct panel_simple {
@@ -105,6 +112,8 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 		gpiod_set_value_cansleep(p->enable_gpio, 0);
 
 	regulator_disable(p->supply);
+	if (p->desc)
+		msleep(p->desc->timing_parameter.unprepare_stage_delay);
 
 	p->panel_enabled = false;
 
@@ -123,6 +132,9 @@ static int panel_simple_disable(struct drm_panel *panel)
 		backlight_update_status(p->backlight);
 	}
 
+	if (p->desc)
+		msleep(p->desc->timing_parameter.disable_stage_delay);
+
 	p->backlight_enabled = false;
 
 	return 0;
@@ -142,6 +154,9 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		return err;
 	}
 
+	if (p->desc)
+		msleep(p->desc->timing_parameter.prepare_stage_delay);
+
 	if (p->enable_gpio)
 		gpiod_set_value_cansleep(p->enable_gpio, 1);
 
@@ -157,6 +172,8 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->backlight_enabled)
 		return 0;
 
+	if (p->desc)
+		msleep(p->desc->timing_parameter.enable_stage_delay);
 	if (p->backlight) {
 		p->backlight->props.power = FB_BLANK_UNBLANK;
 		backlight_update_status(p->backlight);
@@ -342,6 +359,33 @@ static const struct panel_desc auo_b133xtn01 = {
 	},
 };
 
+static const struct drm_display_mode auo_b133htn01_mode = {
+	.clock = 150660,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 172,
+	.hsync_end = 1920 + 172 + 80,
+	.htotal = 1920 + 172 + 80 + 60,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 25,
+	.vsync_end = 1080 + 25 + 10,
+	.vtotal = 1080 + 25 + 10 + 10,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc auo_b133htn01 = {
+	.modes = &auo_b133htn01_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 293,
+		.height = 165,
+	},
+	.timing_parameter = {
+		.prepare_stage_delay = 105,
+		.enable_stage_delay = 20,
+		.prepare_stage_delay = 50,
+	},
+};
+
 static const struct drm_display_mode chunghwa_claa101wa01a_mode = {
 	.clock = 72070,
 	.hdisplay = 1366,
@@ -481,6 +525,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "auo,b101aw03",
 		.data = &auo_b101aw03,
 	}, {
+		.compatible = "auo,b133htn01",
+		.data = &auo_b133htn01,
+	}, {
 		.compatible = "auo,b133xtn01",
 		.data = &auo_b133xtn01,
 	}, {
-- 
1.7.9.5
