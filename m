From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/3] ARM: Exynos4: Universal_C210: add qt602240 touch screen
 device
Date: Tue, 07 Jun 2011 09:02:59 +0200
Message-ID: <1307430179-15891-4-git-send-email-m.szyprowski@samsung.com>
References: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61570 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751431Ab1FGHDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 03:03:05 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LME0041RRL11F50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:02 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LME0007LRL0FV@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:01 +0100 (BST)
In-reply-to: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds definitions to enable support for qt602240 touch screen
driver for Universal C210 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

---
 arch/arm/mach-exynos4/Kconfig               |    2 +
 arch/arm/mach-exynos4/mach-universal_c210.c |   47 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 0848243..1413778 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -162,9 +162,11 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
 	select S3C_DEV_I2C1
+	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
 	select S5P_DEV_ONENAND
 	select EXYNOS4_SETUP_I2C1
+	select EXYNOS4_SETUP_I2C3
 	select EXYNOS4_SETUP_I2C5
 	select EXYNOS4_SETUP_SDHCI
 	help
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 53bf35f..565974a 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -20,6 +20,7 @@
 #include <linux/mmc/host.h>
 #include <linux/i2c-gpio.h>
 #include <linux/i2c/mcs.h>
+#include <linux/i2c/atmel_mxt_ts.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -29,6 +30,7 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/iic.h>
+#include <plat/gpio-cfg.h>
 #include <plat/sdhci.h>
 
 #include <mach/map.h>
@@ -479,6 +481,46 @@ static struct i2c_board_info i2c5_devs[] __initdata = {
 	},
 };
 
+/* I2C3 (TSP) */
+static struct mxt_platform_data qt602240_platform_data = {
+	.x_line		= 19,
+	.y_line		= 11,
+	.x_size		= 800,
+	.y_size		= 480,
+	.blen		= 0x11,
+	.threshold	= 0x28,
+	.voltage	= 2800000,              /* 2.8V */
+	.orient		= MXT_DIAGONAL,
+};
+
+static struct i2c_board_info i2c3_devs[] __initdata = {
+	{
+		I2C_BOARD_INFO("qt602240_ts", 0x4a),
+		.platform_data = &qt602240_platform_data,
+	},
+};
+
+static void __init universal_tsp_init(void)
+{
+	int gpio;
+
+	/* TSP_LDO_ON: XMDMADDR_11 */
+	gpio = EXYNOS4_GPE2(3);
+	gpio_request(gpio, "TSP_LDO_ON");
+	gpio_direction_output(gpio, 1);
+	gpio_export(gpio, 0);
+
+	/* TSP_INT: XMDMADDR_7 */
+	gpio = EXYNOS4_GPE1(7);
+	gpio_request(gpio, "TSP_INT");
+
+	s5p_register_gpio_interrupt(gpio);
+	s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
+	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_UP);
+	i2c3_devs[0].irq = gpio_to_irq(gpio);
+}
+
+
 /* GPIO I2C 12 (3 Touchkey) */
 static uint32_t touchkey_keymap[] = {
 	/* MCS_KEY_MAP(value, keycode) */
@@ -668,6 +710,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
+	&s3c_device_i2c3,
 	&s3c_device_i2c5,
 
 	/* Universal Devices */
@@ -690,6 +733,10 @@ static void __init universal_machine_init(void)
 	i2c_register_board_info(0, i2c0_devs, ARRAY_SIZE(i2c0_devs));
 	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
 
+	universal_tsp_init();
+	s3c_i2c3_set_platdata(NULL);
+	i2c_register_board_info(3, i2c3_devs, ARRAY_SIZE(i2c3_devs));
+
 	s3c_i2c5_set_platdata(NULL);
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
 
-- 
1.7.1.569.g6f426
