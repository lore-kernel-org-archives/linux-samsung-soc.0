From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: ADD USB EHCI device to SMDKV310
Date: Wed, 17 Aug 2011 12:29:17 +0530
Message-ID: <1313564357-32331-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:57713 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813Ab1HQHBs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 03:01:48 -0400
Received: by pzk37 with SMTP id 37so573544pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Aug 2011 00:01:48 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

Signed-off-by: Bhuvana Kakunoori <bhuvana.kakunoori@linaro.org>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c |   16 ++++++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index bb29d51..cc97d23 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -136,6 +136,7 @@ config MACH_SMDKV310
 	bool "SMDKV310"
 	select CPU_EXYNOS4210
 	select S5P_DEV_FIMD0
+	select S5P_DEV_USB_EHCI
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_I2C1
@@ -151,6 +152,7 @@ config MACH_SMDKV310
 	select SAMSUNG_DEV_PWM
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_FIMD0
+	select EXYNOS4_SETUP_USB_PHY
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 5f62b2b..b6c28ea 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -33,6 +33,8 @@
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
 #include <plat/mfc.h>
+#include <plat/ehci.h>
+#include <plat/clock.h>
 
 #include <mach/map.h>
 
@@ -167,6 +169,16 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 	{I2C_BOARD_INFO("wm8994", 0x1a),},
 };
 
+/* USB EHCI */
+static struct s5p_ehci_platdata smdkv310_ehci_pdata;
+
+static void __init smdkv310_ehci_init(void)
+{
+	struct s5p_ehci_platdata *pdata = &smdkv310_ehci_pdata;
+
+	s5p_ehci_set_platdata(pdata);
+}
+
 static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
@@ -175,6 +187,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_i2c1,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_ehci,
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&samsung_device_keypad,
@@ -258,6 +271,9 @@ static void __init smdkv310_machine_init(void)
 
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
 
+	smdkv310_ehci_init();
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 }
-- 
1.7.4.1
