From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] ARM: EXYNOS: Use generic pwm driver in Origen board
Date: Wed, 12 Sep 2012 17:03:30 +0530
Message-ID: <1347449612-382-2-git-send-email-sachin.kamat@linaro.org>
References: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:32853 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039Ab2ILLgl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 07:36:41 -0400
Received: by dady13 with SMTP id y13so927134dad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Sep 2012 04:36:40 -0700 (PDT)
In-Reply-To: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thierry.reding@avionic-design.de, tushar.behera@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

From: Tushar Behera <tushar.behera@linaro.org>

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig       |    1 +
 arch/arm/mach-exynos/mach-origen.c |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 195b50e..4b7d15d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -348,6 +348,7 @@ config MACH_ORIGEN
 	select EXYNOS4_SETUP_FIMD0
 	select EXYNOS4_SETUP_SDHCI
 	select EXYNOS4_SETUP_USB_PHY
+	select S3C24XX_PWM
 	help
 	  Machine support for ORIGEN based on Samsung EXYNOS4210
 
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 5ec563b..0a3c4ef 100644
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
@@ -614,6 +615,10 @@ static struct platform_device origen_lcd_hv070wsa = {
 	.dev.platform_data	= &origen_lcd_hv070wsa_data,
 };
 
+static struct pwm_lookup origen_pwm_lookup[] = {
+	PWM_LOOKUP("s3c24xx-pwm.0", 0, "pwm-backlight.0", NULL),
+};
+
 #ifdef CONFIG_DRM_EXYNOS
 static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
 	.panel	= {
@@ -798,6 +803,7 @@ static void __init origen_machine_init(void)
 
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 
+	pwm_add_table(origen_pwm_lookup, ARRAY_SIZE(origen_pwm_lookup));
 	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
 
 	origen_bt_setup();
-- 
1.7.4.1
