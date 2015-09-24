From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] drm/exynos: fimc: Clock control is unused if !PM
Date: Thu, 24 Sep 2015 12:14:14 +0200
Message-ID: <1443089655-15352-2-git-send-email-thierry.reding@gmail.com>
References: <1443089655-15352-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:33276 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753640AbbIXKOY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Sep 2015 06:14:24 -0400
Received: by pacex6 with SMTP id ex6so69222814pac.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2015 03:14:24 -0700 (PDT)
In-Reply-To: <1443089655-15352-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Protect the fimc_clk_ctrl() function with an #ifdef CONFIG_PM guard to
avoid "defined but not used" warnings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 2a652359af64..dd3a5e6d58c8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1206,23 +1206,6 @@ static struct exynos_drm_ipp_ops fimc_dst_ops = {
 	.set_addr = fimc_dst_set_addr,
 };
 
-static int fimc_clk_ctrl(struct fimc_context *ctx, bool enable)
-{
-	DRM_DEBUG_KMS("enable[%d]\n", enable);
-
-	if (enable) {
-		clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
-		clk_prepare_enable(ctx->clocks[FIMC_CLK_WB_A]);
-		ctx->suspended = false;
-	} else {
-		clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
-		clk_disable_unprepare(ctx->clocks[FIMC_CLK_WB_A]);
-		ctx->suspended = true;
-	}
-
-	return 0;
-}
-
 static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 {
 	struct fimc_context *ctx = dev_id;
@@ -1780,6 +1763,24 @@ static int fimc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int fimc_clk_ctrl(struct fimc_context *ctx, bool enable)
+{
+	DRM_DEBUG_KMS("enable[%d]\n", enable);
+
+	if (enable) {
+		clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
+		clk_prepare_enable(ctx->clocks[FIMC_CLK_WB_A]);
+		ctx->suspended = false;
+	} else {
+		clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
+		clk_disable_unprepare(ctx->clocks[FIMC_CLK_WB_A]);
+		ctx->suspended = true;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int fimc_suspend(struct device *dev)
 {
@@ -1806,7 +1807,6 @@ static int fimc_resume(struct device *dev)
 }
 #endif
 
-#ifdef CONFIG_PM
 static int fimc_runtime_suspend(struct device *dev)
 {
 	struct fimc_context *ctx = get_fimc_context(dev);
-- 
2.5.0
