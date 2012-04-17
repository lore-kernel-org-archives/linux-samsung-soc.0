From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 08/12] gpio/samsung: add GPC4 bank instance
Date: Tue, 17 Apr 2012 11:16:31 +0530
Message-ID: <1334641595-25301-9-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22361 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995Ab2DQFil (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:38:41 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L005NNZMDADJ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:40 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:40 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Sangsu Park <sangsu4u.park@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

From: Sangsu Park <sangsu4u.park@samsung.com>

Add GPC4 bank instance which is included in rev1 of Exynos5.

Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/gpio.h |    9 ++++++---
 drivers/gpio/gpio-samsung.c              |    8 ++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/gpio.h b/arch/arm/mach-exynos/include/mach/gpio.h
index d7498af..df5612b 100644
--- a/arch/arm/mach-exynos/include/mach/gpio.h
+++ b/arch/arm/mach-exynos/include/mach/gpio.h
@@ -153,10 +153,11 @@ enum exynos4_gpio_number {
 #define EXYNOS5_GPIO_B2_NR	(4)
 #define EXYNOS5_GPIO_B3_NR	(4)
 #define EXYNOS5_GPIO_C0_NR	(7)
-#define EXYNOS5_GPIO_C1_NR	(7)
+#define EXYNOS5_GPIO_C1_NR	(4)
 #define EXYNOS5_GPIO_C2_NR	(7)
 #define EXYNOS5_GPIO_C3_NR	(7)
-#define EXYNOS5_GPIO_D0_NR	(8)
+#define EXYNOS5_GPIO_C4_NR	(8)
+#define EXYNOS5_GPIO_D0_NR	(4)
 #define EXYNOS5_GPIO_D1_NR	(8)
 #define EXYNOS5_GPIO_Y0_NR	(6)
 #define EXYNOS5_GPIO_Y1_NR	(4)
@@ -199,7 +200,8 @@ enum exynos5_gpio_number {
 	EXYNOS5_GPIO_C1_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_C0),
 	EXYNOS5_GPIO_C2_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_C1),
 	EXYNOS5_GPIO_C3_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_C2),
-	EXYNOS5_GPIO_D0_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_C3),
+	EXYNOS5_GPIO_C4_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_C3),
+	EXYNOS5_GPIO_D0_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_C4),
 	EXYNOS5_GPIO_D1_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_D0),
 	EXYNOS5_GPIO_Y0_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_D1),
 	EXYNOS5_GPIO_Y1_START		= EXYNOS_GPIO_NEXT(EXYNOS5_GPIO_Y0),
@@ -242,6 +244,7 @@ enum exynos5_gpio_number {
 #define EXYNOS5_GPC1(_nr)	(EXYNOS5_GPIO_C1_START + (_nr))
 #define EXYNOS5_GPC2(_nr)	(EXYNOS5_GPIO_C2_START + (_nr))
 #define EXYNOS5_GPC3(_nr)	(EXYNOS5_GPIO_C3_START + (_nr))
+#define EXYNOS5_GPC4(_nr)	(EXYNOS5_GPIO_C4_START + (_nr))
 #define EXYNOS5_GPD0(_nr)	(EXYNOS5_GPIO_D0_START + (_nr))
 #define EXYNOS5_GPD1(_nr)	(EXYNOS5_GPIO_D1_START + (_nr))
 #define EXYNOS5_GPY0(_nr)	(EXYNOS5_GPIO_Y0_START + (_nr))
diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 4627787..0153bb9 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2452,6 +2452,12 @@ static struct samsung_gpio_chip exynos5_gpios_1[] = {
 		},
 	}, {
 		.chip	= {
+			.base	= EXYNOS5_GPC4(0),
+			.ngpio	= EXYNOS5_GPIO_C4_NR,
+			.label	= "GPC4",
+		},
+	}, {
+		.chip	= {
 			.base	= EXYNOS5_GPD0(0),
 			.ngpio	= EXYNOS5_GPIO_D0_NR,
 			.label	= "GPD0",
@@ -2880,6 +2886,8 @@ static __init int samsung_gpiolib_init(void)
 		for (i = 0; i < 4; i++, chip++, gpx_base += 0x20)
 			chip->base = gpx_base;
 
+		exynos5_gpios_1[11].base = gpio_base1 + 0x2E0;
+
 		chip = exynos5_gpios_1;
 		nr_chips = ARRAY_SIZE(exynos5_gpios_1);
 
-- 
1.6.6.rc2
