From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v4 PATCH 02/18] drm/exynos: use wait_event_timeout() for safety
 usage
Date: Wed, 07 May 2014 16:46:23 +0900
Message-ID: <1399448799-8057-3-git-send-email-yj44.cho@samsung.com>
References: <1399448799-8057-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1399448799-8057-1-git-send-email-yj44.cho@samsung.com>
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

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index e930d4f..1419d11 100644
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
