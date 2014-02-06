From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 4/9] clk: samsung: exynos5250: Move suspend/resume handling
 to SoC driver
Date: Thu, 06 Feb 2014 19:16:51 +0100
Message-ID: <1391710616-14226-5-git-send-email-t.figa@samsung.com>
References: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62068 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756227AbaBFSRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 13:17:06 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00INC6SCXIA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 18:17:00 +0000 (GMT)
In-reply-to: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Since there are multiple differences in how suspend/resume of particular
Exynos SoCs must be handled, SoC driver is better place for
suspend/resume handlers and so this patch moves them.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 49 ++++++++++++++++++++++++++++++++----
 drivers/clk/samsung/clk.c            |  5 ++--
 drivers/clk/samsung/clk.h            |  4 +--
 3 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index ff4beeb..b3cccf0 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -16,6 +16,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 
 #include "clk.h"
 
@@ -85,6 +86,11 @@ enum exynos5250_plls {
 	nr_plls			/* number of PLLs */
 };
 
+static void __iomem *reg_base;
+
+#ifdef CONFIG_PM_SLEEP
+static struct samsung_clk_reg_dump *exynos5250_save;
+
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -137,6 +143,41 @@ static unsigned long exynos5250_clk_regs[] __initdata = {
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
@@ -645,8 +686,6 @@ static struct of_device_id ext_clk_match[] __initdata = {
 /* register exynox5250 clocks */
 static void __init exynos5250_clk_init(struct device_node *np)
 {
-	void __iomem *reg_base;
-
 	if (np) {
 		reg_base = of_iomap(np, 0);
 		if (!reg_base)
@@ -655,9 +694,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		panic("%s: unable to determine soc\n", __func__);
 	}
 
-	samsung_clk_init(np, reg_base, CLK_NR_CLKS,
-			exynos5250_clk_regs, ARRAY_SIZE(exynos5250_clk_regs),
-			NULL, 0);
+	samsung_clk_init(np, reg_base, CLK_NR_CLKS, NULL, 0, NULL, 0);
 	samsung_clk_of_register_fixed_ext(exynos5250_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos5250_fixed_rate_ext_clks),
 			ext_clk_match);
@@ -685,6 +722,8 @@ static void __init exynos5250_clk_init(struct device_node *np)
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
1.8.5.2
