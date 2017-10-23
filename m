From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 6/9] drm/exynos: fimc: Convert driver to IPP v2 core API
Date: Mon, 23 Oct 2017 09:54:25 +0200
Message-ID: <20171023075428.7003-7-m.szyprowski@samsung.com>
References: <20171023075428.7003-1-m.szyprowski@samsung.com>
        <CGME20171023075451eucas1p1a833d9c805f6b7dc1b984e59afce23f3@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47288 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751275AbdJWHyz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 03:54:55 -0400
In-reply-to: <20171023075428.7003-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

This patch adapts Exynos DRM FIMC driver to new IPP v2 core API.
The side effect of this conversion is a switch to driver component API
to register properly in the Exynos DRM core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig           |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 930 ++++++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_fimc.h |  23 -
 4 files changed, 282 insertions(+), 674 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimc.h

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 9b66a9838dca..73f06a3a8bec 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -99,7 +99,7 @@ config DRM_EXYNOS_IPP
 
 config DRM_EXYNOS_FIMC
 	bool "FIMC"
-	depends on BROKEN && MFD_SYSCON
+	select DRM_EXYNOS_IPP
 	help
 	  Choose this option if you want to use Exynos FIMC for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 60ae6ae06eb2..4afeffa024f3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -256,6 +256,7 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
 		DRV_PTR(g2d_driver, CONFIG_DRM_EXYNOS_G2D),
 	}, {
 		DRV_PTR(fimc_driver, CONFIG_DRM_EXYNOS_FIMC),
+		DRM_COMPONENT_DRIVER | DRM_SHARED_DEVICE,
 	}, {
 		DRV_PTR(rotator_driver, CONFIG_DRM_EXYNOS_ROTATOR),
 		DRM_COMPONENT_DRIVER
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 5b18b5c5fdf2..870f14b775b5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -12,6 +12,7 @@
  *
  */
 #include <linux/kernel.h>
+#include <linux/component.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
@@ -24,8 +25,9 @@
 #include <drm/exynos_drm.h>
 #include "regs-fimc.h"
 #include "exynos_drm_drv.h"
+#include "exynos_drm_iommu.h"
 #include "exynos_drm_ipp.h"
-#include "exynos_drm_fimc.h"
+
 
 /*
  * FIMC stands for Fully Interactive Mobile Camera and
@@ -33,23 +35,6 @@
  * input DMA reads image data from the memory.
  * output DMA writes image data to memory.
  * FIMC supports image rotation and image effect functions.
- *
- * M2M operation : supports crop/scale/rotation/csc so on.
- * Memory ----> FIMC H/W ----> Memory.
- * Writeback operation : supports cloned screen with FIMD.
- * FIMD ----> FIMC H/W ----> Memory.
- * Output operation : supports direct display using local path.
- * Memory ----> FIMC H/W ----> FIMD.
- */
-
-/*
- * TODO
- * 1. check suspend/resume api if needed.
- * 2. need to check use case platform_device_id.
- * 3. check src/dst size with, height.
- * 4. added check_prepare api for right register.
- * 5. need to add supported list in prop_list.
- * 6. check prescaler/scaler optimization.
  */
 
 #define FIMC_MAX_DEVS	4
@@ -59,29 +44,15 @@
 #define FIMC_BUF_STOP	1
 #define FIMC_BUF_START	2
 #define FIMC_WIDTH_ITU_709	1280
-#define FIMC_REFRESH_MAX	60
-#define FIMC_REFRESH_MIN	12
-#define FIMC_CROP_MAX	8192
-#define FIMC_CROP_MIN	32
-#define FIMC_SCALE_MAX	4224
-#define FIMC_SCALE_MIN	32
+#define FIMC_AUTOSUSPEND_DELAY	2000
 
 #define get_fimc_context(dev)	platform_get_drvdata(to_platform_device(dev))
-#define get_ctx_from_ippdrv(ippdrv)	container_of(ippdrv,\
-					struct fimc_context, ippdrv);
-enum fimc_wb {
-	FIMC_WB_NONE,
-	FIMC_WB_A,
-	FIMC_WB_B,
-};
 
 enum {
 	FIMC_CLK_LCLK,
 	FIMC_CLK_GATE,
 	FIMC_CLK_WB_A,
 	FIMC_CLK_WB_B,
-	FIMC_CLK_MUX,
-	FIMC_CLK_PARENT,
 	FIMC_CLKS_MAX
 };
 
@@ -90,8 +61,6 @@ static const char * const fimc_clock_names[] = {
 	[FIMC_CLK_GATE]   = "fimc",
 	[FIMC_CLK_WB_A]   = "pxl_async0",
 	[FIMC_CLK_WB_B]   = "pxl_async1",
-	[FIMC_CLK_MUX]    = "mux",
-	[FIMC_CLK_PARENT] = "parent",
 };
 
 #define FIMC_DEFAULT_LCLK_FREQUENCY 133000000UL
@@ -141,31 +110,29 @@ struct fimc_capability {
 /*
  * A structure of fimc context.
  *
- * @ippdrv: prepare initialization using ippdrv.
  * @regs_res: register resources.
  * @regs: memory mapped io registers.
  * @lock: locking of operations.
  * @clocks: fimc clocks.
- * @clk_frequency: LCLK clock frequency.
- * @sysreg: handle to SYSREG block regmap.
  * @sc: scaler infomations.
  * @pol: porarity of writeback.
  * @id: fimc id.
  * @irq: irq number.
- * @suspended: qos operations.
  */
 struct fimc_context {
-	struct exynos_drm_ippdrv	ippdrv;
+	struct exynos_drm_ipp ipp;
+	struct drm_device *drm_dev;
+	struct device	*dev;
+	struct exynos_drm_ipp_task	*task;
+	struct exynos_drm_ipp_formats	*formats;
+
 	struct resource	*regs_res;
 	void __iomem	*regs;
 	spinlock_t	lock;
 	struct clk	*clocks[FIMC_CLKS_MAX];
-	u32		clk_frequency;
-	struct regmap	*sysreg;
 	struct fimc_scaler	sc;
 	int	id;
 	int	irq;
-	bool	suspended;
 };
 
 static u32 fimc_read(struct fimc_context *ctx, u32 reg)
@@ -217,19 +184,10 @@ static void fimc_sw_reset(struct fimc_context *ctx)
 	fimc_write(ctx, 0x0, EXYNOS_CIFCNTSEQ);
 }
 
-static int fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)
-{
-	return regmap_update_bits(ctx->sysreg, SYSREG_CAMERA_BLK,
-				  SYSREG_FIMD0WB_DEST_MASK,
-				  ctx->id << SYSREG_FIMD0WB_DEST_SHIFT);
-}
-
-static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb)
+static void fimc_set_type_ctrl(struct fimc_context *ctx)
 {
 	u32 cfg;
 
-	DRM_DEBUG_KMS("wb[%d]\n", wb);
-
 	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
 	cfg &= ~(EXYNOS_CIGCTRL_TESTPATTERN_MASK |
 		EXYNOS_CIGCTRL_SELCAM_ITU_MASK |
@@ -238,23 +196,10 @@ static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb)
 		EXYNOS_CIGCTRL_SELWB_CAMIF_MASK |
 		EXYNOS_CIGCTRL_SELWRITEBACK_MASK);
 
-	switch (wb) {
-	case FIMC_WB_A:
-		cfg |= (EXYNOS_CIGCTRL_SELWRITEBACK_A |
-			EXYNOS_CIGCTRL_SELWB_CAMIF_WRITEBACK);
-		break;
-	case FIMC_WB_B:
-		cfg |= (EXYNOS_CIGCTRL_SELWRITEBACK_B |
-			EXYNOS_CIGCTRL_SELWB_CAMIF_WRITEBACK);
-		break;
-	case FIMC_WB_NONE:
-	default:
-		cfg |= (EXYNOS_CIGCTRL_SELCAM_ITU_A |
-			EXYNOS_CIGCTRL_SELWRITEBACK_A |
-			EXYNOS_CIGCTRL_SELCAM_MIPI_A |
-			EXYNOS_CIGCTRL_SELCAM_FIMC_ITU);
-		break;
-	}
+	cfg |= (EXYNOS_CIGCTRL_SELCAM_ITU_A |
+		EXYNOS_CIGCTRL_SELWRITEBACK_A |
+		EXYNOS_CIGCTRL_SELCAM_MIPI_A |
+		EXYNOS_CIGCTRL_SELCAM_FIMC_ITU);
 
 	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
 }
@@ -296,7 +241,6 @@ static void fimc_clear_irq(struct fimc_context *ctx)
 
 static bool fimc_check_ovf(struct fimc_context *ctx)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 status, flag;
 
 	status = fimc_read(ctx, EXYNOS_CISTATUS);
@@ -310,7 +254,7 @@ static bool fimc_check_ovf(struct fimc_context *ctx)
 			EXYNOS_CIWDOFST_CLROVFIY | EXYNOS_CIWDOFST_CLROVFICB |
 			EXYNOS_CIWDOFST_CLROVFICR);
 
-		dev_err(ippdrv->dev, "occurred overflow at %d, status 0x%x.\n",
+		dev_err(ctx->dev, "occurred overflow at %d, status 0x%x.\n",
 			ctx->id, status);
 		return true;
 	}
@@ -379,7 +323,6 @@ static void fimc_handle_lastend(struct fimc_context *ctx, bool enable)
 
 static int fimc_src_set_fmt_order(struct fimc_context *ctx, u32 fmt)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg;
 
 	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
@@ -439,7 +382,7 @@ static int fimc_src_set_fmt_order(struct fimc_context *ctx, u32 fmt)
 			EXYNOS_MSCTRL_C_INT_IN_2PLANE);
 		break;
 	default:
-		dev_err(ippdrv->dev, "invalid source yuv order 0x%x.\n", fmt);
+		dev_err(ctx->dev, "invalid source yuv order 0x%x.\n", fmt);
 		return -EINVAL;
 	}
 
@@ -448,10 +391,8 @@ static int fimc_src_set_fmt_order(struct fimc_context *ctx, u32 fmt)
 	return 0;
 }
 
-static int fimc_src_set_fmt(struct device *dev, u32 fmt)
+static int fimc_src_set_fmt(struct fimc_context *ctx, u32 fmt)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg;
 
 	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
@@ -486,7 +427,7 @@ static int fimc_src_set_fmt(struct device *dev, u32 fmt)
 		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR420;
 		break;
 	default:
-		dev_err(ippdrv->dev, "invalid source format 0x%x.\n", fmt);
+		dev_err(ctx->dev, "invalid source format 0x%x.\n", fmt);
 		return -EINVAL;
 	}
 
@@ -502,15 +443,12 @@ static int fimc_src_set_fmt(struct device *dev, u32 fmt)
 	return fimc_src_set_fmt_order(ctx, fmt);
 }
 
-static int fimc_src_set_transf(struct device *dev,
-		enum drm_exynos_degree degree,
-		enum drm_exynos_flip flip, bool *swap)
+static int fimc_src_set_transf(struct fimc_context *ctx, unsigned int rotation)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
+	unsigned int degree = rotation & DRM_MODE_ROTATE_MASK;
 	u32 cfg1, cfg2;
 
-	DRM_DEBUG_KMS("degree[%d]flip[0x%x]\n", degree, flip);
+	DRM_DEBUG_KMS("rotation[%x]\n", rotation);
 
 	cfg1 = fimc_read(ctx, EXYNOS_MSCTRL);
 	cfg1 &= ~(EXYNOS_MSCTRL_FLIP_X_MIRROR |
@@ -520,61 +458,58 @@ static int fimc_src_set_transf(struct device *dev,
 	cfg2 &= ~EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
 
 	switch (degree) {
-	case EXYNOS_DRM_DEGREE_0:
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+	case DRM_MODE_ROTATE_0:
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg1 |= EXYNOS_MSCTRL_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg1 |= EXYNOS_MSCTRL_FLIP_Y_MIRROR;
 		break;
-	case EXYNOS_DRM_DEGREE_90:
+	case DRM_MODE_ROTATE_90:
 		cfg2 |= EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg1 |= EXYNOS_MSCTRL_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg1 |= EXYNOS_MSCTRL_FLIP_Y_MIRROR;
 		break;
-	case EXYNOS_DRM_DEGREE_180:
+	case DRM_MODE_ROTATE_180:
 		cfg1 |= (EXYNOS_MSCTRL_FLIP_X_MIRROR |
 			EXYNOS_MSCTRL_FLIP_Y_MIRROR);
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg1 &= ~EXYNOS_MSCTRL_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg1 &= ~EXYNOS_MSCTRL_FLIP_Y_MIRROR;
 		break;
-	case EXYNOS_DRM_DEGREE_270:
+	case DRM_MODE_ROTATE_270:
 		cfg1 |= (EXYNOS_MSCTRL_FLIP_X_MIRROR |
 			EXYNOS_MSCTRL_FLIP_Y_MIRROR);
 		cfg2 |= EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg1 &= ~EXYNOS_MSCTRL_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg1 &= ~EXYNOS_MSCTRL_FLIP_Y_MIRROR;
 		break;
-	default:
-		dev_err(ippdrv->dev, "invalid degree value %d.\n", degree);
-		return -EINVAL;
 	}
 
 	fimc_write(ctx, cfg1, EXYNOS_MSCTRL);
 	fimc_write(ctx, cfg2, EXYNOS_CITRGFMT);
-	*swap = (cfg2 & EXYNOS_CITRGFMT_INROT90_CLOCKWISE) ? 1 : 0;
 
 	return 0;
 }
 
 static int fimc_set_window(struct fimc_context *ctx,
-		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
+			   struct exynos_drm_ipp_buffer *buf)
 {
 	u32 cfg, h1, h2, v1, v2;
 
 	/* cropped image */
-	h1 = pos->x;
-	h2 = sz->hsize - pos->w - pos->x;
-	v1 = pos->y;
-	v2 = sz->vsize - pos->h - pos->y;
+	h1 = buf->rect.x;
+	h2 = buf->buf.width - buf->rect.w - buf->rect.x;
+	v1 = buf->rect.y;
+	v2 = buf->buf.height - buf->rect.h - buf->rect.y;
 
 	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]hsize[%d]vsize[%d]\n",
-		pos->x, pos->y, pos->w, pos->h, sz->hsize, sz->vsize);
+		buf->rect.x, buf->rect.y, buf->rect.w, buf->rect.h,
+		buf->buf.width, buf->buf.height);
 	DRM_DEBUG_KMS("h1[%d]h2[%d]v1[%d]v2[%d]\n", h1, h2, v1, v2);
 
 	/*
@@ -596,38 +531,28 @@ static int fimc_set_window(struct fimc_context *ctx,
 	return 0;
 }
 
-static int fimc_src_set_size(struct device *dev, int swap,
-		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
+static int fimc_src_set_size(struct fimc_context *ctx,
+			     struct exynos_drm_ipp_buffer *buf)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct drm_exynos_pos img_pos = *pos;
-	struct drm_exynos_sz img_sz = *sz;
 	u32 cfg;
 
-	DRM_DEBUG_KMS("swap[%d]hsize[%d]vsize[%d]\n",
-		swap, sz->hsize, sz->vsize);
+	DRM_DEBUG_KMS("hsize[%d]vsize[%d]\n", buf->buf.width, buf->buf.height);
 
 	/* original size */
-	cfg = (EXYNOS_ORGISIZE_HORIZONTAL(img_sz.hsize) |
-		EXYNOS_ORGISIZE_VERTICAL(img_sz.vsize));
+	cfg = (EXYNOS_ORGISIZE_HORIZONTAL(buf->buf.width) |
+		EXYNOS_ORGISIZE_VERTICAL(buf->buf.height));
 
 	fimc_write(ctx, cfg, EXYNOS_ORGISIZE);
 
-	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", pos->x, pos->y, pos->w, pos->h);
-
-	if (swap) {
-		img_pos.w = pos->h;
-		img_pos.h = pos->w;
-		img_sz.hsize = sz->vsize;
-		img_sz.vsize = sz->hsize;
-	}
+	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", buf->rect.x, buf->rect.y,
+		buf->rect.w, buf->rect.h);
 
 	/* set input DMA image size */
 	cfg = fimc_read(ctx, EXYNOS_CIREAL_ISIZE);
 	cfg &= ~(EXYNOS_CIREAL_ISIZE_HEIGHT_MASK |
 		EXYNOS_CIREAL_ISIZE_WIDTH_MASK);
-	cfg |= (EXYNOS_CIREAL_ISIZE_WIDTH(img_pos.w) |
-		EXYNOS_CIREAL_ISIZE_HEIGHT(img_pos.h));
+	cfg |= (EXYNOS_CIREAL_ISIZE_WIDTH(buf->rect.w) |
+		EXYNOS_CIREAL_ISIZE_HEIGHT(buf->rect.h));
 	fimc_write(ctx, cfg, EXYNOS_CIREAL_ISIZE);
 
 	/*
@@ -635,91 +560,36 @@ static int fimc_src_set_size(struct device *dev, int swap,
 	 * for now, we support only ITU601 8 bit mode
 	 */
 	cfg = (EXYNOS_CISRCFMT_ITU601_8BIT |
-		EXYNOS_CISRCFMT_SOURCEHSIZE(img_sz.hsize) |
-		EXYNOS_CISRCFMT_SOURCEVSIZE(img_sz.vsize));
+		EXYNOS_CISRCFMT_SOURCEHSIZE(buf->buf.width) |
+		EXYNOS_CISRCFMT_SOURCEVSIZE(buf->buf.height));
 	fimc_write(ctx, cfg, EXYNOS_CISRCFMT);
 
 	/* offset Y(RGB), Cb, Cr */
-	cfg = (EXYNOS_CIIYOFF_HORIZONTAL(img_pos.x) |
-		EXYNOS_CIIYOFF_VERTICAL(img_pos.y));
+	cfg = (EXYNOS_CIIYOFF_HORIZONTAL(buf->rect.x) |
+		EXYNOS_CIIYOFF_VERTICAL(buf->rect.y));
 	fimc_write(ctx, cfg, EXYNOS_CIIYOFF);
-	cfg = (EXYNOS_CIICBOFF_HORIZONTAL(img_pos.x) |
-		EXYNOS_CIICBOFF_VERTICAL(img_pos.y));
+	cfg = (EXYNOS_CIICBOFF_HORIZONTAL(buf->rect.x) |
+		EXYNOS_CIICBOFF_VERTICAL(buf->rect.y));
 	fimc_write(ctx, cfg, EXYNOS_CIICBOFF);
-	cfg = (EXYNOS_CIICROFF_HORIZONTAL(img_pos.x) |
-		EXYNOS_CIICROFF_VERTICAL(img_pos.y));
+	cfg = (EXYNOS_CIICROFF_HORIZONTAL(buf->rect.x) |
+		EXYNOS_CIICROFF_VERTICAL(buf->rect.y));
 	fimc_write(ctx, cfg, EXYNOS_CIICROFF);
 
-	return fimc_set_window(ctx, &img_pos, &img_sz);
+	return fimc_set_window(ctx, buf);
 }
 
-static int fimc_src_set_addr(struct device *dev,
-		struct drm_exynos_ipp_buf_info *buf_info, u32 buf_id,
-		enum drm_exynos_ipp_buf_type buf_type)
+static int fimc_src_set_addr(struct fimc_context *ctx,
+			     struct exynos_drm_ipp_buffer *buf)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_property *property;
-	struct drm_exynos_ipp_config *config;
-
-	if (!c_node) {
-		DRM_ERROR("failed to get c_node.\n");
-		return -EINVAL;
-	}
-
-	property = &c_node->property;
-
-	DRM_DEBUG_KMS("prop_id[%d]buf_id[%d]buf_type[%d]\n",
-		property->prop_id, buf_id, buf_type);
-
-	if (buf_id > FIMC_MAX_SRC) {
-		dev_info(ippdrv->dev, "invalid buf_id %d.\n", buf_id);
-		return -ENOMEM;
-	}
-
-	/* address register set */
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		config = &property->config[EXYNOS_DRM_OPS_SRC];
-		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
-			EXYNOS_CIIYSA0);
-
-		if (config->fmt == DRM_FORMAT_YVU420) {
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
-				EXYNOS_CIICBSA0);
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
-				EXYNOS_CIICRSA0);
-		} else {
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
-				EXYNOS_CIICBSA0);
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
-				EXYNOS_CIICRSA0);
-		}
-		break;
-	case IPP_BUF_DEQUEUE:
-		fimc_write(ctx, 0x0, EXYNOS_CIIYSA0);
-		fimc_write(ctx, 0x0, EXYNOS_CIICBSA0);
-		fimc_write(ctx, 0x0, EXYNOS_CIICRSA0);
-		break;
-	default:
-		/* bypass */
-		break;
-	}
+	fimc_write(ctx, buf->dma_addr[0], EXYNOS_CIIYSA(0));
+	fimc_write(ctx, buf->dma_addr[1], EXYNOS_CIICBSA(0));
+	fimc_write(ctx, buf->dma_addr[2], EXYNOS_CIICRSA(0));
 
 	return 0;
 }
 
-static struct exynos_drm_ipp_ops fimc_src_ops = {
-	.set_fmt = fimc_src_set_fmt,
-	.set_transf = fimc_src_set_transf,
-	.set_size = fimc_src_set_size,
-	.set_addr = fimc_src_set_addr,
-};
-
 static int fimc_dst_set_fmt_order(struct fimc_context *ctx, u32 fmt)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg;
 
 	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
@@ -785,7 +655,7 @@ static int fimc_dst_set_fmt_order(struct fimc_context *ctx, u32 fmt)
 		cfg |= EXYNOS_CIOCTRL_YCBCR_2PLANE;
 		break;
 	default:
-		dev_err(ippdrv->dev, "invalid target yuv order 0x%x.\n", fmt);
+		dev_err(ctx->dev, "invalid target yuv order 0x%x.\n", fmt);
 		return -EINVAL;
 	}
 
@@ -794,10 +664,8 @@ static int fimc_dst_set_fmt_order(struct fimc_context *ctx, u32 fmt)
 	return 0;
 }
 
-static int fimc_dst_set_fmt(struct device *dev, u32 fmt)
+static int fimc_dst_set_fmt(struct fimc_context *ctx, u32 fmt)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg;
 
 	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
@@ -838,7 +706,7 @@ static int fimc_dst_set_fmt(struct device *dev, u32 fmt)
 			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_YCBCR420;
 			break;
 		default:
-			dev_err(ippdrv->dev, "invalid target format 0x%x.\n",
+			dev_err(ctx->dev, "invalid target format 0x%x.\n",
 				fmt);
 			return -EINVAL;
 		}
@@ -856,66 +724,58 @@ static int fimc_dst_set_fmt(struct device *dev, u32 fmt)
 	return fimc_dst_set_fmt_order(ctx, fmt);
 }
 
-static int fimc_dst_set_transf(struct device *dev,
-		enum drm_exynos_degree degree,
-		enum drm_exynos_flip flip, bool *swap)
+static int fimc_dst_set_transf(struct fimc_context *ctx, unsigned int rotation)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
+	unsigned int degree = rotation & DRM_MODE_ROTATE_MASK;
 	u32 cfg;
 
-	DRM_DEBUG_KMS("degree[%d]flip[0x%x]\n", degree, flip);
+	DRM_DEBUG_KMS("rotation[0x%x]\n", rotation);
 
 	cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
 	cfg &= ~EXYNOS_CITRGFMT_FLIP_MASK;
 	cfg &= ~EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE;
 
 	switch (degree) {
-	case EXYNOS_DRM_DEGREE_0:
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+	case DRM_MODE_ROTATE_0:
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg |= EXYNOS_CITRGFMT_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg |= EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
 		break;
-	case EXYNOS_DRM_DEGREE_90:
+	case DRM_MODE_ROTATE_90:
 		cfg |= EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE;
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg |= EXYNOS_CITRGFMT_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg |= EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
 		break;
-	case EXYNOS_DRM_DEGREE_180:
+	case DRM_MODE_ROTATE_180:
 		cfg |= (EXYNOS_CITRGFMT_FLIP_X_MIRROR |
 			EXYNOS_CITRGFMT_FLIP_Y_MIRROR);
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg &= ~EXYNOS_CITRGFMT_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg &= ~EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
 		break;
-	case EXYNOS_DRM_DEGREE_270:
+	case DRM_MODE_ROTATE_270:
 		cfg |= (EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE |
 			EXYNOS_CITRGFMT_FLIP_X_MIRROR |
 			EXYNOS_CITRGFMT_FLIP_Y_MIRROR);
-		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
+		if (rotation & DRM_MODE_REFLECT_X)
 			cfg &= ~EXYNOS_CITRGFMT_FLIP_X_MIRROR;
-		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
+		if (rotation & DRM_MODE_REFLECT_Y)
 			cfg &= ~EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
 		break;
-	default:
-		dev_err(ippdrv->dev, "invalid degree value %d.\n", degree);
-		return -EINVAL;
 	}
 
 	fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
-	*swap = (cfg & EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE) ? 1 : 0;
 
 	return 0;
 }
 
 static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
-		struct drm_exynos_pos *src, struct drm_exynos_pos *dst)
+     struct drm_exynos_ipp_task_rect *src, struct drm_exynos_ipp_task_rect *dst)
 {
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 	u32 cfg, cfg_ext, shfactor;
 	u32 pre_dst_width, pre_dst_height;
 	u32 hfactor, vfactor;
@@ -942,13 +802,13 @@ static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
 	/* fimc_ippdrv_check_property assures that dividers are not null */
 	hfactor = fls(src_w / dst_w / 2);
 	if (hfactor > FIMC_SHFACTOR / 2) {
-		dev_err(ippdrv->dev, "failed to get ratio horizontal.\n");
+		dev_err(ctx->dev, "failed to get ratio horizontal.\n");
 		return -EINVAL;
 	}
 
 	vfactor = fls(src_h / dst_h / 2);
 	if (vfactor > FIMC_SHFACTOR / 2) {
-		dev_err(ippdrv->dev, "failed to get ratio vertical.\n");
+		dev_err(ctx->dev, "failed to get ratio vertical.\n");
 		return -EINVAL;
 	}
 
@@ -1019,83 +879,73 @@ static void fimc_set_scaler(struct fimc_context *ctx, struct fimc_scaler *sc)
 	fimc_write(ctx, cfg_ext, EXYNOS_CIEXTEN);
 }
 
-static int fimc_dst_set_size(struct device *dev, int swap,
-		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
+static int fimc_dst_set_size(struct fimc_context *ctx,
+			     struct exynos_drm_ipp_buffer *buf)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct drm_exynos_pos img_pos = *pos;
-	struct drm_exynos_sz img_sz = *sz;
 	u32 cfg;
 
-	DRM_DEBUG_KMS("swap[%d]hsize[%d]vsize[%d]\n",
-		swap, sz->hsize, sz->vsize);
+	DRM_DEBUG_KMS("hsize[%d]vsize[%d]\n", buf->buf.width, buf->buf.height);
 
 	/* original size */
-	cfg = (EXYNOS_ORGOSIZE_HORIZONTAL(img_sz.hsize) |
-		EXYNOS_ORGOSIZE_VERTICAL(img_sz.vsize));
+	cfg = (EXYNOS_ORGOSIZE_HORIZONTAL(buf->buf.width) |
+		EXYNOS_ORGOSIZE_VERTICAL(buf->buf.height));
 
 	fimc_write(ctx, cfg, EXYNOS_ORGOSIZE);
 
-	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", pos->x, pos->y, pos->w, pos->h);
+	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", buf->rect.x, buf->rect.y,
+		buf->rect.w, buf->rect.h);
 
 	/* CSC ITU */
 	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
 	cfg &= ~EXYNOS_CIGCTRL_CSC_MASK;
 
-	if (sz->hsize >= FIMC_WIDTH_ITU_709)
+	if (buf->buf.width >= FIMC_WIDTH_ITU_709)
 		cfg |= EXYNOS_CIGCTRL_CSC_ITU709;
 	else
 		cfg |= EXYNOS_CIGCTRL_CSC_ITU601;
 
 	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
 
-	if (swap) {
-		img_pos.w = pos->h;
-		img_pos.h = pos->w;
-		img_sz.hsize = sz->vsize;
-		img_sz.vsize = sz->hsize;
-	}
-
 	/* target image size */
 	cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
 	cfg &= ~(EXYNOS_CITRGFMT_TARGETH_MASK |
 		EXYNOS_CITRGFMT_TARGETV_MASK);
-	cfg |= (EXYNOS_CITRGFMT_TARGETHSIZE(img_pos.w) |
-		EXYNOS_CITRGFMT_TARGETVSIZE(img_pos.h));
+	cfg |= (EXYNOS_CITRGFMT_TARGETHSIZE(buf->rect.w) |
+		EXYNOS_CITRGFMT_TARGETVSIZE(buf->rect.h));
 	fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
 
 	/* target area */
-	cfg = EXYNOS_CITAREA_TARGET_AREA(img_pos.w * img_pos.h);
+	cfg = EXYNOS_CITAREA_TARGET_AREA(buf->rect.w * buf->rect.h);
 	fimc_write(ctx, cfg, EXYNOS_CITAREA);
 
 	/* offset Y(RGB), Cb, Cr */
-	cfg = (EXYNOS_CIOYOFF_HORIZONTAL(img_pos.x) |
-		EXYNOS_CIOYOFF_VERTICAL(img_pos.y));
+	cfg = (EXYNOS_CIOYOFF_HORIZONTAL(buf->rect.x) |
+		EXYNOS_CIOYOFF_VERTICAL(buf->rect.y));
 	fimc_write(ctx, cfg, EXYNOS_CIOYOFF);
-	cfg = (EXYNOS_CIOCBOFF_HORIZONTAL(img_pos.x) |
-		EXYNOS_CIOCBOFF_VERTICAL(img_pos.y));
+	cfg = (EXYNOS_CIOCBOFF_HORIZONTAL(buf->rect.x) |
+		EXYNOS_CIOCBOFF_VERTICAL(buf->rect.y));
 	fimc_write(ctx, cfg, EXYNOS_CIOCBOFF);
-	cfg = (EXYNOS_CIOCROFF_HORIZONTAL(img_pos.x) |
-		EXYNOS_CIOCROFF_VERTICAL(img_pos.y));
+	cfg = (EXYNOS_CIOCROFF_HORIZONTAL(buf->rect.x) |
+		EXYNOS_CIOCROFF_VERTICAL(buf->rect.y));
 	fimc_write(ctx, cfg, EXYNOS_CIOCROFF);
 
 	return 0;
 }
 
 static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
-		enum drm_exynos_ipp_buf_type buf_type)
+		bool enqueue)
 {
 	unsigned long flags;
 	u32 buf_num;
 	u32 cfg;
 
-	DRM_DEBUG_KMS("buf_id[%d]buf_type[%d]\n", buf_id, buf_type);
+	DRM_DEBUG_KMS("buf_id[%d]enqueu[%d]\n", buf_id, enqueue);
 
 	spin_lock_irqsave(&ctx->lock, flags);
 
 	cfg = fimc_read(ctx, EXYNOS_CIFCNTSEQ);
 
-	if (buf_type == IPP_BUF_ENQUEUE)
+	if (enqueue)
 		cfg |= (1 << buf_id);
 	else
 		cfg &= ~(1 << buf_id);
@@ -1104,88 +954,31 @@ static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 
 	buf_num = hweight32(cfg);
 
-	if (buf_type == IPP_BUF_ENQUEUE && buf_num >= FIMC_BUF_START)
+	if (enqueue && buf_num >= FIMC_BUF_START)
 		fimc_mask_irq(ctx, true);
-	else if (buf_type == IPP_BUF_DEQUEUE && buf_num <= FIMC_BUF_STOP)
+	else if (!enqueue && buf_num <= FIMC_BUF_STOP)
 		fimc_mask_irq(ctx, false);
 
 	spin_unlock_irqrestore(&ctx->lock, flags);
 }
 
-static int fimc_dst_set_addr(struct device *dev,
-		struct drm_exynos_ipp_buf_info *buf_info, u32 buf_id,
-		enum drm_exynos_ipp_buf_type buf_type)
+static int fimc_dst_set_addr(struct fimc_context *ctx,
+			     struct exynos_drm_ipp_buffer *buf)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_property *property;
-	struct drm_exynos_ipp_config *config;
+	fimc_write(ctx, buf->dma_addr[0], EXYNOS_CIOYSA(0));
+	fimc_write(ctx, buf->dma_addr[1], EXYNOS_CIOCBSA(0));
+	fimc_write(ctx, buf->dma_addr[2], EXYNOS_CIOCRSA(0));
 
-	if (!c_node) {
-		DRM_ERROR("failed to get c_node.\n");
-		return -EINVAL;
-	}
-
-	property = &c_node->property;
-
-	DRM_DEBUG_KMS("prop_id[%d]buf_id[%d]buf_type[%d]\n",
-		property->prop_id, buf_id, buf_type);
-
-	if (buf_id > FIMC_MAX_DST) {
-		dev_info(ippdrv->dev, "invalid buf_id %d.\n", buf_id);
-		return -ENOMEM;
-	}
-
-	/* address register set */
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		config = &property->config[EXYNOS_DRM_OPS_DST];
-
-		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
-			EXYNOS_CIOYSA(buf_id));
-
-		if (config->fmt == DRM_FORMAT_YVU420) {
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
-				EXYNOS_CIOCBSA(buf_id));
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
-				EXYNOS_CIOCRSA(buf_id));
-		} else {
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
-				EXYNOS_CIOCBSA(buf_id));
-			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
-				EXYNOS_CIOCRSA(buf_id));
-		}
-		break;
-	case IPP_BUF_DEQUEUE:
-		fimc_write(ctx, 0x0, EXYNOS_CIOYSA(buf_id));
-		fimc_write(ctx, 0x0, EXYNOS_CIOCBSA(buf_id));
-		fimc_write(ctx, 0x0, EXYNOS_CIOCRSA(buf_id));
-		break;
-	default:
-		/* bypass */
-		break;
-	}
-
-	fimc_dst_set_buf_seq(ctx, buf_id, buf_type);
+	fimc_dst_set_buf_seq(ctx, 0, true);
 
 	return 0;
 }
 
-static struct exynos_drm_ipp_ops fimc_dst_ops = {
-	.set_fmt = fimc_dst_set_fmt,
-	.set_transf = fimc_dst_set_transf,
-	.set_size = fimc_dst_set_size,
-	.set_addr = fimc_dst_set_addr,
-};
+static void fimc_stop(struct fimc_context *ctx);
 
 static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 {
 	struct fimc_context *ctx = dev_id;
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_event_work *event_work =
-		c_node->event_work;
 	int buf_id;
 
 	DRM_DEBUG_KMS("fimc id[%d]\n", ctx->id);
@@ -1203,170 +996,19 @@ static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 
 	DRM_DEBUG_KMS("buf_id[%d]\n", buf_id);
 
-	fimc_dst_set_buf_seq(ctx, buf_id, IPP_BUF_DEQUEUE);
+	if (ctx->task) {
+		struct exynos_drm_ipp_task *task = ctx->task;
 
-	event_work->ippdrv = ippdrv;
-	event_work->buf_id[EXYNOS_DRM_OPS_DST] = buf_id;
-	queue_work(ippdrv->event_workq, &event_work->work);
-
-	return IRQ_HANDLED;
-}
-
-static int fimc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
-{
-	struct drm_exynos_ipp_prop_list *prop_list = &ippdrv->prop_list;
-
-	prop_list->version = 1;
-	prop_list->writeback = 1;
-	prop_list->refresh_min = FIMC_REFRESH_MIN;
-	prop_list->refresh_max = FIMC_REFRESH_MAX;
-	prop_list->flip = (1 << EXYNOS_DRM_FLIP_NONE) |
-				(1 << EXYNOS_DRM_FLIP_VERTICAL) |
-				(1 << EXYNOS_DRM_FLIP_HORIZONTAL);
-	prop_list->degree = (1 << EXYNOS_DRM_DEGREE_0) |
-				(1 << EXYNOS_DRM_DEGREE_90) |
-				(1 << EXYNOS_DRM_DEGREE_180) |
-				(1 << EXYNOS_DRM_DEGREE_270);
-	prop_list->csc = 1;
-	prop_list->crop = 1;
-	prop_list->crop_max.hsize = FIMC_CROP_MAX;
-	prop_list->crop_max.vsize = FIMC_CROP_MAX;
-	prop_list->crop_min.hsize = FIMC_CROP_MIN;
-	prop_list->crop_min.vsize = FIMC_CROP_MIN;
-	prop_list->scale = 1;
-	prop_list->scale_max.hsize = FIMC_SCALE_MAX;
-	prop_list->scale_max.vsize = FIMC_SCALE_MAX;
-	prop_list->scale_min.hsize = FIMC_SCALE_MIN;
-	prop_list->scale_min.vsize = FIMC_SCALE_MIN;
-
-	return 0;
-}
-
-static inline bool fimc_check_drm_flip(enum drm_exynos_flip flip)
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
+		ctx->task = NULL;
+		pm_runtime_mark_last_busy(ctx->dev);
+		pm_runtime_put_autosuspend(ctx->dev);
+		exynos_drm_ipp_task_done(task, 0);
 	}
-}
-
-static int fimc_ippdrv_check_property(struct device *dev,
-		struct drm_exynos_ipp_property *property)
-{
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_prop_list *pp = &ippdrv->prop_list;
-	struct drm_exynos_ipp_config *config;
-	struct drm_exynos_pos *pos;
-	struct drm_exynos_sz *sz;
-	bool swap;
-	int i;
 
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
-		if (!fimc_check_drm_flip(config->flip)) {
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
-
-		/* check for buffer bound */
-		if ((pos->x + pos->w > sz->hsize) ||
-			(pos->y + pos->h > sz->vsize)) {
-			DRM_ERROR("out of buf bound.\n");
-			goto err_property;
-		}
-
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
-
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
-	}
-
-	return 0;
+	fimc_dst_set_buf_seq(ctx, buf_id, false);
+	fimc_stop(ctx);
 
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
-	}
-
-	return -EINVAL;
+	return IRQ_HANDLED;
 }
 
 static void fimc_clear_addr(struct fimc_context *ctx)
@@ -1386,10 +1028,8 @@ static void fimc_clear_addr(struct fimc_context *ctx)
 	}
 }
 
-static int fimc_ippdrv_reset(struct device *dev)
+static int fimc_reset(struct fimc_context *ctx)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-
 	/* reset h/w block */
 	fimc_sw_reset(ctx);
 
@@ -1401,78 +1041,24 @@ static int fimc_ippdrv_reset(struct device *dev)
 	return 0;
 }
 
-static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
+static int fimc_start(struct fimc_context *ctx)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_property *property;
-	struct drm_exynos_ipp_config *config;
-	struct drm_exynos_pos	img_pos[EXYNOS_DRM_OPS_MAX];
-	struct drm_exynos_ipp_set_wb set_wb;
-	int ret, i;
 	u32 cfg0, cfg1;
 
-	DRM_DEBUG_KMS("cmd[%d]\n", cmd);
-
-	if (!c_node) {
-		DRM_ERROR("failed to get c_node.\n");
-		return -EINVAL;
-	}
-
-	property = &c_node->property;
-
 	fimc_mask_irq(ctx, true);
 
-	for_each_ipp_ops(i) {
-		config = &property->config[i];
-		img_pos[i] = config->pos;
-	}
-
-	ret = fimc_set_prescaler(ctx, &ctx->sc,
-		&img_pos[EXYNOS_DRM_OPS_SRC],
-		&img_pos[EXYNOS_DRM_OPS_DST]);
-	if (ret) {
-		dev_err(dev, "failed to set prescaler.\n");
-		return ret;
-	}
-
 	/* If set ture, we can save jpeg about screen */
 	fimc_handle_jpeg(ctx, false);
 	fimc_set_scaler(ctx, &ctx->sc);
 
-	switch (cmd) {
-	case IPP_CMD_M2M:
-		fimc_set_type_ctrl(ctx, FIMC_WB_NONE);
-		fimc_handle_lastend(ctx, false);
+	fimc_set_type_ctrl(ctx);
+	fimc_handle_lastend(ctx, false);
 
-		/* setup dma */
-		cfg0 = fimc_read(ctx, EXYNOS_MSCTRL);
-		cfg0 &= ~EXYNOS_MSCTRL_INPUT_MASK;
-		cfg0 |= EXYNOS_MSCTRL_INPUT_MEMORY;
-		fimc_write(ctx, cfg0, EXYNOS_MSCTRL);
-		break;
-	case IPP_CMD_WB:
-		fimc_set_type_ctrl(ctx, FIMC_WB_A);
-		fimc_handle_lastend(ctx, true);
-
-		/* setup FIMD */
-		ret = fimc_set_camblk_fimd0_wb(ctx);
-		if (ret < 0) {
-			dev_err(dev, "camblk setup failed.\n");
-			return ret;
-		}
-
-		set_wb.enable = 1;
-		set_wb.refresh = property->refresh_rate;
-		exynos_drm_ippnb_send_event(IPP_SET_WRITEBACK, (void *)&set_wb);
-		break;
-	case IPP_CMD_OUTPUT:
-	default:
-		ret = -EINVAL;
-		dev_err(dev, "invalid operations.\n");
-		return ret;
-	}
+	/* setup dma */
+	cfg0 = fimc_read(ctx, EXYNOS_MSCTRL);
+	cfg0 &= ~EXYNOS_MSCTRL_INPUT_MASK;
+	cfg0 |= EXYNOS_MSCTRL_INPUT_MEMORY;
+	fimc_write(ctx, cfg0, EXYNOS_MSCTRL);
 
 	/* Reset status */
 	fimc_write(ctx, 0x0, EXYNOS_CISTATUS);
@@ -1498,36 +1084,20 @@ static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 
 	fimc_clear_bits(ctx, EXYNOS_CIOCTRL, EXYNOS_CIOCTRL_WEAVE_MASK);
 
-	if (cmd == IPP_CMD_M2M)
-		fimc_set_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
+	fimc_set_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
 
 	return 0;
 }
 
-static void fimc_ippdrv_stop(struct device *dev, enum drm_exynos_ipp_cmd cmd)
+static void fimc_stop(struct fimc_context *ctx)
 {
-	struct fimc_context *ctx = get_fimc_context(dev);
-	struct drm_exynos_ipp_set_wb set_wb = {0, 0};
 	u32 cfg;
 
-	DRM_DEBUG_KMS("cmd[%d]\n", cmd);
-
-	switch (cmd) {
-	case IPP_CMD_M2M:
-		/* Source clear */
-		cfg = fimc_read(ctx, EXYNOS_MSCTRL);
-		cfg &= ~EXYNOS_MSCTRL_INPUT_MASK;
-		cfg &= ~EXYNOS_MSCTRL_ENVID;
-		fimc_write(ctx, cfg, EXYNOS_MSCTRL);
-		break;
-	case IPP_CMD_WB:
-		exynos_drm_ippnb_send_event(IPP_SET_WRITEBACK, (void *)&set_wb);
-		break;
-	case IPP_CMD_OUTPUT:
-	default:
-		dev_err(dev, "invalid operations.\n");
-		break;
-	}
+	/* Source clear */
+	cfg = fimc_read(ctx, EXYNOS_MSCTRL);
+	cfg &= ~EXYNOS_MSCTRL_INPUT_MASK;
+	cfg &= ~EXYNOS_MSCTRL_ENVID;
+	fimc_write(ctx, cfg, EXYNOS_MSCTRL);
 
 	fimc_mask_irq(ctx, false);
 
@@ -1545,6 +1115,87 @@ static void fimc_ippdrv_stop(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 	fimc_set_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_IRQ_END_DISABLE);
 }
 
+static int fimc_commit(struct exynos_drm_ipp *ipp,
+			  struct exynos_drm_ipp_task *task)
+{
+	struct fimc_context *ctx =
+			container_of(ipp, struct fimc_context, ipp);
+
+	pm_runtime_get_sync(ctx->dev);
+	ctx->task = task;
+
+	fimc_src_set_fmt(ctx, task->src.buf.fourcc);
+	fimc_src_set_size(ctx, &task->src);
+	fimc_src_set_transf(ctx, DRM_MODE_ROTATE_0);
+	fimc_src_set_addr(ctx, &task->src);
+	fimc_dst_set_fmt(ctx, task->dst.buf.fourcc);
+	fimc_dst_set_transf(ctx, task->transform.rotation);
+	fimc_dst_set_size(ctx, &task->dst);
+	fimc_dst_set_addr(ctx, &task->dst);
+	fimc_set_prescaler(ctx, &ctx->sc, &task->src.rect, &task->dst.rect);
+	fimc_start(ctx);
+
+	return 0;
+}
+
+static void fimc_abort(struct exynos_drm_ipp *ipp,
+			  struct exynos_drm_ipp_task *task)
+{
+	struct fimc_context *ctx =
+			container_of(ipp, struct fimc_context, ipp);
+
+	fimc_reset(ctx);
+
+	if (ctx->task) {
+		struct exynos_drm_ipp_task *task = ctx->task;
+
+		ctx->task = NULL;
+		pm_runtime_mark_last_busy(ctx->dev);
+		pm_runtime_put_autosuspend(ctx->dev);
+		exynos_drm_ipp_task_done(task, -EIO);
+	}
+}
+
+static struct exynos_drm_ipp_funcs ipp_funcs = {
+	.commit = fimc_commit,
+	.abort = fimc_abort,
+};
+
+static int fimc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct fimc_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_ipp *ipp = &ctx->ipp;
+
+	ctx->drm_dev = drm_dev;
+	drm_iommu_attach_device(drm_dev, dev);
+
+	exynos_drm_ipp_register(drm_dev, ipp, &ipp_funcs,
+			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
+			   DRM_EXYNOS_IPP_CAP_SCALE | DRM_EXYNOS_IPP_CAP_CONVERT,
+			   ctx->formats, "fimc");
+
+	dev_info(dev, "The exynos fimc is probed successfully\n");
+
+	return 0;
+}
+
+static void fimc_unbind(struct device *dev, struct device *master,
+			void *data)
+{
+	struct fimc_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_ipp *ipp = &ctx->ipp;
+
+	exynos_drm_ipp_unregister(drm_dev, ipp);
+	drm_iommu_detach_device(drm_dev, dev);
+}
+
+static const struct component_ops fimc_component_ops = {
+	.bind	= fimc_bind,
+	.unbind = fimc_unbind,
+};
+
 static void fimc_put_clocks(struct fimc_context *ctx)
 {
 	int i;
@@ -1559,7 +1210,7 @@ static void fimc_put_clocks(struct fimc_context *ctx)
 
 static int fimc_setup_clocks(struct fimc_context *ctx)
 {
-	struct device *fimc_dev = ctx->ippdrv.dev;
+	struct device *fimc_dev = ctx->dev;
 	struct device *dev;
 	int ret, i;
 
@@ -1574,8 +1225,6 @@ static int fimc_setup_clocks(struct fimc_context *ctx)
 
 		ctx->clocks[i] = clk_get(dev, fimc_clock_names[i]);
 		if (IS_ERR(ctx->clocks[i])) {
-			if (i >= FIMC_CLK_MUX)
-				break;
 			ret = PTR_ERR(ctx->clocks[i]);
 			dev_err(fimc_dev, "failed to get clock: %s\n",
 						fimc_clock_names[i]);
@@ -1583,20 +1232,6 @@ static int fimc_setup_clocks(struct fimc_context *ctx)
 		}
 	}
 
-	/* Optional FIMC LCLK parent clock setting */
-	if (!IS_ERR(ctx->clocks[FIMC_CLK_PARENT])) {
-		ret = clk_set_parent(ctx->clocks[FIMC_CLK_MUX],
-				     ctx->clocks[FIMC_CLK_PARENT]);
-		if (ret < 0) {
-			dev_err(fimc_dev, "failed to set parent.\n");
-			goto e_clk_free;
-		}
-	}
-
-	ret = clk_set_rate(ctx->clocks[FIMC_CLK_LCLK], ctx->clk_frequency);
-	if (ret < 0)
-		goto e_clk_free;
-
 	ret = clk_prepare_enable(ctx->clocks[FIMC_CLK_LCLK]);
 	if (!ret)
 		return ret;
@@ -1605,22 +1240,42 @@ static int fimc_setup_clocks(struct fimc_context *ctx)
 	return ret;
 }
 
+static const unsigned int fimc_formats[] = {
+	DRM_FORMAT_XRGB8888, DRM_FORMAT_RGB565,
+	DRM_FORMAT_NV12, DRM_FORMAT_NV16, DRM_FORMAT_NV21, DRM_FORMAT_NV61,
+	DRM_FORMAT_UYVY, DRM_FORMAT_VYUY, DRM_FORMAT_YUYV, DRM_FORMAT_YVYU,
+	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420, DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+};
+
+static const struct drm_exynos_ipp_limit fimc_4210_limits_v1[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = {32, 8192, 8}, .v = {32, 8192, 2}) },
+	{ IPP_SIZE_LIMIT(AREA, .h = {32, 4224, 2}, .v = {32, 0, 2}) },
+	{ IPP_SIZE_LIMIT(ROTATED, .h = {128, 1920}, .v = {128, 0}) },
+	{ IPP_SCALE_LIMIT(.h = { (1 << 16) / 64, (1 << 16) * 64},
+			  .v = { (1 << 16) / 64, (1 << 16) * 64}) },
+	{ }
+};
+
+static const struct drm_exynos_ipp_limit fimc_4210_limits_v2[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = {32, 8192, 8}, .v = {32, 8192, 2}) },
+	{ IPP_SIZE_LIMIT(AREA, .h = {32, 1920, 2}, .v = {32, 0, 2}) },
+	{ IPP_SIZE_LIMIT(ROTATED, .h = {128, 1366}, .v = {128, 0}) },
+	{ IPP_SCALE_LIMIT(.h = { (1 << 16) / 64, (1 << 16) * 64},
+			  .v = { (1 << 16) / 64, (1 << 16) * 64}) },
+	{ }
+};
+
 static int fimc_parse_dt(struct fimc_context *ctx)
 {
-	struct device_node *node = ctx->ippdrv.dev->of_node;
+	struct device_node *node = ctx->dev->of_node;
 
-	/* Handle only devices that support the LCD Writeback data path */
-	if (!of_property_read_bool(node, "samsung,lcd-wb"))
+	if (exynos_drm_check_shared_device(ctx->dev) != 0)
 		return -ENODEV;
 
-	if (of_property_read_u32(node, "clock-frequency",
-					&ctx->clk_frequency))
-		ctx->clk_frequency = FIMC_DEFAULT_LCLK_FREQUENCY;
-
 	ctx->id = of_alias_get_id(node, "fimc");
-
 	if (ctx->id < 0) {
-		dev_err(ctx->ippdrv.dev, "failed to get node alias id.\n");
+		dev_err(ctx->dev, "failed to get node alias id.\n");
 		return -EINVAL;
 	}
 
@@ -1629,11 +1284,13 @@ static int fimc_parse_dt(struct fimc_context *ctx)
 
 static int fimc_probe(struct platform_device *pdev)
 {
+	const struct drm_exynos_ipp_limit *limits;
+	struct exynos_drm_ipp_formats *formats;
 	struct device *dev = &pdev->dev;
 	struct fimc_context *ctx;
 	struct resource *res;
-	struct exynos_drm_ippdrv *ippdrv;
 	int ret;
+	int i;
 
 	if (!dev->of_node) {
 		dev_err(dev, "device tree node not found.\n");
@@ -1644,18 +1301,26 @@ static int fimc_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->ippdrv.dev = dev;
+	ctx->dev = dev;
 
 	ret = fimc_parse_dt(ctx);
 	if (ret < 0)
 		return ret;
 
-	ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
-						"samsung,sysreg");
-	if (IS_ERR(ctx->sysreg)) {
-		dev_err(dev, "syscon regmap lookup failed.\n");
-		return PTR_ERR(ctx->sysreg);
+	/* construct formats/limits array */
+	formats = devm_kzalloc(dev, sizeof(*formats) *
+			       (ARRAY_SIZE(fimc_formats) + 1), GFP_KERNEL);
+	if (!formats)
+		return -ENOMEM;
+
+	limits = (ctx->id < 3) ? fimc_4210_limits_v1 : fimc_4210_limits_v2;
+	for (i = 0; i < ARRAY_SIZE(fimc_formats); i++) {
+		formats[i].fourcc = fimc_formats[i];
+		formats[i].type = DRM_EXYNOS_IPP_FORMAT_SOURCE |
+				  DRM_EXYNOS_IPP_FORMAT_DESTINATION;
+		formats[i].limits = limits;
 	}
+	ctx->formats = formats;
 
 	/* resource memory */
 	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1670,9 +1335,8 @@ static int fimc_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	ctx->irq = res->start;
-	ret = devm_request_threaded_irq(dev, ctx->irq, NULL, fimc_irq_handler,
-		IRQF_ONESHOT, "drm_fimc", ctx);
+	ret = devm_request_irq(dev, res->start, fimc_irq_handler,
+		0, dev_name(dev), ctx);
 	if (ret < 0) {
 		dev_err(dev, "failed to request irq.\n");
 		return ret;
@@ -1682,39 +1346,24 @@ static int fimc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ippdrv = &ctx->ippdrv;
-	ippdrv->ops[EXYNOS_DRM_OPS_SRC] = &fimc_src_ops;
-	ippdrv->ops[EXYNOS_DRM_OPS_DST] = &fimc_dst_ops;
-	ippdrv->check_property = fimc_ippdrv_check_property;
-	ippdrv->reset = fimc_ippdrv_reset;
-	ippdrv->start = fimc_ippdrv_start;
-	ippdrv->stop = fimc_ippdrv_stop;
-	ret = fimc_init_prop_list(ippdrv);
-	if (ret < 0) {
-		dev_err(dev, "failed to init property list.\n");
-		goto err_put_clk;
-	}
-
-	DRM_DEBUG_KMS("id[%d]ippdrv[%pK]\n", ctx->id, ippdrv);
-
 	spin_lock_init(&ctx->lock);
 	platform_set_drvdata(pdev, ctx);
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, FIMC_AUTOSUSPEND_DELAY);
 	pm_runtime_enable(dev);
 
-	ret = exynos_drm_ippdrv_register(ippdrv);
-	if (ret < 0) {
-		dev_err(dev, "failed to register drm fimc device.\n");
+	ret = component_add(dev, &fimc_component_ops);
+	if (ret)
 		goto err_pm_dis;
-	}
 
 	dev_info(dev, "drm fimc registered successfully.\n");
 
 	return 0;
 
 err_pm_dis:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-err_put_clk:
 	fimc_put_clocks(ctx);
 
 	return ret;
@@ -1724,42 +1373,24 @@ static int fimc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fimc_context *ctx = get_fimc_context(dev);
-	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 
-	exynos_drm_ippdrv_unregister(ippdrv);
+	component_del(dev, &fimc_component_ops);
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
 
 	fimc_put_clocks(ctx);
-	pm_runtime_set_suspended(dev);
-	pm_runtime_disable(dev);
 
 	return 0;
 }
 
 #ifdef CONFIG_PM
-static int fimc_clk_ctrl(struct fimc_context *ctx, bool enable)
-{
-	DRM_DEBUG_KMS("enable[%d]\n", enable);
-
-	if (enable) {
-		clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
-		clk_prepare_enable(ctx->clocks[FIMC_CLK_WB_A]);
-		ctx->suspended = false;
-	} else {
-		clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
-		clk_disable_unprepare(ctx->clocks[FIMC_CLK_WB_A]);
-		ctx->suspended = true;
-	}
-
-	return 0;
-}
-
 static int fimc_runtime_suspend(struct device *dev)
 {
 	struct fimc_context *ctx = get_fimc_context(dev);
 
 	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
-
-	return  fimc_clk_ctrl(ctx, false);
+	clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
+	return 0;
 }
 
 static int fimc_runtime_resume(struct device *dev)
@@ -1767,8 +1398,7 @@ static int fimc_runtime_resume(struct device *dev)
 	struct fimc_context *ctx = get_fimc_context(dev);
 
 	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
-
-	return  fimc_clk_ctrl(ctx, true);
+	return clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
 }
 #endif
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.h b/drivers/gpu/drm/exynos/exynos_drm_fimc.h
deleted file mode 100644
index 127a424c5fdf..000000000000
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.h
+++ /dev/null
@@ -1,23 +0,0 @@
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
-#ifndef _EXYNOS_DRM_FIMC_H_
-#define _EXYNOS_DRM_FIMC_H_
-
-/*
- * TODO
- * FIMD output interface notifier callback.
- */
-
-#endif /* _EXYNOS_DRM_FIMC_H_ */
-- 
2.14.2
