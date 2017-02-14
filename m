From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/exynos/decon5433: & vs | typo
Date: Tue, 14 Feb 2017 10:46:20 +0300
Message-ID: <20170214074620.GA9710@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

"&" was obviously intended instead of "|".  The original condition is
always true.

Fixes: b93c2e8b5d9d ("drm/exynos/decon5433: configure sysreg in case of hardware trigger")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 0fd6f7a18364..cca32a4fdab3 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -678,7 +678,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 		ctx->out_type |= IFTYPE_I80;
 	}
 
-	if (ctx->out_type | I80_HW_TRG) {
+	if (ctx->out_type & I80_HW_TRG) {
 		ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
 							"samsung,disp-sysreg");
 		if (IS_ERR(ctx->sysreg)) {
