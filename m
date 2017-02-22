From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/4] drm/exynos: simplify completion event handling
Date: Wed, 22 Feb 2017 17:05:03 +0100
Message-ID: <1487779505-4062-3-git-send-email-a.hajda@samsung.com>
References: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
 <CGME20170222160516eucas1p298a994725044878022fece1600f9e36a@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62620 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753919AbdBVQFU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 11:05:20 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OLS00DLCA0TVI80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Feb 2017 16:05:17 +0000 (GMT)
In-reply-to: <1487779505-4062-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>

All Exynos CRTC drivers shouldn't fail at referencing vblank events,
alternate path is actually dead code.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index c65f450..5b7cd77 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -105,16 +105,15 @@ void exynos_crtc_handle_event(struct exynos_drm_crtc *exynos_crtc)
 	struct drm_pending_vblank_event *event = crtc->state->event;
 	unsigned long flags;
 
-	if (event) {
-		crtc->state->event = NULL;
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
-		if (drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
-	}
+	if (!event)
+		return;
+	crtc->state->event = NULL;
+
+	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	drm_crtc_arm_vblank_event(crtc, event);
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 }
 
 static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
-- 
2.7.4
