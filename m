From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 10/10] drm/exynos: exynos5433_decon: fix wrong state in
 decon_vblank_enable
Date: Wed, 03 Feb 2016 13:42:54 +0100
Message-ID: <1454503374-16382-11-git-send-email-m.szyprowski@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54372 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933679AbcBCMnS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Feb 2016 07:43:18 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1Z005I12031F90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Feb 2016 12:43:15 +0000 (GMT)
In-reply-to: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

BIT_IRQS_ENABLED was never set because of incorrect test in
decon_vlank_enable() function, what resulted in lack of enabling vblank
support. This patch fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index c793316..107224a 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -93,7 +93,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 	if (test_bit(BIT_SUSPENDED, &ctx->flags))
 		return -EPERM;
 
-	if (test_and_set_bit(BIT_IRQS_ENABLED, &ctx->flags)) {
+	if (!test_and_set_bit(BIT_IRQS_ENABLED, &ctx->flags)) {
 		val = VIDINTCON0_INTEN;
 		if (ctx->out_type == IFTYPE_I80)
 			val |= VIDINTCON0_FRAMEDONE;
-- 
1.9.2
