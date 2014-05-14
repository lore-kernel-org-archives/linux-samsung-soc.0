From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 02/18] drm/exynos: use wait_event_timeout() for safety usage
Date: Wed, 14 May 2014 15:26:49 +0900
Message-ID: <1400048825-6052-3-git-send-email-yj44.cho@samsung.com>
References: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50034 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750857AbaENG1L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 02:27:11 -0400
In-reply-to: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

There could be the case that the page flip operation isn't finished correctly
with some abnormal condition such as panel reset. So this patch replaces
wait_event() with wait_event_timeout() to avoid waiting for page flip completion
infinitely.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 95c9435..485fa26 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -69,8 +69,9 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 
 	if (mode > DRM_MODE_DPMS_ON) {
 		/* wait for the completion of page flip. */
-		wait_event(exynos_crtc->pending_flip_queue,
-				atomic_read(&exynos_crtc->pending_flip) == 0);
+		wait_event_timeout(exynos_crtc->pending_flip_queue,
+				!atomic_read(&exynos_crtc->pending_flip),
+				HZ/20);
 		drm_vblank_off(crtc->dev, exynos_crtc->pipe);
 	}
 
-- 
1.7.9.5
