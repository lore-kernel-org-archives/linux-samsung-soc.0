From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix on drive strength value
Date: Mon, 30 Aug 2010 10:47:20 +0900
Message-ID: <1283132840-22752-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45596 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754187Ab0H3CE4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Aug 2010 22:04:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes on defined drive strength value for GPIO.
According to data sheet, if we want drive strength 1x, the value
should be 00(b), if 2x should be 10(b), if 3x should be 01(b),
and if 4x should be 11(b). Also fixes comment(from S5C to S5P).

Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/include/plat/gpio-cfg.h |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg.h b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
index db4112c..1c6b929 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
@@ -143,12 +143,12 @@ extern s3c_gpio_pull_t s3c_gpio_getpull(unsigned int pin);
 /* Define values for the drvstr available for each gpio pin.
  *
  * These values control the value of the output signal driver strength,
- * configurable on most pins on the S5C series.
+ * configurable on most pins on the S5P series.
  */
-#define S5P_GPIO_DRVSTR_LV1	((__force s5p_gpio_drvstr_t)0x00)
-#define S5P_GPIO_DRVSTR_LV2	((__force s5p_gpio_drvstr_t)0x01)
-#define S5P_GPIO_DRVSTR_LV3	((__force s5p_gpio_drvstr_t)0x10)
-#define S5P_GPIO_DRVSTR_LV4	((__force s5p_gpio_drvstr_t)0x11)
+#define S5P_GPIO_DRVSTR_LV1	((__force s5p_gpio_drvstr_t)0x0)
+#define S5P_GPIO_DRVSTR_LV2	((__force s5p_gpio_drvstr_t)0x2)
+#define S5P_GPIO_DRVSTR_LV3	((__force s5p_gpio_drvstr_t)0x1)
+#define S5P_GPIO_DRVSTR_LV4	((__force s5p_gpio_drvstr_t)0x3)
 
 /**
  * s5c_gpio_get_drvstr() - get the driver streght value of a gpio pin
-- 
1.6.2.5
