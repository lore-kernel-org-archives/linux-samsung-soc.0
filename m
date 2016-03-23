From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/6] drm/exynos: convert clock_enable crtc callback to pipeline
 clock
Date: Wed, 23 Mar 2016 14:26:02 +0100
Message-ID: <1458739562-32327-7-git-send-email-a.hajda@samsung.com>
References: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38220 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754988AbcCWN0T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 09:26:19 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4H00G2VUNS39A0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Mar 2016 13:26:16 +0000 (GMT)
In-reply-to: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

clock_enable callback is used only by FIMD->DP pipeline. Similar but more
universal functionality provides pipeline clock.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c  |  8 ++------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  5 -----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 27 +++++++++++++--------------
 3 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index cff8dc7..ebb96eb 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1054,7 +1054,6 @@ static int exynos_dp_bridge_attach(struct drm_bridge *bridge)
 static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
 {
 	struct exynos_dp_device *dp = bridge->driver_private;
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	if (dp->dpms_mode == DRM_MODE_DPMS_ON)
 		return;
@@ -1068,8 +1067,7 @@ static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
 		}
 	}
 
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), true);
+	exynos_drm_pipe_clk_enable(dp_to_crtc(dp), true);
 
 	phy_power_on(dp->phy);
 	exynos_dp_init_dp(dp);
@@ -1082,7 +1080,6 @@ static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
 static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
 {
 	struct exynos_dp_device *dp = bridge->driver_private;
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
@@ -1098,8 +1095,7 @@ static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
 	flush_work(&dp->hotplug_work);
 	phy_power_off(dp->phy);
 
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), false);
+	exynos_drm_pipe_clk_enable(dp_to_crtc(dp), false);
 
 	if (dp->panel) {
 		if (drm_panel_unprepare(dp->panel))
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6ee0b20..1542910 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -129,10 +129,6 @@ struct exynos_drm_plane_config {
  * @disable_plane: disable hardware specific overlay.
  * @te_handler: trigger to transfer video image at the tearing effect
  *	synchronization signal if there is a page flip request.
- * @clock_enable: optional function enabling/disabling display domain clock,
- *	called from exynos-dp driver before powering up (with
- *	'enable' argument as true) and after powering down (with
- *	'enable' as false).
  */
 struct exynos_drm_crtc;
 struct exynos_drm_crtc_ops {
@@ -151,7 +147,6 @@ struct exynos_drm_crtc_ops {
 			      struct exynos_drm_plane *plane);
 	void (*atomic_flush)(struct exynos_drm_crtc *crtc);
 	void (*te_handler)(struct exynos_drm_crtc *crtc);
-	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable);
 };
 
 struct exynos_drm_clk {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 51d484a..004bf57 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -102,6 +102,7 @@ struct fimd_driver_data {
 	unsigned int has_vidoutcon:1;
 	unsigned int has_vtsel:1;
 	unsigned int has_mic_bypass:1;
+	unsigned int has_dp_clk:1;
 };
 
 static struct fimd_driver_data s3c64xx_fimd_driver_data = {
@@ -145,6 +146,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.has_shadowcon = 1,
 	.has_vidoutcon = 1,
 	.has_vtsel = 1,
+	.has_dp_clk = 1,
 };
 
 static struct fimd_driver_data exynos5420_fimd_driver_data = {
@@ -157,6 +159,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
 	.has_vidoutcon = 1,
 	.has_vtsel = 1,
 	.has_mic_bypass = 1,
+	.has_dp_clk = 1,
 };
 
 struct fimd_context {
@@ -184,6 +187,7 @@ struct fimd_context {
 
 	struct fimd_driver_data *driver_data;
 	struct drm_encoder *encoder;
+	struct exynos_drm_clk		dp_clk;
 };
 
 static const struct of_device_id fimd_driver_dt_match[] = {
@@ -878,21 +882,12 @@ static void fimd_te_handler(struct exynos_drm_crtc *crtc)
 		drm_crtc_handle_vblank(&ctx->crtc->base);
 }
 
-static void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool enable)
+static void fimd_dp_clock_enable(struct exynos_drm_clk *clk, bool enable)
 {
-	struct fimd_context *ctx = crtc->ctx;
-	u32 val;
-
-	/*
-	 * Only Exynos 5250, 5260, 5410 and 542x requires enabling DP/MIE
-	 * clock. On these SoCs the bootloader may enable it but any
-	 * power domain off/on will reset it to disable state.
-	 */
-	if (ctx->driver_data != &exynos5_fimd_driver_data ||
-	    ctx->driver_data != &exynos5420_fimd_driver_data)
-		return;
+	struct fimd_context *ctx = container_of(clk, struct fimd_context,
+						dp_clk);
+	u32 val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
 
-	val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
 	writel(val, ctx->regs + DP_MIE_CLKCON);
 }
 
@@ -908,7 +903,6 @@ static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.disable_plane = fimd_disable_plane,
 	.atomic_flush = fimd_atomic_flush,
 	.te_handler = fimd_te_handler,
-	.clock_enable = fimd_dp_clock_enable,
 };
 
 static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
@@ -987,6 +981,11 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(ctx->crtc))
 		return PTR_ERR(ctx->crtc);
 
+	if (ctx->driver_data->has_dp_clk) {
+		ctx->dp_clk.enable = fimd_dp_clock_enable;
+		ctx->crtc->pipe_clk = &ctx->dp_clk;
+	}
+
 	if (ctx->encoder)
 		exynos_dpi_bind(drm_dev, ctx->encoder);
 
-- 
1.9.1
