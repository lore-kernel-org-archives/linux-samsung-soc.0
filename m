From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/6] ARM: s3c24xx: rx1950: Use PWM lookup table
Date: Mon,  5 Oct 2015 14:47:13 +0200
Message-ID: <1444049237-29878-3-git-send-email-thierry.reding@gmail.com>
References: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:38796 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751910AbbJEMrX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 08:47:23 -0400
Received: by wiclk2 with SMTP id lk2so112874841wic.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2015 05:47:22 -0700 (PDT)
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
 arch/arm/mach-s3c24xx/mach-rx1950.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 1d35ff375a01..774c982a7b7e 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -375,6 +375,11 @@ static struct s3c2410fb_mach_info rx1950_lcd_cfg = {
 
 };
 
+static struct pwm_lookup rx1950_pwm_lookup[] = {
+	PWM_LOOKUP("samsung-pwm", 0, "pwm-backlight.0", NULL, 48000,
+		   PWM_POLARITY_NORMAL),
+};
+
 static struct pwm_device *lcd_pwm;
 
 static void rx1950_lcd_power(int enable)
@@ -520,10 +525,8 @@ static int rx1950_backlight_notify(struct device *dev, int brightness)
 }
 
 static struct platform_pwm_backlight_data rx1950_backlight_data = {
-	.pwm_id = 0,
 	.max_brightness = 24,
 	.dft_brightness = 4,
-	.pwm_period_ns = 48000,
 	.enable_gpio = -1,
 	.init = rx1950_backlight_init,
 	.notify = rx1950_backlight_notify,
@@ -792,6 +795,7 @@ static void __init rx1950_init_machine(void)
 	gpio_direction_output(S3C2410_GPA(4), 0);
 	gpio_direction_output(S3C2410_GPJ(6), 0);
 
+	pwm_add_table(rx1950_pwm_lookup, ARRAY_SIZE(rx1950_pwm_lookup));
 	platform_add_devices(rx1950_devices, ARRAY_SIZE(rx1950_devices));
 
 	i2c_register_board_info(0, rx1950_i2c_devices,
-- 
2.5.0
