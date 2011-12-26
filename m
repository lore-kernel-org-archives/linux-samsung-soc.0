From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: S5PV210: Enable MFC on SMDKV210
Date: Mon, 26 Dec 2011 15:30:10 +0530
Message-ID: <1324893613-5469-2-git-send-email-sachin.kamat@linaro.org>
References: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44766 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753955Ab1LZKDg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 05:03:36 -0500
Received: by mail-iy0-f174.google.com with SMTP id h11so18667483iae.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2011 02:03:36 -0800 (PST)
In-Reply-To: <1324893613-5469-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

This patch adds MFC support on SMDKV210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |   10 ++++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 646057a..251491d 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -137,6 +137,7 @@ config MACH_SMDKV210
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_MFC
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_IDE
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index 8662ef6..d50cacd 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -46,6 +46,7 @@
 #include <plat/s5p-time.h>
 #include <plat/backlight.h>
 #include <plat/regs-fb-v4.h>
+#include <plat/mfc.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define SMDKV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -225,6 +226,9 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
 	&s5pv210_device_ac97,
 	&s5pv210_device_iis0,
 	&s5pv210_device_spdif,
@@ -284,6 +288,11 @@ static void __init smdkv210_map_io(void)
 	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
 }
 
+static void __init smdkv210_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init smdkv210_machine_init(void)
 {
 	s3c_pm_init();
@@ -319,4 +328,5 @@ MACHINE_START(SMDKV210, "SMDKV210")
 	.map_io		= smdkv210_map_io,
 	.init_machine	= smdkv210_machine_init,
 	.timer		= &s5p_timer,
+	.reserve	= &smdkv210_reserve,
 MACHINE_END
-- 
1.7.4.1
