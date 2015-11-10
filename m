From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 14/25] drm/exynos: introduce exynos_drm_plane_config structure
Date: Tue, 10 Nov 2015 14:23:30 +0100
Message-ID: <1447161821-1877-15-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55191 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105AbbKJNY4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:56 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL006IYP9ITTA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:54 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds common structure for keeping plane configuration and
capabilities data. This patch is inspired by similar code developed by
Tobias Jakobi.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 18 +++++++---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 23 +++++++-----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       | 22 ++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 25 ++++++++-----
 drivers/gpu/drm/exynos/exynos_drm_plane.c     | 34 ++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_plane.h     |  7 ++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 25 ++++++++-----
 drivers/gpu/drm/exynos/exynos_mixer.c         | 51 ++++++++++++++++-----------
 8 files changed, 131 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 27039468364b..3c8b8e0240fe 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -26,7 +26,6 @@
 #include "exynos_drm_iommu.h"
 
 #define WINDOWS_NR	3
-#define CURSOR_WIN	2
 #define MIN_FB_WIDTH_FOR_16WORD_BURST	128
 
 static const char * const decon_clks_name[] = {
@@ -57,6 +56,7 @@ struct decon_context {
 	struct drm_device		*drm_dev;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
+	struct exynos_drm_plane_config	configs[WINDOWS_NR];
 	void __iomem			*addr;
 	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
 	int				pipe;
@@ -72,6 +72,12 @@ static const uint32_t decon_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
+static const enum drm_plane_type decon_win_types[WINDOWS_NR] = {
+	DRM_PLANE_TYPE_PRIMARY,
+	DRM_PLANE_TYPE_OVERLAY,
+	DRM_PLANE_TYPE_CURSOR,
+};
+
 static inline void decon_set_bits(struct decon_context *ctx, u32 reg, u32 mask,
 				  u32 val)
 {
@@ -499,7 +505,6 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct exynos_drm_plane *exynos_plane;
 	enum exynos_drm_output_type out_type;
-	enum drm_plane_type type;
 	unsigned int win;
 	int ret;
 
@@ -509,10 +514,13 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	for (win = ctx->first_win; win < WINDOWS_NR; win++) {
 		int tmp = (win == ctx->first_win) ? 0 : win;
 
-		type = exynos_plane_get_type(tmp, CURSOR_WIN);
+		ctx->configs[win].pixel_formats = decon_formats;
+		ctx->configs[win].num_pixel_formats = ARRAY_SIZE(decon_formats);
+		ctx->configs[win].zpos = win;
+		ctx->configs[win].type = decon_win_types[tmp];
+
 		ret = exynos_plane_init(drm_dev, &ctx->planes[win],
-				1 << ctx->pipe, type, decon_formats,
-				ARRAY_SIZE(decon_formats), win);
+					1 << ctx->pipe, &ctx->configs[win]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 7868d30d8eac..6b28e3f73e4e 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -41,13 +41,13 @@
 #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
 
 #define WINDOWS_NR	2
-#define CURSOR_WIN	1
 
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
+	struct exynos_drm_plane_config	configs[WINDOWS_NR];
 	struct clk			*pclk;
 	struct clk			*aclk;
 	struct clk			*eclk;
@@ -82,6 +82,11 @@ static const uint32_t decon_formats[] = {
 	DRM_FORMAT_BGRA8888,
 };
 
+static const enum drm_plane_type decon_win_types[WINDOWS_NR] = {
+	DRM_PLANE_TYPE_PRIMARY,
+	DRM_PLANE_TYPE_CURSOR,
+};
+
 static void decon_wait_for_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
@@ -672,8 +677,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 	struct decon_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
-	enum drm_plane_type type;
-	unsigned int zpos;
+	unsigned int i;
 	int ret;
 
 	ret = decon_ctx_initialize(ctx, drm_dev);
@@ -682,11 +686,14 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = exynos_plane_get_type(zpos, CURSOR_WIN);
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, decon_formats,
-					ARRAY_SIZE(decon_formats), zpos);
+	for (i = 0; i < WINDOWS_NR; i++) {
+		ctx->configs[i].pixel_formats = decon_formats;
+		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(decon_formats);
+		ctx->configs[i].zpos = i;
+		ctx->configs[i].type = decon_win_types[i];
+
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+					1 << ctx->pipe, &ctx->configs[i]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 482ed2c2ed89..9624855128a1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -84,10 +84,32 @@ to_exynos_plane_state(struct drm_plane_state *state)
 
 struct exynos_drm_plane {
 	struct drm_plane base;
+	const struct exynos_drm_plane_config *config;
 	unsigned int zpos;
 	struct drm_framebuffer *pending_fb;
 };
 
+#define EXYNOS_DRM_PLANE_CAP_DOUBLE_X	(1 << 0)
+#define EXYNOS_DRM_PLANE_CAP_DOUBLE_Y	(1 << 1)
+
+/*
+ * Exynos DRM plane configuration structure.
+ *
+ * @zpos: z-position of the plane.
+ * @type: type of the plane (primary, cursor or overlay).
+ * @pixel_formats: supported pixel formats.
+ * @num_pixel_formats: number of elements in 'pixel_formats'.
+ * @capabilities: supported features (see EXYNOS_DRM_PLANE_CAP_*)
+ */
+
+struct exynos_drm_plane_config {
+	unsigned int zpos;
+	enum drm_plane_type type;
+	const uint32_t *pixel_formats;
+	unsigned int num_pixel_formats;
+	unsigned int capabilities;
+};
+
 /*
  * Exynos drm crtc ops
  *
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 40fa621e3963..44226b2b46c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -88,7 +88,6 @@
 
 /* FIMD has totally five hardware windows. */
 #define WINDOWS_NR	5
-#define CURSOR_WIN	4
 
 struct fimd_driver_data {
 	unsigned int timing_base;
@@ -151,6 +150,7 @@ struct fimd_context {
 	struct drm_device		*drm_dev;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
+	struct exynos_drm_plane_config	configs[WINDOWS_NR];
 	struct clk			*bus_clk;
 	struct clk			*lcd_clk;
 	void __iomem			*regs;
@@ -188,6 +188,14 @@ static const struct of_device_id fimd_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
 
+static const enum drm_plane_type fimd_win_types[WINDOWS_NR] = {
+	DRM_PLANE_TYPE_PRIMARY,
+	DRM_PLANE_TYPE_OVERLAY,
+	DRM_PLANE_TYPE_OVERLAY,
+	DRM_PLANE_TYPE_OVERLAY,
+	DRM_PLANE_TYPE_CURSOR,
+};
+
 static const uint32_t fimd_formats[] = {
 	DRM_FORMAT_C8,
 	DRM_FORMAT_XRGB1555,
@@ -944,18 +952,19 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct exynos_drm_plane *exynos_plane;
-	enum drm_plane_type type;
-	unsigned int zpos;
+	unsigned int i;
 	int ret;
 
 	ctx->drm_dev = drm_dev;
 	ctx->pipe = priv->pipe++;
 
-	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = exynos_plane_get_type(zpos, CURSOR_WIN);
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, fimd_formats,
-					ARRAY_SIZE(fimd_formats), zpos);
+	for (i = 0; i < WINDOWS_NR; i++) {
+		ctx->configs[i].pixel_formats = fimd_formats;
+		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
+		ctx->configs[i].zpos = i;
+		ctx->configs[i].type = fimd_win_types[i];
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+					1 << ctx->pipe, &ctx->configs[i]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 365a738042e2..b620d7a76799 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -246,28 +246,20 @@ static void exynos_plane_attach_zpos_property(struct drm_plane *plane,
 	drm_object_attach_property(&plane->base, prop, zpos);
 }
 
-enum drm_plane_type exynos_plane_get_type(unsigned int zpos,
-					  unsigned int cursor_win)
-{
-		if (zpos == DEFAULT_WIN)
-			return DRM_PLANE_TYPE_PRIMARY;
-		else if (zpos == cursor_win)
-			return DRM_PLANE_TYPE_CURSOR;
-		else
-			return DRM_PLANE_TYPE_OVERLAY;
-}
-
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
-		      unsigned long possible_crtcs, enum drm_plane_type type,
-		      const uint32_t *formats, unsigned int fcount,
-		      unsigned int zpos)
+		      unsigned long possible_crtcs,
+		      const struct exynos_drm_plane_config *config)
 {
 	int err;
 
-	err = drm_universal_plane_init(dev, &exynos_plane->base, possible_crtcs,
-				       &exynos_plane_funcs, formats, fcount,
-				       type);
+	err = drm_universal_plane_init(dev, &exynos_plane->base,
+				       possible_crtcs,
+				       &exynos_plane_funcs,
+				       config->pixel_formats,
+				       config->num_pixel_formats,
+				       config->type);
+
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
@@ -275,10 +267,12 @@ int exynos_plane_init(struct drm_device *dev,
 
 	drm_plane_helper_add(&exynos_plane->base, &plane_helper_funcs);
 
-	exynos_plane->zpos = zpos;
+	exynos_plane->zpos = config->zpos;
+	exynos_plane->config = config;
 
-	if (type == DRM_PLANE_TYPE_OVERLAY)
-		exynos_plane_attach_zpos_property(&exynos_plane->base, zpos);
+	if (config->type == DRM_PLANE_TYPE_OVERLAY)
+		exynos_plane_attach_zpos_property(&exynos_plane->base,
+						  config->zpos);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/drm/exynos/exynos_drm_plane.h
index abb641e64c23..0dd096548284 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -9,10 +9,7 @@
  *
  */
 
-enum drm_plane_type exynos_plane_get_type(unsigned int zpos,
-					  unsigned int cursor_win);
 int exynos_plane_init(struct drm_device *dev,
 		      struct exynos_drm_plane *exynos_plane,
-		      unsigned long possible_crtcs, enum drm_plane_type type,
-		      const uint32_t *formats, unsigned int fcount,
-		      unsigned int zpos);
+		      unsigned long possible_crtcs,
+		      const struct exynos_drm_plane_config *config);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 3ce141236fad..90701647aef1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -30,7 +30,6 @@
 
 /* vidi has totally three virtual windows. */
 #define WINDOWS_NR		3
-#define CURSOR_WIN		2
 
 #define ctx_from_connector(c)	container_of(c, struct vidi_context, \
 					connector)
@@ -90,6 +89,12 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_NV12,
 };
 
+static const enum drm_plane_type vidi_win_types[WINDOWS_NR] = {
+	DRM_PLANE_TYPE_PRIMARY,
+	DRM_PLANE_TYPE_OVERLAY,
+	DRM_PLANE_TYPE_CURSOR,
+};
+
 static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct vidi_context *ctx = crtc->ctx;
@@ -442,17 +447,21 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
-	enum drm_plane_type type;
-	unsigned int zpos;
+	struct exynos_drm_plane_config plane_config = { 0 };
+	unsigned int i;
 	int pipe, ret;
 
 	vidi_ctx_initialize(ctx, drm_dev);
 
-	for (zpos = 0; zpos < WINDOWS_NR; zpos++) {
-		type = exynos_plane_get_type(zpos, CURSOR_WIN);
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, formats,
-					ARRAY_SIZE(formats), zpos);
+	plane_config.pixel_formats = formats;
+	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
+
+	for (i = 0; i < WINDOWS_NR; i++) {
+		plane_config.zpos = i;
+		plane_config.type = vidi_win_types(i);
+
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+					1 << ctx->pipe, &plane_config);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 015e85cabcc9..cdec3c1827c6 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -43,7 +43,6 @@
 
 #define MIXER_WIN_NR		3
 #define VP_DEFAULT_WIN		2
-#define CURSOR_WIN		1
 
 /* The pixelformats that are natively supported by the mixer. */
 #define MXR_FORMAT_RGB565	4
@@ -112,6 +111,31 @@ struct mixer_drv_data {
 	bool					has_sclk;
 };
 
+static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
+	{
+		.zpos = 0,
+		.type = DRM_PLANE_TYPE_PRIMARY,
+		.pixel_formats = mixer_formats,
+		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
+		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE_X |
+				EXYNOS_DRM_PLANE_CAP_DOUBLE_Y,
+	}, {
+		.zpos = 1,
+		.type = DRM_PLANE_TYPE_CURSOR,
+		.pixel_formats = mixer_formats,
+		.num_pixel_formats = ARRAY_SIZE(mixer_formats),
+		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE_X |
+				EXYNOS_DRM_PLANE_CAP_DOUBLE_Y,
+	}, {
+		.zpos = 2,
+		.type = DRM_PLANE_TYPE_OVERLAY,
+		.pixel_formats = vp_formats,
+		.num_pixel_formats = ARRAY_SIZE(vp_formats),
+		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE_X |
+				EXYNOS_DRM_PLANE_CAP_DOUBLE_Y,
+	},
+};
+
 static const u8 filter_y_horiz_tap8[] = {
 	0,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
 	-1,	-1,	-1,	-1,	-1,	0,	0,	0,
@@ -1188,38 +1212,25 @@ static struct of_device_id mixer_match_types[] = {
 };
 MODULE_DEVICE_TABLE(of, mixer_match_types);
 
+
 static int mixer_bind(struct device *dev, struct device *manager, void *data)
 {
 	struct mixer_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
 	struct exynos_drm_plane *exynos_plane;
-	unsigned int zpos;
+	unsigned int i;
 	int ret;
 
 	ret = mixer_initialize(ctx, drm_dev);
 	if (ret)
 		return ret;
 
-	for (zpos = 0; zpos < MIXER_WIN_NR; zpos++) {
-		enum drm_plane_type type;
-		const uint32_t *formats;
-		unsigned int fcount;
-
-		if (zpos == VP_DEFAULT_WIN && !ctx->vp_enabled)
+	for (i = 0; i < MIXER_WIN_NR; i++) {
+		if (i == VP_DEFAULT_WIN && !ctx->vp_enabled)
 			continue;
 
-		if (zpos < VP_DEFAULT_WIN) {
-			formats = mixer_formats;
-			fcount = ARRAY_SIZE(mixer_formats);
-		} else {
-			formats = vp_formats;
-			fcount = ARRAY_SIZE(vp_formats);
-		}
-
-		type = exynos_plane_get_type(zpos, CURSOR_WIN);
-		ret = exynos_plane_init(drm_dev, &ctx->planes[zpos],
-					1 << ctx->pipe, type, formats, fcount,
-					zpos);
+		ret = exynos_plane_init(drm_dev, &ctx->planes[i],
+					1 << ctx->pipe, &plane_configs[i]);
 		if (ret)
 			return ret;
 	}
-- 
1.9.2
