From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] gpio/samsung: Fix incorrect gpio pull up/down callback for
 Exynos4
Date: Sun, 09 Oct 2011 23:57:13 +0530
Message-ID: <1318184833-32056-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:8496 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112Ab1JISZz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Oct 2011 14:25:55 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LST00JW39V6L710@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 03:25:54 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LST00IIW9UZPC70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 03:25:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, grant.likely@secretlab.ca

Some of the gpio chips of exynos4 are assigned a default gpio config without
the exynos4 specific pull up/down callbacks which resulted in incorrect
setting of pull up/down configuration.

Fix this by adding two new exynos4 specific entries in the array of default
configs with set_pull and get_pull callbacks set to exynos4 specific callbacks
The new default gpio configs can then be used for exynos4 gpio chips.

Signed-off-by: Thomas Abraham <thomas.abraham@gmail.com>
---
 drivers/gpio/gpio-samsung.c |   31 +++++++++++++++++++------------
 1 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 037d3bb..b33cad3 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -486,7 +486,14 @@ static struct samsung_gpio_cfg samsung_gpio_cfgs[] = {
 	}, {
 		.set_config	= samsung_gpio_setcfg_2bit,
 		.get_config	= samsung_gpio_getcfg_2bit,
-	},
+	}, {
+		.set_pull	= exynos4_gpio_setpull,
+		.get_pull	= exynos4_gpio_getpull,
+	}, {
+		.cfg_eint	= 0x3,
+		.set_pull	= exynos4_gpio_setpull,
+		.get_pull	= exynos4_gpio_getpull,
+	}
 };
 
 /*
@@ -2253,49 +2260,49 @@ static struct samsung_gpio_chip exynos4_gpios_2[] = {
 			.label	= "GPL2",
 		},
 	}, {
-		.config	= &samsung_gpio_cfgs[0],
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS4_GPY0(0),
 			.ngpio	= EXYNOS4_GPIO_Y0_NR,
 			.label	= "GPY0",
 		},
 	}, {
-		.config	= &samsung_gpio_cfgs[0],
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS4_GPY1(0),
 			.ngpio	= EXYNOS4_GPIO_Y1_NR,
 			.label	= "GPY1",
 		},
 	}, {
-		.config	= &samsung_gpio_cfgs[0],
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS4_GPY2(0),
 			.ngpio	= EXYNOS4_GPIO_Y2_NR,
 			.label	= "GPY2",
 		},
 	}, {
-		.config	= &samsung_gpio_cfgs[0],
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS4_GPY3(0),
 			.ngpio	= EXYNOS4_GPIO_Y3_NR,
 			.label	= "GPY3",
 		},
 	}, {
-		.config	= &samsung_gpio_cfgs[0],
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS4_GPY4(0),
 			.ngpio	= EXYNOS4_GPIO_Y4_NR,
 			.label	= "GPY4",
 		},
 	}, {
-		.config	= &samsung_gpio_cfgs[0],
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS4_GPY5(0),
 			.ngpio	= EXYNOS4_GPIO_Y5_NR,
 			.label	= "GPY5",
 		},
 	}, {
-		.config	= &samsung_gpio_cfgs[0],
+		.config	= &samsung_gpio_cfgs[8],
 		.chip	= {
 			.base	= EXYNOS4_GPY6(0),
 			.ngpio	= EXYNOS4_GPIO_Y6_NR,
@@ -2303,7 +2310,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[] = {
 		},
 	}, {
 		.base	= (S5P_VA_GPIO2 + 0xC00),
-		.config	= &samsung_gpio_cfgs[3],
+		.config	= &samsung_gpio_cfgs[9],
 		.irq_base = IRQ_EINT(0),
 		.chip	= {
 			.base	= EXYNOS4_GPX0(0),
@@ -2313,7 +2320,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[] = {
 		},
 	}, {
 		.base	= (S5P_VA_GPIO2 + 0xC20),
-		.config	= &samsung_gpio_cfgs[3],
+		.config	= &samsung_gpio_cfgs[9],
 		.irq_base = IRQ_EINT(8),
 		.chip	= {
 			.base	= EXYNOS4_GPX1(0),
@@ -2323,7 +2330,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[] = {
 		},
 	}, {
 		.base	= (S5P_VA_GPIO2 + 0xC40),
-		.config	= &samsung_gpio_cfgs[3],
+		.config	= &samsung_gpio_cfgs[9],
 		.irq_base = IRQ_EINT(16),
 		.chip	= {
 			.base	= EXYNOS4_GPX2(0),
@@ -2333,7 +2340,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[] = {
 		},
 	}, {
 		.base	= (S5P_VA_GPIO2 + 0xC60),
-		.config	= &samsung_gpio_cfgs[3],
+		.config	= &samsung_gpio_cfgs[9],
 		.irq_base = IRQ_EINT(24),
 		.chip	= {
 			.base	= EXYNOS4_GPX3(0),
-- 
1.6.6.rc2
