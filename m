From: Chanho Park <parkch98@gmail.com>
Subject: [PATCH] drm/exynos: use DIV_ROUND_CLOSEST to find the closest div
Date: Thu, 11 Feb 2016 23:11:20 +0900
Message-ID: <1455199880-4426-1-git-send-email-parkch98@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:34612 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751123AbcBKOLe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 09:11:34 -0500
Received: by mail-pf0-f173.google.com with SMTP id x65so30092572pfb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Feb 2016 06:11:34 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

From: Chanho Park <chanho61.park@samsung.com>

This patch uses DIV_ROUND_CLOSEST instead of DIV_ROUND_UP
The DIV_ROUND_CLOSEST can be used to find the closest integer
value when we divide some integers.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 4fb2952..da97f93 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -383,7 +383,7 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
 	}
 
 	/* Find the clock divider value that gets us closest to ideal_clk */
-	clkdiv = DIV_ROUND_UP(clk_get_rate(ctx->lcd_clk), ideal_clk);
+	clkdiv = DIV_ROUND_CLOSEST(clk_get_rate(ctx->lcd_clk), ideal_clk);
 
 	return (clkdiv < 0x100) ? clkdiv : 0xff;
 }
-- 
2.5.0
