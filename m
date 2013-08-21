From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] drm/exynos: fimd: move platform data parsing to separate
 function
Date: Wed, 21 Aug 2013 16:22:03 +0200
Message-ID: <1377094923-6919-4-git-send-email-a.hajda@samsung.com>
References: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22836 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751536Ab3HUOWr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 10:22:47 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MRV00KYPX9PZ9B0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Aug 2013 15:22:46 +0100 (BST)
In-reply-to: <1377094923-6919-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, t.figa@samsung.com, s.nawrocki@samsung.com

The patch moves platfrom_data and device tree parsing
to separate function.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 63 ++++++++++++++++----------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 6afcaf1..130dea5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -122,7 +122,7 @@ struct fimd_context {
 	wait_queue_head_t		wait_vsync_queue;
 	atomic_t			wait_vsync_event;
 
-	struct exynos_drm_panel_info *panel;
+	struct exynos_drm_panel_info panel;
 	struct fimd_driver_data *driver_data;
 };
 
@@ -164,7 +164,7 @@ static void *fimd_get_panel(struct device *dev)
 {
 	struct fimd_context *ctx = get_fimd_context(dev);
 
-	return ctx->panel;
+	return &ctx->panel;
 }
 
 static int fimd_check_mode(struct device *dev, struct drm_display_mode *mode)
@@ -244,7 +244,7 @@ static void fimd_apply(struct device *subdrv_dev)
 static void fimd_commit(struct device *dev)
 {
 	struct fimd_context *ctx = get_fimd_context(dev);
-	struct exynos_drm_panel_info *panel = ctx->panel;
+	struct exynos_drm_panel_info *panel = &ctx->panel;
 	struct videomode *vm = &panel->vm;
 	struct fimd_driver_data *driver_data;
 	u32 val;
@@ -755,7 +755,7 @@ static void fimd_subdrv_remove(struct drm_device *drm_dev, struct device *dev)
 
 static int fimd_configure_clocks(struct fimd_context *ctx, struct device *dev)
 {
-	struct videomode *vm = &ctx->panel->vm;
+	struct videomode *vm = &ctx->panel.vm;
 	unsigned long clk;
 
 	ctx->bus_clk = devm_clk_get(dev, "fimd");
@@ -892,24 +892,13 @@ static int fimd_activate(struct fimd_context *ctx, bool enable)
 	return 0;
 }
 
-static int fimd_probe(struct platform_device *pdev)
+static int fimd_get_platform_data(struct fimd_context *ctx, struct device *dev)
 {
-	struct device *dev = &pdev->dev;
-	struct fimd_context *ctx;
-	struct exynos_drm_subdrv *subdrv;
-	struct exynos_drm_fimd_pdata *pdata;
-	struct exynos_drm_panel_info *panel;
-	struct resource *res;
-	int win;
-	int ret = -EINVAL;
-
 	if (dev->of_node) {
 		struct videomode *vm;
-		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
+		int ret;
 
-		vm = &pdata->panel.vm;
+		vm = &ctx->panel.vm;
 		ret = of_get_videomode(dev->of_node, vm, OF_USE_NATIVE_MODE);
 		if (ret) {
 			DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
@@ -917,31 +906,45 @@ static int fimd_probe(struct platform_device *pdev)
 		}
 
 		if (vm->flags & DISPLAY_FLAGS_VSYNC_LOW)
-			pdata->vidcon1 |= VIDCON1_INV_VSYNC;
+			ctx->vidcon1 |= VIDCON1_INV_VSYNC;
 		if (vm->flags & DISPLAY_FLAGS_HSYNC_LOW)
-			pdata->vidcon1 |= VIDCON1_INV_HSYNC;
+			ctx->vidcon1 |= VIDCON1_INV_HSYNC;
 		if (vm->flags & DISPLAY_FLAGS_DE_LOW)
-			pdata->vidcon1 |= VIDCON1_INV_VDEN;
+			ctx->vidcon1 |= VIDCON1_INV_VDEN;
 		if (vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
-			pdata->vidcon1 |= VIDCON1_INV_VCLK;
+			ctx->vidcon1 |= VIDCON1_INV_VCLK;
 	} else {
-		pdata = dev->platform_data;
+		struct exynos_drm_fimd_pdata *pdata = dev->platform_data;
 		if (!pdata) {
 			DRM_ERROR("no platform data specified\n");
 			return -EINVAL;
 		}
+		ctx->vidcon0 = pdata->vidcon0;
+		ctx->vidcon1 = pdata->vidcon1;
+		ctx->default_win = pdata->default_win;
+		ctx->panel = pdata->panel;
 	}
 
-	panel = &pdata->panel;
-	if (!panel) {
-		dev_err(dev, "panel is null.\n");
-		return -EINVAL;
-	}
+	return 0;
+}
+
+static int fimd_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fimd_context *ctx;
+	struct exynos_drm_subdrv *subdrv;
+	struct resource *res;
+	int win;
+	int ret = -EINVAL;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ret = fimd_get_platform_data(ctx, dev);
+	if (ret)
+		return ret;
+
 	ret = fimd_configure_clocks(ctx, dev);
 	if (ret)
 		return ret;
@@ -968,10 +971,6 @@ static int fimd_probe(struct platform_device *pdev)
 	}
 
 	ctx->driver_data = drm_fimd_get_driver_data(pdev);
-	ctx->vidcon0 = pdata->vidcon0;
-	ctx->vidcon1 = pdata->vidcon1;
-	ctx->default_win = pdata->default_win;
-	ctx->panel = panel;
 	DRM_INIT_WAITQUEUE(&ctx->wait_vsync_queue);
 	atomic_set(&ctx->wait_vsync_event, 0);
 
-- 
1.8.1.2
