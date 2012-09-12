From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: EXYNOS: Add generic PWM lookup support for SMDK4X12
Date: Wed, 12 Sep 2012 17:03:31 +0530
Message-ID: <1347449612-382-3-git-send-email-sachin.kamat@linaro.org>
References: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:39691 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab2ILLgo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 07:36:44 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr13so2138853pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Sep 2012 04:36:44 -0700 (PDT)
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
 arch/arm/mach-exynos/mach-smdk4x12.c |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4b7d15d..798634d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -384,6 +384,7 @@ config MACH_SMDK4212
 	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
 	select EXYNOS4_SETUP_USB_PHY
+	select S3C24XX_PWM
 	help
 	  Machine support for Samsung SMDK4212
 
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index ee069b4..9c74e8f 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/max8997.h>
 #include <linux/mmc/host.h>
 #include <linux/platform_device.h>
+#include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/regulator/machine.h>
 #include <linux/serial_core.h>
@@ -222,6 +223,10 @@ static struct platform_pwm_backlight_data smdk4x12_bl_data = {
 	.pwm_period_ns  = 1000,
 };
 
+static struct pwm_lookup smdk4x12_pwm_lookup[] = {
+	PWM_LOOKUP("s3c24xx-pwm.1", 0, "pwm-backlight.0", NULL),
+};
+
 static uint32_t smdk4x12_keymap[] __initdata = {
 	/* KEY(row, col, keycode) */
 	KEY(1, 3, KEY_1), KEY(1, 4, KEY_2), KEY(1, 5, KEY_3),
@@ -349,6 +354,7 @@ static void __init smdk4x12_machine_init(void)
 				ARRAY_SIZE(smdk4x12_i2c_devs7));
 
 	samsung_bl_set(&smdk4x12_bl_gpio_info, &smdk4x12_bl_data);
+	pwm_add_table(smdk4x12_pwm_lookup, ARRAY_SIZE(smdk4x12_pwm_lookup));
 
 	samsung_keypad_set_platdata(&smdk4x12_keypad_data);
 
-- 
1.7.4.1
