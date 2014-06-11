From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V4 02/10] drm/panel: add prepare and unprepare routines
Date: Wed, 11 Jun 2014 23:57:00 +0530
Message-ID: <1402511228-18945-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63433 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752640AbaFKS3m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 14:29:42 -0400
In-reply-to: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Ajay Kumar <ajaykumar.rs@samsung.com>

Most of the panels need an init sequence as mentioned below:
	-- poweron LCD unit/LCD_EN
	-- start video data
	-- poweron LED unit/BACKLIGHT_EN
And, a de-init sequence as mentioned below:
	-- poweroff LED unit/BACKLIGHT_EN
	-- stop video data
	-- poweroff LCD unit/LCD_EN
With existing callbacks for drm panel, we cannot accomodate such panels,
since only two callbacks, i.e "panel_enable" and panel_disable are supported.

This patch adds:
	-- "prepare" callback which can be called before
	the actual video data is on, and then call the "enable"
	callback after the video data is available.

	-- "unprepare" callback which can be called after
	the video data is off, and use "disable" callback
	to do something before switching off the video data.

Now, we can easily map the above scenario as shown below:
	poweron LCD unit/LCD_EN = "prepare" callback
	poweron LED unit/BACKLIGHT_EN = "enable" callback
	poweroff LED unit/BACKLIGHT_EN = "disable" callback
	poweroff LCD unit/LCD_EN = "unprepare" callback

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 include/drm/drm_panel.h |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c2ab77a..9addc69 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -31,7 +31,9 @@ struct drm_device;
 struct drm_panel;
 
 struct drm_panel_funcs {
+	int (*unprepare)(struct drm_panel *panel);
 	int (*disable)(struct drm_panel *panel);
+	int (*prepare)(struct drm_panel *panel);
 	int (*enable)(struct drm_panel *panel);
 	int (*get_modes)(struct drm_panel *panel);
 };
@@ -46,6 +48,14 @@ struct drm_panel {
 	struct list_head list;
 };
 
+static inline int drm_panel_unprepare(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->unprepare)
+		return panel->funcs->unprepare(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+
 static inline int drm_panel_disable(struct drm_panel *panel)
 {
 	if (panel && panel->funcs && panel->funcs->disable)
@@ -54,6 +64,14 @@ static inline int drm_panel_disable(struct drm_panel *panel)
 	return panel ? -ENOSYS : -EINVAL;
 }
 
+static inline int drm_panel_prepare(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->prepare)
+		return panel->funcs->prepare(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+
 static inline int drm_panel_enable(struct drm_panel *panel)
 {
 	if (panel && panel->funcs && panel->funcs->enable)
-- 
1.7.9.5
