From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH v2] ARM: EXYNOS: Add WLAN init on ORIGEN
Date: Mon, 27 Feb 2012 14:11:06 +0000
Message-ID: <1330351866-6446-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:54726 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752881Ab2B0ONN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Feb 2012 09:13:13 -0500
Received: by wejx9 with SMTP id x9so293266wej.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2012 06:13:11 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sangwook Lee <sangwook.lee@linaro.org>

Add WLAN init code on Origen for both hw2.1.1 and hw2.0 in AR6003

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 02c242e..821b57a 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -21,6 +21,7 @@
 #include <linux/mfd/max8997.h>
 #include <linux/lcd.h>
 #include <linux/rfkill-gpio.h>
+#include <linux/delay.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -668,6 +669,22 @@ static void __init origen_bt_setup(void)
 	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
 }
 
+static void __init origen_wlan_setup(void)
+{
+	int err;
+
+	/* EXYNOS4_GPX2(4) is reset pin to the external chip */
+	err = gpio_request_one(EXYNOS4_GPX2(4), GPIOF_OUT_INIT_LOW, "GPX2_4");
+	if (err) {
+		pr_warning("ORIGEN: Failed to obtain WIFI GPIOs\n");
+		return;
+	}
+	s3c_gpio_setpull(EXYNOS4_GPX2(4), S3C_GPIO_PULL_NONE);
+	gpio_set_value(EXYNOS4_GPX2(4), 0);
+	udelay(30);     /*AR6003 specific value Tb */
+	gpio_set_value(EXYNOS4_GPX2(4), 1);
+}
+
 static void s5p_tv_setup(void)
 {
 	/* Direct HPD to HDMI chip */
@@ -723,6 +740,7 @@ static void __init origen_machine_init(void)
 	samsung_bl_set(&origen_bl_gpio_info, &origen_bl_data);
 
 	origen_bt_setup();
+	origen_wlan_setup();
 }
 
 MACHINE_START(ORIGEN, "ORIGEN")
-- 
1.7.4.1
