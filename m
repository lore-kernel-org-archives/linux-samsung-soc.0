From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] pinctrl: samsung: Remove unneeded local variable initialization
Date: Tue, 18 Jul 2017 19:43:28 +0200
Message-ID: <1500399808-6580-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751433AbdGRRnf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 13:43:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Two local variables (shift and reg_con) were initialized to unused
values - they were overwritten just few lines after.  Getting rid of
this unused initialization allows dropping other variables and
compacting slightly the code.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 731530a9ce38..f6bdbc8cd5c0 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -149,15 +149,10 @@ static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
 
 static int exynos_irq_request_resources(struct irq_data *irqd)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
-	struct exynos_irq_chip *our_chip = to_exynos_irq_chip(chip);
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	const struct samsung_pin_bank_type *bank_type = bank->type;
-	unsigned int shift = EXYNOS_EINT_CON_LEN * irqd->hwirq;
-	unsigned long reg_con = our_chip->eint_con + bank->eint_offset;
-	unsigned long flags;
-	unsigned int mask;
-	unsigned int con;
+	unsigned long reg_con, flags;
+	unsigned int shift, mask, con;
 	int ret;
 
 	ret = gpiochip_lock_as_irq(&bank->gpio_chip, irqd->hwirq);
@@ -186,15 +181,10 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
 
 static void exynos_irq_release_resources(struct irq_data *irqd)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
-	struct exynos_irq_chip *our_chip = to_exynos_irq_chip(chip);
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	const struct samsung_pin_bank_type *bank_type = bank->type;
-	unsigned int shift = EXYNOS_EINT_CON_LEN * irqd->hwirq;
-	unsigned long reg_con = our_chip->eint_con + bank->eint_offset;
-	unsigned long flags;
-	unsigned int mask;
-	unsigned int con;
+	unsigned long reg_con, flags;
+	unsigned int shift, mask, con;
 
 	reg_con = bank->pctl_offset + bank_type->reg_offset[PINCFG_TYPE_FUNC];
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
-- 
2.7.4
