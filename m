From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 6/7] exynos: fimg2d: fix return codes
Date: Thu, 23 Apr 2015 16:43:05 +0200
Message-ID: <1429800186-12644-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429800186-12644-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42601 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757733AbbDWOrk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 10:47:40 -0400
In-Reply-To: <1429800186-12644-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Even if flushing the command buffer doesn't succeed, the
G2D calls would still return zero. Fix this by just passing
the flush return code.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 1a99f17..05ea7bc 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -364,9 +364,7 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 	bitblt.data.fast_solid_color_fill_en = 1;
 	g2d_add_cmd(ctx, BITBLT_COMMAND_REG, bitblt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -449,9 +447,7 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 	rop4.data.unmasked_rop3 = G2D_ROP3_SRC;
 	g2d_add_cmd(ctx, ROP4_REG, rop4.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -561,9 +557,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 	pt.data.y = dst_y + dst_h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -670,9 +664,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 	pt.data.y = dst_y + h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -800,7 +792,5 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 	pt.data.y = dst_y + dst_h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
-- 
2.0.5
