From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS4: Add PWM backlight support on Origen
Date: Tue, 23 Aug 2011 11:15:44 +0530
Message-ID: <1314078344-5354-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:35847 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094Ab1HWFsb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 01:48:31 -0400
Received: by yxj19 with SMTP id 19so4032828yxj.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 22:48:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org, giridhar.maruthy@linaro.org

From: Giridhar Maruthy <giridhar.maruthy@linaro.org>

This patch adds support for LCD backlight using PWM timer on
Origen board.

Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig       |    2 ++
 arch/arm/mach-exynos4/mach-origen.c |   16 ++++++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e6925de..3e9138e 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -230,6 +230,8 @@ config MACH_ORIGEN
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_HSMMC2
+	select SAMSUNG_DEV_BACKLIGHT
+	select SAMSUNG_DEV_PWM
 	select EXYNOS4_SETUP_SDHCI
 	help
 	  Machine support for ORIGEN based on Samsung EXYNOS4210
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..b871815 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/input.h>
+#include <linux/pwm_backlight.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -24,6 +25,8 @@
 #include <plat/devs.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
+#include <plat/gpio-cfg.h>
+#include <plat/backlight.h>
 
 #include <mach/map.h>
 
@@ -85,6 +88,17 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_wdt,
 };
 
+/* LCD Backlight data */
+static struct samsung_bl_gpio_info origen_bl_gpio_info = {
+	.no = EXYNOS4_GPD0(0),
+	.func = S3C_GPIO_SFN(2),
+};
+
+static struct platform_pwm_backlight_data origen_bl_data = {
+	.pwm_id = 0,
+	.pwm_period_ns = 1000,
+};
+
 static void __init origen_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
@@ -96,6 +110,8 @@ static void __init origen_machine_init(void)
 {
 	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
+
+	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
 }
 
 MACHINE_START(ORIGEN, "ORIGEN")
-- 
1.7.4.1
