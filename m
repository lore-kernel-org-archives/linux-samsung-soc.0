From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Add usb ehci device to the SMDKV310
Date: Wed, 31 Aug 2011 13:23:52 +0900
Message-ID: <1314764632-17995-1-git-send-email-jg1.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39084 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751223Ab1HaEju (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 00:39:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Yulgon Kim <yulgon.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Jingoo Han <jg1.han@samsung.com>

This patch is to support usb ehci device to the SMDKV310 board.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c |   16 ++++++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 48f18f7..027c68d 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -128,6 +128,7 @@ config MACH_SMDKV310
 	bool "SMDKV310"
 	select CPU_EXYNOS4210
 	select S5P_DEV_FIMD0
+	select S5P_DEV_USB_EHCI
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_I2C1
@@ -143,6 +144,7 @@ config MACH_SMDKV310
 	select SAMSUNG_DEV_PWM
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_FIMD0
+	select EXYNOS4_SETUP_USB_PHY
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 57cf632..43cfde6 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -38,6 +38,8 @@
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
 #include <plat/mfc.h>
+#include <plat/ehci.h>
+#include <plat/clock.h>
 
 #include <mach/map.h>
 
@@ -233,6 +235,16 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
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
@@ -241,6 +253,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_i2c1,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_ehci,
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&samsung_device_keypad,
@@ -327,6 +340,9 @@ static void __init smdkv310_machine_init(void)
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
 	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
 
+	smdkv310_ehci_init();
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 }
-- 
1.7.1
