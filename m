From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 1/9] exynos: fimg2d: fix return codes
Date: Fri, 12 Jun 2015 20:15:06 +0200
Message-ID: <1434132914-3150-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50872 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753027AbbFLSPM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 14:15:12 -0400
In-Reply-To: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Even if flushing the command buffer doesn't succeed, the
G2D calls would still return zero. Fix this by just passing
the flush return code.

In fact error handling currently ignores the fact that
g2d_add_cmd() can fail. This is going to be handled
in a later patch.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 86ae898..5ea42e6 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -330,9 +330,7 @@ g2d_solid_fill(struct g2d_context *ctx, struct g2d_image *img,
 	bitblt.data.fast_solid_color_fill_en = 1;
 	g2d_add_cmd(ctx, BITBLT_COMMAND_REG, bitblt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -415,9 +413,7 @@ g2d_copy(struct g2d_context *ctx, struct g2d_image *src,
 	rop4.data.unmasked_rop3 = G2D_ROP3_SRC;
 	g2d_add_cmd(ctx, ROP4_REG, rop4.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -527,9 +523,7 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 	pt.data.y = dst_y + dst_h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -636,9 +630,7 @@ g2d_blend(struct g2d_context *ctx, struct g2d_image *src,
 	pt.data.y = dst_y + h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
 
 /**
@@ -766,7 +758,5 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 	pt.data.y = dst_y + dst_h;
 	g2d_add_cmd(ctx, DST_RIGHT_BOTTOM_REG, pt.val);
 
-	g2d_flush(ctx);
-
-	return 0;
+	return g2d_flush(ctx);
 }
-- 
2.0.5
