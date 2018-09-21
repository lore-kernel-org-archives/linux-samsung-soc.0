From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 1/3] drm/exynos: drm_plane: Correct exynos_drm_plane_reset
Date: Fri, 21 Sep 2018 14:24:36 +0200
Message-ID: <20180921122612eucas1p2f3e0b6cf2e15553bd4d7114722c2a217~WaeklfEj21399713997eucas1p2a@eucas1p2.samsung.com>
References: <1537532678-4276-1-git-send-email-c.manszewski@samsung.com>
        <CGME20180921122612eucas1p2f3e0b6cf2e15553bd4d7114722c2a217@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537532678-4276-1-git-send-email-c.manszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Make use of helper functions in exynos_drm_plane_reset in order to set
all default values. Currently alpha isn't set during reset.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index dba29aec59b4..755ca0e9ead2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -131,16 +131,14 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
 
 	if (plane->state) {
 		exynos_state = to_exynos_plane_state(plane->state);
-		if (exynos_state->base.fb)
-			drm_framebuffer_put(exynos_state->base.fb);
+		__drm_atomic_helper_plane_destroy_state(plane->state);
 		kfree(exynos_state);
 		plane->state = NULL;
 	}
 
 	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
 	if (exynos_state) {
-		plane->state = &exynos_state->base;
-		plane->state->plane = plane;
+		__drm_atomic_helper_plane_reset(plane, &exynos_state->base);
 		plane->state->zpos = exynos_plane->config->zpos;
 	}
 }
-- 
2.7.4
