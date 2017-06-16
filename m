From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: dsi: do not try to find bridge
Date: Fri, 16 Jun 2017 16:50:15 +0900
Message-ID: <1497599415-4327-1-git-send-email-inki.dae@samsung.com>
References: <CGME20170616075016epcas5p34938dd82d07390a03e7690f1634e9229@epcas5p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38386 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752447AbdFPHuS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 03:50:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

It doesn't need to try to find a bridge if bridge node doesn't exist.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d404de8..e337cd2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1687,9 +1687,11 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	bridge = of_drm_find_bridge(dsi->bridge_node);
-	if (bridge)
-		drm_bridge_attach(encoder, bridge, NULL);
+	if (dsi->bridge_node) {
+		bridge = of_drm_find_bridge(dsi->bridge_node);
+		if (bridge)
+			drm_bridge_attach(encoder, bridge, NULL);
+	}
 
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
-- 
1.9.1
