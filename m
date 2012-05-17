From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: S5PV210: Add HSOTG support to SMDKV210
Date: Thu, 17 May 2012 17:24:15 +0530
Message-ID: <1337255655-10633-4-git-send-email-sachin.kamat@linaro.org>
References: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55043 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760246Ab2EQMEb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 08:04:31 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so2338036dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 May 2012 05:04:31 -0700 (PDT)
In-Reply-To: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds S3C-HSOTG support to SMDKV210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    2 ++
 arch/arm/mach-s5pv210/mach-smdkv210.c |    8 ++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 88e983b..77185c3 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -152,6 +152,7 @@ config MACH_SMDKV210
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
+	select S3C_DEV_USB_HSOTG
 	select S3C_DEV_WDT
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
@@ -170,6 +171,7 @@ config MACH_SMDKV210
 	select S5PV210_SETUP_IDE
 	select S5PV210_SETUP_KEYPAD
 	select S5PV210_SETUP_SDHCI
+	select S5PV210_SETUP_USB_PHY
 	help
 	  Machine support for Samsung SMDKV210
 
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 91d4ad8..0041045 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -19,6 +19,7 @@
 #include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/pwm_backlight.h>
+#include <linux/platform_data/s3c-hsotg.h>
 
 #include <asm/hardware/vic.h>
 #include <asm/mach/arch.h>
@@ -210,6 +211,9 @@ static struct s3c_fb_platdata smdkv210_lcd0_pdata __initdata = {
 	.setup_gpio	= s5pv210_fb_gpio_setup_24bpp,
 };
 
+/* USB OTG */
+static struct s3c_hsotg_plat smdkv210_hsotg_pdata;
+
 static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_adc,
 	&s3c_device_cfcon,
@@ -223,6 +227,7 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_i2c2,
 	&s3c_device_rtc,
 	&s3c_device_ts,
+	&s3c_device_usb_hsotg,
 	&s3c_device_wdt,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
@@ -321,6 +326,9 @@ static void __init smdkv210_machine_init(void)
 
 	samsung_bl_set(&smdkv210_bl_gpio_info, &smdkv210_bl_data);
 
+	s3c_hsotg_set_platdata(&smdkv210_hsotg_pdata);
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv210_devices));
 }
 
-- 
1.7.4.1
