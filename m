From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 04/25] drm/exynos: gsc: fix wrong pm_runtime state
Date: Tue, 10 Nov 2015 14:23:20 +0100
Message-ID: <1447161821-1877-5-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64203 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753088AbbKJNYu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:50 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00AJ8P9CUMA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:48 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

From: Seung-Woo Kim <sw0312.kim@samsung.com>

At probe time, gsc clock is not enabled, so pm_runtime state should
be deactive. So this patch removes pm_runtime_set_active() from
gsc_probe().

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 72a9c84e06b6..ed55d37b6330 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1713,7 +1713,6 @@ static int gsc_probe(struct platform_device *pdev)
 	mutex_init(&ctx->lock);
 	platform_set_drvdata(pdev, ctx);
 
-	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
 	ret = exynos_drm_ippdrv_register(ippdrv);
-- 
1.9.2
