From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 4/4] ARM: EXYNOS: Add s3c-hsotg device support for Universal
 C210 board
Date: Fri, 04 May 2012 17:57:57 +0200
Message-ID: <1336147077-16137-5-git-send-email-l.majewski@samsung.com>
References: <1336147077-16137-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:50298 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751227Ab2EDP6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 May 2012 11:58:05 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M3I00AKX9NPRU90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 May 2012 16:57:25 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3I008ZW9OPWQ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 May 2012 16:58:01 +0100 (BST)
In-reply-to: <1336147077-16137-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds platform data for using S3C-HSOTG driver at
Universal_C210 target.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    2 ++
 arch/arm/mach-exynos/mach-universal_c210.c |   12 ++++++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 5e64728..73207e3 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -250,6 +250,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_MFC
 	select S5P_DEV_ONENAND
 	select S5P_DEV_TV
+	select S3C_DEV_USB_HSOTG
 	select EXYNOS_DEV_SYSMMU
 	select EXYNOS4_DEV_DMA
 	select EXYNOS4_SETUP_FIMD0
@@ -259,6 +260,7 @@ config MACH_UNIVERSAL_C210
 	select EXYNOS4_SETUP_SDHCI
 	select EXYNOS4_SETUP_FIMC
 	select S5P_SETUP_MIPIPHY
+	select EXYNOS4_SETUP_USB_PHY
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
 	  Board.
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 3fd830a..15f18fb 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -205,6 +205,7 @@ static struct regulator_init_data lp3974_ldo2_data = {
 };
 
 static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
 	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"),
 	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"),
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"),
@@ -290,6 +291,7 @@ static struct regulator_init_data lp3974_ldo7_data = {
 };
 
 static struct regulator_consumer_supply lp3974_ldo8_consumer[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
 	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
 };
 
@@ -486,7 +488,10 @@ static struct regulator_init_data lp3974_vichg_data = {
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
@@ -992,6 +997,9 @@ static struct gpio universal_camera_gpios[] = {
 	{ GPIO_CAM_VGA_NSTBY,	GPIOF_OUT_INIT_LOW,  "CAM_VGA_NSTBY" },
 };
 
+/* USB OTG */
+static struct s3c_hsotg_plat universal_hsotg_pdata;
+
 static void __init universal_camera_init(void)
 {
 	s3c_set_platdata(&mipi_csis_platdata, sizeof(mipi_csis_platdata),
@@ -1047,6 +1055,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
 	&s5p_device_jpeg,
+	&s3c_device_usb_hsotg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
@@ -1099,10 +1108,13 @@ static void __init universal_machine_init(void)
 	i2c_register_board_info(I2C_GPIO_BUS_12, i2c_gpio12_devs,
 			ARRAY_SIZE(i2c_gpio12_devs));
 
+	s3c_hsotg_set_platdata(&universal_hsotg_pdata);
 	universal_camera_init();
 
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
+
+	clk_xusbxti.rate = 24000000;
 }
 
 MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
-- 
1.7.2.3
