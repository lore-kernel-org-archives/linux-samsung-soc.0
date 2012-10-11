From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 13/15] pinctrl: exynos: Set pin function to EINT in
 irq_set_type of wake-up EINT
Date: Thu, 11 Oct 2012 10:11:19 +0200
Message-ID: <1349943081-27939-14-git-send-email-t.figa@samsung.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57021 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932494Ab2JKIMd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 04:12:33 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBP00EJJYRJYEI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:33 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBP005FVYR04E50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Oct 2012 17:12:32 +0900 (KST)
In-reply-to: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

Pins used as wake-up interrupts need to be configured as EINTs. This
patch adds the required configuration code to exynos_wkup_irq_set_type,
to set the pin as EINT when its interrupt trigger type is configured.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 4bf2fc4..73a0aa2 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -257,6 +257,7 @@ static int exynos_wkup_irq_set_type(struct irq_data *irqd, unsigned int type)
 	unsigned long reg_con = d->ctrl->weint_con + bank->eint_offset;
 	unsigned long shift = EXYNOS_EINT_CON_LEN * pin;
 	unsigned long con, trig_type;
+	unsigned int mask;
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -288,6 +289,16 @@ static int exynos_wkup_irq_set_type(struct irq_data *irqd, unsigned int type)
 	con &= ~(EXYNOS_EINT_CON_MASK << shift);
 	con |= trig_type << shift;
 	writel(con, d->virt_base + reg_con);
+
+	reg_con = bank->pctl_offset;
+	shift = pin * bank->func_width;
+	mask = (1 << bank->func_width) - 1;
+
+	con = readl(d->virt_base + reg_con);
+	con &= ~(mask << shift);
+	con |= EXYNOS_EINT_FUNC << shift;
+	writel(con, d->virt_base + reg_con);
+
 	return 0;
 }
 
-- 
1.7.12
