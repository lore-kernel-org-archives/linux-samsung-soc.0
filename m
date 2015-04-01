From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v4 4/8] drm/exynos: preset zpos value for overlay planes
Date: Wed,  1 Apr 2015 13:02:08 -0300
Message-ID: <1427904132-15677-5-git-send-email-gustavo@padovan.org>
References: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:35393 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752696AbbDAQC3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 12:02:29 -0400
Received: by qgh3 with SMTP id 3so46434730qgh.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 09:02:28 -0700 (PDT)
In-Reply-To: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Usually userspace don't want to have two overlay planes on the same zpos
so this change assign a different zpos for each plane. Before this change
a zpos of value zero was created for all planes so the userspace had to
set up the zpos of every plane it wanted to use.

Also all places that were storing zpos positions are now unsigned int.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 20 +++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h    |  7 +++----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 19 ++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c  | 16 +++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.h  |  3 ++-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 17 +++++------------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 11 +++++------
 7 files changed, 37 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index cd67037..e37f3e5 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -378,7 +378,7 @@ static void decon_win_set_colkey(struct decon_context *ctx, unsigned int win)
  * @protect: 1 to protect (disable updates)
  */
 static void decon_shadow_protect_win(struct decon_context *ctx,
-							int win, bool protect)
+				     unsigned int win, bool protect)
 {
 	u32 bits, val;
 
@@ -392,12 +392,12 @@ static void decon_shadow_protect_win(struct decon_context *ctx,
 	writel(val, ctx->regs + SHADOWCON);
 }
 
-static void decon_win_commit(struct exynos_drm_crtc *crtc, int zpos)
+static void decon_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct drm_display_mode *mode = &crtc->base.mode;
 	struct exynos_drm_plane *plane;
-	int padding, win = zpos;
+	int padding;
 	unsigned long val, alpha;
 	unsigned int last_x;
 	unsigned int last_y;
@@ -405,9 +405,6 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	if (ctx->suspended)
 		return;
 
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
-
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
@@ -513,16 +510,12 @@ static void decon_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	plane->enabled = true;
 }
 
-static void decon_win_disable(struct exynos_drm_crtc *crtc, int zpos)
+static void decon_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct decon_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
-	int win = zpos;
 	u32 val;
 
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
-
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
@@ -764,7 +757,8 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
 	enum drm_plane_type type;
-	int zpos, ret;
+	unsigned int zpos;
+	int ret;
 
 	ret = decon_ctx_initialize(ctx, drm_dev);
 	if (ret) {
@@ -776,7 +770,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type);
+					1 << ctx->pipe, type, zpos);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 8a2f943..26d6de1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -21,7 +21,6 @@
 #define MAX_CRTC	3
 #define MAX_PLANE	5
 #define MAX_FB_BUFFER	4
-#define DEFAULT_ZPOS	-1
 
 #define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc, base)
 #define to_exynos_plane(x)	container_of(x, struct exynos_drm_plane, base)
@@ -104,7 +103,7 @@ struct exynos_drm_plane {
 	unsigned int pitch;
 	uint32_t pixel_format;
 	dma_addr_t dma_addr[MAX_FB_BUFFER];
-	int zpos;
+	unsigned int zpos;
 	unsigned int index_color;
 
 	bool default_win:1;
@@ -189,8 +188,8 @@ struct exynos_drm_crtc_ops {
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
-	void (*win_commit)(struct exynos_drm_crtc *crtc, int zpos);
-	void (*win_disable)(struct exynos_drm_crtc *crtc, int zpos);
+	void (*win_commit)(struct exynos_drm_crtc *crtc, unsigned int zpos);
+	void (*win_disable)(struct exynos_drm_crtc *crtc, unsigned int zpos);
 	void (*te_handler)(struct exynos_drm_crtc *crtc);
 };
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 4618f4f..04702b7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -602,7 +602,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
  * @protect: 1 to protect (disable updates)
  */
 static void fimd_shadow_protect_win(struct fimd_context *ctx,
-							int win, bool protect)
+				    unsigned int win, bool protect)
 {
 	u32 reg, bits, val;
 
@@ -622,11 +622,10 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 	writel(val, ctx->regs + reg);
 }
 
-static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
+static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct fimd_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
-	int win = zpos;
 	dma_addr_t dma_addr;
 	unsigned long val, size, offset;
 	unsigned int last_x, last_y, buf_offsize, line_size;
@@ -634,9 +633,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	if (ctx->suspended)
 		return;
 
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
-
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
@@ -742,14 +738,10 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 		atomic_set(&ctx->win_updated, 1);
 }
 
-static void fimd_win_disable(struct exynos_drm_crtc *crtc, int zpos)
+static void fimd_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct fimd_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
-	int win = zpos;
-
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
 
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
@@ -1011,7 +1003,8 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
 	enum drm_plane_type type;
-	int zpos, ret;
+	unsigned int zpos;
+	int ret;
 
 	ret = fimd_ctx_initialize(ctx, drm_dev);
 	if (ret) {
@@ -1023,7 +1016,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type);
+					1 << ctx->pipe, type, zpos);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 4a7cfb7..504bd6e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -207,7 +207,8 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.set_property	= exynos_plane_set_property,
 };
 
-static void exynos_plane_attach_zpos_property(struct drm_plane *plane)
+static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
+					      unsigned int zpos)
 {
 	struct drm_device *dev = plane->dev;
 	struct exynos_drm_private *dev_priv = dev->dev_private;
@@ -223,12 +224,13 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane)
 		dev_priv->plane_zpos_property = prop;
 	}
 
-	drm_object_attach_property(&plane->base, prop, 0);
+	drm_object_attach_property(&plane->base, prop, zpos);
 }
 
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
-		      unsigned long possible_crtcs, enum drm_plane_type type)
+		      unsigned long possible_crtcs, enum drm_plane_type type,
+		      unsigned int zpos)
 {
 	int err;
 
@@ -240,10 +242,10 @@ int exynos_plane_init(struct drm_device *dev,
 		return err;
 	}
 
-	if (type == DRM_PLANE_TYPE_PRIMARY)
-		exynos_plane->zpos = DEFAULT_ZPOS;
-	else
-		exynos_plane_attach_zpos_property(&exynos_plane->base);
+	exynos_plane->zpos = zpos;
+
+	if (type == DRM_PLANE_TYPE_OVERLAY)
+		exynos_plane_attach_zpos_property(&exynos_plane->base, zpos);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index d8a3494..f360590 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -22,4 +22,5 @@ int exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 			uint32_t src_w, uint32_t src_h);
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
-		      unsigned long possible_crtcs, enum drm_plane_type type);
+		      unsigned long possible_crtcs, enum drm_plane_type type,
+		      unsigned int zpos);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index da5ee15..27e84ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -117,18 +117,14 @@ static void vidi_disable_vblank(struct exynos_drm_crtc *crtc)
 		ctx->vblank_on = false;
 }
 
-static void vidi_win_commit(struct exynos_drm_crtc *crtc, int zpos)
+static void vidi_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct vidi_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
-	int win = zpos;
 
 	if (ctx->suspended)
 		return;
 
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
-
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
@@ -142,14 +138,10 @@ static void vidi_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 		schedule_work(&ctx->work);
 }
 
-static void vidi_win_disable(struct exynos_drm_crtc *crtc, int zpos)
+static void vidi_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct vidi_context *ctx = crtc->ctx;
 	struct exynos_drm_plane *plane;
-	int win = zpos;
-
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
 
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
@@ -472,7 +464,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
 	enum drm_plane_type type;
-	int zpos, ret;
+	unsigned int zpos;
+	int ret;
 
 	vidi_ctx_initialize(ctx, drm_dev);
 
@@ -480,7 +473,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type);
+					1 << ctx->pipe, type, zpos);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index d181cb1..f79d70a 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -898,10 +898,9 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 	mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
-static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
+static void mixer_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
-	int win = zpos == DEFAULT_ZPOS ? MIXER_DEFAULT_WIN : zpos;
 
 	DRM_DEBUG_KMS("win: %d\n", win);
 
@@ -920,11 +919,10 @@ static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	mixer_ctx->planes[win].enabled = true;
 }
 
-static void mixer_win_disable(struct exynos_drm_crtc *crtc, int zpos)
+static void mixer_win_disable(struct exynos_drm_crtc *crtc, unsigned int win)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
 	struct mixer_resources *res = &mixer_ctx->mixer_res;
-	int win = zpos == DEFAULT_ZPOS ? MIXER_DEFAULT_WIN : zpos;
 	unsigned long flags;
 
 	DRM_DEBUG_KMS("win: %d\n", win);
@@ -1179,7 +1177,8 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
 	enum drm_plane_type type;
-	int zpos, ret;
+	unsigned int zpos;
+	int ret;
 
 	ret = mixer_initialize(ctx, drm_dev);
 	if (ret)
@@ -1189,7 +1188,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 		type = (zpos == MIXER_DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type);
+					1 << ctx->pipe, type, zpos);
 		if (ret)
 			return ret;
 	}
-- 
2.1.0
