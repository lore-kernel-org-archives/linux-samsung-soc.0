From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] ARM: Exynos: Add DRM core device support for Universal
 C210 board
Date: Fri, 09 Mar 2012 12:05:04 +0100
Message-ID: <1331291105-18152-3-git-send-email-m.szyprowski@samsung.com>
References: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57664 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752365Ab2CILHr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 06:07:47 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0M006676WX6V70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:07:45 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0M00KCY6WX63@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:07:45 +0000 (GMT)
In-reply-to: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Add core DRM device and alternative platform device data for FIMD DRM
subdriver. Based on the initial patch by Joonyoung Shim
<jy0922.shim@samsung.com>

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c |   31 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 5a26944..c73eeba 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -257,6 +257,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_ONENAND
 	select S5P_DEV_TV
 	select EXYNOS4_DEV_DMA
+	select EXYNOS_DEV_DRM
 	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C3
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 322b272..30a3ff3 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -23,6 +23,7 @@
 #include <linux/i2c-gpio.h>
 #include <linux/i2c/mcs.h>
 #include <linux/i2c/atmel_mxt_ts.h>
+#include <drm/exynos_drm.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -811,6 +812,27 @@ static struct i2c_board_info i2c1_devs[] __initdata = {
 	/* Gyro, To be updated */
 };
 
+#ifdef CONFIG_DRM_EXYNOS
+static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
+	.timing	= {
+		.left_margin	= 16,
+		.right_margin	= 16,
+		.upper_margin	= 2,
+		.lower_margin	= 28,
+		.hsync_len	= 2,
+		.vsync_len	= 1,
+		.xres		= 480,
+		.yres		= 800,
+		.refresh	= 55,
+	},
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB |
+			  VIDCON0_CLKSEL_LCD,
+	.vidcon1	= VIDCON1_INV_VCLK | VIDCON1_INV_VDEN
+			  | VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.default_win	= 3,
+	.bpp		= 32,
+};
+#else
 /* Frame Buffer */
 static struct s3c_fb_pd_win universal_fb_win0 = {
 	.win_mode = {
@@ -838,6 +860,7 @@ static struct s3c_fb_platdata universal_lcd_pdata __initdata = {
 			  | VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
 	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
 };
+#endif
 
 static struct regulator_consumer_supply cam_vt_dio_supply =
 	REGULATOR_SUPPLY("vdd_core", "0-003c");
@@ -1046,6 +1069,9 @@ static struct platform_device *universal_devices[] __initdata = {
 	&universal_gpio_keys,
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
+#ifdef CONFIG_DRM_EXYNOS
+	&exynos_device_drm,
+#endif
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
@@ -1091,7 +1117,12 @@ static void __init universal_machine_init(void)
 	s5p_i2c_hdmiphy_set_platdata(NULL);
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
 
+#ifdef CONFIG_DRM_EXYNOS
+	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
+	exynos4_fimd0_gpio_setup_24bpp();
+#else
 	s5p_fimd0_set_platdata(&universal_lcd_pdata);
+#endif
 
 	universal_touchkey_init();
 	i2c_register_board_info(I2C_GPIO_BUS_12, i2c_gpio12_devs,
-- 
1.7.1.569.g6f426
