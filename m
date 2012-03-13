From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 3/3] ARM: EXYNOS: Add s3c-hsotg device support for Universal
 C210 board
Date: Tue, 13 Mar 2012 09:14:07 +0100
Message-ID: <1331626447-22868-4-git-send-email-l.majewski@samsung.com>
References: <1331626447-22868-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31481 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758690Ab2CMIOR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 04:14:17 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M0T00AG4DJN32@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 08:14:11 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0T00ANPDJQZJ@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 08:14:14 +0000 (GMT)
In-reply-to: <1331626447-22868-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds platform data for using S3C-HSOTG driver at
Universal_C210 target.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    2 ++
 arch/arm/mach-exynos/mach-universal_c210.c |   14 ++++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 1292ad3..118f35d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -256,6 +256,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_MFC
 	select S5P_DEV_ONENAND
 	select S5P_DEV_TV
+	select S3C_DEV_USB_HSOTG
 	select EXYNOS4_DEV_DMA
 	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_I2C1
@@ -264,6 +265,7 @@ config MACH_UNIVERSAL_C210
 	select EXYNOS4_SETUP_SDHCI
 	select EXYNOS4_SETUP_FIMC
 	select S5P_SETUP_MIPIPHY
+	select EXYNOS4_SETUP_USB_PHY
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
 	  Board.
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 57e4418..f15dcc7 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -29,6 +29,7 @@
 #include <asm/mach-types.h>
 
 #include <plat/regs-serial.h>
+#include <plat/clock.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/iic.h>
@@ -41,6 +42,7 @@
 #include <plat/fimc-core.h>
 #include <plat/camport.h>
 #include <plat/mipi_csis.h>
+#include <plat/udc-hs.h>
 
 #include <mach/map.h>
 
@@ -203,6 +205,7 @@ static struct regulator_init_data lp3974_ldo2_data = {
 };
 
 static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
 	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"),
 	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"),
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"),
@@ -288,6 +291,7 @@ static struct regulator_init_data lp3974_ldo7_data = {
 };
 
 static struct regulator_consumer_supply lp3974_ldo8_consumer[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
 	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
 };
 
@@ -484,7 +488,10 @@ static struct regulator_init_data lp3974_vichg_data = {
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
@@ -992,6 +999,9 @@ static struct gpio universal_camera_gpios[] = {
 	{ GPIO_CAM_VGA_NSTBY,	GPIOF_OUT_INIT_LOW,  "CAM_VGA_NSTBY" },
 };
 
+/* USB OTG */
+static struct s3c_hsotg_plat universal_hsotg_pdata;
+
 static void __init universal_camera_init(void)
 {
 	s3c_set_platdata(&mipi_csis_platdata, sizeof(mipi_csis_platdata),
@@ -1047,6 +1057,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
 	&s5p_device_jpeg,
+	&s3c_device_usb_hsotg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
@@ -1098,10 +1109,13 @@ static void __init universal_machine_init(void)
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
