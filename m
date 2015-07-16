From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v3 4/9] drm/exynos: rename win_commit/disable to atomic-like names
Date: Thu, 16 Jul 2015 12:23:34 -0300
Message-ID: <1437060219-32278-4-git-send-email-gustavo@padovan.org>
References: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:36593 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753132AbbGPPX5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 11:23:57 -0400
Received: by qgy5 with SMTP id 5so34131690qgy.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2015 08:23:57 -0700 (PDT)
In-Reply-To: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Rename win_commit() helper to update_plane() and win_disable() to
disable_plane().

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 10 +++++-----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  8 ++++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  6 +++---
 drivers/gpu/drm/exynos/exynos_mixer.c         | 10 +++++-----
 7 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 61e6e4a..c7f3680 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -219,7 +219,7 @@ static void decon_shadow_protect_win(struct decon_context *ctx, int win,
 	writel(val, ctx->addr + DECON_SHADOWCON);
 }
 
-static void decon_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
+static void decon_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
@@ -277,7 +277,7 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 		atomic_set(&ctx->win_updated, 1);
 }
 
-static void decon_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
+static void decon_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
@@ -378,7 +378,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	 * a destroyed buffer later.
 	 */
 	for (i = 0; i < WINDOWS_NR; i++)
-		decon_win_disable(crtc, i);
+		decon_disable_plane(crtc, i);
 
 	decon_swreset(ctx);
 
@@ -460,8 +460,8 @@ static struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.enable_vblank		= decon_enable_vblank,
 	.disable_vblank		= decon_disable_vblank,
 	.commit			= decon_commit,
-	.win_commit		= decon_win_commit,
-	.win_disable		= decon_win_disable,
+	.update_plane		= decon_update_plane,
+	.disable_plane		= decon_disable_plane,
 	.te_handler		= decon_te_irq_handler,
 	.clear_channels		= decon_clear_channels,
 };
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f720f2a..34da2a4 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -382,7 +382,7 @@ static void decon_shadow_protect_win(struct decon_context *ctx,
 	writel(val, ctx->regs + SHADOWCON);
 }
 
-static void decon_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
+static void decon_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
@@ -492,7 +492,7 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 	writel(val, ctx->regs + DECON_UPDATE);
 }
 
-static void decon_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
+static void decon_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
@@ -598,7 +598,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	 * a destroyed buffer later.
 	 */
 	for (i = 0; i < WINDOWS_NR; i++)
-		decon_win_disable(crtc, i);
+		decon_disable_plane(crtc, i);
 
 	clk_disable_unprepare(ctx->vclk);
 	clk_disable_unprepare(ctx->eclk);
@@ -618,8 +618,8 @@ static const struct exynos_drm_crtc_ops decon_crtc_ops = {
 	.enable_vblank = decon_enable_vblank,
 	.disable_vblank = decon_disable_vblank,
 	.wait_for_vblank = decon_wait_for_vblank,
-	.win_commit = decon_win_commit,
-	.win_disable = decon_win_disable,
+	.update_plane = decon_update_plane,
+	.disable_plane = decon_disable_plane,
 	.clear_channels = decon_clear_channels,
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index dd00f16..77da485 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -153,8 +153,8 @@ struct exynos_drm_display {
  * @disable_vblank: specific driver callback for disabling vblank interrupt.
  * @wait_for_vblank: wait for vblank interrupt to make sure that
  *	hardware overlay is updated.
- * @win_commit: apply hardware specific overlay data to registers.
- * @win_disable: disable hardware specific overlay.
+ * @update_plane: apply hardware specific overlay data to registers.
+ * @disable_plane: disable hardware specific overlay.
  * @te_handler: trigger to transfer video image at the tearing effect
  *	synchronization signal if there is a page flip request.
  * @clock_enable: optional function enabling/disabling display domain clock,
@@ -173,8 +173,8 @@ struct exynos_drm_crtc_ops {
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
-	void (*win_commit)(struct exynos_drm_crtc *crtc, unsigned int zpos);
-	void (*win_disable)(struct exynos_drm_crtc *crtc, unsigned int zpos);
+	void (*update_plane)(struct exynos_drm_crtc *crtc, unsigned int zpos);
+	void (*disable_plane)(struct exynos_drm_crtc *crtc, unsigned int zpos);
 	void (*te_handler)(struct exynos_drm_crtc *crtc);
 	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable);
 	void (*clear_channels)(struct exynos_drm_crtc *crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0875f111..87863ab 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -614,7 +614,7 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 	writel(val, ctx->regs + reg);
 }
 
-static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
+static void fimd_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct fimd_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
@@ -722,7 +722,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 		atomic_set(&ctx->win_updated, 1);
 }
 
-static void fimd_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
+static void fimd_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct fimd_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
@@ -792,7 +792,7 @@ static void fimd_disable(struct exynos_drm_crtc *crtc)
 	 * a destroyed buffer later.
 	 */
 	for (i = 0; i < WINDOWS_NR; i++)
-		fimd_win_disable(crtc, i);
+		fimd_disable_plane(crtc, i);
 
 	fimd_enable_vblank(crtc);
 	fimd_wait_for_vblank(crtc);
@@ -887,8 +887,8 @@ static const struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.enable_vblank = fimd_enable_vblank,
 	.disable_vblank = fimd_disable_vblank,
 	.wait_for_vblank = fimd_wait_for_vblank,
-	.win_commit = fimd_win_commit,
-	.win_disable = fimd_win_disable,
+	.update_plane = fimd_update_plane,
+	.disable_plane = fimd_disable_plane,
 	.te_handler = fimd_te_handler,
 	.clock_enable = fimd_dp_clock_enable,
 	.clear_channels = fimd_clear_channels,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index a729980..eb9eec9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -179,8 +179,8 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 			      state->src_x >> 16, state->src_y >> 16,
 			      state->src_w >> 16, state->src_h >> 16);
 
-	if (exynos_crtc->ops->win_commit)
-		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
+	if (exynos_crtc->ops->update_plane)
+		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane->zpos);
 }
 
 static void exynos_plane_atomic_disable(struct drm_plane *plane,
@@ -192,9 +192,9 @@ static void exynos_plane_atomic_disable(struct drm_plane *plane,
 	if (!old_state->crtc)
 		return;
 
-	if (exynos_crtc->ops->win_disable)
-		exynos_crtc->ops->win_disable(exynos_crtc,
-					      exynos_plane->zpos);
+	if (exynos_crtc->ops->disable_plane)
+		exynos_crtc->ops->disable_plane(exynos_crtc,
+						exynos_plane->zpos);
 }
 
 static const struct drm_plane_helper_funcs plane_helper_funcs = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 9b97105..59d85ef 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -100,7 +100,7 @@ static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
 	/*
 	 * in case of page flip request, vidi_finish_pageflip function
 	 * will not be called because direct_vblank is true and then
-	 * that function will be called by crtc_ops->win_commit callback
+	 * that function will be called by crtc_ops->update_plane callback
 	 */
 	schedule_work(&ctx->work);
 
@@ -118,7 +118,7 @@ static void vidi_disable_vblank(struct exynos_drm_crtc *crtc)
 		ctx->vblank_on = false;
 }
 
-static void vidi_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
+static void vidi_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct vidi_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
@@ -179,7 +179,7 @@ static const struct exynos_drm_crtc_ops vidi_crtc_ops = {
 	.disable = vidi_disable,
 	.enable_vblank = vidi_enable_vblank,
 	.disable_vblank = vidi_disable_vblank,
-	.win_commit = vidi_win_commit,
+	.update_plane = vidi_update_plane,
 };
 
 static void vidi_fake_vblank_handler(struct work_struct *work)
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index f8af72c..b2b87aa 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -922,7 +922,7 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 	mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
-static void mixer_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
+static void mixer_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
 
@@ -941,7 +941,7 @@ static void mixer_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 		mixer_graph_buffer(mixer_ctx, win);
 }
 
-static void mixer_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
+static void mixer_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
 	struct mixer_resources *res = &mixer_ctx->mixer_res;
@@ -1068,7 +1068,7 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 	mixer_regs_dump(ctx);
 
 	for (i = 0; i < MIXER_WIN_NR; i++)
-		mixer_win_disable(crtc, i);
+		mixer_disable_plane(crtc, i);
 
 	ctx->int_en = mixer_reg_read(res, MXR_INT_EN);
 
@@ -1113,8 +1113,8 @@ static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.enable_vblank		= mixer_enable_vblank,
 	.disable_vblank		= mixer_disable_vblank,
 	.wait_for_vblank	= mixer_wait_for_vblank,
-	.win_commit		= mixer_win_commit,
-	.win_disable		= mixer_win_disable,
+	.update_plane		= mixer_update_plane,
+	.disable_plane		= mixer_disable_plane,
 };
 
 static struct mixer_drv_data exynos5420_mxr_drv_data = {
-- 
2.1.0
