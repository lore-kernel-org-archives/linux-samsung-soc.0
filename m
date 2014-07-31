From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 09/15] drm/panel: ld9040: Add proper definition for prepare and
 unprepare
Date: Thu, 31 Jul 2014 23:12:08 +0530
Message-ID: <1406828534-10072-10-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34908 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753244AbaGaRpu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:50 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Move out code from enable and disable routines to prepare
and unprepare routines, so that functionality is properly
distributed across all the panel functions.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/panel/panel-ld9040.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ld9040.c b/drivers/gpu/drm/panel/panel-ld9040.c
index 9b40bd05..c6aa7f7 100644
--- a/drivers/gpu/drm/panel/panel-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-ld9040.c
@@ -216,6 +216,11 @@ static int ld9040_power_off(struct ld9040 *ctx)
 
 static int ld9040_disable(struct drm_panel *panel)
 {
+	return 0;
+}
+
+static int ld9040_unprepare(struct drm_panel *panel)
+{
 	struct ld9040 *ctx = panel_to_ld9040(panel);
 
 	msleep(120);
@@ -228,18 +233,8 @@ static int ld9040_disable(struct drm_panel *panel)
 	return ld9040_power_off(ctx);
 }
 
-static int ld9040_unprepare(struct drm_panel *panel)
-{
-	return 0;
-}
-
 static int ld9040_prepare(struct drm_panel *panel)
 {
-	return 0;
-}
-
-static int ld9040_enable(struct drm_panel *panel)
-{
 	struct ld9040 *ctx = panel_to_ld9040(panel);
 	int ret;
 
@@ -252,11 +247,16 @@ static int ld9040_enable(struct drm_panel *panel)
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
-- 
1.7.9.5
