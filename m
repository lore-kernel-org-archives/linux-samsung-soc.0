From: Youngmin Nam <ym0914@gmail.com>
Subject: [PATCH v2] pinctrl: samsung: Fixes samsung_gpio_direction_in/output releated with spinlock
Date: Sun, 24 Jan 2016 15:02:32 +0900
Message-ID: <1453615352-9748-1-git-send-email-ym0914@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36008 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892AbcAXGEE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2016 01:04:04 -0500
Received: by mail-pa0-f65.google.com with SMTP id a20so5100606pag.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Jan 2016 22:04:03 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tomasz.figa@gmail.com, k.kozlowski@samsung.com, linus.walleij@linaro.org, kgene@kernel.org, thomas.ab@samsung.com
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

Additionally, the new samsung_gpio_set_value was added to implement
gpio set callback(samsung_gpio_set) with spinlock using this function.

Signed-off-by: Youngmin Nam <ym0914@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 48 ++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 48294e7..c5828b8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -519,25 +519,35 @@ static const struct pinconf_ops samsung_pinconf_ops = {
 	.pin_config_group_set	= samsung_pinconf_group_set,
 };
 
-/* gpiolib gpio_set callback function */
-static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+/*
+ * The samsung_gpio_set_vlaue() should be called with "bank->slock" held
+ * to avoid race condition.
+ */
+static void samsung_gpio_set_value(struct gpio_chip *gc,
+					  unsigned offset, int value)
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
+/* gpiolib gpio_set callback function */
+static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+{
+	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	unsigned long flags;
 
+	spin_lock_irqsave(&bank->slock, flags);
+	samsung_gpio_set_value(gc, offset, value);
 	spin_unlock_irqrestore(&bank->slock, flags);
 }
 
@@ -558,6 +568,8 @@ static int samsung_gpio_get(struct gpio_chip *gc, unsigned offset)
 }
 
 /*
+ * The samsung_gpio_set_direction() should be called with "bank->slock" held
+ * to avoid race condition.
  * The calls to gpio_direction_output() and gpio_direction_input()
  * leads to this function call.
  */
@@ -569,7 +581,6 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 	struct samsung_pinctrl_drv_data *drvdata;
 	void __iomem *reg;
 	u32 data, mask, shift;
-	unsigned long flags;
 
 	bank = gc_to_pin_bank(gc);
 	type = bank->type;
@@ -586,31 +597,42 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
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
-	samsung_gpio_set(gc, offset, value);
-	return samsung_gpio_set_direction(gc, offset, false);
+	struct samsung_pin_bank *bank = gc_to_pin_bank(gc);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&bank->slock, flags);
+	samsung_gpio_set_value(gc, offset, value);
+	ret = samsung_gpio_set_direction(gc, offset, false);
+	spin_unlock_irqrestore(&bank->slock, flags);
+
+	return ret;
 }
 
 /*
-- 
2.7.0.25.gfc10eb5
