From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/6] pinctrl: exynos: Fix typos in gpio/wkup _irq_mask
Date: Thu, 20 Sep 2012 10:51:40 +0200
Message-ID: <1348131104-24828-3-git-send-email-t.figa@samsung.com>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59605 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352Ab2ITIwU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:52:20 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN00J2L4MIN500@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:18 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN001S64MRTC90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:18 +0900 (KST)
In-reply-to: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com

To mask GPIO/wakeup IRQ, the corresponding bit in mask register has to
be set.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index c2fa85f..46cd637 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -58,7 +58,7 @@ static void exynos_gpio_irq_mask(struct irq_data *irqd)
 	unsigned long mask;
 
 	mask = readl(d->virt_base + reg_mask);
-	mask |= ~(1 << edata->pin);
+	mask |= 1 << edata->pin;
 	writel(mask, d->virt_base + reg_mask);
 }
 
@@ -290,7 +290,7 @@ static void exynos_wkup_irq_mask(struct irq_data *irqd)
 	unsigned long mask;
 
 	mask = readl(d->virt_base + reg_mask);
-	mask &= ~(1 << pin);
+	mask |= 1 << pin;
 	writel(mask, d->virt_base + reg_mask);
 }
 
-- 
1.7.12
