From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 7/6] pinctrl: exynos: Fix wakeup IRQ domain registration check
Date: Thu, 20 Sep 2012 16:53:33 +0200
Message-ID: <2737662.uE6StcAj33@amdc1227>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20529 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751474Ab2ITOxs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 10:53:48 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN00JKHLDIOAW0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 23:53:47 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN007OELDE2F10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 23:53:47 +0900 (KST)
In-reply-to: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com

Because of a typo, incorrect field of a structure was being checked.
This patch fixes the check to use correct field.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 0d01d19..21362f4 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -447,7 +447,7 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 	d->wkup_irqd = irq_domain_add_linear(wkup_np, d->ctrl->nr_wint,
 				&exynos_wkup_irqd_ops, d);
-	if (!d->gpio_irqd) {
+	if (!d->wkup_irqd) {
 		dev_err(dev, "wakeup irq domain allocation failed\n");
 		return -ENXIO;
 	}
-- 
1.7.12
