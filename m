From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RFC v2 2/2] drm/exynos: Convert Exynos Rotator driver to Picture
 Processor interface
Date: Mon, 08 May 2017 11:11:39 +0200
Message-ID: <1494234699-23843-3-git-send-email-m.szyprowski@samsung.com>
References: <1494234699-23843-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170508091207eucas1p1ae254a41493a65ee25c1cc1c9cc95017@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63974 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753856AbdEHJML (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2017 05:12:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OPM00LZ2MW8FM70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 May 2017 10:12:09 +0100 (BST)
In-reply-to: <1494234699-23843-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>

This patch converts Exynos Rotator driver from Exynos IPP API to
Exynos DRM Picture Processor API.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig              |   1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   1 +
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 493 +++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_rotator.h |  19 --
 4 files changed, 118 insertions(+), 396 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 1d185347c64c..84c8cc2aa28d 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -106,7 +106,6 @@ config DRM_EXYNOS_FIMC
 
 config DRM_EXYNOS_ROTATOR
 	bool "Rotator"
-	depends on DRM_EXYNOS_IPP
 	help
 	  Choose this option if you want to use Exynos Rotator for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 386a9d325c5a..b3b2d0628842 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -401,6 +401,7 @@ struct exynos_drm_driver_info {
 		DRV_PTR(fimc_driver, CONFIG_DRM_EXYNOS_FIMC),
 	}, {
 		DRV_PTR(rotator_driver, CONFIG_DRM_EXYNOS_ROTATOR),
+		DRM_COMPONENT_DRIVER
 	}, {
 		DRV_PTR(gsc_driver, CONFIG_DRM_EXYNOS_GSC),
 	}, {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 79282a820ecc..a23a780bfa26 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/component.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -21,29 +22,18 @@
 #include <drm/drmP.h>
 #include <drm/exynos_drm.h>
 #include "regs-rotator.h"
+#include "exynos_drm_fb.h"
 #include "exynos_drm_drv.h"
-#include "exynos_drm_ipp.h"
+#include "exynos_drm_iommu.h"
+#include "exynos_drm_pp.h"
 
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
 
 #define get_rot_context(dev)	platform_get_drvdata(to_platform_device(dev))
-#define get_ctx_from_ippdrv(ippdrv)	container_of(ippdrv,\
-					struct rot_context, ippdrv);
 #define rot_read(offset)		readl(rot->regs + (offset))
 #define rot_write(cfg, offset)	writel(cfg, rot->regs + (offset))
 
@@ -88,18 +78,19 @@ struct rot_limit_table {
  * @clock: rotator gate clock.
  * @limit_tbl: limitation of rotator.
  * @irq: irq number.
- * @cur_buf_id: current operation buffer id.
  * @suspended: suspended state.
  */
 struct rot_context {
-	struct exynos_drm_ippdrv	ippdrv;
+	struct exynos_drm_pp pp;
+	struct drm_device *drm_dev;
+	struct device	*dev;
 	struct resource	*regs_res;
 	void __iomem	*regs;
 	struct clk	*clock;
 	struct rot_limit_table	*limit_tbl;
 	int	irq;
-	int	cur_buf_id[EXYNOS_DRM_OPS_MAX];
 	bool	suspended;
+	struct exynos_drm_pp_task	*task;
 };
 
 static void rotator_reg_set_irq(struct rot_context *rot, bool enable)
@@ -138,9 +129,6 @@ static enum rot_irq_status rotator_reg_get_irq_status(struct rot_context *rot)
 static irqreturn_t rotator_irq_handler(int irq, void *arg)
 {
 	struct rot_context *rot = arg;
-	struct exynos_drm_ippdrv *ippdrv = &rot->ippdrv;
-	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
-	struct drm_exynos_ipp_event_work *event_work = c_node->event_work;
 	enum rot_irq_status irq_status;
 	u32 val;
 
@@ -152,13 +140,13 @@ static irqreturn_t rotator_irq_handler(int irq, void *arg)
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
+		struct exynos_drm_pp_task *task = rot->task;
+
+		rot->task = NULL;
+		pm_runtime_put(rot->dev);
+		exynos_drm_pp_task_done(task,
+			irq_status == ROT_IRQ_STATUS_COMPLETE ? 0 : -EINVAL);
 	}
 
 	return IRQ_HANDLED;
@@ -214,9 +202,6 @@ static int rotator_src_set_fmt(struct device *dev, u32 fmt)
 	case DRM_FORMAT_XRGB8888:
 		val |= ROT_CONTROL_FMT_RGB888;
 		break;
-	default:
-		DRM_ERROR("invalid image format\n");
-		return -EINVAL;
 	}
 
 	rot_write(val, ROT_CONTROL);
@@ -224,33 +209,18 @@ static int rotator_src_set_fmt(struct device *dev, u32 fmt)
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
+static int rotator_src_set_buf(struct device *dev, struct drm_exynos_pos *pos,
+			       struct drm_framebuffer *fb)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
 	u32 fmt, hsize, vsize;
 	u32 val;
 
-	/* Get format */
 	fmt = rotator_reg_get_fmt(rot);
-	if (!rotator_check_reg_fmt(fmt)) {
-		DRM_ERROR("invalid format.\n");
-		return -EINVAL;
-	}
 
 	/* Align buffer size */
-	hsize = sz->hsize;
-	vsize = sz->vsize;
+	hsize = fb->width;
+	vsize = fb->height;
 	rotator_align_size(rot, fmt, &hsize, &vsize);
 
 	/* Set buffer size configuration */
@@ -263,131 +233,54 @@ static int rotator_src_set_size(struct device *dev, int swap,
 	val = ROT_SRC_CROP_SIZE_H(pos->h) | ROT_SRC_CROP_SIZE_W(pos->w);
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
+	rot_write(exynos_drm_fb_dma_addr(fb, 0), ROT_SRC_BUF_ADDR(0));
+	rot_write(exynos_drm_fb_dma_addr(fb, 1), ROT_SRC_BUF_ADDR(1));
 
 	return 0;
 }
 
-static int rotator_dst_set_transf(struct device *dev,
-		enum drm_exynos_degree degree,
-		enum drm_exynos_flip flip, bool *swap)
+static int rotator_dst_set_transf(struct device *dev, unsigned int rotation)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
 	u32 val;
 
 	/* Set transform configuration */
 	val = rot_read(ROT_CONTROL);
+
 	val &= ~ROT_CONTROL_FLIP_MASK;
 
-	switch (flip) {
-	case EXYNOS_DRM_FLIP_VERTICAL:
+	if (rotation & DRM_REFLECT_Y)
 		val |= ROT_CONTROL_FLIP_VERTICAL;
-		break;
-	case EXYNOS_DRM_FLIP_HORIZONTAL:
+	if (rotation & DRM_REFLECT_X)
 		val |= ROT_CONTROL_FLIP_HORIZONTAL;
-		break;
-	default:
-		/* Flip None */
-		break;
-	}
 
 	val &= ~ROT_CONTROL_ROT_MASK;
 
-	switch (degree) {
-	case EXYNOS_DRM_DEGREE_90:
+	if (rotation & DRM_ROTATE_90)
 		val |= ROT_CONTROL_ROT_90;
-		break;
-	case EXYNOS_DRM_DEGREE_180:
+	else if (rotation & DRM_ROTATE_180)
 		val |= ROT_CONTROL_ROT_180;
-		break;
-	case EXYNOS_DRM_DEGREE_270:
+	else if (rotation & DRM_ROTATE_270)
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
+static int rotator_dst_set_buf(struct device *dev, struct drm_exynos_pos *pos,
+			       struct drm_framebuffer *fb)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
-	u32 val, fmt, hsize, vsize;
+	u32 fmt, hsize, vsize;
+	u32 val;
 
-	/* Get format */
 	fmt = rotator_reg_get_fmt(rot);
-	if (!rotator_check_reg_fmt(fmt)) {
-		DRM_ERROR("invalid format.\n");
-		return -EINVAL;
-	}
 
 	/* Align buffer size */
-	hsize = sz->hsize;
-	vsize = sz->vsize;
+	hsize = fb->width;
+	vsize = fb->height;
 	rotator_align_size(rot, fmt, &hsize, &vsize);
 
 	/* Set buffer size configuration */
@@ -398,227 +291,23 @@ static int rotator_dst_set_size(struct device *dev, int swap,
 	val = ROT_CROP_POS_Y(pos->y) | ROT_CROP_POS_X(pos->x);
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
-
-	return 0;
-}
-
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
-{
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
+	/* Set buffer DMA address */
+	rot_write(exynos_drm_fb_dma_addr(fb, 0), ROT_DST_BUF_ADDR(0));
+	rot_write(exynos_drm_fb_dma_addr(fb, 1), ROT_DST_BUF_ADDR(1));
 
 	return 0;
 }
 
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
-
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
-}
-
-static int rotator_ippdrv_check_property(struct device *dev,
-		struct drm_exynos_ipp_property *property)
-{
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
-
-	/* Check size configuration */
-	if ((src_pos->x + src_pos->w > src_sz->hsize) ||
-		(src_pos->y + src_pos->h > src_sz->vsize)) {
-		DRM_DEBUG_KMS("out of source buffer bound\n");
-		return -EINVAL;
-	}
-
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
-
-	return 0;
-}
-
-static int rotator_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
+static int rotator_start(struct device *dev)
 {
 	struct rot_context *rot = dev_get_drvdata(dev);
 	u32 val;
 
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
 	/* Set interrupt enable */
 	rotator_reg_set_irq(rot, true);
 
 	val = rot_read(ROT_CONTROL);
 	val |= ROT_CONTROL_START;
-
 	rot_write(val, ROT_CONTROL);
 
 	return 0;
@@ -692,11 +381,84 @@ static int rotator_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 };
 MODULE_DEVICE_TABLE(of, exynos_rotator_match);
 
+static int rotator_commit(struct exynos_drm_pp *pp,
+			  struct exynos_drm_pp_task *task)
+{
+	struct rot_context *rot =
+			container_of(pp, struct rot_context, pp);
+	struct device *dev = rot->dev;
+	struct drm_exynos_pos src_pos = {
+		task->src_x >> 16, task->src_y >> 16,
+		task->src_w >> 16, task->src_h >> 16,
+	};
+	struct drm_exynos_pos dst_pos = {
+		task->dst_x >> 16, task->dst_y >> 16,
+		task->dst_w >> 16, task->dst_h >> 16,
+	};
+
+	pm_runtime_get_sync(dev);
+	rot->task = task;
+
+	rotator_src_set_fmt(dev, task->src_fb->format->format);
+	rotator_src_set_buf(dev, &src_pos, task->src_fb);
+	rotator_dst_set_transf(dev, task->rotation);
+	rotator_dst_set_buf(dev, &dst_pos, task->dst_fb);
+	rotator_start(dev);
+
+	return 0;
+}
+
+struct exynos_drm_pp_funcs pp_funcs = {
+	.commit = rotator_commit,
+};
+
+static const uint32_t rotator_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_NV12,
+};
+
+static int rotator_bind(struct device *dev, struct device *master, void *data)
+{
+	struct rot_context *rot = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_pp *pp = &rot->pp;
+
+	rot->drm_dev = drm_dev;
+	drm_iommu_attach_device(drm_dev, dev);
+
+	exynos_drm_pp_register(drm_dev, pp, &pp_funcs,
+			   DRM_EXYNOS_PP_CAP_CROP | DRM_EXYNOS_PP_CAP_ROTATE,
+			   rotator_formats, ARRAY_SIZE(rotator_formats),
+			   rotator_formats, ARRAY_SIZE(rotator_formats),
+			   DRM_ROTATE_0 | DRM_ROTATE_90 | DRM_ROTATE_180 |
+			   DRM_ROTATE_270 | DRM_REFLECT_X | DRM_REFLECT_Y,
+			   "rotator");
+
+	dev_info(dev, "The exynos rotator has been probed successfully\n");
+
+	return 0;
+}
+
+static void rotator_unbind(struct device *dev, struct device *master,
+			void *data)
+{
+	struct rot_context *rot = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_pp *pp = &rot->pp;
+
+	exynos_drm_pp_unregister(drm_dev, pp);
+	drm_iommu_detach_device(rot->drm_dev, rot->dev);
+}
+
+static const struct component_ops rotator_component_ops = {
+	.bind	= rotator_bind,
+	.unbind = rotator_unbind,
+};
+
 static int rotator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rot_context *rot;
-	struct exynos_drm_ippdrv *ippdrv;
 	int ret;
 
 	if (!dev->of_node) {
@@ -710,6 +472,7 @@ static int rotator_probe(struct platform_device *pdev)
 
 	rot->limit_tbl = (struct rot_limit_table *)
 				of_device_get_match_data(dev);
+	rot->dev = dev;
 	rot->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rot->regs = devm_ioremap_resource(dev, rot->regs_res);
 	if (IS_ERR(rot->regs))
@@ -735,30 +498,11 @@ static int rotator_probe(struct platform_device *pdev)
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
+	ret = component_add(dev, &rotator_component_ops);
+	if (ret)
 		goto err_ippdrv_register;
-	}
-
-	dev_info(dev, "The exynos rotator is probed successfully\n");
 
 	return 0;
 
@@ -770,11 +514,8 @@ static int rotator_probe(struct platform_device *pdev)
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
