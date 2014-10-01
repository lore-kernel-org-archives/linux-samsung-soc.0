From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: fix vblank handling during dpms off
Date: Wed, 01 Oct 2014 10:14:47 +0200
Message-ID: <1412151287-12845-1-git-send-email-a.hajda@samsung.com>
References: <542B9A0E.7020206@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <542B9A0E.7020206@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch disables vblanks during dpms off only if pagefilp has
not been finished. It also replaces drm_vblank_off with drm_crtc_vblank_put.
It fixes issue with page_flip ioctl not being able to acquire vblank counter.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Inki,

This is fix (or just workaround) of the problem you have reported.
Please carefully verify it, as I am not familiar with pageflip code.

Regards
Andrzej
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 8e38e9f..57fa94d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -69,9 +69,10 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 		/* wait for the completion of page flip. */
 		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
 				!atomic_read(&exynos_crtc->pending_flip),
-				HZ/20))
+				HZ/20)) {
 			atomic_set(&exynos_crtc->pending_flip, 0);
-		drm_vblank_off(crtc->dev, exynos_crtc->pipe);
+			drm_crtc_vblank_put(crtc);
+		}
 	}
 
 	if (manager->ops->dpms)
-- 
1.9.1
