From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 1/2] ARM: Exynos4: enable TV support on Nuri board
Date: Thu, 26 Jan 2012 18:13:30 +0100
Message-ID: <1327598012-30467-2-git-send-email-t.stanislaws@samsung.com>
References: <1327598012-30467-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44419 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753217Ab2AZRNm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 12:13:42 -0500
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LYF000LK16S32@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2012 17:13:40 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYF006AB16SY2@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2012 17:13:40 +0000 (GMT)
In-reply-to: <1327598012-30467-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com

This patch adds platform devices and regulators for TV devices on
Samsung Nuri board.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig     |    2 +
 arch/arm/mach-exynos/mach-nuri.c |   99 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 5d602f6..4cb5225 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -268,12 +268,14 @@ config MACH_NURI
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
+	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_CSIS0
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
 	select S5P_DEV_MFC
+	select S5P_DEV_TV
 	select S5P_DEV_USB_EHCI
 	select S5P_SETUP_MIPIPHY
 	select EXYNOS4_DEV_DMA
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index b895ec0..7d04844 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -8,6 +8,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
 #include <linux/input.h>
@@ -29,6 +30,8 @@
 #include <video/platform_lcd.h>
 #include <media/m5mols.h>
 #include <media/s5p_fimc.h>
+#include <media/s5p_hdmi.h>
+#include <media/sii9234.h>
 #include <media/v4l2-mediabus.h>
 
 #include <asm/mach/arch.h>
@@ -75,6 +78,7 @@ enum fixed_regulator_id {
 	FIXED_REG_ID_MAX8903,
 	FIXED_REG_ID_CAM_A28V,
 	FIXED_REG_ID_CAM_12V,
+	FIXED_REG_ID_HDMI_EN,
 };
 
 static struct s3c2410_uartcfg nuri_uartcfgs[] __initdata = {
@@ -389,9 +393,12 @@ static void __init nuri_tsp_init(void)
 
 static struct regulator_consumer_supply __initdata max8997_ldo1_[] = {
 	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* Used by CPU's ADC drv */
+	REGULATOR_SUPPLY("vdd_osc", "exynos4-hdmi"), /* HDMI */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo3_[] = {
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
+	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"), /* HDMI */
+	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"), /* HDMI */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo4_[] = {
 	REGULATOR_SUPPLY("vdd18", "s5p-mipi-csis.0"), /* MIPI */
@@ -563,6 +570,51 @@ static struct regulator_init_data __initdata max8997_ldo7_data = {
 	.consumer_supplies	= max8997_ldo7_,
 };
 
+static struct regulator_consumer_supply hdmi_fixed_consumer[] = {
+	REGULATOR_SUPPLY("hdmi-en", "exynos4-hdmi"),
+	REGULATOR_SUPPLY("hdmi-en", "15-0039"), /* sii9234 */
+};
+
+static struct regulator_init_data hdmi_fixed_voltage_init_data = {
+	.constraints		= {
+		.name		= "HDMI_5V",
+		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies	= ARRAY_SIZE(hdmi_fixed_consumer),
+	.consumer_supplies	= hdmi_fixed_consumer,
+};
+
+static struct fixed_voltage_config hdmi_fixed_voltage_config = {
+	.supply_name		= "HDMI_EN1",
+	.microvolts		= 5000000,
+	.gpio			= EXYNOS4_GPX2(4),
+	.enable_high		= true,
+	.init_data		= &hdmi_fixed_voltage_init_data,
+};
+
+static struct platform_device hdmi_fixed_voltage = {
+	.name			= "reg-fixed-voltage",
+	.id			= FIXED_REG_ID_HDMI_EN,
+	.dev			= {
+		.platform_data	= &hdmi_fixed_voltage_config,
+	},
+};
+
+/* I2C-GPIO15: MHL */
+static struct i2c_gpio_platform_data i2c15_gpio_data = {
+	.sda_pin		= EXYNOS4_GPY3(0),	/* XM0ADDR_0 */
+	.scl_pin		= EXYNOS4_GPY3(2),	/* XM0ADDR_2 */
+	.udelay			= 2,
+};
+
+static struct platform_device i2c15_gpio = {
+	.name			= "i2c-gpio",
+	.id			= 15,
+	.dev			= {
+		.platform_data	= &i2c15_gpio_data,
+	},
+};
+
 static struct regulator_init_data __initdata max8997_ldo8_data = {
 	.constraints	= {
 		.name		= "VUSB/VDAC_3.3V_C210",
@@ -1267,6 +1319,11 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&exynos4_device_pd[PD_LCD0],
 	&exynos4_device_pd[PD_CAM],
 	&s5p_device_fimc_md,
+	&exynos4_device_pd[PD_TV],
+	&hdmi_fixed_voltage,
+	&s5p_device_i2c_hdmiphy,
+	&s5p_device_hdmi,
+	&s5p_device_mixer,
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
@@ -1276,6 +1333,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&nuri_max8903_device,
 	&cam_vdda_fixed_rdev,
 	&cam_8m_12v_fixed_rdev,
+	&i2c15_gpio,
 };
 
 static void __init nuri_map_io(void)
@@ -1290,6 +1348,46 @@ static void __init nuri_reserve(void)
 	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
 }
 
+static struct i2c_board_info s5p_hdmiphy_info = {
+	I2C_BOARD_INFO("hdmiphy", 0x70 >> 1),
+};
+
+static struct sii9234_platform_data s5p_sii9234_pdata = {
+	.gpio_n_reset = EXYNOS4_GPF3(4),
+};
+
+static struct i2c_board_info s5p_sii9234_info = {
+	I2C_BOARD_INFO("SII9234", 0x72 >> 1),
+	.platform_data = &s5p_sii9234_pdata,
+};
+
+static struct s5p_hdmi_platform_data s5p_hdmi_pdata = {
+	.hdmiphy_info = &s5p_hdmiphy_info,
+	.hdmiphy_bus = 8,
+	.mhl_info = &s5p_sii9234_info,
+	.mhl_bus = 15,
+};
+
+static void s5p_tv_init(void)
+{
+	/* setting up HDMIPHY device */
+	s5p_i2c_hdmiphy_set_platdata(NULL);
+
+	/* direct HPD to HDMI chip */
+	gpio_request(EXYNOS4_GPX3(7), "hpd-plug");
+
+	gpio_direction_input(EXYNOS4_GPX3(7));
+	s3c_gpio_cfgpin(EXYNOS4_GPX3(7), S3C_GPIO_SFN(0x3));
+	s3c_gpio_setpull(EXYNOS4_GPX3(7), S3C_GPIO_PULL_NONE);
+
+	/* setting platform data */
+	s5p_device_hdmi.dev.platform_data = &s5p_hdmi_pdata;
+
+	/* setup dependencies between TV devices */
+	s5p_device_hdmi.dev.parent = &exynos4_device_pd[PD_TV].dev;
+	s5p_device_mixer.dev.parent = &exynos4_device_pd[PD_TV].dev;
+}
+
 static void __init nuri_machine_init(void)
 {
 	nuri_sdhci_init();
@@ -1318,6 +1416,7 @@ static void __init nuri_machine_init(void)
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 
+	s5p_tv_init();
 	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
-- 
1.7.5.4
