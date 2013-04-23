From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5] drm/exynos: enable FIMD clocks
Date: Tue, 23 Apr 2013 17:19:50 +0530
Message-ID: <1366717790-18507-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:60502 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755361Ab3DWLuB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 07:50:01 -0400
Received: by mail-pd0-f177.google.com with SMTP id p11so383618pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 04:50:00 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, sylvester.nawrocki@gmail.com, kgene.kim@samsung.com, t.figa@samsung.com, viresh.kumar@linaro.org

Common Clock Framework introduced the need to prepare clocks before
enabling them, otherwise clk_enable() fails. This patch adds clk_prepare_enable
and clk_disable_unprepare() calls to the driver.
This patch also removes clk_disable() from fimd_remove() as it will be done
by pm_runtime_put_sync.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
Changes since v4:
	- replaced clk_enable() and clk_disable() with
	clk_prepare_enable() and clk_disable_unprepare() in fimd_clock()
	and removed clk_disable() from fimd_remove() as dicussed at
	http://lists.freedesktop.org/archives/dri-devel/2013-April/037727.html

Changes since v3:
	- added clk_prepare() in fimd_probe() and clk_unprepare() in fimd_remove()
	 as suggested by Viresh Kumar <viresh.kumar@linaro.org>

Changes since v2:
	- moved clk_prepare_enable() and clk_disable_unprepare() from 
	fimd_probe() to fimd_clock() as suggested by Inki Dae <inki.dae@samsung.com>

Changes since v1:
	- added error checking for clk_prepare_enable() and also replaced 
	clk_disable() with clk_disable_unprepare() during exit.
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 4073430..746b282 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -801,18 +801,18 @@ static int fimd_clock(struct fimd_context *ctx, bool enable)
 	if (enable) {
 		int ret;
 
-		ret = clk_enable(ctx->bus_clk);
+		ret = clk_prepare_enable(ctx->bus_clk);
 		if (ret < 0)
 			return ret;
 
-		ret = clk_enable(ctx->lcd_clk);
+		ret = clk_prepare_enable(ctx->lcd_clk);
 		if  (ret < 0) {
-			clk_disable(ctx->bus_clk);
+			clk_disable_unprepare(ctx->bus_clk);
 			return ret;
 		}
 	} else {
-		clk_disable(ctx->lcd_clk);
-		clk_disable(ctx->bus_clk);
+		clk_disable_unprepare(ctx->lcd_clk);
+		clk_disable_unprepare(ctx->bus_clk);
 	}
 
 	return 0;
@@ -996,9 +996,6 @@ static int fimd_remove(struct platform_device *pdev)
 	if (ctx->suspended)
 		goto out;
 
-	clk_disable(ctx->lcd_clk);
-	clk_disable(ctx->bus_clk);
-
 	pm_runtime_set_suspended(dev);
 	pm_runtime_put_sync(dev);
 
-- 
1.7.9.5
