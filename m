From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV210: Add frame buffer display support for SMDKV210
Date: Mon, 15 Nov 2010 21:08:40 +0900
Message-ID: <1289822920-22110-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46477 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788Ab0KOMT1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Nov 2010 07:19:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Enable frame buffer display support for SMDKV210 board.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Reviewed-by: Jonghun Han <jonghun.han@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig         |    2 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |   74 +++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 862f239..53aabef 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -118,6 +118,7 @@ menu "S5PV210 Machines"
 config MACH_SMDKV210
 	bool "SMDKV210"
 	select CPU_S5PV210
+	select S3C_DEV_FB
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
@@ -130,6 +131,7 @@ config MACH_SMDKV210
 	select SAMSUNG_DEV_IDE
 	select SAMSUNG_DEV_KEYPAD
 	select SAMSUNG_DEV_TS
+	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
 	select S5PV210_SETUP_IDE
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index bcd7a5d..0026194 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -13,14 +13,20 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/fb.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 #include <asm/setup.h>
 #include <asm/mach-types.h>
 
+#include <video/platform_lcd.h>
+
 #include <mach/map.h>
 #include <mach/regs-clock.h>
+#include <mach/regs-fb.h>
 
 #include <plat/regs-serial.h>
 #include <plat/s5pv210.h>
@@ -32,6 +38,7 @@
 #include <plat/iic.h>
 #include <plat/keypad.h>
 #include <plat/pm.h>
+#include <plat/fb.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -101,12 +108,76 @@ static struct samsung_keypad_platdata smdkv210_keypad_data __initdata = {
 	.cols		= 8,
 };
 
+static void smdkv210_lte480wv_set_power(struct plat_lcd_data *pd,
+					unsigned int power)
+{
+	if (power) {
+#if !defined(CONFIG_BACKLIGHT_PWM)
+		gpio_request(S5PV210_GPD0(3), "GPD0");
+		gpio_direction_output(S5PV210_GPD0(3), 1);
+		gpio_free(S5PV210_GPD0(3));
+#endif
+
+		/* fire nRESET on power up */
+		gpio_request(S5PV210_GPH0(6), "GPH0");
+
+		gpio_direction_output(S5PV210_GPH0(6), 1);
+
+		gpio_set_value(S5PV210_GPH0(6), 0);
+		mdelay(10);
+
+		gpio_set_value(S5PV210_GPH0(6), 1);
+		mdelay(10);
+
+		gpio_free(S5PV210_GPH0(6));
+	} else {
+#if !defined(CONFIG_BACKLIGHT_PWM)
+		gpio_request(S5PV210_GPD0(3), "GPD0");
+		gpio_direction_output(S5PV210_GPD0(3), 0);
+		gpio_free(S5PV210_GPD0(3));
+#endif
+	}
+}
+
+static struct plat_lcd_data smdkv210_lcd_lte480wv_data = {
+	.set_power	= smdkv210_lte480wv_set_power,
+};
+
+static struct platform_device smdkv210_lcd_lte480wv = {
+	.name			= "platform-lcd",
+	.dev.parent		= &s3c_device_fb.dev,
+	.dev.platform_data	= &smdkv210_lcd_lte480wv_data,
+};
+
+static struct s3c_fb_pd_win smdkv210_fb_win0 = {
+	.win_mode = {
+		.left_margin	= 13,
+		.right_margin	= 8,
+		.upper_margin	= 7,
+		.lower_margin	= 5,
+		.hsync_len	= 3,
+		.vsync_len	= 1,
+		.xres		= 800,
+		.yres		= 480,
+	},
+	.max_bpp	= 32,
+	.default_bpp	= 24,
+};
+
+static struct s3c_fb_platdata smdkv210_lcd0_pdata __initdata = {
+	.win[0]		= &smdkv210_fb_win0,
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio	= s5pv210_fb_gpio_setup_24bpp,
+};
+
 static struct platform_device *smdkv210_devices[] __initdata = {
 	&s5pv210_device_iis0,
 	&s5pv210_device_ac97,
 	&s5pv210_device_spdif,
 	&s3c_device_adc,
 	&s3c_device_cfcon,
+	&s3c_device_fb,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
@@ -118,6 +189,7 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
+	&smdkv210_lcd_lte480wv,
 };
 
 static struct i2c_board_info smdkv210_i2c_devs0[] __initdata = {
@@ -164,6 +236,8 @@ static void __init smdkv210_machine_init(void)
 
 	s3c_ide_set_platdata(&smdkv210_ide_pdata);
 
+	s3c_fb_set_platdata(&smdkv210_lcd0_pdata);
+
 	platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv210_devices));
 }
 
-- 
1.6.2.5
