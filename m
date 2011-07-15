From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH 2/8] ARM: EXYNOS4: Add PWM backlight support on Samsung
 SMDKV310 board
Date: Fri, 15 Jul 2011 20:12:42 +0530
Message-ID: <1310740968-26722-3-git-send-email-banajit.g@samsung.com>
References: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48846 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752515Ab1GOOmX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 10:42:23 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOD002VDQ6F5O80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:22 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOD00F3JQ6EZC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:22 +0900 (KST)
In-reply-to: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jg1.han@samsung.com

This patch adds support for LCD backlight using PWM timer for
Samsung SMDKV310 board.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c |   16 ++++++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 5115b90..e27f044 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -128,8 +128,10 @@ config MACH_SMDKV310
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
 	select EXYNOS4_DEV_AHCI
+	select SAMSUNG_DEV_BACKLIGHT
 	select SAMSUNG_DEV_KEYPAD
 	select EXYNOS4_DEV_PD
+	select SAMSUNG_DEV_PWM
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_KEYPAD
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index be16236..e85d646 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/pwm_backlight.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -29,6 +30,8 @@
 #include <plat/sdhci.h>
 #include <plat/iic.h>
 #include <plat/pd.h>
+#include <plat/gpio-cfg.h>
+#include <plat/backlight.h>
 
 #include <mach/map.h>
 
@@ -210,6 +213,17 @@ static void __init smdkv310_smsc911x_init(void)
 		     (0x1 << S5P_SROM_BCX__TACS__SHIFT), S5P_SROM_BC1);
 }
 
+/* LCD Backlight data */
+static struct samsung_bl_gpio_info smdkv310_bl_gpio_info = {
+	.no = EXYNOS4_GPD0(1),
+	.func = S3C_GPIO_SFN(2),
+};
+
+static struct platform_pwm_backlight_data smdkv310_bl_data = {
+	.pwm_id = 1,
+	.pwm_period_ns  = 1000,
+};
+
 static void __init smdkv310_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
@@ -231,6 +245,8 @@ static void __init smdkv310_machine_init(void)
 
 	samsung_keypad_set_platdata(&smdkv310_keypad_data);
 
+	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
+
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
 }
 
-- 
1.7.2.3
