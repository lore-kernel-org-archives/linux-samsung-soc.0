From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Add WLAN init on ORIGEN
Date: Thu, 16 Feb 2012 14:55:18 +0000
Message-ID: <1329404118-19198-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:62744 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751708Ab2BPO51 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 09:57:27 -0500
Received: by lagu2 with SMTP id u2so2506084lag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 06:57:25 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sangwook Lee <sangwook.lee@linaro.org>

Add WLAN init code on Origen for both hw2.1.1 and hw2.0 in AR6003

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index e1d87b9..d570667 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -21,6 +21,7 @@
 #include <linux/mfd/max8997.h>
 #include <linux/lcd.h>
 #include <linux/rfkill-gpio.h>
+#include <linux/delay.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -676,6 +677,25 @@ static void __init origen_bt_setup(void)
 	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
 }
 
+static void __init origen_wlan_setup(void)
+{
+	int err;
+
+	err = gpio_request_one(EXYNOS4_GPX2(4),
+			GPIOF_OUT_INIT_LOW, "GPX2_4");
+	if (err) {
+		pr_warning("ORIGEN: Failed to obtain WIFI GPIOs\n");
+		return;
+	}
+	s3c_gpio_cfgpin(EXYNOS4_GPX2(4), S3C_GPIO_OUTPUT);
+	s3c_gpio_setpull(EXYNOS4_GPX2(4),
+			S3C_GPIO_PULL_NONE);
+	/* VDD33,I/O Supply must be done */
+	gpio_set_value(EXYNOS4_GPX2(4), 0);
+	udelay(30);     /*AR6003 speicic value Tb */
+	gpio_direction_output(EXYNOS4_GPX2(4), 1);
+}
+
 static void s5p_tv_setup(void)
 {
 	/* Direct HPD to HDMI chip */
@@ -738,6 +758,7 @@ static void __init origen_machine_init(void)
 	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
 
 	origen_bt_setup();
+	origen_wlan_setup();
 }
 
 MACHINE_START(ORIGEN, "ORIGEN")
-- 
1.7.4.1
