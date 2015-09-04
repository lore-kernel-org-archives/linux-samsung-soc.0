From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 08/10] drm/exynos: Enable DP clock directly from FIMD
Date: Fri,  4 Sep 2015 17:15:50 -0300
Message-ID: <1441397752-6672-9-git-send-email-gustavo@padovan.org>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:33635 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760563AbbIDUQR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 16:16:17 -0400
Received: by ykei199 with SMTP id i199so31902096yke.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 13:16:16 -0700 (PDT)
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Instead of having a .clock_enable callback enable the dp clock directly
from FIMD.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c  | 13 -----------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  5 ----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 39 +++++++++++++++++---------------
 3 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 6794982..aa11d18 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -37,11 +37,6 @@
 #define ctx_from_connector(c)	container_of(c, struct exynos_dp_device, \
 					connector)
 
-static inline struct exynos_drm_crtc *dp_to_crtc(struct exynos_dp_device *dp)
-{
-	return to_exynos_crtc(dp->encoder.crtc);
-}
-
 static inline struct exynos_dp_device *encoder_to_dp(
 						struct drm_encoder *e)
 {
@@ -1068,7 +1063,6 @@ static void exynos_dp_mode_set(struct drm_encoder *encoder,
 static void exynos_dp_enable(struct drm_encoder *encoder)
 {
 	struct exynos_dp_device *dp = encoder_to_dp(encoder);
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	pm_runtime_get_sync(dp->dev);
 
@@ -1079,9 +1073,6 @@ static void exynos_dp_enable(struct drm_encoder *encoder)
 		}
 	}
 
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), true);
-
 	phy_power_on(dp->phy);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
@@ -1091,7 +1082,6 @@ static void exynos_dp_enable(struct drm_encoder *encoder)
 static void exynos_dp_disable(struct drm_encoder *encoder)
 {
 	struct exynos_dp_device *dp = encoder_to_dp(encoder);
-	struct exynos_drm_crtc *crtc = dp_to_crtc(dp);
 
 	if (dp->panel) {
 		if (drm_panel_disable(dp->panel)) {
@@ -1104,9 +1094,6 @@ static void exynos_dp_disable(struct drm_encoder *encoder)
 	flush_work(&dp->hotplug_work);
 	phy_power_off(dp->phy);
 
-	if (crtc->ops->clock_enable)
-		crtc->ops->clock_enable(dp_to_crtc(dp), false);
-
 	if (dp->panel) {
 		if (drm_panel_unprepare(dp->panel))
 			DRM_ERROR("failed to turnoff the panel\n");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 5f1a4d6..ee60619 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -96,10 +96,6 @@ struct exynos_drm_plane {
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
@@ -120,7 +116,6 @@ struct exynos_drm_crtc_ops {
 	void (*atomic_flush)(struct exynos_drm_crtc *crtc,
 			      struct exynos_drm_plane *plane);
 	void (*te_handler)(struct exynos_drm_crtc *crtc);
-	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable);
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0f17ae0..3cf2b80 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -573,6 +573,23 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
 	writel(keycon1, ctx->regs + WKEYCON1_BASE(win));
 }
 
+static void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool enable)
+{
+	struct fimd_context *ctx = crtc->ctx;
+	u32 val;
+
+	/*
+	 * Only Exynos 5250, 5260, 5410 and 542x requires enabling DP/MIE
+	 * clock. On these SoCs the bootloader may enable it but any
+	 * power domain off/on will reset it to disable state.
+	 */
+	if (ctx->driver_data != &exynos5_fimd_driver_data)
+		return;
+
+	val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
+	writel(DP_MIE_CLK_DP_ENABLE, ctx->regs + DP_MIE_CLKCON);
+}
+
 /**
  * shadow_protect_win() - disable updating values from shadow registers at vsync
  *
@@ -735,6 +752,8 @@ static void fimd_enable(struct exynos_drm_crtc *crtc)
 	if (test_and_clear_bit(0, &ctx->irq_flags))
 		fimd_enable_vblank(ctx->crtc);
 
+	fimd_dp_clock_enable(crtc, true);
+
 	fimd_commit(ctx->crtc);
 }
 
@@ -743,6 +762,8 @@ static void fimd_disable(struct exynos_drm_crtc *crtc)
 	struct fimd_context *ctx = crtc->ctx;
 	int i;
 
+	fimd_dp_clock_enable(crtc, false);
+
 	/*
 	 * We need to make sure that all windows are disabled before we
 	 * suspend that connector. Otherwise we might try to scan from
@@ -814,23 +835,6 @@ static void fimd_te_handler(struct exynos_drm_crtc *crtc)
 		drm_crtc_handle_vblank(&ctx->crtc->base);
 }
 
-static void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool enable)
-{
-	struct fimd_context *ctx = crtc->ctx;
-	u32 val;
-
-	/*
-	 * Only Exynos 5250, 5260, 5410 and 542x requires enabling DP/MIE
-	 * clock. On these SoCs the bootloader may enable it but any
-	 * power domain off/on will reset it to disable state.
-	 */
-	if (ctx->driver_data != &exynos5_fimd_driver_data)
-		return;
-
-	val = enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
-	writel(DP_MIE_CLK_DP_ENABLE, ctx->regs + DP_MIE_CLKCON);
-}
-
 static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.enable = fimd_enable,
 	.disable = fimd_disable,
@@ -843,7 +847,6 @@ static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.disable_plane = fimd_disable_plane,
 	.atomic_flush = fimd_atomic_flush,
 	.te_handler = fimd_te_handler,
-	.clock_enable = fimd_dp_clock_enable,
 };
 
 static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
-- 
2.1.0
