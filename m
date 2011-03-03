From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3] ARM: EXYNOS4: add support for i2c PMICs on Universal_C210
	board
Date: Thu, 03 Mar 2011 15:59:31 +0100
Message-ID: <1299164371-23398-1-git-send-email-m.szyprowski@samsung.com>
References: <018901cbd949$c86e8f80$594bae80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44072 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756920Ab1CCO7v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 09:59:51 -0500
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LHH00MBHLNPMI40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 14:59:49 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHH00EB4LNNJM@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 14:59:48 +0000 (GMT)
In-reply-to: <018901cbd949$c86e8f80$594bae80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, linux@arm.linux.org.uk

This patch adds basic definitions for MAX8952 & LP3974 (MAX8998
compatible) PMICs for UniversalC210 board. Power consumers for the
device drivers will be added later. These two PMICs occupy I2C5 bus.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    2 +
 arch/arm/mach-exynos4/mach-universal_c210.c |  413 +++++++++++++++++++++++++++
 2 files changed, 415 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index ad03840..d58cbb5 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -116,8 +116,10 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
 	select S3C_DEV_I2C1
+ 	select S3C_DEV_I2C5
 	select S5P_DEV_ONENAND
 	select EXYNOS4_SETUP_I2C1
+ 	select EXYNOS4_SETUP_I2C5
 	select EXYNOS4_SETUP_SDHCI
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index b22b6ef..6d0315e 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -13,8 +13,10 @@
 #include <linux/i2c.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio.h>
+#include <linux/mfd/max8998.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/fixed.h>
+#include <linux/regulator/max8952.h>
 #include <linux/mmc/host.h>
 
 #include <asm/mach/arch.h>
@@ -24,6 +26,7 @@
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/iic.h>
 #include <plat/sdhci.h>
 
 #include <mach/map.h>
@@ -69,6 +72,412 @@ static struct s3c2410_uartcfg universal_uartcfgs[] __initdata = {
 	},
 };
 
+static struct regulator_consumer_supply max8952_consumer =
+	REGULATOR_SUPPLY("vddarm", NULL);
+
+static struct max8952_platform_data universal_max8952_pdata __initdata = {
+	.gpio_vid0	= EXYNOS4_GPX0(3),
+	.gpio_vid1	= EXYNOS4_GPX0(4),
+	.gpio_en	= -1, /* Not controllable, set "Always High" */
+	.default_mode	= 0, /* vid0 = 0, vid1 = 0 */
+	.dvs_mode	= { 48, 32, 28, 18 }, /* 1.25, 1.20, 1.05, 0.95V */
+	.sync_freq	= 0, /* default: fastest */
+	.ramp_speed	= 0, /* default: fastest */
+
+	.reg_data	= {
+		.constraints	= {
+			.name		= "VARM_1.2V",
+			.min_uV		= 770000,
+			.max_uV		= 1400000,
+			.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE,
+			.always_on	= 1,
+			.boot_on	= 1,
+		},
+		.num_consumer_supplies	= 1,
+		.consumer_supplies	= &max8952_consumer,
+	},
+};
+
+static struct regulator_consumer_supply lp3974_buck1_consumer =
+	REGULATOR_SUPPLY("vddint", NULL);
+
+static struct regulator_consumer_supply lp3974_buck2_consumer =
+	REGULATOR_SUPPLY("vddg3d", NULL);
+
+static struct regulator_init_data lp3974_buck1_data = {
+	.constraints	= {
+		.name		= "VINT_1.1V",
+		.min_uV		= 750000,
+		.max_uV		= 1500000,
+		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
+			REGULATOR_CHANGE_STATUS,
+		.boot_on	= 1,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+	.num_consumer_supplies = 1,
+	.consumer_supplies = &lp3974_buck1_consumer,
+};
+
+static struct regulator_init_data lp3974_buck2_data = {
+	.constraints	= {
+		.name		= "VG3D_1.1V",
+		.min_uV		= 750000,
+		.max_uV		= 1500000,
+		.valid_ops_mask	= REGULATOR_CHANGE_VOLTAGE |
+			REGULATOR_CHANGE_STATUS,
+		.boot_on	= 1,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+	.num_consumer_supplies = 1,
+	.consumer_supplies = &lp3974_buck2_consumer,
+};
+
+static struct regulator_init_data lp3974_buck3_data = {
+	.constraints	= {
+		.name		= "VCC_1.8V",
+		.min_uV		= 1800000,
+		.max_uV		= 1800000,
+		.apply_uV	= 1,
+		.always_on	= 1,
+		.state_mem	= {
+			.enabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_buck4_data = {
+	.constraints	= {
+		.name		= "VMEM_1.2V",
+		.min_uV		= 1200000,
+		.max_uV		= 1200000,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.apply_uV	= 1,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo2_data = {
+	.constraints	= {
+		.name		= "VALIVE_1.2V",
+		.min_uV		= 1200000,
+		.max_uV		= 1200000,
+		.apply_uV	= 1,
+		.always_on	= 1,
+		.state_mem	= {
+			.enabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo3_data = {
+	.constraints	= {
+		.name		= "VUSB+MIPI_1.1V",
+		.min_uV		= 1100000,
+		.max_uV		= 1100000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo4_data = {
+	.constraints	= {
+		.name		= "VADC_3.3V",
+		.min_uV		= 3300000,
+		.max_uV		= 3300000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo5_data = {
+	.constraints	= {
+		.name		= "VTF_2.8V",
+		.min_uV		= 2800000,
+		.max_uV		= 2800000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo6_data = {
+	.constraints	= {
+		.name		= "LDO6",
+		.min_uV		= 2000000,
+		.max_uV		= 2000000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo7_data = {
+	.constraints	= {
+		.name		= "VLCD+VMIPI_1.8V",
+		.min_uV		= 1800000,
+		.max_uV		= 1800000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo8_data = {
+	.constraints	= {
+		.name		= "VUSB+VDAC_3.3V",
+		.min_uV		= 3300000,
+		.max_uV		= 3300000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo9_data = {
+	.constraints	= {
+		.name		= "VCC_2.8V",
+		.min_uV		= 2800000,
+		.max_uV		= 2800000,
+		.apply_uV	= 1,
+		.always_on	= 1,
+		.state_mem	= {
+			.enabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo10_data = {
+	.constraints	= {
+		.name		= "VPLL_1.1V",
+		.min_uV		= 1100000,
+		.max_uV		= 1100000,
+		.boot_on	= 1,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo11_data = {
+	.constraints	= {
+		.name		= "CAM_AF_3.3V",
+		.min_uV		= 3300000,
+		.max_uV		= 3300000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo12_data = {
+	.constraints	= {
+		.name		= "PS_2.8V",
+		.min_uV		= 2800000,
+		.max_uV		= 2800000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo13_data = {
+	.constraints	= {
+		.name		= "VHIC_1.2V",
+		.min_uV		= 1200000,
+		.max_uV		= 1200000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo14_data = {
+	.constraints	= {
+		.name		= "CAM_I_HOST_1.8V",
+		.min_uV		= 1800000,
+		.max_uV		= 1800000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo15_data = {
+	.constraints	= {
+		.name		= "CAM_S_DIG+FM33_CORE_1.2V",
+		.min_uV		= 1200000,
+		.max_uV		= 1200000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo16_data = {
+	.constraints	= {
+		.name		= "CAM_S_ANA_2.8V",
+		.min_uV		= 2800000,
+		.max_uV		= 2800000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_ldo17_data = {
+	.constraints	= {
+		.name		= "VCC_3.0V_LCD",
+		.min_uV		= 3000000,
+		.max_uV		= 3000000,
+		.apply_uV	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.boot_on	= 1,
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_32khz_ap_data = {
+	.constraints	= {
+		.name		= "32KHz AP",
+		.always_on	= 1,
+		.state_mem	= {
+			.enabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_32khz_cp_data = {
+	.constraints	= {
+		.name		= "32KHz CP",
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_vichg_data = {
+	.constraints	= {
+		.name		= "VICHG",
+		.state_mem	= {
+			.disabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_esafeout1_data = {
+	.constraints	= {
+		.name		= "SAFEOUT1",
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.enabled = 1,
+		},
+	},
+};
+
+static struct regulator_init_data lp3974_esafeout2_data = {
+	.constraints	= {
+		.name		= "SAFEOUT2",
+		.boot_on	= 1,
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.state_mem	= {
+			.enabled = 1,
+		},
+	},
+};
+
+static struct max8998_regulator_data lp3974_regulators[] = {
+	{ MAX8998_LDO2,  &lp3974_ldo2_data },
+	{ MAX8998_LDO3,  &lp3974_ldo3_data },
+	{ MAX8998_LDO4,  &lp3974_ldo4_data },
+	{ MAX8998_LDO5,  &lp3974_ldo5_data },
+	{ MAX8998_LDO6,  &lp3974_ldo6_data },
+	{ MAX8998_LDO7,  &lp3974_ldo7_data },
+	{ MAX8998_LDO8,  &lp3974_ldo8_data },
+	{ MAX8998_LDO9,  &lp3974_ldo9_data },
+	{ MAX8998_LDO10, &lp3974_ldo10_data },
+	{ MAX8998_LDO11, &lp3974_ldo11_data },
+	{ MAX8998_LDO12, &lp3974_ldo12_data },
+	{ MAX8998_LDO13, &lp3974_ldo13_data },
+	{ MAX8998_LDO14, &lp3974_ldo14_data },
+	{ MAX8998_LDO15, &lp3974_ldo15_data },
+	{ MAX8998_LDO16, &lp3974_ldo16_data },
+	{ MAX8998_LDO17, &lp3974_ldo17_data },
+	{ MAX8998_BUCK1, &lp3974_buck1_data },
+	{ MAX8998_BUCK2, &lp3974_buck2_data },
+	{ MAX8998_BUCK3, &lp3974_buck3_data },
+	{ MAX8998_BUCK4, &lp3974_buck4_data },
+	{ MAX8998_EN32KHZ_AP, &lp3974_32khz_ap_data },
+	{ MAX8998_EN32KHZ_CP, &lp3974_32khz_cp_data },
+	{ MAX8998_ENVICHG, &lp3974_vichg_data },
+	{ MAX8998_ESAFEOUT1, &lp3974_esafeout1_data },
+	{ MAX8998_ESAFEOUT2, &lp3974_esafeout2_data },
+};
+
+static struct max8998_platform_data universal_lp3974_pdata = {
+	.num_regulators		= ARRAY_SIZE(lp3974_regulators),
+	.regulators		= lp3974_regulators,
+	.buck1_voltage1		= 1100000,	/* INT */
+	.buck1_voltage2		= 1000000,
+	.buck1_voltage3		= 1100000,
+	.buck1_voltage4		= 1000000,
+	.buck1_set1		= EXYNOS4_GPX0(5),
+	.buck1_set2		= EXYNOS4_GPX0(6),
+	.buck2_voltage1		= 1200000,	/* G3D */
+	.buck2_voltage2		= 1100000,
+	.buck1_default_idx	= 0,
+	.buck2_set3		= EXYNOS4_GPE2(0),
+	.buck2_default_idx	= 0,
+	.wakeup			= true,
+};
+
+/* GPIO I2C 5 (PMIC) */
+static struct i2c_board_info i2c5_devs[] __initdata = {
+	{
+		I2C_BOARD_INFO("max8952", 0xC0 >> 1),
+		.platform_data	= &universal_max8952_pdata,
+	}, {
+		I2C_BOARD_INFO("lp3974", 0xCC >> 1),
+		.platform_data	= &universal_lp3974_pdata,
+	},
+};
+
+/* GPIO KEYS */
 static struct gpio_keys_button universal_gpio_keys_tables[] = {
 	{
 		.code			= KEY_VOLUMEUP,
@@ -203,6 +612,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
+	&s3c_device_i2c5,
 
 	/* Universal Devices */
 	&universal_gpio_keys,
@@ -223,6 +633,9 @@ static void __init universal_machine_init(void)
 	i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_devs));
 	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
 
+	s3c_i2c5_set_platdata(NULL);
+	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
+
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
 }
-- 
1.7.1.569.g6f426
