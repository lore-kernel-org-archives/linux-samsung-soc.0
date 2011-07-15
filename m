From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH 6/8] ARM: S5P64X0: Add PWM backlight support on Samsung
 SMDK6440 board
Date: Fri, 15 Jul 2011 20:12:46 +0530
Message-ID: <1310740968-26722-7-git-send-email-banajit.g@samsung.com>
References: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54993 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752575Ab1GOOm3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 10:42:29 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOD002GTQ6Q17L0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:26 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOD00F3JQ6EZC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:25 +0900 (KST)
In-reply-to: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jg1.han@samsung.com

This patch adds support for LCD backlight using PWM timer for
Samsung SMDK6440 board.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
---
 arch/arm/mach-s5p64x0/Kconfig         |    1 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c |   54 ++++++++-------------------------
 2 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kconfig
index 017af4c..34e2877 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -36,6 +36,7 @@ config MACH_SMDK6440
 	select S3C_DEV_WDT
 	select S3C64XX_DEV_SPI
 	select SAMSUNG_DEV_ADC
+	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_TS
 	select S5P64X0_SETUP_I2C1
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 2d559f1..346f8df 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -46,6 +46,7 @@
 #include <plat/adc.h>
 #include <plat/ts.h>
 #include <plat/s5p-time.h>
+#include <plat/backlight.h>
 
 #define SMDK6440_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
@@ -91,45 +92,6 @@ static struct s3c2410_uartcfg smdk6440_uartcfgs[] __initdata = {
 	},
 };
 
-static int smdk6440_backlight_init(struct device *dev)
-{
-	int ret;
-
-	ret = gpio_request(S5P6440_GPF(15), "Backlight");
-	if (ret) {
-		printk(KERN_ERR "failed to request GPF for PWM-OUT1\n");
-		return ret;
-	}
-
-	/* Configure GPIO pin with S5P6440_GPF15_PWM_TOUT1 */
-	s3c_gpio_cfgpin(S5P6440_GPF(15), S3C_GPIO_SFN(2));
-
-	return 0;
-}
-
-static void smdk6440_backlight_exit(struct device *dev)
-{
-	s3c_gpio_cfgpin(S5P6440_GPF(15), S3C_GPIO_OUTPUT);
-	gpio_free(S5P6440_GPF(15));
-}
-
-static struct platform_pwm_backlight_data smdk6440_backlight_data = {
-	.pwm_id		= 1,
-	.max_brightness	= 255,
-	.dft_brightness	= 255,
-	.pwm_period_ns	= 78770,
-	.init		= smdk6440_backlight_init,
-	.exit		= smdk6440_backlight_exit,
-};
-
-static struct platform_device smdk6440_backlight_device = {
-	.name		= "pwm-backlight",
-	.dev		= {
-		.parent		= &s3c_device_timer[1].dev,
-		.platform_data	= &smdk6440_backlight_data,
-	},
-};
-
 static struct platform_device *smdk6440_devices[] __initdata = {
 	&s3c_device_adc,
 	&s3c_device_rtc,
@@ -139,8 +101,6 @@ static struct platform_device *smdk6440_devices[] __initdata = {
 	&s3c_device_wdt,
 	&samsung_asoc_dma,
 	&s5p6440_device_iis,
-	&s3c_device_timer[1],
-	&smdk6440_backlight_device,
 };
 
 static struct s3c2410_platform_i2c s5p6440_i2c0_data __initdata = {
@@ -175,6 +135,16 @@ static struct s3c2410_ts_mach_info s3c_ts_platform __initdata = {
 	.oversampling_shift	= 2,
 };
 
+/* LCD Backlight data */
+static struct samsung_bl_gpio_info smdk6440_bl_gpio_info = {
+	.no = S5P6440_GPF(15),
+	.func = S3C_GPIO_SFN(2),
+};
+
+static struct platform_pwm_backlight_data smdk6440_bl_data = {
+	.pwm_id = 1,
+};
+
 static void __init smdk6440_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P64X0_SYS_ID);
@@ -194,6 +164,8 @@ static void __init smdk6440_machine_init(void)
 	i2c_register_board_info(1, smdk6440_i2c_devs1,
 			ARRAY_SIZE(smdk6440_i2c_devs1));
 
+	samsung_bl_set(&smdk6440_bl_gpio_info, &smdk6440_bl_data);
+
 	platform_add_devices(smdk6440_devices, ARRAY_SIZE(smdk6440_devices));
 }
 
-- 
1.7.2.3
