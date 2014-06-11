From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V4 05/10] drm/bridge: add helper functions to support bridge
 chain
Date: Wed, 11 Jun 2014 23:57:03 +0530
Message-ID: <1402511228-18945-6-git-send-email-ajaykumar.rs@samsung.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10962 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755160AbaFKS3X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 14:29:23 -0400
In-reply-to: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Ajay Kumar <ajaykumar.rs@samsung.com>

Add helper functions to create bridge chain and to call the
corresponding next_bridge functions.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Suggested-by: Rob Clark <robdclark@gmail.com>
---
 include/drm/drm_crtc.h |   72 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index a7fac56..ba6a0d2 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -640,6 +640,7 @@ struct drm_bridge_funcs {
 struct drm_bridge {
 	struct drm_device *dev;
 	struct list_head head;
+	struct drm_bridge *next_bridge;
 
 	struct drm_mode_object base;
 
@@ -1148,6 +1149,77 @@ drm_property_blob_find(struct drm_device *dev, uint32_t id)
 	return mo ? obj_to_blob(mo) : NULL;
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
