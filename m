From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH][Resend] ARM: EXYNOS: Add HSOTG support to SMDK4X12
Date: Thu, 21 Jun 2012 09:51:55 +0530
Message-ID: <1340252515-15999-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:33742 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752500Ab2FUEdk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jun 2012 00:33:40 -0400
Received: by dady13 with SMTP id y13so302428dad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jun 2012 21:33:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

S3C-HSOTG support is added to SMDK4212 and SMDK4412 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Rebased on Kukjin Kim's tree -next/board-samsung branch.
---
 arch/arm/mach-exynos/Kconfig         |    2 ++
 arch/arm/mach-exynos/mach-smdk4x12.c |    7 +++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index f5fb6ea..ee8fa10 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -362,6 +362,7 @@ config MACH_SMDK4212
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C7
 	select S3C_DEV_RTC
+	select S3C_DEV_USB_HSOTG
 	select S3C_DEV_WDT
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
@@ -378,6 +379,7 @@ config MACH_SMDK4212
 	select EXYNOS4_SETUP_I2C7
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
+	select EXYNOS4_SETUP_USB_PHY
 	help
 	  Machine support for Samsung SMDK4212
 
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index e134c95..61abbc4 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -19,6 +19,7 @@
 #include <linux/pwm_backlight.h>
 #include <linux/regulator/machine.h>
 #include <linux/serial_core.h>
+#include <linux/platform_data/s3c-hsotg.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -236,6 +237,9 @@ static struct samsung_keypad_platdata smdk4x12_keypad_data __initdata = {
 	.cols		= 8,
 };
 
+/* USB OTG */
+static struct s3c_hsotg_plat smdk4x12_hsotg_pdata;
+
 static struct platform_device *smdk4x12_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
@@ -244,6 +248,7 @@ static struct platform_device *smdk4x12_devices[] __initdata = {
 	&s3c_device_i2c3,
 	&s3c_device_i2c7,
 	&s3c_device_rtc,
+	&s3c_device_usb_hsotg,
 	&s3c_device_wdt,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
@@ -295,6 +300,8 @@ static void __init smdk4x12_machine_init(void)
 	s3c_sdhci2_set_platdata(&smdk4x12_hsmmc2_pdata);
 	s3c_sdhci3_set_platdata(&smdk4x12_hsmmc3_pdata);
 
+	s3c_hsotg_set_platdata(&smdk4x12_hsotg_pdata);
+
 	platform_add_devices(smdk4x12_devices, ARRAY_SIZE(smdk4x12_devices));
 }
 
-- 
1.7.4.1
