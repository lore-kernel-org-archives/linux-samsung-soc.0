From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 5/6] drm/exynos: remove struct *_win_data abstraction on planes
Date: Fri, 23 Jan 2015 10:42:59 -0200
Message-ID: <1422016980-23806-5-git-send-email-gustavo@padovan.org>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:33099 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751856AbbAWMnR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 07:43:17 -0500
Received: by mail-qa0-f51.google.com with SMTP id f12so5550843qad.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2015 04:43:17 -0800 (PST)
In-Reply-To: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

struct {fimd,mixer,vidi}_win_data was just keeping the same data
as struct exynos_drm_plane thus get ride of it and use exynos_drm_plane
directly.

It changes how planes are created and remove .win_mode_set() callback
that was only filling all *_win_data structs.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c  |   9 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h  |   1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  14 --
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 181 ++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_plane.c |  20 +--
 drivers/gpu/drm/exynos/exynos_drm_plane.h |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c  | 123 ++++-------------
 drivers/gpu/drm/exynos/exynos_mixer.c     | 212 +++++++++++-------------------
 9 files changed, 182 insertions(+), 389 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index d0f4e1b..5cd6c1a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -287,13 +287,13 @@ static void exynos_drm_crtc_attach_mode_property(struct drm_crtc *crtc)
 }
 
 struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
+					       struct drm_plane *plane,
 					       int pipe,
 					       enum exynos_drm_output_type type,
 					       struct exynos_drm_crtc_ops *ops,
 					       void *ctx)
 {
 	struct exynos_drm_crtc *exynos_crtc;
-	struct drm_plane *plane;
 	struct exynos_drm_private *private = drm_dev->dev_private;
 	struct drm_crtc *crtc;
 	int ret;
@@ -309,12 +309,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 	exynos_crtc->type = type;
 	exynos_crtc->ops = ops;
 	exynos_crtc->ctx = ctx;
-	plane = exynos_plane_init(drm_dev, 1 << pipe,
-				  DRM_PLANE_TYPE_PRIMARY);
-	if (IS_ERR(plane)) {
-		ret = PTR_ERR(plane);
-		goto err_plane;
-	}
 
 	crtc = &exynos_crtc->base;
 
@@ -333,7 +327,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 
 err_crtc:
 	plane->funcs->destroy(plane);
-err_plane:
 	kfree(exynos_crtc);
 	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 628b787..0ecd8fc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -18,6 +18,7 @@
 #include "exynos_drm_drv.h"
 
 struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
+					       struct drm_plane *plane,
 					       int pipe,
 					       enum exynos_drm_output_type type,
 					       struct exynos_drm_crtc_ops *ops,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 731cdbc..1fa2a7f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -55,7 +55,6 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 {
 	struct exynos_drm_private *private;
 	int ret;
-	int nr;
 
 	private = kzalloc(sizeof(struct exynos_drm_private), GFP_KERNEL);
 	if (!private)
@@ -80,19 +79,6 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 
 	exynos_drm_mode_config_init(dev);
 
-	for (nr = 0; nr < MAX_PLANE; nr++) {
-		struct drm_plane *plane;
-		unsigned long possible_crtcs = (1 << MAX_CRTC) - 1;
-
-		plane = exynos_plane_init(dev, possible_crtcs,
-					  DRM_PLANE_TYPE_OVERLAY);
-		if (!IS_ERR(plane))
-			continue;
-
-		ret = PTR_ERR(plane);
-		goto err_mode_config_cleanup;
-	}
-
 	/* setup possible_clones. */
 	exynos_drm_encoder_setup(dev);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 7411af2..cad54e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -78,6 +78,7 @@ enum exynos_drm_output_type {
  * @transparency: transparency on or off.
  * @activated: activated or not.
  * @enabled: enabled or not.
+ * @resume: to resume or not.
  *
  * this structure is common to exynos SoC and its contents would be copied
  * to hardware specific overlay info.
@@ -112,6 +113,7 @@ struct exynos_drm_plane {
 	bool transparency:1;
 	bool activated:1;
 	bool enabled:1;
+	bool resume:1;
 };
 
 /*
@@ -172,7 +174,6 @@ struct exynos_drm_display {
  * @disable_vblank: specific driver callback for disabling vblank interrupt.
  * @wait_for_vblank: wait for vblank interrupt to make sure that
  *	hardware overlay is updated.
- * @win_mode_set: copy drm overlay info to hw specific overlay info.
  * @win_commit: apply hardware specific overlay data to registers.
  * @win_enable: enable hardware specific overlay.
  * @win_disable: disable hardware specific overlay.
@@ -189,8 +190,6 @@ struct exynos_drm_crtc_ops {
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
-	void (*win_mode_set)(struct exynos_drm_crtc *crtc,
-				struct exynos_drm_plane *plane);
 	void (*win_commit)(struct exynos_drm_crtc *crtc, int zpos);
 	void (*win_enable)(struct exynos_drm_crtc *crtc, int zpos);
 	void (*win_disable)(struct exynos_drm_crtc *crtc, int zpos);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index d54ca07..27aebda 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -31,6 +31,7 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_fbdev.h"
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_plane.h"
 #include "exynos_drm_iommu.h"
 
 /*
@@ -140,31 +141,15 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.has_vtsel = 1,
 };
 
-struct fimd_win_data {
-	unsigned int		offset_x;
-	unsigned int		offset_y;
-	unsigned int		ovl_width;
-	unsigned int		ovl_height;
-	unsigned int		fb_width;
-	unsigned int		fb_height;
-	unsigned int		bpp;
-	unsigned int		pixel_format;
-	dma_addr_t		dma_addr;
-	unsigned int		buf_offsize;
-	unsigned int		line_size;	/* bytes */
-	bool			enabled;
-	bool			resume;
-};
-
 struct fimd_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct exynos_drm_crtc		*crtc;
+	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct clk			*bus_clk;
 	struct clk			*lcd_clk;
 	void __iomem			*regs;
 	struct regmap			*sysreg;
-	struct fimd_win_data		win_data[WINDOWS_NR];
 	unsigned int			default_win;
 	unsigned long			irq_flags;
 	u32				vidcon0;
@@ -500,58 +485,9 @@ static void fimd_disable_vblank(struct exynos_drm_crtc *crtc)
 	}
 }
 
-static void fimd_win_mode_set(struct exynos_drm_crtc *crtc,
-			struct exynos_drm_plane *plane)
-{
-	struct fimd_context *ctx = crtc->ctx;
-	struct fimd_win_data *win_data;
-	int win;
-	unsigned long offset;
-
-	if (!plane) {
-		DRM_ERROR("plane is NULL\n");
-		return;
-	}
-
-	win = plane->zpos;
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
-
-	if (win < 0 || win >= WINDOWS_NR)
-		return;
-
-	offset = plane->fb_x * (plane->bpp >> 3);
-	offset += plane->fb_y * plane->pitch;
-
-	DRM_DEBUG_KMS("offset = 0x%lx, pitch = %x\n", offset, plane->pitch);
-
-	win_data = &ctx->win_data[win];
-
-	win_data->offset_x = plane->crtc_x;
-	win_data->offset_y = plane->crtc_y;
-	win_data->ovl_width = plane->crtc_width;
-	win_data->ovl_height = plane->crtc_height;
-	win_data->fb_width = plane->fb_width;
-	win_data->fb_height = plane->fb_height;
-	win_data->dma_addr = plane->dma_addr[0] + offset;
-	win_data->bpp = plane->bpp;
-	win_data->pixel_format = plane->pixel_format;
-	win_data->buf_offsize = (plane->fb_width - plane->crtc_width) *
-				(plane->bpp >> 3);
-	win_data->line_size = plane->crtc_width * (plane->bpp >> 3);
-
-	DRM_DEBUG_KMS("offset_x = %d, offset_y = %d\n",
-			win_data->offset_x, win_data->offset_y);
-	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
-			win_data->ovl_width, win_data->ovl_height);
-	DRM_DEBUG_KMS("paddr = 0x%lx\n", (unsigned long)win_data->dma_addr);
-	DRM_DEBUG_KMS("fb_width = %d, crtc_width = %d\n",
-			plane->fb_width, plane->crtc_width);
-}
-
 static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 {
-	struct fimd_win_data *win_data = &ctx->win_data[win];
+	struct exynos_drm_plane *plane = &ctx->planes[win];
 	unsigned long val;
 
 	val = WINCONx_ENWIN;
@@ -561,11 +497,11 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 	 * So the request format is ARGB8888 then change it to XRGB8888.
 	 */
 	if (ctx->driver_data->has_limited_fmt && !win) {
-		if (win_data->pixel_format == DRM_FORMAT_ARGB8888)
-			win_data->pixel_format = DRM_FORMAT_XRGB8888;
+		if (plane->pixel_format == DRM_FORMAT_ARGB8888)
+			plane->pixel_format = DRM_FORMAT_XRGB8888;
 	}
 
-	switch (win_data->pixel_format) {
+	switch (plane->pixel_format) {
 	case DRM_FORMAT_C8:
 		val |= WINCON0_BPPMODE_8BPP_PALETTE;
 		val |= WINCONx_BURSTLEN_8WORD;
@@ -601,7 +537,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 		break;
 	}
 
-	DRM_DEBUG_KMS("bpp = %d\n", win_data->bpp);
+	DRM_DEBUG_KMS("bpp = %d\n", plane->bpp);
 
 	/*
 	 * In case of exynos, setting dma-burst to 16Word causes permanent
@@ -611,7 +547,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 	 * movement causes unstable DMA which results into iommu crash/tear.
 	 */
 
-	if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+	if (plane->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
 		val &= ~WINCONx_BURSTLEN_MASK;
 		val |= WINCONx_BURSTLEN_4WORD;
 	}
@@ -662,11 +598,11 @@ static void fimd_shadow_protect_win(struct fimd_context *ctx,
 static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct fimd_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int win = zpos;
-	unsigned long val, alpha, size;
-	unsigned int last_x;
-	unsigned int last_y;
+	dma_addr_t dma_addr;
+	unsigned long val, alpha, size, offset;
+	unsigned int last_x, last_y, buf_offsize, line_size;
 
 	if (ctx->suspended)
 		return;
@@ -677,11 +613,11 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
-	win_data = &ctx->win_data[win];
+	plane = &ctx->planes[win];
 
 	/* If suspended, enable this on resume */
 	if (ctx->suspended) {
-		win_data->resume = true;
+		plane->resume = true;
 		return;
 	}
 
@@ -698,38 +634,45 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	/* protect windows */
 	fimd_shadow_protect_win(ctx, win, true);
 
+
+	offset = plane->fb_x * (plane->bpp >> 3);
+	offset += plane->fb_y * plane->pitch;
+
 	/* buffer start address */
-	val = (unsigned long)win_data->dma_addr;
+	dma_addr = plane->dma_addr[0] + offset;
+	val = (unsigned long)dma_addr;
 	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
 
 	/* buffer end address */
-	size = win_data->fb_width * win_data->ovl_height * (win_data->bpp >> 3);
-	val = (unsigned long)(win_data->dma_addr + size);
+	size = plane->fb_width * plane->crtc_height * (plane->bpp >> 3);
+	val = (unsigned long)(dma_addr + size);
 	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
 
 	DRM_DEBUG_KMS("start addr = 0x%lx, end addr = 0x%lx, size = 0x%lx\n",
-			(unsigned long)win_data->dma_addr, val, size);
+			(unsigned long)dma_addr, val, size);
 	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
-			win_data->ovl_width, win_data->ovl_height);
+			plane->crtc_width, plane->crtc_height);
 
 	/* buffer size */
-	val = VIDW_BUF_SIZE_OFFSET(win_data->buf_offsize) |
-		VIDW_BUF_SIZE_PAGEWIDTH(win_data->line_size) |
-		VIDW_BUF_SIZE_OFFSET_E(win_data->buf_offsize) |
-		VIDW_BUF_SIZE_PAGEWIDTH_E(win_data->line_size);
+	buf_offsize = (plane->fb_width - plane->crtc_width) * (plane->bpp >> 3);
+	line_size = plane->crtc_width * (plane->bpp >> 3);
+	val = VIDW_BUF_SIZE_OFFSET(buf_offsize) |
+		VIDW_BUF_SIZE_PAGEWIDTH(line_size) |
+		VIDW_BUF_SIZE_OFFSET_E(buf_offsize) |
+		VIDW_BUF_SIZE_PAGEWIDTH_E(line_size);
 	writel(val, ctx->regs + VIDWx_BUF_SIZE(win, 0));
 
 	/* OSD position */
-	val = VIDOSDxA_TOPLEFT_X(win_data->offset_x) |
-		VIDOSDxA_TOPLEFT_Y(win_data->offset_y) |
-		VIDOSDxA_TOPLEFT_X_E(win_data->offset_x) |
-		VIDOSDxA_TOPLEFT_Y_E(win_data->offset_y);
+	val = VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
+		VIDOSDxA_TOPLEFT_Y(plane->crtc_y) |
+		VIDOSDxA_TOPLEFT_X_E(plane->crtc_x) |
+		VIDOSDxA_TOPLEFT_Y_E(plane->crtc_y);
 	writel(val, ctx->regs + VIDOSD_A(win));
 
-	last_x = win_data->offset_x + win_data->ovl_width;
+	last_x = plane->crtc_x + plane->crtc_width;
 	if (last_x)
 		last_x--;
-	last_y = win_data->offset_y + win_data->ovl_height;
+	last_y = plane->crtc_y + plane->crtc_height;
 	if (last_y)
 		last_y--;
 
@@ -739,7 +682,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	writel(val, ctx->regs + VIDOSD_B(win));
 
 	DRM_DEBUG_KMS("osd pos: tx = %d, ty = %d, bx = %d, by = %d\n",
-			win_data->offset_x, win_data->offset_y, last_x, last_y);
+			plane->crtc_x, plane->crtc_y, last_x, last_y);
 
 	/* hardware window 0 doesn't support alpha channel. */
 	if (win != 0) {
@@ -756,7 +699,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 		u32 offset = VIDOSD_D(win);
 		if (win == 0)
 			offset = VIDOSD_C(win);
-		val = win_data->ovl_width * win_data->ovl_height;
+		val = plane->crtc_width * plane->crtc_height;
 		writel(val, ctx->regs + offset);
 
 		DRM_DEBUG_KMS("osd size = 0x%x\n", (unsigned int)val);
@@ -776,7 +719,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	/* Enable DMA channel and unprotect windows */
 	fimd_shadow_protect_win(ctx, win, false);
 
-	win_data->enabled = true;
+	plane->enabled = true;
 
 	if (ctx->i80_if)
 		atomic_set(&ctx->win_updated, 1);
@@ -785,7 +728,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 static void fimd_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct fimd_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int win = zpos;
 
 	if (win == DEFAULT_ZPOS)
@@ -794,11 +737,11 @@ static void fimd_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
-	win_data = &ctx->win_data[win];
+	plane = &ctx->planes[win];
 
 	if (ctx->suspended) {
 		/* do not resume this window*/
-		win_data->resume = false;
+		plane->resume = false;
 		return;
 	}
 
@@ -813,19 +756,19 @@ static void fimd_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 	/* unprotect windows */
 	fimd_shadow_protect_win(ctx, win, false);
 
-	win_data->enabled = false;
+	plane->enabled = false;
 }
 
 static void fimd_window_suspend(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct fimd_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int i;
 
 	for (i = 0; i < WINDOWS_NR; i++) {
-		win_data = &ctx->win_data[i];
-		win_data->resume = win_data->enabled;
-		if (win_data->enabled)
+		plane = &ctx->planes[i];
+		plane->resume = plane->enabled;
+		if (plane->enabled)
 			fimd_win_disable(crtc, i);
 	}
 }
@@ -833,25 +776,25 @@ static void fimd_window_suspend(struct exynos_drm_crtc *crtc)
 static void fimd_window_resume(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct fimd_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int i;
 
 	for (i = 0; i < WINDOWS_NR; i++) {
-		win_data = &ctx->win_data[i];
-		win_data->enabled = win_data->resume;
-		win_data->resume = false;
+		plane = &ctx->planes[i];
+		plane->enabled = plane->resume;
+		plane->resume = false;
 	}
 }
 
 static void fimd_apply(struct exynos_drm_crtc *crtc)
 {
 	struct fimd_context *ctx = crtc->ctx;
-	struct fimd_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int i;
 
 	for (i = 0; i < WINDOWS_NR; i++) {
-		win_data = &ctx->win_data[i];
-		if (win_data->enabled)
+		plane = &ctx->planes[i];
+		if (plane->enabled)
 			fimd_win_commit(crtc, i);
 		else
 			fimd_win_disable(crtc, i);
@@ -1011,7 +954,6 @@ static struct exynos_drm_crtc_ops fimd_crtc_ops = {
 	.enable_vblank = fimd_enable_vblank,
 	.disable_vblank = fimd_disable_vblank,
 	.wait_for_vblank = fimd_wait_for_vblank,
-	.win_mode_set = fimd_win_mode_set,
 	.win_commit = fimd_win_commit,
 	.win_disable = fimd_win_disable,
 	.te_handler = fimd_te_handler,
@@ -1056,9 +998,20 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct fimd_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_plane *exynos_plane;
+	enum drm_plane_type type;
+	int i;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		type = (i == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+						DRM_PLANE_TYPE_OVERLAY;
+		exynos_plane_init(drm_dev, &ctx->planes[i], 1 << ctx->pipe,
+				  type);
+	}
 
-	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
-					   EXYNOS_DISPLAY_TYPE_LCD,
+	exynos_plane = &ctx->planes[ctx->default_win];
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
+					   ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
 					   &fimd_crtc_ops, ctx);
 	if (IS_ERR(ctx->crtc))
 		return PTR_ERR(ctx->crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 358cff6..dc13621 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -93,7 +93,6 @@ void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			  uint32_t src_w, uint32_t src_h)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
 	unsigned int actual_w;
 	unsigned int actual_h;
 
@@ -140,9 +139,6 @@ void exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
 			exynos_plane->crtc_width, exynos_plane->crtc_height);
 
 	plane->crtc = crtc;
-
-	if (exynos_crtc->ops->win_mode_set)
-		exynos_crtc->ops->win_mode_set(exynos_crtc, exynos_plane);
 }
 
 void exynos_plane_dpms(struct drm_plane *plane, int mode)
@@ -255,24 +251,18 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane)
 	drm_object_attach_property(&plane->base, prop, 0);
 }
 
-struct drm_plane *exynos_plane_init(struct drm_device *dev,
-				    unsigned long possible_crtcs,
-				    enum drm_plane_type type)
+int exynos_plane_init(struct drm_device *dev,
+		      struct exynos_drm_plane *exynos_plane,
+		      unsigned long possible_crtcs, enum drm_plane_type type)
 {
-	struct exynos_drm_plane *exynos_plane;
 	int err;
 
-	exynos_plane = kzalloc(sizeof(struct exynos_drm_plane), GFP_KERNEL);
-	if (!exynos_plane)
-		return ERR_PTR(-ENOMEM);
-
 	err = drm_universal_plane_init(dev, &exynos_plane->base, possible_crtcs,
 				       &exynos_plane_funcs, formats,
 				       ARRAY_SIZE(formats), type);
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
-		kfree(exynos_plane);
-		return ERR_PTR(err);
+		return err;
 	}
 
 	if (type == DRM_PLANE_TYPE_PRIMARY)
@@ -280,5 +270,5 @@ struct drm_plane *exynos_plane_init(struct drm_device *dev,
 	else
 		exynos_plane_attach_zpos_property(&exynos_plane->base);
 
-	return &exynos_plane->base;
+	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index 59d4075..100ca5e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -21,6 +21,6 @@ int exynos_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 			uint32_t src_x, uint32_t src_y,
 			uint32_t src_w, uint32_t src_h);
 void exynos_plane_dpms(struct drm_plane *plane, int mode);
-struct drm_plane *exynos_plane_init(struct drm_device *dev,
-				    unsigned long possible_crtcs,
-				    enum drm_plane_type type);
+int exynos_plane_init(struct drm_device *dev,
+		      struct exynos_drm_plane *exynos_plane,
+		      unsigned long possible_crtcs, enum drm_plane_type type);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 9c8300e..0098e9f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -23,6 +23,7 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_plane.h"
 #include "exynos_drm_encoder.h"
 #include "exynos_drm_vidi.h"
 
@@ -32,20 +33,6 @@
 #define ctx_from_connector(c)	container_of(c, struct vidi_context, \
 					connector)
 
-struct vidi_win_data {
-	unsigned int		offset_x;
-	unsigned int		offset_y;
-	unsigned int		ovl_width;
-	unsigned int		ovl_height;
-	unsigned int		fb_width;
-	unsigned int		fb_height;
-	unsigned int		bpp;
-	dma_addr_t		dma_addr;
-	unsigned int		buf_offsize;
-	unsigned int		line_size;	/* bytes */
-	bool			enabled;
-};
-
 struct vidi_context {
 	struct exynos_drm_display	display;
 	struct platform_device		*pdev;
@@ -53,7 +40,7 @@ struct vidi_context {
 	struct exynos_drm_crtc		*crtc;
 	struct drm_encoder		*encoder;
 	struct drm_connector		connector;
-	struct vidi_win_data		win_data[WINDOWS_NR];
+	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct edid			*raw_edid;
 	unsigned int			clkdiv;
 	unsigned int			default_win;
@@ -97,20 +84,6 @@ static const char fake_edid_info[] = {
 	0x00, 0x00, 0x00, 0x06
 };
 
-static void vidi_apply(struct exynos_drm_crtc *crtc)
-{
-	struct vidi_context *ctx = crtc->ctx;
-	struct exynos_drm_crtc_ops *crtc_ops = crtc->ops;
-	struct vidi_win_data *win_data;
-	int i;
-
-	for (i = 0; i < WINDOWS_NR; i++) {
-		win_data = &ctx->win_data[i];
-		if (win_data->enabled && (crtc_ops && crtc_ops->win_commit))
-			crtc_ops->win_commit(crtc, i);
-	}
-}
-
 static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct vidi_context *ctx = crtc->ctx;
@@ -144,63 +117,10 @@ static void vidi_disable_vblank(struct exynos_drm_crtc *crtc)
 		ctx->vblank_on = false;
 }
 
-static void vidi_win_mode_set(struct exynos_drm_crtc *crtc,
-			struct exynos_drm_plane *plane)
-{
-	struct vidi_context *ctx = crtc->ctx;
-	struct vidi_win_data *win_data;
-	int win;
-	unsigned long offset;
-
-	if (!plane) {
-		DRM_ERROR("plane is NULL\n");
-		return;
-	}
-
-	win = plane->zpos;
-	if (win == DEFAULT_ZPOS)
-		win = ctx->default_win;
-
-	if (win < 0 || win >= WINDOWS_NR)
-		return;
-
-	offset = plane->fb_x * (plane->bpp >> 3);
-	offset += plane->fb_y * plane->pitch;
-
-	DRM_DEBUG_KMS("offset = 0x%lx, pitch = %x\n", offset, plane->pitch);
-
-	win_data = &ctx->win_data[win];
-
-	win_data->offset_x = plane->crtc_x;
-	win_data->offset_y = plane->crtc_y;
-	win_data->ovl_width = plane->crtc_width;
-	win_data->ovl_height = plane->crtc_height;
-	win_data->fb_width = plane->fb_width;
-	win_data->fb_height = plane->fb_height;
-	win_data->dma_addr = plane->dma_addr[0] + offset;
-	win_data->bpp = plane->bpp;
-	win_data->buf_offsize = (plane->fb_width - plane->crtc_width) *
-				(plane->bpp >> 3);
-	win_data->line_size = plane->crtc_width * (plane->bpp >> 3);
-
-	/*
-	 * some parts of win_data should be transferred to user side
-	 * through specific ioctl.
-	 */
-
-	DRM_DEBUG_KMS("offset_x = %d, offset_y = %d\n",
-			win_data->offset_x, win_data->offset_y);
-	DRM_DEBUG_KMS("ovl_width = %d, ovl_height = %d\n",
-			win_data->ovl_width, win_data->ovl_height);
-	DRM_DEBUG_KMS("paddr = 0x%lx\n", (unsigned long)win_data->dma_addr);
-	DRM_DEBUG_KMS("fb_width = %d, crtc_width = %d\n",
-			plane->fb_width, plane->crtc_width);
-}
-
 static void vidi_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 {
 	struct vidi_context *ctx = crtc->ctx;
-	struct vidi_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int win = zpos;
 
 	if (ctx->suspended)
@@ -212,11 +132,11 @@ static void vidi_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
-	win_data = &ctx->win_data[win];
+	plane = &ctx->planes[win];
 
-	win_data->enabled = true;
+	plane->enabled = true;
 
-	DRM_DEBUG_KMS("dma_addr = %pad\n", &win_data->dma_addr);
+	DRM_DEBUG_KMS("dma_addr = %pad\n", plane->dma_addr);
 
 	if (ctx->vblank_on)
 		schedule_work(&ctx->work);
@@ -225,7 +145,7 @@ static void vidi_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 static void vidi_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 {
 	struct vidi_context *ctx = crtc->ctx;
-	struct vidi_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int win = zpos;
 
 	if (win == DEFAULT_ZPOS)
@@ -234,8 +154,8 @@ static void vidi_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 	if (win < 0 || win >= WINDOWS_NR)
 		return;
 
-	win_data = &ctx->win_data[win];
-	win_data->enabled = false;
+	plane = &ctx->planes[win];
+	plane->enabled = false;
 
 	/* TODO. */
 }
@@ -243,6 +163,8 @@ static void vidi_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 static int vidi_power_on(struct exynos_drm_crtc *crtc, bool enable)
 {
 	struct vidi_context *ctx = crtc->ctx;
+	struct exynos_drm_plane *plane;
+	int i;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
@@ -256,7 +178,11 @@ static int vidi_power_on(struct exynos_drm_crtc *crtc, bool enable)
 		if (test_and_clear_bit(0, &ctx->irq_flags))
 			vidi_enable_vblank(crtc);
 
-		vidi_apply(crtc);
+		for (i = 0; i < WINDOWS_NR; i++) {
+			plane = &ctx->planes[i];
+			if (plane->enabled)
+				vidi_win_commit(crtc, i);
+		}
 	} else {
 		ctx->suspended = true;
 	}
@@ -304,7 +230,6 @@ static struct exynos_drm_crtc_ops vidi_crtc_ops = {
 	.dpms = vidi_dpms,
 	.enable_vblank = vidi_enable_vblank,
 	.disable_vblank = vidi_disable_vblank,
-	.win_mode_set = vidi_win_mode_set,
 	.win_commit = vidi_win_commit,
 	.win_disable = vidi_win_disable,
 };
@@ -546,10 +471,20 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	int ret;
+	struct exynos_drm_plane *exynos_plane;
+	enum drm_plane_type type;
+	int i, ret;
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		type = (i == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+						DRM_PLANE_TYPE_OVERLAY;
+		exynos_plane_init(drm_dev, &ctx->planes[i], 1 << ctx->pipe,
+				  type);
+	}
 
-	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
-					   EXYNOS_DISPLAY_TYPE_VIDI,
+	exynos_plane = &ctx->planes[ctx->default_win];
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
+					   ctx->pipe, EXYNOS_DISPLAY_TYPE_VIDI,
 					   &vidi_crtc_ops, ctx);
 	if (IS_ERR(ctx->crtc)) {
 		DRM_ERROR("failed to create crtc.\n");
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index b90a423..a629b96 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -37,34 +37,13 @@
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
+#include "exynos_drm_plane.h"
 #include "exynos_drm_iommu.h"
 #include "exynos_mixer.h"
 
 #define MIXER_WIN_NR		3
 #define MIXER_DEFAULT_WIN	0
 
-struct hdmi_win_data {
-	dma_addr_t		dma_addr;
-	dma_addr_t		chroma_dma_addr;
-	uint32_t		pixel_format;
-	unsigned int		bpp;
-	unsigned int		crtc_x;
-	unsigned int		crtc_y;
-	unsigned int		crtc_width;
-	unsigned int		crtc_height;
-	unsigned int		fb_x;
-	unsigned int		fb_y;
-	unsigned int		fb_width;
-	unsigned int		fb_height;
-	unsigned int		src_width;
-	unsigned int		src_height;
-	unsigned int		mode_width;
-	unsigned int		mode_height;
-	unsigned int		scan_flags;
-	bool			enabled;
-	bool			resume;
-};
-
 struct mixer_resources {
 	int			irq;
 	void __iomem		*mixer_regs;
@@ -88,6 +67,7 @@ struct mixer_context {
 	struct device		*dev;
 	struct drm_device	*drm_dev;
 	struct exynos_drm_crtc	*crtc;
+	struct exynos_drm_plane	planes[MIXER_WIN_NR];
 	int			pipe;
 	bool			interlace;
 	bool			powered;
@@ -97,7 +77,6 @@ struct mixer_context {
 
 	struct mutex		mixer_mutex;
 	struct mixer_resources	mixer_res;
-	struct hdmi_win_data	win_data[MIXER_WIN_NR];
 	enum mixer_version_id	mxr_ver;
 	wait_queue_head_t	wait_vsync_queue;
 	atomic_t		wait_vsync_event;
@@ -401,7 +380,7 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
 	unsigned long flags;
-	struct hdmi_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	unsigned int x_ratio, y_ratio;
 	unsigned int buf_num = 1;
 	dma_addr_t luma_addr[2], chroma_addr[2];
@@ -409,9 +388,9 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	bool crcb_mode = false;
 	u32 val;
 
-	win_data = &ctx->win_data[win];
+	plane = &ctx->planes[win];
 
-	switch (win_data->pixel_format) {
+	switch (plane->pixel_format) {
 	case DRM_FORMAT_NV12MT:
 		tiled_mode = true;
 	case DRM_FORMAT_NV12:
@@ -421,35 +400,35 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	/* TODO: single buffer format NV12, NV21 */
 	default:
 		/* ignore pixel format at disable time */
-		if (!win_data->dma_addr)
+		if (!plane->dma_addr[0])
 			break;
 
 		DRM_ERROR("pixel format for vp is wrong [%d].\n",
-				win_data->pixel_format);
+				plane->pixel_format);
 		return;
 	}
 
 	/* scaling feature: (src << 16) / dst */
-	x_ratio = (win_data->src_width << 16) / win_data->crtc_width;
-	y_ratio = (win_data->src_height << 16) / win_data->crtc_height;
+	x_ratio = (plane->src_width << 16) / plane->crtc_width;
+	y_ratio = (plane->src_height << 16) / plane->crtc_height;
 
 	if (buf_num == 2) {
-		luma_addr[0] = win_data->dma_addr;
-		chroma_addr[0] = win_data->chroma_dma_addr;
+		luma_addr[0] = plane->dma_addr[0];
+		chroma_addr[0] = plane->dma_addr[1];
 	} else {
-		luma_addr[0] = win_data->dma_addr;
-		chroma_addr[0] = win_data->dma_addr
-			+ (win_data->fb_width * win_data->fb_height);
+		luma_addr[0] = plane->dma_addr[0];
+		chroma_addr[0] = plane->dma_addr[0]
+			+ (plane->fb_width * plane->fb_height);
 	}
 
-	if (win_data->scan_flags & DRM_MODE_FLAG_INTERLACE) {
+	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
 		ctx->interlace = true;
 		if (tiled_mode) {
 			luma_addr[1] = luma_addr[0] + 0x40;
 			chroma_addr[1] = chroma_addr[0] + 0x40;
 		} else {
-			luma_addr[1] = luma_addr[0] + win_data->fb_width;
-			chroma_addr[1] = chroma_addr[0] + win_data->fb_width;
+			luma_addr[1] = luma_addr[0] + plane->fb_width;
+			chroma_addr[1] = chroma_addr[0] + plane->fb_width;
 		}
 	} else {
 		ctx->interlace = false;
@@ -470,26 +449,26 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);
 
 	/* setting size of input image */
-	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(win_data->fb_width) |
-		VP_IMG_VSIZE(win_data->fb_height));
+	vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->fb_width) |
+		VP_IMG_VSIZE(plane->fb_height));
 	/* chroma height has to reduced by 2 to avoid chroma distorions */
-	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(win_data->fb_width) |
-		VP_IMG_VSIZE(win_data->fb_height / 2));
+	vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->fb_width) |
+		VP_IMG_VSIZE(plane->fb_height / 2));
 
-	vp_reg_write(res, VP_SRC_WIDTH, win_data->src_width);
-	vp_reg_write(res, VP_SRC_HEIGHT, win_data->src_height);
+	vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
+	vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
 	vp_reg_write(res, VP_SRC_H_POSITION,
-			VP_SRC_H_POSITION_VAL(win_data->fb_x));
-	vp_reg_write(res, VP_SRC_V_POSITION, win_data->fb_y);
+			VP_SRC_H_POSITION_VAL(plane->fb_x));
+	vp_reg_write(res, VP_SRC_V_POSITION, plane->fb_y);
 
-	vp_reg_write(res, VP_DST_WIDTH, win_data->crtc_width);
-	vp_reg_write(res, VP_DST_H_POSITION, win_data->crtc_x);
+	vp_reg_write(res, VP_DST_WIDTH, plane->crtc_width);
+	vp_reg_write(res, VP_DST_H_POSITION, plane->crtc_x);
 	if (ctx->interlace) {
-		vp_reg_write(res, VP_DST_HEIGHT, win_data->crtc_height / 2);
-		vp_reg_write(res, VP_DST_V_POSITION, win_data->crtc_y / 2);
+		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height / 2);
+		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y / 2);
 	} else {
-		vp_reg_write(res, VP_DST_HEIGHT, win_data->crtc_height);
-		vp_reg_write(res, VP_DST_V_POSITION, win_data->crtc_y);
+		vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height);
+		vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y);
 	}
 
 	vp_reg_write(res, VP_H_RATIO, x_ratio);
@@ -503,8 +482,8 @@ static void vp_video_buffer(struct mixer_context *ctx, int win)
 	vp_reg_write(res, VP_TOP_C_PTR, chroma_addr[0]);
 	vp_reg_write(res, VP_BOT_C_PTR, chroma_addr[1]);
 
-	mixer_cfg_scan(ctx, win_data->mode_height);
-	mixer_cfg_rgb_fmt(ctx, win_data->mode_height);
+	mixer_cfg_scan(ctx, plane->mode_height);
+	mixer_cfg_rgb_fmt(ctx, plane->mode_height);
 	mixer_cfg_layer(ctx, win, true);
 	mixer_run(ctx);
 
@@ -525,21 +504,21 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
 	unsigned long flags;
-	struct hdmi_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	unsigned int x_ratio, y_ratio;
 	unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
 	dma_addr_t dma_addr;
 	unsigned int fmt;
 	u32 val;
 
-	win_data = &ctx->win_data[win];
+	plane = &ctx->planes[win];
 
 	#define RGB565 4
 	#define ARGB1555 5
 	#define ARGB4444 6
 	#define ARGB8888 7
 
-	switch (win_data->bpp) {
+	switch (plane->bpp) {
 	case 16:
 		fmt = ARGB4444;
 		break;
@@ -554,17 +533,17 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 	x_ratio = 0;
 	y_ratio = 0;
 
-	dst_x_offset = win_data->crtc_x;
-	dst_y_offset = win_data->crtc_y;
+	dst_x_offset = plane->crtc_x;
+	dst_y_offset = plane->crtc_y;
 
 	/* converting dma address base and source offset */
-	dma_addr = win_data->dma_addr
-		+ (win_data->fb_x * win_data->bpp >> 3)
-		+ (win_data->fb_y * win_data->fb_width * win_data->bpp >> 3);
+	dma_addr = plane->dma_addr[0]
+		+ (plane->fb_x * plane->bpp >> 3)
+		+ (plane->fb_y * plane->fb_width * plane->bpp >> 3);
 	src_x_offset = 0;
 	src_y_offset = 0;
 
-	if (win_data->scan_flags & DRM_MODE_FLAG_INTERLACE)
+	if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE)
 		ctx->interlace = true;
 	else
 		ctx->interlace = false;
@@ -577,18 +556,18 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 		MXR_GRP_CFG_FORMAT_VAL(fmt), MXR_GRP_CFG_FORMAT_MASK);
 
 	/* setup geometry */
-	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), win_data->fb_width);
+	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), plane->fb_width);
 
 	/* setup display size */
 	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
 		win == MIXER_DEFAULT_WIN) {
-		val  = MXR_MXR_RES_HEIGHT(win_data->fb_height);
-		val |= MXR_MXR_RES_WIDTH(win_data->fb_width);
+		val  = MXR_MXR_RES_HEIGHT(plane->fb_height);
+		val |= MXR_MXR_RES_WIDTH(plane->fb_width);
 		mixer_reg_write(res, MXR_RESOLUTION, val);
 	}
 
-	val  = MXR_GRP_WH_WIDTH(win_data->crtc_width);
-	val |= MXR_GRP_WH_HEIGHT(win_data->crtc_height);
+	val  = MXR_GRP_WH_WIDTH(plane->crtc_width);
+	val |= MXR_GRP_WH_HEIGHT(plane->crtc_height);
 	val |= MXR_GRP_WH_H_SCALE(x_ratio);
 	val |= MXR_GRP_WH_V_SCALE(y_ratio);
 	mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
@@ -606,8 +585,8 @@ static void mixer_graph_buffer(struct mixer_context *ctx, int win)
 	/* set buffer address to mixer */
 	mixer_reg_write(res, MXR_GRAPHIC_BASE(win), dma_addr);
 
-	mixer_cfg_scan(ctx, win_data->mode_height);
-	mixer_cfg_rgb_fmt(ctx, win_data->mode_height);
+	mixer_cfg_scan(ctx, plane->mode_height);
+	mixer_cfg_rgb_fmt(ctx, plane->mode_height);
 	mixer_cfg_layer(ctx, win, true);
 
 	/* layer update mandatory for mixer 16.0.33.0 */
@@ -913,58 +892,6 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 	mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
-static void mixer_win_mode_set(struct exynos_drm_crtc *crtc,
-			struct exynos_drm_plane *plane)
-{
-	struct mixer_context *mixer_ctx = crtc->ctx;
-	struct hdmi_win_data *win_data;
-	int win;
-
-	if (!plane) {
-		DRM_ERROR("plane is NULL\n");
-		return;
-	}
-
-	DRM_DEBUG_KMS("set [%d]x[%d] at (%d,%d) to [%d]x[%d] at (%d,%d)\n",
-				 plane->fb_width, plane->fb_height,
-				 plane->fb_x, plane->fb_y,
-				 plane->crtc_width, plane->crtc_height,
-				 plane->crtc_x, plane->crtc_y);
-
-	win = plane->zpos;
-	if (win == DEFAULT_ZPOS)
-		win = MIXER_DEFAULT_WIN;
-
-	if (win < 0 || win >= MIXER_WIN_NR) {
-		DRM_ERROR("mixer window[%d] is wrong\n", win);
-		return;
-	}
-
-	win_data = &mixer_ctx->win_data[win];
-
-	win_data->dma_addr = plane->dma_addr[0];
-	win_data->chroma_dma_addr = plane->dma_addr[1];
-	win_data->pixel_format = plane->pixel_format;
-	win_data->bpp = plane->bpp;
-
-	win_data->crtc_x = plane->crtc_x;
-	win_data->crtc_y = plane->crtc_y;
-	win_data->crtc_width = plane->crtc_width;
-	win_data->crtc_height = plane->crtc_height;
-
-	win_data->fb_x = plane->fb_x;
-	win_data->fb_y = plane->fb_y;
-	win_data->fb_width = plane->fb_width;
-	win_data->fb_height = plane->fb_height;
-	win_data->src_width = plane->src_width;
-	win_data->src_height = plane->src_height;
-
-	win_data->mode_width = plane->mode_width;
-	win_data->mode_height = plane->mode_height;
-
-	win_data->scan_flags = plane->scan_flag;
-}
-
 static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
@@ -984,7 +911,7 @@ static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	else
 		mixer_graph_buffer(mixer_ctx, win);
 
-	mixer_ctx->win_data[win].enabled = true;
+	mixer_ctx->planes[win].enabled = true;
 }
 
 static void mixer_win_disable(struct exynos_drm_crtc *crtc, int zpos)
@@ -999,7 +926,7 @@ static void mixer_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 	mutex_lock(&mixer_ctx->mixer_mutex);
 	if (!mixer_ctx->powered) {
 		mutex_unlock(&mixer_ctx->mixer_mutex);
-		mixer_ctx->win_data[win].resume = false;
+		mixer_ctx->planes[win].resume = false;
 		return;
 	}
 	mutex_unlock(&mixer_ctx->mixer_mutex);
@@ -1012,7 +939,7 @@ static void mixer_win_disable(struct exynos_drm_crtc *crtc, int zpos)
 	mixer_vsync_set_update(mixer_ctx, true);
 	spin_unlock_irqrestore(&res->reg_slock, flags);
 
-	mixer_ctx->win_data[win].enabled = false;
+	mixer_ctx->planes[win].enabled = false;
 }
 
 static void mixer_wait_for_vblank(struct exynos_drm_crtc *crtc)
@@ -1045,12 +972,12 @@ static void mixer_wait_for_vblank(struct exynos_drm_crtc *crtc)
 static void mixer_window_suspend(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
-	struct hdmi_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int i;
 
 	for (i = 0; i < MIXER_WIN_NR; i++) {
-		win_data = &ctx->win_data[i];
-		win_data->resume = win_data->enabled;
+		plane = &ctx->planes[i];
+		plane->resume = plane->enabled;
 		mixer_win_disable(crtc, i);
 	}
 	mixer_wait_for_vblank(crtc);
@@ -1059,14 +986,14 @@ static void mixer_window_suspend(struct exynos_drm_crtc *crtc)
 static void mixer_window_resume(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
-	struct hdmi_win_data *win_data;
+	struct exynos_drm_plane *plane;
 	int i;
 
 	for (i = 0; i < MIXER_WIN_NR; i++) {
-		win_data = &ctx->win_data[i];
-		win_data->enabled = win_data->resume;
-		win_data->resume = false;
-		if (win_data->enabled)
+		plane = &ctx->planes[i];
+		plane->enabled = plane->resume;
+		plane->resume = false;
+		if (plane->enabled)
 			mixer_win_commit(crtc, i);
 	}
 }
@@ -1178,7 +1105,6 @@ static struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.enable_vblank		= mixer_enable_vblank,
 	.disable_vblank		= mixer_disable_vblank,
 	.wait_for_vblank	= mixer_wait_for_vblank,
-	.win_mode_set		= mixer_win_mode_set,
 	.win_commit		= mixer_win_commit,
 	.win_disable		= mixer_win_disable,
 };
@@ -1242,11 +1168,21 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 {
 	struct mixer_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
-	int ret;
+	struct exynos_drm_plane *exynos_plane;
+	enum drm_plane_type type;
+	int i, ret;
+
+	for (i = 0; i < MIXER_WIN_NR; i++) {
+		type = (i == MIXER_DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
+						DRM_PLANE_TYPE_OVERLAY;
+		exynos_plane_init(drm_dev, &ctx->planes[i], 1 << ctx->pipe,
+				  type);
+	}
 
-	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
-				     EXYNOS_DISPLAY_TYPE_HDMI,
-				     &mixer_crtc_ops, ctx);
+	exynos_plane = &ctx->planes[MIXER_DEFAULT_WIN];
+	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
+					   ctx->pipe, EXYNOS_DISPLAY_TYPE_HDMI,
+					   &mixer_crtc_ops, ctx);
 	if (IS_ERR(ctx->crtc)) {
 		ret = PTR_ERR(ctx->crtc);
 		goto free_ctx;
-- 
1.9.3
