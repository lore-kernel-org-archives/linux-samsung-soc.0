From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable MFC on Origen
Date: Fri, 30 Sep 2011 16:01:52 +0530
Message-ID: <1317378712-12287-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:56992 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754105Ab1I3Kg0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Sep 2011 06:36:26 -0400
Received: by pzk1 with SMTP id 1so4070658pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Sep 2011 03:36:26 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

This patch enables multi-format codec (MFC) support on Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
PD related code in KConfig and header are added only because for-next branch of 
Kgene's tree does not have it enabled yet.

---
 arch/arm/mach-exynos4/Kconfig       |    2 ++
 arch/arm/mach-exynos4/mach-origen.c |   13 +++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index d0491c2..93f9a62 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -243,6 +243,8 @@ config MACH_ORIGEN
 	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_TV
 	select S5P_DEV_USB_EHCI
+	select S5P_DEV_MFC
+	select EXYNOS4_DEV_PD
 	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_PWM
 	select EXYNOS4_SETUP_SDHCI
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index 421294b..4e53d10 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -30,6 +30,8 @@
 #include <plat/clock.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
+#include <plat/mfc.h>
+#include <plat/pd.h>
 
 #include <mach/map.h>
 
@@ -167,6 +169,10 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_hdmi,
 	&s5p_device_i2c_hdmiphy,
 	&s5p_device_mixer,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
+	&exynos4_device_pd[PD_MFC],
 	&origen_device_gpiokeys,
 };
 
@@ -188,6 +194,11 @@ static void __init origen_map_io(void)
 	s3c24xx_init_uarts(origen_uartcfgs, ARRAY_SIZE(origen_uartcfgs));
 }
 
+static void __init origen_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init origen_machine_init(void)
 {
 	/*
@@ -203,6 +214,7 @@ static void __init origen_machine_init(void)
 	s5p_i2c_hdmiphy_set_platdata(NULL);
 
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
+	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 
 	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
 }
@@ -214,4 +226,5 @@ MACHINE_START(ORIGEN, "ORIGEN")
 	.map_io		= origen_map_io,
 	.init_machine	= origen_machine_init,
 	.timer		= &exynos4_timer,
+	.reserve	= &origen_reserve,
 MACHINE_END
-- 
1.7.4.1
