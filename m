From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/7] drm/exynos: exynos5433_decon: use generic
 of_device_get_match_data helper
Date: Fri, 01 Apr 2016 15:17:40 +0200
Message-ID: <1459516666-2004-2-git-send-email-m.szyprowski@samsung.com>
References: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18376 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549AbcDANSN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:13 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y00N3WIAA2R10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:10 +0100 (BST)
In-reply-to: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Simplify code by replacing custom code by generic helper.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 5245bc5e82e9..fa3dd6e91fd5 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -629,7 +629,6 @@ MODULE_DEVICE_TABLE(of, exynos5433_decon_driver_dt_match);
 
 static int exynos5433_decon_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id;
 	struct device *dev = &pdev->dev;
 	struct decon_context *ctx;
 	struct resource *res;
@@ -642,9 +641,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 
 	__set_bit(BIT_SUSPENDED, &ctx->flags);
 	ctx->dev = dev;
-
-	of_id = of_match_device(exynos5433_decon_driver_dt_match, &pdev->dev);
-	ctx->out_type = (enum decon_iftype)of_id->data;
+	ctx->out_type = (enum decon_iftype)of_device_get_match_data(dev);
 
 	if (ctx->out_type == IFTYPE_HDMI)
 		ctx->first_win = 1;
-- 
1.9.2
