From: perr perr <strongbox8@zoho.com>
Subject: [RESEND][PATCH v2] pinctrl: exynos: remove duplicate calls in irq
 handler
Date: Tue, 16 Aug 2016 18:45:29 +0800
Message-ID: <15692f4c2b0.efa5c46c29252.3567074676558581477@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sender153-mail.zoho.com ([74.201.84.153]:21359 "EHLO
	sender153-mail.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751532AbcHPKpa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 06:45:30 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tomasz.figa@gmail.com
Cc: k.kozlowski@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Because chained_irq_enter() has already called chip->irq_mask() and 
chip->irq_ack(), also chained_irq_exit() will call chip->irq_unmask(), 
so it's not necessary to call chip->irq_*() here. 
 
Signed-off-by: Perr Zhang <strongbox8@zoho.com> 
Acked-by: Tomasz Figa <tomasz.figa@gmail.com> 
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

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
 
