From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: clean up register definions for fimd and decon
Date: Tue, 12 Apr 2016 09:59:11 +0900
Message-ID: <1460422751-10159-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59505 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755473AbcDLA7Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2016 20:59:16 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O5H01VFEXEPM9C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Apr 2016 09:59:13 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch removes suffixes from I80 relevant register definitions,
which are misleading.

This is based on top of below patch set,
     http://www.spinics.net/lists/dri-devel/msg104057.html

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 23 +++++++++++------------
 include/video/exynos5433_decon.h              |  6 +++---
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 5922e99..8cfef0d 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -121,7 +121,7 @@ static void decon_setup_trigger(struct decon_context *ctx)
 		? TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
 		  TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN
 		: TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
-		  TRIGCON_HWTRIGMASK_I80_RGB | TRIGCON_HWTRIGEN_I80_RGB;
+		  TRIGCON_HWTRIGMASK | TRIGCON_HWTRIGEN;
 	writel(val, ctx->addr + DECON_TRIGCON);
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index c4cd16a..9fa07a6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -68,15 +68,15 @@
 /* color key value register for hardware window 1 ~ 4. */
 #define WKEYCON1_BASE(x)		((WKEYCON1 + 0x140) + ((x - 1) * 8))
 
-/* I80 / RGB trigger control register */
+/* I80 trigger control register */
 #define TRIGCON				0x1A4
-#define TRGMODE_I80_RGB_ENABLE_I80	(1 << 0)
-#define SWTRGCMD_I80_RGB_ENABLE		(1 << 1)
+#define TRGMODE_ENABLE			(1 << 0)
+#define SWTRGCMD_ENABLE			(1 << 1)
 /* Exynos3250, 3472, 4415, 5260 5410, 5420 and 5422 only supported. */
-#define HWTRGEN_I80_RGB_ENABLE		(1 << 3)
-#define HWTRGMASK_I80_RGB_ENABLE	(1 << 4)
+#define HWTRGEN_ENABLE			(1 << 3)
+#define HWTRGMASK_ENABLE		(1 << 4)
 /* Exynos3250, 3472, 4415, 5260, 5420 and 5422 only supported. */
-#define HWTRIGEN_PER_RGB_ENABLE		(1 << 31)
+#define HWTRIGEN_PER_ENABLE		(1 << 31)
 
 /* display mode change control register except exynos4 */
 #define VIDOUT_CON			0x000
@@ -425,16 +425,15 @@ static void fimd_setup_trigger(struct fimd_context *ctx)
 	u32 trg_type = ctx->driver_data->trg_type;
 	u32 val = readl(timing_base + TRIGCON);
 
-	val &= ~(TRGMODE_I80_RGB_ENABLE_I80);
+	val &= ~(TRGMODE_ENABLE);
 
 	if (trg_type == I80_HW_TRG) {
 		if (ctx->driver_data->has_hw_trigger)
-			val |= HWTRGEN_I80_RGB_ENABLE |
-				HWTRGMASK_I80_RGB_ENABLE;
+			val |= HWTRGEN_ENABLE | HWTRGMASK_ENABLE;
 		if (ctx->driver_data->has_trigger_per_te)
-			val |= HWTRIGEN_PER_RGB_ENABLE;
+			val |= HWTRIGEN_PER_ENABLE;
 	} else {
-		val |= TRGMODE_I80_RGB_ENABLE_I80;
+		val |= TRGMODE_ENABLE;
 	}
 
 	writel(val, timing_base + TRIGCON);
@@ -884,7 +883,7 @@ static void fimd_trigger(struct device *dev)
 	atomic_set(&ctx->triggering, 1);
 
 	reg = readl(timing_base + TRIGCON);
-	reg |= (TRGMODE_I80_RGB_ENABLE_I80 | SWTRGCMD_I80_RGB_ENABLE);
+	reg |= (TRGMODE_ENABLE | SWTRGCMD_ENABLE);
 	writel(reg, timing_base + TRIGCON);
 
 	/*
diff --git a/include/video/exynos5433_decon.h b/include/video/exynos5433_decon.h
index c1c1ca1..0098a52 100644
--- a/include/video/exynos5433_decon.h
+++ b/include/video/exynos5433_decon.h
@@ -179,9 +179,9 @@
 #define TRIGCON_TRIGMODE_W1BUF		(1 << 10)
 #define TRIGCON_SWTRIGCMD_W0BUF		(1 << 6)
 #define TRIGCON_TRIGMODE_W0BUF		(1 << 5)
-#define TRIGCON_HWTRIGMASK_I80_RGB	(1 << 4)
-#define TRIGCON_HWTRIGEN_I80_RGB	(1 << 3)
-#define TRIGCON_HWTRIG_INV_I80_RGB	(1 << 2)
+#define TRIGCON_HWTRIGMASK		(1 << 4)
+#define TRIGCON_HWTRIGEN		(1 << 3)
+#define TRIGCON_HWTRIG_INV		(1 << 2)
 #define TRIGCON_SWTRIGCMD		(1 << 1)
 #define TRIGCON_SWTRIGEN		(1 << 0)
 
-- 
1.9.1
