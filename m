From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Add keypad support for Origen
Date: Thu, 15 Sep 2011 09:02:52 +0530
Message-ID: <1316057572-13719-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f42.google.com ([74.125.83.42]:50185 "EHLO
	mail-gw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754112Ab1IODgm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 23:36:42 -0400
Received: by gwb17 with SMTP id 17so2763612gwb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 20:36:41 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

This patch adds keypad support for Origen board as GPIO keys.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/mach-origen.c |   58 +++++++++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..61da36b 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/input.h>
+#include <linux/gpio_keys.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -79,10 +80,67 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
+static struct gpio_keys_button origen_gpio_keys_table[] = {
+	{
+		.code = KEY_MENU,
+		.gpio = EXYNOS4_GPX1(5),
+		.desc = "gpio-keys: KEY_MENU",
+		.type = EV_KEY,
+		.active_low = 1,
+		.wakeup = 1,
+		.debounce_interval = 1,
+	}, {
+		.code = KEY_HOME,
+		.gpio = EXYNOS4_GPX1(6),
+		.desc = "gpio-keys: KEY_HOME",
+		.type = EV_KEY,
+		.active_low = 1,
+		.wakeup = 1,
+		.debounce_interval = 1,
+	}, {
+		.code = KEY_BACK,
+		.gpio = EXYNOS4_GPX1(7),
+		.desc = "gpio-keys: KEY_BACK",
+		.type = EV_KEY,
+		.active_low = 1,
+		.wakeup = 1,
+		.debounce_interval = 1,
+	}, {
+		.code = KEY_UP,
+		.gpio = EXYNOS4_GPX2(0),
+		.desc = "gpio-keys: KEY_UP",
+		.type = EV_KEY,
+		.active_low = 1,
+		.wakeup = 1,
+		.debounce_interval = 1,
+	}, {
+		.code = KEY_DOWN,
+		.gpio = EXYNOS4_GPX2(1),
+		.desc = "gpio-keys: KEY_DOWN",
+		.type = EV_KEY,
+		.active_low = 1,
+		.wakeup = 1,
+		.debounce_interval = 1,
+	},
+};
+
+static struct gpio_keys_platform_data origen_gpio_keys_data = {
+	.buttons = origen_gpio_keys_table,
+	.nbuttons = ARRAY_SIZE(origen_gpio_keys_table),
+};
+
+static struct platform_device origen_device_gpiokeys = {
+	.name = "gpio-keys",
+	.dev = {
+		.platform_data = &origen_gpio_keys_data,
+	},
+};
+
 static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&origen_device_gpiokeys,
 };
 
 static void __init origen_map_io(void)
-- 
1.7.4.1
