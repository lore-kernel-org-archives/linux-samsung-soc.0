From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/2] drm/exynos: add global macro for the default primary plane
Date: Fri,  4 Sep 2015 19:05:56 -0300
Message-ID: <1441404357-9337-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:35321 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571AbbIDWGF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 18:06:05 -0400
Received: by ykek143 with SMTP id k143so34253099yke.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2015 15:06:04 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Define DEFAULT_WIN as zero to help set the primary plane on all CRTCs.
Some CRTCs were defining a variable to store the default window, but that
is not necessary as the default (primary) window is always the window zero.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 6 ++----
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 5 ++---
 drivers/gpu/drm/exynos/exynos_drm_drv.h       | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 5 ++---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 6 ++----
 drivers/gpu/drm/exynos/exynos_mixer.c         | 7 +++----
 6 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 988df06..2f393b1 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -33,7 +33,6 @@ struct decon_context {
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	void __iomem			*addr;
 	struct clk			*clks[6];
-	unsigned int			default_win;
 	unsigned long			irq_flags;
 	int				pipe;
 
@@ -451,7 +450,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	ctx->pipe = priv->pipe++;
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
 							DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 				1 << ctx->pipe, type, decon_formats,
@@ -460,7 +459,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 			return ret;
 	}
 
-	exynos_plane = &ctx->planes[ctx->default_win];
+	exynos_plane = &ctx->planes[DEFAULT_WIN];
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
 					ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
 					&decon_crtc_ops, ctx);
@@ -557,7 +556,6 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->default_win = 0;
 	ctx->dev = dev;
 	if (of_get_child_by_name(dev->of_node, "i80-if-timings"))
 		ctx->i80_if = true;
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 0776f38..7a6c069 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -52,7 +52,6 @@ struct decon_context {
 	struct clk			*eclk;
 	struct clk			*vclk;
 	void __iomem			*regs;
-	unsigned int			default_win;
 	unsigned long			irq_flags;
 	bool				i80_if;
 	int				pipe;
@@ -631,7 +630,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 					1 << ctx->pipe, type, decon_formats,
@@ -640,7 +639,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 			return ret;
 	}
 
-	exynos_plane = &ctx->planes[ctx->default_win];
+	exynos_plane = &ctx->planes[DEFAULT_WIN];
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
 					   ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
 					   &decon_crtc_ops, ctx);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 5cb9bc3..058abd1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -22,6 +22,8 @@
 #define MAX_PLANE	5
 #define MAX_FB_BUFFER	4
 
+#define DEFAULT_WIN	0
+
 #define to_exynos_crtc(x)	container_of(x, struct exynos_drm_crtc, base)
 #define to_exynos_plane(x)	container_of(x, struct exynos_drm_plane, base)
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index dc36e63..7776768 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -154,7 +154,6 @@ struct fimd_context {
 	struct clk			*lcd_clk;
 	void __iomem			*regs;
 	struct regmap			*sysreg;
-	unsigned int			default_win;
 	unsigned long			irq_flags;
 	u32				vidcon0;
 	u32				vidcon1;
@@ -910,7 +909,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	ctx->pipe = priv->pipe++;
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 					1 << ctx->pipe, type, fimd_formats,
@@ -919,7 +918,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 			return ret;
 	}
 
-	exynos_plane = &ctx->planes[ctx->default_win];
+	exynos_plane = &ctx->planes[DEFAULT_WIN];
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
 					   ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
 					   &fimd_crtc_ops, ctx);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 75718e1..fc57687 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -42,7 +42,6 @@ struct vidi_context {
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct edid			*raw_edid;
 	unsigned int			clkdiv;
-	unsigned int			default_win;
 	unsigned long			irq_flags;
 	unsigned int			connected;
 	bool				vblank_on;
@@ -446,7 +445,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	vidi_ctx_initialize(ctx, drm_dev);
 
 	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = (zpos == ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
 					1 << ctx->pipe, type, formats,
@@ -455,7 +454,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 			return ret;
 	}
 
-	exynos_plane = &ctx->planes[ctx->default_win];
+	exynos_plane = &ctx->planes[DEFAULT_WIN];
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
 					   ctx->pipe, EXYNOS_DISPLAY_TYPE_VIDI,
 					   &vidi_crtc_ops, ctx);
@@ -507,7 +506,6 @@ static int vidi_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->default_win = 0;
 	ctx->pdev = pdev;
 
 	INIT_WORK(&ctx->work, vidi_fake_vblank_handler);
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 853ad8f..a149153 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -42,7 +42,6 @@
 #include "exynos_mixer.h"
 
 #define MIXER_WIN_NR		3
-#define MIXER_DEFAULT_WIN	0
 #define VP_DEFAULT_WIN		2
 
 /* The pixelformats that are natively supported by the mixer. */
@@ -599,7 +598,7 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 
 	/* setup display size */
 	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
-		win == MIXER_DEFAULT_WIN) {
+		win == DEFAULT_WIN) {
 		val  = MXR_MXR_RES_HEIGHT(mode->vdisplay);
 		val |= MXR_MXR_RES_WIDTH(mode->hdisplay);
 		mixer_reg_write(res, MXR_RESOLUTION, val);
@@ -1134,7 +1133,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 		const uint32_t *formats;
 		unsigned int fcount;
 
-		type = (zpos == MIXER_DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
+		type = (zpos == DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
 						DRM_PLANE_TYPE_OVERLAY;
 		if (zpos < VP_DEFAULT_WIN) {
 			formats = mixer_formats;
@@ -1151,7 +1150,7 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
 			return ret;
 	}
 
-	exynos_plane = &ctx->planes[MIXER_DEFAULT_WIN];
+	exynos_plane = &ctx->planes[DEFAULT_WIN];
 	ctx->crtc = exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
 					   ctx->pipe, EXYNOS_DISPLAY_TYPE_HDMI,
 					   &mixer_crtc_ops, ctx);
-- 
2.1.0
