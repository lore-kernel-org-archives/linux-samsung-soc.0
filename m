From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 1/2] drm/exynos: fimd: Remove drm_dev pointer from fimd_context
Date: Fri, 28 Nov 2014 16:44:00 +0530
Message-ID: <1417173241-27802-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62607 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbaK1LUq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 06:20:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com
Cc: jy0922.shim@samsung.com, jg1.han@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

ctx->drm_dev is unnecessary since it can be easily
accessed via ctx->manager->drm_dev, cleaning it up.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e5810d1..122c851 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -159,7 +159,6 @@ struct fimd_win_data {
 struct fimd_context {
 	struct exynos_drm_manager	manager;
 	struct device			*dev;
-	struct drm_device		*drm_dev;
 	struct clk			*bus_clk;
 	struct clk			*lcd_clk;
 	void __iomem			*regs;
@@ -298,17 +297,17 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
 	struct exynos_drm_private *priv;
 	priv = drm_dev->dev_private;
 
-	mgr->drm_dev = ctx->drm_dev = drm_dev;
+	mgr->drm_dev = drm_dev;
 	mgr->pipe = ctx->pipe = priv->pipe++;
 
 	/* attach this sub driver to iommu mapping if supported. */
-	if (is_drm_iommu_supported(ctx->drm_dev)) {
+	if (is_drm_iommu_supported(mgr->drm_dev)) {
 		/*
 		 * If any channel is already active, iommu will throw
 		 * a PAGE FAULT when enabled. So clear any channel if enabled.
 		 */
 		fimd_clear_channel(mgr);
-		drm_iommu_attach_device(ctx->drm_dev, ctx->dev);
+		drm_iommu_attach_device(mgr->drm_dev, ctx->dev);
 	}
 
 	return 0;
@@ -319,8 +318,8 @@ static void fimd_mgr_remove(struct exynos_drm_manager *mgr)
 	struct fimd_context *ctx = mgr_to_fimd(mgr);
 
 	/* detach this sub driver from iommu mapping if supported. */
-	if (is_drm_iommu_supported(ctx->drm_dev))
-		drm_iommu_detach_device(ctx->drm_dev, ctx->dev);
+	if (is_drm_iommu_supported(mgr->drm_dev))
+		drm_iommu_detach_device(mgr->drm_dev, ctx->dev);
 }
 
 static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
@@ -1001,7 +1000,7 @@ static void fimd_te_handler(struct exynos_drm_manager *mgr)
 	struct fimd_context *ctx = mgr_to_fimd(mgr);
 
 	/* Checks the crtc is detached already from encoder */
-	if (ctx->pipe < 0 || !ctx->drm_dev)
+	if (ctx->pipe < 0 || !mgr->drm_dev)
 		return;
 
 	/*
@@ -1018,7 +1017,7 @@ static void fimd_te_handler(struct exynos_drm_manager *mgr)
 	}
 
 	if (test_bit(0, &ctx->irq_flags))
-		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+		drm_handle_vblank(mgr->drm_dev, ctx->pipe);
 }
 
 static struct exynos_drm_manager_ops fimd_manager_ops = {
@@ -1047,17 +1046,19 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 		writel(clear_bit, ctx->regs + VIDINTCON1);
 
 	/* check the crtc is detached already from encoder */
-	if (ctx->pipe < 0 || !ctx->drm_dev)
+	if (ctx->pipe < 0 || !ctx->manager.drm_dev)
 		goto out;
 
 	if (ctx->i80_if) {
-		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+		exynos_drm_crtc_finish_pageflip(ctx->manager.drm_dev,
+								ctx->pipe);
 
 		/* Exits triggering mode */
 		atomic_set(&ctx->triggering, 0);
 	} else {
-		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
-		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
+		drm_handle_vblank(ctx->manager.drm_dev, ctx->pipe);
+		exynos_drm_crtc_finish_pageflip(ctx->manager.drm_dev,
+								ctx->pipe);
 
 		/* set wait vsync event to zero and wake up queue. */
 		if (atomic_read(&ctx->wait_vsync_event)) {
-- 
1.7.9.5
