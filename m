From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V6 1/8] drm/panel: Add prepare, unprepare and get_modes routines
Date: Sat, 26 Jul 2014 00:52:03 +0530
Message-ID: <1406316130-4744-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48586 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753170AbaGYTZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:25:19 -0400
In-reply-to: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, thierry.reding@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

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

Also, a helper function for get_modes is added.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 include/drm/drm_panel.h |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c2ab77a..efc63cc 100644
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
@@ -62,6 +80,14 @@ static inline int drm_panel_enable(struct drm_panel *panel)
 	return panel ? -ENOSYS : -EINVAL;
 }
 
+static inline int drm_panel_get_modes(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->get_modes)
+		return panel->funcs->get_modes(panel);
+
+	return 0;
+}
+
 void drm_panel_init(struct drm_panel *panel);
 
 int drm_panel_add(struct drm_panel *panel);
-- 
1.7.9.5
