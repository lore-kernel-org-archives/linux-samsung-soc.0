From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/5] drm/exynos/fimd: signal frame done interrupt at front porch
Date: Tue, 14 Mar 2017 09:27:59 +0100
Message-ID: <1489480080-25633-5-git-send-email-a.hajda@samsung.com>
References: <1489480080-25633-1-git-send-email-a.hajda@samsung.com>
 <CGME20170314082811eucas1p1c5d00e38d863a54d8fb2585ffde8fa7b@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:61000 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750861AbdCNI2Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 04:28:16 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMS00FRYQ71E250@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Mar 2017 08:28:13 +0000 (GMT)
In-reply-to: <1489480080-25633-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

VBLANK interrupt should be signalled as soon as scanout ends, front porch
is the best moment.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a3162a4..3f04d72 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -243,7 +243,7 @@ static int fimd_enable_vblank(struct exynos_drm_crtc *crtc)
 			val |= VIDINTCON0_INT_FRAME;
 
 			val &= ~VIDINTCON0_FRAMESEL0_MASK;
-			val |= VIDINTCON0_FRAMESEL0_VSYNC;
+			val |= VIDINTCON0_FRAMESEL0_FRONTPORCH;
 			val &= ~VIDINTCON0_FRAMESEL1_MASK;
 			val |= VIDINTCON0_FRAMESEL1_NONE;
 		}
-- 
2.7.4
