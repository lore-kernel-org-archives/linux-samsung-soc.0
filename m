From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 02/14] drm/exynos: use wait_event_timeout() for safety usage
Date: Thu, 17 Jul 2014 18:01:17 +0900
Message-ID: <1405587689-1466-3-git-send-email-yj44.cho@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48004 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755990AbaGQJBf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 05:01:35 -0400
In-reply-to: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

There could be the case that the page flip operation isn't finished correctly
with some abnormal condition such as panel reset. So this patch replaces
wait_event() with wait_event_timeout() to avoid waiting for page flip completion
infinitely.
And clears exynos_crtc->pending_flip in exynos_drm_crtc_page_flip()
when exynos_drm_crtc_mode_set_commit() is failed.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 95c9435..3bf091d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -69,8 +69,10 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 
 	if (mode > DRM_MODE_DPMS_ON) {
 		/* wait for the completion of page flip. */
-		wait_event(exynos_crtc->pending_flip_queue,
-				atomic_read(&exynos_crtc->pending_flip) == 0);
+		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
+				!atomic_read(&exynos_crtc->pending_flip),
+				HZ/20))
+			atomic_set(&exynos_crtc->pending_flip, 0);
 		drm_vblank_off(crtc->dev, exynos_crtc->pipe);
 	}
 
@@ -259,6 +261,7 @@ static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
 			spin_lock_irq(&dev->event_lock);
 			drm_vblank_put(dev, exynos_crtc->pipe);
 			list_del(&event->base.link);
+			atomic_set(&exynos_crtc->pending_flip, 0);
 			spin_unlock_irq(&dev->event_lock);
 
 			goto out;
-- 
1.9.0
