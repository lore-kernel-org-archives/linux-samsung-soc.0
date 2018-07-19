From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 10/10] pinctrl: samsung: Remove legacy API for handling external wakeup interrupts mask
Date: Thu, 19 Jul 2018 18:00:50 +0200
Message-ID: <20180719160050.22566-11-krzk@kernel.org>
References: <20180719160050.22566-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719160050.22566-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Remove the legacy, ugly API of exposing the static value of external
wakeup interrupts mask, because all arch-machine users where converted
to use generic implementation from pinctrl driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 40ef14956876..eec174a65c6f 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -325,13 +325,6 @@ int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 	return ret;
 }
 
-static u32 exynos_eint_wake_mask = 0xffffffff;
-
-u32 exynos_get_eint_wake_mask(void)
-{
-	return exynos_eint_wake_mask;
-}
-
 static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 {
 	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
@@ -342,10 +335,9 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 	pr_info("wake %s for irq %d\n", on ? "enabled" : "disabled", irqd->irq);
 
 	if (!on)
-		exynos_eint_wake_mask |= bit;
+		our_chip->eint_wake_mask_value |= bit;
 	else
-		exynos_eint_wake_mask &= ~bit;
-	our_chip->eint_wake_mask_value = exynos_eint_wake_mask;
+		our_chip->eint_wake_mask_value &= ~bit;
 
 	return 0;
 }
-- 
2.14.1
