From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] ARM: EXYNOS4: add support for gpio interrupts
Date: Mon, 14 Mar 2011 08:04:46 +0100
Message-ID: <1300086286-9006-5-git-send-email-m.szyprowski@samsung.com>
References: <1300086286-9006-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:9048 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754366Ab1CNHEx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 03:04:53 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LI10082BD00KM@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:04:48 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LI1004LED00CU@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:04:48 +0000 (GMT)
In-reply-to: <1300086286-9006-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

This patch adds support for gpio interrupts on Samsung S5PC210 platform.
Common s5p-gpioint.c code is used for handling gpio interrupts. Each gpio
line that needs gpio interrupt support must be later registered with
s5p_register_gpio_interrupt() function.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/gpiolib.c           |   18 +++++++++++++++---
 arch/arm/mach-exynos4/include/mach/irqs.h |   12 ++++++++++--
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos4/gpiolib.c b/arch/arm/mach-exynos4/gpiolib.c
index 1b4121c..d54ca6a 100644
--- a/arch/arm/mach-exynos4/gpiolib.c
+++ b/arch/arm/mach-exynos4/gpiolib.c
@@ -304,6 +304,7 @@ static __init int exynos4_gpiolib_init(void)
 {
 	struct s3c_gpio_chip *chip;
 	int i;
+	int group = 0;
 	int nr_chips;
 
 	/* GPIO part 1 */
@@ -312,8 +313,11 @@ static __init int exynos4_gpiolib_init(void)
 	nr_chips = ARRAY_SIZE(exynos4_gpio_part1_4bit);
 
 	for (i = 0; i < nr_chips; i++, chip++) {
-		if (chip->config == NULL)
+		if (chip->config == NULL) {
 			chip->config = &gpio_cfg;
+			/* Assign the GPIO interrupt group */
+			chip->group = group++;
+		}
 		if (chip->base == NULL)
 			chip->base = S5P_VA_GPIO1 + (i) * 0x20;
 	}
@@ -326,8 +330,11 @@ static __init int exynos4_gpiolib_init(void)
 	nr_chips = ARRAY_SIZE(exynos4_gpio_part2_4bit);
 
 	for (i = 0; i < nr_chips; i++, chip++) {
-		if (chip->config == NULL)
+		if (chip->config == NULL) {
 			chip->config = &gpio_cfg;
+			/* Assign the GPIO interrupt group */
+			chip->group = group++;
+		}
 		if (chip->base == NULL)
 			chip->base = S5P_VA_GPIO2 + (i) * 0x20;
 	}
@@ -340,13 +347,18 @@ static __init int exynos4_gpiolib_init(void)
 	nr_chips = ARRAY_SIZE(exynos4_gpio_part3_4bit);
 
 	for (i = 0; i < nr_chips; i++, chip++) {
-		if (chip->config == NULL)
+		if (chip->config == NULL) {
 			chip->config = &gpio_cfg;
+			/* Assign the GPIO interrupt group */
+			chip->group = group++;
+		}
 		if (chip->base == NULL)
 			chip->base = S5P_VA_GPIO3 + (i) * 0x20;
 	}
 
 	samsung_gpiolib_add_4bit_chips(exynos4_gpio_part3_4bit, nr_chips);
+	s5p_register_gpioint_bank(IRQ_GPIO_XA, 0, IRQ_GPIO1_NR_GROUPS);
+	s5p_register_gpioint_bank(IRQ_GPIO_XB, IRQ_GPIO1_NR_GROUPS, IRQ_GPIO2_NR_GROUPS);
 
 	return 0;
 }
diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 1db1de8..5d03730 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -85,6 +85,9 @@
 #define IRQ_RTC_ALARM		COMBINER_IRQ(23, 0)
 #define IRQ_RTC_TIC		COMBINER_IRQ(23, 1)
 
+#define IRQ_GPIO_XB		COMBINER_IRQ(24, 0)
+#define IRQ_GPIO_XA		COMBINER_IRQ(24, 1)
+
 #define IRQ_UART0		COMBINER_IRQ(26, 0)
 #define IRQ_UART1		COMBINER_IRQ(26, 1)
 #define IRQ_UART2		COMBINER_IRQ(26, 2)
@@ -145,8 +148,13 @@
 #define S5P_EINT_BASE1		(S5P_IRQ_EINT_BASE + 0)
 #define S5P_EINT_BASE2		(S5P_IRQ_EINT_BASE + 16)
 
-/* Set the default NR_IRQS */
+/* optional GPIO interrupts */
+#define S5P_GPIOINT_BASE	(S5P_IRQ_EINT_BASE + 32)
+#define IRQ_GPIO1_NR_GROUPS	16
+#define IRQ_GPIO2_NR_GROUPS	9
+#define IRQ_GPIO_END		(S5P_GPIOINT_BASE + S5P_GPIOINT_COUNT)
 
-#define NR_IRQS			(S5P_IRQ_EINT_BASE + 32)
+/* Set the default NR_IRQS */
+#define NR_IRQS			(IRQ_GPIO_END)
 
 #endif /* __ASM_ARCH_IRQS_H */
-- 
1.7.1.569.g6f426
