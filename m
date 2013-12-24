From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH RFC 02/11] ARM: SAMSUNG: pm: Save UART DIVSLOT register based
 on SoC type
Date: Tue, 24 Dec 2013 15:14:25 +0100
Message-ID: <1387894474-14428-2-git-send-email-t.figa@samsung.com>
References: <1387894474-14428-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45225 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752165Ab3LXOPJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Dec 2013 09:15:09 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYB00B86E978G60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Dec 2013 14:15:07 +0000 (GMT)
In-reply-to: <1387894474-14428-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>

The only SoC that does not have DIVSLOT register is S3C2410, so instead
of exporting a variable for platforms to set if DIVSLOT register should
be preserved, it's enough to simply check whether we are running on
a S3C2410 instead.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-s3c64xx/pm.c              |  1 -
 arch/arm/mach-s5p64x0/pm.c              |  1 -
 arch/arm/plat-samsung/include/plat/pm.h |  2 --
 arch/arm/plat-samsung/pm.c              | 18 +++++-------------
 4 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index 8cdb824..0b48908 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -331,7 +331,6 @@ static __init int s3c64xx_pm_initcall(void)
 {
 	pm_cpu_prep = s3c64xx_pm_prepare;
 	pm_cpu_sleep = s3c64xx_cpu_suspend;
-	pm_uart_udivslot = 1;
 
 #ifdef CONFIG_S3C_PM_DEBUG_LED_SMDK
 	gpio_request(S3C64XX_GPN(12), "DEBUG_LED0");
diff --git a/arch/arm/mach-s5p64x0/pm.c b/arch/arm/mach-s5p64x0/pm.c
index 861e15c..ec8229c 100644
--- a/arch/arm/mach-s5p64x0/pm.c
+++ b/arch/arm/mach-s5p64x0/pm.c
@@ -161,7 +161,6 @@ static int s5p64x0_pm_add(struct device *dev, struct subsys_interface *sif)
 {
 	pm_cpu_prep = s5p64x0_pm_prepare;
 	pm_cpu_sleep = s5p64x0_cpu_suspend;
-	pm_uart_udivslot = 1;
 
 	return 0;
 }
diff --git a/arch/arm/plat-samsung/include/plat/pm.h b/arch/arm/plat-samsung/include/plat/pm.h
index 6bc1a8f..67defdb 100644
--- a/arch/arm/plat-samsung/include/plat/pm.h
+++ b/arch/arm/plat-samsung/include/plat/pm.h
@@ -54,8 +54,6 @@ extern int (*pm_cpu_sleep)(unsigned long);
 
 extern unsigned long s3c_pm_flags;
 
-extern unsigned char pm_uart_udivslot;  /* true to save UART UDIVSLOT */
-
 /* from sleep.S */
 
 extern int s3c2410_cpu_suspend(unsigned long);
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index d0c2301..e017b7b 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -23,6 +23,7 @@
 #include <asm/cacheflush.h>
 #include <asm/suspend.h>
 
+#include <plat/cpu.h>
 #include <plat/regs-serial.h>
 
 #ifdef CONFIG_SAMSUNG_ATAGS
@@ -69,17 +70,6 @@ static inline void s3c_pm_debug_init(void)
 	s3c_pm_debug_init_uart();
 }
 
-#else
-#define s3c_pm_debug_init() do { } while(0)
-
-#endif /* CONFIG_SAMSUNG_PM_DEBUG */
-
-/* Save the UART configurations if we are configured for debug. */
-
-unsigned char pm_uart_udivslot;
-
-#ifdef CONFIG_SAMSUNG_PM_DEBUG
-
 static struct pm_uart_save uart_save;
 
 static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
@@ -92,7 +82,7 @@ static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
 	save->umcon = __raw_readl(regs + S3C2410_UMCON);
 	save->ubrdiv = __raw_readl(regs + S3C2410_UBRDIV);
 
-	if (pm_uart_udivslot)
+	if (!soc_is_s3c2410())
 		save->udivslot = __raw_readl(regs + S3C2443_DIVSLOT);
 
 	S3C_PMDBG("UART[%d]: ULCON=%04x, UCON=%04x, UFCON=%04x, UBRDIV=%04x\n",
@@ -116,7 +106,7 @@ static void s3c_pm_restore_uart(unsigned int uart, struct pm_uart_save *save)
 	__raw_writel(save->umcon, regs + S3C2410_UMCON);
 	__raw_writel(save->ubrdiv, regs + S3C2410_UBRDIV);
 
-	if (pm_uart_udivslot)
+	if (!soc_is_s3c2410())
 		__raw_writel(save->udivslot, regs + S3C2443_DIVSLOT);
 }
 
@@ -125,6 +115,8 @@ static void s3c_pm_restore_uarts(void)
 	s3c_pm_restore_uart(CONFIG_DEBUG_S3C_UART, &uart_save);
 }
 #else
+#define s3c_pm_debug_init() do { } while(0)
+
 static void s3c_pm_save_uarts(void) { }
 static void s3c_pm_restore_uarts(void) { }
 #endif
-- 
1.8.4.3
