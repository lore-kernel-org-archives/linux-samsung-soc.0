From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] ARM: Exynos4: Universal_C210: add MCS Touchkey device
Date: Tue, 07 Jun 2011 09:02:58 +0200
Message-ID: <1307430179-15891-3-git-send-email-m.szyprowski@samsung.com>
References: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38101 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751438Ab1FGHDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 03:03:05 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LME00E75RL1IK@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:02 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LME00MJLRL083@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:01 +0100 (BST)
In-reply-to: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds definitions to enable support for MCS Touchkey driver
for Universal C210 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

---
 arch/arm/mach-exynos4/Kconfig               |    1 +
 arch/arm/mach-exynos4/mach-universal_c210.c |   57 +++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 32a96f4..0848243 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -153,6 +153,7 @@ config MACH_ARMLEX4210
 config MACH_UNIVERSAL_C210
 	bool "Mobile UNIVERSAL_C210 Board"
 	select CPU_EXYNOS4210
+	select S5P_GPIO_INT
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 65f8d62..53bf35f 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -18,6 +18,8 @@
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/max8952.h>
 #include <linux/mmc/host.h>
+#include <linux/i2c-gpio.h>
+#include <linux/i2c/mcs.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
@@ -477,6 +479,56 @@ static struct i2c_board_info i2c5_devs[] __initdata = {
 	},
 };
 
+/* GPIO I2C 12 (3 Touchkey) */
+static uint32_t touchkey_keymap[] = {
+	/* MCS_KEY_MAP(value, keycode) */
+	MCS_KEY_MAP(0, KEY_MENU),		/* KEY_SEND */
+	MCS_KEY_MAP(1, KEY_BACK),		/* KEY_END */
+};
+
+static struct mcs_platform_data touchkey_data = {
+	.keymap		= touchkey_keymap,
+	.keymap_size	= ARRAY_SIZE(touchkey_keymap),
+	.key_maxval	= 2,
+};
+
+/* GPIO I2C 3_TOUCH 2.8V */
+#define I2C_GPIO_BUS_12		12
+static struct i2c_gpio_platform_data i2c_gpio12_data = {
+	.sda_pin	= EXYNOS4_GPE4(0),      /* XMDMDATA_8 */
+	.scl_pin	= EXYNOS4_GPE4(1),      /* XMDMDATA_9 */
+};
+
+static struct platform_device i2c_gpio12 = {
+	.name		= "i2c-gpio",
+	.id		= I2C_GPIO_BUS_12,
+	.dev		= {
+		.platform_data	= &i2c_gpio12_data,
+	},
+};
+
+static struct i2c_board_info i2c_gpio12_devs[] __initdata = {
+	{
+		I2C_BOARD_INFO("mcs5080_touchkey", 0x20),
+		.platform_data = &touchkey_data,
+	},
+};
+
+static void __init universal_touchkey_init(void)
+{
+	int gpio;
+
+	gpio = EXYNOS4_GPE3(7);			/* XMDMDATA_7 */
+	gpio_request(gpio, "3_TOUCH_INT");
+	s5p_register_gpio_interrupt(gpio);
+	s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
+	i2c_gpio12_devs[0].irq = gpio_to_irq(gpio);
+
+	gpio = EXYNOS4_GPE3(3);			/* XMDMDATA_3 */
+	gpio_request(gpio, "3_TOUCH_EN");
+	gpio_direction_output(gpio, 1);
+}
+
 /* GPIO KEYS */
 static struct gpio_keys_button universal_gpio_keys_tables[] = {
 	{
@@ -619,6 +671,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s3c_device_i2c5,
 
 	/* Universal Devices */
+	&i2c_gpio12,
 	&universal_gpio_keys,
 	&s5p_device_onenand,
 };
@@ -640,6 +693,10 @@ static void __init universal_machine_init(void)
 	s3c_i2c5_set_platdata(NULL);
 	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
 
+	universal_touchkey_init();
+	i2c_register_board_info(I2C_GPIO_BUS_12, i2c_gpio12_devs,
+			ARRAY_SIZE(i2c_gpio12_devs));
+
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
 }
-- 
1.7.1.569.g6f426
