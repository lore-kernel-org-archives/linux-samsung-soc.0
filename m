From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 2/8] drm/panel: add prepare and unprepare routines
Date: Fri, 06 Jun 2014 00:40:46 +0530
Message-ID: <1401995452-15798-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26935 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434AbaFETMl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 15:12:41 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6P006BWMP4W150@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jun 2014 04:12:40 +0900 (KST)
In-reply-to: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, jg1.han@samsung.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

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
