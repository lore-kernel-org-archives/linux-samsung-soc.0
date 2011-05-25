From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH v4 7/9] arm: exynos4: universal_c210: add TV support
Date: Wed, 25 May 2011 14:29:22 +0200
Message-ID: <1306326564-21858-8-git-send-email-t.stanislaws@samsung.com>
References: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9212 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757069Ab1EYMac (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 08:30:32 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LLR0064M415UK@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:30 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LLR00CHV4146T@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:28 +0100 (BST)
In-reply-to: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Add platform devices and regulator and for TV devices on Samsung
Universal C210 board.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    3 +
 arch/arm/mach-exynos4/mach-universal_c210.c |   80 +++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e849f67..700967b 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -153,7 +153,10 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_HSMMC3
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C5
+	select S3C_DEV_I2C8
 	select S5P_DEV_ONENAND
+	select S5P_DEV_TV
+	select EXYNOS4_DEV_PD
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C5
 	select EXYNOS4_SETUP_SDHCI
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 97d329f..58a099c 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -26,7 +26,9 @@
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/gpio-cfg.h>
 #include <plat/iic.h>
+#include <plat/pd.h>
 #include <plat/sdhci.h>
 
 #include <mach/map.h>
@@ -136,6 +138,9 @@ static struct regulator_init_data lp3974_buck2_data = {
 	.consumer_supplies = &lp3974_buck2_consumer,
 };
 
+static struct regulator_consumer_supply lp3974_buck3_consumer =
+	REGULATOR_SUPPLY("vdet", "s5p-sdo");
+
 static struct regulator_init_data lp3974_buck3_data = {
 	.constraints	= {
 		.name		= "VCC_1.8V",
@@ -147,6 +152,8 @@ static struct regulator_init_data lp3974_buck3_data = {
 			.enabled	= 1,
 		},
 	},
+	.num_consumer_supplies = 1,
+	.consumer_supplies = &lp3974_buck3_consumer,
 };
 
 static struct regulator_init_data lp3974_buck4_data = {
@@ -175,6 +182,12 @@ static struct regulator_init_data lp3974_ldo2_data = {
 	},
 };
 
+static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
+	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"),
+	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"),
+};
+
 static struct regulator_init_data lp3974_ldo3_data = {
 	.constraints	= {
 		.name		= "VUSB+MIPI_1.1V",
@@ -186,6 +199,12 @@ static struct regulator_init_data lp3974_ldo3_data = {
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
@@ -199,6 +218,8 @@ static struct regulator_init_data lp3974_ldo4_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo4_consumer),
+	.consumer_supplies = lp3974_ldo4_consumer,
 };
 
 static struct regulator_init_data lp3974_ldo5_data = {
@@ -240,6 +261,11 @@ static struct regulator_init_data lp3974_ldo7_data = {
 	},
 };
 
+static struct regulator_consumer_supply lp3974_ldo8_consumer[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
+	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
+};
+
 static struct regulator_init_data lp3974_ldo8_data = {
 	.constraints	= {
 		.name		= "VUSB+VDAC_3.3V",
@@ -251,6 +277,8 @@ static struct regulator_init_data lp3974_ldo8_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo8_consumer),
+	.consumer_supplies = lp3974_ldo8_consumer,
 };
 
 static struct regulator_init_data lp3974_ldo9_data = {
@@ -466,6 +494,34 @@ static struct max8998_platform_data universal_lp3974_pdata = {
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
@@ -609,14 +665,20 @@ static struct i2c_board_info i2c1_devs[] __initdata = {
 static struct platform_device *universal_devices[] __initdata = {
 	/* Samsung Platform Devices */
 	&mmc0_fixed_voltage,
+	&hdmi_fixed_voltage,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
 	&s3c_device_i2c5,
+	&s3c_device_i2c8,
 
 	/* Universal Devices */
+	&exynos4_device_pd[PD_TV],
 	&universal_gpio_keys,
 	&s5p_device_onenand,
+	&s5p_device_hdmi,
+	&s5p_device_sdo,
+	&s5p_device_mixer,
 };
 
 static void __init universal_map_io(void)
@@ -626,6 +688,20 @@ static void __init universal_map_io(void)
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
 static void __init universal_machine_init(void)
 {
 	universal_sdhci_init();
@@ -634,8 +710,12 @@ static void __init universal_machine_init(void)
 	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
 
 	s3c_i2c5_set_platdata(NULL);
+	s3c_i2c8_set_platdata(NULL);
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
 
+	/* configuring TV devices */
+	s5p_tv_setup();
+
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
 }
-- 
1.7.5.1
