From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Samsung: fix watchdog reset issue with clk_get()
Date: Mon, 08 Aug 2011 15:22:12 +0200
Message-ID: <1312809732-7770-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:59331 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751357Ab1HHNWX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 09:22:23 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LPM00G442H9D420@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 14:22:21 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPM00J5U2H843@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 14:22:21 +0100 (BST)
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
 arch/arm/mach-exynos4/clock.c                      |    1 +
 arch/arm/mach-s3c2412/clock.c                      |    1 +
 arch/arm/mach-s3c2416/clock.c                      |    2 +-
 arch/arm/mach-s3c2443/clock.c                      |    1 +
 arch/arm/mach-s3c64xx/clock.c                      |    1 +
 arch/arm/mach-s5p64x0/cpu.c                        |    2 ++
 arch/arm/mach-s5pc100/clock.c                      |    1 +
 arch/arm/mach-s5pv210/clock.c                      |    1 +
 arch/arm/plat-s3c24xx/s3c2410-clock.c              |    1 +
 arch/arm/plat-samsung/clock.c                      |    9 +++++++++
 arch/arm/plat-samsung/include/plat/clock.h         |    2 ++
 .../arm/plat-samsung/include/plat/watchdog-reset.h |   10 +++-------
 12 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 851dea0..9dd4315 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -1211,4 +1211,5 @@ void __init exynos4_register_clocks(void)
 	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 
 	s3c_pwmclk_init();
+	s3c_wdt_reset_init();
 }
diff --git a/arch/arm/mach-s3c2412/clock.c b/arch/arm/mach-s3c2412/clock.c
index 140711d..1445bf6 100644
--- a/arch/arm/mach-s3c2412/clock.c
+++ b/arch/arm/mach-s3c2412/clock.c
@@ -752,5 +752,6 @@ int __init s3c2412_baseclk_add(void)
 	}
 
 	s3c_pwmclk_init();
+	s3c_wdt_reset_init();
 	return 0;
 }
diff --git a/arch/arm/mach-s3c2416/clock.c b/arch/arm/mach-s3c2416/clock.c
index 21a5e81..529e2a0 100644
--- a/arch/arm/mach-s3c2416/clock.c
+++ b/arch/arm/mach-s3c2416/clock.c
@@ -139,5 +139,5 @@ void __init s3c2416_init_clocks(int xtal)
 	s3c24xx_register_clock(&hsmmc0_clk);
 
 	s3c_pwmclk_init();
-
+	s3c_wdt_reset_init();
 }
diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index a1a7176..78ae013 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -365,4 +365,5 @@ void __init s3c2443_init_clocks(int xtal)
 	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 
 	s3c_pwmclk_init();
+	s3c_wdt_reset_init();
 }
diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index 8cf39e3..86977d0 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -817,4 +817,5 @@ void __init s3c64xx_register_clocks(unsigned long xtal,
 	s3c24xx_register_clocks(clks1, ARRAY_SIZE(clks1));
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
 	s3c_pwmclk_init();
+	s3c_wdt_reset_init();
 }
diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index a5c0095..876e0c7 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -136,6 +136,7 @@ void __init s5p6440_init_clocks(int xtal)
 	s5p_register_clocks(xtal);
 	s5p6440_register_clocks();
 	s5p6440_setup_clocks();
+	s3c_wdt_reset_init();
 }
 
 void __init s5p6450_init_clocks(int xtal)
@@ -146,6 +147,7 @@ void __init s5p6450_init_clocks(int xtal)
 	s5p_register_clocks(xtal);
 	s5p6450_register_clocks();
 	s5p6450_setup_clocks();
+	s3c_wdt_reset_init();
 }
 
 /*
diff --git a/arch/arm/mach-s5pc100/clock.c b/arch/arm/mach-s5pc100/clock.c
index ff5cbb3..bb60904 100644
--- a/arch/arm/mach-s5pc100/clock.c
+++ b/arch/arm/mach-s5pc100/clock.c
@@ -1277,4 +1277,5 @@ void __init s5pc100_register_clocks(void)
 	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 
 	s3c_pwmclk_init();
+	s3c_wdt_reset_init();
 }
diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 52a8e60..48a3963 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -1162,4 +1162,5 @@ void __init s5pv210_register_clocks(void)
 	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 
 	s3c_pwmclk_init();
+	s3c_wdt_reset_init();
 }
diff --git a/arch/arm/plat-s3c24xx/s3c2410-clock.c b/arch/arm/plat-s3c24xx/s3c2410-clock.c
index def76aa..18bcf6a 100644
--- a/arch/arm/plat-s3c24xx/s3c2410-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2410-clock.c
@@ -249,5 +249,6 @@ int __init s3c2410_baseclk_add(void)
 	       (clkslow & S3C2410_CLKSLOW_UCLK_OFF) ? "off" : "on");
 
 	s3c_pwmclk_init();
+	s3c_wdt_reset_init();
 	return 0;
 }
diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 302c426..141bd2e 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -64,6 +64,15 @@ static LIST_HEAD(clocks);
  */
 DEFINE_SPINLOCK(clocks_lock);
 
+/* Global watchdog clock used by arch_wtd_reset() callback */
+struct clk *s3c2410_wdtclk;
+void s3c_wdt_reset_init(void)
+{
+	s3c2410_wdtclk = clk_get(NULL, "watchdog");
+	if (IS_ERR(s3c2410_wdtclk))
+		printk(KERN_WARNING "%s: warning: cannot get watchdog clock\n", __func__);
+}
+
 /* enable and disable calls for use with the clk struct */
 
 static int clk_null_enable(struct clk *clk, int enable)
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index 87d5b38..5e625b4 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -81,6 +81,7 @@ extern struct clk clk_h2;
 extern struct clk clk_27m;
 extern struct clk clk_48m;
 extern struct clk clk_xusbxti;
+extern struct clk *s3c2410_wdtclk;
 
 extern int clk_default_setrate(struct clk *clk, unsigned long rate);
 extern struct clk_ops clk_ops_def_setrate;
@@ -120,4 +121,5 @@ extern int s3c64xx_sclk_ctrl(struct clk *clk, int enable);
 /* Init for pwm clock code */
 
 extern void s3c_pwmclk_init(void);
+extern void s3c_wdt_reset_init(void);
 
diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
index 54b762a..4fbbe5d 100644
--- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
+++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
@@ -12,6 +12,7 @@
 
 #include <plat/regs-watchdog.h>
 #include <mach/map.h>
+#include <plat/clock.h>
 
 #include <linux/clk.h>
 #include <linux/err.h>
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
