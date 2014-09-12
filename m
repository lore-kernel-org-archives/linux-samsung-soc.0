From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v4 3/8] clk: samsung: Add fixed_factor_clocks field to struct
 exynos_cmu_info
Date: Fri, 12 Sep 2014 20:56:27 +0530
Message-ID: <1410535592-5782-5-git-send-email-ch.naveen@samsung.com>
References: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16289 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682AbaILPdO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 11:33:14 -0400
In-reply-to: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, gregkh@linuxfoundation.org, Mike Turquette <mturquette@linaro.org>

Add the fields "fixed_factor_clks" and "nr_fixed_factor_clks" to
"struct exynos_cmu_info" to allow registering of fixed factor
clocks as well with exynos_cmu_register_one().

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>
---
 drivers/clk/samsung/clk.c |    3 +++
 drivers/clk/samsung/clk.h |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index a043654..4b31267 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -402,6 +402,9 @@ void __init exynos_cmu_register_one(struct device_node *np,
 	if (cmu->fixed_clks)
 		samsung_clk_register_fixed_rate(ctx, cmu->fixed_clks,
 			cmu->nr_fixed_clks);
+	if (cmu->fixed_factor_clks)
+		samsung_clk_register_fixed_factor(ctx, cmu->fixed_factor_clks,
+			cmu->nr_fixed_factor_clks);
 	if (cmu->clk_regs)
 		exynos_clk_sleep_init(reg_base, cmu->clk_regs,
 			cmu->nr_clk_regs);
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 552d155..993b51c 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -347,6 +347,9 @@ struct exynos_cmu_info {
 	/* list of fixed clocks and respective count */
 	struct samsung_fixed_rate_clock *fixed_clks;
 	unsigned int nr_fixed_clks;
+	/* list of fixed factor clocks and respective count */
+	struct samsung_fixed_factor_clock *fixed_factor_clks;
+	unsigned int nr_fixed_factor_clks;
 	/* total number of clocks with IDs assigned*/
 	unsigned int nr_clk_ids;
 
-- 
1.7.9.5
