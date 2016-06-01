From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: fimd: fix trigger mode change regression
Date: Wed, 01 Jun 2016 14:53:54 +0900
Message-ID: <1464760434-16709-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54335 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757268AbcFAFx6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 01:53:58 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O82023DAWDVVMD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Jun 2016 14:53:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, maz@misterjones.org, Inki Dae <inki.dae@samsung.com>

This patch fixes a regression that Display panel doesn't work
since HW trigger mode was supported.

The trigger mode should be changed on PSR(Panel Self Refresh)
mode of Panel device according to HW guy's saying. However,
with previous HW trigger support, trigger mode could been changed
in normal mode of Panel device.

So this patch makes sure to change the trigger mode after power off
and on again. Later we need to add PSR relevant codes instead.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 3efe1aa..355149f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -203,6 +203,11 @@ struct fimd_context {
 	atomic_t			wait_vsync_event;
 	atomic_t			win_updated;
 	atomic_t			triggering;
+	/*
+	 * fimd_setup_trigger function will try to change trigger mode
+	 * only in case that this flag is set.
+	 */
+	atomic_t			deferred_tr_mode;
 
 	const struct fimd_driver_data *driver_data;
 	struct drm_encoder *encoder;
@@ -430,11 +435,37 @@ static void fimd_setup_trigger(struct fimd_context *ctx)
 	val &= ~(TRGMODE_ENABLE);
 
 	if (trg_type == I80_HW_TRG) {
+		/*
+		 * change trigger mode after power off and on again.
+		 * deferred_tr_mode will be set when fimd_disable is called.
+		 *
+		 * TODO. Trigger mode should be changed on PSR mode of Panel
+		 * device. So we have to add relevant codes to make sure
+		 * entering into PSR mode later.
+		 */
+		if (val & TRGMODE_ENABLE &&
+		    !atomic_read(&ctx->deferred_tr_mode))
+			return;
+
 		if (ctx->driver_data->has_hw_trigger)
 			val |= HWTRGEN_ENABLE | HWTRGMASK_ENABLE;
 		if (ctx->driver_data->has_trigger_per_te)
 			val |= HWTRIGEN_PER_ENABLE;
 	} else {
+		/*
+		 * change trigger mode after power off and on again.
+		 * deferred_tr_mode will be set when fimd_disable is called.
+		 *
+		 * TODO. Trigger mode should be changed on PSR mode of Panel
+		 * device. So we have to add relevant codes to make sure
+		 * entering into PSR mode later.
+		 */
+		if (ctx->driver_data->has_hw_trigger) {
+			if (val & HWTRGEN_ENABLE &&
+			    !atomic_read(&ctx->deferred_tr_mode))
+				return;
+		}
+
 		val |= TRGMODE_ENABLE;
 	}
 
@@ -864,6 +895,10 @@ static void fimd_disable(struct exynos_drm_crtc *crtc)
 	writel(0, ctx->regs + VIDCON0);
 
 	pm_runtime_put_sync(ctx->dev);
+
+	if (ctx->i80_if)
+		atomic_set(&ctx->deferred_tr_mode, 1);
+
 	ctx->suspended = true;
 }
 
-- 
1.9.1
