From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/9] drm/exynos: rotator: Convert driver to IPP v2 core
 API
Date: Fri, 29 Sep 2017 09:32:48 +0200
Message-ID: <1506670374-15689-4-git-send-email-m.szyprowski@samsung.com>
References: <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929073301eucas1p1b88a1d771571fed3937ad57c7fb932d9@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58923 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbdI2HdF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 03:33:05 -0400
In-reply-to: <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>

This patch adapts Exynos DRM rotator driver to new IPP v2 core API.
The side effect of this conversion is a switch to driver component API
to register properly in the Exynos DRM core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig              |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   1 +
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 735 +++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_rotator.h |  19 -
 4 files changed, 172 insertions(+), 585 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 2e097a81df12..c10c9ca0d8b4 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -105,7 +105,7 @@ config DRM_EXYNOS_FIMC
 
 config DRM_EXYNOS_ROTATOR
 	bool "Rotator"
-	depends on BROKEN
+	select DRM_EXYNOS_IPP
 	help
 	  Choose this option if you want to use Exynos Rotator for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index de4cce258a5b..3ade2b0ad15d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -257,6 +257,7 @@ struct exynos_drm_driver_info {
 		DRV_PTR(fimc_driver, CONFIG_DRM_EXYNOS_FIMC),
 	}, {
 		DRV_PTR(rotator_driver, CONFIG_DRM_EXYNOS_ROTATOR),
+		DRM_COMPONENT_DRIVER
 	}, {
 		DRV_PTR(gsc_driver, CONFIG_DRM_EXYNOS_GSC),
 	}, {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 79282a820ecc..f478073d6c37 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/component.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -22,29 +23,16 @@
 #include <drm/exynos_drm.h>
 #include "regs-rotator.h"
 #include "exynos_drm_drv.h"
+#include "exynos_drm_iommu.h"
 #include "exynos_drm_ipp.h"
 
 /*
  * Rotator supports image crop/rotator and input/output DMA operations.
  * input DMA reads image data from the memory.
  * output DMA writes image data to memory.
- *
- * M2M operation : supports crop/scale/rotation/csc so on.
- * Memory ----> Rotator H/W ----> Memory.
- */
-
-/*
- * TODO
- * 1. check suspend/resume api if needed.
- * 2. need to check use case platform_device_id.
- * 3. check src/dst size with, height.
- * 4. need to add supported list in prop_list.
  */
 
-#define get_rot_context(dev)	platform_get_drvdata(to_platform_device(dev))
-#define get_ctx_from_ippdrv(ippdrv)	container_of(ippdrv,\
-					struct rot_context, ippdrv);
-#define rot_read(offset)		readl(rot->regs + (offset))
+#define rot_read(offset)	readl(rot->regs + (offset))
 #define rot_write(cfg, offset)	writel(cfg, rot->regs + (offset))
 
 enum rot_irq_status {
@@ -53,53 +41,21 @@ enum rot_irq_status {
 };
 
 /*
- * A structure of limitation.
- *
- * @min_w: minimum width.
- * @min_h: minimum height.
- * @max_w: maximum width.
- * @max_h: maximum height.
- * @align: align size.
- */
-struct rot_limit {
-	u32	min_w;
-	u32	min_h;
-	u32	max_w;
-	u32	max_h;
-	u32	align;
-};
-
-/*
- * A structure of limitation table.
- *
- * @ycbcr420_2p: case of YUV.
- * @rgb888: case of RGB.
- */
-struct rot_limit_table {
-	struct rot_limit	ycbcr420_2p;
-	struct rot_limit	rgb888;
-};
-
-/*
  * A structure of rotator context.
  * @ippdrv: prepare initialization using ippdrv.
- * @regs_res: register resources.
  * @regs: memory mapped io registers.
  * @clock: rotator gate clock.
  * @limit_tbl: limitation of rotator.
  * @irq: irq number.
- * @cur_buf_id: current operation buffer id.
- * @suspended: suspended state.
  */
 struct rot_context {
-	struct exynos_drm_ippdrv	ippdrv;
-	struct resource	*regs_res;
+	struct exynos_drm_ipp ipp;
+	struct drm_device *drm_dev;
+	struct device	*dev;
 	void __iomem	*regs;
 	struct clk	*clock;
-	struct rot_limit_table	*limit_tbl;
-	int	irq;
-	int	cur_buf_id[EXYNOS_DRM_OPS_MAX];
-	bool	suspended;
+	const struct exynos_drm_ipp_formats *formats;
+	struct exynos_drm_ipp_task	*task;
 };
 
 static void rotator_reg_set_irq(struct rot_context *rot, bool enable)
@@ -114,15 +70,6 @@ static void rotator_reg_set_irq(struct rot_context *rot, bool enable)
 	rot_write(val, ROT_CONFIG);
 }
 
-static u32 rotator_reg_get_fmt(struct rot_context *rot)
-{
-	u32 val = rot_read(ROT_CONTROL);
-
-	val &= ROT_CONTROL_FMT_MASK;
-
-	return val;
-}
-
 static enum rot_irq_status rotator_reg_get_irq_status(struct rot_context *rot)
 {
 	u32 val = rot_read(ROT_STATUS);
@@ -138,9 +85,6 @@ static enum rot_irq_status rotator_reg_get_irq_status(struct rot_context *rot)
 static irqreturn_t rotator_irq_handler(int irq, void *arg)
 {
 	struct rot_context *rot = arg;
-	struct exynos_drm_ippdrv *ippdrv = &rot->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_event_work *event_work = c_node->event_work;
 	enum rot_irq_status irq_status;
 	u32 val;
 
@@ -152,56 +96,20 @@ static irqreturn_t rotator_irq_handler(int irq, void *arg)
 	val |= ROT_STATUS_IRQ_PENDING((u32)irq_status);
 	rot_write(val, ROT_STATUS);
 
-	if (irq_status == ROT_IRQ_STATUS_COMPLETE) {
-		event_work->ippdrv = ippdrv;
-		event_work->buf_id[EXYNOS_DRM_OPS_DST] =
-			rot->cur_buf_id[EXYNOS_DRM_OPS_DST];
-		queue_work(ippdrv->event_workq, &event_work->work);
-	} else {
-		DRM_ERROR("the SFR is set illegally\n");
+	if (rot->task) {
+		struct exynos_drm_ipp_task *task = rot->task;
+
+		rot->task = NULL;
+		pm_runtime_put(rot->dev);
+		exynos_drm_ipp_task_done(task,
+			irq_status == ROT_IRQ_STATUS_COMPLETE ? 0 : -EINVAL);
 	}
 
 	return IRQ_HANDLED;
 }
 
-static void rotator_align_size(struct rot_context *rot, u32 fmt, u32 *hsize,
-		u32 *vsize)
-{
-	struct rot_limit_table *limit_tbl = rot->limit_tbl;
-	struct rot_limit *limit;
-	u32 mask, val;
-
-	/* Get size limit */
-	if (fmt == ROT_CONTROL_FMT_RGB888)
-		limit = &limit_tbl->rgb888;
-	else
-		limit = &limit_tbl->ycbcr420_2p;
-
-	/* Get mask for rounding to nearest aligned val */
-	mask = ~((1 << limit->align) - 1);
-
-	/* Set aligned width */
-	val = ROT_ALIGN(*hsize, limit->align, mask);
-	if (val < limit->min_w)
-		*hsize = ROT_MIN(limit->min_w, mask);
-	else if (val > limit->max_w)
-		*hsize = ROT_MAX(limit->max_w, mask);
-	else
-		*hsize = val;
-
-	/* Set aligned height */
-	val = ROT_ALIGN(*vsize, limit->align, mask);
-	if (val < limit->min_h)
-		*vsize = ROT_MIN(limit->min_h, mask);
-	else if (val > limit->max_h)
-		*vsize = ROT_MAX(limit->max_h, mask);
-	else
-		*vsize = val;
-}
-
-static int rotator_src_set_fmt(struct device *dev, u32 fmt)
+static int rotator_src_set_fmt(struct rot_context *rot, u32 fmt)
 {
-	struct rot_context *rot = dev_get_drvdata(dev);
 	u32 val;
 
 	val = rot_read(ROT_CONTROL);
@@ -214,9 +122,6 @@ static int rotator_src_set_fmt(struct device *dev, u32 fmt)
 	case DRM_FORMAT_XRGB8888:
 		val |= ROT_CONTROL_FMT_RGB888;
 		break;
-	default:
-		DRM_ERROR("invalid image format\n");
-		return -EINVAL;
 	}
 
 	rot_write(val, ROT_CONTROL);
@@ -224,505 +129,176 @@ static int rotator_src_set_fmt(struct device *dev, u32 fmt)
 	return 0;
 }
 
-static inline bool rotator_check_reg_fmt(u32 fmt)
-{
-	if ((fmt == ROT_CONTROL_FMT_YCBCR420_2P) ||
-	    (fmt == ROT_CONTROL_FMT_RGB888))
-		return true;
-
-	return false;
-}
-
-static int rotator_src_set_size(struct device *dev, int swap,
-		struct drm_exynos_pos *pos,
-		struct drm_exynos_sz *sz)
+static int rotator_src_set_buf(struct rot_context *rot,
+			       struct exynos_drm_ipp_buffer *buf)
 {
-	struct rot_context *rot = dev_get_drvdata(dev);
-	u32 fmt, hsize, vsize;
 	u32 val;
 
-	/* Get format */
-	fmt = rotator_reg_get_fmt(rot);
-	if (!rotator_check_reg_fmt(fmt)) {
-		DRM_ERROR("invalid format.\n");
-		return -EINVAL;
-	}
-
-	/* Align buffer size */
-	hsize = sz->hsize;
-	vsize = sz->vsize;
-	rotator_align_size(rot, fmt, &hsize, &vsize);
-
 	/* Set buffer size configuration */
-	val = ROT_SET_BUF_SIZE_H(vsize) | ROT_SET_BUF_SIZE_W(hsize);
+	val = ROT_SET_BUF_SIZE_H(buf->buf.height) |
+	      ROT_SET_BUF_SIZE_W(buf->buf.pitch[0] / buf->format->cpp[0]);
 	rot_write(val, ROT_SRC_BUF_SIZE);
 
 	/* Set crop image position configuration */
-	val = ROT_CROP_POS_Y(pos->y) | ROT_CROP_POS_X(pos->x);
+	val = ROT_CROP_POS_Y(buf->rect.y) | ROT_CROP_POS_X(buf->rect.x);
 	rot_write(val, ROT_SRC_CROP_POS);
-	val = ROT_SRC_CROP_SIZE_H(pos->h) | ROT_SRC_CROP_SIZE_W(pos->w);
+	val = ROT_SRC_CROP_SIZE_H(buf->rect.h) |
+	      ROT_SRC_CROP_SIZE_W(buf->rect.w);
 	rot_write(val, ROT_SRC_CROP_SIZE);
 
-	return 0;
-}
-
-static int rotator_src_set_addr(struct device *dev,
-		struct drm_exynos_ipp_buf_info *buf_info,
-		u32 buf_id, enum drm_exynos_ipp_buf_type buf_type)
-{
-	struct rot_context *rot = dev_get_drvdata(dev);
-	dma_addr_t addr[EXYNOS_DRM_PLANAR_MAX];
-	u32 val, fmt, hsize, vsize;
-	int i;
-
-	/* Set current buf_id */
-	rot->cur_buf_id[EXYNOS_DRM_OPS_SRC] = buf_id;
-
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		/* Set address configuration */
-		for_each_ipp_planar(i)
-			addr[i] = buf_info->base[i];
-
-		/* Get format */
-		fmt = rotator_reg_get_fmt(rot);
-		if (!rotator_check_reg_fmt(fmt)) {
-			DRM_ERROR("invalid format.\n");
-			return -EINVAL;
-		}
-
-		/* Re-set cb planar for NV12 format */
-		if ((fmt == ROT_CONTROL_FMT_YCBCR420_2P) &&
-		    !addr[EXYNOS_DRM_PLANAR_CB]) {
-
-			val = rot_read(ROT_SRC_BUF_SIZE);
-			hsize = ROT_GET_BUF_SIZE_W(val);
-			vsize = ROT_GET_BUF_SIZE_H(val);
-
-			/* Set cb planar */
-			addr[EXYNOS_DRM_PLANAR_CB] =
-				addr[EXYNOS_DRM_PLANAR_Y] + hsize * vsize;
-		}
-
-		for_each_ipp_planar(i)
-			rot_write(addr[i], ROT_SRC_BUF_ADDR(i));
-		break;
-	case IPP_BUF_DEQUEUE:
-		for_each_ipp_planar(i)
-			rot_write(0x0, ROT_SRC_BUF_ADDR(i));
-		break;
-	default:
-		/* Nothing to do */
-		break;
-	}
+	/* Set buffer DMA address */
+	rot_write(buf->dma_addr[0], ROT_SRC_BUF_ADDR(0));
+	rot_write(buf->dma_addr[1], ROT_SRC_BUF_ADDR(1));
 
 	return 0;
 }
 
-static int rotator_dst_set_transf(struct device *dev,
-		enum drm_exynos_degree degree,
-		enum drm_exynos_flip flip, bool *swap)
+static int rotator_dst_set_transf(struct rot_context *rot,
+				  unsigned int rotation)
 {
-	struct rot_context *rot = dev_get_drvdata(dev);
 	u32 val;
 
 	/* Set transform configuration */
 	val = rot_read(ROT_CONTROL);
 	val &= ~ROT_CONTROL_FLIP_MASK;
 
-	switch (flip) {
-	case EXYNOS_DRM_FLIP_VERTICAL:
-		val |= ROT_CONTROL_FLIP_VERTICAL;
-		break;
-	case EXYNOS_DRM_FLIP_HORIZONTAL:
+	if (rotation & DRM_MODE_REFLECT_X)
 		val |= ROT_CONTROL_FLIP_HORIZONTAL;
-		break;
-	default:
-		/* Flip None */
-		break;
-	}
+	if (rotation & DRM_MODE_REFLECT_Y)
+		val |= ROT_CONTROL_FLIP_VERTICAL;
 
 	val &= ~ROT_CONTROL_ROT_MASK;
 
-	switch (degree) {
-	case EXYNOS_DRM_DEGREE_90:
+	if (rotation & DRM_MODE_ROTATE_90)
 		val |= ROT_CONTROL_ROT_90;
-		break;
-	case EXYNOS_DRM_DEGREE_180:
+	else if (rotation & DRM_MODE_ROTATE_180)
 		val |= ROT_CONTROL_ROT_180;
-		break;
-	case EXYNOS_DRM_DEGREE_270:
+	else if (rotation & DRM_MODE_ROTATE_270)
 		val |= ROT_CONTROL_ROT_270;
-		break;
-	default:
-		/* Rotation 0 Degree */
-		break;
-	}
 
 	rot_write(val, ROT_CONTROL);
 
-	/* Check degree for setting buffer size swap */
-	if ((degree == EXYNOS_DRM_DEGREE_90) ||
-	    (degree == EXYNOS_DRM_DEGREE_270))
-		*swap = true;
-	else
-		*swap = false;
-
 	return 0;
 }
 
-static int rotator_dst_set_size(struct device *dev, int swap,
-		struct drm_exynos_pos *pos,
-		struct drm_exynos_sz *sz)
+static int rotator_dst_set_buf(struct rot_context *rot,
+			       struct exynos_drm_ipp_buffer *buf)
 {
-	struct rot_context *rot = dev_get_drvdata(dev);
-	u32 val, fmt, hsize, vsize;
-
-	/* Get format */
-	fmt = rotator_reg_get_fmt(rot);
-	if (!rotator_check_reg_fmt(fmt)) {
-		DRM_ERROR("invalid format.\n");
-		return -EINVAL;
-	}
-
-	/* Align buffer size */
-	hsize = sz->hsize;
-	vsize = sz->vsize;
-	rotator_align_size(rot, fmt, &hsize, &vsize);
+	u32 val;
 
 	/* Set buffer size configuration */
-	val = ROT_SET_BUF_SIZE_H(vsize) | ROT_SET_BUF_SIZE_W(hsize);
+	val = ROT_SET_BUF_SIZE_H(buf->buf.height) |
+	      ROT_SET_BUF_SIZE_W(buf->buf.pitch[0] / buf->format->cpp[0]);
 	rot_write(val, ROT_DST_BUF_SIZE);
 
 	/* Set crop image position configuration */
-	val = ROT_CROP_POS_Y(pos->y) | ROT_CROP_POS_X(pos->x);
+	val = ROT_CROP_POS_Y(buf->rect.y) | ROT_CROP_POS_X(buf->rect.x);
 	rot_write(val, ROT_DST_CROP_POS);
 
-	return 0;
-}
-
-static int rotator_dst_set_addr(struct device *dev,
-		struct drm_exynos_ipp_buf_info *buf_info,
-		u32 buf_id, enum drm_exynos_ipp_buf_type buf_type)
-{
-	struct rot_context *rot = dev_get_drvdata(dev);
-	dma_addr_t addr[EXYNOS_DRM_PLANAR_MAX];
-	u32 val, fmt, hsize, vsize;
-	int i;
-
-	/* Set current buf_id */
-	rot->cur_buf_id[EXYNOS_DRM_OPS_DST] = buf_id;
-
-	switch (buf_type) {
-	case IPP_BUF_ENQUEUE:
-		/* Set address configuration */
-		for_each_ipp_planar(i)
-			addr[i] = buf_info->base[i];
-
-		/* Get format */
-		fmt = rotator_reg_get_fmt(rot);
-		if (!rotator_check_reg_fmt(fmt)) {
-			DRM_ERROR("invalid format.\n");
-			return -EINVAL;
-		}
-
-		/* Re-set cb planar for NV12 format */
-		if ((fmt == ROT_CONTROL_FMT_YCBCR420_2P) &&
-		    !addr[EXYNOS_DRM_PLANAR_CB]) {
-			/* Get buf size */
-			val = rot_read(ROT_DST_BUF_SIZE);
-
-			hsize = ROT_GET_BUF_SIZE_W(val);
-			vsize = ROT_GET_BUF_SIZE_H(val);
-
-			/* Set cb planar */
-			addr[EXYNOS_DRM_PLANAR_CB] =
-				addr[EXYNOS_DRM_PLANAR_Y] + hsize * vsize;
-		}
-
-		for_each_ipp_planar(i)
-			rot_write(addr[i], ROT_DST_BUF_ADDR(i));
-		break;
-	case IPP_BUF_DEQUEUE:
-		for_each_ipp_planar(i)
-			rot_write(0x0, ROT_DST_BUF_ADDR(i));
-		break;
-	default:
-		/* Nothing to do */
-		break;
-	}
+	/* Set buffer DMA address */
+	rot_write(buf->dma_addr[0], ROT_DST_BUF_ADDR(0));
+	rot_write(buf->dma_addr[1], ROT_DST_BUF_ADDR(1));
 
 	return 0;
 }
 
-static struct exynos_drm_ipp_ops rot_src_ops = {
-	.set_fmt	=	rotator_src_set_fmt,
-	.set_size	=	rotator_src_set_size,
-	.set_addr	=	rotator_src_set_addr,
-};
-
-static struct exynos_drm_ipp_ops rot_dst_ops = {
-	.set_transf	=	rotator_dst_set_transf,
-	.set_size	=	rotator_dst_set_size,
-	.set_addr	=	rotator_dst_set_addr,
-};
-
-static int rotator_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
+static int rotator_start(struct rot_context *rot)
 {
-	struct drm_exynos_ipp_prop_list *prop_list = &ippdrv->prop_list;
-
-	prop_list->version = 1;
-	prop_list->flip = (1 << EXYNOS_DRM_FLIP_VERTICAL) |
-				(1 << EXYNOS_DRM_FLIP_HORIZONTAL);
-	prop_list->degree = (1 << EXYNOS_DRM_DEGREE_0) |
-				(1 << EXYNOS_DRM_DEGREE_90) |
-				(1 << EXYNOS_DRM_DEGREE_180) |
-				(1 << EXYNOS_DRM_DEGREE_270);
-	prop_list->csc = 0;
-	prop_list->crop = 0;
-	prop_list->scale = 0;
+	u32 val;
 
-	return 0;
-}
+	/* Set interrupt enable */
+	rotator_reg_set_irq(rot, true);
 
-static inline bool rotator_check_drm_fmt(u32 fmt)
-{
-	switch (fmt) {
-	case DRM_FORMAT_XRGB8888:
-	case DRM_FORMAT_NV12:
-		return true;
-	default:
-		DRM_DEBUG_KMS("not support format\n");
-		return false;
-	}
-}
+	val = rot_read(ROT_CONTROL);
+	val |= ROT_CONTROL_START;
+	rot_write(val, ROT_CONTROL);
 
-static inline bool rotator_check_drm_flip(enum drm_exynos_flip flip)
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
+	return 0;
 }
 
-static int rotator_ippdrv_check_property(struct device *dev,
-		struct drm_exynos_ipp_property *property)
+static int rotator_commit(struct exynos_drm_ipp *ipp,
+			  struct exynos_drm_ipp_task *task)
 {
-	struct drm_exynos_ipp_config *src_config =
-					&property->config[EXYNOS_DRM_OPS_SRC];
-	struct drm_exynos_ipp_config *dst_config =
-					&property->config[EXYNOS_DRM_OPS_DST];
-	struct drm_exynos_pos *src_pos = &src_config->pos;
-	struct drm_exynos_pos *dst_pos = &dst_config->pos;
-	struct drm_exynos_sz *src_sz = &src_config->sz;
-	struct drm_exynos_sz *dst_sz = &dst_config->sz;
-	bool swap = false;
-
-	/* Check format configuration */
-	if (src_config->fmt != dst_config->fmt) {
-		DRM_DEBUG_KMS("not support csc feature\n");
-		return -EINVAL;
-	}
-
-	if (!rotator_check_drm_fmt(dst_config->fmt)) {
-		DRM_DEBUG_KMS("invalid format\n");
-		return -EINVAL;
-	}
-
-	/* Check transform configuration */
-	if (src_config->degree != EXYNOS_DRM_DEGREE_0) {
-		DRM_DEBUG_KMS("not support source-side rotation\n");
-		return -EINVAL;
-	}
-
-	switch (dst_config->degree) {
-	case EXYNOS_DRM_DEGREE_90:
-	case EXYNOS_DRM_DEGREE_270:
-		swap = true;
-	case EXYNOS_DRM_DEGREE_0:
-	case EXYNOS_DRM_DEGREE_180:
-		/* No problem */
-		break;
-	default:
-		DRM_DEBUG_KMS("invalid degree\n");
-		return -EINVAL;
-	}
-
-	if (src_config->flip != EXYNOS_DRM_FLIP_NONE) {
-		DRM_DEBUG_KMS("not support source-side flip\n");
-		return -EINVAL;
-	}
-
-	if (!rotator_check_drm_flip(dst_config->flip)) {
-		DRM_DEBUG_KMS("invalid flip\n");
-		return -EINVAL;
-	}
+	struct rot_context *rot =
+			container_of(ipp, struct rot_context, ipp);
 
-	/* Check size configuration */
-	if ((src_pos->x + src_pos->w > src_sz->hsize) ||
-		(src_pos->y + src_pos->h > src_sz->vsize)) {
-		DRM_DEBUG_KMS("out of source buffer bound\n");
-		return -EINVAL;
-	}
+	pm_runtime_get_sync(rot->dev);
+	rot->task = task;
 
-	if (swap) {
-		if ((dst_pos->x + dst_pos->h > dst_sz->vsize) ||
-			(dst_pos->y + dst_pos->w > dst_sz->hsize)) {
-			DRM_DEBUG_KMS("out of destination buffer bound\n");
-			return -EINVAL;
-		}
-
-		if ((src_pos->w != dst_pos->h) || (src_pos->h != dst_pos->w)) {
-			DRM_DEBUG_KMS("not support scale feature\n");
-			return -EINVAL;
-		}
-	} else {
-		if ((dst_pos->x + dst_pos->w > dst_sz->hsize) ||
-			(dst_pos->y + dst_pos->h > dst_sz->vsize)) {
-			DRM_DEBUG_KMS("out of destination buffer bound\n");
-			return -EINVAL;
-		}
-
-		if ((src_pos->w != dst_pos->w) || (src_pos->h != dst_pos->h)) {
-			DRM_DEBUG_KMS("not support scale feature\n");
-			return -EINVAL;
-		}
-	}
+	rotator_src_set_fmt(rot, task->src.buf.fourcc);
+	rotator_src_set_buf(rot, &task->src);
+	rotator_dst_set_transf(rot, task->transform.rotation);
+	rotator_dst_set_buf(rot, &task->dst);
+	rotator_start(rot);
 
 	return 0;
 }
 
-static int rotator_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
+static const struct exynos_drm_ipp_funcs ipp_funcs = {
+	.commit = rotator_commit,
+};
+
+static int rotator_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
-	u32 val;
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_ipp *ipp = &rot->ipp;
 
-	if (rot->suspended) {
-		DRM_ERROR("suspended state\n");
-		return -EPERM;
-	}
-
-	if (cmd != IPP_CMD_M2M) {
-		DRM_ERROR("not support cmd: %d\n", cmd);
-		return -EINVAL;
-	}
-
-	/* Set interrupt enable */
-	rotator_reg_set_irq(rot, true);
+	rot->drm_dev = drm_dev;
+	drm_iommu_attach_device(drm_dev, dev);
 
-	val = rot_read(ROT_CONTROL);
-	val |= ROT_CONTROL_START;
+	exynos_drm_ipp_register(drm_dev, ipp, &ipp_funcs,
+			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE,
+			   rot->formats, "rotator");
 
-	rot_write(val, ROT_CONTROL);
+	dev_info(dev, "The exynos rotator has been probed successfully\n");
 
 	return 0;
 }
 
-static struct rot_limit_table rot_limit_tbl_4210 = {
-	.ycbcr420_2p = {
-		.min_w = 32,
-		.min_h = 32,
-		.max_w = SZ_64K,
-		.max_h = SZ_64K,
-		.align = 3,
-	},
-	.rgb888 = {
-		.min_w = 8,
-		.min_h = 8,
-		.max_w = SZ_16K,
-		.max_h = SZ_16K,
-		.align = 2,
-	},
-};
-
-static struct rot_limit_table rot_limit_tbl_4x12 = {
-	.ycbcr420_2p = {
-		.min_w = 32,
-		.min_h = 32,
-		.max_w = SZ_32K,
-		.max_h = SZ_32K,
-		.align = 3,
-	},
-	.rgb888 = {
-		.min_w = 8,
-		.min_h = 8,
-		.max_w = SZ_8K,
-		.max_h = SZ_8K,
-		.align = 2,
-	},
-};
+static void rotator_unbind(struct device *dev, struct device *master,
+			void *data)
+{
+	struct rot_context *rot = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_ipp *ipp = &rot->ipp;
 
-static struct rot_limit_table rot_limit_tbl_5250 = {
-	.ycbcr420_2p = {
-		.min_w = 32,
-		.min_h = 32,
-		.max_w = SZ_32K,
-		.max_h = SZ_32K,
-		.align = 3,
-	},
-	.rgb888 = {
-		.min_w = 8,
-		.min_h = 8,
-		.max_w = SZ_8K,
-		.max_h = SZ_8K,
-		.align = 1,
-	},
-};
+	exynos_drm_ipp_unregister(drm_dev, ipp);
+	drm_iommu_detach_device(rot->drm_dev, rot->dev);
+}
 
-static const struct of_device_id exynos_rotator_match[] = {
-	{
-		.compatible = "samsung,exynos4210-rotator",
-		.data = &rot_limit_tbl_4210,
-	},
-	{
-		.compatible = "samsung,exynos4212-rotator",
-		.data = &rot_limit_tbl_4x12,
-	},
-	{
-		.compatible = "samsung,exynos5250-rotator",
-		.data = &rot_limit_tbl_5250,
-	},
-	{},
+static const struct component_ops rotator_component_ops = {
+	.bind	= rotator_bind,
+	.unbind = rotator_unbind,
 };
-MODULE_DEVICE_TABLE(of, exynos_rotator_match);
 
 static int rotator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct resource	*regs_res;
 	struct rot_context *rot;
-	struct exynos_drm_ippdrv *ippdrv;
+	int irq;
 	int ret;
 
-	if (!dev->of_node) {
-		dev_err(dev, "cannot find of_node.\n");
-		return -ENODEV;
-	}
-
 	rot = devm_kzalloc(dev, sizeof(*rot), GFP_KERNEL);
 	if (!rot)
 		return -ENOMEM;
 
-	rot->limit_tbl = (struct rot_limit_table *)
-				of_device_get_match_data(dev);
-	rot->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rot->regs = devm_ioremap_resource(dev, rot->regs_res);
+	rot->formats = of_device_get_match_data(dev);
+	rot->dev = dev;
+	regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	rot->regs = devm_ioremap_resource(dev, regs_res);
 	if (IS_ERR(rot->regs))
 		return PTR_ERR(rot->regs);
 
-	rot->irq = platform_get_irq(pdev, 0);
-	if (rot->irq < 0) {
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
 		dev_err(dev, "failed to get irq\n");
-		return rot->irq;
+		return irq;
 	}
 
-	ret = devm_request_threaded_irq(dev, rot->irq, NULL,
-			rotator_irq_handler, IRQF_ONESHOT, "drm_rotator", rot);
+	ret = devm_request_irq(dev, irq, rotator_irq_handler, 0, dev_name(dev),
+			       rot);
 	if (ret < 0) {
 		dev_err(dev, "failed to request irq\n");
 		return ret;
@@ -735,34 +311,15 @@ static int rotator_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(dev);
-
-	ippdrv = &rot->ippdrv;
-	ippdrv->dev = dev;
-	ippdrv->ops[EXYNOS_DRM_OPS_SRC] = &rot_src_ops;
-	ippdrv->ops[EXYNOS_DRM_OPS_DST] = &rot_dst_ops;
-	ippdrv->check_property = rotator_ippdrv_check_property;
-	ippdrv->start = rotator_ippdrv_start;
-	ret = rotator_init_prop_list(ippdrv);
-	if (ret < 0) {
-		dev_err(dev, "failed to init property list.\n");
-		goto err_ippdrv_register;
-	}
-
-	DRM_DEBUG_KMS("ippdrv[%pK]\n", ippdrv);
-
 	platform_set_drvdata(pdev, rot);
 
-	ret = exynos_drm_ippdrv_register(ippdrv);
-	if (ret < 0) {
-		dev_err(dev, "failed to register drm rotator device\n");
-		goto err_ippdrv_register;
-	}
-
-	dev_info(dev, "The exynos rotator is probed successfully\n");
+	ret = component_add(dev, &rotator_component_ops);
+	if (ret)
+		goto err_component;
 
 	return 0;
 
-err_ippdrv_register:
+err_component:
 	pm_runtime_disable(dev);
 	return ret;
 }
@@ -770,45 +327,93 @@ static int rotator_probe(struct platform_device *pdev)
 static int rotator_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct rot_context *rot = dev_get_drvdata(dev);
-	struct exynos_drm_ippdrv *ippdrv = &rot->ippdrv;
-
-	exynos_drm_ippdrv_unregister(ippdrv);
 
+	component_del(dev, &rotator_component_ops);
 	pm_runtime_disable(dev);
 
 	return 0;
 }
 
 #ifdef CONFIG_PM
-static int rotator_clk_crtl(struct rot_context *rot, bool enable)
-{
-	if (enable) {
-		clk_prepare_enable(rot->clock);
-		rot->suspended = false;
-	} else {
-		clk_disable_unprepare(rot->clock);
-		rot->suspended = true;
-	}
-
-	return 0;
-}
-
 static int rotator_runtime_suspend(struct device *dev)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
 
-	return  rotator_clk_crtl(rot, false);
+	clk_disable_unprepare(rot->clock);
+	return 0;
 }
 
 static int rotator_runtime_resume(struct device *dev)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
 
-	return  rotator_clk_crtl(rot, true);
+	return clk_prepare_enable(rot->clock);
 }
 #endif
 
+static const struct drm_exynos_ipp_limit rotator_4210_rbg888_limits[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = {8, SZ_16K}, .v = {8, SZ_16K}) },
+	{ IPP_SIZE_LIMIT(AREA, .h.align = 4, .v.align = 4) },
+	{ }
+};
+
+static const struct drm_exynos_ipp_limit rotator_4412_rbg888_limits[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = {8, SZ_8K}, .v = {8, SZ_8K}) },
+	{ IPP_SIZE_LIMIT(AREA, .h.align = 4, .v.align = 4) },
+	{ }
+};
+
+static const struct drm_exynos_ipp_limit rotator_5250_rbg888_limits[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = {8, SZ_8K}, .v = {8, SZ_8K}) },
+	{ IPP_SIZE_LIMIT(AREA, .h.align = 2, .v.align = 2) },
+	{ }
+};
+
+static const struct drm_exynos_ipp_limit rotator_4210_yuv_limits[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = {32, SZ_64K}, .v = {32, SZ_64K}) },
+	{ IPP_SIZE_LIMIT(AREA, .h.align = 8, .v.align = 8) },
+	{ }
+};
+
+static const struct drm_exynos_ipp_limit rotator_4412_yuv_limits[] = {
+	{ IPP_SIZE_LIMIT(BUFFER, .h = {32, SZ_32K}, .v = {32, SZ_32K}) },
+	{ IPP_SIZE_LIMIT(AREA, .h.align = 8, .v.align = 8) },
+	{ }
+};
+
+static const struct exynos_drm_ipp_formats rotator_4210_formats[] = {
+	{ IPP_SRCDST_FORMAT(XRGB8888, rotator_4210_rbg888_limits) },
+	{ IPP_SRCDST_FORMAT(NV12, rotator_4210_yuv_limits) },
+	{ }
+};
+
+static const struct exynos_drm_ipp_formats rotator_4412_formats[] = {
+	{ IPP_SRCDST_FORMAT(XRGB8888, rotator_4412_rbg888_limits) },
+	{ IPP_SRCDST_FORMAT(NV12, rotator_4412_yuv_limits) },
+	{ }
+};
+
+static const struct exynos_drm_ipp_formats rotator_5250_formats[] = {
+	{ IPP_SRCDST_FORMAT(XRGB8888, rotator_5250_rbg888_limits) },
+	{ IPP_SRCDST_FORMAT(NV12, rotator_4412_yuv_limits) },
+	{ }
+};
+
+static const struct of_device_id exynos_rotator_match[] = {
+	{
+		.compatible = "samsung,exynos4210-rotator",
+		.data = rotator_4210_formats,
+	}, {
+		.compatible = "samsung,exynos4212-rotator",
+		.data = rotator_4412_formats,
+	}, {
+		.compatible = "samsung,exynos5250-rotator",
+		.data = rotator_5250_formats,
+	}, {
+	},
+};
+MODULE_DEVICE_TABLE(of, exynos_rotator_match);
+
 static const struct dev_pm_ops rotator_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
@@ -820,7 +425,7 @@ struct platform_driver rotator_driver = {
 	.probe		= rotator_probe,
 	.remove		= rotator_remove,
 	.driver		= {
-		.name	= "exynos-rot",
+		.name	= "exynos-rotator",
 		.owner	= THIS_MODULE,
 		.pm	= &rotator_pm_ops,
 		.of_match_table = exynos_rotator_match,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.h b/drivers/gpu/drm/exynos/exynos_drm_rotator.h
deleted file mode 100644
index 71a0b4c0c1e8..000000000000
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *
- * Authors:
- *	YoungJun Cho <yj44.cho@samsung.com>
- *	Eunchul Kim <chulspro.kim@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#ifndef	_EXYNOS_DRM_ROTATOR_H_
-#define	_EXYNOS_DRM_ROTATOR_H_
-
-/* TODO */
-
-#endif
-- 
1.9.1
