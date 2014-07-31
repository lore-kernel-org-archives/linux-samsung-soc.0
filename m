From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 13/15] drm/panel: simple: Add support for auo_b133htn01 panel
Date: Thu, 31 Jul 2014 23:12:12 +0530
Message-ID: <1406828534-10072-14-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34915 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752741AbaGaRp6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:58 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add panel_desc structure for auo_b133htn01 eDP panel.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/panel/auo,b133htn01.txt    |    7 +++++
 drivers/gpu/drm/panel/panel-simple.c               |   31 ++++++++++++++++++++
 2 files changed, 38 insertions(+)
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
index d6e92ea..a4fa7c7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -166,6 +166,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		return err;
 	}
 
+
 	if (p->enable_gpio)
 		gpiod_set_value_cansleep(p->enable_gpio, 1);
 
@@ -372,6 +373,33 @@ static const struct panel_desc auo_b133xtn01 = {
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
+	.delay = {
+		.prepare = 105,
+		.enable = 20,
+		.unprepare = 50,
+	},
+};
+
 static const struct drm_display_mode chunghwa_claa101wa01a_mode = {
 	.clock = 72070,
 	.hdisplay = 1366,
@@ -511,6 +539,9 @@ static const struct of_device_id platform_of_match[] = {
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
