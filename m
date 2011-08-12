From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 3/4] ARM: Exynos4: enable TV support on Universal_C210 board
Date: Fri, 12 Aug 2011 11:45:41 +0200
Message-ID: <1313142342-22403-4-git-send-email-t.stanislaws@samsung.com>
References: <1313142342-22403-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22082 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751786Ab1HLJpu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 05:45:50 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LPT003AS74CUQ@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 10:45:48 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPT00MYY74BH2@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 10:45:47 +0100 (BST)
In-reply-to: <1313142342-22403-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

This patch adds platform devices and regulators for TV devices on
Samsung Universal C210 board.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    2 +
 arch/arm/mach-exynos4/mach-universal_c210.c |   74 +++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 3ceefdb..144c05d 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -184,9 +184,11 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
+	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_MFC
 	select S5P_DEV_ONENAND
 	select EXYNOS4_DEV_PD
+	select S5P_DEV_TV
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C3
 	select EXYNOS4_SETUP_I2C5
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 0e280d1..e9dbe79 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -110,6 +110,9 @@ static struct regulator_consumer_supply lp3974_buck1_consumer =
 static struct regulator_consumer_supply lp3974_buck2_consumer =
 	REGULATOR_SUPPLY("vddg3d", NULL);
 
+static struct regulator_consumer_supply lp3974_buck3_consumer =
+	REGULATOR_SUPPLY("vdet", "s5p-sdo");
+
 static struct regulator_init_data lp3974_buck1_data = {
 	.constraints	= {
 		.name		= "VINT_1.1V",
@@ -153,6 +156,8 @@ static struct regulator_init_data lp3974_buck3_data = {
 			.enabled	= 1,
 		},
 	},
+	.num_consumer_supplies = 1,
+	.consumer_supplies = &lp3974_buck3_consumer,
 };
 
 static struct regulator_init_data lp3974_buck4_data = {
@@ -181,6 +186,11 @@ static struct regulator_init_data lp3974_ldo2_data = {
 	},
 };
 
+static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
+	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"),
+	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"),
+};
+
 static struct regulator_init_data lp3974_ldo3_data = {
 	.constraints	= {
 		.name		= "VUSB+MIPI_1.1V",
@@ -192,6 +202,12 @@ static struct regulator_init_data lp3974_ldo3_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo3_consumer),
+	.consumer_supplies = lp3974_ldo3_consumer,
+};
+
+static struct regulator_consumer_supply lp3974_ldo4_consumer[] = {
+	REGULATOR_SUPPLY("vdd_osc", "exynos4-hdmi"),
 };
 
 static struct regulator_init_data lp3974_ldo4_data = {
@@ -205,6 +221,8 @@ static struct regulator_init_data lp3974_ldo4_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo4_consumer),
+	.consumer_supplies = lp3974_ldo4_consumer,
 };
 
 static struct regulator_init_data lp3974_ldo5_data = {
@@ -246,6 +264,10 @@ static struct regulator_init_data lp3974_ldo7_data = {
 	},
 };
 
+static struct regulator_consumer_supply lp3974_ldo8_consumer[] = {
+	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
+};
+
 static struct regulator_init_data lp3974_ldo8_data = {
 	.constraints	= {
 		.name		= "VUSB+VDAC_3.3V",
@@ -257,6 +279,8 @@ static struct regulator_init_data lp3974_ldo8_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo8_consumer),
+	.consumer_supplies = lp3974_ldo8_consumer,
 };
 
 static struct regulator_init_data lp3974_ldo9_data = {
@@ -472,6 +496,34 @@ static struct max8998_platform_data universal_lp3974_pdata = {
 	.wakeup			= true,
 };
 
+static struct regulator_consumer_supply hdmi_fixed_consumer =
+	REGULATOR_SUPPLY("hdmi-en", "exynos4-hdmi");
+
+static struct regulator_init_data hdmi_fixed_voltage_init_data = {
+	.constraints		= {
+		.name		= "HDMI_5V",
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &hdmi_fixed_consumer,
+};
+
+static struct fixed_voltage_config hdmi_fixed_voltage_config = {
+	.supply_name		= "HDMI_EN1",
+	.microvolts		= 5000000,
+	.gpio			= EXYNOS4_GPE0(1),
+	.enable_high		= true,
+	.init_data		= &hdmi_fixed_voltage_init_data,
+};
+
+static struct platform_device hdmi_fixed_voltage = {
+	.name			= "reg-fixed-voltage",
+	.id			= 6,
+	.dev			= {
+		.platform_data	= &hdmi_fixed_voltage_config,
+	},
+};
+
 /* GPIO I2C 5 (PMIC) */
 static struct i2c_board_info i2c5_devs[] __initdata = {
 	{
@@ -714,6 +766,12 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s3c_device_hsmmc3,
 	&s3c_device_i2c3,
 	&s3c_device_i2c5,
+	&s5p_device_i2c_hdmiphy,
+	&hdmi_fixed_voltage,
+	&exynos4_device_pd[PD_TV],
+	&s5p_device_hdmi,
+	&s5p_device_sdo,
+	&s5p_device_mixer,
 
 	/* Universal Devices */
 	&i2c_gpio12,
@@ -732,6 +790,20 @@ static void __init universal_map_io(void)
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
 }
 
+void s5p_tv_setup(void)
+{
+	/* direct HPD to HDMI chip */
+	gpio_request(EXYNOS4_GPX3(7), "hpd-plug");
+
+	gpio_direction_input(EXYNOS4_GPX3(7));
+	s3c_gpio_cfgpin(EXYNOS4_GPX3(7), S3C_GPIO_SFN(0x3));
+	s3c_gpio_setpull(EXYNOS4_GPX3(7), S3C_GPIO_PULL_NONE);
+
+	/* setup dependencies between TV devices */
+	s5p_device_hdmi.dev.parent = &exynos4_device_pd[PD_TV].dev;
+	s5p_device_mixer.dev.parent = &exynos4_device_pd[PD_TV].dev;
+}
+
 static void __init universal_reserve(void)
 {
 	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
@@ -740,6 +812,7 @@ static void __init universal_reserve(void)
 static void __init universal_machine_init(void)
 {
 	universal_sdhci_init();
+	s5p_tv_setup();
 
 	i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_devs));
 	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
@@ -749,6 +822,7 @@ static void __init universal_machine_init(void)
 	i2c_register_board_info(3, i2c3_devs, ARRAY_SIZE(i2c3_devs));
 
 	s3c_i2c5_set_platdata(NULL);
+	s5p_i2c_hdmiphy_set_platdata(NULL);
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
 
 	universal_touchkey_init();
-- 
1.7.6
