From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 3/4] drm/exynos: fimd: Add support for FIMD variants with clock selection
Date: Wed,  1 May 2013 21:02:28 +0200
Message-ID: <1367434949-14838-4-git-send-email-tomasz.figa@gmail.com>
References: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:37892 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756051Ab3EATCp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 May 2013 15:02:45 -0400
Received: by mail-ee0-f46.google.com with SMTP id c13so768203eek.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2013 12:02:43 -0700 (PDT)
In-Reply-To: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, t.figa@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>

Some platforms that can be supported this driver has additional clock
source selection bits in VIDCON0 register that allows to select which
clock should be used to drive the pixel clock: bus clock or special
clock.

Since this driver assumes that special clock always drives the pixel
clock, this patch sets the selection bitfield to use the special clock.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a5559f6..a2e385d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -65,6 +65,7 @@ struct fimd_driver_data {
 	unsigned int timing_base;
 
 	unsigned int has_shadowcon:1;
+	unsigned int has_clksel:1;
 };
 
 static struct fimd_driver_data exynos4_fimd_driver_data = {
@@ -278,6 +279,11 @@ static void fimd_commit(struct device *dev)
 	val = ctx->vidcon0;
 	val &= ~(VIDCON0_CLKVAL_F_MASK | VIDCON0_CLKDIR);
 
+	if (ctx->driver_data->has_clksel) {
+		val &= ~VIDCON0_CLKSEL_MASK;
+		val |= VIDCON0_CLKSEL_LCD;
+	}
+
 	if (ctx->clkdiv > 1)
 		val |= VIDCON0_CLKVAL_F(ctx->clkdiv - 1) | VIDCON0_CLKDIR;
 	else
-- 
1.8.2.1
