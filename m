From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 7/7] drm/exynos: mixer: use generic of_device_get_match_data
 helper
Date: Fri, 01 Apr 2016 15:17:46 +0200
Message-ID: <1459516666-2004-8-git-send-email-m.szyprowski@samsung.com>
References: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14541 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbcDANSO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:14 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y00B52IADL010@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:13 +0100 (BST)
In-reply-to: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Simplify code by replacing custom code by generic helper.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index ffafb744154e..caec5e4fb349 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -31,6 +31,7 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/component.h>
 
 #include <drm/exynos_drm.h>
@@ -1231,7 +1232,7 @@ static const struct component_ops mixer_component_ops = {
 static int mixer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct mixer_drv_data *drv;
+	const struct mixer_drv_data *drv;
 	struct mixer_context *ctx;
 	int ret;
 
@@ -1241,12 +1242,7 @@ static int mixer_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	if (dev->of_node) {
-		const struct of_device_id *match;
-
-		match = of_match_node(mixer_match_types, dev->of_node);
-		drv = (struct mixer_drv_data *)match->data;
-	}
+	drv = of_device_get_match_data(dev);
 
 	ctx->pdev = pdev;
 	ctx->dev = dev;
-- 
1.9.2
