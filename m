From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: EXYNOS: Add DRM device to Origen
Date: Tue, 27 Mar 2012 10:10:38 +0530
Message-ID: <1332823239-12280-2-git-send-email-sachin.kamat@linaro.org>
References: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58890 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752937Ab2C0Es0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 00:48:26 -0400
Received: by mail-pb0-f46.google.com with SMTP id un15so6884481pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Mar 2012 21:48:26 -0700 (PDT)
In-Reply-To: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

DRM core device and FIMD DRM platform device support is added to Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig       |    1 +
 arch/arm/mach-exynos/mach-origen.c |   31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 9124ce9..2bb21af 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -332,6 +332,7 @@ config MACH_ORIGEN
 	select S5P_DEV_USB_EHCI
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_PWM
+	select EXYNOS_DEV_DRM
 	select EXYNOS4_DEV_DMA
 	select EXYNOS4_DEV_USB_OHCI
 	select EXYNOS4_SETUP_FIMD0
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 827cb99..dbc2145 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -45,6 +45,7 @@
 #include <mach/ohci.h>
 #include <mach/map.h>
 
+#include <drm/exynos_drm.h>
 #include "common.h"
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
@@ -581,6 +582,27 @@ static struct platform_device origen_lcd_hv070wsa = {
 	.dev.platform_data	= &origen_lcd_hv070wsa_data,
 };
 
+#ifdef CONFIG_DRM_EXYNOS
+static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
+	.panel	= {
+		.timing	= {
+			.left_margin	= 64,
+			.right_margin	= 16,
+			.upper_margin	= 64,
+			.lower_margin	= 16,
+			.hsync_len	= 48,
+			.vsync_len	= 3,
+			.xres		= 1024,
+			.yres		= 600,
+		},
+	},
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC |
+				VIDCON1_INV_VCLK,
+	.default_win	= 0,
+	.bpp		= 32,
+};
+#else
 static struct s3c_fb_pd_win origen_fb_win0 = {
 	.win_mode = {
 		.left_margin	= 64,
@@ -603,6 +625,7 @@ static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
 				VIDCON1_INV_VCLK,
 	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
 };
+#endif
 
 /* Bluetooth rfkill gpio platform data */
 struct rfkill_gpio_platform_data origen_bt_pdata = {
@@ -642,6 +665,9 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
 	&s5p_device_mixer,
+#ifdef CONFIG_DRM_EXYNOS
+	&exynos_device_drm,
+#endif
 	&exynos4_device_ohci,
 	&origen_device_gpiokeys,
 	&origen_lcd_hv070wsa,
@@ -717,7 +743,12 @@ static void __init origen_machine_init(void)
 	s5p_tv_setup();
 	s5p_i2c_hdmiphy_set_platdata(NULL);
 
+#ifdef CONFIG_DRM_EXYNOS
+	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
+	exynos4_fimd0_gpio_setup_24bpp();
+#else
 	s5p_fimd0_set_platdata(&origen_lcd_pdata);
+#endif
 
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 
-- 
1.7.4.1
