From: Arun Kumar K <arun.kk@samsung.com>
Subject: [RESEND PATCHv2 1/3] ARM: EXYNOS: Add support for clock handling in power domain
Date: Tue,  8 Jul 2014 10:24:32 +0530
Message-ID: <1404795274-27307-2-git-send-email-arun.kk@samsung.com>
References: <1404795274-27307-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36003 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbaGHEyp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 00:54:45 -0400
In-Reply-To: <1404795274-27307-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, shaik.ameer@samsung.com, arunkk.samsung@gmail.com

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
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 .../bindings/arm/exynos/power_domain.txt           |   20 +++++++
 arch/arm/mach-exynos/pm_domains.c                  |   61 +++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index 5216b41..8b4f7b7f 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -9,6 +9,18 @@ Required Properties:
 - reg: physical base address of the controller and length of memory mapped
     region.
 
+Optional Properties:
+- clocks: List of clock handles. The parent clocks of the input clocks to the
+	devices in this power domain are set to oscclk before power gating
+	and restored back after powering on a domain. This is required for
+	all domains which are powered on and off and not required for unused
+	domains.
+- clock-names: The following clocks can be specified:
+	- oscclk: Oscillator clock.
+	- pclkN, clkN: Pairs of parent of input clock and input clock to the
+		devices in this power domain. Maximum of 4 pairs (N = 0 to 3)
+		are supported currently.
+
 Node of a device using power domains must have a samsung,power-domain property
 defined with a phandle to respective power domain.
 
@@ -19,6 +31,14 @@ Example:
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
index bcd8dcf..41f064b 100644
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
 
 #define INT_LOCAL_PWR_EN       0x7
 
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
@@ -44,6 +50,19 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 	base = pd->base;
 
+	/* Set oscclk before powering off a domain*/
+	if (!power_on) {
+		int i;
+
+		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
+			if (IS_ERR(pd->clk[i]))
+				break;
+			if (clk_set_parent(pd->clk[i], pd->oscclk))
+				pr_err("%s: error setting oscclk as parent to clock %d\n",
+						pd->name, i);
+		}
+	}
+
 	pwr = power_on ? INT_LOCAL_PWR_EN : 0;
 	__raw_writel(pwr, base);
 
@@ -60,6 +79,20 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		cpu_relax();
 		usleep_range(80, 100);
 	}
+
+	/* Restore clocks after powering on a domain*/
+	if (power_on) {
+		int i;
+
+		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
+			if (IS_ERR(pd->clk[i]))
+				break;
+			if (clk_set_parent(pd->clk[i], pd->pclk[i]))
+				pr_err("%s: error setting parent to clock%d\n",
+						pd->name, i);
+		}
+	}
+
 	return 0;
 }
 
@@ -152,9 +185,11 @@ static __init int exynos4_pm_init_power_domain(void)
 
 	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
 		struct exynos_pm_domain *pd;
-		int on;
+		int on, i;
+		struct device *dev;
 
 		pdev = of_find_device_by_node(np);
+		dev = &pdev->dev;
 
 		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
 		if (!pd) {
@@ -170,6 +205,30 @@ static __init int exynos4_pm_init_power_domain(void)
 		pd->pd.power_on = exynos_pd_power_on;
 		pd->pd.of_node = np;
 
+		pd->oscclk = clk_get(dev, "oscclk");
+		if (IS_ERR(pd->oscclk))
+			goto no_clk;
+
+		for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
+			char clk_name[8];
+
+			snprintf(clk_name, sizeof(clk_name), "clk%d", i);
+			pd->clk[i] = clk_get(dev, clk_name);
+			if (IS_ERR(pd->clk[i]))
+				break;
+			snprintf(clk_name, sizeof(clk_name), "pclk%d", i);
+			pd->pclk[i] = clk_get(dev, clk_name);
+			if (IS_ERR(pd->pclk[i])) {
+				clk_put(pd->clk[i]);
+				pd->clk[i] = ERR_PTR(-EINVAL);
+				break;
+			}
+		}
+
+		if (IS_ERR(pd->clk[0]))
+			clk_put(pd->oscclk);
+
+no_clk:
 		platform_set_drvdata(pdev, pd);
 
 		on = __raw_readl(pd->base + 0x4) & INT_LOCAL_PWR_EN;
-- 
1.7.9.5
