From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] arm: exynos: Enable mcpm for dual-cluster 5800 SoC
Date: Mon, 26 May 2014 11:24:36 +0530
Message-ID: <1401083676-25660-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28627 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbaEZFxJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 01:53:09 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N660062M30JR060@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 14:53:07 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com
Cc: Abhilash Kesavan <a.kesavan@samsung.com>

5800 is very similar to 5420. We can re-use the existing
MCPM support for 5800 for secondary boot-up and switching.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos/mcpm-exynos.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
index 1ac618c..20707bd 100644
--- a/arch/arm/mach-exynos/mcpm-exynos.c
+++ b/arch/arm/mach-exynos/mcpm-exynos.c
@@ -290,13 +290,19 @@ static void __naked exynos_pm_power_up_setup(unsigned int affinity_level)
 	"b	cci_enable_port_for_self");
 }
 
+static const struct of_device_id exynos_dt_mcpm_match[] = {
+	{ .compatible = "samsung,exynos5420" },
+	{ .compatible = "samsung,exynos5800" },
+	{},
+};
+
 static int __init exynos_mcpm_init(void)
 {
 	struct device_node *node;
 	void __iomem *ns_sram_base_addr;
 	int ret;
 
-	node = of_find_compatible_node(NULL, NULL, "samsung,exynos5420");
+	node = of_find_matching_node(NULL, exynos_dt_mcpm_match);
 	if (!node)
 		return -ENODEV;
 	of_node_put(node);
-- 
1.7.9.5
