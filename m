From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 4/7] ARM: S5PC100: Use S5P GPIOlib gpio_to_irq function for
 external interrupts
Date: Thu, 03 Jun 2010 14:01:36 +0900
Message-ID: <1275541299-25566-4-git-send-email-jy0922.shim@samsung.com>
References: <1275541299-25566-1-git-send-email-jy0922.shim@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47087 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752104Ab0FCFFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jun 2010 01:05:37 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L3F00685A58V0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 14:05:32 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L3F00M5IA57RU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 14:05:32 +0900 (KST)
In-reply-to: <1275541299-25566-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

This changes from s5pc100 machine specific gpio_to_irq function to
S5P GPIOlib gpio_to_irq function for external interrupts.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pc100/gpiolib.c |   25 ++++---------------------
 1 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-s5pc100/gpiolib.c b/arch/arm/mach-s5pc100/gpiolib.c
index 0fab7f2..60704ef 100644
--- a/arch/arm/mach-s5pc100/gpiolib.c
+++ b/arch/arm/mach-s5pc100/gpiolib.c
@@ -66,25 +66,6 @@ static int s5pc100_gpiolib_to_irq(struct gpio_chip *chip, unsigned int offset)
 	return S3C_IRQ_GPIO(chip->base + offset);
 }
 
-static int s5pc100_gpiolib_to_eint(struct gpio_chip *chip, unsigned int offset)
-{
-	int base;
-
-	base = chip->base - S5PC100_GPH0(0);
-	if (base == 0)
-		return IRQ_EINT(offset);
-	base = chip->base - S5PC100_GPH1(0);
-	if (base == 0)
-		return IRQ_EINT(8 + offset);
-	base = chip->base - S5PC100_GPH2(0);
-	if (base == 0)
-		return IRQ_EINT(16 + offset);
-	base = chip->base - S5PC100_GPH3(0);
-	if (base == 0)
-		return IRQ_EINT(24 + offset);
-	return -EINVAL;
-}
-
 static struct s3c_gpio_cfg gpio_cfg = {
 	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
 	.set_pull	= s3c_gpio_setpull_updown,
@@ -232,6 +213,7 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.base	= S5PC100_GPH0(0),
 			.ngpio	= S5PC100_GPIO_H0_NR,
 			.label	= "GPH0",
+			.to_irq = s5p_gpiolib_eint_to_irq,
 		},
 	}, {
 		.base	= S5PC100_GPH1_BASE,
@@ -240,6 +222,7 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.base	= S5PC100_GPH1(0),
 			.ngpio	= S5PC100_GPIO_H1_NR,
 			.label	= "GPH1",
+			.to_irq = s5p_gpiolib_eint_to_irq,
 		},
 	}, {
 		.base	= S5PC100_GPH2_BASE,
@@ -248,6 +231,7 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.base	= S5PC100_GPH2(0),
 			.ngpio	= S5PC100_GPIO_H2_NR,
 			.label	= "GPH2",
+			.to_irq = s5p_gpiolib_eint_to_irq,
 		},
 	}, {
 		.base	= S5PC100_GPH3_BASE,
@@ -256,6 +240,7 @@ static struct s3c_gpio_chip s5pc100_gpio_chips[] = {
 			.base	= S5PC100_GPH3(0),
 			.ngpio	= S5PC100_GPIO_H3_NR,
 			.label	= "GPH3",
+			.to_irq = s5p_gpiolib_eint_to_irq,
 		},
 	}, {
 		.base	= S5PC100_GPI_BASE,
@@ -399,8 +384,6 @@ static __init void s5pc100_gpiolib_link(struct s3c_gpio_chip *chip)
 			set_irq_handler(irq, handle_level_irq);
 			set_irq_flags(irq, IRQF_VALID);
 		}
-	} else if (chip->config == &gpio_cfg_eint) {
-		chip->chip.to_irq = s5pc100_gpiolib_to_eint;
 	}
 }
 
-- 
1.7.0.4
