From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH-Resend 2/2] ARM: EXYNOS: Add HSOTG support to SMDK4X12
Date: Thu, 24 May 2012 14:25:26 +0530
Message-ID: <1337849726-17744-2-git-send-email-sachin.kamat@linaro.org>
References: <1337849726-17744-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:46335 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752221Ab2EXJF4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 05:05:56 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so11176227pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 May 2012 02:05:56 -0700 (PDT)
In-Reply-To: <1337849726-17744-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

S3C-HSOTG support is added to SMDK4212 and SMDK4412 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    2 ++
 arch/arm/mach-exynos/mach-smdk4x12.c |    8 ++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 6682f35..95e3ee3 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -349,6 +349,7 @@ config MACH_SMDK4212
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C7
 	select S3C_DEV_RTC
+	select S3C_DEV_USB_HSOTG
 	select S3C_DEV_WDT
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_KEYPAD
@@ -359,6 +360,7 @@ config MACH_SMDK4212
 	select EXYNOS4_SETUP_I2C7
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
+	select EXYNOS4_SETUP_USB_PHY
 	help
 	  Machine support for Samsung SMDK4212
 
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index d00e4f0..6d8f325 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -19,6 +19,7 @@
 #include <linux/pwm_backlight.h>
 #include <linux/regulator/machine.h>
 #include <linux/serial_core.h>
+#include <linux/platform_data/s3c-hsotg.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -235,6 +236,9 @@ static struct samsung_keypad_platdata smdk4x12_keypad_data __initdata = {
 	.cols		= 5,
 };
 
+/* USB OTG */
+static struct s3c_hsotg_plat smdk4x12_hsotg_pdata;
+
 static struct platform_device *smdk4x12_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
@@ -243,6 +247,7 @@ static struct platform_device *smdk4x12_devices[] __initdata = {
 	&s3c_device_i2c3,
 	&s3c_device_i2c7,
 	&s3c_device_rtc,
+	&s3c_device_usb_hsotg,
 	&s3c_device_wdt,
 	&samsung_device_keypad,
 };
@@ -281,6 +286,9 @@ static void __init smdk4x12_machine_init(void)
 	s3c_sdhci2_set_platdata(&smdk4x12_hsmmc2_pdata);
 	s3c_sdhci3_set_platdata(&smdk4x12_hsmmc3_pdata);
 
+	s3c_hsotg_set_platdata(&smdk4x12_hsotg_pdata);
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(smdk4x12_devices, ARRAY_SIZE(smdk4x12_devices));
 }
 
-- 
1.7.4.1
