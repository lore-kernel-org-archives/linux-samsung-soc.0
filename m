From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/3] clk: samsung: Changes the return value of
 samsung_cmu_register_one()
Date: Tue, 23 Dec 2014 16:40:21 +0900
Message-ID: <1419320423-19228-2-git-send-email-cw00.choi@samsung.com>
References: <1419320423-19228-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1419320423-19228-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Turquette <mturquette@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch changes the return value of samsung_cmu_register_one()
from 'void type' to 'samsung_clk_provider structure' pointer type because
samsung_clk_provider may be used in each clock driver.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk.c | 13 ++++++++++---
 drivers/clk/samsung/clk.h |  3 ++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 4bda540..980c5da 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -374,19 +374,24 @@ static void samsung_clk_sleep_init(void __iomem *reg_base,
  * Common function which registers plls, muxes, dividers and gates
  * for each CMU. It also add CMU register list to register cache.
  */
-void __init samsung_cmu_register_one(struct device_node *np,
+struct samsung_clk_provider* __init samsung_cmu_register_one(
+			struct device_node *np,
 			struct samsung_cmu_info *cmu)
 {
 	void __iomem *reg_base;
 	struct samsung_clk_provider *ctx;
 
 	reg_base = of_iomap(np, 0);
-	if (!reg_base)
+	if (!reg_base) {
 		panic("%s: failed to map registers\n", __func__);
+		return NULL;
+	}
 
 	ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
-	if (!ctx)
+	if (!ctx) {
 		panic("%s: unable to alllocate ctx\n", __func__);
+		return ctx;
+	}
 
 	if (cmu->pll_clks)
 		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks,
@@ -410,4 +415,6 @@ void __init samsung_cmu_register_one(struct device_node *np,
 			cmu->nr_clk_regs);
 
 	samsung_clk_of_add_provider(np, ctx);
+
+	return ctx;
 }
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 8acabe1..e4c7538 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -392,7 +392,8 @@ extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			struct samsung_pll_clock *pll_list,
 			unsigned int nr_clk, void __iomem *base);
 
-extern void __init samsung_cmu_register_one(struct device_node *,
+extern struct samsung_clk_provider __init *samsung_cmu_register_one(
+			struct device_node *,
 			struct samsung_cmu_info *);
 
 extern unsigned long _get_rate(const char *clk_name);
-- 
1.8.5.5
