From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/7] ARM: Exynos: add support for sub-power domains
Date: Thu, 13 Nov 2014 17:23:00 +0100
Message-ID: <1415895785-26892-3-git-send-email-a.hajda@samsung.com>
References: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17814 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933311AbaKMQXz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 11:23:55 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEZ005PMKCH8R80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 16:26:41 +0000 (GMT)
In-reply-to: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds support for making one power domain a sub-domain of
other domain. This is useful for modeling power dependences for devices
like TV Mixer or Camera ISP, which needs to have more than one power
domain enabled to be operational.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 Documentation/devicetree/bindings/arm/exynos/power_domain.txt | 2 ++
 arch/arm/mach-exynos/pm_domains.c                             | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index abde1ea..cad9476 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -22,6 +22,8 @@ Optional Properties:
 	- pclkN, clkN: Pairs of parent of input clock and input clock to the
 		devices in this power domain. Maximum of 4 pairs (N = 0 to 3)
 		are supported currently.
+- power-domain-master: phandle to a master power domain that the given domain
+		       is a part of
 
 Node of a device using power domains must have a samsung,power-domain property
 defined with a phandle to respective power domain.
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 20f2671..373ac62 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -108,7 +108,7 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
 static __init int exynos4_pm_init_power_domain(void)
 {
 	struct platform_device *pdev;
-	struct device_node *np;
+	struct device_node *np, *master_np;
 
 	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
 		struct exynos_pm_domain *pd;
@@ -159,6 +159,13 @@ no_clk:
 
 		pm_genpd_init(&pd->pd, NULL, !on);
 		of_genpd_add_provider_simple(np, &pd->pd);
+
+		/* make master and slave hierarchy */
+		master_np = of_parse_phandle(np, "power-domain-master", 0);
+		if (master_np) {
+			pm_genpd_add_subdomain_names(master_np->name, np->name);
+			of_node_put(master_np);
+		}
 	}
 
 	return 0;
-- 
1.9.1
