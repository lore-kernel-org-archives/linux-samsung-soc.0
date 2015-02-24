From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 08/17] exynos: introduce g2d_add_base_addr helper function
Date: Tue, 24 Feb 2015 15:20:46 +0100
Message-ID: <1424787655-10739-9-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47954 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752410AbbBXOYq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:24:46 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

In almost all functions the base address register is written, so it
makes sense to have a helper function for this.

v3: Wrap line as pointed out by Emil Velikov
    <emil.l.velikov at gmail.com>.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 88 +++++++++++++++++++-------------------------------
 1 file changed, 34 insertions(+), 54 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 5314c36..17d7342 100644
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
 	/*
@@ -134,6 +139,26 @@ static int g2d_add_cmd(struct g2d_context *ctx, unsigned long cmd,
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
+	const unsigned long cmd = (reg == g2d_dst) ?
+		DST_BASE_ADDR_REG : SRC_BASE_ADDR_REG;
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
@@ -278,13 +303,7 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 
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
@@ -341,22 +360,12 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 
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
@@ -444,12 +453,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 
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
@@ -459,11 +463,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 	if (src->repeat_mode == G2D_REPEAT_MODE_PAD)
 		g2d_add_cmd(ctx, SRC_PAD_VALUE_REG, dst->color);
 
-	if (src->buf_type == G2D_IMGBUF_USERPTR)
-		g2d_add_cmd(ctx, SRC_BASE_ADDR_REG | G2D_BUF_USERPTR,
-				(unsigned long)&src->user_ptr[0]);
-	else
-		g2d_add_cmd(ctx, SRC_BASE_ADDR_REG, src->bo[0]);
+	g2d_add_base_addr(ctx, src, g2d_src);
 
 	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
 
@@ -567,12 +567,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
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
@@ -580,12 +575,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 
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
@@ -690,12 +680,7 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
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
@@ -703,12 +688,7 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 
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
