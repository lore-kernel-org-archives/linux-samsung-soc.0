From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 7/7] ARM: S3C2442: RX1950: Add support for LED blinking
Date: Thu,  6 Jan 2011 21:52:52 +0200
Message-ID: <1294343572-28518-8-git-send-email-anarsoul@gmail.com>
References: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35968 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625Ab1AFTyp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jan 2011 14:54:45 -0500
Received: by mail-ey0-f174.google.com with SMTP id 27so7378165eye.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2011 11:54:45 -0800 (PST)
In-Reply-To: <1294343572-28518-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, anarsoul@gmail.com

Add .gpio_set_blink callback to support HW blinking
available on RX1950

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c2440/mach-rx1950.c |   54 +++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/mach-rx1950.c
index e7cc993..2d2f4e4 100644
--- a/arch/arm/mach-s3c2440/mach-rx1950.c
+++ b/arch/arm/mach-s3c2440/mach-rx1950.c
@@ -263,6 +263,52 @@ void rx1950_disable_charger(void)
 	gpio_direction_output(S3C2410_GPJ(3), 0);
 }
 
+DEFINE_SPINLOCK(rx1950_blink_spin);
+
+static int rx1950_led_blink_set(unsigned gpio, int state,
+	unsigned long *delay_on, unsigned long *delay_off)
+{
+	int blink_gpio, check_gpio;
+
+	switch (gpio) {
+	case S3C2410_GPA(6):
+		blink_gpio = S3C2410_GPA(4);
+		check_gpio = S3C2410_GPA(3);
+		break;
+	case S3C2410_GPA(7):
+		blink_gpio = S3C2410_GPA(3);
+		check_gpio = S3C2410_GPA(4);
+		break;
+	default:
+		return -EINVAL;
+		break;
+	}
+
+	if (delay_on && delay_off && !*delay_on && !*delay_off)
+		*delay_on = *delay_off = 500;
+
+	spin_lock(&rx1950_blink_spin);
+
+	switch (state) {
+	case GPIO_LED_NO_BLINK_LOW:
+	case GPIO_LED_NO_BLINK_HIGH:
+		if (!gpio_get_value(check_gpio))
+			gpio_set_value(S3C2410_GPJ(6), 0);
+		gpio_set_value(blink_gpio, 0);
+		gpio_set_value(gpio, state);
+		break;
+	case GPIO_LED_BLINK:
+		gpio_set_value(gpio, 0);
+		gpio_set_value(S3C2410_GPJ(6), 1);
+		gpio_set_value(blink_gpio, 1);
+		break;
+	}
+
+	spin_unlock(&rx1950_blink_spin);
+
+	return 0;
+}
+
 static struct gpio_led rx1950_leds_desc[] = {
 	{
 		.name				= "Green",
@@ -287,6 +333,7 @@ static struct gpio_led rx1950_leds_desc[] = {
 static struct gpio_led_platform_data rx1950_leds_pdata = {
 	.num_leds	= ARRAY_SIZE(rx1950_leds_desc),
 	.leds		= rx1950_leds_desc,
+	.gpio_blink_set	= rx1950_led_blink_set,
 };
 
 static struct platform_device rx1950_leds = {
@@ -774,6 +821,13 @@ static void __init rx1950_init_machine(void)
 
 	WARN_ON(gpio_request(S3C2410_GPB(1), "LCD power"));
 
+	WARN_ON(gpio_request(S3C2410_GPA(3), "Red blink"));
+	WARN_ON(gpio_request(S3C2410_GPA(4), "Green blink"));
+	WARN_ON(gpio_request(S3C2410_GPJ(6), "LED blink"));
+	gpio_direction_output(S3C2410_GPA(3), 0);
+	gpio_direction_output(S3C2410_GPA(4), 0);
+	gpio_direction_output(S3C2410_GPJ(6), 0);
+
 	platform_add_devices(rx1950_devices, ARRAY_SIZE(rx1950_devices));
 
 	i2c_register_board_info(0, rx1950_i2c_devices,
-- 
1.7.3.2
