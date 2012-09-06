From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 1/3] ARM: EXYNOS: pm_domain: Detect domain state on
 registration from DT
Date: Thu, 06 Sep 2012 11:38:04 +0200
Message-ID: <1346924286-9584-2-git-send-email-t.figa@samsung.com>
References: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64754 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756843Ab2IFJiV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 05:38:21 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9X00EBP9FBPF50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 18:38:20 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9X00K2L9FLF240@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 18:38:20 +0900 (KST)
In-reply-to: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rjw@sisk.pl, Tomasz Figa <t.figa@samsung.com>

Initial state of power domains might vary on different boards and with
different bootloaders. This patch adds detection of initial state of
power domains when being registered from DT.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/arm/exynos/power_domain.txt | 4 ----
 arch/arm/mach-exynos/pm_domains.c                             | 8 +++++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index 6528e21..843b546 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -9,10 +9,6 @@ Required Properties:
 - reg: physical base address of the controller and length of memory mapped
     region.
 
-Optional Properties:
-- samsung,exynos4210-pd-off: Specifies that the power domain is in turned-off
-    state during boot and remains to be turned-off until explicitly turned-on.
-
 Example:
 
 	lcd0: power-domain-lcd0 {
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index c0bc83a..d1abc1a 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -89,6 +89,7 @@ static __init int exynos_pm_dt_parse_domains(void)
 
 	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
 		struct exynos_pm_domain *pd;
+		int on;
 
 		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
 		if (!pd) {
@@ -97,14 +98,15 @@ static __init int exynos_pm_dt_parse_domains(void)
 			return -ENOMEM;
 		}
 
-		if (of_get_property(np, "samsung,exynos4210-pd-off", NULL))
-			pd->is_off = true;
 		pd->name = np->name;
 		pd->base = of_iomap(np, 0);
 		pd->pd.power_off = exynos_pd_power_off;
 		pd->pd.power_on = exynos_pd_power_on;
 		pd->pd.of_node = np;
-		pm_genpd_init(&pd->pd, NULL, false);
+
+		on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
+
+		pm_genpd_init(&pd->pd, NULL, !on);
 	}
 	return 0;
 }
-- 
1.7.12
