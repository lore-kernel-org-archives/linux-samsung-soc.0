From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 08/15] exynos: introduce g2d_add_base_addr helper function
Date: Mon, 16 Feb 2015 14:46:38 +0100
Message-ID: <1424094405-6314-9-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55437 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755547AbbBPNrD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Feb 2015 08:47:03 -0500
In-Reply-To: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

In almost all functions the base address register is written, so it
makes sense to have a helper function for this.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 87 +++++++++++++++++++-------------------------------
 1 file changed, 33 insertions(+), 54 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index b79081e..c08974a 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -41,6 +41,11 @@
 
 #define MIN(a, b)	((a) < (b) ? (a) : (b))
 
+enum g2d_base_addr_reg {
+	g2d_dst = 0,
+	g2d_src
+};
+
 static unsigned int g2d_get_scaling(unsigned int src, unsigned int dst)
 {
 	/* The G2D hw scaling factor is a normalized inverse of the scaling factor. *
@@ -132,6 +137,25 @@ static int g2d_add_cmd(struct g2d_context *ctx, unsigned long cmd,
 }
 
 /*
+ * g2d_add_base_addr - helper function to set dst/src base address register.
+ *
+ * @ctx: a pointer to g2d_context structure.
+ * @img: a pointer to the dst/src g2d_image structure.
+ * @reg: the register that should be set.
+ */
+static void g2d_add_base_addr(struct g2d_context *ctx, struct g2d_image *img,
+			enum g2d_base_addr_reg reg)
+{
+	const unsigned long cmd = (reg == g2d_dst) ? DST_BASE_ADDR_REG : SRC_BASE_ADDR_REG;
+
+	if (img->buf_type == G2D_IMGBUF_USERPTR)
+		g2d_add_cmd(ctx, cmd | G2D_BUF_USERPTR,
+				(unsigned long)&img->user_ptr[0]);
+	else
+		g2d_add_cmd(ctx, cmd, img->bo[0]);
+}
+
+/*
  * g2d_reset - reset fimg2d hardware.
  *
  * @ctx: a pointer to g2d_context structure.
@@ -276,13 +300,7 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 
 	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_NORMAL);
 	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, img->color_mode);
-
-	if (img->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&img->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG, img->bo[0]);
-
+	g2d_add_base_addr(ctx, img, g2d_dst);
 	g2d_add_cmd(ctx, DST_STRIDE_REG, img->stride);
 
 	if (x + w > img->width)
@@ -339,22 +357,12 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 
 	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
 	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
-	if (dst->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&dst->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG, dst->bo[0]);
-
+	g2d_add_base_addr(ctx, dst, g2d_dst);
 	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
 
 	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
 	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
-	if (src->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, SRC_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&src->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, SRC_BASE_ADDR_REG, src->bo[0]);
-
+	g2d_add_base_addr(ctx, src, g2d_src);
 	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
 
 	src_w = w;
@@ -442,12 +450,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 
 	g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_BGCOLOR);
 	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
-	if (dst->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&dst->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG, dst->bo[0]);
-
+	g2d_add_base_addr(ctx, dst, g2d_dst);
 	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
 
 	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
@@ -457,11 +460,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 	if (src->repeat_mode == G2D_REPEAT_MODE_PAD)
 		g2d_add_cmd(ctx, SRC_PAD_VALUE_REG, dst->color);
 
-	if (src->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, SRC_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&src->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, SRC_BASE_ADDR_REG, src->bo[0]);
+	g2d_add_base_addr(ctx, src, g2d_src);
 
 	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
 
@@ -565,12 +564,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 		g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_NORMAL);
 
 	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
-	if (dst->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&dst->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG, dst->bo[0]);
-
+	g2d_add_base_addr(ctx, dst, g2d_dst);
 	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
 
 	g2d_add_cmd(ctx, SRC_SELECT_REG, src->select_mode);
@@ -578,12 +572,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 
 	switch (src->select_mode) {
 	case G2D_SELECT_MODE_NORMAL:
-		if (src->buf_type == G2D_IMGBUF_USERPTR)
-			g2d_add_cmd(ctx, SRC_BASE_ADDR_REG | G2D_BUF_USERPTR,
-					(unsigned long)&src->user_ptr[0]);
-		else
-			g2d_add_cmd(ctx, SRC_BASE_ADDR_REG, src->bo[0]);
-
+		g2d_add_base_addr(ctx, src, g2d_src);
 		g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
 		break;
 	case G2D_SELECT_MODE_FGCOLOR:
@@ -688,12 +677,7 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 		g2d_add_cmd(ctx, DST_SELECT_REG, G2D_SELECT_MODE_NORMAL);
 
 	g2d_add_cmd(ctx, DST_COLOR_MODE_REG, dst->color_mode);
-	if (dst->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&dst->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, DST_BASE_ADDR_REG, dst->bo[0]);
-
+	g2d_add_base_addr(ctx, dst, g2d_dst);
 	g2d_add_cmd(ctx, DST_STRIDE_REG, dst->stride);
 
 	g2d_add_cmd(ctx, SRC_SELECT_REG, src->select_mode);
@@ -701,12 +685,7 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 
 	switch (src->select_mode) {
 	case G2D_SELECT_MODE_NORMAL:
-		if (src->buf_type == G2D_IMGBUF_USERPTR)
-			g2d_add_cmd(ctx, SRC_BASE_ADDR_REG | G2D_BUF_USERPTR,
-					(unsigned long)&src->user_ptr[0]);
-		else
-			g2d_add_cmd(ctx, SRC_BASE_ADDR_REG, src->bo[0]);
-
+		g2d_add_base_addr(ctx, src, g2d_src);
 		g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
 		break;
 	case G2D_SELECT_MODE_FGCOLOR:
-- 
2.0.5
