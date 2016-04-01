From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/7] drm/exynos: fimd: use generic of_device_get_match_data
 helper
Date: Fri, 01 Apr 2016 15:17:42 +0200
Message-ID: <1459516666-2004-4-git-send-email-m.szyprowski@samsung.com>
References: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38613 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803AbcDANSO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:14 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y00928IAAQG10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:10 +0100 (BST)
In-reply-to: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Simplify code by replacing custom code by generic helper.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 018449f8d557..4f31a8aa17dd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -219,15 +219,6 @@ static const uint32_t fimd_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
-static inline struct fimd_driver_data *drm_fimd_get_driver_data(
-	struct platform_device *pdev)
-{
-	const struct of_device_id *of_id =
-			of_match_device(fimd_driver_dt_match, &pdev->dev);
-
-	return (struct fimd_driver_data *)of_id->data;
-}
-
 static int fimd_enable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
@@ -1035,7 +1026,7 @@ static int fimd_probe(struct platform_device *pdev)
 
 	ctx->dev = dev;
 	ctx->suspended = true;
-	ctx->driver_data = drm_fimd_get_driver_data(pdev);
+	ctx->driver_data = of_device_get_match_data(dev);
 
 	if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
 		ctx->vidcon1 |= VIDCON1_INV_VDEN;
-- 
1.9.2
