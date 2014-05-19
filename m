From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/8] drm/exynos/fimc: simplify pre-scaler ratio calculation
Date: Mon, 19 May 2014 12:54:06 +0200
Message-ID: <1400496850-23860-5-git-send-email-a.hajda@samsung.com>
References: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: open list <linux-kernel@vger.kernel.org>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch replaces dedicated function for scaling ratio
calculation by fls calls.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 56 ++++++++------------------------
 1 file changed, 13 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 5060f8a..d40b7fb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -957,43 +957,13 @@ static int fimc_dst_set_transf(struct device *dev,
 	return 0;
 }
 
-static int fimc_get_ratio_shift(u32 src, u32 dst, u32 *ratio, u32 *shift)
-{
-	DRM_DEBUG_KMS("src[%d]dst[%d]\n", src, dst);
-
-	if (src >= dst * 64) {
-		DRM_ERROR("failed to make ratio and shift.\n");
-		return -EINVAL;
-	} else if (src >= dst * 32) {
-		*ratio = 32;
-		*shift = 5;
-	} else if (src >= dst * 16) {
-		*ratio = 16;
-		*shift = 4;
-	} else if (src >= dst * 8) {
-		*ratio = 8;
-		*shift = 3;
-	} else if (src >= dst * 4) {
-		*ratio = 4;
-		*shift = 2;
-	} else if (src >= dst * 2) {
-		*ratio = 2;
-		*shift = 1;
-	} else {
-		*ratio = 1;
-		*shift = 0;
-	}
-
-	return 0;
-}
-
 static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
 		struct drm_exynos_pos *src, struct drm_exynos_pos *dst)
 {
 	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg, cfg_ext, shfactor;
 	u32 pre_dst_width, pre_dst_height;
-	u32 pre_hratio, hfactor, pre_vratio, vfactor;
+	u32 hfactor, vfactor;
 	int ret = 0;
 	u32 src_w, src_h, dst_w, dst_h;
 
@@ -1014,24 +984,24 @@ static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
 		dst_h = dst->h;
 	}
 
-	ret = fimc_get_ratio_shift(src_w, dst_w, &pre_hratio, &hfactor);
-	if (ret) {
+	/* fimc_ippdrv_check_property assures that dividers are not null */
+	hfactor = fls(src_w / dst_w / 2);
+	if (hfactor > FIMC_SHFACTOR / 2) {
 		dev_err(ippdrv->dev, "failed to get ratio horizontal.\n");
-		return ret;
+		return -EINVAL;
 	}
 
-	ret = fimc_get_ratio_shift(src_h, dst_h, &pre_vratio, &vfactor);
-	if (ret) {
+	vfactor = fls(src_h / dst_h / 2);
+	if (vfactor > FIMC_SHFACTOR / 2) {
 		dev_err(ippdrv->dev, "failed to get ratio vertical.\n");
-		return ret;
+		return -EINVAL;
 	}
 
-	pre_dst_width = src_w / pre_hratio;
-	pre_dst_height = src_h / pre_vratio;
+	pre_dst_width = src_w >> hfactor;
+	pre_dst_height = src_h >> vfactor;
 	DRM_DEBUG_KMS("pre_dst_width[%d]pre_dst_height[%d]\n",
 		pre_dst_width, pre_dst_height);
-	DRM_DEBUG_KMS("pre_hratio[%d]hfactor[%d]pre_vratio[%d]vfactor[%d]\n",
-		pre_hratio, hfactor, pre_vratio, vfactor);
+	DRM_DEBUG_KMS("hfactor[%d]vfactor[%d]\n", hfactor, vfactor);
 
 	sc->hratio = (src_w << 14) / (dst_w << hfactor);
 	sc->vratio = (src_h << 14) / (dst_h << vfactor);
@@ -1044,8 +1014,8 @@ static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
 	DRM_DEBUG_KMS("shfactor[%d]\n", shfactor);
 
 	cfg = (EXYNOS_CISCPRERATIO_SHFACTOR(shfactor) |
-		EXYNOS_CISCPRERATIO_PREHORRATIO(pre_hratio) |
-		EXYNOS_CISCPRERATIO_PREVERRATIO(pre_vratio));
+		EXYNOS_CISCPRERATIO_PREHORRATIO(1 << hfactor) |
+		EXYNOS_CISCPRERATIO_PREVERRATIO(1 << vfactor));
 	fimc_write(cfg, EXYNOS_CISCPRERATIO);
 
 	cfg = (EXYNOS_CISCPREDST_PREDSTWIDTH(pre_dst_width) |
-- 
1.9.1
