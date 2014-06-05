From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 1/8] drm/bridge: add helper functions to support bridge chain
Date: Fri, 06 Jun 2014 00:40:45 +0530
Message-ID: <1401995452-15798-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26927 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434AbaFETMj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 15:12:39 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6P006BUMP2W150@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jun 2014 04:12:38 +0900 (KST)
In-reply-to: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, jg1.han@samsung.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add helper functions to create bridge chain and to call the
corresponding next_bridge functions.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Suggested-by: Rob Clark <robdclark@gmail.com>
---
 include/drm/drm_crtc.h |   72 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 5c1c31c..4665d42 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -623,6 +623,7 @@ struct drm_bridge_funcs {
 struct drm_bridge {
 	struct drm_device *dev;
 	struct list_head head;
+	struct drm_bridge *next_bridge;
 
 	struct drm_mode_object base;
 
@@ -1079,6 +1080,77 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
 	return mo ? obj_to_encoder(mo) : NULL;
 }
 
+static inline int drm_bridge_add_to_chain(struct drm_bridge *head,
+					  struct drm_bridge *last)
+{
+	struct drm_bridge *temp = head;
+
+	if (head && last) {
+		while (temp->next_bridge)
+			temp = temp->next_bridge;
+
+		temp->next_bridge = last;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static inline void drm_next_bridge_mode_fixup(struct drm_bridge *bridge,
+					const struct drm_display_mode *mode,
+					struct drm_display_mode *adjusted_mode)
+{
+	if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
+	    bridge->next_bridge->funcs->mode_fixup)
+		bridge->next_bridge->funcs->mode_fixup(bridge->next_bridge,
+							mode, adjusted_mode);
+}
+
+static inline void drm_next_bridge_disable(struct drm_bridge *bridge)
+{
+	if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
+	    bridge->next_bridge->funcs->disable)
+		bridge->next_bridge->funcs->disable(bridge->next_bridge);
+}
+
+static inline void drm_next_bridge_post_disable(struct drm_bridge *bridge)
+{
+	if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
+	    bridge->next_bridge->funcs->post_disable)
+		bridge->next_bridge->funcs->post_disable(bridge->next_bridge);
+}
+
+static inline void drm_next_bridge_mode_set(struct drm_bridge *bridge,
+					struct drm_display_mode *mode,
+					struct drm_display_mode *adjusted_mode)
+{
+	if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
+	    bridge->next_bridge->funcs->mode_set)
+		bridge->next_bridge->funcs->mode_set(bridge->next_bridge,
+							mode, adjusted_mode);
+}
+
+static inline void drm_next_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
+	    bridge->next_bridge->funcs->pre_enable)
+		bridge->next_bridge->funcs->pre_enable(bridge->next_bridge);
+}
+
+static inline void drm_next_bridge_enable(struct drm_bridge *bridge)
+{
+	if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
+	    bridge->next_bridge->funcs->enable)
+		bridge->next_bridge->funcs->enable(bridge->next_bridge);
+}
+
+static inline void drm_next_bridge_destroy(struct drm_bridge *bridge)
+{
+	if (bridge && bridge->next_bridge && bridge->next_bridge->funcs &&
+	    bridge->next_bridge->funcs->destroy)
+		bridge->next_bridge->funcs->destroy(bridge->next_bridge);
+}
+
 /* Plane list iterator for legacy (overlay only) planes. */
 #define drm_for_each_legacy_plane(plane, planelist) \
 	list_for_each_entry(plane, planelist, head) \
-- 
1.7.9.5
