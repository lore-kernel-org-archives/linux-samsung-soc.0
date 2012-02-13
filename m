From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH-RESEND 1/4] ARM: S5PV210: Enable MFC on SMDKV210
Date: Mon, 13 Feb 2012 10:48:48 +0530
Message-ID: <1329110331-12746-2-git-send-email-sachin.kamat@linaro.org>
References: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35438 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755Ab2BMFYe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 00:24:34 -0500
Received: by mail-pz0-f46.google.com with SMTP id d14so4163054dae.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2012 21:24:34 -0800 (PST)
In-Reply-To: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Add MFC support on SMDKV210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |   10 ++++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 2cdc42e..1e0131b 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -142,6 +142,7 @@ config MACH_SMDKV210
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_MFC
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_IDE
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index dff9ea7..0b0d65d 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -46,6 +46,7 @@
 #include <plat/s5p-time.h>
 #include <plat/backlight.h>
 #include <plat/regs-fb-v4.h>
+#include <plat/mfc.h>
 
 #include "common.h"
 
@@ -223,6 +224,9 @@ static struct platform_device *smdkv210_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_ts,
 	&s3c_device_wdt,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
 	&s5pv210_device_ac97,
 	&s5pv210_device_iis0,
 	&s5pv210_device_spdif,
@@ -282,6 +286,11 @@ static void __init smdkv210_map_io(void)
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
 	.init_machine	= smdkv210_machine_init,
 	.timer		= &s5p_timer,
 	.restart	= s5pv210_restart,
+	.reserve	= &smdkv210_reserve,
 MACHINE_END
-- 
1.7.4.1
