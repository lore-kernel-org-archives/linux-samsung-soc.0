From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 24/25] drm/exynos: add generic plane rotation property support
Date: Tue, 10 Nov 2015 14:23:40 +0100
Message-ID: <1447161821-1877-25-git-send-email-m.szyprowski@samsung.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11143 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753133AbbKJNZC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:25:02 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL00JHPP9OJAA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:25:00 +0000 (GMT)
In-reply-to: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds generic plane rotation property for all supported
drivers. This has been implemented with additional help from Exynos IPP
(Exynos Image Post-Processing subsystem) with temporary framebuffers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig                |   8 +
 drivers/gpu/drm/exynos/Makefile               |   1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |   8 +
 drivers/gpu/drm/exynos/exynos_drm_ipp.c       | 151 ++++++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_ipp.h       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  22 ++-
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c | 263 ++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h |  69 +++++++
 8 files changed, 523 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 83efca941388..e7d414aefbdc 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -104,6 +104,14 @@ config DRM_EXYNOS_IPP
 	help
 	  Choose this option if you want to use IPP feature for DRM.
 
+config DRM_EXYNOS_PLANE_IPP
+	depends on DRM_EXYNOS_IPP
+	bool "Use IPP framework for implementing unsupported plane properties"
+	help
+	  Choose this option if you want to let IPP framework to provide plane
+	  properties (like rotation, overlay scaling and more pixel formats),
+	  which are not supported by hardware CRTC drivers.
+
 config DRM_EXYNOS_FIMC
 	bool "FIMC"
 	depends on DRM_EXYNOS_IPP && MFD_SYSCON
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 6496532aaa91..92c3f7cac7a9 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -19,6 +19,7 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_VIDI)	+= exynos_drm_vidi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_G2D)	+= exynos_drm_g2d.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_IPP)	+= exynos_drm_ipp.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_PLANE_IPP)	+= exynos_drm_plane_ipp.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_FIMC)	+= exynos_drm_fimc.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_ROTATOR)	+= exynos_drm_rotator.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_GSC)	+= exynos_drm_gsc.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 0890e6709f10..1d6b25330686 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -72,6 +72,12 @@ struct exynos_drm_plane_state {
 	unsigned int h_ratio;
 	unsigned int v_ratio;
 	struct drm_framebuffer *fb;
+	unsigned int rotation;
+
+	unsigned int ipp_needed;
+	struct exynos_drm_rect ipp_src;
+	struct exynos_drm_rect ipp_dst;
+	struct drm_framebuffer *ipp_fb;
 };
 
 static inline struct exynos_drm_plane_state *
@@ -95,6 +101,8 @@ struct exynos_drm_plane {
 	const struct exynos_drm_plane_config *config;
 	unsigned int zpos;
 	struct drm_framebuffer *pending_fb;
+	struct drm_framebuffer *ipp_cur_fb;
+	struct drm_framebuffer *ipp_next_fb;
 };
 
 #define EXYNOS_DRM_PLANE_CAP_DOUBLE_X	(1 << 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 44a6689e0f4c..89d1c4371d39 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -20,6 +20,7 @@
 #include <drm/drmP.h>
 #include <drm/exynos_drm.h>
 #include "exynos_drm_drv.h"
+#include "exynos_drm_fb.h"
 #include "exynos_drm_gem.h"
 #include "exynos_drm_ipp.h"
 #include "exynos_drm_iommu.h"
@@ -1513,7 +1514,7 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
 
 	spin_lock_irqsave(&drm_dev->event_lock, flags);
 	list_move_tail(&e->base.link, &e->base.file_priv->event_list);
-	wake_up_interruptible(&e->base.file_priv->event_wait);
+	wake_up(&e->base.file_priv->event_wait);
 	spin_unlock_irqrestore(&drm_dev->event_lock, flags);
 	mutex_unlock(&c_node->event_lock);
 
@@ -1579,6 +1580,154 @@ err_completion:
 		complete(&c_node->start_complete);
 }
 
+static struct drm_exynos_ipp_mem_node
+		*ipp_get_internal_mem_node(struct drm_device *drm_dev,
+		struct drm_exynos_ipp_cmd_node *c_node,
+		__u32 prop_id, enum drm_exynos_ops_id ops_id,
+		struct drm_framebuffer *fb)
+{
+	struct drm_exynos_ipp_mem_node *m_node;
+	struct drm_exynos_ipp_buf_info *buf_info;
+
+	m_node = kzalloc(sizeof(*m_node), GFP_KERNEL);
+	if (!m_node)
+		return ERR_PTR(-ENOMEM);
+
+	buf_info = &m_node->buf_info;
+
+	m_node->ops_id = ops_id;
+	m_node->prop_id = prop_id;
+	INIT_LIST_HEAD(&m_node->list);
+
+	DRM_DEBUG_KMS("m_node[0x%x]ops_id[%d]prop_id[%d]\n", (int)m_node, ops_id, prop_id);
+
+	buf_info->obj[0] = NULL;
+	buf_info->base[0] = exynos_drm_fb_dma_addr(fb, 0);
+	buf_info->size[0] = fb->pitches[0] * fb->height;
+
+	mutex_lock(&c_node->mem_lock);
+	list_add_tail(&m_node->list, &c_node->mem_list[ops_id]);
+	mutex_unlock(&c_node->mem_lock);
+
+	return m_node;
+}
+
+
+static int exynos_drm_ipp_internal_enqueue_buf(struct drm_device *drm_dev,
+		__u32 prop_id, enum drm_exynos_ops_id ops_id,
+		struct drm_framebuffer *fb)
+{
+	struct drm_exynos_ipp_cmd_node *c_node;
+	struct drm_exynos_ipp_mem_node *m_node;
+	int ret;
+	struct drm_exynos_ipp_queue_buf qbuf = {
+		.ops_id = ops_id,
+		.buf_type = IPP_BUF_ENQUEUE,
+		.prop_id = prop_id,
+	};
+
+	DRM_DEBUG_KMS("prop_id[%d]ops_id[%s]\n",
+		prop_id, ops_id ? "dst" : "src");
+
+	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock, prop_id);
+	if (!c_node) {
+		DRM_ERROR("failed to get command node.\n");
+		return -ENODEV;
+	}
+
+	m_node = ipp_get_internal_mem_node(drm_dev, c_node, prop_id,
+					   ops_id, fb);
+	if (IS_ERR(m_node)) {
+		DRM_ERROR("failed to get m_node.\n");
+		return PTR_ERR(m_node);
+	}
+
+	if (ops_id == EXYNOS_DRM_OPS_DST) {
+		ret = ipp_get_event(drm_dev, c_node, &qbuf);
+		if (ret) {
+			DRM_ERROR("failed to get event.\n");
+			goto err_clean_node;
+		}
+
+		ret = ipp_queue_buf_with_run(c_node, m_node, &qbuf);
+		if (ret) {
+			DRM_ERROR("failed to run command.\n");
+			goto err_clean_node;
+		}
+	}
+
+	return 0;
+
+err_clean_node:
+	DRM_ERROR("clean memory nodes.\n");
+
+	ipp_clean_queue_buf(drm_dev, c_node, &qbuf);
+	return ret;
+}
+
+int exynos_ipp_process_internal(struct drm_device *drm_dev,
+	struct drm_exynos_ipp_config *src_conf, struct drm_framebuffer *src_fb,
+	struct drm_exynos_ipp_config *dst_conf, struct drm_framebuffer *dst_fb)
+{
+	int ret;
+	struct drm_exynos_ipp_property property = {
+		.config = {
+			*src_conf,
+			*dst_conf,
+		},
+		.cmd = IPP_CMD_M2M,
+	};
+	struct drm_exynos_ipp_cmd_ctrl ctrl = {
+		/* .prop_id */
+		.ctrl = IPP_CTRL_PLAY,
+	};
+	struct drm_exynos_ipp_cmd_ctrl ctrl_stop = {
+		/* .prop_id */
+		.ctrl = IPP_CTRL_STOP,
+	};
+	struct drm_file virt_file = { };
+
+	INIT_LIST_HEAD(&virt_file.lhead);
+	INIT_LIST_HEAD(&virt_file.fbs);
+	mutex_init(&virt_file.fbs_lock);
+	INIT_LIST_HEAD(&virt_file.blobs);
+	INIT_LIST_HEAD(&virt_file.event_list);
+	init_waitqueue_head(&virt_file.event_wait);
+	virt_file.event_space = 4096;
+	virt_file.uid = current_euid();
+	virt_file.pid = get_pid(task_pid(current));
+	virt_file.authenticated = capable(CAP_SYS_ADMIN);
+	virt_file.lock_count = 0;
+
+	ret = exynos_drm_ipp_set_property(drm_dev, &property, &virt_file);
+	if (ret)
+		return ret;
+
+	ctrl.prop_id = property.prop_id;
+	ctrl_stop.prop_id = property.prop_id;
+
+	ret = exynos_drm_ipp_internal_enqueue_buf(drm_dev, property.prop_id,
+						  EXYNOS_DRM_OPS_SRC, src_fb);
+	if (ret)
+		goto cleanup;
+
+	ret = exynos_drm_ipp_internal_enqueue_buf(drm_dev, property.prop_id,
+						  EXYNOS_DRM_OPS_DST, dst_fb);
+	if (ret)
+		goto cleanup;
+
+	ret = exynos_drm_ipp_cmd_ctrl(drm_dev, &ctrl, &virt_file);
+	if (ret)
+		goto cleanup;
+
+	wait_event(virt_file.event_wait, !list_empty(&virt_file.event_list));
+
+cleanup:
+	exynos_drm_ipp_cmd_ctrl(drm_dev, &ctrl_stop, &virt_file);
+
+	return ret;
+}
+
 static int ipp_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 {
 	struct exynos_drm_ippdrv *ippdrv;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index 1dc13bf57b16..7e95437edecb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -24,6 +24,10 @@
 #define IPP_GET_LCD_HEIGHT	_IOR('F', 303, int)
 #define IPP_SET_WRITEBACK	_IOW('F', 304, u32)
 
+int exynos_ipp_process_internal(struct drm_device *drm_dev,
+	struct drm_exynos_ipp_config *src_conf, struct drm_framebuffer *src_fb,
+	struct drm_exynos_ipp_config *dst_conf, struct drm_framebuffer *dst_fb);
+
 /* definition of state */
 enum drm_exynos_ipp_state {
 	IPP_STATE_IDLE,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index c49b241cafe5..e24285b148c2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -19,6 +19,7 @@
 #include "exynos_drm_fb.h"
 #include "exynos_drm_gem.h"
 #include "exynos_drm_plane.h"
+#include "exynos_drm_plane_ipp.h"
 
 /*
  * This function is to get X or Y size shown via screen. This needs length and
@@ -85,6 +86,8 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	src_w = state->src_w >> 16;
 	src_h = state->src_h >> 16;
 
+	exynos_plane_ipp_setup(exynos_state, &src_x, &src_y, &src_w, &src_h);
+
 	/* set ratio */
 	exynos_state->h_ratio = (src_w << 16) / crtc_w;
 	exynos_state->v_ratio = (src_h << 16) / crtc_h;
@@ -163,6 +166,13 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
 {
 	struct exynos_drm_plane_state *old_exynos_state =
 					to_exynos_plane_state(old_state);
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
+	/*
+	 * This is the only place in the code, where all temporary objects
+	 * used for processing are no longer used and can be freed.
+	 */
+	exynos_plane_ipp_cleanup(exynos_plane, old_exynos_state);
+
 	__drm_atomic_helper_plane_destroy_state(plane, old_state);
 	kfree(old_exynos_state);
 }
@@ -174,6 +184,7 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.reset		= exynos_drm_plane_reset,
 	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
+	.set_property = drm_atomic_helper_plane_set_property,
 };
 
 static int
@@ -241,13 +252,18 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 
 	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
-	return ret;
+	if (ret)
+		return ret;
+
+	return exynos_plane_ipp_check(exynos_plane, exynos_state);
 }
 
 static void exynos_plane_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = plane->state;
+	struct exynos_drm_plane_state *exynos_state =
+						to_exynos_plane_state(state);
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(state->crtc);
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 
@@ -257,6 +273,8 @@ static void exynos_plane_atomic_update(struct drm_plane *plane,
 	plane->crtc = state->crtc;
 	exynos_plane->pending_fb = state->fb;
 
+	exynos_plane_ipp_update(exynos_plane, exynos_state);
+
 	if (exynos_crtc->ops->update_plane)
 		exynos_crtc->ops->update_plane(exynos_crtc, exynos_plane);
 }
@@ -328,5 +346,5 @@ int exynos_plane_init(struct drm_device *dev,
 		exynos_plane_attach_zpos_property(&exynos_plane->base,
 						  config->zpos);
 
-	return 0;
+	return exynos_plane_ipp_attach_properties(dev, exynos_plane);
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
new file mode 100644
index 000000000000..126d0bde2ccf
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
@@ -0,0 +1,263 @@
+/*
+ * Copyright (C) 2015 Samsung Electronics Co.Ltd
+ * Authors: Marek Szyprowski <m.szyprowski@samsung.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ */
+
+#include <drm/drmP.h>
+
+#include <drm/exynos_drm.h>
+#include "exynos_drm_drv.h"
+#include "exynos_drm_fb.h"
+#include "exynos_drm_gem.h"
+#include "exynos_drm_ipp.h"
+#include "exynos_drm_plane.h"
+#include "exynos_drm_plane_ipp.h"
+#include "exynos_drm_iommu.h"
+
+static struct drm_framebuffer *exynos_plane_ipp_alloc_fb(struct drm_device *dev,
+					struct exynos_drm_plane_state *state)
+{
+	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER] = { NULL };
+	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
+	struct drm_framebuffer *fb;
+	unsigned int size;
+	unsigned int flags;
+
+	mode_cmd.width = state->ipp_dst.x + state->ipp_dst.w;
+	mode_cmd.height = state->ipp_dst.y + state->ipp_dst.h;
+	mode_cmd.pitches[0] = roundup(mode_cmd.width, EXYNOS_DRM_PITCH_ALIGN) *
+					(state->base.fb->bits_per_pixel >> 3);
+	mode_cmd.pixel_format = state->base.fb->pixel_format;
+
+	size = mode_cmd.height * mode_cmd.pitches[0];
+
+	if (is_drm_iommu_supported(dev))
+		flags = EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
+	else
+		flags = EXYNOS_BO_CONTIG | EXYNOS_BO_WC;
+
+	exynos_gem[0] = exynos_drm_gem_create(dev, flags, size);
+	if (IS_ERR(exynos_gem[0]))
+		return ERR_PTR(PTR_ERR(exynos_gem[0]));
+
+	fb = exynos_drm_framebuffer_init(dev, &mode_cmd, exynos_gem, 1);
+	if (IS_ERR(fb)) {
+		exynos_drm_gem_destroy(exynos_gem[0]);
+		return fb;
+	}
+
+	return fb;
+}
+
+static bool exynos_plane_ipp_check_fb(struct drm_framebuffer *ipp_fb,
+				struct exynos_drm_plane_state *state)
+{
+	if (state->ipp_dst.x + state->ipp_dst.w <= ipp_fb->width &&
+	    state->ipp_dst.y + state->ipp_dst.h <= ipp_fb->height &&
+	    state->base.fb->pixel_format == ipp_fb->pixel_format &&
+	    state->base.fb->bits_per_pixel == ipp_fb->bits_per_pixel)
+		return true;
+	return false;
+}
+
+static int exynos_plane_ipp_transform(struct exynos_drm_plane_state *state)
+{
+	struct drm_framebuffer *src_fb = state->base.fb;
+	struct drm_framebuffer *dst_fb = state->ipp_fb;
+	struct drm_exynos_ipp_config src_config = {
+		.ops_id = EXYNOS_DRM_OPS_SRC,
+		.sz = {
+			.hsize = src_fb->pitches[0] /
+				 (src_fb->bits_per_pixel >> 3),
+			.vsize = src_fb->height,
+		},
+		.fmt = src_fb->pixel_format,
+		.pos = {
+			.x = state->ipp_src.x,
+			.y = state->ipp_src.y,
+			.w = state->ipp_src.w,
+			.h = state->ipp_src.h,
+		},
+	};
+	struct drm_exynos_ipp_config dst_config = {
+		.sz = {
+			.hsize = dst_fb->pitches[0] /
+				 (dst_fb->bits_per_pixel >> 3),
+			.vsize = dst_fb->height,
+		},
+		.fmt = dst_fb->pixel_format,
+		.pos = {
+			.x = state->ipp_dst.x,
+			.y = state->ipp_dst.y,
+			.w = state->ipp_dst.w,
+			.h = state->ipp_dst.h,
+		},
+	};
+	int degree = 0, flip = 0;
+
+	if (state->rotation & BIT(DRM_ROTATE_180))
+		degree = EXYNOS_DRM_DEGREE_180;
+	else if (state->rotation & BIT(DRM_ROTATE_90))
+		degree = EXYNOS_DRM_DEGREE_90;
+	else if (state->rotation & BIT(DRM_ROTATE_270))
+		degree = EXYNOS_DRM_DEGREE_270;
+
+	if (state->rotation & BIT(DRM_REFLECT_X))
+		flip |= EXYNOS_DRM_FLIP_HORIZONTAL;
+	if (state->rotation & BIT(DRM_REFLECT_Y))
+		flip |= EXYNOS_DRM_FLIP_VERTICAL;
+
+	dst_config.flip = flip;
+	dst_config.degree = degree;
+
+	return exynos_ipp_process_internal(src_fb->dev, &src_config, src_fb,
+					   &dst_config, dst_fb);
+}
+
+void exynos_plane_ipp_setup(struct exynos_drm_plane_state *state,
+			    unsigned int *src_x, unsigned int *src_y,
+			    unsigned int *src_w, unsigned int *src_h)
+{
+	int rotation = state->base.rotation;
+	int pre_x, pre_y, post_x, post_y;
+
+	state->rotation = rotation;
+
+	if (rotation == 0 || rotation == BIT(DRM_ROTATE_0))
+		return;
+
+	state->ipp_needed = true;
+
+	state->ipp_src.x = rounddown(*src_x, EXYNOS_DRM_PITCH_ALIGN);
+	state->ipp_src.y = rounddown(*src_y, EXYNOS_DRM_PITCH_ALIGN);
+	state->ipp_dst.x = 0;
+	state->ipp_dst.y = 0;
+
+	pre_x = *src_x & (EXYNOS_DRM_PITCH_ALIGN - 1);
+	pre_y = *src_y & (EXYNOS_DRM_PITCH_ALIGN - 1);
+
+	state->ipp_src.w = roundup(*src_w + pre_x, EXYNOS_DRM_PITCH_ALIGN);
+	state->ipp_src.h = roundup(*src_h + pre_y, EXYNOS_DRM_PITCH_ALIGN);
+	if (state->ipp_src.w > state->base.fb->pitches[0])
+		state->ipp_src.w = state->base.fb->pitches[0];
+	if (state->ipp_src.h > state->base.fb->height)
+		state->ipp_src.h = state->base.fb->height;
+
+	state->ipp_dst.w = state->ipp_src.w;
+	state->ipp_dst.h = state->ipp_src.h;
+
+	post_x = state->ipp_src.w - pre_x - *src_w;
+	post_y = state->ipp_src.h - pre_y - *src_h;
+
+	if (rotation & BIT(DRM_REFLECT_Y))
+		swap(pre_y, post_y);
+
+	if (rotation & BIT(DRM_REFLECT_X))
+		swap(pre_x, post_x);
+
+	switch (rotation & 0xf) {
+	case BIT(DRM_ROTATE_0):
+		*src_x = pre_x;
+		*src_y = pre_y;
+		break;
+	case BIT(DRM_ROTATE_90):
+		*src_x = post_y;
+		*src_y = pre_x;
+		swap(*src_w, *src_h);
+		swap(state->ipp_dst.w, state->ipp_dst.h);
+		break;
+	case BIT(DRM_ROTATE_180):
+		*src_x = post_x;
+		*src_y = post_y;
+		break;
+	case BIT(DRM_ROTATE_270):
+		*src_x = pre_y;
+		*src_y = post_x;
+		swap(*src_w, *src_h);
+		swap(state->ipp_dst.w, state->ipp_dst.h);
+		break;
+	}
+}
+
+int exynos_plane_ipp_check(struct exynos_drm_plane *plane,
+			   struct exynos_drm_plane_state *state)
+{
+	if (!state->ipp_needed)
+		return 0;
+
+	/* check if currently allocated ipp fb can be reused */
+	if (plane->ipp_next_fb &&
+		!exynos_plane_ipp_check_fb(plane->ipp_next_fb, state)) {
+		drm_framebuffer_unreference(plane->ipp_next_fb);
+		plane->ipp_next_fb = NULL;
+	}
+
+	/* allocate new ipp fb */
+	if (!plane->ipp_next_fb) {
+		struct drm_framebuffer *ipp_fb;
+
+		ipp_fb = exynos_plane_ipp_alloc_fb(plane->base.dev, state);
+		if (IS_ERR(ipp_fb))
+			return PTR_ERR(ipp_fb);
+		plane->ipp_next_fb = ipp_fb;
+	}
+
+	state->fb = state->ipp_fb = plane->ipp_next_fb;
+
+	/* perform transformation */
+	return exynos_plane_ipp_transform(state);
+}
+
+void exynos_plane_ipp_update(struct exynos_drm_plane *plane,
+			     struct exynos_drm_plane_state *state)
+{
+	if (!state->ipp_needed)
+		return;
+
+	if (plane->ipp_next_fb)
+		swap(plane->ipp_next_fb, plane->ipp_cur_fb);
+}
+
+void exynos_plane_ipp_cleanup(struct exynos_drm_plane *plane,
+			      struct exynos_drm_plane_state *old_state)
+{
+	struct exynos_drm_plane_state *state;
+
+	/* get current plane state */
+	state = to_exynos_plane_state(plane->base.state);
+
+	if (!state->ipp_needed) {
+		if (plane->ipp_cur_fb) {
+			drm_framebuffer_unreference(plane->ipp_cur_fb);
+			plane->ipp_cur_fb = NULL;
+		}
+		if (plane->ipp_next_fb) {
+			drm_framebuffer_unreference(plane->ipp_next_fb);
+			plane->ipp_next_fb = NULL;
+		}
+	}
+}
+
+int exynos_plane_ipp_attach_properties(struct drm_device *dev,
+				       struct exynos_drm_plane *plane)
+{
+	if (!dev->mode_config.rotation_property)
+		dev->mode_config.rotation_property =
+			drm_mode_create_rotation_property(dev,
+				BIT(DRM_ROTATE_0) | BIT(DRM_ROTATE_90) |
+				BIT(DRM_ROTATE_180) | BIT(DRM_ROTATE_270) |
+				BIT(DRM_REFLECT_X) | BIT(DRM_REFLECT_Y));
+
+	if (dev->mode_config.rotation_property)
+		drm_object_attach_property(&plane->base.base,
+					   dev->mode_config.rotation_property,
+					   BIT(DRM_ROTATE_0));
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h
new file mode 100644
index 000000000000..defb4f95e075
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h
@@ -0,0 +1,69 @@
+/*
+ * Copyright (C) 2015 Samsung Electronics Co.Ltd
+ * Authors: Marek Szyprowski <m.szyprowski@samsung.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ */
+
+#ifndef _EXYNOS_DRM_PLANE_IPP_H_
+#define _EXYNOS_DRM_PLANE_IPP_H_
+
+#ifdef CONFIG_DRM_EXYNOS_PLANE_IPP
+
+void exynos_plane_ipp_setup(struct exynos_drm_plane_state *state,
+			    unsigned int *src_x, unsigned int *src_y,
+			    unsigned int *src_w, unsigned int *src_h);
+
+int exynos_plane_ipp_check(struct exynos_drm_plane *plane,
+			   struct exynos_drm_plane_state *state);
+
+void exynos_plane_ipp_update(struct exynos_drm_plane *plane,
+			     struct exynos_drm_plane_state *state);
+
+void exynos_plane_ipp_cleanup(struct exynos_drm_plane *plane,
+			      struct exynos_drm_plane_state *old_state);
+
+int exynos_plane_ipp_attach_properties(struct drm_device *dev,
+				       struct exynos_drm_plane *plane);
+
+#else
+
+static inline
+void exynos_plane_ipp_setup(struct exynos_drm_plane_state *state,
+			    unsigned int *src_x, unsigned int *src_y,
+			    unsigned int *src_w, unsigned int *src_h)
+{
+}
+
+static inline
+int exynos_plane_ipp_check(struct exynos_drm_plane *plane,
+			   struct exynos_drm_plane_state *state)
+{
+	return 0;
+}
+
+static inline
+void exynos_plane_ipp_update(struct exynos_drm_plane *plane,
+			     struct exynos_drm_plane_state *state)
+{
+}
+
+static inline
+void exynos_plane_ipp_cleanup(struct exynos_drm_plane *plane,
+			      struct exynos_drm_plane_state *old_state)
+{
+}
+
+static inline
+int exynos_plane_ipp_attach_properties(struct drm_device *dev,
+				       struct exynos_drm_plane *plane)
+{
+	return 0;
+}
+
+#endif
+#endif
-- 
1.9.2
