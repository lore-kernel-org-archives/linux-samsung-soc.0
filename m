From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 2/9] ARM: Exynos: add support for sub-power domains
Date: Mon, 02 Feb 2015 14:20:21 +0100
Message-ID: <1422883228-10690-3-git-send-email-m.szyprowski@samsung.com>
References: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54521 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755206AbbBBNUp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:20:45 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJ500CBZBXA1P30@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 13:24:46 +0000 (GMT)
In-reply-to: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

This patch adds support for making one power domain a sub-domain of
other domain. This is useful for modeling power dependences for devices
like TV Mixer or Camera ISP, which needs to have more than one power
domain enabled to be operational.

Based on previous work by Amit Daniel Kachhap <amit.daniel@samsung.com>.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 .../bindings/arm/exynos/power_domain.txt           |  2 ++
 arch/arm/mach-exynos/pm_domains.c                  | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index f4445e5a2bbb..1e097037349c 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -22,6 +22,8 @@ Optional Properties:
 	- pclkN, clkN: Pairs of parent of input clock and input clock to the
 		devices in this power domain. Maximum of 4 pairs (N = 0 to 3)
 		are supported currently.
+- power-domains: phandle pointing to the parent power domain, for more details
+		 see Documentation/devicetree/bindings/power/power_domain.txt
 
 Node of a device using power domains must have a power-domains property
 defined with a phandle to respective power domain.
diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 20f267121b3e..37266a826437 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -161,6 +161,34 @@ no_clk:
 		of_genpd_add_provider_simple(np, &pd->pd);
 	}
 
+	/* Assign the child power domains to their parents */
+	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
+		struct generic_pm_domain *child_domain, *parent_domain;
+		struct of_phandle_args args;
+
+		args.np = np;
+		args.args_count = 0;
+		child_domain = of_genpd_get_from_provider(&args);
+		if (!child_domain)
+			continue;
+
+		if (of_parse_phandle_with_args(np, "power-domains",
+					 "#power-domain-cells", 0, &args) != 0)
+			continue;
+
+		parent_domain = of_genpd_get_from_provider(&args);
+		if (!parent_domain)
+			continue;
+
+		if (pm_genpd_add_subdomain(parent_domain, child_domain))
+			pr_warn("%s failed to add subdomain: %s\n",
+				parent_domain->name, child_domain->name);
+		else
+			pr_info("%s has as child subdomain: %s.\n",
+				parent_domain->name, child_domain->name);
+		of_node_put(np);
+	}
+
 	return 0;
 }
 arch_initcall(exynos4_pm_init_power_domain);
-- 
1.9.2
