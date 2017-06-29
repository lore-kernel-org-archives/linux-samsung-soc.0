From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 1/5] pinctrl: samsung: Remove bogus irq_[un]mask from resource
 management
Date: Thu, 29 Jun 2017 23:33:35 +0200
Message-ID: <20170629214343.882576048@linutronix.de>
References: <20170629213334.375848050@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=pinctrl--samsung--Remove-bogus-irqmask-unmask.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Julia Cartwright <julia@ni.com>, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The irq chip callbacks irq_request/release_resources() have absolutely no
business with masking and unmasking the irq.

The core code unmasks the interrupt after complete setup and masks it
before invoking irq_release_resources().

The unmask is actually harmful as it happens before the interrupt is
completely initialized in __setup_irq().

Remove it.

Fixes: f6a8249f9e55 ("pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/samsung/pinctrl-exynos.c |    4 ----
 1 file changed, 4 deletions(-)

--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -205,8 +205,6 @@ static int exynos_irq_request_resources(
 
 	spin_unlock_irqrestore(&bank->slock, flags);
 
-	exynos_irq_unmask(irqd);
-
 	return 0;
 }
 
@@ -226,8 +224,6 @@ static void exynos_irq_release_resources
 	shift = irqd->hwirq * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	exynos_irq_mask(irqd);
-
 	spin_lock_irqsave(&bank->slock, flags);
 
 	con = readl(bank->eint_base + reg_con);
