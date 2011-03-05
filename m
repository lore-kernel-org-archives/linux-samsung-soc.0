From: Naveen Krishna Ch <ch.naveen@samsung.com>
Subject: [PATCH 1/4] ARM: EXYNOS4: Add keypad device helpers
Date: Sat,  5 Mar 2011 10:25:14 +0900
Message-ID: <1299288317-13740-2-git-send-email-ch.naveen@samsung.com>
References: <1299288317-13740-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:44017 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759345Ab1CEBxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Mar 2011 20:53:40 -0500
In-Reply-To: <1299288317-13740-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Naveen Krishna Ch <ch.naveen@samsung.com>

This patch adds the samsung_keypad_cfg_gpio() for EXYNOS4.
Now, this helpers are only for keypad operating in PORT-0.

Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig        |    5 ++++
 arch/arm/mach-exynos4/Makefile       |    1 +
 arch/arm/mach-exynos4/setup-keypad.c |   35 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/setup-keypad.c

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index d3893f6..14930a7 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -60,6 +60,11 @@ config EXYNOS4_SETUP_I2C7
 	help
 	  Common setup code for i2c bus 7.
 
+config EXYNOS4_SETUP_KEYPAD
+	bool
+	help
+	  Common setup code for keypad.
+
 config EXYNOS4_SETUP_SDHCI
 	bool
 	select EXYNOS4_SETUP_SDHCI_GPIO
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index 45422cb..c13fd36 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_EXYNOS4_SETUP_I2C4)	+= setup-i2c4.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C5)	+= setup-i2c5.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C6)	+= setup-i2c6.o
 obj-$(CONFIG_EXYNOS4_SETUP_I2C7)	+= setup-i2c7.o
+obj-$(CONFIG_EXYNOS4_SETUP_KEYPAD)	+= setup-keypad.o
 obj-$(CONFIG_EXYNOS4_SETUP_SDHCI)	+= setup-sdhci.o
 obj-$(CONFIG_EXYNOS4_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
diff --git a/arch/arm/mach-exynos4/setup-keypad.c b/arch/arm/mach-exynos4/setup-keypad.c
new file mode 100644
index 0000000..1ee0ebf
--- /dev/null
+++ b/arch/arm/mach-exynos4/setup-keypad.c
@@ -0,0 +1,35 @@
+/* linux/arch/arm/mach-exynos4/setup-keypad.c
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * GPIO configuration for Exynos4 KeyPad device
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/gpio.h>
+#include <plat/gpio-cfg.h>
+
+void samsung_keypad_cfg_gpio(unsigned int rows, unsigned int cols)
+{
+	/* Keypads can be of various combinations, Just making sure */
+
+	if (rows > 8) {
+		/* Set all the necessary GPX2 pins: KP_ROW[0~7] */
+		s3c_gpio_cfgrange_nopull(EXYNOS4_GPX2(0), 8, S3C_GPIO_SFN(3));
+
+		/* Set all the necessary GPX3 pins: KP_ROW[8~] */
+		s3c_gpio_cfgrange_nopull(EXYNOS4_GPX3(0), (rows - 8),
+					 S3C_GPIO_SFN(3));
+	} else {
+		/* Set all the necessary GPX2 pins: KP_ROW[x] */
+		s3c_gpio_cfgrange_nopull(EXYNOS4_GPX2(0), rows,
+					 S3C_GPIO_SFN(3));
+	}
+
+	/* Set all the necessary GPX1 pins to special-function 3: KP_COL[x] */
+	s3c_gpio_cfgrange_nopull(EXYNOS4_GPX1(0), cols, S3C_GPIO_SFN(3));
+}
-- 
1.7.1
