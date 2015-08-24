From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 06/14] exynos/fimg2d: check buffer space in g2d_copy_with_scale()
Date: Mon, 24 Aug 2015 16:14:01 +0200
Message-ID: <1440425649-9768-7-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50093 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753921AbbHXOPJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 10:15:09 -0400
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Parameter validation goes to the top. Repeat mode is
checked first to make computation of space easier.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 53 ++++++++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 185aa80..2e04f4a 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -467,23 +467,12 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
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
@@ -493,6 +482,8 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 		scale_y = g2d_get_scaling(src_h, dst_h);
 	}
 
+	repeat_pad = src->repeat_mode == G2D_REPEAT_MODE_PAD ? 1 : 0;
+
 	if (src_x + src_w > src->width)
 		src_w = src->width - src_x;
 	if (src_y + src_h > src->height)
@@ -505,21 +496,37 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 
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
