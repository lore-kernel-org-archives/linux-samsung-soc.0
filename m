From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] arm: s5pv210: add more banks to gpiolib
Date: Wed, 09 Jun 2010 10:40:33 +0200
Message-ID: <1276072833-4862-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48743 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756996Ab0FIIkl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jun 2010 04:40:41 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L3Q00HONO3Q16@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jun 2010 09:40:39 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L3Q00874O3QCA@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jun 2010 09:40:38 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

This patch adds support for MP04 and MP05 gpio banks. Pins from these
banks will be used by Samsung Aquila board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

---
 arch/arm/mach-s5pv210/gpiolib.c           |   17 +++++++++++++++++
 arch/arm/mach-s5pv210/include/mach/gpio.h |   10 ++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/gpiolib.c b/arch/arm/mach-s5pv210/gpiolib.c
index f4ac81f..6f74a98 100644
--- a/arch/arm/mach-s5pv210/gpiolib.c
+++ b/arch/arm/mach-s5pv210/gpiolib.c
@@ -208,6 +208,22 @@ static struct s3c_gpio_chip s5pv210_gpio_4bit[] = {
 			.label	= "MP03",
 		},
 	}, {
+		.base	= (S5P_VA_GPIO + 0x340),
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= S5PV210_MP04(0),
+			.ngpio	= S5PV210_GPIO_MP04_NR,
+			.label	= "MP04",
+		},
+	}, {
+		.base	= (S5P_VA_GPIO + 0x360),
+		.config	= &gpio_cfg_noint,
+		.chip	= {
+			.base	= S5PV210_MP05(0),
+			.ngpio	= S5PV210_GPIO_MP05_NR,
+			.label	= "MP05",
+		},
+	}, {
 		.base	= (S5P_VA_GPIO + 0xC00),
 		.config	= &gpio_cfg_noint,
 		.chip	= {
@@ -244,6 +260,7 @@ static struct s3c_gpio_chip s5pv210_gpio_4bit[] = {
 			.to_irq = s5p_gpiolib_eint_to_irq,
 		},
 	},
+
 };
 
 static __init int s5pv210_gpiolib_init(void)
diff --git a/arch/arm/mach-s5pv210/include/mach/gpio.h b/arch/arm/mach-s5pv210/include/mach/gpio.h
index d6461ba..33a9867 100644
--- a/arch/arm/mach-s5pv210/include/mach/gpio.h
+++ b/arch/arm/mach-s5pv210/include/mach/gpio.h
@@ -52,6 +52,8 @@
 #define S5PV210_GPIO_MP01_NR	(8)
 #define S5PV210_GPIO_MP02_NR	(4)
 #define S5PV210_GPIO_MP03_NR	(8)
+#define S5PV210_GPIO_MP04_NR	(8)
+#define S5PV210_GPIO_MP05_NR	(8)
 
 /* GPIO bank numbers */
 
@@ -94,6 +96,8 @@ enum s5p_gpio_number {
 	S5PV210_GPIO_MP01_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_J4),
 	S5PV210_GPIO_MP02_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP01),
 	S5PV210_GPIO_MP03_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP02),
+	S5PV210_GPIO_MP04_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP03),
+	S5PV210_GPIO_MP05_START	= S5PV210_GPIO_NEXT(S5PV210_GPIO_MP04),
 };
 
 /* S5PV210 GPIO number definitions */
@@ -127,13 +131,15 @@ enum s5p_gpio_number {
 #define S5PV210_MP01(_nr)	(S5PV210_GPIO_MP01_START + (_nr))
 #define S5PV210_MP02(_nr)	(S5PV210_GPIO_MP02_START + (_nr))
 #define S5PV210_MP03(_nr)	(S5PV210_GPIO_MP03_START + (_nr))
+#define S5PV210_MP04(_nr)	(S5PV210_GPIO_MP04_START + (_nr))
+#define S5PV210_MP05(_nr)	(S5PV210_GPIO_MP05_START + (_nr))
 
 /* the end of the S5PV210 specific gpios */
-#define S5PV210_GPIO_END	(S5PV210_MP03(S5PV210_GPIO_MP03_NR) + 1)
+#define S5PV210_GPIO_END	(S5PV210_MP05(S5PV210_GPIO_MP05_NR) + 1)
 #define S3C_GPIO_END		S5PV210_GPIO_END
 
 /* define the number of gpios we need to the one after the MP03() range */
-#define ARCH_NR_GPIOS		(S5PV210_MP03(S5PV210_GPIO_MP03_NR) +	\
+#define ARCH_NR_GPIOS		(S5PV210_MP05(S5PV210_GPIO_MP05_NR) +	\
 				 CONFIG_SAMSUNG_GPIO_EXTRA + 1)
 
 #include <asm-generic/gpio.h>
-- 
1.7.1.240.g225c
