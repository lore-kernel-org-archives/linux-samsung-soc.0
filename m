From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V4 10/10] drm/exynos: Add ps8622 lvds bridge discovery to DP
 driver
Date: Wed, 11 Jun 2014 23:57:08 +0530
Message-ID: <1402511228-18945-11-git-send-email-ajaykumar.rs@samsung.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64078 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752640AbaFKS3j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 14:29:39 -0400
In-reply-to: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Rahul Sharma <rahul.sharma@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

This patch adds ps8622 lvds bridge discovery code to the dp driver.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 69535f7..87eabe7 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -31,6 +31,7 @@
 #include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
 #include <drm/bridge/panel_binder.h>
+#include <drm/bridge/ps8622.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_dp_core.h"
@@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 	if (find_bridge("nxp,ptn3460", &bridge)) {
 		bridge_chain = ptn3460_init(dp->drm_dev, encoder, bridge.client,
 								bridge.node);
+	} else if (find_bridge("parade,ps8622", &bridge) ||
+				find_bridge("parade,ps8625", &bridge)) {
+		bridge_chain = ps8622_init(dp->drm_dev, encoder, bridge.client,
+								bridge.node);
 	}
 
 	if (bridge_chain && dp->edp_panel) {
-- 
1.7.9.5
