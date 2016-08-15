From: perr perr <strongbox8@zoho.com>
Subject: [Resend][PATCH] pinctrl: exynos: remove duplicate calls in irq
 handler
Date: Mon, 15 Aug 2016 16:56:03 -0700
Message-ID: <15690a22faa.f98111b925952.970853697005139861@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tomasz.figa@gmail.com
Cc: k.kozlowski@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Because chained_irq_enter() has already called chip->irq_mask() and 
chip->irq_ack(), also chained_irq_exit() will call chip->irq_unmask(), 
so it's not necessary to call chip->irq_*() here. 
 
Signed-off-by: Perr Zhang<strongbox8@zoho.com> 
 
--- 
 drivers/pinctrl/samsung/pinctrl-exynos.c | 6 +----- 
 1 file changed, 1 insertion(+), 5 deletions(-) 
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c 
index 051b5bf..d32fa2b 100644 
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c 
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c 
@@ -428,14 +428,10 @@ static void exynos_irq_eint0_15(struct irq_desc *desc) 
     int eint_irq; 
  
     chained_irq_enter(chip, desc); 
-    chip->irq_mask(&desc->irq_data); 
- 
-    if (chip->irq_ack) 
-        chip->irq_ack(&desc->irq_data); 
  
     eint_irq = irq_linear_revmap(bank->irq_domain, eintd->irq); 
     generic_handle_irq(eint_irq); 
-    chip->irq_unmask(&desc->irq_data); 
+ 
     chained_irq_exit(chip, desc); 
 } 
  
--  
1.9.3 
 
