From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 03/15] drm/panel: ld9040: Add dummy prepare and unprepare
 routines
Date: Thu, 31 Jul 2014 23:12:02 +0530
Message-ID: <1406828534-10072-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42253 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbaGaRpe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:34 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This patch adds dummy definition for prepare and unprepare
routines to ld9040 panel driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/panel/panel-ld9040.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ld9040.c b/drivers/gpu/drm/panel/panel-ld9040.c
index db1601f..9b40bd05 100644
--- a/drivers/gpu/drm/panel/panel-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-ld9040.c
@@ -228,6 +228,16 @@ static int ld9040_disable(struct drm_panel *panel)
 	return ld9040_power_off(ctx);
 }
 
+static int ld9040_unprepare(struct drm_panel *panel)
+{
+	return 0;
+}
+
+static int ld9040_prepare(struct drm_panel *panel)
+{
+	return 0;
+}
+
 static int ld9040_enable(struct drm_panel *panel)
 {
 	struct ld9040 *ctx = panel_to_ld9040(panel);
@@ -273,6 +283,8 @@ static int ld9040_get_modes(struct drm_panel *panel)
 
 static const struct drm_panel_funcs ld9040_drm_funcs = {
 	.disable = ld9040_disable,
+	.unprepare = ld9040_unprepare,
+	.prepare = ld9040_prepare,
 	.enable = ld9040_enable,
 	.get_modes = ld9040_get_modes,
 };
-- 
1.7.9.5
