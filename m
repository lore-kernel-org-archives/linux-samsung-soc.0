From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PC100: Cleanup the GPIOlib code
Date: Fri,  1 Oct 2010 21:58:14 +0900
Message-ID: <1285937894-2864-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:59339 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751501Ab0JANRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 09:17:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch clean up the GPIO code and removes useless GPIO addresses.
It can be calculated with offset, the 'base' member of s3c_gpio_chip
is also initialized in the init function.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pc100/gpiolib.c                |  172 ++++++++++--------------
 arch/arm/mach-s5pc100/include/mach/regs-gpio.h |   37 -----
 2 files changed, 69 insertions(+), 140 deletions(-)

diff --git a/arch/arm/mach-s5pc100/gpiolib.c b/arch/arm/mach-s5pc100/gpiolib.c
index def4ff8..20856eb 100644
--- a/arch/arm/mach-s5pc100/gpiolib.c
+++ b/arch/arm/mach-s5pc100/gpiolib.c
@@ -1,5 +1,7 @@
-/*
- * arch/arm/plat-s5pc100/gpiolib.c
+/* linux/arch/arm/mach-s5pc100/gpiolib.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
  *
  *  Copyright 2009 Samsung Electronics Co
  *  Kyungmin Park <kyungmin.park@samsung.com>
@@ -80,217 +82,150 @@ static struct s3c_gpio_cfg gpio_cfg_noint = {
 	.get_pull	= s3c_gpio_getpull_updown,
 };
 
+/*
+ * GPIO bank's base address given the index of the bank in the
+ * list of all gpio banks.
+ */
+#define S5PC100_BANK_BASE(bank_nr)	(S5P_VA_GPIO + ((bank_nr) * 0x20))
+
+/*
+ * Following are the gpio banks in S5PC100.
+ *
+ * The 'config' member when left to NULL, is initialized to the default
+ * structure gpio_cfg in the init function below.
+ *
+ * The 'base' member is also initialized in the init function below.
+ * Note: The initialization of 'base' member of s3c_gpio_chip structure
+ * uses the above macro and depends on the banks being listed in order here.
+ */
 static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 	{
-		.base	= S5PC100_GPA0_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPA0(0),
 			.ngpio	= S5PC100_GPIO_A0_NR,
 			.label	= "GPA0",
 		},
 	}, {
-		.base	= S5PC100_GPA1_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPA1(0),
 			.ngpio	= S5PC100_GPIO_A1_NR,
 			.label	= "GPA1",
 		},
 	}, {
-		.base	= S5PC100_GPB_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPB(0),
 			.ngpio	= S5PC100_GPIO_B_NR,
 			.label	= "GPB",
 		},
 	}, {
-		.base	= S5PC100_GPC_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPC(0),
 			.ngpio	= S5PC100_GPIO_C_NR,
 			.label	= "GPC",
 		},
 	}, {
-		.base	= S5PC100_GPD_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPD(0),
 			.ngpio	= S5PC100_GPIO_D_NR,
 			.label	= "GPD",
 		},
 	}, {
-		.base	= S5PC100_GPE0_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPE0(0),
 			.ngpio	= S5PC100_GPIO_E0_NR,
 			.label	= "GPE0",
 		},
 	}, {
-		.base	= S5PC100_GPE1_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPE1(0),
 			.ngpio	= S5PC100_GPIO_E1_NR,
 			.label	= "GPE1",
 		},
 	}, {
-		.base	= S5PC100_GPF0_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPF0(0),
 			.ngpio	= S5PC100_GPIO_F0_NR,
 			.label	= "GPF0",
 		},
 	}, {
-		.base	= S5PC100_GPF1_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPF1(0),
 			.ngpio	= S5PC100_GPIO_F1_NR,
 			.label	= "GPF1",
 		},
 	}, {
-		.base	= S5PC100_GPF2_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPF2(0),
 			.ngpio	= S5PC100_GPIO_F2_NR,
 			.label	= "GPF2",
 		},
 	}, {
-		.base	= S5PC100_GPF3_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPF3(0),
 			.ngpio	= S5PC100_GPIO_F3_NR,
 			.label	= "GPF3",
 		},
 	}, {
-		.base	= S5PC100_GPG0_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPG0(0),
 			.ngpio	= S5PC100_GPIO_G0_NR,
 			.label	= "GPG0",
 		},
 	}, {
-		.base	= S5PC100_GPG1_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPG1(0),
 			.ngpio	= S5PC100_GPIO_G1_NR,
 			.label	= "GPG1",
 		},
 	}, {
-		.base	= S5PC100_GPG2_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPG2(0),
 			.ngpio	= S5PC100_GPIO_G2_NR,
 			.label	= "GPG2",
 		},
 	}, {
-		.base	= S5PC100_GPG3_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPG3(0),
 			.ngpio	= S5PC100_GPIO_G3_NR,
 			.label	= "GPG3",
 		},
 	}, {
-		.base	= S5PC100_GPH0_BASE,
-		.config	= &gpio_cfg_eint,
-		.irq_base = IRQ_EINT(0),
-		.chip	= {
-			.base	= S5PC100_GPH0(0),
-			.ngpio	= S5PC100_GPIO_H0_NR,
-			.label	= "GPH0",
-			.to_irq = samsung_gpiolib_to_irq,
-		},
-	}, {
-		.base	= S5PC100_GPH1_BASE,
-		.config	= &gpio_cfg_eint,
-		.irq_base = IRQ_EINT(8),
-		.chip	= {
-			.base	= S5PC100_GPH1(0),
-			.ngpio	= S5PC100_GPIO_H1_NR,
-			.label	= "GPH1",
-			.to_irq = samsung_gpiolib_to_irq,
-		},
-	}, {
-		.base	= S5PC100_GPH2_BASE,
-		.config	= &gpio_cfg_eint,
-		.irq_base = IRQ_EINT(16),
-		.chip	= {
-			.base	= S5PC100_GPH2(0),
-			.ngpio	= S5PC100_GPIO_H2_NR,
-			.label	= "GPH2",
-			.to_irq = samsung_gpiolib_to_irq,
-		},
-	}, {
-		.base	= S5PC100_GPH3_BASE,
-		.config	= &gpio_cfg_eint,
-		.irq_base = IRQ_EINT(24),
-		.chip	= {
-			.base	= S5PC100_GPH3(0),
-			.ngpio	= S5PC100_GPIO_H3_NR,
-			.label	= "GPH3",
-			.to_irq = samsung_gpiolib_to_irq,
-		},
-	}, {
-		.base	= S5PC100_GPI_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPI(0),
 			.ngpio	= S5PC100_GPIO_I_NR,
 			.label	= "GPI",
 		},
 	}, {
-		.base	= S5PC100_GPJ0_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPJ0(0),
 			.ngpio	= S5PC100_GPIO_J0_NR,
 			.label	= "GPJ0",
 		},
 	}, {
-		.base	= S5PC100_GPJ1_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPJ1(0),
 			.ngpio	= S5PC100_GPIO_J1_NR,
 			.label	= "GPJ1",
 		},
 	}, {
-		.base	= S5PC100_GPJ2_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPJ2(0),
 			.ngpio	= S5PC100_GPIO_J2_NR,
 			.label	= "GPJ2",
 		},
 	}, {
-		.base	= S5PC100_GPJ3_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPJ3(0),
 			.ngpio	= S5PC100_GPIO_J3_NR,
 			.label	= "GPJ3",
 		},
 	}, {
-		.base	= S5PC100_GPJ4_BASE,
-		.config	= &gpio_cfg,
 		.chip	= {
 			.base	= S5PC100_GPJ4(0),
 			.ngpio	= S5PC100_GPIO_J4_NR,
 			.label	= "GPJ4",
 		},
 	}, {
-		.base	= S5PC100_GPK0_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPK0(0),
@@ -298,7 +233,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPK0",
 		},
 	}, {
-		.base	= S5PC100_GPK1_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPK1(0),
@@ -306,7 +240,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPK1",
 		},
 	}, {
-		.base	= S5PC100_GPK2_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPK2(0),
@@ -314,7 +247,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPK2",
 		},
 	}, {
-		.base	= S5PC100_GPK3_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPK3(0),
@@ -322,7 +254,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPK3",
 		},
 	}, {
-		.base	= S5PC100_GPL0_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPL0(0),
@@ -330,7 +261,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPL0",
 		},
 	}, {
-		.base	= S5PC100_GPL1_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPL1(0),
@@ -338,7 +268,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPL1",
 		},
 	}, {
-		.base	= S5PC100_GPL2_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPL2(0),
@@ -346,7 +275,6 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPL2",
 		},
 	}, {
-		.base	= S5PC100_GPL3_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPL3(0),
@@ -354,34 +282,72 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.label	= "GPL3",
 		},
 	}, {
-		.base	= S5PC100_GPL4_BASE,
 		.config	= &gpio_cfg_noint,
 		.chip	= {
 			.base	= S5PC100_GPL4(0),
 			.ngpio	= S5PC100_GPIO_L4_NR,
 			.label	= "GPL4",
 		},
+	}, {
+		.base	= (S5P_VA_GPIO + 0xC00),
+		.config	= &gpio_cfg_eint,
+		.irq_base = IRQ_EINT(0),
+		.chip	= {
+			.base	= S5PC100_GPH0(0),
+			.ngpio	= S5PC100_GPIO_H0_NR,
+			.label	= "GPH0",
+			.to_irq = samsung_gpiolib_to_irq,
+		},
+	}, {
+		.base	= (S5P_VA_GPIO + 0xC20),
+		.config	= &gpio_cfg_eint,
+		.irq_base = IRQ_EINT(8),
+		.chip	= {
+			.base	= S5PC100_GPH1(0),
+			.ngpio	= S5PC100_GPIO_H1_NR,
+			.label	= "GPH1",
+			.to_irq = samsung_gpiolib_to_irq,
+		},
+	}, {
+		.base	= (S5P_VA_GPIO + 0xC40),
+		.config	= &gpio_cfg_eint,
+		.irq_base = IRQ_EINT(16),
+		.chip	= {
+			.base	= S5PC100_GPH2(0),
+			.ngpio	= S5PC100_GPIO_H2_NR,
+			.label	= "GPH2",
+			.to_irq = samsung_gpiolib_to_irq,
+		},
+	}, {
+		.base	= (S5P_VA_GPIO + 0xC60),
+		.config	= &gpio_cfg_eint,
+		.irq_base = IRQ_EINT(24),
+		.chip	= {
+			.base	= S5PC100_GPH3(0),
+			.ngpio	= S5PC100_GPIO_H3_NR,
+			.label	= "GPH3",
+			.to_irq = samsung_gpiolib_to_irq,
+		},
 	},
 };
 
 static __init int s5pc100_gpiolib_init(void)
 {
-	struct s3c_gpio_chip *chip;
-	int nr_chips;
+	struct s3c_gpio_chip *chip = s5pc100_gpio_chips;
+	int nr_chips = ARRAY_SIZE(s5pc100_gpio_chips);
 	int gpioint_group = 0;
+	int i;
 
-	chip = s5pc100_gpio_chips;
-	nr_chips = ARRAY_SIZE(s5pc100_gpio_chips);
-
-	for (; nr_chips > 0; nr_chips--, chip++) {
-		if (chip->config == &gpio_cfg) {
-			/* gpio interrupts */
+	for (i = 0; i < nr_chips; i++, chip++) {
+		if (chip->config == NULL) {
+			chip->config = &gpio_cfg;
 			chip->group = gpioint_group++;
 		}
+		if (chip->base == NULL)
+			chip->base = S5PC100_BANK_BASE(i);
 	}
 
-	samsung_gpiolib_add_4bit_chips(s5pc100_gpio_chips,
-				       ARRAY_SIZE(s5pc100_gpio_chips));
+	samsung_gpiolib_add_4bit_chips(s5pc100_gpio_chips, nr_chips);
 
 	return 0;
 }
diff --git a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
index 6abe481..8d3b1ba 100644
--- a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
@@ -11,43 +11,6 @@
 
 #include <mach/map.h>
 
-/* S5PC100 */
-#define S5PC100_GPIO_BASE	S5P_VA_GPIO
-#define S5PC100_GPA0_BASE	(S5PC100_GPIO_BASE + 0x0000)
-#define S5PC100_GPA1_BASE	(S5PC100_GPIO_BASE + 0x0020)
-#define S5PC100_GPB_BASE	(S5PC100_GPIO_BASE + 0x0040)
-#define S5PC100_GPC_BASE	(S5PC100_GPIO_BASE + 0x0060)
-#define S5PC100_GPD_BASE	(S5PC100_GPIO_BASE + 0x0080)
-#define S5PC100_GPE0_BASE	(S5PC100_GPIO_BASE + 0x00A0)
-#define S5PC100_GPE1_BASE	(S5PC100_GPIO_BASE + 0x00C0)
-#define S5PC100_GPF0_BASE	(S5PC100_GPIO_BASE + 0x00E0)
-#define S5PC100_GPF1_BASE	(S5PC100_GPIO_BASE + 0x0100)
-#define S5PC100_GPF2_BASE	(S5PC100_GPIO_BASE + 0x0120)
-#define S5PC100_GPF3_BASE	(S5PC100_GPIO_BASE + 0x0140)
-#define S5PC100_GPG0_BASE	(S5PC100_GPIO_BASE + 0x0160)
-#define S5PC100_GPG1_BASE	(S5PC100_GPIO_BASE + 0x0180)
-#define S5PC100_GPG2_BASE	(S5PC100_GPIO_BASE + 0x01A0)
-#define S5PC100_GPG3_BASE	(S5PC100_GPIO_BASE + 0x01C0)
-#define S5PC100_GPH0_BASE	(S5PC100_GPIO_BASE + 0x0C00)
-#define S5PC100_GPH1_BASE	(S5PC100_GPIO_BASE + 0x0C20)
-#define S5PC100_GPH2_BASE	(S5PC100_GPIO_BASE + 0x0C40)
-#define S5PC100_GPH3_BASE	(S5PC100_GPIO_BASE + 0x0C60)
-#define S5PC100_GPI_BASE	(S5PC100_GPIO_BASE + 0x01E0)
-#define S5PC100_GPJ0_BASE	(S5PC100_GPIO_BASE + 0x0200)
-#define S5PC100_GPJ1_BASE	(S5PC100_GPIO_BASE + 0x0220)
-#define S5PC100_GPJ2_BASE	(S5PC100_GPIO_BASE + 0x0240)
-#define S5PC100_GPJ3_BASE	(S5PC100_GPIO_BASE + 0x0260)
-#define S5PC100_GPJ4_BASE	(S5PC100_GPIO_BASE + 0x0280)
-#define S5PC100_GPK0_BASE	(S5PC100_GPIO_BASE + 0x02A0)
-#define S5PC100_GPK1_BASE	(S5PC100_GPIO_BASE + 0x02C0)
-#define S5PC100_GPK2_BASE	(S5PC100_GPIO_BASE + 0x02E0)
-#define S5PC100_GPK3_BASE	(S5PC100_GPIO_BASE + 0x0300)
-#define S5PC100_GPL0_BASE	(S5PC100_GPIO_BASE + 0x0320)
-#define S5PC100_GPL1_BASE	(S5PC100_GPIO_BASE + 0x0340)
-#define S5PC100_GPL2_BASE	(S5PC100_GPIO_BASE + 0x0360)
-#define S5PC100_GPL3_BASE	(S5PC100_GPIO_BASE + 0x0380)
-#define S5PC100_GPL4_BASE	(S5PC100_GPIO_BASE + 0x03A0)
-
 #define S5PC100EINT30CON		(S5P_VA_GPIO + 0xE00)
 #define S5P_EINT_CON(x)			(S5PC100EINT30CON + ((x) * 0x4))
 
-- 
1.6.2.5
