From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 05/15] exynos: add g2d_scale_and_blend
Date: Tue,  3 Feb 2015 14:53:55 +0100
Message-ID: <1422971645-30621-6-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46024 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751867AbbBCNy1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:27 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This is a combination of g2d_copy_with_scale and g2d_scale.
It is a pretty common operation to scale one buffer and then
blend it on top of another, so provide a direct way to that
operation.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 129 +++++++++++++++++++++++++++++++++++++++++++++++++
 exynos/fimg2d.h        |   5 ++
 2 files changed, 134 insertions(+)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index e7b00b1..d6ad9a7 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -642,3 +642,132 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 	return 0;
 }
 
+/**
+ * g2d_scale_and_blend - apply scaling to source buffer and then blend to destination buffer
+ *
+ * @ctx: a pointer to g2d_context structure.
+ * @src: a pointer to g2d_image structure including image and buffer
+ *	information to source.
+ * @dst: a pointer to g2d_image structure including image and buffer
+ *	information to destination.
+ * @src_x: x start position to source buffer.
+ * @src_y: y start position to source buffer.
+ * @src_w: width value to source buffer.
+ * @src_h: height value to source buffer.
+ * @dst_x: x start position to destination buffer.
+ * @dst_y: y start position to destination buffer.
+ * @dst_w: width value to destination buffer.
+ * @dst_h: height value to destination buffer.
+ * @op: blend operation type.
+ */
+drm_public int
+g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
+		struct g2d_image *dst, unsigned int src_x, unsigned int src_y,
+		unsigned int src_w, unsigned int src_h, unsigned int dst_x,
+		unsigned int dst_y, unsigned int dst_w, unsigned int dst_h,
+		enum e_g2d_op op)
+{
+	union g2d_point_val pt;
+	union g2d_bitblt_cmd_val bitblt;
+	union g2d_blend_func_val blend;
+	unsigned int scale;
+	unsigned int scale_x, scale_y;
+
+	bitblt.val = 0;
+	blend.val = 0;
+
+	if (op == G2D_OP_SRC || op == G2D_OP_CLEAR)
+		g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
+	else
+		g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_NORMAL);
+
+	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
+	if (dst->buf_type == G2D_IMGBUF_USERPTR)
+		g2d_add_cmd(ctx, DST_BASE_ADDR_REG | G2D_BUF_USERPTR,
+				(unsigned long)&dst->user_ptr[0]);
+	else
+		g2d_add_cmd(ctx, DST_BASE_ADDR_REG, dst->bo[0]);
+
+	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
+
+	g2d_add_cmd(ctx, SRC_SELECT_REG, src->select_mode);
+	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
+
+	switch (src->select_mode) {
+	case G2D_SELECT_MODE_NORMAL:
+		if (src->buf_type == G2D_IMGBUF_USERPTR)
+			g2d_add_cmd(ctx, SRC_BASE_ADDR_REG | G2D_BUF_USERPTR,
+					(unsigned long)&src->user_ptr[0]);
+		else
+			g2d_add_cmd(ctx, SRC_BASE_ADDR_REG, src->bo[0]);
+
+		g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
+		break;
+	case G2D_SELECT_MODE_FGCOLOR:
+		g2d_add_cmd(ctx, FG_COLOR_REG, src->color);
+		break;
+	case G2D_SELECT_MODE_BGCOLOR:
+		g2d_add_cmd(ctx, BG_COLOR_REG, src->color);
+		break;
+	default:
+		fprintf(stderr , "failed to set src.\n");
+		return -EINVAL;
+	}
+
+	if (src_w == dst_w && src_h == dst_h)
+		scale = 0;
+	else {
+		scale = 1;
+		scale_x = g2d_get_scaling(src_w, dst_w);
+		scale_y = g2d_get_scaling(src_h, dst_h);
+	}
+
+	if (src_x + src_w > src->width)
+		src_w = src->width - src_x;
+	if (src_y + src_h > src->height)
+		src_h = src->height - src_y;
+
+	if (dst_x + dst_w > dst->width)
+		dst_w = dst->width - dst_x;
+	if (dst_y + dst_h > dst->height)
+		dst_h = dst->height - dst_y;
+
+	if (src_w <= 0 || src_h <= 0 || dst_w <= 0 || dst_h <= 0) {
+		fprintf(stderr, "invalid width or height.\n");
+		g2d_reset(ctx);
+		return -EINVAL;
+	}
+
+	if (scale) {
+		g2d_add_cmd(ctx, SRC_SCALE_CTRL_REG, G2D_SCALE_MODE_BILINEAR);
+		g2d_add_cmd(ctx, SRC_XSCALE_REG, scale_x);
+		g2d_add_cmd(ctx, SRC_YSCALE_REG, scale_y);
+	}
+
+	bitblt.data.alpha_blend_mode = G2D_ALPHA_BLEND_MODE_ENABLE;
+	blend.val = g2d_get_blend_op(op);
+	g2d_add_cmd(ctx, BITBLT_COMMAND_REG, bitblt.val);
+	g2d_add_cmd(ctx, BLEND_FUNCTION_REG, blend.val);
+
+	pt.val = 0;
+	pt.data.x = src_x;
+	pt.data.y = src_y;
+	g2d_add_cmd(ctx, SRC_LEFT_TOP_REG, pt.val);
+	pt.val = 0;
+	pt.data.x = src_x + src_w;
+	pt.data.y = src_y + src_h;
+	g2d_add_cmd(ctx, SRC_RIGHT_BOTTOM_REG, pt.val);
+
+	pt.val = 0;
+	pt.data.x = dst_x;
+	pt.data.y = dst_y;
+	g2d_add_cmd(ctx, DST_LEFT_TOP_REG, pt.val);
+	pt.val = 0;
+	pt.data.x = dst_x + dst_w;
+	pt.data.y = dst_y + dst_h;
+	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
+
+	g2d_flush(ctx);
+
+	return 0;
+}
diff --git a/exynos/fimg2d.h b/exynos/fimg2d.h
index 8e0321c..bd116cf 100644
--- a/exynos/fimg2d.h
+++ b/exynos/fimg2d.h
@@ -320,4 +320,9 @@ int g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 		struct g2d_image *dst, unsigned int src_x,
 		unsigned int src_y, unsigned int dst_x, unsigned int dst_y,
 		unsigned int w, unsigned int h, enum e_g2d_op op);
+int g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
+		struct g2d_image *dst, unsigned int src_x, unsigned int src_y,
+		unsigned int src_w, unsigned int src_h, unsigned int dst_x,
+		unsigned int dst_y, unsigned int dst_w, unsigned int dst_h,
+		enum e_g2d_op op);
 #endif /* _FIMG2D_H_ */
-- 
2.0.5
