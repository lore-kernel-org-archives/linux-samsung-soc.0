From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 8/9] drm/exynos: dsi: move TE irq handler registration position
Date: Mon, 17 Nov 2014 22:00:15 +0900
Message-ID: <1416229216-32018-9-git-send-email-yj44.cho@samsung.com>
References: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35157 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751623AbaKQNA3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 08:00:29 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF6002WGPGLK410@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 22:00:21 +0900 (KST)
In-reply-to: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com

The drm_helper_hpd_irq_event() does dpms control and
the panel is initialized and displayed on by it.
So the exynos_dsi_te_irq_handler() should be registered
beforehand.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 66d427e..6fe6486 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1207,9 +1207,6 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 	dsi->panel_node = device->dev.of_node;
 
-	if (dsi->connector.dev)
-		drm_helper_hpd_irq_event(dsi->connector.dev);
-
 	/*
 	 * This is a temporary solution and should be made by more generic way.
 	 *
@@ -1223,6 +1220,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
+	if (dsi->connector.dev)
+		drm_helper_hpd_irq_event(dsi->connector.dev);
+
 	return 0;
 }
 
-- 
1.9.0
