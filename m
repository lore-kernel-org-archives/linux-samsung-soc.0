From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/7] drm/exynos: mixer: remove support for non-dt platforms
Date: Fri, 01 Apr 2016 15:17:45 +0200
Message-ID: <1459516666-2004-7-git-send-email-m.szyprowski@samsung.com>
References: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:39458 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbcDANSQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:16 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y006HWIACGWA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:12 +0100 (BST)
In-reply-to: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

There are no non-devicetree based Exynos platforms in mainline, so there
no point keeping old platform driver data for them.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 0a5a60005f7e..ffafb744154e 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1155,18 +1155,6 @@ static struct mixer_drv_data exynos4210_mxr_drv_data = {
 	.has_sclk = 1,
 };
 
-static const struct platform_device_id mixer_driver_types[] = {
-	{
-		.name		= "s5p-mixer",
-		.driver_data	= (unsigned long)&exynos4210_mxr_drv_data,
-	}, {
-		.name		= "exynos5-mixer",
-		.driver_data	= (unsigned long)&exynos5250_mxr_drv_data,
-	}, {
-		/* end node */
-	}
-};
-
 static struct of_device_id mixer_match_types[] = {
 	{
 		.compatible = "samsung,exynos4210-mixer",
@@ -1258,9 +1246,6 @@ static int mixer_probe(struct platform_device *pdev)
 
 		match = of_match_node(mixer_match_types, dev->of_node);
 		drv = (struct mixer_drv_data *)match->data;
-	} else {
-		drv = (struct mixer_drv_data *)
-			platform_get_device_id(pdev)->driver_data;
 	}
 
 	ctx->pdev = pdev;
@@ -1355,5 +1340,4 @@ struct platform_driver mixer_driver = {
 	},
 	.probe = mixer_probe,
 	.remove = mixer_remove,
-	.id_table	= mixer_driver_types,
 };
-- 
1.9.2
