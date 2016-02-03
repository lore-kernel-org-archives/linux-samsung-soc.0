From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 07/10] drm/exynos: dsi: restore support for drm bridge
Date: Wed, 03 Feb 2016 13:42:51 +0100
Message-ID: <1454503374-16382-8-git-send-email-m.szyprowski@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54372 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933662AbcBCMnQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Feb 2016 07:43:16 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1Z004F2202IX90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Feb 2016 12:43:14 +0000 (GMT)
In-reply-to: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch fixes issue introduced by commit
cf67cc9a29ac19c98bc4fa0e6d14b0c1f592d322 ("drm/exynos: remove struct
exynos_drm_display"), which removed assigning of drm bridge to drm
encoder. Lack of it caused that no bridge callbacks were called on
encoder enable/disable actions.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d84a498..5941650 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1782,6 +1782,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 
 	bridge = of_drm_find_bridge(dsi->bridge_node);
 	if (bridge) {
+		encoder->bridge = bridge;
 		drm_bridge_attach(drm_dev, bridge);
 	}
 
-- 
1.9.2
