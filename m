From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/7] drm/exynos: hdmi: use generic of_device_get_match_data
 helper
Date: Fri, 01 Apr 2016 15:17:44 +0200
Message-ID: <1459516666-2004-6-git-send-email-m.szyprowski@samsung.com>
References: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:39458 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752734AbcDANSO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:14 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y005JRIAB96A0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:11 +0100 (BST)
In-reply-to: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Simplify code by replacing custom code by generic helper.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 06105feb6c87..fb1c0f2850dc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2015,7 +2015,6 @@ static struct device_node *hdmi_legacy_phy_dt_binding(struct device *dev)
 static int hdmi_probe(struct platform_device *pdev)
 {
 	struct device_node *ddc_node, *phy_node;
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct hdmi_context *hdata;
 	struct resource *res;
@@ -2025,11 +2024,7 @@ static int hdmi_probe(struct platform_device *pdev)
 	if (!hdata)
 		return -ENOMEM;
 
-	match = of_match_device(hdmi_match_types, dev);
-	if (!match)
-		return -ENODEV;
-
-	hdata->drv_data = match->data;
+	hdata->drv_data = of_device_get_match_data(dev);
 
 	platform_set_drvdata(pdev, hdata);
 
-- 
1.9.2
