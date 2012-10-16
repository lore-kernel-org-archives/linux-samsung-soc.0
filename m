From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V2 RESEND] gpio: samsung: use pr_* instead of printk
Date: Tue, 16 Oct 2012 17:25:38 +0900
Message-ID: <008901cdab77$d2538800$76fa9800$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60320 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752193Ab2JPIZk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Oct 2012 04:25:40 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Ryan Mallon' <rmallon@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>

This patch uses pr_* instead of printk. Also, gpio_dbg
is replaced with pr_debug.

Signed-off-by: Ryan Mallon <rmallon@gmail.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-samsung.c |   18 ++++++------------
 1 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index a006f0d..5c5ccdf 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -42,12 +42,6 @@
 #include <plat/gpio-fns.h>
 #include <plat/pm.h>
 
-#ifndef DEBUG_GPIO
-#define gpio_dbg(x...) do { } while (0)
-#else
-#define gpio_dbg(x...) printk(KERN_DEBUG x)
-#endif
-
 int samsung_gpio_setpull_updown(struct samsung_gpio_chip *chip,
 				unsigned int off, samsung_gpio_pull_t pull)
 {
@@ -599,7 +593,7 @@ static int samsung_gpiolib_4bit_input(struct gpio_chip *chip,
 	con &= ~(0xf << con_4bit_shift(offset));
 	__raw_writel(con, base + GPIOCON_OFF);
 
-	gpio_dbg("%s: %p: CON now %08lx\n", __func__, base, con);
+	pr_debug("%s: %p: CON now %08lx\n", __func__, base, con);
 
 	return 0;
 }
@@ -627,7 +621,7 @@ static int samsung_gpiolib_4bit_output(struct gpio_chip *chip,
 	__raw_writel(con, base + GPIOCON_OFF);
 	__raw_writel(dat, base + GPIODAT_OFF);
 
-	gpio_dbg("%s: %p: CON %08lx, DAT %08lx\n", __func__, base, con, dat);
+	pr_debug("%s: %p: CON %08lx, DAT %08lx\n", __func__, base, con, dat);
 
 	return 0;
 }
@@ -671,7 +665,7 @@ static int samsung_gpiolib_4bit2_input(struct gpio_chip *chip,
 	con &= ~(0xf << con_4bit_shift(offset));
 	__raw_writel(con, regcon);
 
-	gpio_dbg("%s: %p: CON %08lx\n", __func__, base, con);
+	pr_debug("%s: %p: CON %08lx\n", __func__, base, con);
 
 	return 0;
 }
@@ -706,7 +700,7 @@ static int samsung_gpiolib_4bit2_output(struct gpio_chip *chip,
 	__raw_writel(con, regcon);
 	__raw_writel(dat, base + GPIODAT_OFF);
 
-	gpio_dbg("%s: %p: CON %08lx, DAT %08lx\n", __func__, base, con, dat);
+	pr_debug("%s: %p: CON %08lx, DAT %08lx\n", __func__, base, con, dat);
 
 	return 0;
 }
@@ -926,10 +920,10 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 #ifdef CONFIG_PM
 	if (chip->pm != NULL) {
 		if (!chip->pm->save || !chip->pm->resume)
-			printk(KERN_ERR "gpio: %s has missing PM functions\n",
+			pr_err("gpio: %s has missing PM functions\n",
 			       gc->label);
 	} else
-		printk(KERN_ERR "gpio: %s has no PM function\n", gc->label);
+		pr_err("gpio: %s has no PM function\n", gc->label);
 #endif
 
 	/* gpiochip_add() prints own failure message on error. */
-- 
1.7.1
