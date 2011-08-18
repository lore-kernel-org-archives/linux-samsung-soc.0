From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3] ARM: Samsung: fix watchdog reset issue with clk_get()
Date: Thu, 18 Aug 2011 12:25:17 +0200
Message-ID: <1313663117-29191-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61952 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755432Ab1HRKZZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Aug 2011 06:25:25 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LQ400HUGCYB1N@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 18 Aug 2011 11:25:23 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LQ400HY0CYAX1@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 18 Aug 2011 11:25:23 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

clkdev framework uses global mutex to protect clock tree, so it is not
possible to call clk_get() in interrupt context. This patch fixes this
issue and makes system reset by watchdog call working again.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/clock.c                      |   11 +++++++++++
 arch/arm/plat-samsung/include/plat/clock.h         |    3 +++
 .../arm/plat-samsung/include/plat/watchdog-reset.h |   10 +++-------
 3 files changed, 17 insertions(+), 7 deletions(-)


history:
v3:
- moved initialization to arch_initcall, cleaned the code

v2:
- added missing '__init' section modifiers

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 302c426..3b44519 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -64,6 +64,17 @@ static LIST_HEAD(clocks);
  */
 DEFINE_SPINLOCK(clocks_lock);
 
+/* Global watchdog clock used by arch_wtd_reset() callback */
+struct clk *s3c2410_wdtclk;
+static int __init s3c_wdt_reset_init(void)
+{
+	s3c2410_wdtclk = clk_get(NULL, "watchdog");
+	if (IS_ERR(s3c2410_wdtclk))
+		printk(KERN_WARNING "%s: warning: cannot get watchdog clock\n", __func__);
+	return 0;
+}
+arch_initcall(s3c_wdt_reset_init);
+
 /* enable and disable calls for use with the clk struct */
 
 static int clk_null_enable(struct clk *clk, int enable)
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 87d5b38..8f95700 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -121,3 +121,6 @@ extern int s3c64xx_sclk_ctrl(struct clk *clk, int enable);
 
 extern void s3c_pwmclk_init(void);
 
+/* Global watchdog clock used by arch_wtd_reset() callback */
+
+extern struct clk *s3c2410_wdtclk;
diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
index 54b762a..40dbb2b 100644
--- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
+++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
@@ -10,6 +10,7 @@
  * published by the Free Software Foundation.
 */
 
+#include <plat/clock.h>
 #include <plat/regs-watchdog.h>
 #include <mach/map.h>
 
@@ -19,17 +20,12 @@
 
 static inline void arch_wdt_reset(void)
 {
-	struct clk *wdtclk;
-
 	printk("arch_reset: attempting watchdog reset\n");
 
 	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe  */
 
-	wdtclk = clk_get(NULL, "watchdog");
-	if (!IS_ERR(wdtclk)) {
-		clk_enable(wdtclk);
-	} else
-		printk(KERN_WARNING "%s: warning: cannot get watchdog clock\n", __func__);
+	if (s3c2410_wdtclk)
+		clk_enable(s3c2410_wdtclk);
 
 	/* put initial values into count and data */
 	__raw_writel(0x80, S3C2410_WTCNT);
-- 
1.7.1.569.g6f426
