From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/3] ARM: S5PV210: Add i2c information to Goni and Aquila board
Date: Fri, 01 Oct 2010 13:23:22 +0900
Message-ID: <4CA5623A.6020108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64430 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803Ab0JAEXZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 00:23:25 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9L00HH7G6Z9490@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 13:23:23 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9L000C6G70CM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 13:23:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, "Kukjin Kim"@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>

This patch the I2C board information for the WM8994 used in the Goni/Aquila
as audio codec and adds the I2C platform drivers.

Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |   27 +++++++++++++++++++++++++++
 arch/arm/mach-s5pv210/mach-goni.c   |   27 +++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 0dda801..0663ec4 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -404,6 +404,28 @@ static struct i2c_board_info i2c_gpio_pmic_devs[] __initdata = {
 #endif
 };
 
+/* GPIO I2C AP 1.8V */
+#define AP_I2C_GPIO_BUS_5	5
+static struct i2c_gpio_platform_data aquila_i2c_gpio5_data = {
+	.sda_pin	= S5PV210_MP05(3),	/* XM0ADDR_11 */
+	.scl_pin	= S5PV210_MP05(2),	/* XM0ADDR_10 */
+};
+
+static struct platform_device aquila_i2c_gpio5 = {
+	.name		= "i2c-gpio",
+	.id		= AP_I2C_GPIO_BUS_5,
+	.dev		= {
+		.platform_data	= &aquila_i2c_gpio5_data,
+	},
+};
+
+static struct i2c_board_info i2c_gpio5_devs[] __initdata = {
+	{
+		/* CS/ADDR = low 0x34 (FYI: high = 0x36) */
+		I2C_BOARD_INFO("wm8994", 0x1a),
+	},
+};
+
 /* PMIC Power button */
 static struct gpio_keys_button aquila_gpio_keys_table[] = {
 	{
@@ -475,6 +497,7 @@ static void aquila_setup_sdhci(void)
 
 static struct platform_device *aquila_devices[] __initdata = {
 	&aquila_i2c_gpio_pmic,
+	&aquila_i2c_gpio5,
 	&aquila_device_gpiokeys,
 	&s3c_device_fb,
 	&s5pc110_device_onenand,
@@ -506,6 +529,10 @@ static void __init aquila_machine_init(void)
 	s3c_fimc_setname(1, "s5p-fimc");
 	s3c_fimc_setname(2, "s5p-fimc");
 
+	/* SOUND */
+	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
+			ARRAY_SIZE(i2c_gpio5_devs));
+
 	/* FB */
 	s3c_fb_set_platdata(&aquila_lcd_pdata);
 
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 53754d7..df5c2d1 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -385,6 +385,28 @@ static struct i2c_board_info i2c_gpio_pmic_devs[] __initdata = {
 #endif
 };
 
+/* GPIO I2C AP 1.8V */
+#define AP_I2C_GPIO_BUS_5	5
+static struct i2c_gpio_platform_data goni_i2c_gpio5_data = {
+	.sda_pin	= S5PV210_MP05(3),	/* XM0ADDR_11 */
+	.scl_pin	= S5PV210_MP05(2),	/* XM0ADDR_10 */
+};
+
+static struct platform_device goni_i2c_gpio5 = {
+	.name		= "i2c-gpio",
+	.id		= AP_I2C_GPIO_BUS_5,
+	.dev		= {
+		.platform_data	= &goni_i2c_gpio5_data,
+	},
+};
+
+static struct i2c_board_info i2c_gpio5_devs[] __initdata = {
+	{
+		/* CS/ADDR = low 0x34 (FYI: high = 0x36) */
+		I2C_BOARD_INFO("wm8994", 0x1a),
+	},
+};
+
 /* PMIC Power button */
 static struct gpio_keys_button goni_gpio_keys_table[] = {
 	{
@@ -458,6 +480,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_fb,
 	&s5pc110_device_onenand,
 	&goni_i2c_gpio_pmic,
+	&goni_i2c_gpio5,
 	&goni_device_gpiokeys,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
@@ -483,6 +506,10 @@ static void __init goni_machine_init(void)
 	/* SDHCI */
 	goni_setup_sdhci();
 
+	/* SOUND */
+	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
+			ARRAY_SIZE(i2c_gpio5_devs));
+
 	/* FB */
 	s3c_fb_set_platdata(&goni_lcd_pdata);
 
-- 
1.7.0.4
