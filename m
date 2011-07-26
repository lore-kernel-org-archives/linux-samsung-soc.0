From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Exynos4: enable frame buffer on Universal C210 board
Date: Tue, 26 Jul 2011 09:46:42 +0200
Message-ID: <1311666402-24199-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24731 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246Ab1GZHqs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 03:46:48 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOX00MLZK9YJ4@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 08:46:46 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOX003J6K9XMG@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 08:46:45 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds platform definitions to enable s3c-fb driver.
Framebuffer window with 480x800x16bpp mode has been defined.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    2 +
 arch/arm/mach-exynos4/mach-universal_c210.c |   34 +++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 9d62e13..5b01605 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -178,6 +178,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
+	select S5P_DEV_FIMD0
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
@@ -187,6 +188,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_MFC
 	select S5P_DEV_ONENAND
 	select EXYNOS4_DEV_PD
+	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C3
 	select EXYNOS4_SETUP_I2C5
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 0e280d1..307ef98 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio.h>
+#include <linux/fb.h>
 #include <linux/mfd/max8998.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/fixed.h>
@@ -31,9 +32,11 @@
 #include <plat/devs.h>
 #include <plat/iic.h>
 #include <plat/gpio-cfg.h>
+#include <plat/fb.h>
 #include <plat/mfc.h>
 #include <plat/sdhci.h>
 #include <plat/pd.h>
+#include <plat/regs-fb-v4.h>
 
 #include <mach/map.h>
 
@@ -702,6 +705,32 @@ static struct i2c_board_info i2c1_devs[] __initdata = {
 	/* Gyro, To be updated */
 };
 
+/* Frame Buffer */
+static struct s3c_fb_pd_win universal_fb_win0 = {
+	.win_mode = {
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
+	.max_bpp	= 32,
+	.default_bpp	= 16,
+};
+
+static struct s3c_fb_platdata universal_lcd_pdata __initdata = {
+	.win[0]		= &universal_fb_win0,
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB |
+			  VIDCON0_CLKSEL_LCD,
+	.vidcon1	= VIDCON1_INV_VCLK | VIDCON1_INV_VDEN
+			  | VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
+};
+
 static struct platform_device *universal_devices[] __initdata = {
 	/* Samsung Platform Devices */
 	&s5p_device_fimc0,
@@ -719,10 +748,12 @@ static struct platform_device *universal_devices[] __initdata = {
 	&i2c_gpio12,
 	&universal_gpio_keys,
 	&s5p_device_onenand,
+	&s5p_device_fimd0,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
 	&exynos4_device_pd[PD_MFC],
+	&exynos4_device_pd[PD_LCD0],
 };
 
 static void __init universal_map_io(void)
@@ -751,6 +782,8 @@ static void __init universal_machine_init(void)
 	s3c_i2c5_set_platdata(NULL);
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
 
+	s5p_fimd0_set_platdata(&universal_lcd_pdata);
+
 	universal_touchkey_init();
 	i2c_register_board_info(I2C_GPIO_BUS_12, i2c_gpio12_devs,
 			ARRAY_SIZE(i2c_gpio12_devs));
@@ -758,6 +791,7 @@ static void __init universal_machine_init(void)
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
+	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 }
 
 MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
-- 
1.7.1.569.g6f426
