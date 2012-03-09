From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/3] ARM: Exynos: Add DRM core support for NURI board
Date: Fri, 09 Mar 2012 12:05:05 +0100
Message-ID: <1331291105-18152-4-git-send-email-m.szyprowski@samsung.com>
References: <1331291105-18152-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:57664 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752683Ab2CILHs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 06:07:48 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0M0069B6WZHN70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:07:47 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0M00G2O6WYLW@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Mar 2012 11:07:47 +0000 (GMT)
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
 arch/arm/mach-exynos/Kconfig     |    1 +
 arch/arm/mach-exynos/mach-nuri.c |   31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index c73eeba..e996b5d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -293,6 +293,7 @@ config MACH_NURI
 	select S5P_DEV_USB_EHCI
 	select S5P_SETUP_MIPIPHY
 	select EXYNOS4_DEV_DMA
+	select EXYNOS_DEV_DRM
 	select EXYNOS4_SETUP_FIMC
 	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_I2C1
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index a6b9162..682203a 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -25,6 +25,7 @@
 #include <linux/mmc/host.h>
 #include <linux/fb.h>
 #include <linux/pwm_backlight.h>
+#include <drm/exynos_drm.h>
 
 #include <video/platform_lcd.h>
 #include <media/m5mols.h>
@@ -210,6 +211,27 @@ static struct platform_device nuri_gpio_keys = {
 	},
 };
 
+#ifdef CONFIG_DRM_EXYNOS
+static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
+	.timing	= {
+		.xres		= 1024,
+		.yres		= 600,
+		.hsync_len	= 40,
+		.left_margin	= 79,
+		.right_margin	= 200,
+		.vsync_len	= 10,
+		.upper_margin	= 10,
+		.lower_margin	= 11,
+		.refresh	= 60,
+	},
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB |
+			  VIDCON0_CLKSEL_LCD,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.default_win	= 3,
+	.bpp		= 32,
+};
+
+#else
 /* Frame Buffer */
 static struct s3c_fb_pd_win nuri_fb_win0 = {
 	.win_mode = {
@@ -236,6 +258,7 @@ static struct s3c_fb_platdata nuri_fb_pdata __initdata = {
 	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
 	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
 };
+#endif
 
 static void nuri_lcd_power_on(struct plat_lcd_data *pd, unsigned int power)
 {
@@ -1335,6 +1358,9 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&cam_vt_cam15_fixed_rdev,
 	&cam_vdda_fixed_rdev,
 	&cam_8m_12v_fixed_rdev,
+#ifdef CONFIG_DRM_EXYNOS
+	&exynos_device_drm,
+#endif
 };
 
 static void __init nuri_map_io(void)
@@ -1366,7 +1392,12 @@ static void __init nuri_machine_init(void)
 	i2c_register_board_info(9, i2c9_devs, ARRAY_SIZE(i2c9_devs));
 	s3c_i2c6_set_platdata(&nuri_i2c6_platdata);
 
+#ifdef CONFIG_DRM_EXYNOS
+	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
+	exynos4_fimd0_gpio_setup_24bpp();
+#else
 	s5p_fimd0_set_platdata(&nuri_fb_pdata);
+#endif
 
 	nuri_camera_init();
 
-- 
1.7.1.569.g6f426
