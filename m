From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/6] ARM: S5PC110: add support for MMC regulators on Goni board
Date: Fri, 10 Sep 2010 09:23:23 +0200
Message-ID: <1284103403-10696-7-git-send-email-m.szyprowski@samsung.com>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35026 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753556Ab0IJHXd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 03:23:33 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8I00EZ7SJ3VY30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:28 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8I007CASJ3V3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:27 +0100 (BST)
In-reply-to: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Add required platform definitions for MMC power regulators on Samsung
Goni board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
CC: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |   44 ++++++++++++++++++++++++++++++++++--
 1 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index b28a42b..595afc37 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-gpio.h>
 #include <linux/mfd/max8998.h>
+#include <linux/regulator/fixed.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi_gpio.h>
 #include <linux/lcd.h>
@@ -227,6 +228,10 @@ static void __init goni_radio_init(void)
 /* MAX8998 regulators */
 #if defined(CONFIG_REGULATOR_MAX8998) || defined(CONFIG_REGULATOR_MAX8998_MODULE)
 
+static struct regulator_consumer_supply goni_ldo5_consumers[] = {
+	{ .supply = "vmmc",	.dev = &s3c_device_hsmmc0.dev },
+};
+
 static struct regulator_init_data goni_ldo2_data = {
 	.constraints	= {
 		.name		= "VALIVE_1.1V",
@@ -266,6 +271,8 @@ static struct regulator_init_data goni_ldo5_data = {
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
 	},
+	.num_consumer_supplies = ARRAY_SIZE(goni_ldo5_consumers),
+	.consumer_supplies = goni_ldo5_consumers,
 };
 
 static struct regulator_init_data goni_ldo6_data = {
@@ -471,6 +478,39 @@ static struct max8998_platform_data goni_max8998_pdata = {
 	.num_regulators	= ARRAY_SIZE(goni_regulators),
 	.regulators	= goni_regulators,
 };
+
+static struct regulator_consumer_supply mmc2_supplies[] = {
+	{
+		.dev		= &s3c_device_hsmmc2.dev,
+		.supply		= "vmmc",
+	},
+};
+
+static struct regulator_init_data mmc2_fixed_voltage_init_data = {
+	.constraints		= {
+		.name		= "V_TF_2.8V",
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(mmc2_supplies),
+	.consumer_supplies	= mmc2_supplies,
+};
+
+static struct fixed_voltage_config mmc2_fixed_voltage_config = {
+	.supply_name		= "T_FLASH_EN",
+	.microvolts		= 2800000,
+	.gpio			= S5PV210_MP05(4),	/* XM0ADDR_12 */
+	.enable_high		= true,
+	.init_data		= &mmc2_fixed_voltage_init_data,
+};
+
+static struct platform_device mmc2_fixed_voltage = {
+	.name		= "reg-fixed-voltage",
+	.id		= 2,
+	.dev		= {
+		.platform_data	= &mmc2_fixed_voltage_config,
+	},
+};
+
 #endif
 
 /* GPIO I2C PMIC */
@@ -559,9 +599,6 @@ static struct s3c_sdhci_platdata goni_hsmmc2_data __initdata = {
 
 static void goni_setup_sdhci(void)
 {
-	gpio_request(GONI_EXT_FLASH_EN, "FLASH_EN");
-	gpio_direction_output(GONI_EXT_FLASH_EN, 1);
-
 	s3c_sdhci0_set_platdata(&goni_hsmmc0_data);
 	s3c_sdhci1_set_platdata(&goni_hsmmc1_data);
 	s3c_sdhci2_set_platdata(&goni_hsmmc2_data);
@@ -573,6 +610,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&goni_spi_gpio,
 	&s3c_device_usb_hsotg,
 	&goni_i2c_gpio_pmic,
+	&mmc2_fixed_voltage,
 	&goni_device_gpiokeys,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
-- 
1.7.2.2
