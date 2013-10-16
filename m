From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 5/9] clk: samsung: exynos5420: Move suspend/resume handling to
 SoC driver
Date: Wed, 16 Oct 2013 13:08:14 +0200
Message-ID: <1381921698-5060-6-git-send-email-t.figa@samsung.com>
References: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30793 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760564Ab3JPLIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 07:08:30 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUR00GEODLNYT70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Oct 2013 12:08:26 +0100 (BST)
In-reply-to: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Since there are multiple differences in how suspend/resume of particular
Exynos SoCs must be handled, SoC driver is better place for
suspend/resume handlers and so this patch moves them.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 49 ++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 48c4a93..4ef1ee4 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -15,6 +15,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 
 #include "clk.h"
 
@@ -149,6 +150,11 @@ enum exynos5420_clks {
 	nr_clks,
 };
 
+static void __iomem *reg_base;
+
+#ifdef CONFIG_PM_SLEEP
+static struct samsung_clk_reg_dump *exynos5420_save;
+
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -215,6 +221,41 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
 	DIV_KFC0,
 };
 
+static int exynos5420_clk_suspend(void)
+{
+	samsung_clk_save(reg_base, exynos5420_save,
+				ARRAY_SIZE(exynos5420_clk_regs));
+
+	return 0;
+}
+
+static void exynos5420_clk_resume(void)
+{
+	samsung_clk_restore(reg_base, exynos5420_save,
+				ARRAY_SIZE(exynos5420_clk_regs));
+}
+
+static struct syscore_ops exynos5420_clk_syscore_ops = {
+	.suspend = exynos5420_clk_suspend,
+	.resume = exynos5420_clk_resume,
+};
+
+static void exynos5420_clk_sleep_init(void)
+{
+	exynos5420_save = samsung_clk_alloc_reg_dump(exynos5420_clk_regs,
+					ARRAY_SIZE(exynos5420_clk_regs));
+	if (!exynos5420_save) {
+		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
+			__func__);
+		return;
+	}
+
+	register_syscore_ops(&exynos5420_clk_syscore_ops);
+}
+#else
+static void exynos5420_clk_sleep_init(void) {}
+#endif
+
 /* list of all parent clocks */
 PNAME(mspll_cpu_p)	= { "sclk_cpll", "sclk_dpll",
 				"sclk_mpll", "sclk_spll" };
@@ -767,8 +808,6 @@ static struct of_device_id ext_clk_match[] __initdata = {
 /* register exynos5420 clocks */
 static void __init exynos5420_clk_init(struct device_node *np)
 {
-	void __iomem *reg_base;
-
 	if (np) {
 		reg_base = of_iomap(np, 0);
 		if (!reg_base)
@@ -777,9 +816,7 @@ static void __init exynos5420_clk_init(struct device_node *np)
 		panic("%s: unable to determine soc\n", __func__);
 	}
 
-	samsung_clk_init(np, reg_base, nr_clks,
-			exynos5420_clk_regs, ARRAY_SIZE(exynos5420_clk_regs),
-			NULL, 0);
+	samsung_clk_init(np, reg_base, nr_clks, NULL, 0, NULL, 0);
 	samsung_clk_of_register_fixed_ext(exynos5420_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos5420_fixed_rate_ext_clks),
 			ext_clk_match);
@@ -795,5 +832,7 @@ static void __init exynos5420_clk_init(struct device_node *np)
 			ARRAY_SIZE(exynos5420_div_clks));
 	samsung_clk_register_gate(exynos5420_gate_clks,
 			ARRAY_SIZE(exynos5420_gate_clks));
+
+	exynos5420_clk_sleep_init();
 }
 CLK_OF_DECLARE(exynos5420_clk, "samsung,exynos5420-clock", exynos5420_clk_init);
-- 
1.8.3.2
