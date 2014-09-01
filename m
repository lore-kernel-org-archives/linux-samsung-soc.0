From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH] drm/panel: simple: Add AUO B116XW03 panel support
Date: Mon, 01 Sep 2014 15:40:02 +0530
Message-ID: <1409566202-7946-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48140 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752241AbaIAKOn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Sep 2014 06:14:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

The AUO B116XW03 is a 11.6" HD TFT LCD panel connecting to a LVDS
interface and with an integrated LED backlight unit.

This panel is used on the Samsung Chromebook(XE303C12).

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 .../devicetree/bindings/panel/auo,b116xw03.txt     |    7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               |   25 ++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/auo,b116xw03.txt

diff --git a/Documentation/devicetree/bindings/panel/auo,b116xw03.txt b/Documentation/devicetree/bindings/panel/auo,b116xw03.txt
new file mode 100644
index 0000000..690d0a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/auo,b116xw03.txt
@@ -0,0 +1,7 @@
+AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
+
+Required properties:
+- compatible: should be "auo,b116xw03"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4ce1db0..51566e0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -352,6 +352,28 @@ static const struct panel_desc auo_b101aw03 = {
 	},
 };
 
+static const struct drm_display_mode auo_b116xw03_mode = {
+	.clock = 70589,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 40,
+	.hsync_end = 1366 + 40 + 40,
+	.htotal = 1366 + 40 + 40 + 32,
+	.vdisplay = 768,
+	.vsync_start = 768 + 10,
+	.vsync_end = 768 + 10 + 12,
+	.vtotal = 768 + 10 + 12 + 6,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc auo_b116xw03 = {
+	.modes = &auo_b116xw03_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 256,
+		.height = 144,
+	},
+};
+
 static const struct drm_display_mode auo_b133xtn01_mode = {
 	.clock = 69500,
 	.hdisplay = 1366,
@@ -616,6 +638,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "auo,b101aw03",
 		.data = &auo_b101aw03,
 	}, {
+		.compatible = "auo,b116xw03",
+		.data = &auo_b116xw03,
+	}, {
 		.compatible = "auo,b133htn01",
 		.data = &auo_b133htn01,
 	}, {
-- 
1.7.9.5
