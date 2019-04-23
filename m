From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH next 04/25] drm/exynos: Use dev_get_drvdata()
Date: Tue, 23 Apr 2019 15:49:59 +0800
Message-ID: <20190423075020.173734-5-wangkefeng.wang@huawei.com>
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Using dev_get_drvdata directly.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 8 +++-----
 drivers/gpu/drm/exynos/exynos_drm_gsc.c  | 5 ++---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 90dfea0aec4d..b166572f9a4a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -48,8 +48,6 @@ static unsigned int fimc_mask = 0xc;
 module_param_named(fimc_devs, fimc_mask, uint, 0644);
 MODULE_PARM_DESC(fimc_devs, "Alias mask for assigning FIMC devices to Exynos DRM");
 
-#define get_fimc_context(dev)	platform_get_drvdata(to_platform_device(dev))
-
 enum {
 	FIMC_CLK_LCLK,
 	FIMC_CLK_GATE,
@@ -1364,7 +1362,7 @@ static int fimc_probe(struct platform_device *pdev)
 static int fimc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct fimc_context *ctx = get_fimc_context(dev);
+	struct fimc_context *ctx = dev_get_drvdata(dev);
 
 	component_del(dev, &fimc_component_ops);
 	pm_runtime_dont_use_autosuspend(dev);
@@ -1378,7 +1376,7 @@ static int fimc_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int fimc_runtime_suspend(struct device *dev)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
+	struct fimc_context *ctx = dev_get_drvdata(dev);
 
 	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
 	clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
@@ -1387,7 +1385,7 @@ static int fimc_runtime_suspend(struct device *dev)
 
 static int fimc_runtime_resume(struct device *dev)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
+	struct fimc_context *ctx = dev_get_drvdata(dev);
 
 	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
 	return clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index f048d97fe9e2..0c1e345834bc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -62,7 +62,6 @@
 #define GSC_COEF_DEPTH	3
 #define GSC_AUTOSUSPEND_DELAY		2000
 
-#define get_gsc_context(dev)	platform_get_drvdata(to_platform_device(dev))
 #define gsc_read(offset)		readl(ctx->regs + (offset))
 #define gsc_write(cfg, offset)	writel(cfg, ctx->regs + (offset))
 
@@ -1321,7 +1320,7 @@ static int gsc_remove(struct platform_device *pdev)
 
 static int __maybe_unused gsc_runtime_suspend(struct device *dev)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
+	struct gsc_context *ctx = dev_get_drvdata(dev);
 	int i;
 
 	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
@@ -1334,7 +1333,7 @@ static int __maybe_unused gsc_runtime_suspend(struct device *dev)
 
 static int __maybe_unused gsc_runtime_resume(struct device *dev)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
+	struct gsc_context *ctx = dev_get_drvdata(dev);
 	int i, ret;
 
 	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
-- 
2.20.1
