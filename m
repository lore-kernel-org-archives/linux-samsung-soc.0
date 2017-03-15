From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2] drm/exynos/dsi: make te-gpios optional
Date: Wed, 15 Mar 2017 12:20:42 +0100
Message-ID: <1489576842-17679-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170315112050eucas1p10ac34c1093b97a338e098c539b84ded6@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54264 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753593AbdCOLUy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Mar 2017 07:20:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMU00EB6SURG600@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 Mar 2017 11:20:51 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

DSI forwards te-gpios interrupts to display controller, but if display
controller works in HW-TRIGGER mode this interrupt is not necessary.
Making te-gpios property optional allows to avoid generating spare
interrupts.
With this patch we can get rid of 60 interrupt callbacks per second.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 812e2ec..822094d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1348,9 +1348,12 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
 	int te_gpio_irq;
 
 	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
+	if (dsi->te_gpio == -ENOENT)
+		return 0;
+
 	if (!gpio_is_valid(dsi->te_gpio)) {
-		dev_err(dsi->dev, "no te-gpios specified\n");
 		ret = dsi->te_gpio;
+		dev_err(dsi->dev, "cannot get te-gpios, %d\n", ret);
 		goto out;
 	}
 
-- 
2.7.4
