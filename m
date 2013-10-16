From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/9] clk: samsung: exynos5250: Move suspend/resume handling to
 SoC driver
Date: Wed, 16 Oct 2013 13:08:13 +0200
Message-ID: <1381921698-5060-5-git-send-email-t.figa@samsung.com>
References: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30793 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760583Ab3JPLI3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 07:08:29 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUR00GEODLNYT70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Oct 2013 12:08:25 +0100 (BST)
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
 drivers/clk/samsung/clk-exynos5250.c | 49 ++++++++++++++++++++++++++++++++----
 drivers/clk/samsung/clk.c            |  5 ++--
 drivers/clk/samsung/clk.h            |  4 +--
 3 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 93b82db..8c1ce49 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -15,6 +15,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 
 #include "clk.h"
 
@@ -129,6 +130,11 @@ enum exynos5250_clks {
 	nr_clks,
 };
 
+static void __iomem *reg_base;
+
+#ifdef CONFIG_PM_SLEEP
+static struct samsung_clk_reg_dump *exynos5250_save;
+
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -181,6 +187,41 @@ static unsigned long exynos5250_clk_regs[] __initdata = {
 	GATE_IP_ACP,
 };
 
+static int exynos5250_clk_suspend(void)
+{
+	samsung_clk_save(reg_base, exynos5250_save,
+				ARRAY_SIZE(exynos5250_clk_regs));
+
+	return 0;
+}
+
+static void exynos5250_clk_resume(void)
+{
+	samsung_clk_restore(reg_base, exynos5250_save,
+				ARRAY_SIZE(exynos5250_clk_regs));
+}
+
+static struct syscore_ops exynos5250_clk_syscore_ops = {
+	.suspend = exynos5250_clk_suspend,
+	.resume = exynos5250_clk_resume,
+};
+
+static void exynos5250_clk_sleep_init(void)
+{
+	exynos5250_save = samsung_clk_alloc_reg_dump(exynos5250_clk_regs,
+					ARRAY_SIZE(exynos5250_clk_regs));
+	if (!exynos5250_save) {
+		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
+			__func__);
+		return;
+	}
+
+	register_syscore_ops(&exynos5250_clk_syscore_ops);
+}
+#else
+static void exynos5250_clk_sleep_init(void) {}
+#endif
+
 /* list of all parent clock list */
 PNAME(mout_apll_p)	= { "fin_pll", "fout_apll", };
 PNAME(mout_cpu_p)	= { "mout_apll", "mout_mpll", };
@@ -650,8 +691,6 @@ static struct of_device_id ext_clk_match[] __initdata = {
 /* register exynox5250 clocks */
 static void __init exynos5250_clk_init(struct device_node *np)
 {
-	void __iomem *reg_base;
-
 	if (np) {
 		reg_base = of_iomap(np, 0);
 		if (!reg_base)
@@ -660,9 +699,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		panic("%s: unable to determine soc\n", __func__);
 	}
 
-	samsung_clk_init(np, reg_base, nr_clks,
-			exynos5250_clk_regs, ARRAY_SIZE(exynos5250_clk_regs),
-			NULL, 0);
+	samsung_clk_init(np, reg_base, nr_clks, NULL, 0, NULL, 0);
 	samsung_clk_of_register_fixed_ext(exynos5250_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos5250_fixed_rate_ext_clks),
 			ext_clk_match);
@@ -688,6 +725,8 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	samsung_clk_register_gate(exynos5250_gate_clks,
 			ARRAY_SIZE(exynos5250_gate_clks));
 
+	exynos5250_clk_sleep_init();
+
 	pr_info("Exynos5250: clock setup completed, armclk=%ld\n",
 			_get_rate("div_arm2"));
 }
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index c0a716b..ec761e3 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -38,8 +38,9 @@ void samsung_clk_restore(void __iomem *base,
 		writel(rd->value, base + rd->offset);
 }
 
-struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(unsigned long *rdump,
-							unsigned long nr_rdump)
+struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
+						const unsigned long *rdump,
+						unsigned long nr_rdump)
 {
 	struct samsung_clk_reg_dump *rd;
 	unsigned int i;
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index ec8d46b..93cb8a0 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -347,7 +347,7 @@ extern void samsung_clk_restore(void __iomem *base,
 				const struct samsung_clk_reg_dump *rd,
 				unsigned int num_regs);
 extern struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
-							unsigned long *rdump,
-							unsigned long nr_rdump);
+						const unsigned long *rdump,
+						unsigned long nr_rdump);
 
 #endif /* __SAMSUNG_CLK_H */
-- 
1.8.3.2
