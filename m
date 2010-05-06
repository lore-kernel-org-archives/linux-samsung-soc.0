From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 14/23] ARM: S3C24XX: Remove s3c2410_gpio_setcfg()
Date: Fri,  7 May 2010 08:15:36 +0900
Message-ID: <1273187745-6566-15-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60639 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752890Ab0EFXQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:07 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Remove the implementation of s3c2410_gpio_setcfg() as it should now be
functionally equivalent to s3c_gpio_cfgpin(), and add a wrapper for those
drivers that are still using this call.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/include/mach/gpio-fns.h |   35 ++++++++++++------
 arch/arm/plat-s3c24xx/gpio.c                  |   48 -------------------------
 2 files changed, 24 insertions(+), 59 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-fns.h b/arch/arm/mach-s3c2410/include/mach/gpio-fns.h
index 035a493..f50c2a5 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio-fns.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio-fns.h
@@ -10,14 +10,28 @@
  * published by the Free Software Foundation.
 */
 
+#ifndef __MACH_GPIO_FNS_H
+#define __MACH_GPIO_FNS_H __FILE__
+
 /* These functions are in the to-be-removed category and it is strongly
  * encouraged not to use these in new code. They will be marked deprecated
  * very soon.
  *
  * Most of the functionality can be either replaced by the gpiocfg calls
  * for the s3c platform or by the generic GPIOlib API.
+ *
+ * As of 2.6.35-rc, these will be removed, with the few drivers using them
+ * either replaced or given a wrapper until the calls can be removed.
 */
 
+#include <plat/gpio-cfg.h>
+
+static inline void s3c2410_gpio_cfgpin(unsigned int pin, unsigned int cfg)
+{
+	/* 1:1 mapping between cfgpin and setcfg calls at the moment */
+	s3c_gpio_cfgpin(pin, cfg);
+}
+
 /* external functions for GPIO support
  *
  * These allow various different clients to access the same GPIO
@@ -25,17 +39,6 @@
  * GPIO register, then it is safe to ioremap/__raw_{read|write} to it.
 */
 
-/* s3c2410_gpio_cfgpin
- *
- * set the configuration of the given pin to the value passed.
- *
- * eg:
- *    s3c2410_gpio_cfgpin(S3C2410_GPA(0), S3C2410_GPA0_ADDR0);
- *    s3c2410_gpio_cfgpin(S3C2410_GPE(8), S3C2410_GPE8_SDDAT1);
-*/
-
-extern void s3c2410_gpio_cfgpin(unsigned int pin, unsigned int function);
-
 extern unsigned int s3c2410_gpio_getcfg(unsigned int pin);
 
 /* s3c2410_gpio_getirq
@@ -73,6 +76,14 @@ extern int s3c2410_gpio_irqfilter(unsigned int pin, unsigned int on,
 
 /* s3c2410_gpio_pullup
  *
+ * This call should be replaced with s3c_gpio_setpull().
+ *
+ * As a note, there is currently no distinction between pull-up and pull-down
+ * in the s3c24xx series devices with only an on/off configuration.
+ */
+
+/* s3c2410_gpio_pullup
+ *
  * configure the pull-up control on the given pin
  *
  * to = 1 => disable the pull-up
@@ -101,3 +112,5 @@ extern int s3c2410_gpio_getpull(unsigned int pin);
 extern void s3c2410_gpio_setpin(unsigned int pin, unsigned int to);
 
 extern unsigned int s3c2410_gpio_getpin(unsigned int pin);
+
+#endif /* __MACH_GPIO_FNS_H */
diff --git a/arch/arm/plat-s3c24xx/gpio.c b/arch/arm/plat-s3c24xx/gpio.c
index 5467470..0b3b2cb 100644
--- a/arch/arm/plat-s3c24xx/gpio.c
+++ b/arch/arm/plat-s3c24xx/gpio.c
@@ -34,54 +34,6 @@
 
 #include <mach/regs-gpio.h>
 
-void s3c2410_gpio_cfgpin(unsigned int pin, unsigned int function)
-{
-	void __iomem *base = S3C24XX_GPIO_BASE(pin);
-	unsigned long mask;
-	unsigned long con;
-	unsigned long flags;
-
-	if (pin < S3C2410_GPIO_BANKB) {
-		mask = 1 << S3C2410_GPIO_OFFSET(pin);
-	} else {
-		mask = 3 << S3C2410_GPIO_OFFSET(pin)*2;
-	}
-
-	switch (function) {
-	case S3C2410_GPIO_LEAVE:
-		mask = 0;
-		function = 0;
-		break;
-
-	case S3C2410_GPIO_INPUT:
-	case S3C2410_GPIO_OUTPUT:
-	case S3C2410_GPIO_SFN2:
-	case S3C2410_GPIO_SFN3:
-		if (pin < S3C2410_GPIO_BANKB) {
-			function -= 1;
-			function &= 1;
-			function <<= S3C2410_GPIO_OFFSET(pin);
-		} else {
-			function &= 3;
-			function <<= S3C2410_GPIO_OFFSET(pin)*2;
-		}
-	}
-
-	/* modify the specified register wwith IRQs off */
-
-	local_irq_save(flags);
-
-	con  = __raw_readl(base + 0x00);
-	con &= ~mask;
-	con |= function;
-
-	__raw_writel(con, base + 0x00);
-
-	local_irq_restore(flags);
-}
-
-EXPORT_SYMBOL(s3c2410_gpio_cfgpin);
-
 unsigned int s3c2410_gpio_getcfg(unsigned int pin)
 {
 	void __iomem *base = S3C24XX_GPIO_BASE(pin);
-- 
1.7.0.4
