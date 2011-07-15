From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH 8/8] ARM: S3C64XX: Add PWM backlight support on Samsung
 SMDK6410 board
Date: Fri, 15 Jul 2011 20:12:48 +0530
Message-ID: <1310740968-26722-9-git-send-email-banajit.g@samsung.com>
References: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26831 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752515Ab1GOOm2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 10:42:28 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOD00GRWQ6IZSB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:28 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOD00F3JQ6EZC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:28 +0900 (KST)
In-reply-to: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jg1.han@samsung.com

This patch adds support for LCD backlight using PWM timer for
Samsung SMDK6410 board.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
---
 arch/arm/mach-s3c64xx/Kconfig         |    1 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c |   15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 4e2c371..f057b6a 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -142,6 +142,7 @@ config MACH_SMDK6410
 	select S3C_DEV_USB_HOST
 	select S3C_DEV_USB_HSOTG
 	select S3C_DEV_WDT
+	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_KEYPAD
 	select SAMSUNG_DEV_PWM
 	select HAVE_S3C2410_WATCHDOG if WATCHDOG
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index e0521e0..2aa28a2 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -71,6 +71,7 @@
 #include <plat/adc.h>
 #include <plat/ts.h>
 #include <plat/keypad.h>
+#include <plat/backlight.h>
 
 #define UCON S3C2410_UCON_DEFAULT | S3C2410_UCON_UCLK
 #define ULCON S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB
@@ -329,8 +330,6 @@ static struct platform_device *smdk6410_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
-	&s3c_device_timer[1],
-	&smdk6410_backlight_device,
 };
 
 #ifdef CONFIG_REGULATOR
@@ -665,6 +664,16 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __initdata = {
 	.oversampling_shift	= 2,
 };
 
+/* LCD Backlight data */
+static struct samsung_bl_gpio_info smdk6410_bl_gpio_info = {
+	.no = S3C64XX_GPF(15),
+	.func = S3C_GPIO_SFN(2),
+};
+
+static struct platform_pwm_backlight_data smdk6410_bl_data = {
+	.pwm_id = 1,
+};
+
 static void __init smdk6410_map_io(void)
 {
 	u32 tmp;
@@ -726,6 +735,8 @@ static void __init smdk6410_machine_init(void)
 
 	s3c_ide_set_platdata(&smdk6410_ide_pdata);
 
+	samsung_bl_set(&smdk6410_bl_gpio_info, &smdk6410_bl_data);
+
 	platform_add_devices(smdk6410_devices, ARRAY_SIZE(smdk6410_devices));
 }
 
-- 
1.7.2.3
