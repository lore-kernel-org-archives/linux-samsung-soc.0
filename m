From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 2/4] drm/exynos: fimd: Add support for FIMD versions without SHADOWCON register
Date: Wed,  1 May 2013 21:02:27 +0200
Message-ID: <1367434949-14838-3-git-send-email-tomasz.figa@gmail.com>
References: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:54519 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755858Ab3EATCn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 May 2013 15:02:43 -0400
Received: by mail-ee0-f44.google.com with SMTP id t10so798391eei.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2013 12:02:42 -0700 (PDT)
In-Reply-To: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, t.figa@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>

Some platforms that can be supported with this driver have PRTCON
register instead of SHADOWCON, which requires slightly different
handling.

This patch factors out all register shadow control code from the driver
and adds a function to control register shadowing appropriately,
depending on driver data.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 69 +++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 264434f..a5559f6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -63,14 +63,18 @@
 
 struct fimd_driver_data {
 	unsigned int timing_base;
+
+	unsigned int has_shadowcon:1;
 };
 
 static struct fimd_driver_data exynos4_fimd_driver_data = {
 	.timing_base = 0x0,
+	.has_shadowcon = 1,
 };
 
 static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.timing_base = 0x20000,
+	.has_shadowcon = 1,
 };
 
 struct fimd_win_data {
@@ -489,6 +493,33 @@ static void fimd_win_set_colkey(struct device *dev, unsigned int win)
 	writel(keycon1, ctx->regs + WKEYCON1_BASE(win));
 }
 
+/**
+ * shadow_protect_win() - disable updating values from shadow registers at vsync
+ *
+ * @win: window to protect registers for
+ * @protect: 1 to protect (disable updates)
+ */
+static void fimd_shadow_protect_win(struct fimd_context *ctx,
+							int win, bool protect)
+{
+	u32 reg, bits, val;
+
+	if (ctx->driver_data->has_shadowcon) {
+		reg = SHADOWCON;
+		bits = SHADOWCON_WINx_PROTECT(win);
+	} else {
+		reg = PRTCON;
+		bits = PRTCON_PROTECT;
+	}
+
+	val = readl(ctx->regs + reg);
+	if (protect)
+		val |= bits;
+	else
+		val &= ~bits;
+	writel(val, ctx->regs + reg);
+}
+
 static void fimd_win_commit(struct device *dev, int zpos)
 {
 	struct fimd_context *ctx = get_fimd_context(dev);
@@ -512,7 +543,7 @@ static void fimd_win_commit(struct device *dev, int zpos)
 	win_data = &ctx->win_data[win];
 
 	/*
-	 * SHADOWCON register is used for enabling timing.
+	 * SHADOWCON/PRTCON register is used for enabling timing.
 	 *
 	 * for example, once only width value of a register is set,
 	 * if the dma is started then fimd hardware could malfunction so
@@ -522,9 +553,7 @@ static void fimd_win_commit(struct device *dev, int zpos)
 	 */
 
 	/* protect windows */
-	val = readl(ctx->regs + SHADOWCON);
-	val |= SHADOWCON_WINx_PROTECT(win);
-	writel(val, ctx->regs + SHADOWCON);
+	fimd_shadow_protect_win(ctx, win, true);
 
 	/* buffer start address */
 	val = (unsigned long)win_data->dma_addr;
@@ -602,10 +631,13 @@ static void fimd_win_commit(struct device *dev, int zpos)
 	writel(val, ctx->regs + WINCON(win));
 
 	/* Enable DMA channel and unprotect windows */
-	val = readl(ctx->regs + SHADOWCON);
-	val |= SHADOWCON_CHx_ENABLE(win);
-	val &= ~SHADOWCON_WINx_PROTECT(win);
-	writel(val, ctx->regs + SHADOWCON);
+	fimd_shadow_protect_win(ctx, win, false);
+
+	if (ctx->driver_data->has_shadowcon) {
+		val = readl(ctx->regs + SHADOWCON);
+		val |= SHADOWCON_CHx_ENABLE(win);
+		writel(val, ctx->regs + SHADOWCON);
+	}
 
 	win_data->enabled = true;
 }
@@ -634,9 +666,7 @@ static void fimd_win_disable(struct device *dev, int zpos)
 	}
 
 	/* protect windows */
-	val = readl(ctx->regs + SHADOWCON);
-	val |= SHADOWCON_WINx_PROTECT(win);
-	writel(val, ctx->regs + SHADOWCON);
+	fimd_shadow_protect_win(ctx, win, true);
 
 	/* wincon */
 	val = readl(ctx->regs + WINCON(win));
@@ -644,10 +674,13 @@ static void fimd_win_disable(struct device *dev, int zpos)
 	writel(val, ctx->regs + WINCON(win));
 
 	/* unprotect windows */
-	val = readl(ctx->regs + SHADOWCON);
-	val &= ~SHADOWCON_CHx_ENABLE(win);
-	val &= ~SHADOWCON_WINx_PROTECT(win);
-	writel(val, ctx->regs + SHADOWCON);
+	if (ctx->driver_data->has_shadowcon) {
+		val = readl(ctx->regs + SHADOWCON);
+		val &= ~SHADOWCON_CHx_ENABLE(win);
+		writel(val, ctx->regs + SHADOWCON);
+	}
+
+	fimd_shadow_protect_win(ctx, win, false);
 
 	win_data->enabled = false;
 }
@@ -777,8 +810,6 @@ static int fimd_calc_clkdiv(struct fimd_context *ctx,
 
 static void fimd_clear_win(struct fimd_context *ctx, int win)
 {
-	u32 val;
-
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
 	writel(0, ctx->regs + WINCON(win));
@@ -789,9 +820,7 @@ static void fimd_clear_win(struct fimd_context *ctx, int win)
 	if (win == 1 || win == 2)
 		writel(0, ctx->regs + VIDOSD_D(win));
 
-	val = readl(ctx->regs + SHADOWCON);
-	val &= ~SHADOWCON_WINx_PROTECT(win);
-	writel(val, ctx->regs + SHADOWCON);
+	fimd_shadow_protect_win(ctx, win, false);
 }
 
 static int fimd_clock(struct fimd_context *ctx, bool enable)
-- 
1.8.2.1
