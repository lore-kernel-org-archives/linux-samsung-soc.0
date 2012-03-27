From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: EXYNOS: Add DRM device to SMDKV310
Date: Tue, 27 Mar 2012 10:10:39 +0530
Message-ID: <1332823239-12280-3-git-send-email-sachin.kamat@linaro.org>
References: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34427 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752937Ab2C0Esa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 00:48:30 -0400
Received: by iagz16 with SMTP id z16so9262712iag.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Mar 2012 21:48:30 -0700 (PDT)
In-Reply-To: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

DRM core device and FIMD DRM platform device support is added to SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c |   30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 2bb21af..967c670 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -210,6 +210,7 @@ config MACH_SMDKV310
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
 	select SAMSUNG_DEV_BACKLIGHT
+	select EXYNOS_DEV_DRM
 	select EXYNOS4_DEV_AHCI
 	select SAMSUNG_DEV_KEYPAD
 	select EXYNOS4_DEV_DMA
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index f08529f..9052e22 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -44,6 +44,7 @@
 #include <mach/map.h>
 #include <mach/ohci.h>
 
+#include <drm/exynos_drm.h>
 #include "common.h"
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
@@ -156,6 +157,26 @@ static struct platform_device smdkv310_lcd_lte480wv = {
 	.dev.platform_data	= &smdkv310_lcd_lte480wv_data,
 };
 
+#ifdef CONFIG_DRM_EXYNOS
+static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
+	.panel	= {
+		.timing	= {
+			.left_margin	= 13,
+			.right_margin	= 8,
+			.upper_margin	= 7,
+			.lower_margin	= 5,
+			.hsync_len	= 3,
+			.vsync_len	= 1,
+			.xres		= 800,
+			.yres		= 480,
+		},
+	},
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.default_win	= 0,
+	.bpp		= 32,
+};
+#else
 static struct s3c_fb_pd_win smdkv310_fb_win0 = {
 	.win_mode = {
 		.left_margin	= 13,
@@ -177,6 +198,7 @@ static struct s3c_fb_platdata smdkv310_lcd0_pdata __initdata = {
 	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
 	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
 };
+#endif
 
 static struct resource smdkv310_smsc911x_resources[] = {
 	[0] = {
@@ -269,6 +291,9 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s5p_device_fimc_md,
 	&s5p_device_g2d,
 	&s5p_device_jpeg,
+#ifdef CONFIG_DRM_EXYNOS
+	&exynos_device_drm,
+#endif
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&exynos4_device_ohci,
@@ -360,7 +385,12 @@ static void __init smdkv310_machine_init(void)
 	samsung_keypad_set_platdata(&smdkv310_keypad_data);
 
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
+#ifdef CONFIG_DRM_EXYNOS
+	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
+	exynos4_fimd0_gpio_setup_24bpp();
+#else
 	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
+#endif
 
 	smdkv310_ehci_init();
 	smdkv310_ohci_init();
-- 
1.7.4.1
