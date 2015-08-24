From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 09/14] exynos/fimg2d: check buffer space in g2d_scale_and_blend()
Date: Mon, 24 Aug 2015 16:14:04 +0200
Message-ID: <1440425649-9768-10-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50193 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754687AbbHXOQQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 10:16:16 -0400
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Apply the same transformation as in g2d_blend().

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 67 +++++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 28 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 5acccf8..4274a94 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -745,9 +745,47 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 	union g2d_point_val pt;
 	union g2d_bitblt_cmd_val bitblt;
 	union g2d_blend_func_val blend;
-	unsigned int scale;
+	unsigned int scale, gem_space;
 	unsigned int scale_x, scale_y;
 
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
+		return -EINVAL;
+	}
+
+	if (g2d_validate_select_mode(src->select_mode)) {
+		fprintf(stderr , "invalid select mode for source.\n");
+		return -EINVAL;
+	}
+
+	if (g2d_validate_blending_op(op)) {
+		fprintf(stderr , "unsupported blending operation.\n");
+		return -EINVAL;
+	}
+
+	gem_space = src->select_mode == G2D_SELECT_MODE_NORMAL ? 2 : 1;
+
+	if (g2d_check_space(ctx, 12 + scale * 3, gem_space))
+		return -ENOSPC;
+
 	bitblt.val = 0;
 	blend.val = 0;
 
@@ -774,33 +812,6 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 	case G2D_SELECT_MODE_BGCOLOR:
 		g2d_add_cmd(ctx, BG_COLOR_REG, src->color);
 		break;
-	default:
-		fprintf(stderr , "failed to set src.\n");
-		return -EINVAL;
-	}
-
-	if (src_w == dst_w && src_h == dst_h)
-		scale = 0;
-	else {
-		scale = 1;
-		scale_x = g2d_get_scaling(src_w, dst_w);
-		scale_y = g2d_get_scaling(src_h, dst_h);
-	}
-
-	if (src_x + src_w > src->width)
-		src_w = src->width - src_x;
-	if (src_y + src_h > src->height)
-		src_h = src->height - src_y;
-
-	if (dst_x + dst_w > dst->width)
-		dst_w = dst->width - dst_x;
-	if (dst_y + dst_h > dst->height)
-		dst_h = dst->height - dst_y;
-
-	if (src_w <= 0 || src_h <= 0 || dst_w <= 0 || dst_h <= 0) {
-		fprintf(stderr, "invalid width or height.\n");
-		g2d_reset(ctx);
-		return -EINVAL;
 	}
 
 	if (scale) {
-- 
2.0.5
