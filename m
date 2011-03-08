From: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Subject: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Tue, 08 Mar 2011 16:10:52 +0530
Message-ID: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26467 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753670Ab1CHKwE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 05:52:04 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHQ00CLRJIPKBD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Mar 2011 19:52:01 +0900 (KST)
Received: from Linaro.sisodomain.com ([107.108.215.143])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHQ00GDZJIJRG@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Mar 2011 19:52:02 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Giridhar Maruthy <giridhar.maruthy@linaro.org>

This commit adds the platform device and data of
wm8994 regulator to enable the I2S playback on
S5PV310 board on linux-linaro-2.6.38.

Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
---
 arch/arm/mach-exynos4/mach-smdkv310.c |  167 ++++++++++++++++++++++++++++++++-
 1 files changed, 166 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 07860a5..a4fa3d9 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -15,6 +15,11 @@
 #include <linux/smsc911x.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/max8649.h>
+#include <linux/regulator/fixed.h>
+#include <linux/mfd/wm8994/pdata.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -142,9 +147,162 @@ static struct platform_device smdkv310_smsc911x = {
 	},
 };
 
+
+#if defined(CONFIG_SND_SOC_WM8994) || defined(CONFIG_SND_SOC_WM8994_MODULE)
+
+#ifdef CONFIG_REGULATOR_WM8994
+static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[] = {
+	{
+		.dev_name	= "1-001a",
+		.supply		= "AVDD2",
+	}, {
+		.dev_name	= "1-001a",
+		.supply		= "CPVDD",
+	},
+};
+
+static struct regulator_consumer_supply wm8994_fixed_voltage1_supplies[] = {
+	{
+		.dev_name	= "1-001a",
+		.supply		= "SPKVDD1",
+	}, {
+		.dev_name	= "1-001a",
+		.supply		= "SPKVDD2",
+	},
+};
+
+static struct regulator_consumer_supply wm8994_fixed_voltage2_supplies[] = {
+	{
+		.dev_name	= "1-001a",
+		.supply		= "DBVDD",
+	},
+};
+
+static struct regulator_init_data wm8994_fixed_voltage0_init_data = {
+	.constraints = {
+		.always_on = 1,
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(wm8994_fixed_voltage0_supplies),
+	.consumer_supplies	= wm8994_fixed_voltage0_supplies,
+};
+
+static struct regulator_init_data wm8994_fixed_voltage1_init_data = {
+	.constraints = {
+		.always_on = 1,
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(wm8994_fixed_voltage1_supplies),
+	.consumer_supplies	= wm8994_fixed_voltage1_supplies,
+};
+
+static struct regulator_init_data wm8994_fixed_voltage2_init_data = {
+	.constraints = {
+		.always_on = 1,
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(wm8994_fixed_voltage2_supplies),
+	.consumer_supplies	= wm8994_fixed_voltage2_supplies,
+};
+
+static struct fixed_voltage_config wm8994_fixed_voltage0_config = {
+	.supply_name	= "VDD_1.8V",
+	.microvolts	= 1800000,
+	.gpio		= -EINVAL,
+	.init_data	= &wm8994_fixed_voltage0_init_data,
+};
+
+static struct fixed_voltage_config wm8994_fixed_voltage1_config = {
+	.supply_name	= "DC_5V",
+	.microvolts	= 5000000,
+	.gpio		= -EINVAL,
+	.init_data	= &wm8994_fixed_voltage1_init_data,
+};
+
+static struct fixed_voltage_config wm8994_fixed_voltage2_config = {
+	.supply_name	= "VDD_3.3V",
+	.microvolts	= 3300000,
+	.gpio		= -EINVAL,
+	.init_data	= &wm8994_fixed_voltage2_init_data,
+};
+
+static struct platform_device wm8994_fixed_voltage0 = {
+	.name		= "reg-fixed-voltage",
+	.id		= 0,
+	.dev		= {
+		.platform_data	= &wm8994_fixed_voltage0_config,
+	},
+};
+
+static struct platform_device wm8994_fixed_voltage1 = {
+	.name		= "reg-fixed-voltage",
+	.id		= 1,
+	.dev		= {
+		.platform_data	= &wm8994_fixed_voltage1_config,
+	},
+};
+
+static struct platform_device wm8994_fixed_voltage2 = {
+	.name		= "reg-fixed-voltage",
+	.id		= 2,
+	.dev		= {
+		.platform_data	= &wm8994_fixed_voltage2_config,
+	},
+};
+
+static struct regulator_consumer_supply wm8994_avdd1_supply = {
+	.dev_name	= "1-001a",
+	.supply		= "AVDD1",
+};
+
+static struct regulator_consumer_supply wm8994_dcvdd_supply = {
+	.dev_name	= "1-001a",
+	.supply		= "DCVDD",
+};
+
+static struct regulator_init_data wm8994_ldo1_data = {
+	.constraints	= {
+		.name		= "AVDD1",
+	},
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &wm8994_avdd1_supply,
+};
+
+static struct regulator_init_data wm8994_ldo2_data = {
+	.constraints	= {
+		.name		= "DCVDD",
+	},
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &wm8994_dcvdd_supply,
+};
+#endif
+
+static struct wm8994_pdata wm8994_platform_data = {
+	/* configure gpio1 function: 0x0001(Logic level input/output) */
+	.gpio_defaults[0] = 0x0001,
+	/* configure gpio3/4/5/7 function for AIF2 voice */
+	.gpio_defaults[2] = 0x8100,/*BCLK2 in*/
+	.gpio_defaults[3] = 0x8100,/*LRCLK2 in*/
+	.gpio_defaults[4] = 0x8100,/*DACDAT2 in*/
+	/* configure gpio6 function: 0x0001(Logic level input/output) */
+	.gpio_defaults[5] = 0x0001,
+	.gpio_defaults[6] = 0x0100,/*ADCDAT2 out*/
+#ifdef CONFIG_REGULATOR_WM8994
+	.ldo[0]	= { 0, NULL, &wm8994_ldo1_data },
+	.ldo[1] = { 0, NULL, &wm8994_ldo2_data },
+#endif
+};
+#endif
+
+#ifdef CONFIG_I2C_S3C2410
+#ifdef CONFIG_S3C_DEV_I2C1
 static struct i2c_board_info i2c_devs1[] __initdata = {
-	{I2C_BOARD_INFO("wm8994", 0x1a),},
+#if defined(CONFIG_SND_SOC_WM8994) || defined(CONFIG_SND_SOC_WM8994_MODULE)
+	{
+		I2C_BOARD_INFO("wm8994", 0x1a),
+		.platform_data	= &wm8994_platform_data,
+	},
+#endif
 };
+#endif
+#endif
 
 static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_hsmmc0,
@@ -158,6 +316,13 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&exynos4_device_i2s0,
 	&exynos4_device_pd[PD_MFC],
 	&exynos4_device_pd[PD_G3D],
+#if (defined(CONFIG_SND_SOC_WM8994) || \
+		defined(CONFIG_SND_SOC_WM8994_MODULE)) && \
+		defined(CONFIG_REGULATOR_WM8994)
+	&wm8994_fixed_voltage0,
+	&wm8994_fixed_voltage1,
+	&wm8994_fixed_voltage2,
+#endif
 	&exynos4_device_pd[PD_LCD0],
 	&exynos4_device_pd[PD_LCD1],
 	&exynos4_device_pd[PD_CAM],
-- 
1.7.1
