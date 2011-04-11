From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 4/4] arm: exynos4: universal_c210: add s5p-tv
Date: Mon, 11 Apr 2011 14:18:55 +0200
Message-ID: <1302524335-29083-5-git-send-email-t.stanislaws@samsung.com>
References: <1302524335-29083-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:49001 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754405Ab1DKMTN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 08:19:13 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LJH00LG8M7YB180@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:11 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LJH00HR9M7YCF@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:10 +0100 (BST)
In-reply-to: <1302524335-29083-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com

universal_c210: tv: fix configuration of regulator

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    2 +
 arch/arm/mach-exynos4/mach-universal_c210.c |   81 +++++++++++++++++++++++++++
 2 files changed, 83 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 0f830b8..ad3a6e0 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -162,9 +162,11 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_HSMMC3
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C5
+ 	select S3C_DEV_I2C8
 	select S5P_DEV_ONENAND
 	select EXYNOS4_DEV_PD
 	select EXYNOS4_DEV_SYSMMU
+ 	select EXYNOS4_DEV_TV
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C5
 	select EXYNOS4_SETUP_SDHCI
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 7ff2f5f..25ca9c6 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -26,6 +26,7 @@
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/gpio-cfg.h>
 #include <plat/iic.h>
 #include <plat/pd.h>
 #include <plat/sdhci.h>
@@ -139,6 +140,9 @@ static struct regulator_init_data lp3974_buck2_data = {
 	.consumer_supplies = &lp3974_buck2_consumer,
 };
 
+static struct regulator_consumer_supply lp3974_buck3_consumer =
+	REGULATOR_SUPPLY("vdet", "s5p-sdo");
+
 static struct regulator_init_data lp3974_buck3_data = {
 	.constraints	= {
 		.name		= "VCC_1.8V",
@@ -150,6 +154,8 @@ static struct regulator_init_data lp3974_buck3_data = {
 			.enabled	= 1,
 		},
 	},
+	.num_consumer_supplies = 1,
+	.consumer_supplies = &lp3974_buck3_consumer,
 };
 
 static struct regulator_init_data lp3974_buck4_data = {
@@ -178,6 +184,12 @@ static struct regulator_init_data lp3974_ldo2_data = {
 	},
 };
 
+static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
+	REGULATOR_SUPPLY("vdd", "s5p-hdmi"),
+	REGULATOR_SUPPLY("vdd_pll", "s5p-hdmi"),
+};
+
 static struct regulator_init_data lp3974_ldo3_data = {
 	.constraints	= {
 		.name		= "VUSB+MIPI_1.1V",
@@ -189,6 +201,12 @@ static struct regulator_init_data lp3974_ldo3_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo3_consumer),
+	.consumer_supplies = lp3974_ldo3_consumer,
+};
+
+static struct regulator_consumer_supply lp3974_ldo4_consumer[] = {
+	REGULATOR_SUPPLY("vdd_osc", "s5p-hdmi"),
 };
 
 static struct regulator_init_data lp3974_ldo4_data = {
@@ -202,6 +220,8 @@ static struct regulator_init_data lp3974_ldo4_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo4_consumer),
+	.consumer_supplies = lp3974_ldo4_consumer,
 };
 
 static struct regulator_init_data lp3974_ldo5_data = {
@@ -243,6 +263,11 @@ static struct regulator_init_data lp3974_ldo7_data = {
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
@@ -254,6 +279,8 @@ static struct regulator_init_data lp3974_ldo8_data = {
 			.disabled	= 1,
 		},
 	},
+	.num_consumer_supplies = ARRAY_SIZE(lp3974_ldo8_consumer),
+	.consumer_supplies = lp3974_ldo8_consumer,
 };
 
 static struct regulator_init_data lp3974_ldo9_data = {
@@ -469,6 +496,34 @@ static struct max8998_platform_data universal_lp3974_pdata = {
 	.wakeup			= true,
 };
 
+static struct regulator_consumer_supply hdmi_fixed_consumer =
+	REGULATOR_SUPPLY("hdmi-en", "s5p-hdmi");
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
@@ -612,19 +667,27 @@ static struct i2c_board_info i2c1_devs[] __initdata = {
 static struct platform_device *universal_devices[] __initdata = {
 	/* Samsung Platform Devices */
 	&mmc0_fixed_voltage,
+	&hdmi_fixed_voltage,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
 	&s3c_device_i2c5,
+	&s3c_device_i2c8,
+
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
+	&s5p_device_hdmi,
+	&s5p_device_mixer,
+	&s5p_device_sdo,
 	&exynos4_device_pd[PD_CAM],
+	&exynos4_device_pd[PD_TV],
 	&exynos4_device_sysmmu[S5P_SYSMMU_FIMC0],
 	&exynos4_device_sysmmu[S5P_SYSMMU_FIMC1],
 	&exynos4_device_sysmmu[S5P_SYSMMU_FIMC2],
 	&exynos4_device_sysmmu[S5P_SYSMMU_FIMC3],
+	&exynos4_device_sysmmu[S5P_SYSMMU_TV],
 
 	/* Universal Devices */
 	&universal_gpio_keys,
@@ -638,6 +701,22 @@ static void __init universal_map_io(void)
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
+	exynos4_device_sysmmu[S5P_SYSMMU_TV].dev.parent =
+		&exynos4_device_pd[PD_TV].dev;
+}
+
 static void __init universal_machine_init(void)
 {
 	universal_sdhci_init();
@@ -646,6 +725,7 @@ static void __init universal_machine_init(void)
 	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
 
 	s3c_i2c5_set_platdata(NULL);
+	s3c_i2c8_set_platdata(NULL);
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
 
 	/* Last */
@@ -660,6 +740,7 @@ static void __init universal_machine_init(void)
 	exynos4_device_sysmmu[S5P_SYSMMU_FIMC2].dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	exynos4_device_sysmmu[S5P_SYSMMU_FIMC3].dev.parent = &exynos4_device_pd[PD_CAM].dev;
 
+	s5p_tv_setup();
 }
 
 MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
-- 
1.7.4.3
