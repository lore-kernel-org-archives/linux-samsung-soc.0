From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/6] pinctrl: exynos: Handle only unmasked wakeup interrupts
Date: Thu, 20 Sep 2012 10:51:41 +0200
Message-ID: <1348131104-24828-4-git-send-email-t.figa@samsung.com>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59613 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753231Ab2ITIwW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:52:22 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN00J2L4MIN500@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:22 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN001S64MRTC90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:21 +0900 (KST)
In-reply-to: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com

A bit in EINTxx_PEND register is set regardless of interrupt mask, which
causes spurious interrupts. To avoid them, the read value of pending
register must be masked with current interrupt mask manually.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 46cd637..5648971 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -395,12 +395,15 @@ static void exynos_irq_demux_eint16_31(unsigned int irq, struct irq_desc *desc)
 	struct exynos_weint_data *eintd = irq_get_handler_data(irq);
 	struct samsung_pinctrl_drv_data *d = eintd->domain->host_data;
 	unsigned long pend;
+	unsigned long mask;
 
 	chained_irq_enter(chip, desc);
 	pend = readl(d->virt_base + d->ctrl->weint_pend + 0x8);
-	exynos_irq_demux_eint(16, pend, eintd->domain);
+	mask = readl(d->virt_base + d->ctrl->weint_mask + 0x8);
+	exynos_irq_demux_eint(16, pend & ~mask, eintd->domain);
 	pend = readl(d->virt_base + d->ctrl->weint_pend + 0xC);
-	exynos_irq_demux_eint(24, pend, eintd->domain);
+	mask = readl(d->virt_base + d->ctrl->weint_mask + 0xC);
+	exynos_irq_demux_eint(24, pend & ~mask, eintd->domain);
 	chained_irq_exit(chip, desc);
 }
 
-- 
1.7.12
