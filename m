From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 1/6] pinctrl: exynos: Add support for set_irq_wake of wake-up
 EINTs
Date: Fri, 17 May 2013 18:24:27 +0200
Message-ID: <1368807872-2601-2-git-send-email-t.figa@samsung.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17618 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755803Ab3EQQZC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 12:25:02 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMY003AFAXG67C0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 May 2013 17:24:59 +0100 (BST)
In-reply-to: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch adds support of IRQ wake-up ability configuration for
wake-up EINTs on Exynos SoCs.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index ac74281..4f868e5 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -326,6 +326,28 @@ static int exynos_wkup_irq_set_type(struct irq_data *irqd, unsigned int type)
 	return 0;
 }
 
+static u32 exynos_eint_wake_mask = 0xffffffff;
+
+u32 exynos_get_eint_wake_mask(void)
+{
+	return exynos_eint_wake_mask;
+}
+
+static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
+{
+	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
+	unsigned long bit = 1UL << (2 * bank->eint_offset + irqd->hwirq);
+
+	pr_info("wake %s for irq %d\n", on ? "enabled" : "disabled", irqd->irq);
+
+	if (!on)
+		exynos_eint_wake_mask |= bit;
+	else
+		exynos_eint_wake_mask &= ~bit;
+
+	return 0;
+}
+
 /*
  * irq_chip for wakeup interrupts
  */
@@ -335,6 +357,7 @@ static struct irq_chip exynos_wkup_irq_chip = {
 	.irq_mask	= exynos_wkup_irq_mask,
 	.irq_ack	= exynos_wkup_irq_ack,
 	.irq_set_type	= exynos_wkup_irq_set_type,
+	.irq_set_wake	= exynos_wkup_irq_set_wake,
 };
 
 /* interrupt handler for wakeup interrupts 0..15 */
-- 
1.8.2.1
