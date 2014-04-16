From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/7] drm/panel: add pre_enable routine to drm panel
Date: Wed, 16 Apr 2014 20:03:01 +0530
Message-ID: <1397658786-26138-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63601 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161089AbaDPOdh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:33:37 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4400BTLOG02R40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 23:33:36 +0900 (KST)
In-reply-to: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, a.hajda@samsung.com, treding@nvidia.com, kyungmin.park@samsung.com, seanpaul@google.com, abrestic@chromium.org, rahul.sharma@samsung.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Most of the panels need an init sequence as mentioned below:
	-- poweron LCD unit/LCD_EN
	-- start video data
	-- poweron LED unit/BL_EN
With existing callbacks for drm panel, we cannot accomodate such
panels, since only one callback, i.e "panel_enable" is supported.

This patch adds a "pre_enable" callback which can be called before
the actual video data is on, and then call the "enable" callback
after the video data is available.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 include/drm/drm_panel.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index c2ab77a..89210bf 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -32,6 +32,7 @@ struct drm_panel;
 
 struct drm_panel_funcs {
 	int (*disable)(struct drm_panel *panel);
+	int (*pre_enable)(struct drm_panel *panel);
 	int (*enable)(struct drm_panel *panel);
 	int (*get_modes)(struct drm_panel *panel);
 };
@@ -54,6 +55,14 @@ static inline int drm_panel_disable(struct drm_panel *panel)
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
1.8.1.2
