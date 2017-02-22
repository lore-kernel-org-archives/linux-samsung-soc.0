From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/4] drm/exynos/decon5433: signal frame done interrupt at VSYNC
Date: Wed, 22 Feb 2017 17:05:05 +0100
Message-ID: <1487779505-4062-5-git-send-email-a.hajda@samsung.com>
References: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
 <CGME20170222160517eucas1p1a254801abe01ae5ee77681ff4f955ba8@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62620 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753699AbdBVQFV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 11:05:21 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OLS00DKJA0UF680@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2017 16:05:19 +0000 (GMT)
In-reply-to: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

DECON in case of video mode generates interrupt by default at start
of vertical back porch. As this interrupt is used to generate VBLANK
events more optimal point is start of vertical front porch.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
 include/video/exynos5433_decon.h              | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index bfa9396..2694b32 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -105,7 +105,7 @@ static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 		if (ctx->out_type & IFTYPE_I80)
 			val |= VIDINTCON0_FRAMEDONE;
 		else
-			val |= VIDINTCON0_INTFRMEN;
+			val |= VIDINTCON0_INTFRMEN | VIDINTCON0_FRAMESEL_FP;
 
 		writel(val, ctx->addr + DECON_VIDINTCON0);
 	}
diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
index beefc62..2391b03 100644
--- a/include/video/exynos5433_decon.h
+++ b/include/video/exynos5433_decon.h
@@ -128,6 +128,10 @@
 
 /* VIDINTCON0 */
 #define VIDINTCON0_FRAMEDONE		(1 << 17)
+#define VIDINTCON0_FRAMESEL_BP		(0 << 15)
+#define VIDINTCON0_FRAMESEL_VS		(1 << 15)
+#define VIDINTCON0_FRAMESEL_AC		(2 << 15)
+#define VIDINTCON0_FRAMESEL_FP		(3 << 15)
 #define VIDINTCON0_INTFRMEN		(1 << 12)
 #define VIDINTCON0_INTEN		(1 << 0)
 
-- 
2.7.4
