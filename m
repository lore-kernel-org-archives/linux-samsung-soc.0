From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v2 10/14] drm/exynos: atomic phase 1: add atomic_begin()/atomic_flush()
Date: Fri,  6 Feb 2015 17:37:54 -0200
Message-ID: <1423251478-17043-11-git-send-email-gustavo@padovan.org>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:49576 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754237AbbBFTk1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 14:40:27 -0500
Received: by mail-qa0-f44.google.com with SMTP id w8so12468557qac.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Feb 2015 11:40:26 -0800 (PST)
In-Reply-To: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jy0922.shim@samsung.com, inki.dae@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Add CRTC callbacks .atomic_begin() .atomic_flush(). On exynos they
unprotect the windows before the commit and protects it after based on
a plane mask tha store which plane will be updated.

For that we create two new exynos_crtc callbacks: .win_protect() and
.win_unprotect(). The only driver that implement those now is FIMD.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 34 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  6 ++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 49 ++++++++++++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_plane.c |  4 +++
 4 files changed, 76 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 1c0d936..5e7c13e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -153,6 +153,38 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
 	}
 }
 
+static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
+{
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+	struct drm_plane *plane;
+	int index = 0;
+
+	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head) {
+		if (exynos_crtc->ops->win_protect &&
+		    exynos_crtc->plane_mask & (0x01 << index))
+			exynos_crtc->ops->win_protect(exynos_crtc, index);
+
+		index++;
+	}
+}
+
+static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
+{
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+	struct drm_plane *plane;
+	int index = 0;
+
+	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head) {
+		if (exynos_crtc->ops->win_unprotect &&
+		    exynos_crtc->plane_mask & (0x01 << index))
+			exynos_crtc->ops->win_unprotect(exynos_crtc, index);
+
+		index++;
+	}
+
+	exynos_crtc->plane_mask = 0;
+}
+
 static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.dpms		= exynos_drm_crtc_dpms,
 	.prepare	= exynos_drm_crtc_prepare,
@@ -161,6 +193,8 @@ static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.mode_set	= exynos_drm_crtc_mode_set,
 	.mode_set_base	= exynos_drm_crtc_mode_set_base,
 	.disable	= exynos_drm_crtc_disable,
+	.atomic_begin	= exynos_crtc_atomic_begin,
+	.atomic_flush	= exynos_crtc_atomic_flush,
 };
 
 static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index ab82772..f025a54 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -175,6 +175,8 @@ struct exynos_drm_display {
  *	hardware overlay is updated.
  * @win_commit: apply hardware specific overlay data to registers.
  * @win_disable: disable hardware specific overlay.
+ * @win_protect: protect hardware specific window.
+ * @win_unprotect: unprotect hardware specific window.
  * @te_handler: trigger to transfer video image at the tearing effect
  *	synchronization signal if there is a page flip request.
  */
@@ -190,6 +192,8 @@ struct exynos_drm_crtc_ops {
 	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
 	void (*win_commit)(struct exynos_drm_crtc *crtc, unsigned int zpos);
 	void (*win_disable)(struct exynos_drm_crtc *crtc, unsigned int zpos);
+	void (*win_protect)(struct exynos_drm_crtc *crtc, unsigned int zpos);
+	void (*win_unprotect)(struct exynos_drm_crtc *crtc, unsigned int zpos);
 	void (*te_handler)(struct exynos_drm_crtc *crtc);
 };
 
@@ -206,6 +210,7 @@ struct exynos_drm_crtc_ops {
  *	we can refer to the crtc to current hardware interrupt occurred through
  *	this pipe value.
  * @dpms: store the crtc dpms value
+ * @plane_mask: store planes to be updated on atomic modesetting
  * @event: vblank event that is currently queued for flip
  * @ops: pointer to callbacks for exynos drm specific functionality
  * @ctx: A pointer to the crtc's implementation specific context
@@ -215,6 +220,7 @@ struct exynos_drm_crtc {
 	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
 	unsigned int			dpms;
+	unsigned int			plane_mask;
 	wait_queue_head_t		pending_flip_queue;
 	struct drm_pending_vblank_event	*event;
 	struct exynos_drm_crtc_ops	*ops;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 990ead434..bea70f6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -590,6 +590,16 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 {
 	u32 reg, bits, val;
 
+	/*
+	 * SHADOWCON/PRTCON register is used for enabling timing.
+	 *
+	 * for example, once only width value of a register is set,
+	 * if the dma is started then fimd hardware could malfunction so
+	 * with protect window setting, the register fields with prefix '_F'
+	 * wouldn't be updated at vsync also but updated once unprotect window
+	 * is set.
+	 */
+
 	if (ctx->driver_data->has_shadowcon) {
 		reg = SHADOWCON;
 		bits = SHADOWCON_WINx_PROTECT(win);
@@ -628,20 +638,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 		return;
 	}
 
-	/*
-	 * SHADOWCON/PRTCON register is used for enabling timing.
-	 *
-	 * for example, once only width value of a register is set,
-	 * if the dma is started then fimd hardware could malfunction so
-	 * with protect window setting, the register fields with prefix '_F'
-	 * wouldn't be updated at vsync also but updated once unprotect window
-	 * is set.
-	 */
-
-	/* protect windows */
-	fimd_shadow_protect_win(ctx, win, true);
-
-
 	offset = plane->fb_x * (plane->bpp >> 3);
 	offset += plane->fb_y * plane->pitch;
 
@@ -723,9 +719,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 	if (ctx->driver_data->has_shadowcon)
 		fimd_enable_shadow_channel_path(ctx, win, true);
 
-	/* Enable DMA channel and unprotect windows */
-	fimd_shadow_protect_win(ctx, win, false);
-
 	plane->enabled = true;
 
 	if (ctx->i80_if)
@@ -944,6 +937,26 @@ static void fimd_te_handler(struct exynos_drm_crtc *crtc)
 		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
 }
 
+static void fimd_win_protect(struct exynos_drm_crtc *crtc, unsigned int win)
+{
+	struct fimd_context *ctx = crtc->ctx;
+
+	if (win < 0 || win >= WINDOWS_NR)
+		return;
+
+	fimd_shadow_protect_win(ctx, win, true);
+}
+
+static void fimd_win_unprotect(struct exynos_drm_crtc *crtc, unsigned int win)
+{
+	struct fimd_context *ctx = crtc->ctx;
+
+	if (win < 0 || win >= WINDOWS_NR)
+		return;
+
+	fimd_shadow_protect_win(ctx, win, false);
+}
+
 static struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.dpms = fimd_dpms,
 	.mode_fixup = fimd_mode_fixup,
@@ -954,6 +967,8 @@ static struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.win_commit = fimd_win_commit,
 	.win_disable = fimd_win_disable,
 	.te_handler = fimd_te_handler,
+	.win_protect = fimd_win_protect,
+	.win_unprotect = fimd_win_unprotect,
 };
 
 static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 5d3243e..ee81dc2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -65,6 +65,7 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(plane->crtc);
 	int nr;
 	int i;
 
@@ -83,6 +84,9 @@ int exynos_check_plane(struct drm_plane *plane, struct drm_framebuffer *fb)
 				i, (unsigned long)exynos_plane->dma_addr[i]);
 	}
 
+	if (exynos_crtc)
+		exynos_crtc->plane_mask += 1 << exynos_plane->zpos;
+
 	return 0;
 }
 
-- 
1.9.3
