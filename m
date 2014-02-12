From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 11/21] drm/panel: add support for BOE HV070WSA-100 panel
 to simple-panel
Date: Wed, 12 Feb 2014 12:31:18 +0100
Message-ID: <1392204688-4591-12-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25022 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751284AbaBLLcc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:32 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds support for BOE HV070WSA-100 WSVGA 7.01 inch panel
in panel-simple driver. The panel is used in Exynos5250-arndale boards.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3e611af..8aa8aab 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -338,6 +338,28 @@ static const struct panel_desc chunghwa_claa101wb01 = {
 	},
 };
 
+static const struct drm_display_mode boe_hv070wsa_mode = {
+	.clock = 40800,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 90,
+	.hsync_end = 1024 + 90 + 90,
+	.htotal = 1024 + 90 + 90 + 90,
+	.vdisplay = 600,
+	.vsync_start = 600 + 3,
+	.vsync_end = 600 + 3 + 4,
+	.vtotal = 600 + 3 + 4 + 3,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc boe_hv070wsa = {
+	.modes = &boe_hv070wsa_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 154,
+		.height = 90,
+	},
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
 		.compatible = "auo,b101aw03",
@@ -346,6 +368,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "chunghwa,claa101wb01",
 		.data = &chunghwa_claa101wb01
 	}, {
+		.compatible = "boe,hv070wsa-100",
+		.data = &boe_hv070wsa
+	}, {
 		.compatible = "simple-panel",
 	}, {
 		/* sentinel */
-- 
1.8.3.2
