From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: EXYNOS: Add HSOTG support to SMDKV310
Date: Thu, 17 May 2012 17:24:14 +0530
Message-ID: <1337255655-10633-3-git-send-email-sachin.kamat@linaro.org>
References: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55043 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760254Ab2EQME2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 08:04:28 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so2338036dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 May 2012 05:04:28 -0700 (PDT)
In-Reply-To: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

S3C-HSOTG device is added to SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4bc13f4..9928f3d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -199,6 +199,7 @@ config MACH_SMDKV310
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
+	select S3C_DEV_USB_HSOTG
 	select SAMSUNG_DEV_BACKLIGHT
 	select EXYNOS4_DEV_AHCI
 	select SAMSUNG_DEV_KEYPAD
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 83b91fa..b7a6360 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -19,6 +19,7 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/pwm_backlight.h>
+#include <linux/platform_data/s3c-hsotg.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -256,6 +257,9 @@ static void __init smdkv310_ohci_init(void)
 	exynos4_ohci_set_platdata(pdata);
 }
 
+/* USB OTG */
+static struct s3c_hsotg_plat smdkv310_hsotg_pdata;
+
 static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
@@ -264,6 +268,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_i2c1,
 	&s5p_device_i2c_hdmiphy,
 	&s3c_device_rtc,
+	&s3c_device_usb_hsotg,
 	&s3c_device_wdt,
 	&s5p_device_ehci,
 	&s5p_device_fimc0,
@@ -368,6 +373,7 @@ static void __init smdkv310_machine_init(void)
 
 	smdkv310_ehci_init();
 	smdkv310_ohci_init();
+	s3c_hsotg_set_platdata(&smdkv310_hsotg_pdata);
 	clk_xusbxti.rate = 24000000;
 
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
-- 
1.7.4.1
