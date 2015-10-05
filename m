From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/6] ARM: s3c24xx: h1940: Use PWM lookup table
Date: Mon,  5 Oct 2015 14:47:12 +0200
Message-ID: <1444049237-29878-2-git-send-email-thierry.reding@gmail.com>
References: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38755 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751672AbbJEMrV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 08:47:21 -0400
Received: by wiclk2 with SMTP id lk2so112873733wic.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2015 05:47:20 -0700 (PDT)
In-Reply-To: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>

Use a PWM lookup table to provide the PWM to the pwm-backlight device.
The driver has a legacy code path that is required only because boards
still use the legacy method of requesting PWMs by global ID. Replacing
these usages allows that legacy fallback to be removed.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
---
 arch/arm/mach-s3c24xx/mach-h1940.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index d40d4f5244c6..9f54300df4b3 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -25,6 +25,7 @@
 #include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -469,6 +470,11 @@ static struct s3c24xx_mci_pdata h1940_mmc_cfg __initdata = {
 	.ocr_avail     = MMC_VDD_32_33,
 };
 
+static struct pwm_lookup h1940_pwm_lookup[] = {
+	PWM_LOOKUP("samsung-pwm", 0, "pwm-backlight", NULL, 36296,
+		   PWM_POLARITY_NORMAL),
+};
+
 static int h1940_backlight_init(struct device *dev)
 {
 	gpio_request(S3C2410_GPB(0), "Backlight");
@@ -503,11 +509,8 @@ static void h1940_backlight_exit(struct device *dev)
 
 
 static struct platform_pwm_backlight_data backlight_data = {
-	.pwm_id         = 0,
 	.max_brightness = 100,
 	.dft_brightness = 50,
-	/* tcnt = 0x31 */
-	.pwm_period_ns  = 36296,
 	.enable_gpio    = -1,
 	.init           = h1940_backlight_init,
 	.notify		= h1940_backlight_notify,
@@ -725,6 +728,7 @@ static void __init h1940_init(void)
 	gpio_request(H1940_LATCH_SD_POWER, "SD power");
 	gpio_direction_output(H1940_LATCH_SD_POWER, 0);
 
+	pwm_add_table(h1940_pwm_lookup, ARRAY_SIZE(h1940_pwm_lookup));
 	platform_add_devices(h1940_devices, ARRAY_SIZE(h1940_devices));
 
 	gpio_request(S3C2410_GPA(1), "Red LED blink");
-- 
2.5.0
