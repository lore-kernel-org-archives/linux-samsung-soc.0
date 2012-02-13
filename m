From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH-RESEND 2/4] ARM: S5PV210: Enable MFC on SMDKC110
Date: Mon, 13 Feb 2012 10:48:49 +0530
Message-ID: <1329110331-12746-3-git-send-email-sachin.kamat@linaro.org>
References: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35438 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277Ab2BMFYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 00:24:39 -0500
Received: by mail-pz0-f46.google.com with SMTP id d14so4163054dae.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2012 21:24:39 -0800 (PST)
In-Reply-To: <1329110331-12746-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Add MFC support on SMDKC110 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/Kconfig         |    1 +
 arch/arm/mach-s5pv210/mach-smdkc110.c |   10 ++++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 1e0131b..dd9bdab 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -118,6 +118,7 @@ config MACH_SMDKC110
 	select S3C_DEV_I2C2
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_MFC
 	select SAMSUNG_DEV_IDE
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
index b323983..7100f7e 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -31,6 +31,7 @@
 #include <plat/iic.h>
 #include <plat/pm.h>
 #include <plat/s5p-time.h>
+#include <plat/mfc.h>
 
 #include "common.h"
 
@@ -94,6 +95,9 @@ static struct platform_device *smdkc110_devices[] __initdata = {
 	&s3c_device_i2c2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
 };
 
 static struct i2c_board_info smdkc110_i2c_devs0[] __initdata = {
@@ -117,6 +121,11 @@ static void __init smdkc110_map_io(void)
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
 
+static void __init smdkc110_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init smdkc110_machine_init(void)
 {
 	s3c_pm_init();
@@ -145,4 +154,5 @@ MACHINE_START(SMDKC110, "SMDKC110")
 	.init_machine	= smdkc110_machine_init,
 	.timer		= &s5p_timer,
 	.restart	= s5pv210_restart,
+	.reserve	= &smdkc110_reserve,
 MACHINE_END
-- 
1.7.4.1
