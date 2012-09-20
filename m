From: Tomasz Figa <t.figa@samsung.com>
Subject: [RFC 1/6] pinctrl: exynos: Parse wakeup-eint parameters from DT
Date: Thu, 20 Sep 2012 10:53:12 +0200
Message-ID: <1348131197-25506-2-git-send-email-t.figa@samsung.com>
References: <1348131197-25506-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59854 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752181Ab2ITIxe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 04:53:34 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAN00CX24P4FC50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:53:33 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAN00DG64OWJ930@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 17:53:33 +0900 (KST)
In-reply-to: <1348131197-25506-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com

This patch converts the pinctrl-exynos driver to parse wakeup interrupt
count and register offsets from device tree. It reduces the amount of
static platform-specific data and facilitates adding further SoC
variants to pinctrl-samsung driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl-exynos.c
index 0d01d19..575378a 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -435,6 +435,8 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	struct device_node *np;
 	struct exynos_weint_data *weint_data;
 	int idx, irq;
+	u32 val;
+	int ret;
 
 	for_each_child_of_node(dev->of_node, np) {
 		if (of_match_node(exynos_wkup_irq_ids, np)) {
@@ -445,6 +447,26 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	if (!wkup_np)
 		return -ENODEV;
 
+	ret = of_property_read_u32(wkup_np, "samsung,weint-count", &val);
+	if (ret)
+		return -EINVAL;
+	d->ctrl->nr_wint = val;
+
+	ret = of_property_read_u32(wkup_np, "samsung,weint-con", &val);
+	if (ret)
+		return -EINVAL;
+	d->ctrl->weint_con = val;
+
+	ret = of_property_read_u32(wkup_np, "samsung,weint-mask", &val);
+	if (ret)
+		return -EINVAL;
+	d->ctrl->weint_mask = val;
+
+	ret = of_property_read_u32(wkup_np, "samsung,weint-pend", &val);
+	if (ret)
+		return -EINVAL;
+	d->ctrl->weint_pend = val;
+
 	d->wkup_irqd = irq_domain_add_linear(wkup_np, d->ctrl->nr_wint,
 				&exynos_wkup_irqd_ops, d);
 	if (!d->gpio_irqd) {
-- 
1.7.12
