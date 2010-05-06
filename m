From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 18/23] ARM: S3C24XX: Remove s3c2410_gpio_getcfg(), implement s3c_gpio_getcfg()
Date: Fri,  7 May 2010 08:15:40 +0900
Message-ID: <1273187745-6566-19-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60651 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754118Ab0EFXQI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:08 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add s3c_gpio_getcfg() and change anything using s3c2410_gpio_getcfg() to
use this instead.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c24xx/gpio.c                       |   19 -------------------
 arch/arm/plat-s3c24xx/pm.c                         |    4 ++--
 arch/arm/plat-samsung/gpio-config.c                |   20 ++++++++++++++++++++
 .../plat-samsung/include/plat/gpio-cfg-helpers.h   |    6 ++++++
 arch/arm/plat-samsung/include/plat/gpio-cfg.h      |   11 +++++++++++
 5 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/gpio.c b/arch/arm/plat-s3c24xx/gpio.c
index 24c0047..c7c0cd7 100644
--- a/arch/arm/plat-s3c24xx/gpio.c
+++ b/arch/arm/plat-s3c24xx/gpio.c
@@ -33,25 +33,6 @@
 
 #include <mach/regs-gpio.h>
 
-unsigned int s3c2410_gpio_getcfg(unsigned int pin)
-{
-	void __iomem *base = S3C24XX_GPIO_BASE(pin);
-	unsigned long val = __raw_readl(base);
-
-	if (pin < S3C2410_GPIO_BANKB) {
-		val >>= S3C2410_GPIO_OFFSET(pin);
-		val &= 1;
-		val += 1;
-	} else {
-		val >>= S3C2410_GPIO_OFFSET(pin)*2;
-		val &= 3;
-	}
-
-	return val | S3C2410_GPIO_INPUT;
-}
-
-EXPORT_SYMBOL(s3c2410_gpio_getcfg);
-
 void s3c2410_gpio_pullup(unsigned int pin, unsigned int to)
 {
 	void __iomem *base = S3C24XX_GPIO_BASE(pin);
diff --git a/arch/arm/plat-s3c24xx/pm.c b/arch/arm/plat-s3c24xx/pm.c
index 691fecc..60627e6 100644
--- a/arch/arm/plat-s3c24xx/pm.c
+++ b/arch/arm/plat-s3c24xx/pm.c
@@ -98,11 +98,11 @@ static void s3c_pm_check_resume_pin(unsigned int pin, unsigned int irqoffs)
 	else
 		irqstate = s3c_irqwake_eintmask & (1L<<irqoffs);
 
-	pinstate = s3c2410_gpio_getcfg(pin);
+	pinstate = s3c_gpio_getcfg(pin);
 
 	if (!irqstate) {
 		if (pinstate == S3C2410_GPIO_IRQ)
-			S3C_PMDBG("Leaving IRQ %d (pin %d) enabled\n", irq, pin);
+			S3C_PMDBG("Leaving IRQ %d (pin %d) as is\n", irq, pin);
 	} else {
 		if (pinstate == S3C2410_GPIO_IRQ) {
 			S3C_PMDBG("Disabling IRQ %d (pin %d)\n", irq, pin);
diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
index 19ab89d..3282db3 100644
--- a/arch/arm/plat-samsung/gpio-config.c
+++ b/arch/arm/plat-samsung/gpio-config.c
@@ -41,6 +41,26 @@ int s3c_gpio_cfgpin(unsigned int pin, unsigned int config)
 }
 EXPORT_SYMBOL(s3c_gpio_cfgpin);
 
+unsigned s3c_gpio_getcfg(unsigned int pin)
+{
+	struct s3c_gpio_chip *chip = s3c_gpiolib_getchip(pin);
+	unsigned long flags;
+	unsigned ret = 0;
+	int offset;
+
+	if (chip) {
+		offset = pin - chip->chip.base;
+
+		local_irq_save(flags);
+		ret = s3c_gpio_do_getcfg(chip, offset);
+		local_irq_restore(flags);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(s3c_gpio_getcfg);
+
+
 int s3c_gpio_setpull(unsigned int pin, s3c_gpio_pull_t pull)
 {
 	struct s3c_gpio_chip *chip = s3c_gpiolib_getchip(pin);
diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
index a8868c4..3e21c75 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
@@ -30,6 +30,12 @@ static inline int s3c_gpio_do_setcfg(struct s3c_gpio_chip *chip,
 	return (chip->config->set_config)(chip, off, config);
 }
 
+static inline unsigned s3c_gpio_do_getcfg(struct s3c_gpio_chip *chip,
+					  unsigned int off)
+{
+	return (chip->config->get_config)(chip, off);
+}
+
 static inline int s3c_gpio_do_setpull(struct s3c_gpio_chip *chip,
 				      unsigned int off, s3c_gpio_pull_t pull)
 {
diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg.h b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
index 29cd6a8..8d01e85 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
@@ -77,6 +77,17 @@ struct s3c_gpio_cfg {
  */
 extern int s3c_gpio_cfgpin(unsigned int pin, unsigned int to);
 
+/**
+ * s3c_gpio_getcfg - Read the current function for a GPIO pin
+ * @pin: The pin to read the configuration value for.
+ *
+ * Read the configuration state of the given @pin, returning a value that
+ * could be passed back to s3c_gpio_cfgpin().
+ *
+ * @sa s3c_gpio_cfgpin
+ */
+extern unsigned s3c_gpio_getcfg(unsigned int pin);
+
 /* Define values for the pull-{up,down} available for each gpio pin.
  *
  * These values control the state of the weak pull-{up,down} resistors
-- 
1.7.0.4
