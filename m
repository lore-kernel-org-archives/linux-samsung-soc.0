From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] RFT: pinctrl: samsung: separate wakeup irqdomain
Date: Thu,  9 Apr 2015 09:40:41 +0200
Message-ID: <1428565241-5099-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:35485 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539AbbDIHkt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Apr 2015 03:40:49 -0400
Received: by labbd9 with SMTP id bd9so71887350lab.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Apr 2015 00:40:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

The Samsung pin control driver and subdrivers sometimes use both
an irqdomain for some IRQs and another irqdomain for wakeup irqs,
registering the first with a call to the per-SoC callback
.eint_gpio_init() and the second with a call to .eint_wkup_init()
however it seems both runpaths will assign the resulting irqdomain
to the per-bank bank.irq_domain member, making the second
(wakeup) irqdomain overwrite the first one.

I'm surprised this even works, and it seems that the S3C
per-domain "domain data" that seems to be used in part to work
around this bug by creating a local array with copies of the
irqdomain (!).

This patch mainly adds a new record to the GPIO/pin "bank"
for wakeups and use this in the .eint_wkup_init() callbacks
to pave the way for more cleanups.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Tomasz etc: I don't know if I'm just misunderstanding this,
can you look at it and tell me how badly I misunderstand
these Samsung wakeups, to me it is a complete mystery.
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 6 +++---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 6 +++---
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c | 6 +++---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 1 +
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index c8f83f96546c..6adf34e3cce6 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -469,7 +469,7 @@ static void exynos_irq_demux_eint16_31(unsigned int irq, struct irq_desc *desc)
 				+ b->eint_offset);
 		mask = readl(d->virt_base + b->irq_chip->eint_mask
 				+ b->eint_offset);
-		exynos_irq_demux_eint(pend & ~mask, b->irq_domain);
+		exynos_irq_demux_eint(pend & ~mask, b->wkup_domain);
 	}
 
 	chained_irq_exit(chip, desc);
@@ -511,9 +511,9 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		if (bank->eint_type != EINT_TYPE_WKUP)
 			continue;
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->wkup_domain = irq_domain_add_linear(bank->of_node,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
-		if (!bank->irq_domain) {
+		if (!bank->wkup_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
 			return -ENXIO;
 		}
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index f1993f42114c..1dd1e5a0ed58 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -539,9 +539,9 @@ static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
 		ops = (bank->eint_offset == 0) ? &s3c24xx_gpf_irq_ops
 					       : &s3c24xx_gpg_irq_ops;
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->wkup_domain = irq_domain_add_linear(bank->of_node,
 				bank->nr_pins, ops, ddata);
-		if (!bank->irq_domain) {
+		if (!bank->wkup_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
 			return -ENXIO;
 		}
@@ -553,7 +553,7 @@ static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
 				break;
 			if (!(mask & 1))
 				continue;
-			eint_data->domains[irq] = bank->irq_domain;
+			eint_data->domains[irq] = bank->wkup_domain;
 			++irq;
 		}
 	}
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index 7756c1e9e763..9701424a8bea 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -757,9 +757,9 @@ static int s3c64xx_eint_eint0_init(struct samsung_pinctrl_drv_data *d)
 		}
 		ddata->bank = bank;
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->wkup_domain = irq_domain_add_linear(bank->of_node,
 				nr_eints, &s3c64xx_eint0_irqd_ops, ddata);
-		if (!bank->irq_domain) {
+		if (!bank->wkup_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
 			return -ENXIO;
 		}
@@ -769,7 +769,7 @@ static int s3c64xx_eint_eint0_init(struct samsung_pinctrl_drv_data *d)
 		for (pin = 0; mask; ++pin, mask >>= 1) {
 			if (!(mask & 1))
 				continue;
-			data->domains[irq] = bank->irq_domain;
+			data->domains[irq] = bank->wkup_domain;
 			data->pins[irq] = pin;
 			ddata->eints[pin] = irq;
 			++irq;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1b8c0139d604..c97dd1e6ae2e 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -170,6 +170,7 @@ struct samsung_pin_bank {
 	struct device_node *of_node;
 	struct samsung_pinctrl_drv_data *drvdata;
 	struct irq_domain *irq_domain;
+	struct irq_domain *wkup_domain;
 	struct gpio_chip gpio_chip;
 	struct pinctrl_gpio_range grange;
 	struct exynos_irq_chip *irq_chip;
-- 
1.9.3
