From: Colin King <colin.king@canonical.com>
Subject: [PATCH] drm/exynos: gsc: fix spelling mistakes
Date: Tue,  1 Nov 2016 20:23:36 -0600
Message-ID: <20161102022336.32299-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fixes to spelling mistakes "precalser" to "prescaler"
in dev_err messages

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 147ef0d..9587157 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1433,7 +1433,7 @@ static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 		&img_pos[EXYNOS_DRM_OPS_SRC],
 		&img_pos[EXYNOS_DRM_OPS_DST]);
 	if (ret) {
-		dev_err(dev, "failed to set precalser.\n");
+		dev_err(dev, "failed to set prescaler.\n");
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 52a9d26..bef5798 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1610,7 +1610,7 @@ static int gsc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 		&img_pos[EXYNOS_DRM_OPS_SRC],
 		&img_pos[EXYNOS_DRM_OPS_DST]);
 	if (ret) {
-		dev_err(dev, "failed to set precalser.\n");
+		dev_err(dev, "failed to set prescaler.\n");
 		return ret;
 	}
 
-- 
2.9.3
