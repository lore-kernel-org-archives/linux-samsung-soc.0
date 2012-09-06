From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH] ARM: EXYNOS: no duplicate mask/unmask in eint0_15
Date: Thu,  6 Sep 2012 23:21:04 +0800
Message-ID: <1346944864-12434-1-git-send-email-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Abraham <thomas.abraham@linaro.org>, olofj@chromium.org, dianders@chromium.org, Daniel Kurtz <djkurtz@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

chained_irq_enter/exit() already mask&ack/unmask the chained interrupt.
There is no need to also explicitly do it in the handler.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 arch/arm/mach-exynos/common.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 4eb39cd..0a85aec 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -965,14 +965,7 @@ static void exynos_irq_eint0_15(unsigned int irq, struct irq_desc *desc)
 	struct irq_chip *chip = irq_get_chip(irq);
 
 	chained_irq_enter(chip, desc);
-	chip->irq_mask(&desc->irq_data);
-
-	if (chip->irq_ack)
-		chip->irq_ack(&desc->irq_data);
-
 	generic_handle_irq(*irq_data);
-
-	chip->irq_unmask(&desc->irq_data);
 	chained_irq_exit(chip, desc);
 }
 
-- 
1.7.7.3
