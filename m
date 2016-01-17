From: Youngmin Nam <ym0914@gmail.com>
Subject: [PATCH] pinctrl: samsung: Fixes samsung_gpio_direction_in/output releated with spinlock
Date: Sun, 17 Jan 2016 16:41:13 +0900
Message-ID: <1453016473-14203-1-git-send-email-ym0914@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:34256 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753356AbcAQHlS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2016 02:41:18 -0500
Received: by mail-pf0-f181.google.com with SMTP id q63so144758868pfb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Jan 2016 23:41:17 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, Youngmin Nam <ym0914@gmail.com>

Previously, samsung_gpio_drection_in/output function were not covered with
one spinlock.

For example, samsung_gpio_direction_output function consists of two functions.
1. samsung_gpio_set
2. samsung_gpio_set_direction

When 2 CPUs try to control the same gpio pin heavily,
(situation like i2c control with gpio emulation)
This situation can cause below problem.

CPU 0                                   | CPU1
                                        |
samsung_gpio_direction_output           |
   samsung_gpio_set(pin A as 1)         | samsung_gpio_direction_output
                                        |    samsung_gpio_set(pin A as 0)
   samsung_gpio_set_direction           |
                                        |    samsung_gpio_set_direction

The initial value of pin A will be set as 0 while we wanted to set pin A as 1.

This patch modifies samsung_gpio_direction_in/output function
to be done in one spinlock to fix race condition.

Additionally, gpio set callback was changed with samsung_gpio_set_value
to implement gpio set callback with spinlock using samsung_gpio_set.

Signed-off-by: Youngmin Nam <ym0914@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 38 ++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 48294e7..a25f6f6 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -524,20 +524,26 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 {
 	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
 	const struct samsung_pin_bank_type *type = bank->type;
-	unsigned long flags;
 	void __iomem *reg;
 	u32 data;
 
 	reg = bank->drvdata->virt_base + bank->pctl_offset;
 
-	spin_lock_irqsave(&bank->slock, flags);
-
 	data = readl(reg + type->reg_offset[PINCFG_TYPE_DAT]);
 	data &= ~(1 << offset);
 	if (value)
 		data |= 1 << offset;
 	writel(data, reg + type->reg_offset[PINCFG_TYPE_DAT]);
+}
+
+static void samsung_gpio_set_value(struct gpio_chip *gc,
+					  unsigned offset, int value)
+{
+	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	unsigned long flags;
 
+	spin_lock_irqsave(&bank->slock, flags);
+	samsung_gpio_set(gc, offset, value);
 	spin_unlock_irqrestore(&bank->slock, flags);
 }
 
@@ -569,7 +575,6 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 	struct samsung_pinctrl_drv_data *drvdata;
 	void __iomem *reg;
 	u32 data, mask, shift;
-	unsigned long flags;
 
 	bank = gc_to_pin_bank(gc);
 	type = bank->type;
@@ -586,31 +591,42 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 		reg += 4;
 	}
 
-	spin_lock_irqsave(&bank->slock, flags);
-
 	data = readl(reg);
 	data &= ~(mask << shift);
 	if (!input)
 		data |= FUNC_OUTPUT << shift;
 	writel(data, reg);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
-
 	return 0;
 }
 
 /* gpiolib gpio_direction_input callback function. */
 static int samsung_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	return samsung_gpio_set_direction(gc, offset, true);
+	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&bank->slock, flags);
+	ret = samsung_gpio_set_direction(gc, offset, true);
+	spin_unlock_irqrestore(&bank->slock, flags);
+	return ret;
 }
 
 /* gpiolib gpio_direction_output callback function. */
 static int samsung_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 							int value)
 {
+	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&bank->slock, flags);
 	samsung_gpio_set(gc, offset, value);
-	return samsung_gpio_set_direction(gc, offset, false);
+	ret = samsung_gpio_set_direction(gc, offset, false);
+	spin_unlock_irqrestore(&bank->slock, flags);
+
+	return ret;
 }
 
 /*
@@ -891,7 +907,7 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = samsung_gpio_set,
+	.set = samsung_gpio_set_value,
 	.get = samsung_gpio_get,
 	.direction_input = samsung_gpio_direction_input,
 	.direction_output = samsung_gpio_direction_output,
-- 
2.7.0.25.gfc10eb5
