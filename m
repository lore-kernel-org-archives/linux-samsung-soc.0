From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 3/3] ARM: EXYNOS: delete unneeded of_node_put
Date: Mon, 12 Oct 2015 22:43:16 +0200
Message-ID: <1444682596-3065-4-git-send-email-Julia.Lawall@lip6.fr>
References: <1444682596-3065-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1444682596-3065-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-samsung-soc@vger.kernel.org

Device node iterators perform an of_node_put on each iteration, so putting
an of_node_put before going around to the next iteration results in a
double put.

Problem found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/arm/mach-exynos/pm_domains.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 4a87e86..7c21760 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -200,15 +200,15 @@ no_clk:
 		args.args_count = 0;
 		child_domain = of_genpd_get_from_provider(&args);
 		if (IS_ERR(child_domain))
-			goto next_pd;
+			continue;
 
 		if (of_parse_phandle_with_args(np, "power-domains",
 					 "#power-domain-cells", 0, &args) != 0)
-			goto next_pd;
+			continue;
 
 		parent_domain = of_genpd_get_from_provider(&args);
 		if (IS_ERR(parent_domain))
-			goto next_pd;
+			continue;
 
 		if (pm_genpd_add_subdomain(parent_domain, child_domain))
 			pr_warn("%s failed to add subdomain: %s\n",
@@ -216,8 +216,6 @@ no_clk:
 		else
 			pr_info("%s has as child subdomain: %s.\n",
 				parent_domain->name, child_domain->name);
-next_pd:
-		of_node_put(np);
 	}
 
 	return 0;

