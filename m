From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 5/6] pinctrl: exynos: Correct the detection of wakeup-eint node
Date: Thu, 20 Sep 2012 10:51:43 +0200
Message-ID: <1348131104-24828-6-git-send-email-t.figa@samsung.com>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59629 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752181Ab2ITIw3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:52:29 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN00J2L4MIN500@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:29 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN001S64MRTC90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:52:28 +0900 (KST)
In-reply-to: <1348131104-24828-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com

Current way of finding the wakeup-eint node scans the whole device tree
not only children of the pinctrl node, so it might detect a wakeup-eint
node of another pinctrl device.

This patch limits the scope of looking for nodes only to subnodes of the
pinctrl node.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 49ef5a2..0d01d19 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -431,15 +431,19 @@ static const struct irq_domain_ops exynos_wkup_irqd_ops = {
 static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct device *dev = d->dev;
-	struct device_node *wkup_np;
+	struct device_node *wkup_np = NULL;
+	struct device_node *np;
 	struct exynos_weint_data *weint_data;
 	int idx, irq;
 
-	wkup_np = of_find_matching_node(dev->of_node, exynos_wkup_irq_ids);
-	if (!wkup_np) {
-		dev_err(dev, "wakeup controller node not found\n");
-		return -ENODEV;
+	for_each_child_of_node(dev->of_node, np) {
+		if (of_match_node(exynos_wkup_irq_ids, np)) {
+			wkup_np = np;
+			break;
+		}
 	}
+	if (!wkup_np)
+		return -ENODEV;
 
 	d->wkup_irqd = irq_domain_add_linear(wkup_np, d->ctrl->nr_wint,
 				&exynos_wkup_irqd_ops, d);
-- 
1.7.12
