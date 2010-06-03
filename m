From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 7/7] ARM: S5P: Add GPIOlib gpio_to_irq for gpio interrupts
Date: Thu, 03 Jun 2010 14:01:39 +0900
Message-ID: <1275541299-25566-7-git-send-email-jy0922.shim@samsung.com>
References: <1275541299-25566-1-git-send-email-jy0922.shim@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47087 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751747Ab0FCFFi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jun 2010 01:05:38 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L3F008LKA58IJ@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 14:05:32 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L3F00HQKA5807@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 14:05:32 +0900 (KST)
In-reply-to: <1275541299-25566-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

This patch is to support gpio_to_irq() of GPIOlib for gpio interrupts on
s5p cpus. The gpio_to_irq() calls s5p_gpiolib_gpioint_to_irq function.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pc100/gpiolib.c                |    7 +------
 arch/arm/mach-s5pv210/gpiolib.c                |    1 +
 arch/arm/plat-s5p/gpiolib.c                    |    7 +++++++
 arch/arm/plat-samsung/include/plat/gpio-core.h |    2 ++
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pc100/gpiolib.c b/arch/arm/mach-s5pc100/gpiolib.c
index a34a700..2dcb501 100644
--- a/arch/arm/mach-s5pc100/gpiolib.c
+++ b/arch/arm/mach-s5pc100/gpiolib.c
@@ -61,11 +61,6 @@
  * L3	8	4Bit	None
  */
 
-static int s5pc100_gpiolib_to_irq(struct gpio_chip *chip, unsigned int offset)
-{
-	return S5P_IRQ_GPIOINT(chip->base + offset);
-}
-
 static struct s3c_gpio_cfg gpio_cfg = {
 	.set_config	= s3c_gpio_setcfg_s3c64xx_4bit,
 	.set_pull	= s3c_gpio_setpull_updown,
@@ -377,7 +372,7 @@ static __init int s5pc100_gpiolib_init(void)
 	for (; nr_chips > 0; nr_chips--, chip++) {
 		if (chip->config == &gpio_cfg) {
 			/* gpio interrupts */
-			chip->chip.to_irq = s5pc100_gpiolib_to_irq;
+			chip->chip.to_irq = s5p_gpiolib_gpioint_to_irq;
 			s5p_gpioint_add(chip, gpioint_group++);
 		}
 	}
diff --git a/arch/arm/mach-s5pv210/gpiolib.c b/arch/arm/mach-s5pv210/gpiolib.c
index 166725f..f4ac81f 100644
--- a/arch/arm/mach-s5pv210/gpiolib.c
+++ b/arch/arm/mach-s5pv210/gpiolib.c
@@ -258,6 +258,7 @@ static __init int s5pv210_gpiolib_init(void)
 			chip->config = &gpio_cfg;
 
 			/* gpio interrupts */
+			chip->chip.to_irq = s5p_gpiolib_gpioint_to_irq;
 			s5p_gpioint_add(chip, gpioint_group++);
 		}
 		if (chip->base == NULL)
diff --git a/arch/arm/plat-s5p/gpiolib.c b/arch/arm/plat-s5p/gpiolib.c
index 0c27a9d..dcd1ee4 100644
--- a/arch/arm/plat-s5p/gpiolib.c
+++ b/arch/arm/plat-s5p/gpiolib.c
@@ -33,3 +33,10 @@ int s5p_gpiolib_eint_to_irq(struct gpio_chip *chip, unsigned int offset)
 		return -EINVAL;
 	}
 }
+
+/* be called from gpio_to_irq() for gpio interrupts */
+int s5p_gpiolib_gpioint_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	return S5P_IRQ_GPIOINT(chip->base + offset);
+}
+
diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h b/arch/arm/plat-samsung/include/plat/gpio-core.h
index a6b844c..d484aaf 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-core.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
@@ -122,6 +122,8 @@ extern void samsung_gpiolib_add_4bit2(struct s3c_gpio_chip *chip);
 extern struct s3c_gpio_cfg s3c24xx_gpiocfg_default;
 
 extern int s5p_gpiolib_eint_to_irq(struct gpio_chip *chip, unsigned int offset);
+extern int s5p_gpiolib_gpioint_to_irq(struct gpio_chip *chip,
+		unsigned int offset);
 
 extern void s5p_gpioint_add(struct s3c_gpio_chip *chip, int group);
 
-- 
1.7.0.4
