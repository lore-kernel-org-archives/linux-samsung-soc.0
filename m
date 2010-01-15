From: Niels Langendorff <linux@langendorff.nl>
Subject: Re: [PATCH 1/2] ARM: S5P6440: Add S5P6440 GPIO support
Date: Fri, 15 Jan 2010 08:33:31 +0100
Message-ID: <4B501A4B.1060406@langendorff.nl>
References: <1263468422-24883-1-git-send-email-kgene.kim@samsung.com> <4B4F3830.1@langendorff.nl> <20100115013629.GW3738@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080200080800060907070601"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:47627 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750837Ab0AOHdc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jan 2010 02:33:32 -0500
In-Reply-To: <20100115013629.GW3738@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@trinity.fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Aditya Pratap Sharma <adityaps@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

This is a multi-part message in MIME format.
--------------080200080800060907070601
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

See attached files from Samsungs CQ database

Ben Dooks wrote:
> On Thu, Jan 14, 2010 at 04:28:48PM +0100, Niels Langendorff wrote:
>> Make sure this patch includes the fixes I supplied in the Samsung CQ  
>> database APTT00000153
> 
> Which would those be, other mortals don't have access to that information.
> 
> [snip]
>  

--------------080200080800060907070601
Content-Type: text/plain;
 name="patch.4bit2_s3c64xx_gpiolib"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.4bit2_s3c64xx_gpiolib"

diff -Naur linux-base/arch/arm/plat-s3c64xx/gpiolib.c linux/arch/arm/plat-s3c64xx/gpiolib.c
--- linux-base/arch/arm/plat-s3c64xx/gpiolib.c	2009-06-25 17:02:41.000000000 +0200
+++ linux/arch/arm/plat-s3c64xx/gpiolib.c	2009-06-26 11:11:18.000000000 +0200
@@ -168,15 +168,16 @@
 	void __iomem *regcon = base;
 	unsigned long con;
 	unsigned long dat;
+	unsigned con_offset = offset;
 
-	if (offset > 7)
-		offset -= 8;
+	if (con_offset > 7)
+		con_offset -= 8;
 	else
 		regcon -= 4;
 
 	con = __raw_readl(regcon);
-	con &= ~(0xf << con_4bit_shift(offset));
-	con |= 0x1 << con_4bit_shift(offset);
+	con &= ~(0xf << con_4bit_shift(con_offset));
+	con |= 0x1 << con_4bit_shift(con_offset);
 
 	dat = __raw_readl(base + OFF_GPDAT);
 	if (value)

--------------080200080800060907070601
Content-Type: text/plain;
 name="patch.rbank_patched_based_on_r14"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.rbank_patched_based_on_r14"

diff -Naur linux-2.6-samsung-base/arch/arm/plat-s3c/gpio-config.c linux-2.6-samsung/arch/arm/plat-s3c/gpio-config.c
--- linux-2.6-samsung-base/arch/arm/plat-s3c/gpio-config.c	2009-06-17 10:54:11.000000000 +0200
+++ linux-2.6-samsung/arch/arm/plat-s3c/gpio-config.c	2009-06-17 10:57:39.000000000 +0200
@@ -132,6 +132,44 @@
 #endif
 
 #ifdef CONFIG_S3C_GPIO_CFG_S3C64XX
+int s3c_gpio_setcfg_s3c64xx_4bit_rbank(struct s3c_gpio_chip *chip,
+				 unsigned int off, unsigned int cfg)
+{
+	void __iomem *reg = chip->base;
+	unsigned int shift;
+	u32 con;
+
+	switch(off) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 5:
+			shift = (off & 7) * 4;
+			reg -= 4;
+			break;
+		case 6:
+			shift = ((off + 1) & 7) * 4;
+			reg -= 4;
+		default:
+			shift = ((off + 1) & 7) * 4;
+			break;
+	}
+
+	if (s3c_gpio_is_cfg_special(cfg)) {
+		cfg &= 0xf;
+		cfg <<= shift;
+	}
+
+	con = __raw_readl(reg);
+	con &= ~(0xf << shift);
+	con |= cfg;
+	__raw_writel(con, reg);
+
+	return 0;
+}
+
 int s3c_gpio_setcfg_s3c64xx_4bit(struct s3c_gpio_chip *chip,
 				 unsigned int off, unsigned int cfg)
 {
diff -Naur linux-2.6-samsung-base/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h linux-2.6-samsung/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h
--- linux-2.6-samsung-base/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h	2009-06-17 10:54:11.000000000 +0200
+++ linux-2.6-samsung/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h	2009-06-17 10:59:12.000000000 +0200
@@ -72,6 +72,28 @@
 				     unsigned int off, unsigned int cfg);
 
 /**
+ * s3c_gpio_setcfg_s3c64xx_4bit_rbank - S3C64XX 4bit single register GPIO R config.
+ * @chip: The gpio chip that is being configured (always R).
+ * @off: The offset for the GPIO being configured.
+ * @cfg: The configuration value to set.
+ *
+ * This helper deal with the GPIO cases where the control register has 4 bits
+ * of control per GPIO, generally in the form of:
+ *	0000 = Input
+ *	0001 = Output
+ *	others = Special functions (dependant on bank)
+ *
+ * A special function is implemented for the R bank because of the GPIO gaps
+ * in this bank
+ *
+ * Note, since the code to deal with the case where there are two control
+ * registers instead of one, we do not have a seperate set of functions for
+ * each case.
+*/
+extern int s3c_gpio_setcfg_s3c64xx_4bit_rbank(struct s3c_gpio_chip *chip,
+					unsigned int off, unsigned int cfg);
+
+/**
  * s3c_gpio_setcfg_s3c64xx_4bit - S3C64XX 4bit single register GPIO config.
  * @chip: The gpio chip that is being configured.
  * @off: The offset for the GPIO being configured.
@@ -83,6 +105,8 @@
  *	0001 = Output
  *	others = Special functions (dependant on bank)
  *
+ * Note, do not use this function for register bank R
+ *
  * Note, since the code to deal with the case where there are two control
  * registers instead of one, we do not have a seperate set of functions for
  * each case.
diff -Naur linux-2.6-samsung-base/arch/arm/plat-s5p64xx/gpiolib.c linux-2.6-samsung/arch/arm/plat-s5p64xx/gpiolib.c
--- linux-2.6-samsung-base/arch/arm/plat-s5p64xx/gpiolib.c	2009-06-17 10:54:07.000000000 +0200
+++ linux-2.6-samsung/arch/arm/plat-s5p64xx/gpiolib.c	2009-06-17 11:01:00.000000000 +0200
@@ -210,7 +210,7 @@
 
 static struct s3c_gpio_cfg gpio_4bit_cfg_eint0011 = {
 	.cfg_eint	= 3,
-	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
+	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit_rbank,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
 	.set_pin	= s3c_gpio_setpin_updown,

--------------080200080800060907070601
Content-Type: text/plain;
 name="patch.rbank_s5p6440"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.rbank_s5p6440"

diff -Naur linux-2.6-samsung-base/arch/arm/plat-s3c/gpio-config.c linux-2.6-samsung/arch/arm/plat-s3c/gpio-config.c
--- linux-2.6-samsung-base/arch/arm/plat-s3c/gpio-config.c	2009-06-08 09:53:44.000000000 +0200
+++ linux-2.6-samsung/arch/arm/plat-s3c/gpio-config.c	2009-06-26 13:56:14.000000000 +0200
@@ -132,6 +132,44 @@
 #endif
 
 #ifdef CONFIG_S3C_GPIO_CFG_S3C64XX
+int s3c_gpio_setcfg_s3c64xx_4bit_rbank(struct s3c_gpio_chip *chip,
+				 unsigned int off, unsigned int cfg)
+{
+	void __iomem *reg = chip->base;
+	unsigned int shift;
+	u32 con;
+
+	switch(off) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 5:
+			shift = (off & 7) * 4;
+			reg -= 4;
+			break;
+		case 6:
+			shift = ((off + 1) & 7) * 4;
+			reg -= 4;
+		default:
+			shift = ((off + 1) & 7) * 4;
+			break;
+	}
+
+	if (s3c_gpio_is_cfg_special(cfg)) {
+		cfg &= 0xf;
+		cfg <<= shift;
+	}
+
+	con = __raw_readl(reg);
+	con &= ~(0xf << shift);
+	con |= cfg;
+	__raw_writel(con, reg);
+
+	return 0;
+}
+
 int s3c_gpio_setcfg_s3c64xx_4bit(struct s3c_gpio_chip *chip,
 				 unsigned int off, unsigned int cfg)
 {
diff -Naur linux-2.6-samsung-base/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h linux-2.6-samsung/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h
--- linux-2.6-samsung-base/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h	2009-06-08 09:53:44.000000000 +0200
+++ linux-2.6-samsung/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h	2009-06-26 13:55:58.000000000 +0200
@@ -72,6 +72,28 @@
 				     unsigned int off, unsigned int cfg);
 
 /**
+ * s3c_gpio_setcfg_s3c64xx_4bit_rbank - S3C64XX 4bit single register GPIO R config.
+ * @chip: The gpio chip that is being configured (always R).
+ * @off: The offset for the GPIO being configured.
+ * @cfg: The configuration value to set.
+ *
+ * This helper deal with the GPIO cases where the control register has 4 bits
+ * of control per GPIO, generally in the form of:
+ *	0000 = Input
+ *	0001 = Output
+ *	others = Special functions (dependant on bank)
+ *
+ * A special function is implemented for the R bank because of the GPIO gaps
+ * in this bank
+ *
+ * Note, since the code to deal with the case where there are two control
+ * registers instead of one, we do not have a seperate set of functions for
+ * each case.
+*/
+extern int s3c_gpio_setcfg_s3c64xx_4bit_rbank(struct s3c_gpio_chip *chip,
+					unsigned int off, unsigned int cfg);
+
+/**
  * s3c_gpio_setcfg_s3c64xx_4bit - S3C64XX 4bit single register GPIO config.
  * @chip: The gpio chip that is being configured.
  * @off: The offset for the GPIO being configured.
@@ -83,6 +105,8 @@
  *	0001 = Output
  *	others = Special functions (dependant on bank)
  *
+ * Note, do not use this function for register bank R
+ *
  * Note, since the code to deal with the case where there are two control
  * registers instead of one, we do not have a seperate set of functions for
  * each case.
diff -Naur linux-2.6-samsung-base/arch/arm/plat-s5p64xx/gpiolib.c linux-2.6-samsung/arch/arm/plat-s5p64xx/gpiolib.c
--- linux-2.6-samsung-base/arch/arm/plat-s5p64xx/gpiolib.c	2009-06-08 09:53:44.000000000 +0200
+++ linux-2.6-samsung/arch/arm/plat-s5p64xx/gpiolib.c	2009-06-26 13:55:41.000000000 +0200
@@ -160,6 +160,38 @@
 
 }
 
+static int s5p64xx_gpiolib_rbank_4bit2_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct s3c_gpio_chip *ourchip = to_s3c_gpio(chip);
+	void __iomem *base = ourchip->base;
+	void __iomem *regcon = base;
+	unsigned long con;
+
+	switch(offset) {
+		case 6:
+			offset += 1;
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 5:
+			regcon -= 4;
+			break;
+		default:
+			offset -= 7;
+			break;
+	}
+
+	con = __raw_readl(regcon);
+	con &= ~(0xf << con_4bit_shift(offset));
+	__raw_writel(con, regcon);
+
+	gpio_dbg("%s: %p: CON %08lx\n", __func__, base, con);
+
+	return 0;
+}
+
 static int s5p64xx_gpiolib_4bit2_output(struct gpio_chip *chip,
 				       unsigned offset, int value)
 {
@@ -168,15 +200,61 @@
 	void __iomem *regcon = base;
 	unsigned long con;
 	unsigned long dat;
+	unsigned con_offset = offset;
 
-	if (offset > 7)
-		offset -= 8;
+	if (con_offset > 7)
+		con_offset -= 8;
 	else
 		regcon -= 4;
 
 	con = __raw_readl(regcon);
-	con &= ~(0xf << con_4bit_shift(offset));
-	con |= 0x1 << con_4bit_shift(offset);
+	con &= ~(0xf << con_4bit_shift(con_offset));
+	con |= 0x1 << con_4bit_shift(con_offset);
+
+	dat = __raw_readl(base + OFF_GPDAT);
+	if (value)
+		dat |= 1 << offset;
+	else
+		dat &= ~(1 << offset);
+
+	__raw_writel(dat, base + OFF_GPDAT);
+	__raw_writel(con, regcon);
+	__raw_writel(dat, base + OFF_GPDAT);
+
+	gpio_dbg("%s: %p: CON %08lx, DAT %08lx\n", __func__, base, con, dat);
+
+	return 0;
+}
+
+static int s5p64xx_gpiolib_rbank_4bit2_output(struct gpio_chip *chip,
+				       unsigned offset, int value)
+{
+	struct s3c_gpio_chip *ourchip = to_s3c_gpio(chip);
+	void __iomem *base = ourchip->base;
+	void __iomem *regcon = base;
+	unsigned long con;
+	unsigned long dat;
+	unsigned con_offset  = offset;
+
+	switch(con_offset) {
+		case 6:
+			con_offset += 1;
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 5:
+			regcon -= 4;
+			break;
+		default:
+			con_offset -= 7;
+			break;
+	}
+
+	con = __raw_readl(regcon);
+	con &= ~(0xf << con_4bit_shift(con_offset));
+	con |= 0x1 << con_4bit_shift(con_offset);
 
 	dat = __raw_readl(base + OFF_GPDAT);
 	if (value)
@@ -210,7 +288,7 @@
 
 static struct s3c_gpio_cfg gpio_4bit_cfg_eint0011 = {
 	.cfg_eint	= 3,
-	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
+	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit_rbank,
 	.set_pull	= s3c_gpio_setpull_updown,
 	.get_pull	= s3c_gpio_getpull_updown,
 	.set_pin	= s3c_gpio_setpin_updown,
@@ -261,7 +339,11 @@
 			.ngpio	= S5P64XX_GPIO_H_NR,
 			.label	= "GPH",
 		},
-	}, {
+	}, 
+};
+
+static struct s3c_gpio_chip gpio_rbank_4bit2[] = {
+	{
 		.base	= S5P64XX_GPR_BASE + 0x4,
 		.config	= &gpio_4bit_cfg_eint0011,
 		.chip	= {
@@ -351,6 +433,12 @@
 	chip->chip.direction_output = s5p64xx_gpiolib_4bit2_output;
 }
 
+static __init void s5p64xx_gpiolib_add_rbank_4bit2(struct s3c_gpio_chip *chip)
+{
+	chip->chip.direction_input = s5p64xx_gpiolib_rbank_4bit2_input;
+	chip->chip.direction_output = s5p64xx_gpiolib_rbank_4bit2_output;
+}
+
 static __init void s5p64xx_gpiolib_add(struct s3c_gpio_chip *chips,
 				       int nr_chips,
 				       void (*fn)(struct s3c_gpio_chip *))
@@ -370,6 +458,9 @@
 	s5p64xx_gpiolib_add(gpio_4bit2, ARRAY_SIZE(gpio_4bit2),
 			    s5p64xx_gpiolib_add_4bit2);
 
+	s5p64xx_gpiolib_add(gpio_rbank_4bit2, ARRAY_SIZE(gpio_rbank_4bit2),
+			    s5p64xx_gpiolib_add_rbank_4bit2);
+
 	s5p64xx_gpiolib_add(gpio_2bit, ARRAY_SIZE(gpio_2bit), NULL);
 
 	return 0;

--------------080200080800060907070601--
