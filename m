From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos/dsi: fix bridge_node DT parsing
Date: Wed, 12 Apr 2017 09:22:09 +0200
Message-ID: <1491981729-6396-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170412072216eucas1p136149c39438639424d3b8ab4f8d548e8@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43106 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbdDLHWV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Apr 2017 03:22:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OOA00FV4CH6GI40@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Apr 2017 08:22:18 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

DSIM uses MIC bridge which is between DECON and DSIM, so the driver
should expect bridge node on input side.

Fixes: 86418f9 ("drm: convert drivers to use of_graph_get_remote_node")
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index dcb50d4d..3ae459f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1659,7 +1659,7 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 
 	of_node_put(ep);
 
-	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
+	dsi->bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
 	if (!dsi->bridge_node)
 		return -EINVAL;
 
-- 
2.7.4
