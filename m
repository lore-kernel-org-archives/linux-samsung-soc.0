From: Donghwa Lee <dh09.lee@samsung.com>
Subject: [PATCH v3] ARM: EXYNOS4: enabled lcd and backlight in NURI board
Date: Mon, 07 Mar 2011 17:37:10 +0900
Message-ID: <1299487030-8675-1-git-send-email-dh09.lee@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50812 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355Ab1CGImI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2011 03:42:08 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHO007VSIIOYX80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 17:35:12 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHO00428IIOI0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 17:35:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kyungmin.park@samsung.com, kgene.kim@samsung.com, dh09.lee@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

This patch enables lcd and backlight drivers in NURI board.

Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Changes since v2:
- code clean and make a pair of gpio_request()/gpio_free()

 arch/arm/mach-exynos4/Kconfig     |    1 +
 arch/arm/mach-exynos4/mach-nuri.c |   74 +++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 5bf00b9..de31e4d 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -135,6 +135,7 @@ config MACH_NURI
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C5
 	select EXYNOS4_SETUP_SDHCI
+	select SAMSUNG_DEV_PWM
 	help
 	  Machine support for Samsung Mobile NURI Board.
 
diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos4/mach-nuri.c
index 28010bd..f18e573 100644
--- a/arch/arm/mach-exynos4/mach-nuri.c
+++ b/arch/arm/mach-exynos4/mach-nuri.c
@@ -17,6 +17,10 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/fixed.h>
 #include <linux/mmc/host.h>
+#include <linux/fb.h>
+#include <linux/pwm_backlight.h>
+
+#include <video/platform_lcd.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -181,6 +185,73 @@ static struct platform_device nuri_gpio_keys = {
 	},
 };
 
+static void nuri_lcd_power_on(struct plat_lcd_data *pd, unsigned int power)
+{
+	int gpio = EXYNOS4_GPE1(5);
+
+	gpio_request(gpio, "LVDS_nSHDN");
+	gpio_direction_output(gpio, power);
+	gpio_free(gpio);
+}
+
+static int nuri_bl_init(struct device *dev)
+{
+	int ret, gpio = EXYNOS4_GPE2(3);
+
+	ret = gpio_request(gpio, "LCD_LDO_EN");
+	if (!ret)
+		gpio_direction_output(gpio, 0);
+
+	return ret;
+}
+
+static int nuri_bl_notify(struct device *dev, int brightness)
+{
+	if (brightness < 1)
+		brightness = 0;
+
+	gpio_set_value(EXYNOS4_GPE2(3), 1);
+
+	return brightness;
+}
+
+static void nuri_bl_exit(struct device *dev)
+{
+	gpio_free(EXYNOS4_GPE2(3));
+}
+
+/* nuri pwm backlight */
+static struct platform_pwm_backlight_data nuri_backlight_data = {
+	.pwm_id			= 0,
+	.pwm_period_ns		= 30000,
+	.max_brightness		= 100,
+	.dft_brightness		= 50,
+	.init			= nuri_bl_init,
+	.notify			= nuri_bl_notify,
+	.exit			= nuri_bl_exit,
+};
+
+static struct platform_device nuri_backlight_device = {
+	.name			= "pwm-backlight",
+	.id			= -1,
+	.dev			= {
+		.parent		= &s3c_device_timer[0].dev,
+		.platform_data	= &nuri_backlight_data,
+	},
+};
+
+static struct plat_lcd_data nuri_lcd_platform_data = {
+	.set_power		= nuri_lcd_power_on,
+};
+
+static struct platform_device nuri_lcd_device = {
+	.name			= "platform-lcd",
+	.id			= -1,
+	.dev			= {
+		.platform_data	= &nuri_lcd_platform_data,
+	},
+};
+
 /* I2C1 */
 static struct i2c_board_info i2c1_devs[] __initdata = {
 	/* Gyro, To be updated */
@@ -201,8 +272,11 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&s3c_device_wdt,
 #endif
 
+	&s3c_device_timer[0],
 	/* NURI Devices */
 	&nuri_gpio_keys,
+	&nuri_lcd_device,
+	&nuri_backlight_device,
 };
 
 static void __init nuri_map_io(void)
-- 
1.6.0.4
