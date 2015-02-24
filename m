From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 02/17] exynos: replace G2D_DOUBLE_TO_FIXED macro with function
Date: Tue, 24 Feb 2015 15:20:40 +0100
Message-ID: <1424787655-10739-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47890 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752357AbbBXOWN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:22:13 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This also avoids the floating point conversion steps and just
uses pure integer arithmetic.
Since the G2D hardware scaling approach is a bit unintuitive,
document it in the function as well.

v2: Explicitly mention the normalization constant.
v3: Use common commenting style as pointed out by
    Emil Velikov <emil.l.velikov at gmail.com>.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 22 +++++++++++++++++-----
 exynos/fimg2d.h        |  2 --
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index ce1ba1e..9c66c3a 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -41,6 +41,18 @@
 
 #define MIN(a, b)	((a) < (b) ? (a) : (b))
 
+static unsigned int g2d_get_scaling(unsigned int src, unsigned int dst)
+{
+	/*
+	 * The G2D hw scaling factor is a normalized inverse of the scaling factor.
+	 * For example: When source width is 100 and destination width is 200
+	 * (scaling of 2x), then the hw factor is NC * 100 / 200.
+	 * The normalization factor (NC) is 2^16 = 0x10000.
+	 */
+
+	return ((src << 16) / dst);
+}
+
 static unsigned int g2d_get_blend_op(enum e_g2d_op op)
 {
 	union g2d_blend_func_val val;
@@ -428,7 +440,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 	union g2d_rop4_val rop4;
 	union g2d_point_val pt;
 	unsigned int scale;
-	double scale_x = 0.0f, scale_y = 0.0f;
+	unsigned int scale_x, scale_y;
 
 	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
 	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
@@ -454,8 +466,8 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 		scale = 0;
 	else {
 		scale = 1;
-		scale_x = (double)src_w / (double)dst_w;
-		scale_y = (double)src_h / (double)dst_h;
+		scale_x = g2d_get_scaling(src_w, dst_w);
+		scale_y = g2d_get_scaling(src_h, dst_h);
 	}
 
 	if (src_x + src_w > src->width)
@@ -487,8 +499,8 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 
 	if (scale) {
 		g2d_add_cmd(ctx, SRC_SCALE_CTRL_REG, G2D_SCALE_MODE_BILINEAR);
-		g2d_add_cmd(ctx, SRC_XSCALE_REG, G2D_DOUBLE_TO_FIXED(scale_x));
-		g2d_add_cmd(ctx, SRC_YSCALE_REG, G2D_DOUBLE_TO_FIXED(scale_y));
+		g2d_add_cmd(ctx, SRC_XSCALE_REG, scale_x);
+		g2d_add_cmd(ctx, SRC_YSCALE_REG, scale_y);
 	}
 
 	pt.val = 0;
diff --git a/exynos/fimg2d.h b/exynos/fimg2d.h
index 4785e2f..8e0321c 100644
--- a/exynos/fimg2d.h
+++ b/exynos/fimg2d.h
@@ -25,8 +25,6 @@
 #define G2D_MAX_CMD_LIST_NR	64
 #define G2D_PLANE_MAX_NR	2
 
-#define G2D_DOUBLE_TO_FIXED(d)		((unsigned int)((d) * 65536.0))
-
 enum e_g2d_color_mode {
 	/* COLOR FORMAT */
 	G2D_COLOR_FMT_XRGB8888,
-- 
2.0.5
