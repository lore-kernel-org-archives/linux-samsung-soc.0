From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: S5PV210: Add USB OTG gadget device support to SMDKV210 board
Date: Tue, 29 Nov 2011 12:47:35 +0900
Message-ID: <1322538455-31748-1-git-send-email-jg1.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:35523 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab1LALM1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 06:12:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Jingoo Han <jg1.han@samsung.com>

This patch adds USB OTG gadget device support to SMDKV210 board,
which can support USB high-speed gadget drivers.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig         |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 646057a..e42fbdd 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -137,6 +137,7 @@ config MACH_SMDKV210
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S3C_DEV_USB_HSOTG
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_IDE
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index a9106c3..a56ae9a 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -46,6 +46,7 @@
 #include <plat/s5p-time.h>
 #include <plat/backlight.h>
 #include <plat/regs-fb-v4.h>
+#include <plat/clock.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -225,6 +226,7 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
+	&s3c_device_usb_hsotg,
 	&s5pv210_device_ac97,
 	&s5pv210_device_iis0,
 	&s5pv210_device_spdif,
@@ -308,6 +310,8 @@ static void __init smdkv210_machine_init(void)
 
 	samsung_bl_set(&smdkv210_bl_gpio_info, &smdkv210_bl_data);
 
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv210_devices));
 }
 
-- 
1.7.1
