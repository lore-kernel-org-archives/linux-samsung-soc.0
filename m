From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/7] drm/exynos/decon5433: reset decon on start
Date: Wed, 23 Mar 2016 14:15:17 +0100
Message-ID: <1458738918-32054-7-git-send-email-a.hajda@samsung.com>
References: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36081 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755422AbcCWNPz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:15:55 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00CS5U5YOC90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:15:34 +0000 (GMT)
In-reply-to: <1458738918-32054-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Resetting IP at starting ensures that DECON will be in known state
regardless of changes by bootloader.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 7fec656..120efd8 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -400,6 +400,8 @@ static void decon_enable(struct exynos_drm_crtc *crtc)
 
 	set_bit(BIT_CLKS_ENABLED, &ctx->flags);
 
+	decon_swreset(ctx);
+
 	/* if vblank was enabled status, enable it again. */
 	if (test_and_clear_bit(BIT_IRQS_ENABLED, &ctx->flags))
 		decon_enable_vblank(ctx->crtc);
-- 
1.9.1
