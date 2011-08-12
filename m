From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Add usb ehci device to the SMDKC210
Date: Fri, 12 Aug 2011 18:54:08 +0900
Message-ID: <1313142848-14468-1-git-send-email-jg1.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45105 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752578Ab1HLKJL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:09:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Yulgon Kim <yulgon.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Jingoo Han <jg1.han@samsung.com>

This patch is to support usb ehci device to the SMDKC210 board.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkc210.c |   16 ++++++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 3ceefdb..12a0481 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -115,6 +115,7 @@ config MACH_SMDKC210
 	bool "SMDKC210"
 	select CPU_EXYNOS4210
 	select S5P_DEV_FIMD0
+	select S5P_DEV_USB_EHCI
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_I2C1
@@ -127,6 +128,7 @@ config MACH_SMDKC210
 	select EXYNOS4_DEV_PD
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_FIMD0
+	select EXYNOS4_SETUP_USB_PHY
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_SDHCI
 	help
diff --git a/arch/arm/mach-exynos4/mach-smdkc210.c b/arch/arm/mach-exynos4/mach-smdkc210.c
index a7c65e0..2cd2eb4 100644
--- a/arch/arm/mach-exynos4/mach-smdkc210.c
+++ b/arch/arm/mach-exynos4/mach-smdkc210.c
@@ -36,6 +36,8 @@
 #include <plat/pd.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
+#include <plat/ehci.h>
+#include <plat/clock.h>
 
 #include <mach/map.h>
 
@@ -216,6 +218,16 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 	{I2C_BOARD_INFO("wm8994", 0x1a),},
 };
 
+/* USB EHCI */
+static struct s5p_ehci_platdata smdkc210_ehci_pdata;
+
+static void __init smdkc210_ehci_init(void)
+{
+	struct s5p_ehci_platdata *pdata = &smdkc210_ehci_pdata;
+
+	s5p_ehci_set_platdata(pdata);
+}
+
 static struct platform_device *smdkc210_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
@@ -224,6 +236,7 @@ static struct platform_device *smdkc210_devices[] __initdata = {
 	&s3c_device_i2c1,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_ehci,
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&exynos4_device_pd[PD_MFC],
@@ -296,6 +309,9 @@ static void __init smdkc210_machine_init(void)
 	samsung_bl_set(&smdkc210_bl_gpio_info, &smdkc210_bl_data);
 	s5p_fimd0_set_platdata(&smdkc210_lcd0_pdata);
 
+	smdkc210_ehci_init();
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(smdkc210_devices, ARRAY_SIZE(smdkc210_devices));
 }
 
-- 
1.7.1
