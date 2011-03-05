From: Naveen Krishna Ch <ch.naveen@samsung.com>
Subject: [PATCH 4/4] ARM: EXYNOS4: Add keypad device to the SMDKV310
Date: Sat,  5 Mar 2011 10:25:17 +0900
Message-ID: <1299288317-13740-5-git-send-email-ch.naveen@samsung.com>
References: <1299288317-13740-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:44023 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759886Ab1CEBxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Mar 2011 20:53:40 -0500
In-Reply-To: <1299288317-13740-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>

This patch is to support keypad device to the SMDKV310 board.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c |   24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 14930a7..9a27b93 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -107,9 +107,11 @@ config MACH_SMDKV310
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
+	select SAMSUNG_DEV_KEYPAD
 	select EXYNOS4_DEV_PD
 	select EXYNOS4_DEV_SYSMMU
 	select EXYNOS4_SETUP_I2C1
+	select EXYNOS4_SETUP_KEYPAD
 	select EXYNOS4_SETUP_SDHCI
 	help
 	  Machine support for Samsung SMDKV310
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 07860a5..88e0275 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -15,6 +15,7 @@
 #include <linux/smsc911x.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
+#include <linux/input.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -24,6 +25,7 @@
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/keypad.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
 #include <plat/pd.h>
@@ -142,6 +144,25 @@ static struct platform_device smdkv310_smsc911x = {
 	},
 };
 
+static uint32_t smdkv310_keymap[] __initdata = {
+	/* KEY(row, col, keycode) */
+	KEY(0, 3, KEY_1), KEY(0, 4, KEY_2), KEY(0, 5, KEY_3),
+	KEY(0, 6, KEY_4), KEY(0, 7, KEY_5),
+	KEY(1, 3, KEY_A), KEY(1, 4, KEY_B), KEY(1, 5, KEY_C),
+	KEY(1, 6, KEY_D), KEY(1, 7, KEY_E)
+};
+
+static struct matrix_keymap_data smdkv310_keymap_data __initdata = {
+	.keymap		= smdkv310_keymap,
+	.keymap_size	= ARRAY_SIZE(smdkv310_keymap),
+};
+
+static struct samsung_keypad_platdata smdkv310_keypad_data __initdata = {
+	.keymap_data	= &smdkv310_keymap_data,
+	.rows		= 2,
+	.cols		= 8,
+};
+
 static struct i2c_board_info i2c_devs1[] __initdata = {
 	{I2C_BOARD_INFO("wm8994", 0x1a),},
 };
@@ -156,6 +177,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_wdt,
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
+	&samsung_device_keypad,
 	&exynos4_device_pd[PD_MFC],
 	&exynos4_device_pd[PD_G3D],
 	&exynos4_device_pd[PD_LCD0],
@@ -210,6 +232,8 @@ static void __init smdkv310_machine_init(void)
 	s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
 	s3c_sdhci3_set_platdata(&smdkv310_hsmmc3_pdata);
 
+	samsung_keypad_set_platdata(&smdkv310_keypad_data);
+
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
 }
 
-- 
1.7.1
