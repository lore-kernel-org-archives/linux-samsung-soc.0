From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 03/14] clk: samsung: Add fixed_factor_clocks field to struct
 exynos_cmu_info
Date: Wed, 27 Aug 2014 15:18:06 +0530
Message-ID: <1409132889-2080-3-git-send-email-ch.naveen@samsung.com>
References: <1409132889-2080-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20506 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933090AbaH0Jwh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 05:52:37 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NAY006CSM3NOQ90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Aug 2014 18:52:36 +0900 (KST)
In-reply-to: <1409132889-2080-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.ab@samsung.com>

This patch adds the needed fields "fixed_factor_clks" and
"nr_fixed_factor_clks" to "struct exynos_cmu_info"

The same fields are used in the function exynos_cmu_register_one()
for registering the fixed factor clocks.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/clk/samsung/clk.c |    3 +++
 drivers/clk/samsung/clk.h |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index ef73edf..ed907cf 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -408,6 +408,9 @@ void __init exynos_cmu_register_one(struct device_node *np,
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
