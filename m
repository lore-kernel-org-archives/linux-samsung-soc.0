From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Add HPD and PD support for HDMI on Origen
Date: Thu, 29 Sep 2011 14:45:42 +0530
Message-ID: <1317287742-23091-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:33918 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754991Ab1I2JUN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Sep 2011 05:20:13 -0400
Received: by yib18 with SMTP id 18so339694yib.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Sep 2011 02:20:12 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

This patch adds hot plug detection (HPD) and power domain (PD) support for HDMI
on Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
I have added the KConfig entry and header file required for enabling PD
since the patch [1] is not yet applied on Kgene's tree [2].

[1] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/6763
[2] https://github.com/kgene/linux-samsung/tree/for-next
---
 arch/arm/mach-exynos4/Kconfig       |    1 +
 arch/arm/mach-exynos4/mach-origen.c |   14 ++++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index d0491c2..a02c94f 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -243,6 +243,7 @@ config MACH_ORIGEN
 	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_TV
 	select S5P_DEV_USB_EHCI
+	select EXYNOS4_DEV_PD
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_PWM
 	select EXYNOS4_SETUP_SDHCI
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index 421294b..36709ea 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -30,6 +30,7 @@
 #include <plat/clock.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
+#include <plat/pd.h>
 
 #include <mach/map.h>
 
@@ -168,6 +169,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_i2c_hdmiphy,
 	&s5p_device_mixer,
 	&origen_device_gpiokeys,
+	&exynos4_device_pd[PD_TV],
 };
 
 /* LCD Backlight data */
@@ -181,6 +183,14 @@ static struct platform_pwm_backlight_data origen_bl_data = {
 	.pwm_period_ns = 1000,
 };
 
+static void s5p_tv_setup(void)
+{
+	/* Direct HPD to HDMI chip */
+	gpio_request_one(EXYNOS4_GPX3(7), GPIOF_IN, "hpd-plug");
+	s3c_gpio_cfgpin(EXYNOS4_GPX3(7), S3C_GPIO_SFN(0x3));
+	s3c_gpio_setpull(EXYNOS4_GPX3(7), S3C_GPIO_PULL_NONE);
+}
+
 static void __init origen_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
@@ -200,10 +210,14 @@ static void __init origen_machine_init(void)
 	origen_ehci_init();
 	clk_xusbxti.rate = 24000000;
 
+	s5p_tv_setup();
 	s5p_i2c_hdmiphy_set_platdata(NULL);
 
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 
+	s5p_device_hdmi.dev.parent = &exynos4_device_pd[PD_TV].dev;
+	s5p_device_mixer.dev.parent = &exynos4_device_pd[PD_TV].dev;
+
 	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
 }
 
-- 
1.7.4.1
