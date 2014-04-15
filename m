From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: balance framebuffer refcount
Date: Tue, 15 Apr 2014 15:33:01 +0200
Message-ID: <1397568781-23108-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

exynos_drm_crtc_mode_set assigns primary framebuffer to plane without
taking reference. Then during framebuffer removal it is dereferenced twice,
causing oops. The patch fixes it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi,

This patch fixes framebuffer refcount balancing. The issue
appeared after merge of universal plane related patches.
Similar issue affected omap [1].

[1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/104108

Regards
Andrzej
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index e930d4f..1ef5ab9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -145,6 +145,7 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 
 	plane->crtc = crtc;
 	plane->fb = crtc->primary->fb;
+	drm_framebuffer_reference(plane->fb);
 
 	return 0;
 }
-- 
1.8.3.2
