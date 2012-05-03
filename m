From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: EXYNOS: Add MFC device to SMDK4X12
Date: Thu,  3 May 2012 15:42:35 +0530
Message-ID: <1336039956-19263-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:33273 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525Ab2ECKWC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 May 2012 06:22:02 -0400
Received: by dady13 with SMTP id y13so1463352dad.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 May 2012 03:22:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

MFC (multi-format codec) device is added to SMDK4212 and SMDK4412 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    1 +
 arch/arm/mach-exynos/mach-smdk4x12.c |   11 +++++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 2c35fd4..ac72490 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -343,6 +343,7 @@ config MACH_SMDK4212
 	select S3C_DEV_I2C7
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select S5P_DEV_MFC
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_KEYPAD
 	select SAMSUNG_DEV_PWM
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index 4be083a..1c259f2 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -31,6 +31,7 @@
 #include <plat/gpio-cfg.h>
 #include <plat/iic.h>
 #include <plat/keypad.h>
+#include <plat/mfc.h>
 #include <plat/regs-serial.h>
 #include <plat/sdhci.h>
 
@@ -242,6 +243,9 @@ static struct platform_device *smdk4x12_devices[] __initdata = {
 	&s3c_device_i2c7,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
 	&samsung_device_keypad,
 };
 
@@ -254,6 +258,11 @@ static void __init smdk4x12_map_io(void)
 	s3c24xx_init_uarts(smdk4x12_uartcfgs, ARRAY_SIZE(smdk4x12_uartcfgs));
 }
 
+static void __init smdk4x12_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init smdk4x12_machine_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
@@ -291,6 +300,7 @@ MACHINE_START(SMDK4212, "SMDK4212")
 	.init_machine	= smdk4x12_machine_init,
 	.timer		= &exynos4_timer,
 	.restart	= exynos4_restart,
+	.reserve	= &smdk4x12_reserve,
 MACHINE_END
 
 MACHINE_START(SMDK4412, "SMDK4412")
@@ -303,4 +313,5 @@ MACHINE_START(SMDK4412, "SMDK4412")
 	.init_machine	= smdk4x12_machine_init,
 	.timer		= &exynos4_timer,
 	.restart	= exynos4_restart,
+	.reserve	= &smdk4x12_reserve,
 MACHINE_END
-- 
1.7.4.1
