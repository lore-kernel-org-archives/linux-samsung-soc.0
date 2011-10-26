From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable Bluetooth on ORIGEN
Date: Wed, 26 Oct 2011 13:48:00 +0100
Message-ID: <1319633280-17799-1-git-send-email-sangwook.lee@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:35981 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932917Ab1JZMuG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Oct 2011 08:50:06 -0400
Received: by faan17 with SMTP id n17so1493664faa.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Oct 2011 05:50:05 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, linaro-dev@lists.linaro.org, Sangwook Lee <sangwook.lee@linaro.org>

This patch enables Bluetooth support on ORIGEN board.

Signed-off-by: Sangwook <sangwook.lee@linaro.org>
---
 arch/arm/mach-exynos4/mach-origen.c |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index f80b563..f8c50d7 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -20,6 +20,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/mfd/max8997.h>
 #include <linux/lcd.h>
+#include <linux/rfkill-gpio.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -232,6 +233,7 @@ static struct regulator_init_data __initdata max8997_ldo9_data = {
 		.min_uV		= 2800000,
 		.max_uV		= 2800000,
 		.apply_uV	= 1,
+		.always_on	= 1,
 		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 		.state_mem	= {
 			.disabled	= 1,
@@ -275,6 +277,7 @@ static struct regulator_init_data __initdata max8997_ldo14_data = {
 		.min_uV		= 1800000,
 		.max_uV		= 1800000,
 		.apply_uV	= 1,
+		.always_on	= 1,
 		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 		.state_mem	= {
 			.disabled	= 1,
@@ -290,6 +293,7 @@ static struct regulator_init_data __initdata max8997_ldo17_data = {
 		.min_uV		= 3300000,
 		.max_uV		= 3300000,
 		.apply_uV	= 1,
+		.always_on	= 1,
 		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
 		.state_mem	= {
 			.disabled	= 1,
@@ -588,6 +592,21 @@ static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
 	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
 };
 
+/* Bluetooth rfkill gpio platform data */
+struct rfkill_gpio_platform_data origen_bt_pdata = {
+	.reset_gpio = EXYNOS4_GPX2(2),
+	.shutdown_gpio = -1,
+	.type = RFKILL_TYPE_BLUETOOTH,
+	.name = "origen-bt",
+};
+
+/* Bluetooth Platform device */
+static struct platform_device origen_device_bluetooth = {
+	.name = "rfkill_gpio",
+	.id = -1,
+	.dev.platform_data = &origen_bt_pdata,
+};
+
 static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc0,
@@ -615,6 +634,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&exynos4_device_pd[PD_MFC],
 	&origen_device_gpiokeys,
 	&origen_lcd_hv070wsa,
+	&origen_device_bluetooth,
 };
 
 /* LCD Backlight data */
@@ -628,6 +648,16 @@ static struct platform_pwm_backlight_data origen_bl_data = {
 	.pwm_period_ns	= 1000,
 };
 
+static void __init origen_bt_setup(void)
+{
+	gpio_request(EXYNOS4_GPA0(0), "GPIO BT_UART");
+	/* 4 UART Pins configuration */
+	s3c_gpio_cfgrange_nopull(EXYNOS4_GPA0(0), 4, S3C_GPIO_SFN(2));
+	/* Setup BT Reset, this gpio will be requesed by rfkill-gpio */
+	s3c_gpio_cfgpin(EXYNOS4_GPX2(2), S3C_GPIO_OUTPUT);
+	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
+}
+
 static void s5p_tv_setup(void)
 {
 	/* Direct HPD to HDMI chip */
@@ -687,6 +717,8 @@ static void __init origen_machine_init(void)
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 
 	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
+
+	origen_bt_setup();
 }
 
 MACHINE_START(ORIGEN, "ORIGEN")
-- 
1.7.4.1
