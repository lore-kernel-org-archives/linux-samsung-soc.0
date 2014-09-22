From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v5 3/8] clk: samsung: Add fixed_factor_clocks field to struct
 exynos_cmu_info
Date: Mon, 22 Sep 2014 10:17:03 +0530
Message-ID: <1411361228-18279-4-git-send-email-a.kesavan@samsung.com>
References: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22562 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752976AbaIVErf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 00:47:35 -0400
In-reply-to: <1411361228-18279-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, catalin.marinas@arm.com
Cc: tomasz.figa@gmail.com, naveenkrishna.ch@gmail.com, kesavan.abhilash@gmail.com

From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>

Add the fields "fixed_factor_clks" and "nr_fixed_factor_clks" to
"struct exynos_cmu_info" to allow registering of fixed factor
clocks as well with exynos_cmu_register_one().

Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Tested-by: Thomas Abraham <thomas.ab@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>
---
 drivers/clk/samsung/clk.c | 3 +++
 drivers/clk/samsung/clk.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index a648236..dd1f7c9 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -402,6 +402,9 @@ void __init samsung_cmu_register_one(struct device_node *np,
 	if (cmu->fixed_clks)
 		samsung_clk_register_fixed_rate(ctx, cmu->fixed_clks,
 			cmu->nr_fixed_clks);
+	if (cmu->fixed_factor_clks)
+		samsung_clk_register_fixed_factor(ctx, cmu->fixed_factor_clks,
+			cmu->nr_fixed_factor_clks);
 	if (cmu->clk_regs)
 		samsung_clk_sleep_init(reg_base, cmu->clk_regs,
 			cmu->nr_clk_regs);
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b3d0f4d..3f471e9 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -347,6 +347,9 @@ struct samsung_cmu_info {
 	/* list of fixed clocks and respective count */
 	struct samsung_fixed_rate_clock *fixed_clks;
 	unsigned int nr_fixed_clks;
+	/* list of fixed factor clocks and respective count */
+	struct samsung_fixed_factor_clock *fixed_factor_clks;
+	unsigned int nr_fixed_factor_clks;
 	/* total number of clocks with IDs assigned*/
 	unsigned int nr_clk_ids;
 
-- 
2.1.0
