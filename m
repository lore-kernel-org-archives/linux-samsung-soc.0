From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 19/23] ARM: mini2440: Move to using gpiolib API and s3c_gpio functions
Date: Fri,  7 May 2010 08:15:41 +0900
Message-ID: <1273187745-6566-20-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60655 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752798Ab0EFXQJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:09 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Move the mach-mini2440 to using the gpiolib API for GPIOS it
directly uses, and s3c_gpio calls for configuration.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2440/mach-mini2440.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s3c2440/mach-mini2440.c b/arch/arm/mach-s3c2440/mach-mini2440.c
index 362a2f9..a76bcda 100644
--- a/arch/arm/mach-s3c2440/mach-mini2440.c
+++ b/arch/arm/mach-s3c2440/mach-mini2440.c
@@ -103,10 +103,10 @@ static void mini2440_udc_pullup(enum s3c2410_udc_cmd_e cmd)
 
 	switch (cmd) {
 		case S3C2410_UDC_P_ENABLE :
-			s3c2410_gpio_setpin(S3C2410_GPC(5), 1);
+			gpio_set_value(S3C2410_GPC(5), 1);
 			break;
 		case S3C2410_UDC_P_DISABLE :
-			s3c2410_gpio_setpin(S3C2410_GPC(5), 0);
+			gpio_set_value(S3C2410_GPC(5), 0);
 			break;
 		case S3C2410_UDC_P_RESET :
 			break;
@@ -636,22 +636,22 @@ static void __init mini2440_init(void)
 	s3c_gpio_cfgpin(S3C2410_GPC(0), S3C2410_GPC0_LEND);
 
 	/* Turn the backlight early on */
-	s3c2410_gpio_setpin(S3C2410_GPG(4), 1);
-	s3c_gpio_cfgpin(S3C2410_GPG(4), S3C2410_GPIO_OUTPUT);
+	WARN_ON(gpio_request(S3C2410_GPG(4), "backlight"));
+	gpio_direction_output(S3C2410_GPG(4), 1);
 
 	/* remove pullup on optional PWM backlight -- unused on 3.5 and 7"s */
-	s3c2410_gpio_pullup(S3C2410_GPB(1), 0);
+	s3c_gpio_setpull(S3C2410_GPB(1), S3C_GPIO_PULL_UP);
 	s3c2410_gpio_setpin(S3C2410_GPB(1), 0);
 	s3c_gpio_cfgpin(S3C2410_GPB(1), S3C2410_GPIO_INPUT);
 
 	/* Make sure the D+ pullup pin is output */
-	s3c_gpio_cfgpin(S3C2410_GPC(5), S3C2410_GPIO_OUTPUT);
+	WARN_ON(gpio_request(S3C2410_GPC(5), "udc pup"));
+	gpio_direction_output(S3C2410_GPC(5), 0);
 
 	/* mark the key as input, without pullups (there is one on the board) */
 	for (i = 0; i < ARRAY_SIZE(mini2440_buttons); i++) {
-		s3c2410_gpio_pullup(mini2440_buttons[i].gpio, 0);
-		s3c_gpio_cfgpin(mini2440_buttons[i].gpio,
-					S3C2410_GPIO_INPUT);
+		s3c_gpio_setpull(mini2440_buttons[i].gpio, S3C_GPIO_PULL_UP);
+		s3c_gpio_cfgpin(mini2440_buttons[i].gpio, S3C2410_GPIO_INPUT);
 	}
 	if (features.lcd_index != -1) {
 		int li;
-- 
1.7.0.4
