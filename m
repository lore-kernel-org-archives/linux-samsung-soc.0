From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 6/6] drm/exynos: remove struct exynos_drm_manager
Date: Wed, 26 Nov 2014 19:09:05 -0200
Message-ID: <1417036145-11017-7-git-send-email-gustavo@padovan.org>
References: <1417036145-11017-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:55483 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbaKZVJf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 16:09:35 -0500
Received: by mail-qa0-f48.google.com with SMTP id v10so2474319qac.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 13:09:34 -0800 (PST)
In-Reply-To: <1417036145-11017-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

exynos_drm_manager was just a redundant struct to represent the crtc as
well. In this commit we merge exynos_drm_manager into exynos_drm_crtc to
remove an unnecessary level of indirection easing the understand of the
flow on exynos.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  |  67 ++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_crtc.h  |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  51 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 121 ++++++++++++++----------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c |  26 +++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c  |  79 +++++++++----------
 drivers/gpu/drm/exynos/exynos_mixer.c     | 103 ++++++++++++-------------
 7 files changed, 211 insertions(+), 244 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 1eb5750..9e8ed5f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -23,7 +23,6 @@
 static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct exynos_drm_manager *manager = exynos_crtc->manager;
 
 	DRM_DEBUG_KMS("crtc[%d] mode[%d]\n", crtc->base.id, mode);
 
@@ -41,8 +40,8 @@ static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 		drm_crtc_vblank_off(crtc);
 	}
 
-	if (manager->ops->dpms)
-		manager->ops->dpms(manager, mode);
+	if (exynos_crtc->ops->dpms)
+		exynos_crtc->ops->dpms(exynos_crtc, mode);
 
 	exynos_crtc->dpms = mode;
 
@@ -58,16 +57,15 @@ static void exynos_drm_crtc_prepare(struct drm_crtc *crtc)
 static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct exynos_drm_manager *manager = exynos_crtc->manager;
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(crtc->primary);
 
 	exynos_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
 
-	if (manager->ops->win_commit)
-		manager->ops->win_commit(manager, exynos_plane->zpos);
+	if (exynos_crtc->ops->win_commit)
+		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
 
-	if (manager->ops->commit)
-		manager->ops->commit(manager);
+	if (exynos_crtc->ops->commit)
+		exynos_crtc->ops->commit(exynos_crtc);
 
 	exynos_plane_dpms(crtc->primary, DRM_MODE_DPMS_ON);
 }
@@ -78,10 +76,10 @@ exynos_drm_crtc_mode_fixup(struct drm_crtc *crtc,
 			    struct drm_display_mode *adjusted_mode)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct exynos_drm_manager *manager = exynos_crtc->manager;
 
-	if (manager->ops->mode_fixup)
-		return manager->ops->mode_fixup(manager, mode, adjusted_mode);
+	if (exynos_crtc->ops->mode_fixup)
+		return exynos_crtc->ops->mode_fixup(exynos_crtc, mode,
+						    adjusted_mode);
 
 	return true;
 }
@@ -92,7 +90,6 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 			  struct drm_framebuffer *old_fb)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
-	struct exynos_drm_manager *manager = exynos_crtc->manager;
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int crtc_w;
 	unsigned int crtc_h;
@@ -106,8 +103,8 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	crtc_w = fb->width - x;
 	crtc_h = fb->height - y;
 
-	if (manager->ops->mode_set)
-		manager->ops->mode_set(manager, &crtc->mode);
+	if (exynos_crtc->ops->mode_set)
+		exynos_crtc->ops->mode_set(exynos_crtc, &crtc->mode);
 
 	return exynos_plane_mode_set(crtc->primary, crtc, fb, 0, 0,
 				     crtc_w, crtc_h, x, y, crtc_w, crtc_h);
@@ -299,9 +296,11 @@ static void exynos_drm_crtc_attach_mode_property(struct drm_crtc *crtc)
 	drm_object_attach_property(&crtc->base, prop, 0);
 }
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager,
-			   struct drm_device *drm_dev, int pipe,
-			   enum exynos_drm_output_type type)
+struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
+					       int pipe,
+					       enum exynos_drm_output_type type,
+					       struct exynos_drm_crtc_ops *ops,
+					       void *ctx)
 {
 	struct exynos_drm_crtc *exynos_crtc;
 	struct drm_plane *plane;
@@ -311,15 +310,16 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager,
 
 	exynos_crtc = kzalloc(sizeof(*exynos_crtc), GFP_KERNEL);
 	if (!exynos_crtc)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	init_waitqueue_head(&exynos_crtc->pending_flip_queue);
 	atomic_set(&exynos_crtc->pending_flip, 0);
 
 	exynos_crtc->dpms = DRM_MODE_DPMS_OFF;
-	exynos_crtc->manager = manager;
 	exynos_crtc->pipe = pipe;
 	exynos_crtc->type = type;
+	exynos_crtc->ops = ops;
+	exynos_crtc->ctx = ctx;
 	plane = exynos_plane_init(drm_dev, 1 << pipe,
 				  DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(plane)) {
@@ -327,7 +327,6 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager,
 		goto err_plane;
 	}
 
-	manager->crtc = &exynos_crtc->base;
 	crtc = &exynos_crtc->base;
 
 	private->crtc[pipe] = crtc;
@@ -341,13 +340,13 @@ int exynos_drm_crtc_create(struct exynos_drm_manager *manager,
 
 	exynos_drm_crtc_attach_mode_property(crtc);
 
-	return 0;
+	return exynos_crtc;
 
 err_crtc:
 	plane->funcs->destroy(plane);
 err_plane:
 	kfree(exynos_crtc);
-	return ret;
+	return ERR_PTR(ret);
 }
 
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe)
@@ -355,13 +354,12 @@ int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_private *private = dev->dev_private;
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
-	struct exynos_drm_manager *manager = exynos_crtc->manager;
 
 	if (exynos_crtc->dpms != DRM_MODE_DPMS_ON)
 		return -EPERM;
 
-	if (manager->ops->enable_vblank)
-		manager->ops->enable_vblank(manager);
+	if (exynos_crtc->ops->enable_vblank)
+		exynos_crtc->ops->enable_vblank(exynos_crtc);
 
 	return 0;
 }
@@ -371,13 +369,12 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe)
 	struct exynos_drm_private *private = dev->dev_private;
 	struct exynos_drm_crtc *exynos_crtc =
 		to_exynos_crtc(private->crtc[pipe]);
-	struct exynos_drm_manager *manager = exynos_crtc->manager;
 
 	if (exynos_crtc->dpms != DRM_MODE_DPMS_ON)
 		return;
 
-	if (manager->ops->disable_vblank)
-		manager->ops->disable_vblank(manager);
+	if (exynos_crtc->ops->disable_vblank)
+		exynos_crtc->ops->disable_vblank(exynos_crtc);
 }
 
 void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
@@ -408,7 +405,7 @@ void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
 
 void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
 {
-	struct exynos_drm_manager *manager;
+	struct exynos_drm_crtc *exynos_crtc;
 	struct drm_device *dev = fb->dev;
 	struct drm_crtc *crtc;
 
@@ -417,15 +414,15 @@ void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
 	 * for all encoders.
 	 */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		manager = to_exynos_crtc(crtc)->manager;
+		exynos_crtc = to_exynos_crtc(crtc);
 
 		/*
 		 * wait for vblank interrupt
 		 * - this makes sure that overlay data are updated to
 		 *	real hardware.
 		 */
-		if (manager->ops->wait_for_vblank)
-			manager->ops->wait_for_vblank(manager);
+		if (exynos_crtc->ops->wait_for_vblank)
+			exynos_crtc->ops->wait_for_vblank(exynos_crtc);
 	}
 }
 
@@ -447,8 +444,8 @@ int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 
 void exynos_drm_crtc_te_handler(struct drm_crtc *crtc)
 {
-	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 
-	if (manager->ops->te_handler)
-		manager->ops->te_handler(manager);
+	if (exynos_crtc->ops->te_handler)
+		exynos_crtc->ops->te_handler(exynos_crtc);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index d7690e9..6258b80 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -17,9 +17,11 @@
 
 #include "exynos_drm_drv.h"
 
-int exynos_drm_crtc_create(struct exynos_drm_manager *manager,
-			   struct drm_device *drm_dev, int pipe,
-			   enum exynos_drm_output_type type);
+struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
+					       int pipe,
+					       enum exynos_drm_output_type type,
+					       struct exynos_drm_crtc_ops *ops,
+					       void *context);
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_disable_vblank(struct drm_device *dev, int pipe);
 void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 2d801a8..4c930d0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -163,7 +163,7 @@ struct exynos_drm_display {
 };
 
 /*
- * Exynos drm manager ops
+ * Exynos drm crtc ops
  *
  * @dpms: control device power.
  * @mode_fixup: fix mode data before applying it
@@ -180,39 +180,24 @@ struct exynos_drm_display {
  * @te_handler: trigger to transfer video image at the tearing effect
  *	synchronization signal if there is a page flip request.
  */
-struct exynos_drm_manager;
-struct exynos_drm_manager_ops {
-	void (*dpms)(struct exynos_drm_manager *mgr, int mode);
-	bool (*mode_fixup)(struct exynos_drm_manager *mgr,
+struct exynos_drm_crtc;
+struct exynos_drm_crtc_ops {
+	void (*dpms)(struct exynos_drm_crtc *crtc, int mode);
+	bool (*mode_fixup)(struct exynos_drm_crtc *crtc,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
-	void (*mode_set)(struct exynos_drm_manager *mgr,
+	void (*mode_set)(struct exynos_drm_crtc *crtc,
 				const struct drm_display_mode *mode);
-	void (*commit)(struct exynos_drm_manager *mgr);
-	int (*enable_vblank)(struct exynos_drm_manager *mgr);
-	void (*disable_vblank)(struct exynos_drm_manager *mgr);
-	void (*wait_for_vblank)(struct exynos_drm_manager *mgr);
-	void (*win_mode_set)(struct exynos_drm_manager *mgr,
+	void (*commit)(struct exynos_drm_crtc *crtc);
+	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
+	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
+	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
+	void (*win_mode_set)(struct exynos_drm_crtc *crtc,
 				struct exynos_drm_plane *plane);
-	void (*win_commit)(struct exynos_drm_manager *mgr, int zpos);
-	void (*win_enable)(struct exynos_drm_manager *mgr, int zpos);
-	void (*win_disable)(struct exynos_drm_manager *mgr, int zpos);
-	void (*te_handler)(struct exynos_drm_manager *mgr);
-};
-
-/*
- * Exynos drm common manager structure, maps 1:1 with a crtc
- *
- * @list: the list entry for this manager
- * @drm_dev: pointer to the drm device
- * @crtc: crtc object.
- * @ops: pointer to callbacks for exynos drm specific functionality
- * @ctx: A pointer to the manager's implementation specific context
- */
-struct exynos_drm_manager {
-	struct list_head list;
-	struct drm_crtc *crtc;
-	struct exynos_drm_manager_ops *ops;
+	void (*win_commit)(struct exynos_drm_crtc *crtc, int zpos);
+	void (*win_enable)(struct exynos_drm_crtc *crtc, int zpos);
+	void (*win_disable)(struct exynos_drm_crtc *crtc, int zpos);
+	void (*te_handler)(struct exynos_drm_crtc *crtc);
 };
 
 enum exynos_crtc_mode {
@@ -224,7 +209,6 @@ enum exynos_crtc_mode {
  * Exynos specific crtc structure.
  *
  * @base: crtc object.
- * @manager: the manager associated with this crtc
  * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
  * @pipe: a crtc index created at load() with a new crtc object creation
  *	and the crtc object would be set to private->crtc array
@@ -235,16 +219,19 @@ enum exynos_crtc_mode {
  *	this pipe value.
  * @dpms: store the crtc dpms value
  * @mode: store the crtc mode value
+ * @ops: pointer to callbacks for exynos drm specific functionality
+ * @ctx: A pointer to the crtc's implementation specific context
  */
 struct exynos_drm_crtc {
 	struct drm_crtc			base;
-	struct exynos_drm_manager	*manager;
 	enum exynos_drm_output_type	type;
 	unsigned int			pipe;
 	unsigned int			dpms;
 	enum exynos_crtc_mode		mode;
 	wait_queue_head_t		pending_flip_queue;
 	atomic_t			pending_flip;
+	struct exynos_drm_crtc_ops	*ops;
+	void				*ctx;
 };
 
 struct exynos_drm_g2d_private {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 3713be7..b9350d0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -158,9 +158,9 @@ struct fimd_win_data {
 };
 
 struct fimd_context {
-	struct exynos_drm_manager	manager;
 	struct device			*dev;
 	struct drm_device		*drm_dev;
+	struct exynos_drm_crtc		*crtc;
 	struct clk			*bus_clk;
 	struct clk			*lcd_clk;
 	void __iomem			*regs;
@@ -186,11 +186,6 @@ struct fimd_context {
 	struct exynos_drm_display *display;
 };
 
-static inline struct fimd_context *mgr_to_fimd(struct exynos_drm_manager *mgr)
-{
-	return container_of(mgr, struct fimd_context, manager);
-}
-
 static const struct of_device_id fimd_driver_dt_match[] = {
 	{ .compatible = "samsung,s3c6400-fimd",
 	  .data = &s3c64xx_fimd_driver_data },
@@ -215,9 +210,9 @@ static inline struct fimd_driver_data *drm_fimd_get_driver_data(
 	return (struct fimd_driver_data *)of_id->data;
 }
 
-static void fimd_wait_for_vblank(struct exynos_drm_manager *mgr)
+static void fimd_wait_for_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 
 	if (ctx->suspended)
 		return;
@@ -260,9 +255,9 @@ static void fimd_enable_shadow_channel_path(struct fimd_context *ctx, int win,
 	writel(val, ctx->regs + SHADOWCON);
 }
 
-static void fimd_clear_channel(struct exynos_drm_manager *mgr)
+static void fimd_clear_channel(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	int win, ch_enabled = 0;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
@@ -287,15 +282,14 @@ static void fimd_clear_channel(struct exynos_drm_manager *mgr)
 		unsigned int state = ctx->suspended;
 
 		ctx->suspended = 0;
-		fimd_wait_for_vblank(mgr);
+		fimd_wait_for_vblank(crtc);
 		ctx->suspended = state;
 	}
 }
 
-static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
+static int fimd_ctx_initialize(struct fimd_context *ctx,
 			struct drm_device *drm_dev)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
 	struct exynos_drm_private *priv;
 	priv = drm_dev->dev_private;
 
@@ -308,17 +302,15 @@ static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
 		 * If any channel is already active, iommu will throw
 		 * a PAGE FAULT when enabled. So clear any channel if enabled.
 		 */
-		fimd_clear_channel(mgr);
+		fimd_clear_channel(ctx->crtc);
 		drm_iommu_attach_device(ctx->drm_dev, ctx->dev);
 	}
 
 	return 0;
 }
 
-static void fimd_mgr_remove(struct exynos_drm_manager *mgr)
+static void fimd_ctx_remove(struct fimd_context *ctx)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
-
 	/* detach this sub driver from iommu mapping if supported. */
 	if (is_drm_iommu_supported(ctx->drm_dev))
 		drm_iommu_detach_device(ctx->drm_dev, ctx->dev);
@@ -344,7 +336,7 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
 	return (clkdiv < 0x100) ? clkdiv : 0xff;
 }
 
-static bool fimd_mode_fixup(struct exynos_drm_manager *mgr,
+static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
 {
@@ -354,17 +346,17 @@ static bool fimd_mode_fixup(struct exynos_drm_manager *mgr,
 	return true;
 }
 
-static void fimd_mode_set(struct exynos_drm_manager *mgr,
+static void fimd_mode_set(struct exynos_drm_crtc *crtc,
 		const struct drm_display_mode *in_mode)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 
 	drm_mode_copy(&ctx->mode, in_mode);
 }
 
-static void fimd_commit(struct exynos_drm_manager *mgr)
+static void fimd_commit(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	struct drm_display_mode *mode = &ctx->mode;
 	struct fimd_driver_data *driver_data = ctx->driver_data;
 	void *timing_base = ctx->regs + driver_data->timing_base;
@@ -462,9 +454,9 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	writel(val, ctx->regs + VIDCON0);
 }
 
-static int fimd_enable_vblank(struct exynos_drm_manager *mgr)
+static int fimd_enable_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	u32 val;
 
 	if (ctx->suspended)
@@ -494,9 +486,9 @@ static int fimd_enable_vblank(struct exynos_drm_manager *mgr)
 	return 0;
 }
 
-static void fimd_disable_vblank(struct exynos_drm_manager *mgr)
+static void fimd_disable_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	u32 val;
 
 	if (ctx->suspended)
@@ -518,10 +510,10 @@ static void fimd_disable_vblank(struct exynos_drm_manager *mgr)
 	}
 }
 
-static void fimd_win_mode_set(struct exynos_drm_manager *mgr,
+static void fimd_win_mode_set(struct exynos_drm_crtc *crtc,
 			struct exynos_drm_plane *plane)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	struct fimd_win_data *win_data;
 	int win;
 	unsigned long offset;
@@ -677,9 +669,9 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 	writel(val, ctx->regs + reg);
 }
 
-static void fimd_win_commit(struct exynos_drm_manager *mgr, int zpos)
+static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	struct fimd_win_data *win_data;
 	int win = zpos;
 	unsigned long val, alpha, size;
@@ -800,9 +792,9 @@ static void fimd_win_commit(struct exynos_drm_manager *mgr, int zpos)
 		atomic_set(&ctx->win_updated, 1);
 }
 
-static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
+static void fimd_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	struct fimd_win_data *win_data;
 	int win = zpos;
 
@@ -834,9 +826,9 @@ static void fimd_win_disable(struct exynos_drm_manager *mgr, int zpos)
 	win_data->enabled = false;
 }
 
-static void fimd_window_suspend(struct exynos_drm_manager *mgr)
+static void fimd_window_suspend(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	struct fimd_win_data *win_data;
 	int i;
 
@@ -844,13 +836,13 @@ static void fimd_window_suspend(struct exynos_drm_manager *mgr)
 		win_data = &ctx->win_data[i];
 		win_data->resume = win_data->enabled;
 		if (win_data->enabled)
-			fimd_win_disable(mgr, i);
+			fimd_win_disable(crtc, i);
 	}
 }
 
-static void fimd_window_resume(struct exynos_drm_manager *mgr)
+static void fimd_window_resume(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	struct fimd_win_data *win_data;
 	int i;
 
@@ -861,26 +853,26 @@ static void fimd_window_resume(struct exynos_drm_manager *mgr)
 	}
 }
 
-static void fimd_apply(struct exynos_drm_manager *mgr)
+static void fimd_apply(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	struct fimd_win_data *win_data;
 	int i;
 
 	for (i = 0; i < WINDOWS_NR; i++) {
 		win_data = &ctx->win_data[i];
 		if (win_data->enabled)
-			fimd_win_commit(mgr, i);
+			fimd_win_commit(crtc, i);
 		else
-			fimd_win_disable(mgr, i);
+			fimd_win_disable(crtc, i);
 	}
 
-	fimd_commit(mgr);
+	fimd_commit(crtc);
 }
 
-static int fimd_poweron(struct exynos_drm_manager *mgr)
+static int fimd_poweron(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 	int ret;
 
 	if (!ctx->suspended)
@@ -904,16 +896,16 @@ static int fimd_poweron(struct exynos_drm_manager *mgr)
 
 	/* if vblank was enabled status, enable it again. */
 	if (test_and_clear_bit(0, &ctx->irq_flags)) {
-		ret = fimd_enable_vblank(mgr);
+		ret = fimd_enable_vblank(crtc);
 		if (ret) {
 			DRM_ERROR("Failed to re-enable vblank [%d]\n", ret);
 			goto enable_vblank_err;
 		}
 	}
 
-	fimd_window_resume(mgr);
+	fimd_window_resume(crtc);
 
-	fimd_apply(mgr);
+	fimd_apply(crtc);
 
 	return 0;
 
@@ -926,9 +918,9 @@ bus_clk_err:
 	return ret;
 }
 
-static int fimd_poweroff(struct exynos_drm_manager *mgr)
+static int fimd_poweroff(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 
 	if (ctx->suspended)
 		return 0;
@@ -938,7 +930,7 @@ static int fimd_poweroff(struct exynos_drm_manager *mgr)
 	 * suspend that connector. Otherwise we might try to scan from
 	 * a destroyed buffer later.
 	 */
-	fimd_window_suspend(mgr);
+	fimd_window_suspend(crtc);
 
 	clk_disable_unprepare(ctx->lcd_clk);
 	clk_disable_unprepare(ctx->bus_clk);
@@ -949,18 +941,18 @@ static int fimd_poweroff(struct exynos_drm_manager *mgr)
 	return 0;
 }
 
-static void fimd_dpms(struct exynos_drm_manager *mgr, int mode)
+static void fimd_dpms(struct exynos_drm_crtc *crtc, int mode)
 {
 	DRM_DEBUG_KMS("%s, %d\n", __FILE__, mode);
 
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-		fimd_poweron(mgr);
+		fimd_poweron(crtc);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
-		fimd_poweroff(mgr);
+		fimd_poweroff(crtc);
 		break;
 	default:
 		DRM_DEBUG_KMS("unspecified mode %d\n", mode);
@@ -997,9 +989,9 @@ static void fimd_trigger(struct device *dev)
 		atomic_set(&ctx->triggering, 0);
 }
 
-static void fimd_te_handler(struct exynos_drm_manager *mgr)
+static void fimd_te_handler(struct exynos_drm_crtc *crtc)
 {
-	struct fimd_context *ctx = mgr_to_fimd(mgr);
+	struct fimd_context *ctx = crtc->ctx;
 
 	/* Checks the crtc is detached already from encoder */
 	if (ctx->pipe < 0 || !ctx->drm_dev)
@@ -1022,7 +1014,7 @@ static void fimd_te_handler(struct exynos_drm_manager *mgr)
 		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
 }
 
-static struct exynos_drm_manager_ops fimd_manager_ops = {
+static struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.dpms = fimd_dpms,
 	.mode_fixup = fimd_mode_fixup,
 	.mode_set = fimd_mode_set,
@@ -1101,9 +1093,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
 
-	fimd_mgr_initialize(&ctx->manager, drm_dev);
-	exynos_drm_crtc_create(&ctx->manager, drm_dev, ctx->pipe,
-			       EXYNOS_DISPLAY_TYPE_LCD);
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
+					   EXYNOS_DISPLAY_TYPE_LCD,
+					   &fimd_crtc_ops, ctx);
+	if (IS_ERR(ctx->crtc))
+		return PTR_ERR(ctx->crtc);
+
+	fimd_ctx_initialize(ctx, drm_dev);
+
 	if (ctx->display)
 		exynos_drm_create_enc_conn(drm_dev, ctx->display);
 
@@ -1116,12 +1113,12 @@ static void fimd_unbind(struct device *dev, struct device *master,
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 
-	fimd_dpms(&ctx->manager, DRM_MODE_DPMS_OFF);
+	fimd_dpms(ctx->crtc, DRM_MODE_DPMS_OFF);
 
 	if (ctx->display)
 		exynos_dpi_remove(ctx->display);
 
-	fimd_mgr_remove(&ctx->manager);
+	fimd_ctx_remove(ctx);
 }
 
 static const struct component_ops fimd_component_ops = {
@@ -1144,8 +1141,6 @@ static int fimd_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->manager.ops = &fimd_manager_ops;
-
 	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
 				       EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index dadd306..95442e6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -68,7 +68,7 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			  uint32_t src_w, uint32_t src_h)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	unsigned int actual_w;
 	unsigned int actual_h;
 	int nr;
@@ -133,8 +133,8 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 
 	plane->crtc = crtc;
 
-	if (manager->ops->win_mode_set)
-		manager->ops->win_mode_set(manager, exynos_plane);
+	if (exynos_crtc->ops->win_mode_set)
+		exynos_crtc->ops->win_mode_set(exynos_crtc, exynos_plane);
 
 	return 0;
 }
@@ -142,24 +142,24 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 void exynos_plane_dpms(struct drm_plane *plane, int mode)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_manager *manager;
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(plane->crtc);
 
 	if (mode == DRM_MODE_DPMS_ON) {
 		if (exynos_plane->enabled)
 			return;
 
-		manager = to_exynos_crtc(plane->crtc)->manager;
-		if (manager->ops->win_enable)
-			manager->ops->win_enable(manager, exynos_plane->zpos);
+		if (exynos_crtc->ops->win_enable)
+			exynos_crtc->ops->win_enable(exynos_crtc,
+						     exynos_plane->zpos);
 
 		exynos_plane->enabled = true;
 	} else {
 		if (!exynos_plane->enabled)
 			return;
 
-		manager = to_exynos_crtc(plane->crtc)->manager;
-		if (manager->ops->win_disable)
-			manager->ops->win_disable(manager, exynos_plane->zpos);
+		if (exynos_crtc->ops->win_disable)
+			exynos_crtc->ops->win_disable(exynos_crtc,
+						      exynos_plane->zpos);
 
 		exynos_plane->enabled = false;
 	}
@@ -173,7 +173,7 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		     uint32_t src_w, uint32_t src_h)
 {
 
-	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	int ret;
 
@@ -183,8 +183,8 @@ exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	if (ret < 0)
 		return ret;
 
-	if (manager->ops->win_commit)
-		manager->ops->win_commit(manager, exynos_plane->zpos);
+	if (exynos_crtc->ops->win_commit)
+		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 03687db..9c8300e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -47,11 +47,10 @@ struct vidi_win_data {
 };
 
 struct vidi_context {
-	struct exynos_drm_manager	manager;
 	struct exynos_drm_display	display;
 	struct platform_device		*pdev;
 	struct drm_device		*drm_dev;
-	struct drm_crtc			*crtc;
+	struct exynos_drm_crtc		*crtc;
 	struct drm_encoder		*encoder;
 	struct drm_connector		connector;
 	struct vidi_win_data		win_data[WINDOWS_NR];
@@ -68,11 +67,6 @@ struct vidi_context {
 	int				pipe;
 };
 
-static inline struct vidi_context *manager_to_vidi(struct exynos_drm_manager *m)
-{
-	return container_of(m, struct vidi_context, manager);
-}
-
 static inline struct vidi_context *display_to_vidi(struct exynos_drm_display *d)
 {
 	return container_of(d, struct vidi_context, display);
@@ -103,23 +97,23 @@ static const char fake_edid_info[] = {
 	0x00, 0x00, 0x00, 0x06
 };
 
-static void vidi_apply(struct exynos_drm_manager *mgr)
+static void vidi_apply(struct exynos_drm_crtc *crtc)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
-	struct exynos_drm_manager_ops *mgr_ops = mgr->ops;
+	struct vidi_context *ctx = crtc->ctx;
+	struct exynos_drm_crtc_ops *crtc_ops = crtc->ops;
 	struct vidi_win_data *win_data;
 	int i;
 
 	for (i = 0; i < WINDOWS_NR; i++) {
 		win_data = &ctx->win_data[i];
-		if (win_data->enabled && (mgr_ops && mgr_ops->win_commit))
-			mgr_ops->win_commit(mgr, i);
+		if (win_data->enabled && (crtc_ops && crtc_ops->win_commit))
+			crtc_ops->win_commit(crtc, i);
 	}
 }
 
-static int vidi_enable_vblank(struct exynos_drm_manager *mgr)
+static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
+	struct vidi_context *ctx = crtc->ctx;
 
 	if (ctx->suspended)
 		return -EPERM;
@@ -132,16 +126,16 @@ static int vidi_enable_vblank(struct exynos_drm_manager *mgr)
 	/*
 	 * in case of page flip request, vidi_finish_pageflip function
 	 * will not be called because direct_vblank is true and then
-	 * that function will be called by manager_ops->win_commit callback
+	 * that function will be called by crtc_ops->win_commit callback
 	 */
 	schedule_work(&ctx->work);
 
 	return 0;
 }
 
-static void vidi_disable_vblank(struct exynos_drm_manager *mgr)
+static void vidi_disable_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
+	struct vidi_context *ctx = crtc->ctx;
 
 	if (ctx->suspended)
 		return;
@@ -150,10 +144,10 @@ static void vidi_disable_vblank(struct exynos_drm_manager *mgr)
 		ctx->vblank_on = false;
 }
 
-static void vidi_win_mode_set(struct exynos_drm_manager *mgr,
+static void vidi_win_mode_set(struct exynos_drm_crtc *crtc,
 			struct exynos_drm_plane *plane)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
+	struct vidi_context *ctx = crtc->ctx;
 	struct vidi_win_data *win_data;
 	int win;
 	unsigned long offset;
@@ -203,9 +197,9 @@ static void vidi_win_mode_set(struct exynos_drm_manager *mgr,
 			plane->fb_width, plane->crtc_width);
 }
 
-static void vidi_win_commit(struct exynos_drm_manager *mgr, int zpos)
+static void vidi_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
+	struct vidi_context *ctx = crtc->ctx;
 	struct vidi_win_data *win_data;
 	int win = zpos;
 
@@ -228,9 +222,9 @@ static void vidi_win_commit(struct exynos_drm_manager *mgr, int zpos)
 		schedule_work(&ctx->work);
 }
 
-static void vidi_win_disable(struct exynos_drm_manager *mgr, int zpos)
+static void vidi_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
+	struct vidi_context *ctx = crtc->ctx;
 	struct vidi_win_data *win_data;
 	int win = zpos;
 
@@ -246,9 +240,9 @@ static void vidi_win_disable(struct exynos_drm_manager *mgr, int zpos)
 	/* TODO. */
 }
 
-static int vidi_power_on(struct exynos_drm_manager *mgr, bool enable)
+static int vidi_power_on(struct exynos_drm_crtc *crtc, bool enable)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
+	struct vidi_context *ctx = crtc->ctx;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
@@ -260,9 +254,9 @@ static int vidi_power_on(struct exynos_drm_manager *mgr, bool enable)
 
 		/* if vblank was enabled status, enable it again. */
 		if (test_and_clear_bit(0, &ctx->irq_flags))
-			vidi_enable_vblank(mgr);
+			vidi_enable_vblank(crtc);
 
-		vidi_apply(mgr);
+		vidi_apply(crtc);
 	} else {
 		ctx->suspended = true;
 	}
@@ -270,9 +264,9 @@ static int vidi_power_on(struct exynos_drm_manager *mgr, bool enable)
 	return 0;
 }
 
-static void vidi_dpms(struct exynos_drm_manager *mgr, int mode)
+static void vidi_dpms(struct exynos_drm_crtc *crtc, int mode)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
+	struct vidi_context *ctx = crtc->ctx;
 
 	DRM_DEBUG_KMS("%d\n", mode);
 
@@ -280,12 +274,12 @@ static void vidi_dpms(struct exynos_drm_manager *mgr, int mode)
 
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-		vidi_power_on(mgr, true);
+		vidi_power_on(crtc, true);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
-		vidi_power_on(mgr, false);
+		vidi_power_on(crtc, false);
 		break;
 	default:
 		DRM_DEBUG_KMS("unspecified mode %d\n", mode);
@@ -295,10 +289,9 @@ static void vidi_dpms(struct exynos_drm_manager *mgr, int mode)
 	mutex_unlock(&ctx->lock);
 }
 
-static int vidi_mgr_initialize(struct exynos_drm_manager *mgr,
+static int vidi_ctx_initialize(struct vidi_context *ctx,
 			struct drm_device *drm_dev)
 {
-	struct vidi_context *ctx = manager_to_vidi(mgr);
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	ctx->drm_dev = drm_dev;
@@ -307,7 +300,7 @@ static int vidi_mgr_initialize(struct exynos_drm_manager *mgr,
 	return 0;
 }
 
-static struct exynos_drm_manager_ops vidi_manager_ops = {
+static struct exynos_drm_crtc_ops vidi_crtc_ops = {
 	.dpms = vidi_dpms,
 	.enable_vblank = vidi_enable_vblank,
 	.disable_vblank = vidi_disable_vblank,
@@ -553,22 +546,21 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	struct drm_crtc *crtc = ctx->crtc;
 	int ret;
 
-	vidi_mgr_initialize(&ctx->manager, drm_dev);
-
-	ret = exynos_drm_crtc_create(&ctx->manager, drm_dev, ctx->pipe,
-				     EXYNOS_DISPLAY_TYPE_VIDI);
-	if (ret) {
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
+					   EXYNOS_DISPLAY_TYPE_VIDI,
+					   &vidi_crtc_ops, ctx);
+	if (IS_ERR(ctx->crtc)) {
 		DRM_ERROR("failed to create crtc.\n");
-		return ret;
+		return PTR_ERR(ctx->crtc);
 	}
 
+	vidi_ctx_initialize(ctx, drm_dev);
+
 	ret = exynos_drm_create_enc_conn(drm_dev, &ctx->display);
 	if (ret) {
-		crtc->funcs->destroy(crtc);
-		DRM_ERROR("failed to create encoder and connector.\n");
+		ctx->crtc->base.funcs->destroy(&ctx->crtc->base);
 		return ret;
 	}
 
@@ -594,7 +586,6 @@ static int vidi_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->manager.ops = &vidi_manager_ops;
 	ctx->display.type = EXYNOS_DISPLAY_TYPE_VIDI;
 	ctx->display.ops = &vidi_display_ops;
 	ctx->default_win = 0;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index d8f2b6d..141d08a 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -84,10 +84,10 @@ enum mixer_version_id {
 };
 
 struct mixer_context {
-	struct exynos_drm_manager manager;
 	struct platform_device *pdev;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
+	struct exynos_drm_crtc	*crtc;
 	int			pipe;
 	bool			interlace;
 	bool			powered;
@@ -103,11 +103,6 @@ struct mixer_context {
 	atomic_t		wait_vsync_event;
 };
 
-static inline struct mixer_context *mgr_to_mixer(struct exynos_drm_manager *mgr)
-{
-	return container_of(mgr, struct mixer_context, manager);
-}
-
 struct mixer_drv_data {
 	enum mixer_version_id	version;
 	bool					is_vp_enabled;
@@ -854,11 +849,10 @@ static int vp_resources_init(struct mixer_context *mixer_ctx)
 	return 0;
 }
 
-static int mixer_initialize(struct exynos_drm_manager *mgr,
+static int mixer_initialize(struct mixer_context *mixer_ctx,
 			struct drm_device *drm_dev)
 {
 	int ret;
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
 	struct exynos_drm_private *priv;
 	priv = drm_dev->dev_private;
 
@@ -887,17 +881,15 @@ static int mixer_initialize(struct exynos_drm_manager *mgr,
 	return drm_iommu_attach_device(mixer_ctx->drm_dev, mixer_ctx->dev);
 }
 
-static void mixer_mgr_remove(struct exynos_drm_manager *mgr)
+static void mixer_ctx_remove(struct mixer_context *mixer_ctx)
 {
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
-
 	if (is_drm_iommu_supported(mixer_ctx->drm_dev))
 		drm_iommu_detach_device(mixer_ctx->drm_dev, mixer_ctx->dev);
 }
 
-static int mixer_enable_vblank(struct exynos_drm_manager *mgr)
+static int mixer_enable_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
+	struct mixer_context *mixer_ctx = crtc->ctx;
 	struct mixer_resources *res = &mixer_ctx->mixer_res;
 
 	if (!mixer_ctx->powered) {
@@ -912,19 +904,19 @@ static int mixer_enable_vblank(struct exynos_drm_manager *mgr)
 	return 0;
 }
 
-static void mixer_disable_vblank(struct exynos_drm_manager *mgr)
+static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
+	struct mixer_context *mixer_ctx = crtc->ctx;
 	struct mixer_resources *res = &mixer_ctx->mixer_res;
 
 	/* disable vsync interrupt */
 	mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
-static void mixer_win_mode_set(struct exynos_drm_manager *mgr,
+static void mixer_win_mode_set(struct exynos_drm_crtc *crtc,
 			struct exynos_drm_plane *plane)
 {
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
+	struct mixer_context *mixer_ctx = crtc->ctx;
 	struct hdmi_win_data *win_data;
 	int win;
 
@@ -973,9 +965,9 @@ static void mixer_win_mode_set(struct exynos_drm_manager *mgr,
 	win_data->scan_flags = plane->scan_flag;
 }
 
-static void mixer_win_commit(struct exynos_drm_manager *mgr, int zpos)
+static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 {
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
+	struct mixer_context *mixer_ctx = crtc->ctx;
 	int win = zpos == DEFAULT_ZPOS ? MIXER_DEFAULT_WIN : zpos;
 
 	DRM_DEBUG_KMS("win: %d\n", win);
@@ -995,9 +987,9 @@ static void mixer_win_commit(struct exynos_drm_manager *mgr, int zpos)
 	mixer_ctx->win_data[win].enabled = true;
 }
 
-static void mixer_win_disable(struct exynos_drm_manager *mgr, int zpos)
+static void mixer_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 {
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
+	struct mixer_context *mixer_ctx = crtc->ctx;
 	struct mixer_resources *res = &mixer_ctx->mixer_res;
 	int win = zpos == DEFAULT_ZPOS ? MIXER_DEFAULT_WIN : zpos;
 	unsigned long flags;
@@ -1023,9 +1015,9 @@ static void mixer_win_disable(struct exynos_drm_manager *mgr, int zpos)
 	mixer_ctx->win_data[win].enabled = false;
 }
 
-static void mixer_wait_for_vblank(struct exynos_drm_manager *mgr)
+static void mixer_wait_for_vblank(struct exynos_drm_crtc *crtc)
 {
-	struct mixer_context *mixer_ctx = mgr_to_mixer(mgr);
+	struct mixer_context *mixer_ctx = crtc->ctx;
 
 	mutex_lock(&mixer_ctx->mixer_mutex);
 	if (!mixer_ctx->powered) {
@@ -1034,7 +1026,7 @@ static void mixer_wait_for_vblank(struct exynos_drm_manager *mgr)
 	}
 	mutex_unlock(&mixer_ctx->mixer_mutex);
 
-	drm_vblank_get(mgr->crtc->dev, mixer_ctx->pipe);
+	drm_vblank_get(mixer_ctx->drm_dev, mixer_ctx->pipe);
 
 	atomic_set(&mixer_ctx->wait_vsync_event, 1);
 
@@ -1047,26 +1039,26 @@ static void mixer_wait_for_vblank(struct exynos_drm_manager *mgr)
 				HZ/20))
 		DRM_DEBUG_KMS("vblank wait timed out.\n");
 
-	drm_vblank_put(mgr->crtc->dev, mixer_ctx->pipe);
+	drm_vblank_put(mixer_ctx->drm_dev, mixer_ctx->pipe);
 }
 
-static void mixer_window_suspend(struct exynos_drm_manager *mgr)
+static void mixer_window_suspend(struct exynos_drm_crtc *crtc)
 {
-	struct mixer_context *ctx = mgr_to_mixer(mgr);
+	struct mixer_context *ctx = crtc->ctx;
 	struct hdmi_win_data *win_data;
 	int i;
 
 	for (i = 0; i < MIXER_WIN_NR; i++) {
 		win_data = &ctx->win_data[i];
 		win_data->resume = win_data->enabled;
-		mixer_win_disable(mgr, i);
+		mixer_win_disable(crtc, i);
 	}
-	mixer_wait_for_vblank(mgr);
+	mixer_wait_for_vblank(crtc);
 }
 
-static void mixer_window_resume(struct exynos_drm_manager *mgr)
+static void mixer_window_resume(struct exynos_drm_crtc *crtc)
 {
-	struct mixer_context *ctx = mgr_to_mixer(mgr);
+	struct mixer_context *ctx = crtc->ctx;
 	struct hdmi_win_data *win_data;
 	int i;
 
@@ -1075,13 +1067,13 @@ static void mixer_window_resume(struct exynos_drm_manager *mgr)
 		win_data->enabled = win_data->resume;
 		win_data->resume = false;
 		if (win_data->enabled)
-			mixer_win_commit(mgr, i);
+			mixer_win_commit(crtc, i);
 	}
 }
 
-static void mixer_poweron(struct exynos_drm_manager *mgr)
+static void mixer_poweron(struct exynos_drm_crtc *crtc)
 {
-	struct mixer_context *ctx = mgr_to_mixer(mgr);
+	struct mixer_context *ctx = crtc->ctx;
 	struct mixer_resources *res = &ctx->mixer_res;
 
 	mutex_lock(&ctx->mixer_mutex);
@@ -1110,12 +1102,12 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
 	mixer_reg_write(res, MXR_INT_EN, ctx->int_en);
 	mixer_win_reset(ctx);
 
-	mixer_window_resume(mgr);
+	mixer_window_resume(crtc);
 }
 
-static void mixer_poweroff(struct exynos_drm_manager *mgr)
+static void mixer_poweroff(struct exynos_drm_crtc *crtc)
 {
-	struct mixer_context *ctx = mgr_to_mixer(mgr);
+	struct mixer_context *ctx = crtc->ctx;
 	struct mixer_resources *res = &ctx->mixer_res;
 
 	mutex_lock(&ctx->mixer_mutex);
@@ -1126,7 +1118,7 @@ static void mixer_poweroff(struct exynos_drm_manager *mgr)
 	mutex_unlock(&ctx->mixer_mutex);
 
 	mixer_stop(ctx);
-	mixer_window_suspend(mgr);
+	mixer_window_suspend(crtc);
 
 	ctx->int_en = mixer_reg_read(res, MXR_INT_EN);
 
@@ -1144,16 +1136,16 @@ static void mixer_poweroff(struct exynos_drm_manager *mgr)
 	pm_runtime_put_sync(ctx->dev);
 }
 
-static void mixer_dpms(struct exynos_drm_manager *mgr, int mode)
+static void mixer_dpms(struct exynos_drm_crtc *crtc, int mode)
 {
 	switch (mode) {
 	case DRM_MODE_DPMS_ON:
-		mixer_poweron(mgr);
+		mixer_poweron(crtc);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
-		mixer_poweroff(mgr);
+		mixer_poweroff(crtc);
 		break;
 	default:
 		DRM_DEBUG_KMS("unknown dpms mode: %d\n", mode);
@@ -1181,7 +1173,7 @@ int mixer_check_mode(struct drm_display_mode *mode)
 	return -EINVAL;
 }
 
-static struct exynos_drm_manager_ops mixer_manager_ops = {
+static struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.dpms			= mixer_dpms,
 	.enable_vblank		= mixer_enable_vblank,
 	.disable_vblank		= mixer_disable_vblank,
@@ -1252,27 +1244,32 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	ret = mixer_initialize(&ctx->manager, drm_dev);
-	if (ret)
-		return ret;
-
-	ret = exynos_drm_crtc_create(&ctx->manager, drm_dev, ctx->pipe,
-				     EXYNOS_DISPLAY_TYPE_HDMI);
-	if (ret) {
-		mixer_mgr_remove(&ctx->manager);
-		return ret;
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
+				     EXYNOS_DISPLAY_TYPE_HDMI,
+				     &mixer_crtc_ops, ctx);
+	if (IS_ERR(ctx->crtc)) {
+		ret = PTR_ERR(ctx->crtc);
+		goto free_ctx;
 	}
 
+	ret = mixer_initialize(ctx);
+	if (ret)
+		goto free_ctx;
+
 	pm_runtime_enable(dev);
 
 	return 0;
+
+free_ctx:
+	devm_kfree(dev, ctx);
+	return ret;
 }
 
 static void mixer_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct mixer_context *ctx = dev_get_drvdata(dev);
 
-	mixer_mgr_remove(&ctx->manager);
+	mixer_ctx_remove(ctx);
 
 	pm_runtime_disable(dev);
 }
@@ -1297,8 +1294,6 @@ static int mixer_probe(struct platform_device *pdev)
 
 	mutex_init(&ctx->mixer_mutex);
 
-	ctx->manager.ops = &mixer_manager_ops;
-
 	if (dev->of_node) {
 		const struct of_device_id *match;
 
-- 
1.9.3
