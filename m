From: Yizhuo <yzhai003@ucr.edu>
Subject: [PATCH] drm/exynos: gsc: Variable "gscblk_cfg" in function gsc_set_gscblk_fimd_wb() could be uninitialized
Date: Mon, 28 Jan 2019 10:28:51 -0800
Message-ID: <20190128182851.8558-1-yzhai003@ucr.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Yizhuo <yzhai003@ucr.edu>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

In function gsc_set_gscblk_fimd_wb(), local variable "gscblk_cfg"
could be uninitialized of function regmap_read returns -EINVAL.
However, this value will be  write to the register after "or"
operation. This is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 0506b2b17ac1..b1d0f974fe80 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -441,11 +441,16 @@ static int gsc_sw_reset(struct gsc_context *ctx)
 static void gsc_set_gscblk_fimd_wb(struct gsc_context *ctx, bool enable)
 {
 	unsigned int gscblk_cfg;
+	int ret;
 
 	if (!ctx->sysreg)
 		return;
 
-	regmap_read(ctx->sysreg, SYSREG_GSCBLK_CFG1, &gscblk_cfg);
+	ret = regmap_read(ctx->sysreg, SYSREG_GSCBLK_CFG1, &gscblk_cfg);
+	if (ret) {
+		DRM_ERROR("gsc: Fail to read system register\n");
+		return;
+	}
 
 	if (enable)
 		gscblk_cfg |= GSC_BLK_DISP1WB_DEST(ctx->id) |
-- 
2.17.1
