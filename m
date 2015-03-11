From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 3/7] exynos: honor the repeat mode in g2d_copy_with_scale
Date: Wed, 11 Mar 2015 20:38:42 +0100
Message-ID: <1426102726-27078-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1426102726-27078-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33738 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751252AbbCKTjC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 15:39:02 -0400
In-Reply-To: <1426102726-27078-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This is useful when the default repeat mode, which is 'repeat'
produces artifacts at the borders of the copied image.
Choose the 'pad' mode to make use of the color of the destination
image.

In my usage case the destination is the framebuffer, which is
solid filled with a background color. Scaling with 'pad' mode
would then just do the right thing and also produces nice
borders on the output.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Reviewed-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 exynos/exynos_fimg2d.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 20c3179..5f9e9a7 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -462,6 +462,11 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 
 	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
 	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
+
+	g2d_add_cmd(ctx, SRC_REPEAT_MODE_REG, src->repeat_mode);
+	if (src->repeat_mode == G2D_REPEAT_MODE_PAD)
+		g2d_add_cmd(ctx, SRC_PAD_VALUE_REG, dst->color);
+
 	g2d_add_base_addr(ctx, src, g2d_src);
 	g2d_add_cmd(ctx, SRC_STRIDE_REG, src->stride);
 
-- 
2.0.5
