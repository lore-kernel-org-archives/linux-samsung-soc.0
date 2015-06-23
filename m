From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 08/23] drm/exynos: pass struct exynos_drm_plane in update/enable
Date: Tue, 23 Jun 2015 18:35:21 -0300
Message-ID: <1435095336-6196-9-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:34936 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933050AbbFWVgI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:36:08 -0400
Received: by qgeu36 with SMTP id u36so8071205qge.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:36:07 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

We already have the plane pointer in before calling .update_plane() or
disable_plane() so pass it directly to those calls avoiding a new
conversion from zpos to struct exynos_drm_plane.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 22 +++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h    |  6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 25 +++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c  |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   |  9 ++-------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 20 +++++++++++---------
 6 files changed, 33 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index c69985e..1f5f5c7 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -392,24 +392,20 @@ static void decon_shadow_protect_win(struct decon_context *ctx,
 	writel(val, ctx->regs + SHADOWCON);
 }
 
-static void decon_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
+static void decon_update_plane(struct exynos_drm_crtc *crtc,
+			       struct exynos_drm_plane *plane)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
-	struct exynos_drm_plane *plane;
 	int padding;
 	unsigned long val, alpha;
 	unsigned int last_x;
 	unsigned int last_y;
+	unsigned int win = plane->zpos;
 
 	if (ctx->suspended)
 		return;
 
-	if (win < 0 || win >= WINDOWS_NR)
-		return;
-
-	plane = &ctx->planes[win];
-
 	/*
 	 * SHADOWCON/PRTCON register is used for enabling timing.
 	 *
@@ -502,17 +498,13 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 	writel(val, ctx->regs + DECON_UPDATE);
 }
 
-static void decon_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
+static void decon_disable_plane(struct exynos_drm_crtc *crtc,
+				struct exynos_drm_plane *plane)
 {
 	struct decon_context *ctx = crtc->ctx;
-	struct exynos_drm_plane *plane;
+	unsigned int win = plane->zpos;
 	u32 val;
 
-	if (win < 0 || win >= WINDOWS_NR)
-		return;
-
-	plane = &ctx->planes[win];
-
 	if (ctx->suspended)
 		return;
 
@@ -608,7 +600,7 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 	 * a destroyed buffer later.
 	 */
 	for (i = 0; i < WINDOWS_NR; i++)
-		decon_disable_plane(crtc, i);
+		decon_disable_plane(crtc, &ctx->planes[i]);
 
 	clk_disable_unprepare(ctx->vclk);
 	clk_disable_unprepare(ctx->eclk);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6f44988..68a7566 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -173,8 +173,10 @@ struct exynos_drm_crtc_ops {
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
-	void (*update_plane)(struct exynos_drm_crtc *crtc, unsigned int zpos);
-	void (*disable_plane)(struct exynos_drm_crtc *crtc, unsigned int zpos);
+	void (*update_plane)(struct exynos_drm_crtc *crtc,
+			     struct exynos_drm_plane *plane);
+	void (*disable_plane)(struct exynos_drm_crtc *crtc,
+			      struct exynos_drm_plane *plane);
 	void (*te_handler)(struct exynos_drm_crtc *crtc);
 	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable);
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e941f2a..6073b61 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -638,21 +638,14 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 	writel(val, ctx->regs + reg);
 }
 
-static void fimd_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
+static void fimd_update_plane(struct exynos_drm_crtc *crtc,
+			      struct exynos_drm_plane *plane)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct exynos_drm_plane *plane;
 	dma_addr_t dma_addr;
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
-
-	if (ctx->suspended)
-		return;
-
-	if (win < 0 || win >= WINDOWS_NR)
-		return;
-
-	plane = &ctx->planes[win];
+	unsigned int win = plane->zpos;
 
 	/*
 	 * SHADOWCON/PRTCON register is used for enabling timing.
@@ -746,15 +739,11 @@ static void fimd_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 		atomic_set(&ctx->win_updated, 1);
 }
 
-static void fimd_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
+static void fimd_disable_plane(struct exynos_drm_crtc *crtc,
+			       struct exynos_drm_plane *plane)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct exynos_drm_plane *plane;
-
-	if (win < 0 || win >= WINDOWS_NR)
-		return;
-
-	plane = &ctx->planes[win];
+	unsigned int win = plane->zpos;
 
 	if (ctx->suspended)
 		return;
@@ -816,7 +805,7 @@ static void fimd_disable(struct exynos_drm_crtc *crtc)
 	 * a destroyed buffer later.
 	 */
 	for (i = 0; i < WINDOWS_NR; i++)
-		fimd_disable_plane(crtc, i);
+		fimd_disable_plane(crtc, &ctx->planes[i]);
 
 	fimd_enable_vblank(crtc);
 	fimd_wait_for_vblank(crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index eb9eec9..b5aa5b7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -180,7 +180,7 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 			      state->src_w >> 16, state->src_h >> 16);
 
 	if (exynos_crtc->ops->update_plane)
-		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane->zpos);
+		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane);
 }
 
 static void exynos_plane_atomic_disable(struct drm_plane *plane,
@@ -194,7 +194,7 @@ static void exynos_plane_atomic_disable(struct drm_plane *plane,
 
 	if (exynos_crtc->ops->disable_plane)
 		exynos_crtc->ops->disable_plane(exynos_crtc,
-						exynos_plane->zpos);
+						exynos_plane);
 }
 
 static const struct drm_plane_helper_funcs plane_helper_funcs = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 59d85ef..ade59ee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -118,19 +118,14 @@ static void vidi_disable_vblank(struct exynos_drm_crtc *crtc)
 		ctx->vblank_on = false;
 }
 
-static void vidi_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
+static void vidi_update_plane(struct exynos_drm_crtc *crtc,
+			      struct exynos_drm_plane *plane)
 {
 	struct vidi_context *ctx = crtc->ctx;
-	struct exynos_drm_plane *plane;
 
 	if (ctx->suspended)
 		return;
 
-	if (win < 0 || win >= WINDOWS_NR)
-		return;
-
-	plane = &ctx->planes[win];
-
 	DRM_DEBUG_KMS("dma_addr = %pad\n", plane->dma_addr);
 
 	if (ctx->vblank_on)
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 2ad2544..1f8613e 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -920,11 +920,12 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 	mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
-static void mixer_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
+static void mixer_update_plane(struct exynos_drm_crtc *crtc,
+			       struct exynos_drm_plane *plane)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
 
-	DRM_DEBUG_KMS("win: %d\n", win);
+	DRM_DEBUG_KMS("win: %d\n", plane->zpos);
 
 	mutex_lock(&mixer_ctx->mixer_mutex);
 	if (!mixer_ctx->powered) {
@@ -933,19 +934,20 @@ static void mixer_update_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 	}
 	mutex_unlock(&mixer_ctx->mixer_mutex);
 
-	if (win > 1 && mixer_ctx->vp_enabled)
-		vp_video_buffer(mixer_ctx, win);
+	if (plane->zpos > 1 && mixer_ctx->vp_enabled)
+		vp_video_buffer(mixer_ctx, plane->zpos);
 	else
-		mixer_graph_buffer(mixer_ctx, win);
+		mixer_graph_buffer(mixer_ctx, plane->zpos);
 }
 
-static void mixer_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
+static void mixer_disable_plane(struct exynos_drm_crtc *crtc,
+				struct exynos_drm_plane *plane)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
 	struct mixer_resources *res = &mixer_ctx->mixer_res;
 	unsigned long flags;
 
-	DRM_DEBUG_KMS("win: %d\n", win);
+	DRM_DEBUG_KMS("win: %d\n", plane->zpos);
 
 	mutex_lock(&mixer_ctx->mixer_mutex);
 	if (!mixer_ctx->powered) {
@@ -957,7 +959,7 @@ static void mixer_disable_plane(struct exynos_drm_crtc *crtc, unsigned int win)
 	spin_lock_irqsave(&res->reg_slock, flags);
 	mixer_vsync_set_update(mixer_ctx, false);
 
-	mixer_cfg_layer(mixer_ctx, win, false);
+	mixer_cfg_layer(mixer_ctx, plane->zpos, false);
 
 	mixer_vsync_set_update(mixer_ctx, true);
 	spin_unlock_irqrestore(&res->reg_slock, flags);
@@ -1066,7 +1068,7 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 	mixer_regs_dump(ctx);
 
 	for (i = 0; i < MIXER_WIN_NR; i++)
-		mixer_disable_plane(crtc, i);
+		mixer_disable_plane(crtc, &ctx->planes[i]);
 
 	ctx->int_en = mixer_reg_read(res, MXR_INT_EN);
 
-- 
2.1.0
