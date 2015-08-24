From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 02/14] exynos/fimg2d: simplify base address submission in g2d_scale_and_blend()
Date: Mon, 24 Aug 2015 16:13:57 +0200
Message-ID: <1440425649-9768-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50070 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754323AbbHXOO1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 10:14:27 -0400
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Use g2d_add_base_addr() for source and destination base
address just like all other calls.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 4a88e0c..85b2317 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -672,12 +672,7 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
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
@@ -685,12 +680,7 @@ g2d_scale_and_blend(struct g2d_context *ctx, struct g2d_image *src,
 
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
