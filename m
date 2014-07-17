From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge discovery
 to DP driver
Date: Fri, 18 Jul 2014 02:13:58 +0530
Message-ID: <1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50069 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756231AbaGQUrU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:47:20 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V00FT4J2V0X00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:47:19 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Rahul Sharma <rahul.sharma@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

This patch adds ps8622 lvds bridge discovery code to the dp driver.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 0ca6256..82e2942 100644
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
