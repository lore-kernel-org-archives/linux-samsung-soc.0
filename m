From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 01/23] ARM: S3C24XX: Add initial s3c_gpio configuration code
Date: Fri,  7 May 2010 08:15:23 +0900
Message-ID: <1273187745-6566-2-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60601 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751363Ab0EFXP4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:15:56 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add support for s3c_gpio_setcfg() and s3c_gpio_setpull() implementations
to get ready for removal of the specific code being used by s3c24xx.

Also rename the s3c_gpio_setcfg_s3c24xx_banka to s3c_gpio_setcfg_s3c24xx_a
as seen in the header file to correct a build warning.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c24xx/Kconfig                  |    1 +
 arch/arm/plat-s3c24xx/gpiolib.c                |   17 ++++++++++++++++-
 arch/arm/plat-samsung/gpio-config.c            |    4 ++--
 arch/arm/plat-samsung/include/plat/gpio-core.h |    3 +++
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/Kconfig b/arch/arm/plat-s3c24xx/Kconfig
index 6e93ef8..a830fad 100644
--- a/arch/arm/plat-s3c24xx/Kconfig
+++ b/arch/arm/plat-s3c24xx/Kconfig
@@ -9,6 +9,7 @@ config PLAT_S3C24XX
 	select NO_IOPORT
 	select ARCH_REQUIRE_GPIOLIB
 	select S3C_DEVICE_NAND
+	select S3C_GPIO_CFG_S3C24XX
 	help
 	  Base platform code for any Samsung S3C24XX device
 
diff --git a/arch/arm/plat-s3c24xx/gpiolib.c b/arch/arm/plat-s3c24xx/gpiolib.c
index 4f0f11a..376b061 100644
--- a/arch/arm/plat-s3c24xx/gpiolib.c
+++ b/arch/arm/plat-s3c24xx/gpiolib.c
@@ -21,6 +21,8 @@
 #include <linux/gpio.h>
 
 #include <plat/gpio-core.h>
+#include <plat/gpio-cfg.h>
+#include <plat/gpio-cfg-helpers.h>
 #include <mach/hardware.h>
 #include <asm/irq.h>
 #include <plat/pm.h>
@@ -77,10 +79,19 @@ static int s3c24xx_gpiolib_bankg_toirq(struct gpio_chip *chip, unsigned offset)
 	return IRQ_EINT8 + offset;
 }
 
+static struct s3c_gpio_cfg s3c24xx_gpiocfg_banka = {
+	.set_config	= s3c_gpio_setcfg_s3c24xx_a,
+};
+
+struct s3c_gpio_cfg s3c24xx_gpiocfg_default = {
+	.set_config	= s3c_gpio_setcfg_s3c24xx,
+};
+
 struct s3c_gpio_chip s3c24xx_gpios[] = {
 	[0] = {
 		.base	= S3C2410_GPACON,
 		.pm	= __gpio_pm(&s3c_gpio_pm_1bit),
+		.config	= &s3c24xx_gpiocfg_banka,
 		.chip	= {
 			.base			= S3C2410_GPA(0),
 			.owner			= THIS_MODULE,
@@ -168,8 +179,12 @@ static __init int s3c24xx_gpiolib_init(void)
 	struct s3c_gpio_chip *chip = s3c24xx_gpios;
 	int gpn;
 
-	for (gpn = 0; gpn < ARRAY_SIZE(s3c24xx_gpios); gpn++, chip++)
+	for (gpn = 0; gpn < ARRAY_SIZE(s3c24xx_gpios); gpn++, chip++) {
+		if (!chip->config)
+			chip->config = &s3c24xx_gpiocfg_default;
+
 		s3c_gpiolib_add(chip);
+	}
 
 	return 0;
 }
diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
index 44a84e8..c583282 100644
--- a/arch/arm/plat-samsung/gpio-config.c
+++ b/arch/arm/plat-samsung/gpio-config.c
@@ -61,8 +61,8 @@ int s3c_gpio_setpull(unsigned int pin, s3c_gpio_pull_t pull)
 EXPORT_SYMBOL(s3c_gpio_setpull);
 
 #ifdef CONFIG_S3C_GPIO_CFG_S3C24XX
-int s3c_gpio_setcfg_s3c24xx_banka(struct s3c_gpio_chip *chip,
-				  unsigned int off, unsigned int cfg)
+int s3c_gpio_setcfg_s3c24xx_a(struct s3c_gpio_chip *chip,
+			      unsigned int off, unsigned int cfg)
 {
 	void __iomem *reg = chip->base;
 	unsigned int shift = off;
diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h b/arch/arm/plat-samsung/include/plat/gpio-core.h
index 49ff406..f0584f2 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-core.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
@@ -108,6 +108,9 @@ extern void samsung_gpiolib_add_4bit2_chips(struct s3c_gpio_chip *chip,
 extern void samsung_gpiolib_add_4bit(struct s3c_gpio_chip *chip);
 extern void samsung_gpiolib_add_4bit2(struct s3c_gpio_chip *chip);
 
+/* exported for core SoC support to change */
+extern struct s3c_gpio_cfg s3c24xx_gpiocfg_default;
+
 #ifdef CONFIG_S3C_GPIO_TRACK
 extern struct s3c_gpio_chip *s3c_gpios[S3C_GPIO_END];
 
-- 
1.7.0.4
