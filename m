From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/6] drm/exynos: gsc: Convert driver to IPP v2 core API
Date: Tue, 12 Sep 2017 10:08:56 +0200
Message-ID: <1505203739-29747-5-git-send-email-m.szyprowski@samsung.com>
References: <1505203739-29747-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170912080911eucas1p10018705e16e07e61239db3c9f32ca956@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45148 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751357AbdILIJP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 04:09:15 -0400
In-reply-to: <1505203739-29747-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adapts Exynos DRM rotator driver to new IPP v2 core API.
The side effect of this conversion is a switch to driver component API
to register properly in the Exynos DRM core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig          |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c |   1 +
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 853 ++++++++------------------------
 drivers/gpu/drm/exynos/exynos_drm_gsc.h |  24 -
 4 files changed, 198 insertions(+), 683 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_gsc.h

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index c10c9ca0d8b4..4bb9edb00601 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -111,7 +111,8 @@ config DRM_EXYNOS_ROTATOR
 
 config DRM_EXYNOS_GSC
 	bool "GScaler"
-	depends on BROKEN && ARCH_EXYNOS5 && VIDEO_SAMSUNG_EXYNOS_GSC=n
+	depends on ARCH_EXYNOS5 && VIDEO_SAMSUNG_EXYNOS_GSC=n
+	select DRM_EXYNOS_IPP
 	help
 	  Choose this option if you want to use Exynos GSC for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 277e444b0be6..27242af103ea 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -272,6 +272,7 @@ struct exynos_drm_driver_info {
 		DRM_COMPONENT_DRIVER
 	}, {
 		DRV_PTR(gsc_driver, CONFIG_DRM_EXYNOS_GSC),
+		DRM_COMPONENT_DRIVER
 	}, {
 		&exynos_drm_platform_driver,
 		DRM_VIRTUAL_DEVICE
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 0506b2b17ac1..1293441a4212 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -12,6 +12,7 @@
  *
  */
 #include <linux/kernel.h>
+#include <linux/component.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
@@ -22,8 +23,8 @@
 #include <drm/exynos_drm.h>
 #include "regs-gsc.h"
 #include "exynos_drm_drv.h"
+#include "exynos_drm_iommu.h"
 #include "exynos_drm_ipp.h"
-#include "exynos_drm_gsc.h"
 
 /*
  * GSC stands for General SCaler and
@@ -31,26 +32,9 @@
  * input DMA reads image data from the memory.
  * output DMA writes image data to memory.
  * GSC supports image rotation and image effect functions.
- *
- * M2M operation : supports crop/scale/rotation/csc so on.
- * Memory ----> GSC H/W ----> Memory.
- * Writeback operation : supports cloned screen with FIMD.
- * FIMD ----> GSC H/W ----> Memory.
- * Output operation : supports direct display using local path.
- * Memory ----> GSC H/W ----> FIMD, Mixer.
  */
 
-/*
- * TODO
- * 1. check suspend/resume api if needed.
- * 2. need to check use case platform_device_id.
- * 3. check src/dst size with, height.
- * 4. added check_prepare api for right register.
- * 5. need to add supported list in prop_list.
- * 6. check prescaler/scaler optimization.
- */
 
-#define GSC_MAX_DEVS	4
 #define GSC_MAX_SRC		4
 #define GSC_MAX_DST		16
 #define GSC_RESET_TIMEOUT	50
@@ -65,8 +49,6 @@
 #define GSC_SC_DOWN_RATIO_4_8		131072
 #define GSC_SC_DOWN_RATIO_3_8		174762
 #define GSC_SC_DOWN_RATIO_2_8		262144
-#define GSC_REFRESH_MIN	12
-#define GSC_REFRESH_MAX	60
 #define GSC_CROP_MAX	8192
 #define GSC_CROP_MIN	32
 #define GSC_SCALE_MAX	4224
@@ -79,8 +61,6 @@
 #define GSC_COEF_DEPTH	3
 
 #define get_gsc_context(dev)	platform_get_drvdata(to_platform_device(dev))
-#define get_ctx_from_ippdrv(ippdrv)	container_of(ippdrv,\
-					struct gsc_context, ippdrv);
 #define gsc_read(offset)		readl(ctx->regs + (offset))
 #define gsc_write(cfg, offset)	writel(cfg, ctx->regs + (offset))
 
@@ -124,7 +104,6 @@ struct gsc_capability {
 /*
  * A structure of gsc context.
  *
- * @ippdrv: prepare initialization using ippdrv.
  * @regs_res: register resources.
  * @regs: memory mapped io registers.
  * @sysreg: handle to SYSREG block regmap.
@@ -137,11 +116,14 @@ struct gsc_capability {
  * @suspended: qos operations.
  */
 struct gsc_context {
-	struct exynos_drm_ippdrv	ippdrv;
+	struct exynos_drm_ipp ipp;
+	struct drm_device *drm_dev;
+	struct device	*dev;
+	struct exynos_drm_ipp_task	*task;
+
 	struct resource	*regs_res;
 	void __iomem	*regs;
 	struct regmap	*sysreg;
-	struct mutex	lock;
 	struct clk	*gsc_clk;
 	struct gsc_scaler	sc;
 	int	id;
@@ -438,25 +420,6 @@ static int gsc_sw_reset(struct gsc_context *ctx)
 	return 0;
 }
 
-static void gsc_set_gscblk_fimd_wb(struct gsc_context *ctx, bool enable)
-{
-	unsigned int gscblk_cfg;
-
-	if (!ctx->sysreg)
-		return;
-
-	regmap_read(ctx->sysreg, SYSREG_GSCBLK_CFG1, &gscblk_cfg);
-
-	if (enable)
-		gscblk_cfg |= GSC_BLK_DISP1WB_DEST(ctx->id) |
-				GSC_BLK_GSCL_WB_IN_SRC_SEL(ctx->id) |
-				GSC_BLK_SW_RESET_WB_DEST(ctx->id);
-	else
-		gscblk_cfg |= GSC_BLK_PXLASYNC_LO_MASK_WB(ctx->id);
-
-	regmap_write(ctx->sysreg, SYSREG_GSCBLK_CFG1, gscblk_cfg);
-}
-
 static void gsc_handle_irq(struct gsc_context *ctx, bool enable,
 		bool overflow, bool done)
 {
@@ -487,10 +450,8 @@ static void gsc_handle_irq(struct gsc_context *ctx, bool enable,
 }
 
 
-static int gsc_src_set_fmt(struct device *dev, u32 fmt)
+static int gsc_src_set_fmt(struct gsc_context *ctx, u32 fmt)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg;
 
 	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
@@ -549,7 +510,7 @@ static int gsc_src_set_fmt(struct device *dev, u32 fmt)
 			GSC_IN_YUV420_2P);
 		break;
 	default:
-		dev_err(ippdrv->dev, "invalid target yuv order 0x%x.\n", fmt);
+		dev_err(ctx->dev, "invalid target yuv order 0x%x.\n", fmt);
 		return -EINVAL;
 	}
 
@@ -558,105 +519,81 @@ static int gsc_src_set_fmt(struct device *dev, u32 fmt)
 	return 0;
 }
 
-static int gsc_src_set_transf(struct device *dev,
-		enum drm_exynos_degree degree,
-		enum drm_exynos_flip flip, bool *swap)
+static int gsc_src_set_transf(struct gsc_context *ctx, unsigned int rotation)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
+	unsigned int degree = rotation & DRM_MODE_ROTATE_MASK;
 	u32 cfg;
 
-	DRM_DEBUG_KMS("degree[%d]flip[0x%x]\n", degree, flip);
-
 	cfg = gsc_read(GSC_IN_CON);
 	cfg &= ~GSC_IN_ROT_MASK;
 
 	switch (degree) {
-	case EXYNOS_DRM_DEGREE_0:
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+	case DRM_MODE_ROTATE_0:
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg |= GSC_IN_ROT_XFLIP;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg |= GSC_IN_ROT_YFLIP;
 		break;
-	case EXYNOS_DRM_DEGREE_90:
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+	case DRM_MODE_ROTATE_90:
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg |= GSC_IN_ROT_90_XFLIP;
-		else if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		else if (rotation & DRM_MODE_REFLECT_X)
 			cfg |= GSC_IN_ROT_90_YFLIP;
 		else
 			cfg |= GSC_IN_ROT_90;
 		break;
-	case EXYNOS_DRM_DEGREE_180:
+	case DRM_MODE_ROTATE_180:
 		cfg |= GSC_IN_ROT_180;
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg &= ~GSC_IN_ROT_XFLIP;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg &= ~GSC_IN_ROT_YFLIP;
 		break;
-	case EXYNOS_DRM_DEGREE_270:
+	case DRM_MODE_ROTATE_270:
 		cfg |= GSC_IN_ROT_270;
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg &= ~GSC_IN_ROT_XFLIP;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg &= ~GSC_IN_ROT_YFLIP;
 		break;
-	default:
-		dev_err(ippdrv->dev, "invalid degree value %d.\n", degree);
-		return -EINVAL;
 	}
 
 	gsc_write(cfg, GSC_IN_CON);
 
 	ctx->rotation = (cfg & GSC_IN_ROT_90) ? 1 : 0;
-	*swap = ctx->rotation;
-
 	return 0;
 }
 
-static int gsc_src_set_size(struct device *dev, int swap,
-		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
+static int gsc_src_set_size(struct gsc_context *ctx,
+		struct exynos_drm_ipp_buffer *buf)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct drm_exynos_pos img_pos = *pos;
 	struct gsc_scaler *sc = &ctx->sc;
 	u32 cfg;
 
-	DRM_DEBUG_KMS("swap[%d]x[%d]y[%d]w[%d]h[%d]\n",
-		swap, pos->x, pos->y, pos->w, pos->h);
-
-	if (swap) {
-		img_pos.w = pos->h;
-		img_pos.h = pos->w;
-	}
-
 	/* pixel offset */
-	cfg = (GSC_SRCIMG_OFFSET_X(img_pos.x) |
-		GSC_SRCIMG_OFFSET_Y(img_pos.y));
+	cfg = (GSC_SRCIMG_OFFSET_X(buf->rect.x) |
+		GSC_SRCIMG_OFFSET_Y(buf->rect.y));
 	gsc_write(cfg, GSC_SRCIMG_OFFSET);
 
 	/* cropped size */
-	cfg = (GSC_CROPPED_WIDTH(img_pos.w) |
-		GSC_CROPPED_HEIGHT(img_pos.h));
+	cfg = (GSC_CROPPED_WIDTH(buf->rect.w) |
+		GSC_CROPPED_HEIGHT(buf->rect.h));
 	gsc_write(cfg, GSC_CROPPED_SIZE);
 
-	DRM_DEBUG_KMS("hsize[%d]vsize[%d]\n", sz->hsize, sz->vsize);
-
 	/* original size */
 	cfg = gsc_read(GSC_SRCIMG_SIZE);
 	cfg &= ~(GSC_SRCIMG_HEIGHT_MASK |
 		GSC_SRCIMG_WIDTH_MASK);
 
-	cfg |= (GSC_SRCIMG_WIDTH(sz->hsize) |
-		GSC_SRCIMG_HEIGHT(sz->vsize));
+	cfg |= (GSC_SRCIMG_WIDTH(buf->buf.width) |
+		GSC_SRCIMG_HEIGHT(buf->buf.height));
 
 	gsc_write(cfg, GSC_SRCIMG_SIZE);
 
 	cfg = gsc_read(GSC_IN_CON);
 	cfg &= ~GSC_IN_RGB_TYPE_MASK;
 
-	DRM_DEBUG_KMS("width[%d]range[%d]\n", pos->w, sc->range);
-
-	if (pos->w >= GSC_WIDTH_ITU_709)
+	if (buf->rect.w >= GSC_WIDTH_ITU_709)
 		if (sc->range)
 			cfg |= GSC_IN_RGB_HD_WIDE;
 		else
@@ -673,30 +610,15 @@ static int gsc_src_set_size(struct device *dev, int swap,
 }
 
 static int gsc_src_set_buf_seq(struct gsc_context *ctx, u32 buf_id,
-		enum drm_exynos_ipp_buf_type buf_type)
+			       bool enqueue)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	bool masked;
+	bool masked = !enqueue;
 	u32 cfg;
 	u32 mask = 0x00000001 << buf_id;
 
-	DRM_DEBUG_KMS("buf_id[%d]buf_type[%d]\n", buf_id, buf_type);
-
 	/* mask register set */
 	cfg = gsc_read(GSC_IN_BASE_ADDR_Y_MASK);
 
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		masked = false;
-		break;
-	case IPP_BUF_DEQUEUE:
-		masked = true;
-		break;
-	default:
-		dev_err(ippdrv->dev, "invalid buf ctrl parameter.\n");
-		return -EINVAL;
-	}
-
 	/* sequence id */
 	cfg &= ~mask;
 	cfg |= masked << buf_id;
@@ -707,64 +629,19 @@ static int gsc_src_set_buf_seq(struct gsc_context *ctx, u32 buf_id,
 	return 0;
 }
 
-static int gsc_src_set_addr(struct device *dev,
-		struct drm_exynos_ipp_buf_info *buf_info, u32 buf_id,
-		enum drm_exynos_ipp_buf_type buf_type)
+static int gsc_src_set_addr(struct gsc_context *ctx, u32 buf_id,
+			    struct exynos_drm_ipp_buffer *buf)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_property *property;
-
-	if (!c_node) {
-		DRM_ERROR("failed to get c_node.\n");
-		return -EFAULT;
-	}
-
-	property = &c_node->property;
-
-	DRM_DEBUG_KMS("prop_id[%d]buf_id[%d]buf_type[%d]\n",
-		property->prop_id, buf_id, buf_type);
-
-	if (buf_id > GSC_MAX_SRC) {
-		dev_info(ippdrv->dev, "invalid buf_id %d.\n", buf_id);
-		return -EINVAL;
-	}
-
 	/* address register set */
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_Y],
-			GSC_IN_BASE_ADDR_Y(buf_id));
-		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_CB],
-			GSC_IN_BASE_ADDR_CB(buf_id));
-		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_CR],
-			GSC_IN_BASE_ADDR_CR(buf_id));
-		break;
-	case IPP_BUF_DEQUEUE:
-		gsc_write(0x0, GSC_IN_BASE_ADDR_Y(buf_id));
-		gsc_write(0x0, GSC_IN_BASE_ADDR_CB(buf_id));
-		gsc_write(0x0, GSC_IN_BASE_ADDR_CR(buf_id));
-		break;
-	default:
-		/* bypass */
-		break;
-	}
+	gsc_write(buf->dma_addr[0], GSC_IN_BASE_ADDR_Y(buf_id));
+	gsc_write(buf->dma_addr[1], GSC_IN_BASE_ADDR_CB(buf_id));
+	gsc_write(buf->dma_addr[2], GSC_IN_BASE_ADDR_CR(buf_id));
 
-	return gsc_src_set_buf_seq(ctx, buf_id, buf_type);
+	return gsc_src_set_buf_seq(ctx, buf_id, true);
 }
 
-static struct exynos_drm_ipp_ops gsc_src_ops = {
-	.set_fmt = gsc_src_set_fmt,
-	.set_transf = gsc_src_set_transf,
-	.set_size = gsc_src_set_size,
-	.set_addr = gsc_src_set_addr,
-};
-
-static int gsc_dst_set_fmt(struct device *dev, u32 fmt)
+static int gsc_dst_set_fmt(struct gsc_context *ctx, u32 fmt)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg;
 
 	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
@@ -819,9 +696,6 @@ static int gsc_dst_set_fmt(struct device *dev, u32 fmt)
 		cfg |= (GSC_OUT_CHROMA_ORDER_CBCR |
 			GSC_OUT_YUV420_2P);
 		break;
-	default:
-		dev_err(ippdrv->dev, "invalid target yuv order 0x%x.\n", fmt);
-		return -EINVAL;
 	}
 
 	gsc_write(cfg, GSC_OUT_CON);
@@ -829,61 +703,6 @@ static int gsc_dst_set_fmt(struct device *dev, u32 fmt)
 	return 0;
 }
 
-static int gsc_dst_set_transf(struct device *dev,
-		enum drm_exynos_degree degree,
-		enum drm_exynos_flip flip, bool *swap)
-{
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	u32 cfg;
-
-	DRM_DEBUG_KMS("degree[%d]flip[0x%x]\n", degree, flip);
-
-	cfg = gsc_read(GSC_IN_CON);
-	cfg &= ~GSC_IN_ROT_MASK;
-
-	switch (degree) {
-	case EXYNOS_DRM_DEGREE_0:
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
-			cfg |= GSC_IN_ROT_XFLIP;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
-			cfg |= GSC_IN_ROT_YFLIP;
-		break;
-	case EXYNOS_DRM_DEGREE_90:
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
-			cfg |= GSC_IN_ROT_90_XFLIP;
-		else if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
-			cfg |= GSC_IN_ROT_90_YFLIP;
-		else
-			cfg |= GSC_IN_ROT_90;
-		break;
-	case EXYNOS_DRM_DEGREE_180:
-		cfg |= GSC_IN_ROT_180;
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
-			cfg &= ~GSC_IN_ROT_XFLIP;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
-			cfg &= ~GSC_IN_ROT_YFLIP;
-		break;
-	case EXYNOS_DRM_DEGREE_270:
-		cfg |= GSC_IN_ROT_270;
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
-			cfg &= ~GSC_IN_ROT_XFLIP;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
-			cfg &= ~GSC_IN_ROT_YFLIP;
-		break;
-	default:
-		dev_err(ippdrv->dev, "invalid degree value %d.\n", degree);
-		return -EINVAL;
-	}
-
-	gsc_write(cfg, GSC_IN_CON);
-
-	ctx->rotation = (cfg & GSC_IN_ROT_90) ? 1 : 0;
-	*swap = ctx->rotation;
-
-	return 0;
-}
-
 static int gsc_get_ratio_shift(u32 src, u32 dst, u32 *ratio)
 {
 	DRM_DEBUG_KMS("src[%d]dst[%d]\n", src, dst);
@@ -919,9 +738,8 @@ static void gsc_get_prescaler_shfactor(u32 hratio, u32 vratio, u32 *shfactor)
 }
 
 static int gsc_set_prescaler(struct gsc_context *ctx, struct gsc_scaler *sc,
-		struct drm_exynos_pos *src, struct drm_exynos_pos *dst)
+     struct drm_exynos_ipp_task_rect *src, struct drm_exynos_ipp_task_rect *dst)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg;
 	u32 src_w, src_h, dst_w, dst_h;
 	int ret = 0;
@@ -939,13 +757,13 @@ static int gsc_set_prescaler(struct gsc_context *ctx, struct gsc_scaler *sc,
 
 	ret = gsc_get_ratio_shift(src_w, dst_w, &sc->pre_hratio);
 	if (ret) {
-		dev_err(ippdrv->dev, "failed to get ratio horizontal.\n");
+		dev_err(ctx->dev, "failed to get ratio horizontal.\n");
 		return ret;
 	}
 
 	ret = gsc_get_ratio_shift(src_h, dst_h, &sc->pre_vratio);
 	if (ret) {
-		dev_err(ippdrv->dev, "failed to get ratio vertical.\n");
+		dev_err(ctx->dev, "failed to get ratio vertical.\n");
 		return ret;
 	}
 
@@ -1039,47 +857,31 @@ static void gsc_set_scaler(struct gsc_context *ctx, struct gsc_scaler *sc)
 	gsc_write(cfg, GSC_MAIN_V_RATIO);
 }
 
-static int gsc_dst_set_size(struct device *dev, int swap,
-		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
+static int gsc_dst_set_size(struct gsc_context *ctx,
+			    struct exynos_drm_ipp_buffer *buf)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct drm_exynos_pos img_pos = *pos;
 	struct gsc_scaler *sc = &ctx->sc;
 	u32 cfg;
 
-	DRM_DEBUG_KMS("swap[%d]x[%d]y[%d]w[%d]h[%d]\n",
-		swap, pos->x, pos->y, pos->w, pos->h);
-
-	if (swap) {
-		img_pos.w = pos->h;
-		img_pos.h = pos->w;
-	}
-
 	/* pixel offset */
-	cfg = (GSC_DSTIMG_OFFSET_X(pos->x) |
-		GSC_DSTIMG_OFFSET_Y(pos->y));
+	cfg = (GSC_DSTIMG_OFFSET_X(buf->rect.x) |
+		GSC_DSTIMG_OFFSET_Y(buf->rect.y));
 	gsc_write(cfg, GSC_DSTIMG_OFFSET);
 
 	/* scaled size */
-	cfg = (GSC_SCALED_WIDTH(img_pos.w) | GSC_SCALED_HEIGHT(img_pos.h));
+	cfg = (GSC_SCALED_WIDTH(buf->rect.w) | GSC_SCALED_HEIGHT(buf->rect.h));
 	gsc_write(cfg, GSC_SCALED_SIZE);
 
-	DRM_DEBUG_KMS("hsize[%d]vsize[%d]\n", sz->hsize, sz->vsize);
-
 	/* original size */
 	cfg = gsc_read(GSC_DSTIMG_SIZE);
-	cfg &= ~(GSC_DSTIMG_HEIGHT_MASK |
-		GSC_DSTIMG_WIDTH_MASK);
-	cfg |= (GSC_DSTIMG_WIDTH(sz->hsize) |
-		GSC_DSTIMG_HEIGHT(sz->vsize));
+	cfg &= ~(GSC_DSTIMG_HEIGHT_MASK | GSC_DSTIMG_WIDTH_MASK);
+	cfg |= (GSC_DSTIMG_WIDTH(buf->buf.width) | GSC_DSTIMG_HEIGHT(buf->buf.height));
 	gsc_write(cfg, GSC_DSTIMG_SIZE);
 
 	cfg = gsc_read(GSC_OUT_CON);
 	cfg &= ~GSC_OUT_RGB_TYPE_MASK;
 
-	DRM_DEBUG_KMS("width[%d]range[%d]\n", pos->w, sc->range);
-
-	if (pos->w >= GSC_WIDTH_ITU_709)
+	if (buf->rect.w >= GSC_WIDTH_ITU_709)
 		if (sc->range)
 			cfg |= GSC_OUT_RGB_HD_WIDE;
 		else
@@ -1112,34 +914,16 @@ static int gsc_dst_get_buf_seq(struct gsc_context *ctx)
 }
 
 static int gsc_dst_set_buf_seq(struct gsc_context *ctx, u32 buf_id,
-		enum drm_exynos_ipp_buf_type buf_type)
+			       bool enqueue)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	bool masked;
+	bool masked = !enqueue;
 	u32 cfg;
 	u32 mask = 0x00000001 << buf_id;
 	int ret = 0;
 
-	DRM_DEBUG_KMS("buf_id[%d]buf_type[%d]\n", buf_id, buf_type);
-
-	mutex_lock(&ctx->lock);
-
 	/* mask register set */
 	cfg = gsc_read(GSC_OUT_BASE_ADDR_Y_MASK);
 
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		masked = false;
-		break;
-	case IPP_BUF_DEQUEUE:
-		masked = true;
-		break;
-	default:
-		dev_err(ippdrv->dev, "invalid buf ctrl parameter.\n");
-		ret =  -EINVAL;
-		goto err_unlock;
-	}
-
 	/* sequence id */
 	cfg &= ~mask;
 	cfg |= masked << buf_id;
@@ -1148,74 +932,27 @@ static int gsc_dst_set_buf_seq(struct gsc_context *ctx, u32 buf_id,
 	gsc_write(cfg, GSC_OUT_BASE_ADDR_CR_MASK);
 
 	/* interrupt enable */
-	if (buf_type == IPP_BUF_ENQUEUE &&
-	    gsc_dst_get_buf_seq(ctx) >= GSC_BUF_START)
+	if (enqueue && gsc_dst_get_buf_seq(ctx) >= GSC_BUF_START)
 		gsc_handle_irq(ctx, true, false, true);
 
 	/* interrupt disable */
-	if (buf_type == IPP_BUF_DEQUEUE &&
-	    gsc_dst_get_buf_seq(ctx) <= GSC_BUF_STOP)
+	if (!enqueue && gsc_dst_get_buf_seq(ctx) <= GSC_BUF_STOP)
 		gsc_handle_irq(ctx, false, false, true);
 
-err_unlock:
-	mutex_unlock(&ctx->lock);
 	return ret;
 }
 
-static int gsc_dst_set_addr(struct device *dev,
-		struct drm_exynos_ipp_buf_info *buf_info, u32 buf_id,
-		enum drm_exynos_ipp_buf_type buf_type)
+static int gsc_dst_set_addr(struct gsc_context *ctx,
+		u32 buf_id, struct exynos_drm_ipp_buffer *buf)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_property *property;
-
-	if (!c_node) {
-		DRM_ERROR("failed to get c_node.\n");
-		return -EFAULT;
-	}
-
-	property = &c_node->property;
-
-	DRM_DEBUG_KMS("prop_id[%d]buf_id[%d]buf_type[%d]\n",
-		property->prop_id, buf_id, buf_type);
-
-	if (buf_id > GSC_MAX_DST) {
-		dev_info(ippdrv->dev, "invalid buf_id %d.\n", buf_id);
-		return -EINVAL;
-	}
-
 	/* address register set */
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_Y],
-			GSC_OUT_BASE_ADDR_Y(buf_id));
-		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_CB],
-			GSC_OUT_BASE_ADDR_CB(buf_id));
-		gsc_write(buf_info->base[EXYNOS_DRM_PLANAR_CR],
-			GSC_OUT_BASE_ADDR_CR(buf_id));
-		break;
-	case IPP_BUF_DEQUEUE:
-		gsc_write(0x0, GSC_OUT_BASE_ADDR_Y(buf_id));
-		gsc_write(0x0, GSC_OUT_BASE_ADDR_CB(buf_id));
-		gsc_write(0x0, GSC_OUT_BASE_ADDR_CR(buf_id));
-		break;
-	default:
-		/* bypass */
-		break;
-	}
+	gsc_write(buf->dma_addr[0], GSC_OUT_BASE_ADDR_Y(buf_id));
+	gsc_write(buf->dma_addr[1], GSC_OUT_BASE_ADDR_CB(buf_id));
+	gsc_write(buf->dma_addr[2], GSC_OUT_BASE_ADDR_CR(buf_id));
 
-	return gsc_dst_set_buf_seq(ctx, buf_id, buf_type);
+	return gsc_dst_set_buf_seq(ctx, buf_id, true);
 }
 
-static struct exynos_drm_ipp_ops gsc_dst_ops = {
-	.set_fmt = gsc_dst_set_fmt,
-	.set_transf = gsc_dst_set_transf,
-	.set_size = gsc_dst_set_size,
-	.set_addr = gsc_dst_set_addr,
-};
-
 static int gsc_clk_ctrl(struct gsc_context *ctx, bool enable)
 {
 	DRM_DEBUG_KMS("enable[%d]\n", enable);
@@ -1249,20 +986,20 @@ static int gsc_get_src_buf_index(struct gsc_context *ctx)
 		}
 	}
 
+	DRM_DEBUG_KMS("cfg[0x%x]curr_index[%d]buf_id[%d]\n", cfg,
+		curr_index, buf_id);
+
 	if (buf_id == GSC_MAX_SRC) {
 		DRM_ERROR("failed to get in buffer index.\n");
 		return -EINVAL;
 	}
 
-	ret = gsc_src_set_buf_seq(ctx, buf_id, IPP_BUF_DEQUEUE);
+	ret = gsc_src_set_buf_seq(ctx, buf_id, false);
 	if (ret < 0) {
 		DRM_ERROR("failed to dequeue.\n");
 		return ret;
 	}
 
-	DRM_DEBUG_KMS("cfg[0x%x]curr_index[%d]buf_id[%d]\n", cfg,
-		curr_index, buf_id);
-
 	return buf_id;
 }
 
@@ -1289,7 +1026,7 @@ static int gsc_get_dst_buf_index(struct gsc_context *ctx)
 		return -EINVAL;
 	}
 
-	ret = gsc_dst_set_buf_seq(ctx, buf_id, IPP_BUF_DEQUEUE);
+	ret = gsc_dst_set_buf_seq(ctx, buf_id, false);
 	if (ret < 0) {
 		DRM_ERROR("failed to dequeue.\n");
 		return ret;
@@ -1304,215 +1041,54 @@ static int gsc_get_dst_buf_index(struct gsc_context *ctx)
 static irqreturn_t gsc_irq_handler(int irq, void *dev_id)
 {
 	struct gsc_context *ctx = dev_id;
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_event_work *event_work =
-		c_node->event_work;
 	u32 status;
-	int buf_id[EXYNOS_DRM_OPS_MAX];
+	int err = 0;
 
 	DRM_DEBUG_KMS("gsc id[%d]\n", ctx->id);
 
 	status = gsc_read(GSC_IRQ);
 	if (status & GSC_IRQ_STATUS_OR_IRQ) {
-		dev_err(ippdrv->dev, "occurred overflow at %d, status 0x%x.\n",
+		dev_err(ctx->dev, "occurred overflow at %d, status 0x%x.\n",
 			ctx->id, status);
-		return IRQ_NONE;
+		err = -EINVAL;
 	}
 
 	if (status & GSC_IRQ_STATUS_OR_FRM_DONE) {
-		dev_dbg(ippdrv->dev, "occurred frame done at %d, status 0x%x.\n",
-			ctx->id, status);
-
-		buf_id[EXYNOS_DRM_OPS_SRC] = gsc_get_src_buf_index(ctx);
-		if (buf_id[EXYNOS_DRM_OPS_SRC] < 0)
-			return IRQ_HANDLED;
-
-		buf_id[EXYNOS_DRM_OPS_DST] = gsc_get_dst_buf_index(ctx);
-		if (buf_id[EXYNOS_DRM_OPS_DST] < 0)
-			return IRQ_HANDLED;
+		int src_buf_id, dst_buf_id;
 
-		DRM_DEBUG_KMS("buf_id_src[%d]buf_id_dst[%d]\n",
-			buf_id[EXYNOS_DRM_OPS_SRC], buf_id[EXYNOS_DRM_OPS_DST]);
-
-		event_work->ippdrv = ippdrv;
-		event_work->buf_id[EXYNOS_DRM_OPS_SRC] =
-			buf_id[EXYNOS_DRM_OPS_SRC];
-		event_work->buf_id[EXYNOS_DRM_OPS_DST] =
-			buf_id[EXYNOS_DRM_OPS_DST];
-		queue_work(ippdrv->event_workq, &event_work->work);
-	}
-
-	return IRQ_HANDLED;
-}
-
-static int gsc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
-{
-	struct drm_exynos_ipp_prop_list *prop_list = &ippdrv->prop_list;
-
-	prop_list->version = 1;
-	prop_list->writeback = 1;
-	prop_list->refresh_min = GSC_REFRESH_MIN;
-	prop_list->refresh_max = GSC_REFRESH_MAX;
-	prop_list->flip = (1 << EXYNOS_DRM_FLIP_VERTICAL) |
-				(1 << EXYNOS_DRM_FLIP_HORIZONTAL);
-	prop_list->degree = (1 << EXYNOS_DRM_DEGREE_0) |
-				(1 << EXYNOS_DRM_DEGREE_90) |
-				(1 << EXYNOS_DRM_DEGREE_180) |
-				(1 << EXYNOS_DRM_DEGREE_270);
-	prop_list->csc = 1;
-	prop_list->crop = 1;
-	prop_list->crop_max.hsize = GSC_CROP_MAX;
-	prop_list->crop_max.vsize = GSC_CROP_MAX;
-	prop_list->crop_min.hsize = GSC_CROP_MIN;
-	prop_list->crop_min.vsize = GSC_CROP_MIN;
-	prop_list->scale = 1;
-	prop_list->scale_max.hsize = GSC_SCALE_MAX;
-	prop_list->scale_max.vsize = GSC_SCALE_MAX;
-	prop_list->scale_min.hsize = GSC_SCALE_MIN;
-	prop_list->scale_min.vsize = GSC_SCALE_MIN;
-
-	return 0;
-}
-
-static inline bool gsc_check_drm_flip(enum drm_exynos_flip flip)
-{
-	switch (flip) {
-	case EXYNOS_DRM_FLIP_NONE:
-	case EXYNOS_DRM_FLIP_VERTICAL:
-	case EXYNOS_DRM_FLIP_HORIZONTAL:
-	case EXYNOS_DRM_FLIP_BOTH:
-		return true;
-	default:
-		DRM_DEBUG_KMS("invalid flip\n");
-		return false;
-	}
-}
-
-static int gsc_ippdrv_check_property(struct device *dev,
-		struct drm_exynos_ipp_property *property)
-{
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_prop_list *pp = &ippdrv->prop_list;
-	struct drm_exynos_ipp_config *config;
-	struct drm_exynos_pos *pos;
-	struct drm_exynos_sz *sz;
-	bool swap;
-	int i;
-
-	for_each_ipp_ops(i) {
-		if ((i == EXYNOS_DRM_OPS_SRC) &&
-			(property->cmd == IPP_CMD_WB))
-			continue;
-
-		config = &property->config[i];
-		pos = &config->pos;
-		sz = &config->sz;
-
-		/* check for flip */
-		if (!gsc_check_drm_flip(config->flip)) {
-			DRM_ERROR("invalid flip.\n");
-			goto err_property;
-		}
-
-		/* check for degree */
-		switch (config->degree) {
-		case EXYNOS_DRM_DEGREE_90:
-		case EXYNOS_DRM_DEGREE_270:
-			swap = true;
-			break;
-		case EXYNOS_DRM_DEGREE_0:
-		case EXYNOS_DRM_DEGREE_180:
-			swap = false;
-			break;
-		default:
-			DRM_ERROR("invalid degree.\n");
-			goto err_property;
-		}
+		dev_dbg(ctx->dev, "occurred frame done at %d, status 0x%x.\n",
+			ctx->id, status);
 
-		/* check for buffer bound */
-		if ((pos->x + pos->w > sz->hsize) ||
-			(pos->y + pos->h > sz->vsize)) {
-			DRM_ERROR("out of buf bound.\n");
-			goto err_property;
-		}
+		src_buf_id = gsc_get_src_buf_index(ctx);
+		dst_buf_id = gsc_get_dst_buf_index(ctx);
 
-		/* check for crop */
-		if ((i == EXYNOS_DRM_OPS_SRC) && (pp->crop)) {
-			if (swap) {
-				if ((pos->h < pp->crop_min.hsize) ||
-					(sz->vsize > pp->crop_max.hsize) ||
-					(pos->w < pp->crop_min.vsize) ||
-					(sz->hsize > pp->crop_max.vsize)) {
-					DRM_ERROR("out of crop size.\n");
-					goto err_property;
-				}
-			} else {
-				if ((pos->w < pp->crop_min.hsize) ||
-					(sz->hsize > pp->crop_max.hsize) ||
-					(pos->h < pp->crop_min.vsize) ||
-					(sz->vsize > pp->crop_max.vsize)) {
-					DRM_ERROR("out of crop size.\n");
-					goto err_property;
-				}
-			}
-		}
+		DRM_DEBUG_KMS("buf_id_src[%d]buf_id_dst[%d]\n",	src_buf_id,
+			      dst_buf_id);
 
-		/* check for scale */
-		if ((i == EXYNOS_DRM_OPS_DST) && (pp->scale)) {
-			if (swap) {
-				if ((pos->h < pp->scale_min.hsize) ||
-					(sz->vsize > pp->scale_max.hsize) ||
-					(pos->w < pp->scale_min.vsize) ||
-					(sz->hsize > pp->scale_max.vsize)) {
-					DRM_ERROR("out of scale size.\n");
-					goto err_property;
-				}
-			} else {
-				if ((pos->w < pp->scale_min.hsize) ||
-					(sz->hsize > pp->scale_max.hsize) ||
-					(pos->h < pp->scale_min.vsize) ||
-					(sz->vsize > pp->scale_max.vsize)) {
-					DRM_ERROR("out of scale size.\n");
-					goto err_property;
-				}
-			}
-		}
+		if (src_buf_id < 0 || dst_buf_id < 0)
+			err = -EINVAL;
 	}
 
-	return 0;
+	if (ctx->task) {
+		struct exynos_drm_ipp_task *task = ctx->task;
 
-err_property:
-	for_each_ipp_ops(i) {
-		if ((i == EXYNOS_DRM_OPS_SRC) &&
-			(property->cmd == IPP_CMD_WB))
-			continue;
-
-		config = &property->config[i];
-		pos = &config->pos;
-		sz = &config->sz;
-
-		DRM_ERROR("[%s]f[%d]r[%d]pos[%d %d %d %d]sz[%d %d]\n",
-			i ? "dst" : "src", config->flip, config->degree,
-			pos->x, pos->y, pos->w, pos->h,
-			sz->hsize, sz->vsize);
+		ctx->task = NULL;
+		pm_runtime_put(ctx->dev);
+		exynos_drm_ipp_task_done(task, err);
 	}
 
-	return -EINVAL;
+	return IRQ_HANDLED;
 }
 
-
-static int gsc_ippdrv_reset(struct device *dev)
+static int gsc_reset(struct gsc_context *ctx)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
 	struct gsc_scaler *sc = &ctx->sc;
 	int ret;
 
 	/* reset h/w block */
 	ret = gsc_sw_reset(ctx);
 	if (ret < 0) {
-		dev_err(dev, "failed to reset hardware.\n");
+		dev_err(ctx->dev, "failed to reset hardware.\n");
 		return ret;
 	}
 
@@ -1523,96 +1099,29 @@ static int gsc_ippdrv_reset(struct device *dev)
 	return 0;
 }
 
-static int gsc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
+static int gsc_start(struct gsc_context *ctx)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_property *property;
-	struct drm_exynos_ipp_config *config;
-	struct drm_exynos_pos	img_pos[EXYNOS_DRM_OPS_MAX];
-	struct drm_exynos_ipp_set_wb set_wb;
 	u32 cfg;
-	int ret, i;
-
-	DRM_DEBUG_KMS("cmd[%d]\n", cmd);
-
-	if (!c_node) {
-		DRM_ERROR("failed to get c_node.\n");
-		return -EINVAL;
-	}
-
-	property = &c_node->property;
 
 	gsc_handle_irq(ctx, true, false, true);
 
-	for_each_ipp_ops(i) {
-		config = &property->config[i];
-		img_pos[i] = config->pos;
-	}
+	/* enable one shot */
+	cfg = gsc_read(GSC_ENABLE);
+	cfg &= ~(GSC_ENABLE_ON_CLEAR_MASK |
+		GSC_ENABLE_CLK_GATE_MODE_MASK);
+	cfg |= GSC_ENABLE_ON_CLEAR_ONESHOT;
+	gsc_write(cfg, GSC_ENABLE);
 
-	switch (cmd) {
-	case IPP_CMD_M2M:
-		/* enable one shot */
-		cfg = gsc_read(GSC_ENABLE);
-		cfg &= ~(GSC_ENABLE_ON_CLEAR_MASK |
-			GSC_ENABLE_CLK_GATE_MODE_MASK);
-		cfg |= GSC_ENABLE_ON_CLEAR_ONESHOT;
-		gsc_write(cfg, GSC_ENABLE);
-
-		/* src dma memory */
-		cfg = gsc_read(GSC_IN_CON);
-		cfg &= ~(GSC_IN_PATH_MASK | GSC_IN_LOCAL_SEL_MASK);
-		cfg |= GSC_IN_PATH_MEMORY;
-		gsc_write(cfg, GSC_IN_CON);
-
-		/* dst dma memory */
-		cfg = gsc_read(GSC_OUT_CON);
-		cfg |= GSC_OUT_PATH_MEMORY;
-		gsc_write(cfg, GSC_OUT_CON);
-		break;
-	case IPP_CMD_WB:
-		set_wb.enable = 1;
-		set_wb.refresh = property->refresh_rate;
-		gsc_set_gscblk_fimd_wb(ctx, set_wb.enable);
-		exynos_drm_ippnb_send_event(IPP_SET_WRITEBACK, (void *)&set_wb);
-
-		/* src local path */
-		cfg = gsc_read(GSC_IN_CON);
-		cfg &= ~(GSC_IN_PATH_MASK | GSC_IN_LOCAL_SEL_MASK);
-		cfg |= (GSC_IN_PATH_LOCAL | GSC_IN_LOCAL_FIMD_WB);
-		gsc_write(cfg, GSC_IN_CON);
-
-		/* dst dma memory */
-		cfg = gsc_read(GSC_OUT_CON);
-		cfg |= GSC_OUT_PATH_MEMORY;
-		gsc_write(cfg, GSC_OUT_CON);
-		break;
-	case IPP_CMD_OUTPUT:
-		/* src dma memory */
-		cfg = gsc_read(GSC_IN_CON);
-		cfg &= ~(GSC_IN_PATH_MASK | GSC_IN_LOCAL_SEL_MASK);
-		cfg |= GSC_IN_PATH_MEMORY;
-		gsc_write(cfg, GSC_IN_CON);
-
-		/* dst local path */
-		cfg = gsc_read(GSC_OUT_CON);
-		cfg |= GSC_OUT_PATH_MEMORY;
-		gsc_write(cfg, GSC_OUT_CON);
-		break;
-	default:
-		ret = -EINVAL;
-		dev_err(dev, "invalid operations.\n");
-		return ret;
-	}
+	/* src dma memory */
+	cfg = gsc_read(GSC_IN_CON);
+	cfg &= ~(GSC_IN_PATH_MASK | GSC_IN_LOCAL_SEL_MASK);
+	cfg |= GSC_IN_PATH_MEMORY;
+	gsc_write(cfg, GSC_IN_CON);
 
-	ret = gsc_set_prescaler(ctx, &ctx->sc,
-		&img_pos[EXYNOS_DRM_OPS_SRC],
-		&img_pos[EXYNOS_DRM_OPS_DST]);
-	if (ret) {
-		dev_err(dev, "failed to set prescaler.\n");
-		return ret;
-	}
+	/* dst dma memory */
+	cfg = gsc_read(GSC_OUT_CON);
+	cfg |= GSC_OUT_PATH_MEMORY;
+	gsc_write(cfg, GSC_OUT_CON);
 
 	gsc_set_scaler(ctx, &ctx->sc);
 
@@ -1623,60 +1132,112 @@ static int gsc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 	return 0;
 }
 
-static void gsc_ippdrv_stop(struct device *dev, enum drm_exynos_ipp_cmd cmd)
+static int gsc_commit(struct exynos_drm_ipp *ipp,
+			  struct exynos_drm_ipp_task *task)
 {
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct drm_exynos_ipp_set_wb set_wb = {0, 0};
-	u32 cfg;
+	struct gsc_context *ctx = container_of(ipp, struct gsc_context, ipp);
+
+	pm_runtime_get_sync(ctx->dev);
+	ctx->task = task;
+
+	gsc_reset(ctx);
+	gsc_src_set_fmt(ctx, task->src.buf.fourcc);
+	gsc_src_set_transf(ctx, task->transform.rotation);
+	gsc_src_set_size(ctx, &task->src);
+	gsc_src_set_addr(ctx, 0, &task->src);
+	gsc_dst_set_fmt(ctx, task->dst.buf.fourcc);
+	gsc_dst_set_size(ctx, &task->dst);
+	gsc_dst_set_addr(ctx, 0, &task->dst);
+	gsc_set_prescaler(ctx, &ctx->sc, &task->src.rect, &task->dst.rect);
+	gsc_start(ctx);
 
-	DRM_DEBUG_KMS("cmd[%d]\n", cmd);
+	return 0;
+}
 
-	switch (cmd) {
-	case IPP_CMD_M2M:
-		/* bypass */
-		break;
-	case IPP_CMD_WB:
-		gsc_set_gscblk_fimd_wb(ctx, set_wb.enable);
-		exynos_drm_ippnb_send_event(IPP_SET_WRITEBACK, (void *)&set_wb);
-		break;
-	case IPP_CMD_OUTPUT:
-	default:
-		dev_err(dev, "invalid operations.\n");
-		break;
+static void gsc_abort(struct exynos_drm_ipp *ipp,
+			  struct exynos_drm_ipp_task *task)
+{
+	struct gsc_context *ctx =
+			container_of(ipp, struct gsc_context, ipp);
+
+	gsc_reset(ctx);
+	if (ctx->task) {
+		struct exynos_drm_ipp_task *task = ctx->task;
+
+		ctx->task = NULL;
+		pm_runtime_put(ctx->dev);
+		exynos_drm_ipp_task_done(task, -EIO);
 	}
+}
 
-	gsc_handle_irq(ctx, false, false, true);
+static struct exynos_drm_ipp_funcs ipp_funcs = {
+	.commit = gsc_commit,
+	.abort = gsc_abort,
+};
 
-	/* reset sequence */
-	gsc_write(0xff, GSC_OUT_BASE_ADDR_Y_MASK);
-	gsc_write(0xff, GSC_OUT_BASE_ADDR_CB_MASK);
-	gsc_write(0xff, GSC_OUT_BASE_ADDR_CR_MASK);
+static const struct exynos_drm_ipp_formats gsc_formats[] = {
+	{ IPP_SRCDST_FORMAT(XRGB8888, NULL) },
+	{ IPP_SRCDST_FORMAT(RGB565, NULL) },
+	{ IPP_SRCDST_FORMAT(BGRX8888, NULL) },
+	{ IPP_SRCDST_FORMAT(NV12, NULL) },
+	{ IPP_SRCDST_FORMAT(NV16, NULL) },
+	{ IPP_SRCDST_FORMAT(NV21, NULL) },
+	{ IPP_SRCDST_FORMAT(NV61, NULL) },
+	{ IPP_SRCDST_FORMAT(UYVY, NULL) },
+	{ IPP_SRCDST_FORMAT(VYUY, NULL) },
+	{ IPP_SRCDST_FORMAT(YUYV, NULL) },
+	{ IPP_SRCDST_FORMAT(YVYU, NULL) },
+	{ IPP_SRCDST_FORMAT(YUV420, NULL) },
+	{ IPP_SRCDST_FORMAT(YVU420, NULL) },
+	{ IPP_SRCDST_FORMAT(YUV422, NULL) },
+	{ }
+};
 
-	cfg = gsc_read(GSC_ENABLE);
-	cfg &= ~GSC_ENABLE_ON;
-	gsc_write(cfg, GSC_ENABLE);
+static int gsc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct gsc_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_ipp *ipp = &ctx->ipp;
+
+	ctx->drm_dev = drm_dev;
+	drm_iommu_attach_device(drm_dev, dev);
+
+	exynos_drm_ipp_register(drm_dev, ipp, &ipp_funcs,
+			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
+			   DRM_EXYNOS_IPP_CAP_SCALE | DRM_EXYNOS_IPP_CAP_CONVERT,
+			   gsc_formats, "gsc");
+
+	dev_info(dev, "The exynos gscaler is probed successfully\n");
+
+	return 0;
 }
 
+static void gsc_unbind(struct device *dev, struct device *master,
+			void *data)
+{
+	struct gsc_context *ctx = dev_get_drvdata(dev);
+
+	drm_iommu_detach_device(ctx->drm_dev, ctx->dev);
+}
+
+static const struct component_ops gsc_component_ops = {
+	.bind	= gsc_bind,
+	.unbind = gsc_unbind,
+};
+
+
 static int gsc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gsc_context *ctx;
 	struct resource *res;
-	struct exynos_drm_ippdrv *ippdrv;
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
-	if (dev->of_node) {
-		ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
-							"samsung,sysreg");
-		if (IS_ERR(ctx->sysreg)) {
-			dev_warn(dev, "failed to get system register.\n");
-			ctx->sysreg = NULL;
-		}
-	}
+	ctx->dev = dev;
 
 	/* clock control */
 	ctx->gsc_clk = devm_clk_get(dev, "gscl");
@@ -1699,8 +1260,8 @@ static int gsc_probe(struct platform_device *pdev)
 	}
 
 	ctx->irq = res->start;
-	ret = devm_request_threaded_irq(dev, ctx->irq, NULL, gsc_irq_handler,
-		IRQF_ONESHOT, "drm_gsc", ctx);
+	ret = devm_request_irq(dev, ctx->irq, gsc_irq_handler, 0,
+			       dev_name(dev), ctx);
 	if (ret < 0) {
 		dev_err(dev, "failed to request irq.\n");
 		return ret;
@@ -1709,38 +1270,19 @@ static int gsc_probe(struct platform_device *pdev)
 	/* context initailization */
 	ctx->id = pdev->id;
 
-	ippdrv = &ctx->ippdrv;
-	ippdrv->dev = dev;
-	ippdrv->ops[EXYNOS_DRM_OPS_SRC] = &gsc_src_ops;
-	ippdrv->ops[EXYNOS_DRM_OPS_DST] = &gsc_dst_ops;
-	ippdrv->check_property = gsc_ippdrv_check_property;
-	ippdrv->reset = gsc_ippdrv_reset;
-	ippdrv->start = gsc_ippdrv_start;
-	ippdrv->stop = gsc_ippdrv_stop;
-	ret = gsc_init_prop_list(ippdrv);
-	if (ret < 0) {
-		dev_err(dev, "failed to init property list.\n");
-		return ret;
-	}
-
-	DRM_DEBUG_KMS("id[%d]ippdrv[%pK]\n", ctx->id, ippdrv);
-
-	mutex_init(&ctx->lock);
 	platform_set_drvdata(pdev, ctx);
 
 	pm_runtime_enable(dev);
 
-	ret = exynos_drm_ippdrv_register(ippdrv);
-	if (ret < 0) {
-		dev_err(dev, "failed to register drm gsc device.\n");
-		goto err_ippdrv_register;
-	}
+	ret = component_add(dev, &gsc_component_ops);
+	if (ret)
+		goto err_pm_dis;
 
 	dev_info(dev, "drm gsc registered successfully.\n");
 
 	return 0;
 
-err_ippdrv_register:
+err_pm_dis:
 	pm_runtime_disable(dev);
 	return ret;
 }
@@ -1748,11 +1290,6 @@ static int gsc_probe(struct platform_device *pdev)
 static int gsc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct gsc_context *ctx = get_gsc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-
-	exynos_drm_ippdrv_unregister(ippdrv);
-	mutex_destroy(&ctx->lock);
 
 	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.h b/drivers/gpu/drm/exynos/exynos_drm_gsc.h
deleted file mode 100644
index 29ec1c5efcf2..000000000000
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *
- * Authors:
- *	Eunchul Kim <chulspro.kim@samsung.com>
- *	Jinyoung Jeon <jy0.jeon@samsung.com>
- *	Sangmin Lee <lsmin.lee@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#ifndef _EXYNOS_DRM_GSC_H_
-#define _EXYNOS_DRM_GSC_H_
-
-/*
- * TODO
- * FIMD output interface notifier callback.
- * Mixer output interface notifier callback.
- */
-
-#endif /* _EXYNOS_DRM_GSC_H_ */
-- 
1.9.1
