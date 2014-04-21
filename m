From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 9/9] drm/exynos: Add ps8622 lvds bridge discovery to DP
 driver
Date: Tue, 22 Apr 2014 04:09:18 +0530
Message-ID: <1398119958-32005-10-git-send-email-ajaykumar.rs@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57840 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754949AbaDUWkE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:40:04 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00FAZKARW9A0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 07:40:03 +0900 (KST)
In-reply-to: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

This patch adds ps8622 lvds bridge discovery code to the dp driver.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
	Pushing V1 for this as V2 because this patch holds good in this series.

 drivers/gpu/drm/exynos/exynos_dp_core.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 4853f31..0006412 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -30,6 +30,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/bridge/ptn3460.h>
+#include <drm/bridge/ps8622.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_dp_core.h"
@@ -999,7 +1000,15 @@ static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
 				panel);
 		if (!ret)
 			return 1;
+	} else if (find_bridge("parade,ps8625", &bridge)) {
+
+		ret = ps8622_init(dev, encoder, bridge.client, bridge.node,
+				panel);
+
+		if (!ret)
+			return 1;
 	}
+
 	return 0;
 }
 
-- 
1.7.9.5
