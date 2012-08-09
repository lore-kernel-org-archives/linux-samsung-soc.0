From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Use generic pwm driver in Origen board
Date: Thu,  9 Aug 2012 14:33:55 +0530
Message-ID: <1344503035-18127-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:64797 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754073Ab2HIJFZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Aug 2012 05:05:25 -0400
Received: by pbbrr13 with SMTP id rr13so590173pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Aug 2012 02:05:25 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@lists.infradead.org
Cc: thierry.reding@avionic-design.de, kgene.kim@samsung.com, patches@linaro.org

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 5ca8030..4c4048d 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/input.h>
+#include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/gpio_keys.h>
 #include <linux/i2c.h>
@@ -613,6 +614,10 @@ static struct platform_device origen_lcd_hv070wsa = {
 	.dev.platform_data	= &origen_lcd_hv070wsa_data,
 };
 
+static struct pwm_lookup origen_pwm_lookup[] = {
+	PWM_LOOKUP("s3c24xx-pwm.0", 0, "pwm-backlight.0", NULL),
+};
+
 #ifdef CONFIG_DRM_EXYNOS
 static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
 	.panel	= {
@@ -681,6 +686,10 @@ static struct platform_device origen_device_bluetooth = {
 	},
 };
 
+static struct platform_device origen_device_pwm = {
+	.name = "s3c24xx-pwm.0",
+};
+
 static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc0,
@@ -711,6 +720,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&origen_lcd_hv070wsa,
 	&origen_leds_gpio,
 	&origen_device_bluetooth,
+	&origen_device_pwm,
 };
 
 /* LCD Backlight data */
@@ -791,6 +801,7 @@ static void __init origen_machine_init(void)
 
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 
+	pwm_add_table(origen_pwm_lookup, ARRAY_SIZE(origen_pwm_lookup));
 	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
 
 	origen_bt_setup();
-- 
1.7.4.1
