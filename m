From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH] drm/exynos: fimc: enable autosuspend for runtime PM
Date: Fri, 29 Sep 2017 15:24:01 +0200
Message-ID: <20170929132401.3417-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:37408 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750877AbdI2NYJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 09:24:09 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 1c48c57381f1..bffb4b513453 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1009,7 +1009,8 @@ static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 		struct exynos_drm_ipp_task *task = ctx->task;
 
 		ctx->task = NULL;
-		pm_runtime_put(ctx->dev);
+		pm_runtime_mark_last_busy(ctx->dev);
+		pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, 0);
 	}
 
@@ -1158,7 +1159,8 @@ static void fimc_abort(struct exynos_drm_ipp *ipp,
 		struct exynos_drm_ipp_task *task = ctx->task;
 
 		ctx->task = NULL;
-		pm_runtime_put(ctx->dev);
+		pm_runtime_mark_last_busy(ctx->dev);
+		pm_runtime_put_autosuspend(ctx->dev);
 		exynos_drm_ipp_task_done(task, -EIO);
 	}
 }
@@ -1329,6 +1331,8 @@ static int fimc_probe(struct platform_device *pdev)
 	spin_lock_init(&ctx->lock);
 	platform_set_drvdata(pdev, ctx);
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_enable(dev);
 
 	ret = component_add(dev, &fimc_component_ops);
@@ -1340,6 +1344,7 @@ static int fimc_probe(struct platform_device *pdev)
 	return 0;
 
 err_pm_dis:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	fimc_put_clocks(ctx);
 
@@ -1352,6 +1357,7 @@ static int fimc_remove(struct platform_device *pdev)
 	struct fimc_context *ctx = get_fimc_context(dev);
 
 	component_del(dev, &fimc_component_ops);
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
 	fimc_put_clocks(ctx);
-- 
2.13.5
