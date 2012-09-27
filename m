From: Eunki Kim <eunki_kim@samsung.com>
Subject: [PATCH 1/2] ARM: SAMSUNG: Insert bitmap_gpio_int member in
 samsung_gpio_chip
Date: Thu, 27 Sep 2012 12:55:19 +0900
Message-ID: <000001cd9c63$e95c7b60$bc157220$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50224 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753741Ab2I0DzV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Sep 2012 23:55:21 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAZ00HZ3PK2X3L0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 12:55:19 +0900 (KST)
Received: from DOEUNKIKIM03 ([12.23.118.132])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAZ00D48PK72110@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 12:55:19 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, eunki_kim@samsung.com

When a device uses GPIO interrupt, its driver assumes that GPIO
should be INPUT mode. However, GPIO of SAMSUNG SoC is sepated to
INPUT mode and INTERRUPT mode. They are set by 0x0 and 0xF in GPIO
control register. If the register is set to INPUT mode, the
interrupt never occur. Therefore, it's necessary to set INTERRUPT
mode instead of INPUT mode when the pin is used for GPIO interrupt.

This patch inserts the bitmap_gpio_int member in struct samsung_
gpio_chip in order to represent use of GPIO interrupt for each pin
and sets the related bit when s5p_register_gpio_interrupt function
is called.

Signed-off-by: Eunki Kim <eunki_kim@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/plat-samsung/include/plat/gpio-core.h |    2 ++
 arch/arm/plat-samsung/s5p-irq-gpioint.c        |    8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h
b/arch/arm/plat-samsung/include/plat/gpio-core.h
index 1fe6917..dfd8b7a 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-core.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
@@ -48,6 +48,7 @@ struct samsung_gpio_cfg;
  * @config: special function and pull-resistor control information.
  * @lock: Lock for exclusive access to this gpio bank.
  * @pm_save: Save information for suspend/resume support.
+ * @bitmap_gpio_int: Bitmap for representing GPIO interrupt or not.
  *
  * This wrapper provides the necessary information for the Samsung
  * specific gpios being registered with gpiolib.
@@ -71,6 +72,7 @@ struct samsung_gpio_chip {
 #ifdef CONFIG_PM
 	u32			pm_save[4];
 #endif
+	u32			bitmap_gpio_int;
 };
 
 static inline struct samsung_gpio_chip *to_samsung_gpio(struct gpio_chip *gpc)
diff --git a/arch/arm/plat-samsung/s5p-irq-gpioint.c b/arch/arm/plat-samsung/s5p-irq-gpioint.c
index f9431fe..d981c61 100644
--- a/arch/arm/plat-samsung/s5p-irq-gpioint.c
+++ b/arch/arm/plat-samsung/s5p-irq-gpioint.c
@@ -185,7 +185,7 @@ int __init s5p_register_gpio_interrupt(int pin)
 
 	/* check if the group has been already registered */
 	if (my_chip->irq_base)
-		return my_chip->irq_base + offset;
+		goto success;
 
 	/* register gpio group */
 	ret = s5p_gpioint_add(my_chip);
@@ -193,9 +193,13 @@ int __init s5p_register_gpio_interrupt(int pin)
 		my_chip->chip.to_irq = samsung_gpiolib_to_irq;
 		printk(KERN_INFO "Registered interrupt support for gpio group %d.\n",
 		       group);
-		return my_chip->irq_base + offset;
+		goto success;
 	}
 	return ret;
+success:
+	my_chip->bitmap_gpio_int |= BIT(offset);
+
+	return my_chip->irq_base + offset;
 }
 
 int __init s5p_register_gpioint_bank(int chain_irq, int start, int nr_groups)
-- 
1.7.1
