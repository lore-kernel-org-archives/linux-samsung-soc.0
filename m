From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 11/15] drm/panel: simple: Add proper definition for prepare and
 unprepare
Date: Thu, 31 Jul 2014 23:12:10 +0530
Message-ID: <1406828534-10072-12-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42262 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753432AbaGaRpy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:54 -0400
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
 drivers/gpu/drm/panel/panel-simple.c |   37 +++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2e51c34..9801728 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -45,6 +45,7 @@ struct panel_desc {
 
 struct panel_simple {
 	struct drm_panel base;
+	bool prepared;
 	bool enabled;
 
 	const struct panel_desc *desc;
@@ -105,10 +106,6 @@ static int panel_simple_disable(struct drm_panel *panel)
 		backlight_update_status(p->backlight);
 	}
 
-	if (p->enable_gpio)
-		gpiod_set_value_cansleep(p->enable_gpio, 0);
-
-	regulator_disable(p->supply);
 	p->enabled = false;
 
 	return 0;
@@ -116,20 +113,27 @@ static int panel_simple_disable(struct drm_panel *panel)
 
 static int panel_simple_unprepare(struct drm_panel *panel)
 {
-	return 0;
-}
+	struct panel_simple *p = to_panel_simple(panel);
+
+	if (!p->prepared)
+		return 0;
+
+	if (p->enable_gpio)
+		gpiod_set_value_cansleep(p->enable_gpio, 0);
+
+	regulator_disable(p->supply);
+
+	p->prepared = false;
 
-static int panel_simple_prepare(struct drm_panel *panel)
-{
 	return 0;
 }
 
-static int panel_simple_enable(struct drm_panel *panel)
+static int panel_simple_prepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 	int err;
 
-	if (p->enabled)
+	if (p->prepared)
 		return 0;
 
 	err = regulator_enable(p->supply);
@@ -141,6 +145,18 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->enable_gpio)
 		gpiod_set_value_cansleep(p->enable_gpio, 1);
 
+	p->prepared = true;
+
+	return 0;
+}
+
+static int panel_simple_enable(struct drm_panel *panel)
+{
+	struct panel_simple *p = to_panel_simple(panel);
+
+	if (p->enabled)
+		return 0;
+
 	if (p->backlight) {
 		p->backlight->props.power = FB_BLANK_UNBLANK;
 		backlight_update_status(p->backlight);
@@ -191,6 +207,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return -ENOMEM;
 
 	panel->enabled = false;
+	panel->prepared = false;
 	panel->desc = desc;
 
 	panel->supply = devm_regulator_get(dev, "power");
-- 
1.7.9.5
