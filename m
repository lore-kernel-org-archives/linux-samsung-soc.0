From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/7] Exynos: add support for 'domain-always-on' property
Date: Tue, 01 Jul 2014 10:10:08 +0200
Message-ID: <1404202211-15788-5-git-send-email-m.szyprowski@samsung.com>
References: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58779 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755725AbaGAIKe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:10:34 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N80005KIXDDPG80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 09:10:25 +0100 (BST)
In-reply-to: <1404202211-15788-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch adds support for domain-always-on property to Exynos power
domain driver. Domains with this property as always kept enabled.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 Documentation/devicetree/bindings/arm/exynos/power_domain.txt | 2 ++
 arch/arm/mach-exynos/pm_domains.c                             | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index 5216b419016a..b25d9b1ce471 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -8,6 +8,8 @@ Required Properties:
     * samsung,exynos4210-pd - for exynos4210 type power domain.
 - reg: physical base address of the controller and length of memory mapped
     region.
+Optional properties:
+- domain-always-on:	keeps the domain always enabled
 
 Node of a device using power domains must have a samsung,power-domain property
 defined with a phandle to respective power domain.
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index fe6570ebbdde..279b008de02f 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -151,6 +151,7 @@ static __init int exynos4_pm_init_power_domain(void)
 	struct device_node *np;
 
 	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
+		struct dev_power_governor *gov = NULL;
 		struct exynos_pm_domain *pd;
 		int on;
 
@@ -163,6 +164,9 @@ static __init int exynos4_pm_init_power_domain(void)
 			return -ENOMEM;
 		}
 
+		if (of_property_read_bool(np, "domain-always-on"))
+			gov = &pm_domain_always_on_gov;
+
 		pd->pd.name = kstrdup(np->name, GFP_KERNEL);
 		pd->name = pd->pd.name;
 		pd->base = of_iomap(np, 0);
@@ -174,7 +178,7 @@ static __init int exynos4_pm_init_power_domain(void)
 
 		on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
 
-		pm_genpd_init(&pd->pd, NULL, !on);
+		pm_genpd_init(&pd->pd, gov, !on);
 	}
 
 	bus_register_notifier(&platform_bus_type, &platform_nb);
-- 
1.9.2
