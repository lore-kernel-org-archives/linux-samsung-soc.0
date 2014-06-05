From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 8/8] drm/exynos: Add ps8622 lvds bridge discovery to DP
 driver
Date: Fri, 06 Jun 2014 00:40:52 +0530
Message-ID: <1401995452-15798-9-git-send-email-ajaykumar.rs@samsung.com>
References: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26970 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761AbaFETNI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 15:13:08 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6P006C9MPUW150@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jun 2014 04:13:07 +0900 (KST)
In-reply-to: <1401995452-15798-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, jg1.han@samsung.com, ajaynumb@gmail.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

This patch adds ps8622 lvds bridge discovery code to the dp driver.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index a608f5c..44ebf54 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -31,6 +31,7 @@
 #include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
 #include <drm/bridge/panel_binder.h>
+#include <drm/bridge/ps8622.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_dp_core.h"
@@ -991,6 +992,10 @@ static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 	if (find_bridge("nxp,ptn3460", &bridge)) {
 		bridge_chain = ptn3460_init(dp->drm_dev, encoder, bridge.client,
 								bridge.node);
+	} else if (find_bridge("parade,ps8622", &bridge) ||
+				find_bridge("parade,ps8625", &bridge)) {
+		bridge_chain = ps8622_init(dp->drm_dev, encoder, bridge.client,
+								bridge.node);
 	}
 
 	if (dp->edp_panel) {
-- 
1.7.9.5
