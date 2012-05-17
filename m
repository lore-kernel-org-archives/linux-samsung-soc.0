From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] ARM: EXYNOS: Add HSOTG support to Origen
Date: Thu, 17 May 2012 17:24:13 +0530
Message-ID: <1337255655-10633-2-git-send-email-sachin.kamat@linaro.org>
References: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55043 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760001Ab2EQMEZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 08:04:25 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so2338036dad.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 May 2012 05:04:25 -0700 (PDT)
In-Reply-To: <1337255655-10633-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

S3C-HSOTG device is added to Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/Kconfig       |    1 +
 arch/arm/mach-exynos/mach-origen.c |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 6919e23..4bc13f4 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -312,6 +312,7 @@ config MACH_ORIGEN
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
+	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 878d4c9..aa35bfe 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -21,6 +21,7 @@
 #include <linux/mfd/max8997.h>
 #include <linux/lcd.h>
 #include <linux/rfkill-gpio.h>
+#include <linux/platform_data/s3c-hsotg.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -500,6 +501,9 @@ static void __init origen_ohci_init(void)
 	exynos4_ohci_set_platdata(pdata);
 }
 
+/* USB OTG */
+static struct s3c_hsotg_plat origen_hsotg_pdata;
+
 static struct gpio_keys_button origen_gpio_keys_table[] = {
 	{
 		.code			= KEY_MENU,
@@ -628,6 +632,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_i2c0,
 	&s3c_device_rtc,
+	&s3c_device_usb_hsotg,
 	&s3c_device_wdt,
 	&s5p_device_ehci,
 	&s5p_device_fimc0,
@@ -714,6 +719,7 @@ static void __init origen_machine_init(void)
 
 	origen_ehci_init();
 	origen_ohci_init();
+	s3c_hsotg_set_platdata(&origen_hsotg_pdata);
 	clk_xusbxti.rate = 24000000;
 
 	s5p_tv_setup();
-- 
1.7.4.1
