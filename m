From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 07/17] exynos: honor the repeat mode in g2d_copy_with_scale
Date: Tue, 24 Feb 2015 15:20:45 +0100
Message-ID: <1424787655-10739-8-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47948 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752321AbbBXOYX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:24:23 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This is useful when the default repeat mode, which is 'repeat'
produces artifacts at the borders of the copied image.
Choose the 'pad' mode to make use of the color of the destination
image.

In my usage case the destination is the framebuffer, which is
solid filled with a background color. Scaling with 'pad' mode
would then just do the right thing and also produces nice
borders on the output.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 88e0ee6..5314c36 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -454,6 +454,11 @@ g2d_copy_with_scale(struct g2d_context *ctx, struct g2d_image *src,
 
 	g2d_add_cmd(ctx, SRC_SELECT_REG, G2D_SELECT_MODE_NORMAL);
 	g2d_add_cmd(ctx, SRC_COLOR_MODE_REG, src->color_mode);
+
+	g2d_add_cmd(ctx, SRC_REPEAT_MODE_REG, src->repeat_mode);
+	if (src->repeat_mode == G2D_REPEAT_MODE_PAD)
+		g2d_add_cmd(ctx, SRC_PAD_VALUE_REG, dst->color);
+
 	if (src->buf_type == G2D_IMGBUF_USERPTR)
 		g2d_add_cmd(ctx, SRC_BASE_ADDR_REG | G2D_BUF_USERPTR,
 				(unsigned long)&src->user_ptr[0]);
-- 
2.0.5
