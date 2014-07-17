From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RESEND PATCH V5 09/12] drm/exynos: dp: create bridge chain using
 ptn3460 and panel_binder
Date: Fri, 18 Jul 2014 02:13:55 +0530
Message-ID: <1405629839-12086-10-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59363 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752899AbaGQUrN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:47:13 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V008ZIJ2OMC90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:47:12 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Ajay Kumar <ajaykumar.rs@samsung.com>

exynos_dp supports a simple bridge chain with ptn3460 bridge
and an LVDS panel attached to it.
This patch creates the bridge chain with ptn3460 as the head
of the list and panel_binder being the tail.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 9d31296..0ca6256 100644
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
