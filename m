From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v3 3/6] Exynos4 NURI: configure MAX17042 fuel gauge
Date: Thu, 30 Jun 2011 17:15:26 +0900
Message-ID: <1309421729-11172-4-git-send-email-myungjoo.ham@samsung.com>
References: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11898 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757684Ab1F3IQV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 04:16:21 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00CUIG9UNIK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:30 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL00H32G9TNU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:15:29 +0900 (KST)
In-reply-to: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, tushar.behera@linaro.org

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
--
changed from v2
- Moved locations
---
 arch/arm/mach-exynos4/mach-nuri.c |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos4/mach-nuri.c
index ec51f5c..2467a2a 100644
--- a/arch/arm/mach-exynos4/mach-nuri.c
+++ b/arch/arm/mach-exynos4/mach-nuri.c
@@ -13,8 +13,10 @@
 #include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/i2c/atmel_mxt_ts.h>
+#include <linux/i2c-gpio.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio.h>
+#include <linux/power/max17042_battery.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/fixed.h>
 #include <linux/mfd/max8997.h>
@@ -954,6 +956,29 @@ static struct i2c_board_info i2c5_devs[] __initdata = {
 	},
 };
 
+static struct max17042_platform_data nuri_battery_platform_data = {
+};
+
+/* GPIO I2C 9 (Fuel Gauge) */
+static struct i2c_gpio_platform_data i2c9_gpio_data = {
+	.sda_pin		= EXYNOS4_GPY4(0),      /* XM0ADDR_8 */
+	.scl_pin		= EXYNOS4_GPY4(1),      /* XM0ADDR_9 */
+};
+static struct platform_device i2c9_gpio = {
+	.name			= "i2c-gpio",
+	.id			= 9,
+	.dev			= {
+		.platform_data	= &i2c9_gpio_data,
+	},
+};
+enum { I2C9_MAX17042};
+static struct i2c_board_info i2c9_devs[] __initdata = {
+	[I2C9_MAX17042] = {
+		I2C_BOARD_INFO("max17042", 0x36),
+		.platform_data = &nuri_battery_platform_data,
+	},
+};
+
 static void __init nuri_power_init(void)
 {
 	int gpio;
@@ -966,6 +991,11 @@ static void __init nuri_power_init(void)
 	gpio_request(gpio, "AP_PMIC_IRQ");
 	s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
 	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
+
+	gpio = EXYNOS4_GPX2(3);
+	gpio_request(gpio, "FUEL_ALERT");
+	s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
+	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
 }
 
 /* USB EHCI */
@@ -989,6 +1019,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&s3c_device_timer[0],
 	&s5p_device_ehci,
 	&s3c_device_i2c3,
+	&i2c9_gpio,
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
@@ -1015,6 +1046,8 @@ static void __init nuri_machine_init(void)
 	s3c_i2c5_set_platdata(NULL);
 	i2c5_devs[I2C5_MAX8997].irq = gpio_to_irq(EXYNOS4_GPX0(7));
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
+	i2c9_devs[I2C9_MAX17042].irq = gpio_to_irq(EXYNOS4_GPX2(3));
+	i2c_register_board_info(9, i2c9_devs, ARRAY_SIZE(i2c9_devs));
 
 	nuri_ehci_init();
 	clk_xusbxti.rate = 24000000;
-- 
1.7.4.1
