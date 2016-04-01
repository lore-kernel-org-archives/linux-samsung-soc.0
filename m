From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/7] drm/exynos: dsi: use generic of_device_get_match_data
 helper
Date: Fri, 01 Apr 2016 15:17:41 +0200
Message-ID: <1459516666-2004-3-git-send-email-m.szyprowski@samsung.com>
References: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38613 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752597AbcDANSN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:13 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y0086FIAARF10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:10 +0100 (BST)
In-reply-to: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Simplify code by replacing custom code by generic helper.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 63c84a106c0b..b6518df2411d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -532,15 +532,6 @@ static const struct of_device_id exynos_dsi_of_match[] = {
 	{ }
 };
 
-static inline struct exynos_dsi_driver_data *exynos_dsi_get_driver_data(
-						struct platform_device *pdev)
-{
-	const struct of_device_id *of_id =
-			of_match_device(exynos_dsi_of_match, &pdev->dev);
-
-	return (struct exynos_dsi_driver_data *)of_id->data;
-}
-
 static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
 {
 	if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
@@ -1833,7 +1824,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->dsi_host.dev = dev;
 
 	dsi->dev = dev;
-	dsi->driver_data = exynos_dsi_get_driver_data(pdev);
+	dsi->driver_data = of_device_get_match_data(dev);
 
 	ret = exynos_dsi_parse_dt(dsi);
 	if (ret)
-- 
1.9.2
