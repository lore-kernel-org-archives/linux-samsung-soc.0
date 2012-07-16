From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2] ARM: EXYNOS: Add touchscreen support to SMDK4X12
Date: Mon, 16 Jul 2012 12:12:56 +0530
Message-ID: <1342420976-25068-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:64955 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab2GPGnV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 02:43:21 -0400
Received: by gglu4 with SMTP id u4so4701733ggl.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jul 2012 23:43:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Pixcir touchscreen device support is added to SMDK4X12 boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
This patch is based on Kukjin Kim's latest for-next branch.

Changes since v1:
Incorporated Kukjin's review comments
-reduced mdelay
-removed a unnecessary gpio
---
 arch/arm/mach-exynos/mach-smdk4x12.c |   31 ++++++++++++++++++++++++++++++-
 1 files changed, 30 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index 2623f3b..b3207ea 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -9,9 +9,11 @@
  * published by the Free Software Foundation.
 */
 
+#include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/input/pixcir_ts.h>
 #include <linux/io.h>
 #include <linux/lcd.h>
 #include <linux/mfd/max8997.h>
@@ -207,8 +209,33 @@ static struct i2c_board_info smdk4x12_i2c_devs3[] __initdata = {
 	/* nothing here yet */
 };
 
+static void smdk4x12_ts_gpio_setup(void)
+{
+	int gpio_reset = EXYNOS4_GPM3(4);
+
+	gpio_request_one(gpio_reset, GPIOF_OUT_INIT_LOW, "TOUCH RESET");
+	mdelay(2);
+	gpio_direction_output(gpio_reset, 1);
+	mdelay(30);
+}
+
+static int smdk4x12_ts_get_value(void)
+{
+	return 1;
+}
+
+static struct pixcir_ts_platform_data smdk4x12_ts_data = {
+	.attb_read_val = smdk4x12_ts_get_value,
+	.x_max = 480,
+	.y_max = 800,
+};
+
 static struct i2c_board_info smdk4x12_i2c_devs7[] __initdata = {
-	/* nothing here yet */
+	{
+		I2C_BOARD_INFO("pixcir_ts", 0x5C),
+		.irq		= IRQ_EINT(22),
+		.platform_data	= &smdk4x12_ts_data,
+	}
 };
 
 static struct samsung_bl_gpio_info smdk4x12_bl_gpio_info = {
@@ -336,6 +363,8 @@ static void __init smdk4x12_machine_init(void)
 
 	s5p_fimd0_set_platdata(&smdk4x12_lcd_pdata);
 
+	smdk4x12_ts_gpio_setup();
+
 	platform_add_devices(smdk4x12_devices, ARRAY_SIZE(smdk4x12_devices));
 }
 
-- 
1.7.4.1
