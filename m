From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 05/36] ARM: samsung: make pm-debug platform independent
Date: Thu, 10 Oct 2019 22:29:49 +0200
Message-ID: <20191010203043.1241612-5-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The pm-debug code is one of the few things shared between s3c24xx/s3c64xx
and the newer s5pv210. In order to make s5pv210 independent of plat-samsung,
change the common bits of this code to no longer reference the s3c specific
bits.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/include/mach/pm-core.h  |  7 +--
 arch/arm/mach-s3c64xx/include/mach/pm-core.h  | 44 +---------------
 arch/arm/mach-s3c64xx/pm.c                    | 50 +++++++++++++++++++
 arch/arm/mach-s5pv210/pm.c                    |  6 +--
 .../arm/plat-samsung/include/plat/pm-common.h | 29 +++++------
 arch/arm/plat-samsung/pm-debug.c              | 23 ++-------
 arch/arm/plat-samsung/pm.c                    | 10 ++--
 7 files changed, 80 insertions(+), 89 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/pm-core.h b/arch/arm/mach-s3c24xx/include/mach/pm-core.h
index 5e4ce89d0158..8f87606c4cdc 100644
--- a/arch/arm/mach-s3c24xx/include/mach/pm-core.h
+++ b/arch/arm/mach-s3c24xx/include/mach/pm-core.h
@@ -15,6 +15,7 @@
 
 static inline void s3c_pm_debug_init_uart(void)
 {
+#ifdef CONFIG_SAMSUNG_PM_DEBUG
 	unsigned long tmp = __raw_readl(S3C2410_CLKCON);
 
 	/* re-start uart clocks */
@@ -24,6 +25,7 @@ static inline void s3c_pm_debug_init_uart(void)
 
 	__raw_writel(tmp, S3C2410_CLKCON);
 	udelay(10);
+#endif
 }
 
 static inline void s3c_pm_arch_prepare_irqs(void)
@@ -75,11 +77,6 @@ static inline void s3c_pm_arch_show_resume_irqs(void)
 				s3c_irqwake_eintmask);
 }
 
-static inline void s3c_pm_arch_update_uart(void __iomem *regs,
-					   struct pm_uart_save *save)
-{
-}
-
 static inline void s3c_pm_restored_gpios(void) { }
 static inline void samsung_pm_saved_gpios(void) { }
 
diff --git a/arch/arm/mach-s3c64xx/include/mach/pm-core.h b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
index bbf79ed28583..33cf242734a0 100644
--- a/arch/arm/mach-s3c64xx/include/mach/pm-core.h
+++ b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
@@ -20,6 +20,7 @@
 
 static inline void s3c_pm_debug_init_uart(void)
 {
+#ifdef CONFIG_SAMSUNG_PM_DEBUG
 	u32 tmp = __raw_readl(S3C_PCLK_GATE);
 
 	/* As a note, since the S3C64XX UARTs generally have multiple
@@ -35,6 +36,7 @@ static inline void s3c_pm_debug_init_uart(void)
 
 	__raw_writel(tmp, S3C_PCLK_GATE);
 	udelay(10);
+#endif
 }
 
 static inline void s3c_pm_arch_prepare_irqs(void)
@@ -63,48 +65,6 @@ static inline void s3c_pm_arch_show_resume_irqs(void)
 #define s3c_irqwake_intallow  0
 #endif
 
-static inline void s3c_pm_arch_update_uart(void __iomem *regs,
-					   struct pm_uart_save *save)
-{
-	u32 ucon = __raw_readl(regs + S3C2410_UCON);
-	u32 ucon_clk = ucon & S3C6400_UCON_CLKMASK;
-	u32 save_clk = save->ucon & S3C6400_UCON_CLKMASK;
-	u32 new_ucon;
-	u32 delta;
-
-	/* S3C64XX UART blocks only support level interrupts, so ensure that
-	 * when we restore unused UART blocks we force the level interrupt
-	 * settigs. */
-	save->ucon |= S3C2410_UCON_TXILEVEL | S3C2410_UCON_RXILEVEL;
-
-	/* We have a constraint on changing the clock type of the UART
-	 * between UCLKx and PCLK, so ensure that when we restore UCON
-	 * that the CLK field is correctly modified if the bootloader
-	 * has changed anything.
-	 */
-	if (ucon_clk != save_clk) {
-		new_ucon = save->ucon;
-		delta = ucon_clk ^ save_clk;
-
-		/* change from UCLKx => wrong PCLK,
-		 * either UCLK can be tested for by a bit-test
-		 * with UCLK0 */
-		if (ucon_clk & S3C6400_UCON_UCLK0 &&
-		    !(save_clk & S3C6400_UCON_UCLK0) &&
-		    delta & S3C6400_UCON_PCLK2) {
-			new_ucon &= ~S3C6400_UCON_UCLK0;
-		} else if (delta == S3C6400_UCON_PCLK2) {
-			/* as an precaution, don't change from
-			 * PCLK2 => PCLK or vice-versa */
-			new_ucon ^= S3C6400_UCON_PCLK2;
-		}
-
-		S3C_PMDBG("ucon change %04x => %04x (save=%04x)\n",
-			  ucon, new_ucon, save->ucon);
-		save->ucon = new_ucon;
-	}
-}
-
 static inline void s3c_pm_restored_gpios(void)
 {
 	/* ensure sleep mode has been cleared from the system */
diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index fd6dbb263ed5..a612e9779057 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -305,6 +305,56 @@ static void s3c64xx_pm_prepare(void)
 	__raw_writel(__raw_readl(S3C64XX_WAKEUP_STAT), S3C64XX_WAKEUP_STAT);
 }
 
+#ifdef CONFIG_SAMSUNG_PM_DEBUG
+void s3c_pm_arch_update_uart(void __iomem *regs, struct pm_uart_save *save)
+{
+	u32 ucon;
+	u32 ucon_clk
+	u32 save_clk;
+	u32 new_ucon;
+	u32 delta;
+
+	if (!soc_is_s3c64xx())
+		return;
+
+	ucon = __raw_readl(regs + S3C2410_UCON);
+	ucon_clk = ucon & S3C6400_UCON_CLKMASK;
+	sav_clk = save->ucon & S3C6400_UCON_CLKMASK;
+
+	/* S3C64XX UART blocks only support level interrupts, so ensure that
+	 * when we restore unused UART blocks we force the level interrupt
+	 * settigs. */
+	save->ucon |= S3C2410_UCON_TXILEVEL | S3C2410_UCON_RXILEVEL;
+
+	/* We have a constraint on changing the clock type of the UART
+	 * between UCLKx and PCLK, so ensure that when we restore UCON
+	 * that the CLK field is correctly modified if the bootloader
+	 * has changed anything.
+	 */
+	if (ucon_clk != save_clk) {
+		new_ucon = save->ucon;
+		delta = ucon_clk ^ save_clk;
+
+		/* change from UCLKx => wrong PCLK,
+		 * either UCLK can be tested for by a bit-test
+		 * with UCLK0 */
+		if (ucon_clk & S3C6400_UCON_UCLK0 &&
+		    !(save_clk & S3C6400_UCON_UCLK0) &&
+		    delta & S3C6400_UCON_PCLK2) {
+			new_ucon &= ~S3C6400_UCON_UCLK0;
+		} else if (delta == S3C6400_UCON_PCLK2) {
+			/* as an precaution, don't change from
+			 * PCLK2 => PCLK or vice-versa */
+			new_ucon ^= S3C6400_UCON_PCLK2;
+		}
+
+		S3C_PMDBG("ucon change %04x => %04x (save=%04x)\n",
+			  ucon, new_ucon, save->ucon);
+		save->ucon = new_ucon;
+	}
+}
+#endif
+
 int __init s3c64xx_pm_init(void)
 {
 	int i;
diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
index b336df0c57f3..efdb5a27c060 100644
--- a/arch/arm/mach-s5pv210/pm.c
+++ b/arch/arm/mach-s5pv210/pm.c
@@ -99,8 +99,6 @@ static int s5pv210_suspend_enter(suspend_state_t state)
 	u32 eint_wakeup_mask = s5pv210_read_eint_wakeup_mask();
 	int ret;
 
-	s3c_pm_debug_init();
-
 	S3C_PMDBG("%s: suspending the system...\n", __func__);
 
 	S3C_PMDBG("%s: wakeup masks: %08x,%08x\n", __func__,
@@ -113,7 +111,7 @@ static int s5pv210_suspend_enter(suspend_state_t state)
 		return -EINVAL;
 	}
 
-	s3c_pm_save_uarts();
+	s3c_pm_save_uarts(false);
 	s5pv210_pm_prepare();
 	flush_cache_all();
 	s3c_pm_check_store();
@@ -122,7 +120,7 @@ static int s5pv210_suspend_enter(suspend_state_t state)
 	if (ret)
 		return ret;
 
-	s3c_pm_restore_uarts();
+	s3c_pm_restore_uarts(false);
 
 	S3C_PMDBG("%s: wakeup stat: %08x\n", __func__,
 			__raw_readl(S5P_WAKEUP_STAT));
diff --git a/arch/arm/plat-samsung/include/plat/pm-common.h b/arch/arm/plat-samsung/include/plat/pm-common.h
index 1268bae04234..87fa97fd6e8b 100644
--- a/arch/arm/plat-samsung/include/plat/pm-common.h
+++ b/arch/arm/plat-samsung/include/plat/pm-common.h
@@ -69,25 +69,26 @@ struct pm_uart_save {
  */
 extern void s3c_pm_dbg(const char *msg, ...);
 
-/**
- * s3c_pm_debug_init() - suspend/resume low level debug initialization.
- * @base: Virtual base of UART to use for suspend/resume debugging.
- *
- * This function needs to be called before S3C_PMDBG() can be used, to set up
- * UART port base address and configuration.
- */
-extern void s3c_pm_debug_init(void);
-
 #define S3C_PMDBG(fmt...) s3c_pm_dbg(fmt)
 
-extern void s3c_pm_save_uarts(void);
-extern void s3c_pm_restore_uarts(void);
+extern void s3c_pm_save_uarts(bool is_s3c24xx);
+extern void s3c_pm_restore_uarts(bool is_s3c24xx);
+
+#ifdef CONFIG_ARCH_S3C64XX
+extern void s3c_pm_arch_update_uart(void __iomem *regs,
+				    struct pm_uart_save *save);
+#else
+static inline void
+s3c_pm_arch_update_uart(void __iomem *regs, struct pm_uart_save *save)
+{
+}
+#endif
+
 #else
 #define S3C_PMDBG(fmt...) pr_debug(fmt)
-#define s3c_pm_debug_init() do { } while (0)
 
-static inline void s3c_pm_save_uarts(void) { }
-static inline void s3c_pm_restore_uarts(void) { }
+static inline void s3c_pm_save_uarts(bool is_s3c24xx) { }
+static inline void s3c_pm_restore_uarts(bool is_s3c24xx) { }
 #endif
 
 /* suspend memory checking */
diff --git a/arch/arm/plat-samsung/pm-debug.c b/arch/arm/plat-samsung/pm-debug.c
index b76b1e9ba4ae..482d53753e93 100644
--- a/arch/arm/plat-samsung/pm-debug.c
+++ b/arch/arm/plat-samsung/pm-debug.c
@@ -18,15 +18,6 @@
 #include <plat/cpu.h>
 #include <plat/pm-common.h>
 
-#ifdef CONFIG_SAMSUNG_ATAGS
-#include <plat/pm.h>
-#include <mach/pm-core.h>
-#else
-static inline void s3c_pm_debug_init_uart(void) {}
-static inline void s3c_pm_arch_update_uart(void __iomem *regs,
-					   struct pm_uart_save *save) {}
-#endif
-
 static struct pm_uart_save uart_save;
 
 extern void printascii(const char *);
@@ -43,12 +34,6 @@ void s3c_pm_dbg(const char *fmt, ...)
 	printascii(buff);
 }
 
-void s3c_pm_debug_init(void)
-{
-	/* restart uart clocks so we can use them to output */
-	s3c_pm_debug_init_uart();
-}
-
 static inline void __iomem *s3c_pm_uart_base(void)
 {
 	unsigned long paddr;
@@ -59,7 +44,7 @@ static inline void __iomem *s3c_pm_uart_base(void)
 	return (void __iomem *)vaddr;
 }
 
-void s3c_pm_save_uarts(void)
+void s3c_pm_save_uarts(bool is_s3c2410)
 {
 	void __iomem *regs = s3c_pm_uart_base();
 	struct pm_uart_save *save = &uart_save;
@@ -70,14 +55,14 @@ void s3c_pm_save_uarts(void)
 	save->umcon = __raw_readl(regs + S3C2410_UMCON);
 	save->ubrdiv = __raw_readl(regs + S3C2410_UBRDIV);
 
-	if (!soc_is_s3c2410())
+	if (!is_s3c2410)
 		save->udivslot = __raw_readl(regs + S3C2443_DIVSLOT);
 
 	S3C_PMDBG("UART[%p]: ULCON=%04x, UCON=%04x, UFCON=%04x, UBRDIV=%04x\n",
 		  regs, save->ulcon, save->ucon, save->ufcon, save->ubrdiv);
 }
 
-void s3c_pm_restore_uarts(void)
+void s3c_pm_restore_uarts(bool is_s3c2410)
 {
 	void __iomem *regs = s3c_pm_uart_base();
 	struct pm_uart_save *save = &uart_save;
@@ -90,6 +75,6 @@ void s3c_pm_restore_uarts(void)
 	__raw_writel(save->umcon, regs + S3C2410_UMCON);
 	__raw_writel(save->ubrdiv, regs + S3C2410_UBRDIV);
 
-	if (!soc_is_s3c2410())
+	if (!is_s3c2410)
 		__raw_writel(save->udivslot, regs + S3C2443_DIVSLOT);
 }
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index d6bfd66592b0..03c22a9dee21 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -25,6 +25,7 @@
 
 #include <asm/irq.h>
 
+#include <plat/cpu.h>
 #include <plat/pm.h>
 #include <mach/pm-core.h>
 
@@ -70,8 +71,7 @@ static int s3c_pm_enter(suspend_state_t state)
 {
 	int ret;
 	/* ensure the debug is initialised (if enabled) */
-
-	s3c_pm_debug_init();
+	s3c_pm_debug_init_uart();
 
 	S3C_PMDBG("%s(%d)\n", __func__, state);
 
@@ -100,7 +100,7 @@ static int s3c_pm_enter(suspend_state_t state)
 		samsung_pm_saved_gpios();
 	}
 
-	s3c_pm_save_uarts();
+	s3c_pm_save_uarts(soc_is_s3c2410());
 	s3c_pm_save_core();
 
 	/* set the irq configuration for wake */
@@ -137,14 +137,14 @@ static int s3c_pm_enter(suspend_state_t state)
 	/* restore the system state */
 
 	s3c_pm_restore_core();
-	s3c_pm_restore_uarts();
+	s3c_pm_restore_uarts(soc_is_s3c2410());
 
 	if (!of_have_populated_dt()) {
 		samsung_pm_restore_gpios();
 		s3c_pm_restored_gpios();
 	}
 
-	s3c_pm_debug_init();
+	s3c_pm_debug_init_uart();
 
 	/* check what irq (if any) restored the system */
 
-- 
2.20.0
