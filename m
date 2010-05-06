From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 17/23] ARM: SAMSUNG: Add GPIO configuration read calls
Date: Fri,  7 May 2010 08:15:39 +0900
Message-ID: <1273187745-6566-18-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60648 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753757Ab0EFXQI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:08 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add the necessary 1,2 and 4 bit configuration read calls for the new
gpio code to allow removal of the old s3c24xx gpio code.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c64xx/gpiolib.c                    |    6 +++
 arch/arm/mach-s5p6440/gpio.c                       |    5 ++
 arch/arm/plat-s3c24xx/gpiolib.c                    |    2 +
 arch/arm/plat-samsung/gpio-config.c                |   47 +++++++++++++++++++-
 .../plat-samsung/include/plat/gpio-cfg-helpers.h   |   41 +++++++++++++++++
 5 files changed, 100 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/gpiolib.c b/arch/arm/mach-s3c64xx/gpiolib.c
index 66e6794..60c929a 100644
--- a/arch/arm/mach-s3c64xx/gpiolib.c
+++ b/arch/arm/mach-s3c64xx/gpiolib.c
@@ -51,6 +51,7 @@
 
 static struct s3c_gpio_cfg gpio_4bit_cfg_noint = {
 	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
+	.get_config	= s3c_gpio_getcfg_s3c64xx_4bit,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
 };
@@ -58,12 +59,14 @@ static struct s3c_gpio_cfg gpio_4bit_cfg_noint = {
 static struct s3c_gpio_cfg gpio_4bit_cfg_eint0111 = {
 	.cfg_eint	= 7,
 	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
+	.get_config	= s3c_gpio_getcfg_s3c64xx_4bit,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
 };
 
 static struct s3c_gpio_cfg gpio_4bit_cfg_eint0011 = {
 	.cfg_eint	= 3,
+	.get_config	= s3c_gpio_getcfg_s3c64xx_4bit,
 	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
@@ -171,6 +174,7 @@ static struct s3c_gpio_chip gpio_4bit2[] = {
 
 static struct s3c_gpio_cfg gpio_2bit_cfg_noint = {
 	.set_config	= s3c_gpio_setcfg_s3c24xx,
+	.get_config	= s3c_gpio_getcfg_s3c24xx,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
 };
@@ -178,6 +182,7 @@ static struct s3c_gpio_cfg gpio_2bit_cfg_noint = {
 static struct s3c_gpio_cfg gpio_2bit_cfg_eint10 = {
 	.cfg_eint	= 2,
 	.set_config	= s3c_gpio_setcfg_s3c24xx,
+	.get_config	= s3c_gpio_getcfg_s3c24xx,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
 };
@@ -185,6 +190,7 @@ static struct s3c_gpio_cfg gpio_2bit_cfg_eint10 = {
 static struct s3c_gpio_cfg gpio_2bit_cfg_eint11 = {
 	.cfg_eint	= 3,
 	.set_config	= s3c_gpio_setcfg_s3c24xx,
+	.get_config	= s3c_gpio_getcfg_s3c24xx,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
 };
diff --git a/arch/arm/mach-s5p6440/gpio.c b/arch/arm/mach-s5p6440/gpio.c
index b0ea741..262dc75 100644
--- a/arch/arm/mach-s5p6440/gpio.c
+++ b/arch/arm/mach-s5p6440/gpio.c
@@ -161,12 +161,15 @@ static struct s3c_gpio_cfg s5p6440_gpio_cfgs[] = {
 	}, {
 		.cfg_eint	= 0,
 		.set_config	= s3c_gpio_setcfg_s3c24xx,
+		.get_config	= s3c_gpio_getcfg_s3c24xx,
 	}, {
 		.cfg_eint	= 2,
 		.set_config	= s3c_gpio_setcfg_s3c24xx,
+		.get_config	= s3c_gpio_getcfg_s3c24xx,
 	}, {
 		.cfg_eint	= 3,
 		.set_config	= s3c_gpio_setcfg_s3c24xx,
+		.get_config	= s3c_gpio_getcfg_s3c24xx,
 	},
 };
 
@@ -279,6 +282,8 @@ void __init s5p6440_gpiolib_set_cfg(struct s3c_gpio_cfg *chipcfg, int nr_chips)
 	for (; nr_chips > 0; nr_chips--, chipcfg++) {
 		if (!chipcfg->set_config)
 			chipcfg->set_config	= s3c_gpio_setcfg_s3c64xx_4bit;
+		if (!chipcfg->get_config)
+			chipcfg->get_config	= s3c_gpio_getcfg_s3c64xx_4bit;
 		if (!chipcfg->set_pull)
 			chipcfg->set_pull	= s3c_gpio_setpull_updown;
 		if (!chipcfg->get_pull)
diff --git a/arch/arm/plat-s3c24xx/gpiolib.c b/arch/arm/plat-s3c24xx/gpiolib.c
index e8c0e8a..4c0896f 100644
--- a/arch/arm/plat-s3c24xx/gpiolib.c
+++ b/arch/arm/plat-s3c24xx/gpiolib.c
@@ -81,10 +81,12 @@ static int s3c24xx_gpiolib_bankg_toirq(struct gpio_chip *chip, unsigned offset)
 
 static struct s3c_gpio_cfg s3c24xx_gpiocfg_banka = {
 	.set_config	= s3c_gpio_setcfg_s3c24xx_a,
+	.get_config	= s3c_gpio_getcfg_s3c24xx_a,
 };
 
 struct s3c_gpio_cfg s3c24xx_gpiocfg_default = {
 	.set_config	= s3c_gpio_setcfg_s3c24xx,
+	.get_config	= s3c_gpio_getcfg_s3c24xx,
 };
 
 struct s3c_gpio_chip s3c24xx_gpios[] = {
diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
index 8aca88d..19ab89d 100644
--- a/arch/arm/plat-samsung/gpio-config.c
+++ b/arch/arm/plat-samsung/gpio-config.c
@@ -1,7 +1,7 @@
 /* linux/arch/arm/plat-s3c/gpio-config.c
  *
  * Copyright 2008 Openmoko, Inc.
- * Copyright 2008 Simtec Electronics
+ * Copyright 2008-2010 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
  *
@@ -87,6 +87,19 @@ int s3c_gpio_setcfg_s3c24xx_a(struct s3c_gpio_chip *chip,
 	return 0;
 }
 
+unsigned s3c_gpio_getcfg_s3c24xx_a(struct s3c_gpio_chip *chip,
+				   unsigned int off)
+{
+	u32 con;
+
+	con = __raw_readl(chip->base);
+	con >>= off;
+	con &= 1;
+	con++;
+
+	return S3C_GPIO_SFN(con);
+}
+
 int s3c_gpio_setcfg_s3c24xx(struct s3c_gpio_chip *chip,
 			    unsigned int off, unsigned int cfg)
 {
@@ -109,6 +122,19 @@ int s3c_gpio_setcfg_s3c24xx(struct s3c_gpio_chip *chip,
 
 	return 0;
 }
+
+unsigned int s3c_gpio_getcfg_s3c24xx(struct s3c_gpio_chip *chip,
+				     unsigned int off)
+{
+	u32 con;
+
+	con = __raw_readl(chip->base);
+	con >>= off * 2;
+	con &= 3;
+
+	/* this conversion works for IN and OUT as well as special mode */
+	return S3C_GPIO_SPECIAL(con);
+}
 #endif
 
 #ifdef CONFIG_S3C_GPIO_CFG_S3C64XX
@@ -134,6 +160,25 @@ int s3c_gpio_setcfg_s3c64xx_4bit(struct s3c_gpio_chip *chip,
 
 	return 0;
 }
+
+unsigned s3c_gpio_getcfg_s3c64xx_4bit(struct s3c_gpio_chip *chip,
+				      unsigned int off)
+{
+	void __iomem *reg = chip->base;
+	unsigned int shift = (off & 7) * 4;
+	u32 con;
+
+	if (off < 8 && chip->chip.ngpio > 8)
+		reg -= 4;
+
+	con = __raw_readl(reg);
+	con >>= shift;
+	con &= 0xf;
+
+	/* this conversion works for IN and OUT as well as special mode */
+	return S3C_GPIO_SPECIAL(con);
+}
+
 #endif /* CONFIG_S3C_GPIO_CFG_S3C64XX */
 
 #ifdef CONFIG_S3C_GPIO_PULL_UPDOWN
diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
index 885e9ac..a8868c4 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg-helpers.h
@@ -53,6 +53,18 @@ extern int s3c_gpio_setcfg_s3c24xx(struct s3c_gpio_chip *chip,
 				   unsigned int off, unsigned int cfg);
 
 /**
+ * s3c_gpio_getcfg_s3c24xx - S3C24XX style GPIO configuration read.
+ * @chip: The gpio chip that is being configured.
+ * @off: The offset for the GPIO being configured.
+ *
+ * The reverse of s3c_gpio_setcfg_s3c24xx(). Will return a value whicg
+ * could be directly passed back to s3c_gpio_setcfg_s3c24xx(), from the
+ * S3C_GPIO_SPECIAL() macro.
+ */
+unsigned int s3c_gpio_getcfg_s3c24xx(struct s3c_gpio_chip *chip,
+				     unsigned int off);
+
+/**
  * s3c_gpio_setcfg_s3c24xx_a - S3C24XX style GPIO configuration (Bank A)
  * @chip: The gpio chip that is being configured.
  * @off: The offset for the GPIO being configured.
@@ -65,6 +77,21 @@ extern int s3c_gpio_setcfg_s3c24xx(struct s3c_gpio_chip *chip,
 extern int s3c_gpio_setcfg_s3c24xx_a(struct s3c_gpio_chip *chip,
 				     unsigned int off, unsigned int cfg);
 
+
+/**
+ * s3c_gpio_getcfg_s3c24xx_a - S3C24XX style GPIO configuration read (Bank A)
+ * @chip: The gpio chip that is being configured.
+ * @off: The offset for the GPIO being configured.
+ *
+ * The reverse of s3c_gpio_setcfg_s3c24xx_a() turning an GPIO into a usable
+ * GPIO configuration value.
+ *
+ * @sa s3c_gpio_getcfg_s3c24xx
+ * @sa s3c_gpio_getcfg_s3c64xx_4bit
+ */
+extern unsigned s3c_gpio_getcfg_s3c24xx_a(struct s3c_gpio_chip *chip,
+					  unsigned int off);
+
 /**
  * s3c_gpio_setcfg_s3c64xx_4bit - S3C64XX 4bit single register GPIO config.
  * @chip: The gpio chip that is being configured.
@@ -85,6 +112,20 @@ extern int s3c_gpio_setcfg_s3c64xx_4bit(struct s3c_gpio_chip *chip,
 					unsigned int off, unsigned int cfg);
 
 
+/**
+ * s3c_gpio_getcfg_s3c64xx_4bit - S3C64XX 4bit single register GPIO config read.
+ * @chip: The gpio chip that is being configured.
+ * @off: The offset for the GPIO being configured.
+ *
+ * The reverse of s3c_gpio_setcfg_s3c64xx_4bit(), turning a gpio configuration
+ * register setting into a value the software can use, such as could be passed
+ * to s3c_gpio_setcfg_s3c64xx_4bit().
+ *
+ * @sa s3c_gpio_getcfg_s3c24xx
+ */
+extern unsigned s3c_gpio_getcfg_s3c64xx_4bit(struct s3c_gpio_chip *chip,
+					     unsigned int off);
+
 /* Pull-{up,down} resistor controls.
  *
  * S3C2410,S3C2440,S3C24A0 = Pull-UP,
-- 
1.7.0.4
