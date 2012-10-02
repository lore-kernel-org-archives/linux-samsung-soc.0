From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 3/4] ARM: EXYNOS: pm_domain: Bind devices to power domains
 using DT
Date: Tue, 02 Oct 2012 11:24:05 +0200
Message-ID: <1349169846-30385-4-git-send-email-t.figa@samsung.com>
References: <1349169846-30385-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19904 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753266Ab2JBJYi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 05:24:38 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB900M1CE4K65L0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 18:24:36 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MB900MEOE4G7Q90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 18:24:36 +0900 (KST)
In-reply-to: <1349169846-30385-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rjw@sisk.pl, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch adds a way to specify bindings between devices and power
domains using device tree.

A device can be bound to particular power domain by adding a
power-domain property containing a phandle to the domain. The device
will be bound to the domain before binding a driver to it and unbound
after unbinding a driver from it.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../bindings/arm/exynos/power_domain.txt           | 13 +++-
 arch/arm/mach-exynos/pm_domains.c                  | 82 ++++++++++++++++++++++
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index 843b546..5216b41 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -4,14 +4,25 @@ Exynos processors include support for multiple power domains which are used
 to gate power to one or more peripherals on the processor.
 
 Required Properties:
-- compatiable: should be one of the following.
+- compatible: should be one of the following.
     * samsung,exynos4210-pd - for exynos4210 type power domain.
 - reg: physical base address of the controller and length of memory mapped
     region.
 
+Node of a device using power domains must have a samsung,power-domain property
+defined with a phandle to respective power domain.
+
 Example:
 
 	lcd0: power-domain-lcd0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C00 0x10>;
 	};
+
+Example of the node using power domain:
+
+	node {
+		/* ... */
+		samsung,power-domain = <&lcd0>;
+		/* ... */
+	};
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 5b7ce7e..4063016 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -19,6 +19,8 @@
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/sched.h>
 
 #include <mach/regs-pmu.h>
 #include <plat/devs.h>
@@ -83,14 +85,89 @@ static struct exynos_pm_domain PD = {			\
 }
 
 #ifdef CONFIG_OF
+static void exynos_add_device_to_domain(struct exynos_pm_domain *pd,
+							struct device *dev)
+{
+	int ret;
+
+	dev_dbg(dev, "adding to power domain %s\n", pd->pd.name);
+
+	while(1) {
+		ret = pm_genpd_add_device(&pd->pd, dev);
+		if (ret != -EAGAIN)
+			break;
+		cond_resched();
+	}
+
+	pm_genpd_dev_need_restore(dev, true);
+}
+
+static void exynos_remove_device_from_domain(struct device *dev)
+{
+	struct generic_pm_domain *genpd = dev_to_genpd(dev);
+	int ret;
+
+	dev_dbg(dev, "removing from power domain %s\n", genpd->name);
+
+	while(1) {
+		ret = pm_genpd_remove_device(genpd, dev);
+		if (ret != -EAGAIN)
+			break;
+		cond_resched();
+	}
+}
+
+static void exynos_read_domain_from_dt(struct device *dev)
+{
+	struct platform_device *pd_pdev;
+	struct exynos_pm_domain *pd;
+	struct device_node *node;
+
+	node = of_parse_phandle(dev->of_node, "samsung,power-domain", 0);
+	if (!node)
+		return;
+	pd_pdev = of_find_device_by_node(node);
+	if (!pd_pdev)
+		return;
+	pd = platform_get_drvdata(pd_pdev);
+	exynos_add_device_to_domain(pd, dev);
+}
+
+static int exynos_pm_notifier_call(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct device *dev = data;
+
+	switch (event) {
+	case BUS_NOTIFY_BIND_DRIVER:
+		if (dev->of_node)
+			exynos_read_domain_from_dt(dev);
+
+		break;
+
+	case BUS_NOTIFY_UNBOUND_DRIVER:
+		exynos_remove_device_from_domain(dev);
+
+		break;
+	}
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block platform_nb = {
+	.notifier_call = exynos_pm_notifier_call,
+};
+
 static __init int exynos_pm_dt_parse_domains(void)
 {
+	struct platform_device *pdev;
 	struct device_node *np;
 
 	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
 		struct exynos_pm_domain *pd;
 		int on;
 
+		pdev = of_find_device_by_node(np);
+
 		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
 		if (!pd) {
 			pr_err("%s: failed to allocate memory for domain\n",
@@ -105,10 +182,15 @@ static __init int exynos_pm_dt_parse_domains(void)
 		pd->pd.power_on = exynos_pd_power_on;
 		pd->pd.of_node = np;
 
+		platform_set_drvdata(pdev, pd);
+
 		on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
 
 		pm_genpd_init(&pd->pd, NULL, !on);
 	}
+
+	bus_register_notifier(&platform_bus_type, &platform_nb);
+
 	return 0;
 }
 #else
-- 
1.7.12
