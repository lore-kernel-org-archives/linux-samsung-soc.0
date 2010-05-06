From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 21/23] ARM: S3C24XX: Wrapper s3c2410_gpio_setpin and s3c2410_gpio_pullup()
Date: Fri,  7 May 2010 08:15:43 +0900
Message-ID: <1273187745-6566-22-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60662 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754130Ab0EFXQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:10 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Change s3c2410_gpio_setpin() and s3c2410_gpio_pullup() to use
the new s3c_ gpio configuration calls until all their users
are converted.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c24xx/gpio.c |   47 +++++++++++++++++-------------------------
 1 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/gpio.c b/arch/arm/plat-s3c24xx/gpio.c
index c7c0cd7..45126d3 100644
--- a/arch/arm/plat-s3c24xx/gpio.c
+++ b/arch/arm/plat-s3c24xx/gpio.c
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/gpio.c
  *
- * Copyright (c) 2004-2005 Simtec Electronics
+ * Copyright (c) 2004-2010 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C24XX GPIO support
@@ -25,6 +25,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
+#include <linux/gpio.h>
 #include <linux/io.h>
 
 #include <mach/hardware.h>
@@ -33,44 +34,34 @@
 
 #include <mach/regs-gpio.h>
 
+/* gpiolib wrappers until these are totally eliminated */
+
 void s3c2410_gpio_pullup(unsigned int pin, unsigned int to)
 {
-	void __iomem *base = S3C24XX_GPIO_BASE(pin);
-	unsigned long offs = S3C2410_GPIO_OFFSET(pin);
-	unsigned long flags;
-	unsigned long up;
+	int ret;
 
-	if (pin < S3C2410_GPIO_BANKB)
-		return;
+	WARN_ON(to);	/* should be none of these left */
 
-	local_irq_save(flags);
-
-	up = __raw_readl(base + 0x08);
-	up &= ~(1L << offs);
-	up |= to << offs;
-	__raw_writel(up, base + 0x08);
+	if (!to) {
+		/* if pull is enabled, try first with up, and if that
+		 * fails, try using down */
 
-	local_irq_restore(flags);
+		ret = s3c_gpio_setpull(pin, S3C_GPIO_PULL_UP);
+		if (ret)
+			s3c_gpio_setpull(pin, S3C_GPIO_PULL_DOWN);
+	} else {
+		s3c_gpio_setpull(pin, S3C_GPIO_PULL_NONE);
+	}
 }
-
 EXPORT_SYMBOL(s3c2410_gpio_pullup);
 
-
 void s3c2410_gpio_setpin(unsigned int pin, unsigned int to)
 {
-	void __iomem *base = S3C24XX_GPIO_BASE(pin);
-	unsigned long offs = S3C2410_GPIO_OFFSET(pin);
-	unsigned long flags;
-	unsigned long dat;
+	/* do this via gpiolib until all users removed */
 
-	local_irq_save(flags);
-
-	dat = __raw_readl(base + 0x04);
-	dat &= ~(1 << offs);
-	dat |= to << offs;
-	__raw_writel(dat, base + 0x04);
-
-	local_irq_restore(flags);
+	gpio_request(pin, "temporary");
+	gpio_set_value(pin, to);
+	gpio_free(pin);
 }
 
 EXPORT_SYMBOL(s3c2410_gpio_setpin);
-- 
1.7.0.4
