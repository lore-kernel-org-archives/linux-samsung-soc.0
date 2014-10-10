From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/4] drm/exynos: enable vblank after DPMS on
Date: Fri, 10 Oct 2014 14:31:55 +0200
Message-ID: <1412944316-27737-4-git-send-email-a.hajda@samsung.com>
References: <1412944316-27737-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1412944316-27737-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Before DPMS off driver disables vblank.
It should be balanced by vblank enable after DPMS on.
The patch fixes issue with page_flip ioctl not being able
to acquire vblank counter introduced by patch:
drm: Always reject drm_vblank_get() after drm_vblank_off()

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 8e38e9f..45026e6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -71,13 +71,16 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 				!atomic_read(&exynos_crtc->pending_flip),
 				HZ/20))
 			atomic_set(&exynos_crtc->pending_flip, 0);
-		drm_vblank_off(crtc->dev, exynos_crtc->pipe);
+		drm_crtc_vblank_off(crtc);
 	}
 
 	if (manager->ops->dpms)
 		manager->ops->dpms(manager, mode);
 
 	exynos_crtc->dpms = mode;
+
+	if (mode == DRM_MODE_DPMS_ON)
+		drm_crtc_vblank_on(crtc);
 }
 
 static void exynos_drm_crtc_prepare(struct drm_crtc *crtc)
-- 
1.9.1
