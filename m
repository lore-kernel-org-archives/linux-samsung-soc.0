From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: Exynos4: enable frame buffer on Nuri board
Date: Tue, 26 Jul 2011 09:46:51 +0200
Message-ID: <1311666411-24234-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37275 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246Ab1GZHqz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 03:46:55 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOX0073PKA7MC@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 08:46:55 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOX0002NKA52Y@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 08:46:54 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds platform definitions to enable s3c-fb driver.
Framebuffer window with 1280x800x16bpp mode has been defined.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig     |    2 ++
 arch/arm/mach-exynos4/mach-nuri.c |   34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 5b01605..c7219c1 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -201,6 +201,7 @@ config MACH_NURI
 	bool "Mobile NURI Board"
 	select CPU_EXYNOS4210
 	select S3C_DEV_WDT
+	select S5P_DEV_FIMD0
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
@@ -210,6 +211,7 @@ config MACH_NURI
 	select S5P_DEV_MFC
 	select S5P_DEV_USB_EHCI
 	select EXYNOS4_DEV_PD
+	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C3
 	select EXYNOS4_SETUP_I2C5
diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos4/mach-nuri.c
index 43be71b..bbd13f4 100644
--- a/arch/arm/mach-exynos4/mach-nuri.c
+++ b/arch/arm/mach-exynos4/mach-nuri.c
@@ -32,10 +32,12 @@
 #include <asm/mach-types.h>
 
 #include <plat/adc.h>
+#include <plat/regs-fb-v4.h>
 #include <plat/regs-serial.h>
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/fb.h>
 #include <plat/sdhci.h>
 #include <plat/ehci.h>
 #include <plat/clock.h>
@@ -199,6 +201,33 @@ static struct platform_device nuri_gpio_keys = {
 	},
 };
 
+/* Frame Buffer */
+static struct s3c_fb_pd_win nuri_fb_win0 = {
+	.win_mode = {
+		.left_margin	= 64,
+		.right_margin	= 16,
+		.upper_margin	= 64,
+		.lower_margin	= 1,
+		.hsync_len	= 48,
+		.vsync_len	= 3,
+		.xres		= 1280,
+		.yres		= 800,
+		.refresh	= 60,
+	},
+	.max_bpp	= 24,
+	.default_bpp	= 16,
+	.virtual_x	= 1280,
+	.virtual_y	= 800,
+};
+
+static struct s3c_fb_platdata nuri_fb_pdata __initdata = {
+	.win[0]		= &nuri_fb_win0,
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB |
+			  VIDCON0_CLKSEL_LCD,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
+};
+
 static void nuri_lcd_power_on(struct plat_lcd_data *pd, unsigned int power)
 {
 	int gpio = EXYNOS4_GPE1(5);
@@ -1092,6 +1121,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	/* Samsung Platform Devices */
 	&s3c_device_i2c5, /* PMIC should initialize first */
 	&emmc_fixed_voltage,
+	&s5p_device_fimd0,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
@@ -1106,6 +1136,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
 	&exynos4_device_pd[PD_MFC],
+	&exynos4_device_pd[PD_LCD0],
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
@@ -1142,12 +1173,15 @@ static void __init nuri_machine_init(void)
 	i2c9_devs[I2C9_MAX17042].irq = gpio_to_irq(EXYNOS4_GPX2(3));
 	i2c_register_board_info(9, i2c9_devs, ARRAY_SIZE(i2c9_devs));
 
+	s5p_fimd0_set_platdata(&nuri_fb_pdata);
+
 	nuri_ehci_init();
 	clk_xusbxti.rate = 24000000;
 
 	/* Last */
 	platform_add_devices(nuri_devices, ARRAY_SIZE(nuri_devices));
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
+	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 }
 
 MACHINE_START(NURI, "NURI")
-- 
1.7.1.569.g6f426
