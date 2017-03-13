From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos/dsi: make te-gpios optional
Date: Mon, 13 Mar 2017 16:30:22 +0100
Message-ID: <1489419022-20501-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170313153029eucas1p114f034a5dea7374f6d14d4d1636d0b68@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42414 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbdCMPae (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 11:30:34 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMR00GM8F2UDQ80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Mar 2017 15:30:30 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

In case of HW-TRIGGER te-gpios interrupt is not necessary. With this
patch we can get rid of 60 interrupt callbacks per second.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 812e2ec..f95fac5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1349,9 +1349,8 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
 
 	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
 	if (!gpio_is_valid(dsi->te_gpio)) {
-		dev_err(dsi->dev, "no te-gpios specified\n");
-		ret = dsi->te_gpio;
-		goto out;
+		dev_info(dsi->dev, "no te-gpios specified\n");
+		return 0;
 	}
 
 	ret = gpio_request(dsi->te_gpio, "te_gpio");
-- 
2.7.4
