From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: EXYNOS: Add generic PWM lookup support for SMDKV310
Date: Wed, 12 Sep 2012 17:03:32 +0530
Message-ID: <1347449612-382-4-git-send-email-sachin.kamat@linaro.org>
References: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:32853 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab2ILLgr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 07:36:47 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so927134dad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Sep 2012 04:36:47 -0700 (PDT)
In-Reply-To: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thierry.reding@avionic-design.de, tushar.behera@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

Generic PWM framework requires that the board setup code
register a static mapping that can be used to match PWM
consumers to providers.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 798634d..9abdd57 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -221,6 +221,7 @@ config MACH_SMDKV310
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
 	select EXYNOS4_SETUP_USB_PHY
+	select S3C24XX_PWM
 	help
 	  Machine support for Samsung SMDKV310
 
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 208aa62..e53e66d 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/platform_data/s3c-hsotg.h>
 
@@ -355,6 +356,10 @@ static struct platform_pwm_backlight_data smdkv310_bl_data = {
 	.pwm_period_ns  = 1000,
 };
 
+static struct pwm_lookup smdkv310_pwm_lookup[] = {
+	PWM_LOOKUP("s3c24xx-pwm.1", 0, "pwm-backlight.0", NULL),
+};
+
 /* I2C module and id for HDMIPHY */
 static struct i2c_board_info hdmiphy_info = {
 	I2C_BOARD_INFO("hdmiphy-exynos4210", 0x38),
@@ -399,6 +404,8 @@ static void __init smdkv310_machine_init(void)
 	samsung_keypad_set_platdata(&smdkv310_keypad_data);
 
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
+	pwm_add_table(smdkv310_pwm_lookup, ARRAY_SIZE(smdkv310_pwm_lookup));
+
 #ifdef CONFIG_DRM_EXYNOS
 	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
 	exynos4_fimd0_gpio_setup_24bpp();
-- 
1.7.4.1
