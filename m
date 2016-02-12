From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/4] drm/exynos/fimc: remove unused camera interface
 polarization code
Date: Fri, 12 Feb 2016 13:13:57 +0100
Message-ID: <1455279239-13609-3-git-send-email-a.hajda@samsung.com>
References: <1455279239-13609-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59269 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345AbcBLMPO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 07:15:14 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2F00I4GOPBQH00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Feb 2016 12:15:11 +0000 (GMT)
In-reply-to: <1455279239-13609-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, emil.l.velikov@gmail.com

Polarization was never configured for DRM-FIMC device, so fimc_set_polarity
function did nothing. In fact DRM does not use camera interface so there
is no point in configuring it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 8a4f4a0..0525c56 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -163,7 +163,6 @@ struct fimc_context {
 	u32		clk_frequency;
 	struct regmap	*sysreg;
 	struct fimc_scaler	sc;
-	struct exynos_drm_ipp_pol	pol;
 	int	id;
 	int	irq;
 	bool	suspended;
@@ -260,32 +259,6 @@ static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb)
 	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
 }
 
-static void fimc_set_polarity(struct fimc_context *ctx,
-		struct exynos_drm_ipp_pol *pol)
-{
-	u32 cfg;
-
-	DRM_DEBUG_KMS("inv_pclk[%d]inv_vsync[%d]\n",
-		pol->inv_pclk, pol->inv_vsync);
-	DRM_DEBUG_KMS("inv_href[%d]inv_hsync[%d]\n",
-		pol->inv_href, pol->inv_hsync);
-
-	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
-	cfg &= ~(EXYNOS_CIGCTRL_INVPOLPCLK | EXYNOS_CIGCTRL_INVPOLVSYNC |
-		 EXYNOS_CIGCTRL_INVPOLHREF | EXYNOS_CIGCTRL_INVPOLHSYNC);
-
-	if (pol->inv_pclk)
-		cfg |= EXYNOS_CIGCTRL_INVPOLPCLK;
-	if (pol->inv_vsync)
-		cfg |= EXYNOS_CIGCTRL_INVPOLVSYNC;
-	if (pol->inv_href)
-		cfg |= EXYNOS_CIGCTRL_INVPOLHREF;
-	if (pol->inv_hsync)
-		cfg |= EXYNOS_CIGCTRL_INVPOLHSYNC;
-
-	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
-}
-
 static void fimc_handle_jpeg(struct fimc_context *ctx, bool enable)
 {
 	u32 cfg;
@@ -1467,7 +1440,6 @@ static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 	/* If set ture, we can save jpeg about screen */
 	fimc_handle_jpeg(ctx, false);
 	fimc_set_scaler(ctx, &ctx->sc);
-	fimc_set_polarity(ctx, &ctx->pol);
 
 	switch (cmd) {
 	case IPP_CMD_M2M:
-- 
1.9.1
