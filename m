From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] ARM: EXYNOS4: Add missing GPYx banks.
Date: Mon, 14 Mar 2011 08:04:43 +0100
Message-ID: <1300086286-9006-2-git-send-email-m.szyprowski@samsung.com>
References: <1300086286-9006-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13914 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753935Ab1CNHEv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 03:04:51 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LI1007D2D018K70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:04:49 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LI1002BCD005H@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:04:48 +0000 (GMT)
In-reply-to: <1300086286-9006-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

This patch adds missing GPYx gpio banks on Samsung S5PC210 platform.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/gpiolib.c           |   49 +++++++++++++++++++++++++++++
 arch/arm/mach-exynos4/include/mach/gpio.h |   23 +++++++++++++-
 2 files changed, 71 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/gpiolib.c b/arch/arm/mach-exynos4/gpiolib.c
index c46fdc5..1b4121c 100644
--- a/arch/arm/mach-exynos4/gpiolib.c
+++ b/arch/arm/mach-exynos4/gpiolib.c
@@ -199,6 +199,55 @@ static struct s3c_gpio_chip exynos4_gpio_part2_4bit[] = {
 			.label	= "GPL2",
 		},
 	}, {
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= EXYNOS4_GPY0(0),
+			.ngpio	= EXYNOS4_GPIO_Y0_NR,
+			.label	= "GPY0",
+		},
+	}, {
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= EXYNOS4_GPY1(0),
+			.ngpio	= EXYNOS4_GPIO_Y1_NR,
+			.label	= "GPY1",
+		},
+	}, {
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= EXYNOS4_GPY2(0),
+			.ngpio	= EXYNOS4_GPIO_Y2_NR,
+			.label	= "GPY2",
+		},
+	}, {
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= EXYNOS4_GPY3(0),
+			.ngpio	= EXYNOS4_GPIO_Y3_NR,
+			.label	= "GPY3",
+		},
+	}, {
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= EXYNOS4_GPY4(0),
+			.ngpio	= EXYNOS4_GPIO_Y4_NR,
+			.label	= "GPY4",
+		},
+	}, {
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= EXYNOS4_GPY5(0),
+			.ngpio	= EXYNOS4_GPIO_Y5_NR,
+			.label	= "GPY5",
+		},
+	}, {
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= EXYNOS4_GPY6(0),
+			.ngpio	= EXYNOS4_GPIO_Y6_NR,
+			.label	= "GPY6",
+		},
+	}, {
 		.base	= (S5P_VA_GPIO2 + 0xC00),
 		.config	= &gpio_cfg_noint,
 		.irq_base = IRQ_EINT(0),
diff --git a/arch/arm/mach-exynos4/include/mach/gpio.h b/arch/arm/mach-exynos4/include/mach/gpio.h
index 1608299..939728b 100644
--- a/arch/arm/mach-exynos4/include/mach/gpio.h
+++ b/arch/arm/mach-exynos4/include/mach/gpio.h
@@ -50,6 +50,13 @@
 #define EXYNOS4_GPIO_X1_NR	(8)
 #define EXYNOS4_GPIO_X2_NR	(8)
 #define EXYNOS4_GPIO_X3_NR	(8)
+#define EXYNOS4_GPIO_Y0_NR	(6)
+#define EXYNOS4_GPIO_Y1_NR	(4)
+#define EXYNOS4_GPIO_Y2_NR	(6)
+#define EXYNOS4_GPIO_Y3_NR	(8)
+#define EXYNOS4_GPIO_Y4_NR	(8)
+#define EXYNOS4_GPIO_Y5_NR	(8)
+#define EXYNOS4_GPIO_Y6_NR	(8)
 #define EXYNOS4_GPIO_Z_NR	(7)
 
 /* GPIO bank numbers */
@@ -87,7 +94,14 @@ enum s5p_gpio_number {
 	EXYNOS4_GPIO_X1_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_X0),
 	EXYNOS4_GPIO_X2_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_X1),
 	EXYNOS4_GPIO_X3_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_X2),
-	EXYNOS4_GPIO_Z_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_X3),
+	EXYNOS4_GPIO_Y0_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_X3),
+	EXYNOS4_GPIO_Y1_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Y0),
+	EXYNOS4_GPIO_Y2_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Y1),
+	EXYNOS4_GPIO_Y3_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Y2),
+	EXYNOS4_GPIO_Y4_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Y3),
+	EXYNOS4_GPIO_Y5_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Y4),
+	EXYNOS4_GPIO_Y6_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Y5),
+	EXYNOS4_GPIO_Z_START	= EXYNOS4_GPIO_NEXT(EXYNOS4_GPIO_Y6),
 };
 
 /* EXYNOS4 GPIO number definitions */
@@ -120,6 +134,13 @@ enum s5p_gpio_number {
 #define EXYNOS4_GPX1(_nr)	(EXYNOS4_GPIO_X1_START + (_nr))
 #define EXYNOS4_GPX2(_nr)	(EXYNOS4_GPIO_X2_START + (_nr))
 #define EXYNOS4_GPX3(_nr)	(EXYNOS4_GPIO_X3_START + (_nr))
+#define EXYNOS4_GPY0(_nr)	(EXYNOS4_GPIO_Y0_START + (_nr))
+#define EXYNOS4_GPY1(_nr)	(EXYNOS4_GPIO_Y1_START + (_nr))
+#define EXYNOS4_GPY2(_nr)	(EXYNOS4_GPIO_Y2_START + (_nr))
+#define EXYNOS4_GPY3(_nr)	(EXYNOS4_GPIO_Y3_START + (_nr))
+#define EXYNOS4_GPY4(_nr)	(EXYNOS4_GPIO_Y4_START + (_nr))
+#define EXYNOS4_GPY5(_nr)	(EXYNOS4_GPIO_Y5_START + (_nr))
+#define EXYNOS4_GPY6(_nr)	(EXYNOS4_GPIO_Y6_START + (_nr))
 #define EXYNOS4_GPZ(_nr)	(EXYNOS4_GPIO_Z_START + (_nr))
 
 /* the end of the EXYNOS4 specific gpios */
-- 
1.7.1.569.g6f426
