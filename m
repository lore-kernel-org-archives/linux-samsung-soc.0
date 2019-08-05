From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/4] pinctrl: samsung: Fix device node refcount leaks in Exynos wakeup controller init
Date: Mon,  5 Aug 2019 18:27:07 +0200
Message-ID: <20190805162710.7789-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

In exynos_eint_wkup_init() the for_each_child_of_node() loop is used
with a break to find a matching child node.  Although each iteration of
for_each_child_of_node puts the previous node, but early exit from loop
misses it.  This leads to leak of device node.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ebc27b06718c..8d2c33bba13e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -504,6 +504,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
+			of_node_put(wkup_np);
 			return -ENXIO;
 		}
 
@@ -518,8 +519,10 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		weint_data = devm_kcalloc(dev,
 					  bank->nr_pins, sizeof(*weint_data),
 					  GFP_KERNEL);
-		if (!weint_data)
+		if (!weint_data) {
+			of_node_put(wkup_np);
 			return -ENOMEM;
+		}
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
 			irq = irq_of_parse_and_map(bank->of_node, idx);
@@ -536,10 +539,13 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		}
 	}
 
-	if (!muxed_banks)
+	if (!muxed_banks) {
+		of_node_put(wkup_np);
 		return 0;
+	}
 
 	irq = irq_of_parse_and_map(wkup_np, 0);
+	of_node_put(wkup_np);
 	if (!irq) {
 		dev_err(dev, "irq number for muxed EINTs not found\n");
 		return 0;
-- 
2.17.1
