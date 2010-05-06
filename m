From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 03/23] ARM: S3C24XX: Add extended GPIO used on S3C2443 and beyond
Date: Fri,  7 May 2010 08:15:25 +0900
Message-ID: <1273187745-6566-4-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60608 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751363Ab0EFXQD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:03 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add the GPIO banks that are used on the S3C2443 and above to the
list of available GPIOS.

Currently we do not have any limit on the SoC GPIO, so these are
being registered whether the SoC has them or not. It is currently
up to the user not to try and use them.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/include/mach/gpio-nrs.h   |   12 +++++++
 arch/arm/mach-s3c2410/include/mach/regs-gpio.h  |   17 +++++++++
 arch/arm/mach-s3c2410/include/mach/regs-gpioj.h |    4 --
 arch/arm/plat-s3c24xx/gpiolib.c                 |   41 ++++++++++++++++++++++-
 4 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h b/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
index 2edbb9c..f3182ff 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio-nrs.h
@@ -34,6 +34,10 @@
 #define S3C2410_GPIO_F_NR	(32)
 #define S3C2410_GPIO_G_NR	(32)
 #define S3C2410_GPIO_H_NR	(32)
+#define S3C2410_GPIO_J_NR	(32)	/* technically 16. */
+#define S3C2410_GPIO_K_NR	(32)	/* technically 16. */
+#define S3C2410_GPIO_L_NR	(32)	/* technically 15. */
+#define S3C2410_GPIO_M_NR	(32)	/* technically 2. */
 
 #if CONFIG_S3C_GPIO_SPACE != 0
 #error CONFIG_S3C_GPIO_SPACE cannot be zero at the moment
@@ -53,6 +57,10 @@ enum s3c_gpio_number {
 	S3C2410_GPIO_F_START = S3C2410_GPIO_NEXT(S3C2410_GPIO_E),
 	S3C2410_GPIO_G_START = S3C2410_GPIO_NEXT(S3C2410_GPIO_F),
 	S3C2410_GPIO_H_START = S3C2410_GPIO_NEXT(S3C2410_GPIO_G),
+	S3C2410_GPIO_J_START = S3C2410_GPIO_NEXT(S3C2410_GPIO_H),
+	S3C2410_GPIO_K_START = S3C2410_GPIO_NEXT(S3C2410_GPIO_J),
+	S3C2410_GPIO_L_START = S3C2410_GPIO_NEXT(S3C2410_GPIO_K),
+	S3C2410_GPIO_M_START = S3C2410_GPIO_NEXT(S3C2410_GPIO_L),
 };
 
 #endif /* __ASSEMBLY__ */
@@ -67,6 +75,10 @@ enum s3c_gpio_number {
 #define S3C2410_GPF(_nr)	(S3C2410_GPIO_F_START + (_nr))
 #define S3C2410_GPG(_nr)	(S3C2410_GPIO_G_START + (_nr))
 #define S3C2410_GPH(_nr)	(S3C2410_GPIO_H_START + (_nr))
+#define S3C2410_GPJ(_nr)	(S3C2410_GPIO_J_START + (_nr))
+#define S3C2410_GPK(_nr)	(S3C2410_GPIO_K_START + (_nr))
+#define S3C2410_GPL(_nr)	(S3C2410_GPIO_L_START + (_nr))
+#define S3C2410_GPM(_nr)	(S3C2410_GPIO_M_START + (_nr))
 
 /* compatibility until drivers can be modified */
 
diff --git a/arch/arm/mach-s3c2410/include/mach/regs-gpio.h b/arch/arm/mach-s3c2410/include/mach/regs-gpio.h
index fd672f3..821b966 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-gpio.h
@@ -639,6 +639,23 @@
  * for the 2412/2413 from the 2410/2440/2442
 */
 
+/* S3C2443 and above */
+#define S3C2440_GPJCON	   S3C2410_GPIOREG(0xD0)
+#define S3C2440_GPJDAT	   S3C2410_GPIOREG(0xD4)
+#define S3C2440_GPJUP	   S3C2410_GPIOREG(0xD8)
+
+#define S3C2443_GPKCON	   S3C2410_GPIOREG(0xE0)
+#define S3C2443_GPKDAT	   S3C2410_GPIOREG(0xE4)
+#define S3C2443_GPKUP	   S3C2410_GPIOREG(0xE8)
+
+#define S3C2443_GPLCON	   S3C2410_GPIOREG(0xF0)
+#define S3C2443_GPLDAT	   S3C2410_GPIOREG(0xF4)
+#define S3C2443_GPLUP	   S3C2410_GPIOREG(0xF8)
+
+#define S3C2443_GPMCON	   S3C2410_GPIOREG(0x100)
+#define S3C2443_GPMDAT	   S3C2410_GPIOREG(0x104)
+#define S3C2443_GPMUP	   S3C2410_GPIOREG(0x108)
+
 /* miscellaneous control */
 #define S3C2400_MISCCR	   S3C2410_GPIOREG(0x54)
 #define S3C2410_MISCCR	   S3C2410_GPIOREG(0x80)
diff --git a/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h b/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h
index 1202ca5..de463bc 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h
@@ -24,10 +24,6 @@
 
 #define S3C2440_GPIO_BANKJ  (416)
 
-#define S3C2440_GPJCON	    S3C2410_GPIOREG(0xd0)
-#define S3C2440_GPJDAT	    S3C2410_GPIOREG(0xd4)
-#define S3C2440_GPJUP	    S3C2410_GPIOREG(0xd8)
-
 #define S3C2413_GPJCON		S3C2410_GPIOREG(0x80)
 #define S3C2413_GPJDAT		S3C2410_GPIOREG(0x84)
 #define S3C2413_GPJUP		S3C2410_GPIOREG(0x88)
diff --git a/arch/arm/plat-s3c24xx/gpiolib.c b/arch/arm/plat-s3c24xx/gpiolib.c
index 376b061..e8c0e8a 100644
--- a/arch/arm/plat-s3c24xx/gpiolib.c
+++ b/arch/arm/plat-s3c24xx/gpiolib.c
@@ -1,6 +1,6 @@
 /* linux/arch/arm/plat-s3c24xx/gpiolib.c
  *
- * Copyright (c) 2008 Simtec Electronics
+ * Copyright (c) 2008-2010 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
@@ -172,8 +172,47 @@ struct s3c_gpio_chip s3c24xx_gpios[] = {
 			.ngpio			= 11,
 		},
 	},
+		/* GPIOS for the S3C2443 and later devices. */
+	{
+		.base	= S3C2440_GPJCON,
+		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
+		.chip	= {
+			.base			= S3C2410_GPJ(0),
+			.owner			= THIS_MODULE,
+			.label			= "GPIOJ",
+			.ngpio			= 16,
+		},
+	}, {
+		.base	= S3C2443_GPKCON,
+		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
+		.chip	= {
+			.base			= S3C2410_GPK(0),
+			.owner			= THIS_MODULE,
+			.label			= "GPIOK",
+			.ngpio			= 16,
+		},
+	}, {
+		.base	= S3C2443_GPLCON,
+		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
+		.chip	= {
+			.base			= S3C2410_GPL(0),
+			.owner			= THIS_MODULE,
+			.label			= "GPIOL",
+			.ngpio			= 15,
+		},
+	}, {
+		.base	= S3C2443_GPMCON,
+		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
+		.chip	= {
+			.base			= S3C2410_GPM(0),
+			.owner			= THIS_MODULE,
+			.label			= "GPIOM",
+			.ngpio			= 2,
+		},
+	},
 };
 
+
 static __init int s3c24xx_gpiolib_init(void)
 {
 	struct s3c_gpio_chip *chip = s3c24xx_gpios;
-- 
1.7.0.4
