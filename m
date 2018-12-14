From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 5/6] drm/exynos: plane: Add range property to exynos plane
Date: Fri, 14 Dec 2018 13:10:20 +0100
Message-ID: <1544789421-5265-6-git-send-email-c.manszewski@samsung.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
 <CGME20181214121037eucas1p2469a23e8e393bdca487a11260b187510@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Christoph Manszewski <c.manszewski@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Create range property within exynos_drm_plane_init and set to default value
in exynos_drm_plane_reset.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index cf352d980eee..a6ab0e7277f0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -140,6 +140,7 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
 	if (exynos_state) {
 		__drm_atomic_helper_plane_reset(plane, &exynos_state->base);
 		plane->state->zpos = exynos_plane->config->zpos;
+		plane->state->color_range = exynos_plane->config->range;
 	}
 }
 
@@ -301,6 +302,10 @@ int exynos_plane_init(struct drm_device *dev,
 	unsigned int supported_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 				       BIT(DRM_MODE_BLEND_PREMULTI) |
 				       BIT(DRM_MODE_BLEND_COVERAGE);
+
+	u32 supported_ranges = BIT(DRM_COLOR_LIMITED_RANGE) |
+			       BIT(DRM_COLOR_FULL_RANGE);
+
 	struct drm_plane *plane = &exynos_plane->base;
 
 	err = drm_universal_plane_init(dev, plane,
@@ -328,5 +333,9 @@ int exynos_plane_init(struct drm_device *dev,
 	if (config->capabilities & EXYNOS_DRM_PLANE_CAP_WIN_BLEND)
 		drm_plane_create_alpha_property(plane);
 
+	if (config->capabilities & EXYNOS_DRM_PLANE_CAP_RANGE)
+		drm_plane_create_range_property(plane, supported_ranges,
+						config->range);
+
 	return 0;
 }
-- 
2.7.4
