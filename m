From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Add enable property to power domains
Date: Thu,  7 Nov 2013 12:12:55 +0530
Message-ID: <1383806575-28401-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:54843 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075Ab3KGGom (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Nov 2013 01:44:42 -0500
Received: by mail-pa0-f41.google.com with SMTP id rd3so160736pab.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Nov 2013 22:44:41 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, Prathyush K <prathyush.k@samsung.com>

From: Prathyush K <prathyush.k@samsung.com>

Different power domains of Exynos SOCs have different enable values.
E.g. Exynos5250:
ROTATOR_MEM_CONFIGURATION -> 0x3
GSCL_CONFIGURATION -> 0x7
Currently, there is no way to differentiate between these power domains
and we write default value of 0x7 to turn on all the power domains.

This patch adds a new 'enable' property to the power domain structure.
This enable value can be set from the device tree by adding a property
'enable' in the device node. If no such property is found, the default
value of 0x7 is used as enable value.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../bindings/arm/exynos/power_domain.txt           |    5 +++++
 arch/arm/mach-exynos/pm_domains.c                  |   10 +++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index 5216b419016a..6b24b234617c 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -9,6 +9,10 @@ Required Properties:
 - reg: physical base address of the controller and length of memory mapped
     region.
 
+Optional Properties:
+- enable: enable value of the register which is used to turn on the power
+    domain. If no enable is specificed, default value of 0x7 is used.
+
 Node of a device using power domains must have a samsung,power-domain property
 defined with a phandle to respective power domain.
 
@@ -17,6 +21,7 @@ Example:
 	lcd0: power-domain-lcd0 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C00 0x10>;
+		enable = <0x1>;
 	};
 
 Example of the node using power domain:
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 1703593e366c..84e0483a0500 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -33,6 +33,7 @@ struct exynos_pm_domain {
 	char const *name;
 	bool is_off;
 	struct generic_pm_domain pd;
+	u32 enable;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -45,13 +46,13 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 	base = pd->base;
 
-	pwr = power_on ? S5P_INT_LOCAL_PWR_EN : 0;
+	pwr = power_on ? pd->enable : 0;
 	__raw_writel(pwr, base);
 
 	/* Wait max 1ms */
 	timeout = 10;
 
-	while ((__raw_readl(base + 0x4) & S5P_INT_LOCAL_PWR_EN)	!= pwr) {
+	while ((__raw_readl(base + 0x4) & pd->enable) != pwr) {
 		if (!timeout) {
 			op = (power_on) ? "enable" : "disable";
 			pr_err("Power domain %s %s failed\n", domain->name, op);
@@ -164,6 +165,9 @@ static __init int exynos4_pm_init_power_domain(void)
 			return -ENOMEM;
 		}
 
+		if (of_property_read_u32(np, "enable", &pd->enable))
+			pd->enable = S5P_INT_LOCAL_PWR_EN;
+
 		pd->pd.name = kstrdup(np->name, GFP_KERNEL);
 		pd->name = pd->pd.name;
 		pd->base = of_iomap(np, 0);
@@ -173,7 +177,7 @@ static __init int exynos4_pm_init_power_domain(void)
 
 		platform_set_drvdata(pdev, pd);
 
-		on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
+		on = __raw_readl(pd->base + 0x4) & pd->enable;
 
 		pm_genpd_init(&pd->pd, NULL, !on);
 	}
-- 
1.7.9.5
