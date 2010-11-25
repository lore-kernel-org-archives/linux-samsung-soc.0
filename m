From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/4] ARM: S5P64X0: Add GPIOlib support for S5P6450
Date: Thu, 25 Nov 2010 14:30:14 +0900
Message-ID: <1290663017-9350-2-git-send-email-kgene.kim@samsung.com>
References: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58863 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab0KYFlg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 00:41:36 -0500
In-Reply-To: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Already can support S5P6440 GPIOlib but S5P6450. This patch changes regarding
S5P6440 GPIO definitions so that can be used it from S5P6450 and adds S5P6450
GPIO chips.

Tested-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/Makefile                 |    4 +-
 arch/arm/mach-s5p64x0/gpio.c                   |  224 +++++++++++++++++++++---
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |   57 ++-----
 3 files changed, 217 insertions(+), 68 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/Makefile
index 2655829..835d51b 100644
--- a/arch/arm/mach-s5p64x0/Makefile
+++ b/arch/arm/mach-s5p64x0/Makefile
@@ -12,9 +12,9 @@ obj-				:=
 
 # Core support for S5P64X0 system
 
-obj-$(CONFIG_ARCH_S5P64X0)	+= cpu.o init.o clock.o dma.o
+obj-$(CONFIG_ARCH_S5P64X0)	+= cpu.o init.o clock.o dma.o gpio.o
 obj-$(CONFIG_ARCH_S5P64X0)	+= setup-i2c0.o
-obj-$(CONFIG_CPU_S5P6440)	+= clock-s5p6440.o gpio.o
+obj-$(CONFIG_CPU_S5P6440)	+= clock-s5p6440.o
 obj-$(CONFIG_CPU_S5P6450)	+= clock-s5p6450.o
 
 # machine support
diff --git a/arch/arm/mach-s5p64x0/gpio.c b/arch/arm/mach-s5p64x0/gpio.c
index 39159dd..17a2eee 100644
--- a/arch/arm/mach-s5p64x0/gpio.c
+++ b/arch/arm/mach-s5p64x0/gpio.c
@@ -17,13 +17,12 @@
 
 #include <mach/map.h>
 #include <mach/regs-gpio.h>
+#include <mach/regs-clock.h>
 
 #include <plat/gpio-core.h>
 #include <plat/gpio-cfg.h>
 #include <plat/gpio-cfg-helpers.h>
 
-/* To be implemented S5P6450 GPIO */
-
 /*
  * S5P6440 GPIO bank summary:
  *
@@ -40,6 +39,25 @@
  * P	8	2Bit	Yes	8
  * R	15	4Bit[2]	Yes	8
  *
+ * S5P6450 GPIO bank summary:
+ *
+ * Bank	GPIOs	Style	SlpCon	ExtInt Group
+ * A	6	4Bit	Yes	1
+ * B	7	4Bit	Yes	1
+ * C	8	4Bit	Yes	2
+ * D	8	4Bit	Yes	None
+ * F	2	2Bit	Yes	None
+ * G	14	4Bit[2]	Yes	5
+ * H	10	4Bit[2]	Yes	6
+ * I	16	2Bit	Yes	None
+ * J	12	2Bit	Yes	None
+ * K	5	4Bit	Yes	None
+ * N	16	2Bit	No	IRQ_EINT
+ * P	11	2Bit	Yes	8
+ * Q	14	2Bit	Yes	None
+ * R	15	4Bit[2]	Yes	None
+ * S	8	2Bit	Yes	None
+ *
  * [1] BANKF pins 14,15 do not form part of the external interrupt sources
  * [2] BANK has two control registers, GPxCON0 and GPxCON1
  */
@@ -190,7 +208,7 @@ static struct s3c_gpio_cfg s5p64x0_gpio_cfgs[] = {
 
 static struct s3c_gpio_chip s5p6440_gpio_4bit[] = {
 	{
-		.base	= S5P6440_GPA_BASE,
+		.base	= S5P64X0_GPA_BASE,
 		.config	= &s5p64x0_gpio_cfgs[1],
 		.chip	= {
 			.base	= S5P6440_GPA(0),
@@ -198,7 +216,7 @@ static struct s3c_gpio_chip s5p6440_gpio_4bit[] = {
 			.label	= "GPA",
 		},
 	}, {
-		.base	= S5P6440_GPB_BASE,
+		.base	= S5P64X0_GPB_BASE,
 		.config	= &s5p64x0_gpio_cfgs[1],
 		.chip	= {
 			.base	= S5P6440_GPB(0),
@@ -206,7 +224,7 @@ static struct s3c_gpio_chip s5p6440_gpio_4bit[] = {
 			.label	= "GPB",
 		},
 	}, {
-		.base	= S5P6440_GPC_BASE,
+		.base	= S5P64X0_GPC_BASE,
 		.config	= &s5p64x0_gpio_cfgs[1],
 		.chip	= {
 			.base	= S5P6440_GPC(0),
@@ -214,7 +232,7 @@ static struct s3c_gpio_chip s5p6440_gpio_4bit[] = {
 			.label	= "GPC",
 		},
 	}, {
-		.base	= S5P6440_GPG_BASE,
+		.base	= S5P64X0_GPG_BASE,
 		.config	= &s5p64x0_gpio_cfgs[1],
 		.chip	= {
 			.base	= S5P6440_GPG(0),
@@ -226,7 +244,7 @@ static struct s3c_gpio_chip s5p6440_gpio_4bit[] = {
 
 static struct s3c_gpio_chip s5p6440_gpio_4bit2[] = {
 	{
-		.base	= S5P6440_GPH_BASE + 0x4,
+		.base	= S5P64X0_GPH_BASE + 0x4,
 		.config	= &s5p64x0_gpio_cfgs[1],
 		.chip	= {
 			.base	= S5P6440_GPH(0),
@@ -238,7 +256,7 @@ static struct s3c_gpio_chip s5p6440_gpio_4bit2[] = {
 
 static struct s3c_gpio_chip s5p6440_gpio_rbank_4bit2[] = {
 	{
-		.base	= S5P6440_GPR_BASE + 0x4,
+		.base	= S5P64X0_GPR_BASE + 0x4,
 		.config	= &s5p64x0_gpio_cfgs[2],
 		.chip	= {
 			.base	= S5P6440_GPR(0),
@@ -250,7 +268,7 @@ static struct s3c_gpio_chip s5p6440_gpio_rbank_4bit2[] = {
 
 static struct s3c_gpio_chip s5p6440_gpio_2bit[] = {
 	{
-		.base	= S5P6440_GPF_BASE,
+		.base	= S5P64X0_GPF_BASE,
 		.config	= &s5p64x0_gpio_cfgs[5],
 		.chip	= {
 			.base	= S5P6440_GPF(0),
@@ -258,7 +276,7 @@ static struct s3c_gpio_chip s5p6440_gpio_2bit[] = {
 			.label	= "GPF",
 		},
 	}, {
-		.base	= S5P6440_GPI_BASE,
+		.base	= S5P64X0_GPI_BASE,
 		.config	= &s5p64x0_gpio_cfgs[3],
 		.chip	= {
 			.base	= S5P6440_GPI(0),
@@ -266,7 +284,7 @@ static struct s3c_gpio_chip s5p6440_gpio_2bit[] = {
 			.label	= "GPI",
 		},
 	}, {
-		.base	= S5P6440_GPJ_BASE,
+		.base	= S5P64X0_GPJ_BASE,
 		.config	= &s5p64x0_gpio_cfgs[3],
 		.chip	= {
 			.base	= S5P6440_GPJ(0),
@@ -274,7 +292,7 @@ static struct s3c_gpio_chip s5p6440_gpio_2bit[] = {
 			.label	= "GPJ",
 		},
 	}, {
-		.base	= S5P6440_GPN_BASE,
+		.base	= S5P64X0_GPN_BASE,
 		.config	= &s5p64x0_gpio_cfgs[4],
 		.chip	= {
 			.base	= S5P6440_GPN(0),
@@ -282,7 +300,7 @@ static struct s3c_gpio_chip s5p6440_gpio_2bit[] = {
 			.label	= "GPN",
 		},
 	}, {
-		.base	= S5P6440_GPP_BASE,
+		.base	= S5P64X0_GPP_BASE,
 		.config	= &s5p64x0_gpio_cfgs[5],
 		.chip	= {
 			.base	= S5P6440_GPP(0),
@@ -292,6 +310,142 @@ static struct s3c_gpio_chip s5p6440_gpio_2bit[] = {
 	},
 };
 
+static struct s3c_gpio_chip s5p6450_gpio_4bit[] = {
+	{
+		.base	= S5P64X0_GPA_BASE,
+		.config	= &s5p64x0_gpio_cfgs[1],
+		.chip	= {
+			.base	= S5P6450_GPA(0),
+			.ngpio	= S5P6450_GPIO_A_NR,
+			.label	= "GPA",
+		},
+	}, {
+		.base	= S5P64X0_GPB_BASE,
+		.config	= &s5p64x0_gpio_cfgs[1],
+		.chip	= {
+			.base	= S5P6450_GPB(0),
+			.ngpio	= S5P6450_GPIO_B_NR,
+			.label	= "GPB",
+		},
+	}, {
+		.base	= S5P64X0_GPC_BASE,
+		.config	= &s5p64x0_gpio_cfgs[1],
+		.chip	= {
+			.base	= S5P6450_GPC(0),
+			.ngpio	= S5P6450_GPIO_C_NR,
+			.label	= "GPC",
+		},
+	}, {
+		.base	= S5P6450_GPD_BASE,
+		.config	= &s5p64x0_gpio_cfgs[1],
+		.chip	= {
+			.base	= S5P6450_GPD(0),
+			.ngpio	= S5P6450_GPIO_D_NR,
+			.label	= "GPD",
+		},
+	}, {
+		.base	= S5P6450_GPK_BASE,
+		.config	= &s5p64x0_gpio_cfgs[1],
+		.chip	= {
+			.base	= S5P6450_GPK(0),
+			.ngpio	= S5P6450_GPIO_K_NR,
+			.label	= "GPK",
+		},
+	},
+};
+
+static struct s3c_gpio_chip s5p6450_gpio_4bit2[] = {
+	{
+		.base	= S5P64X0_GPG_BASE + 0x4,
+		.config	= &s5p64x0_gpio_cfgs[1],
+		.chip	= {
+			.base	= S5P6450_GPG(0),
+			.ngpio	= S5P6450_GPIO_G_NR,
+			.label	= "GPG",
+		},
+	}, {
+		.base	= S5P64X0_GPH_BASE + 0x4,
+		.config	= &s5p64x0_gpio_cfgs[1],
+		.chip	= {
+			.base	= S5P6450_GPH(0),
+			.ngpio	= S5P6450_GPIO_H_NR,
+			.label	= "GPH",
+		},
+	},
+};
+
+static struct s3c_gpio_chip s5p6450_gpio_rbank_4bit2[] = {
+	{
+		.base	= S5P64X0_GPR_BASE + 0x4,
+		.config	= &s5p64x0_gpio_cfgs[2],
+		.chip	= {
+			.base	= S5P6450_GPR(0),
+			.ngpio	= S5P6450_GPIO_R_NR,
+			.label	= "GPR",
+		},
+	},
+};
+
+static struct s3c_gpio_chip s5p6450_gpio_2bit[] = {
+	{
+		.base	= S5P64X0_GPF_BASE,
+		.config	= &s5p64x0_gpio_cfgs[5],
+		.chip	= {
+			.base	= S5P6450_GPF(0),
+			.ngpio	= S5P6450_GPIO_F_NR,
+			.label	= "GPF",
+		},
+	}, {
+		.base	= S5P64X0_GPI_BASE,
+		.config	= &s5p64x0_gpio_cfgs[3],
+		.chip	= {
+			.base	= S5P6450_GPI(0),
+			.ngpio	= S5P6450_GPIO_I_NR,
+			.label	= "GPI",
+		},
+	}, {
+		.base	= S5P64X0_GPJ_BASE,
+		.config	= &s5p64x0_gpio_cfgs[3],
+		.chip	= {
+			.base	= S5P6450_GPJ(0),
+			.ngpio	= S5P6450_GPIO_J_NR,
+			.label	= "GPJ",
+		},
+	}, {
+		.base	= S5P64X0_GPN_BASE,
+		.config	= &s5p64x0_gpio_cfgs[4],
+		.chip	= {
+			.base	= S5P6450_GPN(0),
+			.ngpio	= S5P6450_GPIO_N_NR,
+			.label	= "GPN",
+		},
+	}, {
+		.base	= S5P64X0_GPP_BASE,
+		.config	= &s5p64x0_gpio_cfgs[5],
+		.chip	= {
+			.base	= S5P6450_GPP(0),
+			.ngpio	= S5P6450_GPIO_P_NR,
+			.label	= "GPP",
+		},
+	}, {
+		.base	= S5P6450_GPQ_BASE,
+		.config	= &s5p64x0_gpio_cfgs[4],
+		.chip	= {
+			.base	= S5P6450_GPQ(0),
+			.ngpio	= S5P6450_GPIO_Q_NR,
+			.label	= "GPQ",
+		},
+	}, {
+		.base	= S5P6450_GPS_BASE,
+		.config	= &s5p64x0_gpio_cfgs[5],
+		.chip	= {
+			.base	= S5P6450_GPS(0),
+			.ngpio	= S5P6450_GPIO_S_NR,
+			.label	= "GPS",
+		},
+	},
+};
+
 void __init s5p64x0_gpiolib_set_cfg(struct s3c_gpio_cfg *chipcfg, int nr_chips)
 {
 	for (; nr_chips > 0; nr_chips--, chipcfg++) {
@@ -317,26 +471,46 @@ static void __init s5p64x0_gpio_add_rbank_4bit2(struct s3c_gpio_chip *chip,
 	}
 }
 
-static int __init s5p6440_gpiolib_init(void)
+static int __init s5p64x0_gpiolib_init(void)
 {
-	struct s3c_gpio_chip *chips = s5p6440_gpio_2bit;
-	int nr_chips = ARRAY_SIZE(s5p6440_gpio_2bit);
+	struct s3c_gpio_chip *s5p6440_chips = s5p6440_gpio_2bit;
+	int s5p6440_nr_chips = ARRAY_SIZE(s5p6440_gpio_2bit);
+
+	struct s3c_gpio_chip *s5p6450_chips = s5p6450_gpio_2bit;
+	int s5p6450_nr_chips = ARRAY_SIZE(s5p6450_gpio_2bit);
+
+	unsigned int chipid;
 
 	s5p64x0_gpiolib_set_cfg(s5p64x0_gpio_cfgs,
 				ARRAY_SIZE(s5p64x0_gpio_cfgs));
+	chipid = __raw_readl(S5P64X0_SYS_ID);
+
+	if ((chipid & 0xff000) == 0x50000) {
+		for (; s5p6450_nr_chips > 0; s5p6450_nr_chips--, s5p6450_chips++)
+			s3c_gpiolib_add(s5p6450_chips);
 
-	for (; nr_chips > 0; nr_chips--, chips++)
-		s3c_gpiolib_add(chips);
+		samsung_gpiolib_add_4bit_chips(s5p6450_gpio_4bit,
+					ARRAY_SIZE(s5p6450_gpio_4bit));
 
-	samsung_gpiolib_add_4bit_chips(s5p6440_gpio_4bit,
-				ARRAY_SIZE(s5p6440_gpio_4bit));
+		samsung_gpiolib_add_4bit2_chips(s5p6450_gpio_4bit2,
+					ARRAY_SIZE(s5p6450_gpio_4bit2));
 
-	samsung_gpiolib_add_4bit2_chips(s5p6440_gpio_4bit2,
-				ARRAY_SIZE(s5p6440_gpio_4bit2));
+		s5p64x0_gpio_add_rbank_4bit2(s5p6450_gpio_rbank_4bit2,
+					ARRAY_SIZE(s5p6450_gpio_rbank_4bit2));
+	} else {
+		for (; s5p6440_nr_chips > 0; s5p6440_nr_chips--, s5p6440_chips++)
+			s3c_gpiolib_add(s5p6440_chips);
 
-	s5p64x0_gpio_add_rbank_4bit2(s5p6440_gpio_rbank_4bit2,
-				ARRAY_SIZE(s5p6440_gpio_rbank_4bit2));
+		samsung_gpiolib_add_4bit_chips(s5p6440_gpio_4bit,
+					ARRAY_SIZE(s5p6440_gpio_4bit));
+
+		samsung_gpiolib_add_4bit2_chips(s5p6440_gpio_4bit2,
+					ARRAY_SIZE(s5p6440_gpio_4bit2));
+
+		s5p64x0_gpio_add_rbank_4bit2(s5p6440_gpio_rbank_4bit2,
+					ARRAY_SIZE(s5p6440_gpio_rbank_4bit2));
+	}
 
 	return 0;
 }
-arch_initcall(s5p6440_gpiolib_init);
+arch_initcall(s5p64x0_gpiolib_init);
diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
index 85f448e..0953ef6 100644
--- a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
@@ -15,48 +15,23 @@
 
 #include <mach/map.h>
 
-/* Will be implemented S5P6442 GPIOlib */
-
 /* Base addresses for each of the banks */
 
-#define S5P6440_GPA_BASE		(S5P_VA_GPIO + 0x0000)
-#define S5P6440_GPB_BASE		(S5P_VA_GPIO + 0x0020)
-#define S5P6440_GPC_BASE		(S5P_VA_GPIO + 0x0040)
-#define S5P6440_GPF_BASE		(S5P_VA_GPIO + 0x00A0)
-#define S5P6440_GPG_BASE		(S5P_VA_GPIO + 0x00C0)
-#define S5P6440_GPH_BASE		(S5P_VA_GPIO + 0x00E0)
-#define S5P6440_GPI_BASE		(S5P_VA_GPIO + 0x0100)
-#define S5P6440_GPJ_BASE		(S5P_VA_GPIO + 0x0120)
-#define S5P6440_GPN_BASE		(S5P_VA_GPIO + 0x0830)
-#define S5P6440_GPP_BASE		(S5P_VA_GPIO + 0x0160)
-#define S5P6440_GPR_BASE		(S5P_VA_GPIO + 0x0290)
-
-#define S5P6440_EINT0CON0		(S5P_VA_GPIO + 0x900)
-#define S5P6440_EINT0FLTCON0		(S5P_VA_GPIO + 0x910)
-#define S5P6440_EINT0FLTCON1		(S5P_VA_GPIO + 0x914)
-#define S5P6440_EINT0MASK		(S5P_VA_GPIO + 0x920)
-#define S5P6440_EINT0PEND		(S5P_VA_GPIO + 0x924)
-
-/* for LCD */
-
-#define S5P6440_SPCON_LCD_SEL_RGB	(1 << 0)
-#define S5P6440_SPCON_LCD_SEL_MASK	(3 << 0)
-
-/*
- * These set of macros are not really useful for the
- * GPF/GPI/GPJ/GPN/GPP, useful for others set of GPIO's (4 bit)
- */
-
-#define S5P6440_GPIO_CONMASK(__gpio)	(0xf << ((__gpio) * 4))
-#define S5P6440_GPIO_INPUT(__gpio)	(0x0 << ((__gpio) * 4))
-#define S5P6440_GPIO_OUTPUT(__gpio)	(0x1 << ((__gpio) * 4))
-
-/*
- * Use these macros for GPF/GPI/GPJ/GPN/GPP set of GPIO (2 bit)
- */
-
-#define S5P6440_GPIO2_CONMASK(__gpio)	(0x3 << ((__gpio) * 2))
-#define S5P6440_GPIO2_INPUT(__gpio)	(0x0 << ((__gpio) * 2))
-#define S5P6440_GPIO2_OUTPUT(__gpio)	(0x1 << ((__gpio) * 2))
+#define S5P64X0_GPA_BASE		(S5P_VA_GPIO + 0x0000)
+#define S5P64X0_GPB_BASE		(S5P_VA_GPIO + 0x0020)
+#define S5P64X0_GPC_BASE		(S5P_VA_GPIO + 0x0040)
+#define S5P64X0_GPF_BASE		(S5P_VA_GPIO + 0x00A0)
+#define S5P64X0_GPG_BASE		(S5P_VA_GPIO + 0x00C0)
+#define S5P64X0_GPH_BASE		(S5P_VA_GPIO + 0x00E0)
+#define S5P64X0_GPI_BASE		(S5P_VA_GPIO + 0x0100)
+#define S5P64X0_GPJ_BASE		(S5P_VA_GPIO + 0x0120)
+#define S5P64X0_GPN_BASE		(S5P_VA_GPIO + 0x0830)
+#define S5P64X0_GPP_BASE		(S5P_VA_GPIO + 0x0160)
+#define S5P64X0_GPR_BASE		(S5P_VA_GPIO + 0x0290)
+
+#define S5P6450_GPD_BASE		(S5P_VA_GPIO + 0x0060)
+#define S5P6450_GPK_BASE		(S5P_VA_GPIO + 0x0140)
+#define S5P6450_GPQ_BASE		(S5P_VA_GPIO + 0x0180)
+#define S5P6450_GPS_BASE		(S5P_VA_GPIO + 0x0300)
 
 #endif /* __ASM_ARCH_REGS_GPIO_H */
-- 
1.6.2.5
