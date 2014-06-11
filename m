From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V4 08/10] drm/exynos: dp: create bridge chain using ptn3460 and
 panel_binder
Date: Wed, 11 Jun 2014 23:57:06 +0530
Message-ID: <1402511228-18945-9-git-send-email-ajaykumar.rs@samsung.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58932 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752640AbaFKS33 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 14:29:29 -0400
In-reply-to: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Ajay Kumar <ajaykumar.rs@samsung.com>

exynos_dp supports a simple bridge chain with ptn3460 bridge
and an LVDS panel attached to it.
This patch creates the bridge chain with ptn3460 as the head
of the list and panel_binder being the tail.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index d8546ea..69535f7 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -30,6 +30,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
+#include <drm/bridge/panel_binder.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_dp_core.h"
@@ -992,7 +993,7 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 		struct drm_encoder *encoder)
 {
 	struct bridge_init bridge;
-	struct drm_bridge *bridge_chain = NULL;
+	struct drm_bridge *bridge_chain = NULL, *next = NULL;
 	bool connector_created = false;
 
 	if (find_bridge("nxp,ptn3460", &bridge)) {
@@ -1000,6 +1001,15 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 								bridge.node);
 	}
 
+	if (bridge_chain && dp->edp_panel) {
+		next = panel_binder_init(dp->drm_dev, encoder, bridge.client,
+			bridge.node, dp->edp_panel, DRM_MODE_CONNECTOR_LVDS,
+			DRM_CONNECTOR_POLL_HPD);
+		if (next)
+			connector_created = true;
+		drm_bridge_add_to_chain(bridge_chain, next);
+	}
+
 	return connector_created;
 }
 
-- 
1.7.9.5
