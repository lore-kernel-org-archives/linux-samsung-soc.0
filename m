From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH] arm:exynos5250: Restore CLK_SRC_TOP3 register via CCF
Date: Tue, 26 Mar 2013 10:12:15 +0530
Message-ID: <1364272935-30607-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31564 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751393Ab3CZEfo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 00:35:44 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK900BEL3DY62J0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Mar 2013 13:35:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

From: Prasanna Kumar <prasanna.ps@samsung.com>

This patch adds support for restoring CLK_SRC_TOP3 register
which gets modified while powergating corresponding power domains
after a cycle of Suspend-to-Resume.

Please refer below URL to know the background of this issue.
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg14347.html.

This is based on Common Clock Framework defined for exynos5250 and 
patch mentioned here
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg16739.html

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 arch/arm/mach-exynos/pm_domains.c |   43 +++++++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 9f1351d..b5ed384 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -21,8 +21,11 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/sched.h>
+#include <linux/clk.h>
+#include <linux/clk-private.h>
 
 #include <mach/regs-pmu.h>
+#include <plat/cpu.h>
 #include <plat/devs.h>
 
 /*
@@ -35,6 +38,43 @@ struct exynos_pm_domain {
 	struct generic_pm_domain pd;
 };
 
+static int exynos_pdclk_restore(struct exynos_pm_domain *domain)
+{
+	int i = 0;
+	struct clk *p_clk;
+	struct clk_hw *hw_clk;
+	const struct clk_ops *p_ops;
+
+	const char *pdclks[][2] = {
+					{ "gsc-power-domain",
+						"m_sub_aclk266" },
+					{ "gsc-power-domain",
+						"m_sub_aclk300" },
+					{ "mfc-power-domain",
+						"m_sub_aclk333" },
+				};
+
+	for (i = 0; i < ARRAY_SIZE(pdclks); i++) {
+		if (!strcmp(domain->name, pdclks[i][0])) {
+			p_clk = clk_get(NULL, pdclks[i][1]);
+			if (IS_ERR(p_clk)) {
+				pr_err("failed to get base clk\n");
+				return PTR_ERR(p_clk);
+			}
+
+			hw_clk = __clk_get_hw(p_clk);
+			if (IS_ERR(hw_clk)) {
+				pr_err("failed to get hw_clk\n");
+				return PTR_ERR(hw_clk);
+			}
+			p_ops = p_clk->ops;
+			if (p_ops != NULL && p_ops->set_parent != NULL)
+				p_clk->ops->set_parent(hw_clk, 1);
+		}
+	}
+	return 0;
+}
+
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
@@ -61,6 +101,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		cpu_relax();
 		usleep_range(80, 100);
 	}
+
+	if (!power_on && soc_is_exynos5250())
+		exynos_pdclk_restore(pd);
 	return 0;
 }
 
-- 
1.7.5.4
