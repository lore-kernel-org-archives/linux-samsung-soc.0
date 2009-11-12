From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 05/18] ARM: S5PC1XX: add GPIO L banks to register definition
Date: Thu, 12 Nov 2009 09:21:49 +0100
Message-ID: <1258014122-18185-6-git-send-email-m.szyprowski@samsung.com>
References: <1258014122-18185-1-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-2-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-3-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-4-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46047 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752612AbZKLIWy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2009 03:22:54 -0500
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KSZ00LRFLYAGW@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:22:58 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KSZ00FKNLYAW3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:22:58 +0000 (GMT)
In-reply-to: <1258014122-18185-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com, laforge@gnumonks.org

From: Kyungmin Park <kyungmin.park@samsung.com>

From: Kyungmin Park <kyungmin.park@samsung.com>

Add GPIO L0-L4 banks to register definition.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/include/mach/gpio.h |   30 ++++++++++++++++++++++------
 1 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s5pc100/include/mach/gpio.h b/arch/arm/mach-s5pc100/include/mach/gpio.h
index c74fc93..5d22961 100644
--- a/arch/arm/mach-s5pc100/include/mach/gpio.h
+++ b/arch/arm/mach-s5pc100/include/mach/gpio.h
@@ -47,6 +47,11 @@
 #define S5PC1XX_GPIO_K1_NR	(6)
 #define S5PC1XX_GPIO_K2_NR	(8)
 #define S5PC1XX_GPIO_K3_NR	(8)
+#define S5PC1XX_GPIO_L0_NR	(8)
+#define S5PC1XX_GPIO_L1_NR	(8)
+#define S5PC1XX_GPIO_L2_NR	(8)
+#define S5PC1XX_GPIO_L3_NR	(8)
+#define S5PC1XX_GPIO_L4_NR	(8)
 #define S5PC1XX_GPIO_MP00_NR	(8)
 #define S5PC1XX_GPIO_MP01_NR	(8)
 #define S5PC1XX_GPIO_MP02_NR	(8)
@@ -64,9 +69,9 @@
 	((__gpio##_START) + (__gpio##_NR) + CONFIG_S3C_GPIO_SPACE + 1)
 
 enum s3c_gpio_number {
-	S5PC1XX_GPIO_A0_START 	= 0,
-	S5PC1XX_GPIO_A1_START 	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_A0),
-	S5PC1XX_GPIO_B_START 	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_A1),
+	S5PC1XX_GPIO_A0_START	= 0,
+	S5PC1XX_GPIO_A1_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_A0),
+	S5PC1XX_GPIO_B_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_A1),
 	S5PC1XX_GPIO_C_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_B),
 	S5PC1XX_GPIO_D_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_C),
 	S5PC1XX_GPIO_E0_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_D),
@@ -93,11 +98,17 @@ enum s3c_gpio_number {
 	S5PC1XX_GPIO_K1_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_K0),
 	S5PC1XX_GPIO_K2_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_K1),
 	S5PC1XX_GPIO_K3_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_K2),
-	S5PC1XX_GPIO_MP00_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_K3),
+	S5PC1XX_GPIO_L0_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_K3),
+	S5PC1XX_GPIO_L1_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_L0),
+	S5PC1XX_GPIO_L2_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_L1),
+	S5PC1XX_GPIO_L3_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_L2),
+	S5PC1XX_GPIO_L4_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_L3),
+	S5PC1XX_GPIO_MP00_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_L4),
 	S5PC1XX_GPIO_MP01_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_MP00),
 	S5PC1XX_GPIO_MP02_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_MP01),
 	S5PC1XX_GPIO_MP03_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_MP02),
 	S5PC1XX_GPIO_MP04_START	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_MP03),
+	S5PC1XX_GPIO_END	= S5PC1XX_GPIO_NEXT(S5PC1XX_GPIO_MP04),
 };
 
 /* S5PC1XX GPIO number definitions. */
@@ -130,17 +141,22 @@ enum s3c_gpio_number {
 #define S5PC1XX_GPK1(_nr)	(S5PC1XX_GPIO_K1_START + (_nr))
 #define S5PC1XX_GPK2(_nr)	(S5PC1XX_GPIO_K2_START + (_nr))
 #define S5PC1XX_GPK3(_nr)	(S5PC1XX_GPIO_K3_START + (_nr))
+#define S5PC1XX_GPL0(_nr)	(S5PC1XX_GPIO_L0_START + (_nr))
+#define S5PC1XX_GPL1(_nr)	(S5PC1XX_GPIO_L1_START + (_nr))
+#define S5PC1XX_GPL2(_nr)	(S5PC1XX_GPIO_L2_START + (_nr))
+#define S5PC1XX_GPL3(_nr)	(S5PC1XX_GPIO_L3_START + (_nr))
+#define S5PC1XX_GPL4(_nr)	(S5PC1XX_GPIO_L4_START + (_nr))
 #define S5PC1XX_MP00(_nr)	(S5PC1XX_GPIO_MP00_START + (_nr))
 #define S5PC1XX_MP01(_nr)	(S5PC1XX_GPIO_MP01_START + (_nr))
 #define S5PC1XX_MP02(_nr)	(S5PC1XX_GPIO_MP02_START + (_nr))
 #define S5PC1XX_MP03(_nr)	(S5PC1XX_GPIO_MP03_START + (_nr))
 #define S5PC1XX_MP04(_nr)	(S5PC1XX_GPIO_MP04_START + (_nr))
+#define S5PC1XX_MP05(_nr)	(S5PC1XX_GPIO_MP05_START + (_nr))
 
-/* the end of the S5PC1XX specific gpios */
-#define S5PC1XX_GPIO_END	(S5PC1XX_MP04(S5PC1XX_GPIO_MP04_NR) + 1)
+/* It used the end of the S5PC1XX gpios */
 #define S3C_GPIO_END		S5PC1XX_GPIO_END
 
 /* define the number of gpios we need to the one after the MP04() range */
-#define ARCH_NR_GPIOS	(S5PC1XX_MP04(S5PC1XX_GPIO_MP04_NR) + 1)
+#define ARCH_NR_GPIOS		(S5PC1XX_GPIO_END + 1)
 
 #include <asm-generic/gpio.h>
-- 
1.6.5
