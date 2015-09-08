From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 3/9] exynos/fimg2d: add g2d_check_space()
Date: Tue,  8 Sep 2015 17:22:28 +0200
Message-ID: <1441725754-27555-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34626 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755025AbbIHPXZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 11:23:25 -0400
In-Reply-To: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This is going to be used to check if the command buffers have
enough space left prior to actual submission of the commands.

Use this in g2d_{solid_fill,copy,copy_with_scale}().

For this the parameter validation before buffer space
checking so that we can exit early if it fails.
Also don't reset the G2D context in this situation since
the buffers are not partially submitted anymore.

The repeat mode in g2d_copy_with_scale() is checked first
to make computation of space easier.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 99 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 35 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 85b2317..2e04f4a 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -102,6 +102,23 @@ static unsigned int g2d_get_blend_op(enum e_g2d_op op)
 }
 
 /*
+ * g2d_check_space - check if command buffers have enough space left.
+ *
+ * @ctx: a pointer to g2d_context structure.
+ * @num_cmds: number of (regular) commands.
+ * @num_gem_cmds: number of GEM commands.
+ */
+static unsigned int g2d_check_space(const struct g2d_context *ctx,
+	unsigned int num_cmds, unsigned int num_gem_cmds)
+{
+	if (ctx->cmd_nr + num_cmds >= G2D_MAX_CMD_NR ||
+	    ctx->cmd_buf_nr + num_gem_cmds >= G2D_MAX_GEM_CMD_NR)
+		return 1;
+	else
+		return 0;
+}
+
+/*
  * g2d_add_cmd - set given command and value to user side command buffer.
  *
  * @ctx: a pointer to g2d_context structure.
@@ -302,6 +319,9 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 	union g2d_bitblt_cmd_val bitblt;
 	union g2d_point_val pt;
 
+	if (g2d_check_space(ctx, 7, 1))
+		return -ENOSPC;
+
 	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_NORMAL);
 	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, img->color_mode);
 	g2d_add_base_addr(ctx, img, g2d_dst);
@@ -355,17 +375,7 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 {
 	union g2d_rop4_val rop4;
 	union g2d_point_val pt;
-	unsigned int src_w = 0, src_h = 0, dst_w = 0, dst_h = 0;
-
-	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
-	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
-	g2d_add_base_addr(ctx, dst, g2d_dst);
-	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
-
-	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
-	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
-	g2d_add_base_addr(ctx, src, g2d_src);
-	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
+	unsigned int src_w, src_h, dst_w, dst_h;
 
 	src_w = w;
 	src_h = h;
@@ -386,10 +396,22 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 
 	if (w <= 0 || h <= 0) {
 		fprintf(stderr, "invalid width or height.\n");
-		g2d_reset(ctx);
 		return -EINVAL;
 	}
 
+	if (g2d_check_space(ctx, 11, 2))
+		return -ENOSPC;
+
+	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
+	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
+	g2d_add_base_addr(ctx, dst, g2d_dst);
+	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
+
+	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
+	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
+	g2d_add_base_addr(ctx, src, g2d_src);
+	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
+
 	pt.val = 0;
 	pt.data.x = src_x;
 	pt.data.y = src_y;
@@ -445,23 +467,12 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 {
 	union g2d_rop4_val rop4;
 	union g2d_point_val pt;
-	unsigned int scale;
+	unsigned int scale, repeat_pad;
 	unsigned int scale_x, scale_y;
 
-	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
-	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
-	g2d_add_base_addr(ctx, dst, g2d_dst);
-	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
-
-	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
-	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
-
-	g2d_add_cmd(ctx, SRC_REPEAT_MODE_REG, src->repeat_mode);
-	if (src->repeat_mode == G2D_REPEAT_MODE_PAD)
-		g2d_add_cmd(ctx, SRC_PAD_VALUE_REG, dst->color);
-
-	g2d_add_base_addr(ctx, src, g2d_src);
-	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
+	/* Sanitize this parameter to facilitate space computation below. */
+	if (negative)
+		negative = 1;
 
 	if (src_w == dst_w && src_h == dst_h)
 		scale = 0;
@@ -471,6 +482,8 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 		scale_y = g2d_get_scaling(src_h, dst_h);
 	}
 
+	repeat_pad = src->repeat_mode == G2D_REPEAT_MODE_PAD ? 1 : 0;
+
 	if (src_x + src_w > src->width)
 		src_w = src->width - src_x;
 	if (src_y + src_h > src->height)
@@ -483,21 +496,37 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 
 	if (src_w <= 0 || src_h <= 0 || dst_w <= 0 || dst_h <= 0) {
 		fprintf(stderr, "invalid width or height.\n");
-		g2d_reset(ctx);
 		return -EINVAL;
 	}
 
+	if (g2d_check_space(ctx, 12 + scale * 3 + negative + repeat_pad, 2))
+		return -ENOSPC;
+
+	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
+	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
+	g2d_add_base_addr(ctx, dst, g2d_dst);
+	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
+
+	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
+	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
+
+	g2d_add_cmd(ctx, SRC_REPEAT_MODE_REG, src->repeat_mode);
+	if (repeat_pad)
+		g2d_add_cmd(ctx, SRC_PAD_VALUE_REG, dst->color);
+
+	g2d_add_base_addr(ctx, src, g2d_src);
+	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
+
+	rop4.val = 0;
+	rop4.data.unmasked_rop3 = G2D_ROP3_SRC;
+
 	if (negative) {
 		g2d_add_cmd(ctx, BG_COLOR_REG, 0x00FFFFFF);
-		rop4.val = 0;
-		rop4.data.unmasked_rop3 = G2D_ROP3_SRC^G2D_ROP3_DST;
-		g2d_add_cmd(ctx, ROP4_REG, rop4.val);
-	} else {
-		rop4.val = 0;
-		rop4.data.unmasked_rop3 = G2D_ROP3_SRC;
-		g2d_add_cmd(ctx, ROP4_REG, rop4.val);
+		rop4.data.unmasked_rop3 ^= G2D_ROP3_DST;
 	}
 
+	g2d_add_cmd(ctx, ROP4_REG, rop4.val);
+
 	if (scale) {
 		g2d_add_cmd(ctx, SRC_SCALE_CTRL_REG, G2D_SCALE_MODE_BILINEAR);
 		g2d_add_cmd(ctx, SRC_XSCALE_REG, scale_x);
-- 
2.0.5
