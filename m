From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable MFC on Samsung SMDKV310
Date: Mon, 25 Jul 2011 16:52:22 +0530
Message-ID: <1311592942-6195-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:34159 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751719Ab1GYLXj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 07:23:39 -0400
Received: by ywe9 with SMTP id 9so2143164ywe.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2011 04:23:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---

This patch is based on Kukjin's for-arm-soc branch.

 arch/arm/mach-exynos4/Kconfig         |    1 +
 arch/arm/mach-exynos4/mach-smdkv310.c |   11 +++++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 9d62e13..8da2960 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -139,6 +139,7 @@ config MACH_SMDKV310
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
 	select S3C_DEV_I2C1
+	select S5P_DEV_MFC
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index ea41495..2a128f4 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -32,6 +32,7 @@
 #include <plat/pd.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
+#include <plat/mfc.h>
 
 #include <mach/map.h>
 
@@ -177,6 +178,9 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&samsung_device_keypad,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
 	&exynos4_device_pd[PD_MFC],
 	&exynos4_device_pd[PD_G3D],
 	&exynos4_device_pd[PD_LCD0],
@@ -233,6 +237,11 @@ static void __init smdkv310_map_io(void)
 	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
 }
 
+static void __init smdkv310_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init smdkv310_machine_init(void)
 {
 	s3c_i2c1_set_platdata(NULL);
@@ -250,6 +259,7 @@ static void __init smdkv310_machine_init(void)
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
 
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
+	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 }
 
 MACHINE_START(SMDKV310, "SMDKV310")
@@ -260,4 +270,5 @@ MACHINE_START(SMDKV310, "SMDKV310")
 	.map_io		= smdkv310_map_io,
 	.init_machine	= smdkv310_machine_init,
 	.timer		= &exynos4_timer,
+	.reserve	= &smdkv310_reserve,
 MACHINE_END
-- 
1.7.4.1
