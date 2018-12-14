From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 3/6] drm/exynos: drm_drv: Extend exynos_drm_plane_config
Date: Fri, 14 Dec 2018 13:10:18 +0100
Message-ID: <1544789421-5265-4-git-send-email-c.manszewski@samsung.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
 <CGME20181214121035eucas1p11c9465bd3d5398c7d9c947c2e1844854@eucas1p1.samsung.com>
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

Define new range capability and add range value to
exynos_drm_plane_config.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 5e61e707f955..1bc334d846c5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -94,6 +94,7 @@ struct exynos_drm_plane {
 #define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
 #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND	(1 << 4)
 #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND	(1 << 5)
+#define EXYNOS_DRM_PLANE_CAP_RANGE	(1 << 6)
 
 /*
  * Exynos DRM plane configuration structure.
@@ -111,6 +112,7 @@ struct exynos_drm_plane_config {
 	const uint32_t *pixel_formats;
 	unsigned int num_pixel_formats;
 	unsigned int capabilities;
+	enum drm_color_range range;
 };
 
 /*
-- 
2.7.4
