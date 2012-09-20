From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/6] pinctrl: exynos: Mark exynos_irq_demux_eint as inline
Date: Thu, 20 Sep 2012 10:51:42 +0200
Message-ID: <1348131104-24828-5-git-send-email-t.figa@samsung.com>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59620 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752181Ab2ITIw0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:52:26 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN00CU64MYFC50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:25 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN001S64MRTC90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:25 +0900 (KST)
In-reply-to: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com

The exynos_irq_demux_eint utility function is used in chained IRQ
handler for EINT16-31 to handle multiplexed interrupts. Inlining it
should improve the performance a bit.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 5648971..49ef5a2 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -376,7 +376,7 @@ static void exynos_irq_eint0_15(unsigned int irq, struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static void exynos_irq_demux_eint(int irq_base, unsigned long pend,
+static inline void exynos_irq_demux_eint(int irq_base, unsigned long pend,
 					struct irq_domain *domain)
 {
 	unsigned int irq;
-- 
1.7.12
