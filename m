From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: mixer: remove non-devicetree based initialization
 code
Date: Mon, 14 Dec 2015 11:45:41 +0100
Message-ID: <1450089941-384-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13777 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932200AbbLNKp6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2015 05:45:58 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZC002V3GKKN780@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2015 10:45:56 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Exynos platform has been fully converted to device tree, so old platform
device based init data can be now removed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 4617b873d91f..ce313486d3bd 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1268,18 +1268,6 @@ static struct mixer_drv_data exynos4210_mxr_drv_data = {
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
@@ -1358,23 +1346,20 @@ static int mixer_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mixer_drv_data *drv;
 	struct mixer_context *ctx;
+	const struct of_device_id *match;
 	int ret;
 
+	if (!dev->of_node)
+		return -ENODEV;
+
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx) {
 		DRM_ERROR("failed to alloc mixer context.\n");
 		return -ENOMEM;
 	}
 
-	if (dev->of_node) {
-		const struct of_device_id *match;
-
-		match = of_match_node(mixer_match_types, dev->of_node);
-		drv = (struct mixer_drv_data *)match->data;
-	} else {
-		drv = (struct mixer_drv_data *)
-			platform_get_device_id(pdev)->driver_data;
-	}
+	match = of_match_node(mixer_match_types, dev->of_node);
+	drv = (struct mixer_drv_data *)match->data;
 
 	ctx->pdev = pdev;
 	ctx->dev = dev;
@@ -1479,5 +1464,4 @@ struct platform_driver mixer_driver = {
 	},
 	.probe = mixer_probe,
 	.remove = mixer_remove,
-	.id_table	= mixer_driver_types,
 };
-- 
1.9.2
