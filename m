From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 1/3] ARM: EXYNOS: Add support for clock handling in power domain
Date: Fri, 23 May 2014 10:38:10 +0530
Message-ID: <1400821692-22370-2-git-send-email-arun.kk@samsung.com>
References: <1400821692-22370-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:62565 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961AbaEWFIZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 01:08:25 -0400
In-Reply-To: <1400821692-22370-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

From: Prathyush K <prathyush.k@samsung.com>

While powering on/off a local powerdomain in exynos5 chipsets, the input
clocks to each device gets modified. This behaviour is based on the
SYSCLK_SYS_PWR_REG registers.
E.g. SYSCLK_MFC_SYS_PWR_REG = 0x0, the parent of input clock to MFC
				   (aclk333) gets modified to oscclk
			    = 0x1, no change in clocks.
The recommended value of SYSCLK_SYS_PWR_REG before power gating any
domain is 0x0. So we must also restore the clocks while powering on a
domain everytime.

This patch adds the framework for getting the required mux and parent clocks
through a power domain device node. With this patch, while powering off
a domain, parent is set to oscclk and while powering back on, its re-set
to the correct parent which is as per the recommended pd on/off
sequence.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 .../bindings/arm/exynos/power_domain.txt           |   18 +++++++
 arch/arm/mach-exynos/pm_domains.c                  |   56 +++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index 5216b41..168a191 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -9,6 +9,16 @@ Required Properties:
 - reg: physical base address of the controller and length of memory mapped
     region.
 
+Optional Properties:
+- clocks: List of clock handles. The parent clocks of the input clocks to the
+  devices in this power domain are set to oscclk before power gating and
+  restored back after powering on a domain. This is required for all domains
+  which are powered on and off and not required for unused domains.
+  The following clocks can be specified:
+  - oscclk: oscillator clock.
+  - clk(n): input clock to the devices in this power domain
+  - pclk(n): parent clock of input clock to the devices in this power domain
+
 Node of a device using power domains must have a samsung,power-domain property
 defined with a phandle to respective power domain.
 
@@ -19,6 +29,14 @@ Example:
 		reg = <0x10023C00 0x10>;
 	};
 
+	mfc_pd: power-domain@10044060 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044060 0x20>;
+		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK333>,
+			<&clock CLK_MOUT_USER_ACLK333>;
+		clock-names = "oscclk", "pclk0", "clk0";
+	};
+
 Example of the node using power domain:
 
 	node {
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index fe6570e..e5fe76d 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -24,6 +25,8 @@
 
 #include "regs-pmu.h"
 
+#define MAX_CLK_PER_DOMAIN			4
+
 /*
  * Exynos specific wrapper around the generic power domain
  */
@@ -32,6 +35,9 @@ struct exynos_pm_domain {
 	char const *name;
 	bool is_off;
 	struct generic_pm_domain pd;
+	struct clk *oscclk;
+	struct clk *clk[MAX_CLK_PER_DOMAIN];
+	struct clk *pclk[MAX_CLK_PER_DOMAIN];
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -44,6 +50,18 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 	base = pd->base;
 
+	/* Set oscclk before powering off a domain*/
+	if (!power_on) {
+		int i;
+		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
+			if (!pd->clk[i])
+				break;
+			if (clk_set_parent(pd->clk[i], pd->oscclk))
+				pr_info("%s: error setting oscclk as parent to clock %d\n",
+						pd->name, i);
+		}
+	}
+
 	pwr = power_on ? S5P_INT_LOCAL_PWR_EN : 0;
 	__raw_writel(pwr, base);
 
@@ -60,6 +78,19 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		cpu_relax();
 		usleep_range(80, 100);
 	}
+
+	/* Restore clocks after powering on a domain*/
+	if (power_on) {
+		int i;
+		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
+			if (!pd->clk[i])
+				break;
+			if (clk_set_parent(pd->clk[i], pd->pclk[i]))
+				pr_info("%s: error setting parent to clock%d\n",
+						pd->name, i);
+		}
+	}
+
 	return 0;
 }
 
@@ -152,9 +183,11 @@ static __init int exynos4_pm_init_power_domain(void)
 
 	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
 		struct exynos_pm_domain *pd;
-		int on;
+		int on, i;
+		struct device *dev;
 
 		pdev = of_find_device_by_node(np);
+		dev = &pdev->dev;
 
 		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
 		if (!pd) {
@@ -170,6 +203,27 @@ static __init int exynos4_pm_init_power_domain(void)
 		pd->pd.power_on = exynos_pd_power_on;
 		pd->pd.of_node = np;
 
+		pd->oscclk = devm_clk_get(dev, "oscclk");
+		if (IS_ERR(pd->oscclk))
+			goto no_clk;
+
+		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
+			struct clk *tmp, *tmp_parent;
+			char clk_name[8];
+
+			snprintf(clk_name, sizeof(clk_name), "clk%d", i);
+			tmp = devm_clk_get(dev, clk_name);
+			if (IS_ERR(tmp))
+				break;
+			snprintf(clk_name, sizeof(clk_name), "pclk%d", i);
+			tmp_parent = devm_clk_get(dev, clk_name);
+			if (IS_ERR(tmp_parent))
+				break;
+			pd->clk[i] = tmp;
+			pd->pclk[i] = tmp_parent;
+		}
+
+no_clk:
 		platform_set_drvdata(pdev, pd);
 
 		on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
-- 
1.7.9.5
