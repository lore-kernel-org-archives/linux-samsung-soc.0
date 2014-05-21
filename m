From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v2 02/18] drm/exynos: use wait_event_timeout() for safety usage
Date: Wed, 21 May 2014 13:42:54 +0900
Message-ID: <1400647390-26590-3-git-send-email-yj44.cho@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

There could be the case that the page flip operation isn't finished correctly
with some abnormal condition such as panel reset. So this patch replaces
wait_event() with wait_event_timeout() to avoid waiting for page flip completion
infinitely.
And clears exynos_crtc->pending_flip in exynos_drm_crtc_page_flip() when
exynos_drm_crtc_mode_set_commit() is failed.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |    7 +++++--
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
1.7.9.5
