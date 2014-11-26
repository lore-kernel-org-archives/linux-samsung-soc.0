From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 2/4] clk: samsung: retrieve the clock provider information from
 samsung_cmu_register_one
Date: Wed, 26 Nov 2014 16:47:49 +0530
Message-ID: <1417000671-11996-3-git-send-email-a.kesavan@samsung.com>
References: <1417000671-11996-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57463 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118AbaKZLSm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 06:18:42 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFN004B38R4AY70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Nov 2014 20:18:40 +0900 (KST)
In-reply-to: <1417000671-11996-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com

In case of SoCs with multiple CMUs like Exynos7 and Exynos5260 we are
making use of a common samsung_cmu_register_one function for pll, div,
mux registration. To register the cpu domain clock (for cpufreq) we need
a reference to this clock provider information in the cpu cmu block. Make
this information accessible by returning it from samsung_cmu_register_one().

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/clk/samsung/clk.c |    6 ++++--
 drivers/clk/samsung/clk.h |    4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index dd1f7c9..4a653fe 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -374,8 +374,8 @@ static void samsung_clk_sleep_init(void __iomem *reg_base,
  * Common function which registers plls, muxes, dividers and gates
  * for each CMU. It also add CMU register list to register cache.
  */
-void __init samsung_cmu_register_one(struct device_node *np,
-			struct samsung_cmu_info *cmu)
+struct samsung_clk_provider * __init samsung_cmu_register_one(
+		struct device_node *np, struct samsung_cmu_info *cmu)
 {
 	void __iomem *reg_base;
 	struct samsung_clk_provider *ctx;
@@ -410,4 +410,6 @@ void __init samsung_cmu_register_one(struct device_node *np,
 			cmu->nr_clk_regs);
 
 	samsung_clk_of_add_provider(np, ctx);
+
+	return ctx;
 }
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 3f471e9..24ae23c 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -396,8 +396,8 @@ extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			struct samsung_pll_clock *pll_list,
 			unsigned int nr_clk, void __iomem *base);
 
-extern void __init samsung_cmu_register_one(struct device_node *,
-			struct samsung_cmu_info *);
+extern struct samsung_clk_provider * __init
+samsung_cmu_register_one(struct device_node *, struct samsung_cmu_info *);
 
 extern unsigned long _get_rate(const char *clk_name);
 
-- 
1.7.9.5
