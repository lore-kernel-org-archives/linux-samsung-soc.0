From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 2/9] drm/panel: add pre_enable and post_disable routines
Date: Tue, 22 Apr 2014 04:09:11 +0530
Message-ID: <1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18808 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754527AbaDUWjy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:39:54 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00FTOKAHYL10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 07:39:53 +0900 (KST)
In-reply-to: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Most of the panels need an init sequence as mentioned below:
	-- poweron LCD unit/LCD_EN
	-- start video data
	-- poweron LED unit/BL_EN
And, a de-init sequence as mentioned below:
	-- poweroff LED unit/BL_EN
	-- stop video data
	-- poweroff LCD unit/LCD_EN
With existing callbacks for drm panel, we cannot accomodate such panels,
since only two callbacks, i.e "panel_enable" and panel_disable are supported.

This patch adds:
	-- "pre_enable" callback which can be called before
	the actual video data is on, and then call the "enable"
	callback after the video data is available.

	-- "post_disable" callback which can be called after
	the video data is off, and use "disable" callback
	to do something before switching off the video data.

Now, we can easily map the above scenario as shown below:
	poweron LCD unit/LCD_EN = "pre_enable" callback
	poweron LED unit/BL_EN = "enable" callback
	poweroff LED unit/BL_EN = "disable" callback
	poweroff LCD unit/LCD_EN = "post_disable" callback

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
	Added post_disable callback

 include/drm/drm_panel.h |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c2ab77a..bf191df 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -31,7 +31,9 @@ struct drm_device;
 struct drm_panel;
 
 struct drm_panel_funcs {
+	int (*post_disable)(struct drm_panel *panel);
 	int (*disable)(struct drm_panel *panel);
+	int (*pre_enable)(struct drm_panel *panel);
 	int (*enable)(struct drm_panel *panel);
 	int (*get_modes)(struct drm_panel *panel);
 };
@@ -46,6 +48,14 @@ struct drm_panel {
 	struct list_head list;
 };
 
+static inline int drm_panel_post_disable(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->post_disable)
+		return panel->funcs->post_disable(panel);
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
 
+static inline int drm_panel_pre_enable(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->pre_enable)
+		return panel->funcs->pre_enable(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+
 static inline int drm_panel_enable(struct drm_panel *panel)
 {
 	if (panel && panel->funcs && panel->funcs->enable)
-- 
1.7.9.5
