From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 2/7] ARM: EXYNOS5: add machine specific support for backlight
Date: Wed, 11 Jul 2012 14:54:36 +0530
Message-ID: <1341998681-1888-3-git-send-email-l.krishna@samsung.com>
References: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44051 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753844Ab2GKJKu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 05:10:50 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z00MGRO45VN40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:10:49 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z008NXO5HIZ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 18:10:49 +0900 (KST)
In-reply-to: <1341998681-1888-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, prashanth.g@samsung.com

Adds machine specific support for LCD backlight for SMDK board based
on Exynos5

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/mach-exynos/Kconfig           |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c |   28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 498596b..a2a2940 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -412,6 +412,7 @@ config MACH_EXYNOS5_DT
 	select SOC_EXYNOS5250
 	select USE_OF
 	select ARM_AMBA
+	select SAMSUNG_DEV_BACKLIGHT
 	help
 	  Machine support for Samsung Exynos4 machine with device tree enabled.
 	  Select this if a fdt blob is available for the EXYNOS4 SoC based board.
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 7b1e11a..0a200fd 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -11,6 +11,8 @@
 
 #include <linux/of_platform.h>
 #include <linux/serial_core.h>
+#include <linux/pwm_backlight.h>
+#include <linux/gpio.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -18,9 +20,34 @@
 
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
+#include <plat/backlight.h>
+#include <plat/gpio-cfg.h>
 
 #include "common.h"
 
+
+static int smdk5250_bl_notify(struct device *unused, int brightness)
+{
+	/* manage lcd_bl_en signal */
+	if (brightness)
+		gpio_set_value(EXYNOS5_GPX3(0), 1);
+	else
+		gpio_set_value(EXYNOS5_GPX3(0), 0);
+
+	return brightness;
+}
+
+/* LCD Backlight data */
+static struct samsung_bl_gpio_info smdk5250_bl_gpio_info = {
+	.no	= EXYNOS5_GPB2(0),
+	.func	= S3C_GPIO_SFN(2),
+};
+
+static struct platform_pwm_backlight_data smdk5250_bl_data = {
+	.pwm_period_ns	= 1000000,
+	.notify		= smdk5250_bl_notify,
+};
+
 /*
  * The following lookup table is used to override device names when devices
  * are registered from device tree. This is temporarily added to enable
@@ -61,6 +88,7 @@ static void __init exynos5250_dt_map_io(void)
 
 static void __init exynos5250_dt_machine_init(void)
 {
+	samsung_bl_set(&smdk5250_bl_gpio_info, &smdk5250_bl_data);
 	of_platform_populate(NULL, of_default_bus_match_table,
 				exynos5250_auxdata_lookup, NULL);
 }
-- 
1.7.0.4
