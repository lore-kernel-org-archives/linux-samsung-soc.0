From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 12/15] drm/panel: simple: Support usage of delays in panel
 functions
Date: Thu, 31 Jul 2014 23:12:11 +0530
Message-ID: <1406828534-10072-13-git-send-email-ajaykumar.rs@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9266 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589AbaGaRp4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 13:45:56 -0400
In-reply-to: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

For most of the panels, we need to provide delays during
various stages of panel powerup/powerdown.

So, Add a structure to hold those delay values and use them
in corresponding functions.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/panel/panel-simple.c |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9801728..d6e92ea 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -41,6 +41,24 @@ struct panel_desc {
 		unsigned int width;
 		unsigned int height;
 	} size;
+
+	/**
+	 * @prepare: the time (in milliseconds) that it takes for the panel
+	 *	to become ready and start receiving video data
+	 * @enable: the time (in milliseconds) that it takes for the panel
+	 *	to display the first valid frame after starting to
+	 *	receive video data
+	 * @disable: the time (in milliseconds) that it takes for the panel
+	 *	to turn the display off (no content is visible)
+	 * @unprepare: the time (in milliseconds) that it takes for the panel
+	 *	to power down itself completely
+	 */
+	struct {
+		unsigned int prepare;
+		unsigned int enable;
+		unsigned int disable;
+		unsigned int unprepare;
+	} delay;
 };
 
 struct panel_simple {
@@ -106,6 +124,9 @@ static int panel_simple_disable(struct drm_panel *panel)
 		backlight_update_status(p->backlight);
 	}
 
+	if (p->desc->delay.disable)
+		msleep(p->desc->delay.disable);
+
 	p->enabled = false;
 
 	return 0;
@@ -123,6 +144,9 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 
 	regulator_disable(p->supply);
 
+	if (p->desc->delay.unprepare)
+		msleep(p->desc->delay.unprepare);
+
 	p->prepared = false;
 
 	return 0;
@@ -145,6 +169,9 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	if (p->enable_gpio)
 		gpiod_set_value_cansleep(p->enable_gpio, 1);
 
+	if (p->desc->delay.prepare)
+		msleep(p->desc->delay.prepare);
+
 	p->prepared = true;
 
 	return 0;
@@ -157,6 +184,9 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->enabled)
 		return 0;
 
+	if (p->desc->delay.enable)
+		msleep(p->desc->delay.enable);
+
 	if (p->backlight) {
 		p->backlight->props.power = FB_BLANK_UNBLANK;
 		backlight_update_status(p->backlight);
-- 
1.7.9.5
