From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH RESEND 4/4] ARM: EXYNOS: Add s3c-hsotg device support for
 Universal C210 board
Date: Thu, 10 May 2012 15:16:58 +0200
Message-ID: <1336655818-15136-5-git-send-email-l.majewski@samsung.com>
References: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31109 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755627Ab2EJNRO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 09:17:14 -0400
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M3T00C3B67JMX70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 14:16:31 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3T007YX68L4N@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 14:17:09 +0100 (BST)
In-reply-to: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds platform data for using S3C-HSOTG driver at
Universal_C210 target.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    2 ++
 arch/arm/mach-exynos/mach-universal_c210.c |   10 ++++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 5e64728..56d0e7e 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -246,6 +246,7 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
+	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_MFC
 	select S5P_DEV_ONENAND
@@ -259,6 +260,7 @@ config MACH_UNIVERSAL_C210
 	select EXYNOS4_SETUP_SDHCI
 	select EXYNOS4_SETUP_FIMC
 	select S5P_SETUP_MIPIPHY
+	select EXYNOS4_SETUP_USB_PHY
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
 	  Board.
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index add55b4..9781669 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -204,6 +204,7 @@ static struct regulator_init_data lp3974_ldo2_data = {
 };
 
 static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
 	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"),
 	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"),
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"),
@@ -289,6 +290,7 @@ static struct regulator_init_data lp3974_ldo7_data = {
 };
 
 static struct regulator_consumer_supply lp3974_ldo8_consumer[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
 	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
 };
 
@@ -485,7 +487,10 @@ static struct regulator_init_data lp3974_vichg_data = {
 static struct regulator_init_data lp3974_esafeout1_data = {
 	.constraints	= {
 		.name		= "SAFEOUT1",
+		.min_uV		= 4800000,
+		.max_uV		= 4800000,
 		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.always_on	= 1,
 		.state_mem	= {
 			.enabled	= 1,
 		},
@@ -991,6 +996,9 @@ static struct gpio universal_camera_gpios[] = {
 	{ GPIO_CAM_VGA_NSTBY,	GPIOF_OUT_INIT_LOW,  "CAM_VGA_NSTBY" },
 };
 
+/* USB OTG */
+static struct s3c_hsotg_plat universal_hsotg_pdata;
+
 static void __init universal_camera_init(void)
 {
 	s3c_set_platdata(&mipi_csis_platdata, sizeof(mipi_csis_platdata),
@@ -1046,6 +1054,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
 	&s5p_device_jpeg,
+	&s3c_device_usb_hsotg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
@@ -1098,6 +1107,7 @@ static void __init universal_machine_init(void)
 	i2c_register_board_info(I2C_GPIO_BUS_12, i2c_gpio12_devs,
 			ARRAY_SIZE(i2c_gpio12_devs));
 
+	s3c_hsotg_set_platdata(&universal_hsotg_pdata);
 	universal_camera_init();
 
 	/* Last */
-- 
1.7.2.3
