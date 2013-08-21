From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/3] drm/exynos: fimd: get signal polarities from device tree
Date: Wed, 21 Aug 2013 16:22:02 +0200
Message-ID: <1377094923-6919-3-git-send-email-a.hajda@samsung.com>
References: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22831 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751536Ab3HUOWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 10:22:45 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRV00KYPX9PZ9B0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Aug 2013 15:22:44 +0100 (BST)
In-reply-to: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, t.figa@samsung.com, s.nawrocki@samsung.com

The patch adds code to get signal polarization setting
from device tree display-timings node.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a183ea7..6afcaf1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -915,6 +915,15 @@ static int fimd_probe(struct platform_device *pdev)
 			DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
 			return ret;
 		}
+
+		if (vm->flags & DISPLAY_FLAGS_VSYNC_LOW)
+			pdata->vidcon1 |= VIDCON1_INV_VSYNC;
+		if (vm->flags & DISPLAY_FLAGS_HSYNC_LOW)
+			pdata->vidcon1 |= VIDCON1_INV_HSYNC;
+		if (vm->flags & DISPLAY_FLAGS_DE_LOW)
+			pdata->vidcon1 |= VIDCON1_INV_VDEN;
+		if (vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+			pdata->vidcon1 |= VIDCON1_INV_VCLK;
 	} else {
 		pdata = dev->platform_data;
 		if (!pdata) {
-- 
1.8.1.2
