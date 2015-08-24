From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 11/14] exynos/fimg2d: remove superfluous initialization of g2d_point_val
Date: Mon, 24 Aug 2015 16:14:06 +0200
Message-ID: <1440425649-9768-12-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50205 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754323AbbHXOQ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 10:16:28 -0400
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The g2d_point_val union consists of two coordinates of 16
bits. Whenever this union is used though, both coordinates
are explicitly set. Hence prior initialization is unnecessary.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index d708e91..acde645 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -371,15 +371,12 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 	if (y + h > img->height)
 		h = img->height - y;
 
-	pt.val = 0;
 	pt.data.x = x;
 	pt.data.y = y;
 	g2d_add_cmd(ctx, DST_LEFT_TOP_REG, pt.val);
 
-	pt.val = 0;
 	pt.data.x = x + w;
 	pt.data.y = y + h;
-
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
 
 	g2d_add_cmd(ctx, SF_COLOR_REG, img->color);
@@ -451,20 +448,16 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 	g2d_add_base_addr(ctx, src, g2d_src);
 	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
 
-	pt.val = 0;
 	pt.data.x = src_x;
 	pt.data.y = src_y;
 	g2d_add_cmd(ctx, SRC_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = src_x + w;
 	pt.data.y = src_y + h;
 	g2d_add_cmd(ctx, SRC_RIGHT_BOTTOM_REG, pt.val);
 
-	pt.val = 0;
 	pt.data.x = dst_x;
 	pt.data.y = dst_y;
 	g2d_add_cmd(ctx, DST_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = dst_x + w;
 	pt.data.y = dst_y + h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
@@ -572,20 +565,16 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 		g2d_add_cmd(ctx, SRC_YSCALE_REG, scale_y);
 	}
 
-	pt.val = 0;
 	pt.data.x = src_x;
 	pt.data.y = src_y;
 	g2d_add_cmd(ctx, SRC_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = src_x + src_w;
 	pt.data.y = src_y + src_h;
 	g2d_add_cmd(ctx, SRC_RIGHT_BOTTOM_REG, pt.val);
 
-	pt.val = 0;
 	pt.data.x = dst_x;
 	pt.data.y = dst_y;
 	g2d_add_cmd(ctx, DST_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = dst_x + dst_w;
 	pt.data.y = dst_y + dst_h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
@@ -691,20 +680,16 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 	g2d_add_cmd(ctx, BITBLT_COMMAND_REG, bitblt.val);
 	g2d_add_cmd(ctx, BLEND_FUNCTION_REG, blend.val);
 
-	pt.val = 0;
 	pt.data.x = src_x;
 	pt.data.y = src_y;
 	g2d_add_cmd(ctx, SRC_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = src_x + w;
 	pt.data.y = src_y + h;
 	g2d_add_cmd(ctx, SRC_RIGHT_BOTTOM_REG, pt.val);
 
-	pt.val = 0;
 	pt.data.x = dst_x;
 	pt.data.y = dst_y;
 	g2d_add_cmd(ctx, DST_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = dst_x + w;
 	pt.data.y = dst_y + h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
@@ -820,20 +805,16 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 	g2d_add_cmd(ctx, BITBLT_COMMAND_REG, bitblt.val);
 	g2d_add_cmd(ctx, BLEND_FUNCTION_REG, blend.val);
 
-	pt.val = 0;
 	pt.data.x = src_x;
 	pt.data.y = src_y;
 	g2d_add_cmd(ctx, SRC_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = src_x + src_w;
 	pt.data.y = src_y + src_h;
 	g2d_add_cmd(ctx, SRC_RIGHT_BOTTOM_REG, pt.val);
 
-	pt.val = 0;
 	pt.data.x = dst_x;
 	pt.data.y = dst_y;
 	g2d_add_cmd(ctx, DST_LEFT_TOP_REG, pt.val);
-	pt.val = 0;
 	pt.data.x = dst_x + dst_w;
 	pt.data.y = dst_y + dst_h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
-- 
2.0.5
