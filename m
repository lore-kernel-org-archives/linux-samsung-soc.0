From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/9] clk: samsung: exynos4: Move suspend/resume handling to SoC
 driver
Date: Wed, 16 Oct 2013 13:08:12 +0200
Message-ID: <1381921698-5060-4-git-send-email-t.figa@samsung.com>
References: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55311 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760549Ab3JPLI1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 07:08:27 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUR000ANDLJSF70@mailout2.w1.samsung.com> for
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
 drivers/clk/samsung/clk-exynos4.c | 90 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index a29bb87..1de7346 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -15,6 +15,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 
 #include "clk.h"
 
@@ -191,6 +192,16 @@ enum exynos4_clks {
 	nr_clks,
 };
 
+static void __iomem *reg_base;
+static enum exynos4_soc exynos4_soc;
+
+/*
+ * Support for CMU save/restore across system suspends
+ */
+#ifdef CONFIG_PM_SLEEP
+static struct samsung_clk_reg_dump *exynos4_save_common;
+static struct samsung_clk_reg_dump *exynos4_save_soc;
+
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -288,6 +299,70 @@ static unsigned long exynos4_clk_regs[] __initdata = {
 	GATE_IP_CPU,
 };
 
+static int exynos4_clk_suspend(void)
+{
+	samsung_clk_save(reg_base, exynos4_save_common,
+				ARRAY_SIZE(exynos4_clk_regs));
+
+	if (exynos4_soc == EXYNOS4210)
+		samsung_clk_save(reg_base, exynos4_save_soc,
+					ARRAY_SIZE(exynos4210_clk_save));
+	else
+		samsung_clk_save(reg_base, exynos4_save_soc,
+					ARRAY_SIZE(exynos4x12_clk_save));
+
+	return 0;
+}
+
+static void exynos4_clk_resume(void)
+{
+	samsung_clk_restore(reg_base, exynos4_save_common,
+				ARRAY_SIZE(exynos4_clk_regs));
+
+	if (exynos4_soc == EXYNOS4210)
+		samsung_clk_restore(reg_base, exynos4_save_soc,
+					ARRAY_SIZE(exynos4210_clk_save));
+	else
+		samsung_clk_restore(reg_base, exynos4_save_soc,
+					ARRAY_SIZE(exynos4x12_clk_save));
+}
+
+static struct syscore_ops exynos4_clk_syscore_ops = {
+	.suspend = exynos4_clk_suspend,
+	.resume = exynos4_clk_resume,
+};
+
+static void exynos4_clk_sleep_init(void)
+{
+	exynos4_save_common = samsung_clk_alloc_reg_dump(exynos4_clk_regs,
+					ARRAY_SIZE(exynos4_clk_regs));
+	if (!exynos4_save_common)
+		goto err_warn;
+
+	if (exynos4_soc == EXYNOS4210)
+		exynos4_save_soc = samsung_clk_alloc_reg_dump(
+					exynos4210_clk_save,
+					ARRAY_SIZE(exynos4210_clk_save));
+	else
+		exynos4_save_soc = samsung_clk_alloc_reg_dump(
+					exynos4x12_clk_save,
+					ARRAY_SIZE(exynos4x12_clk_save));
+	if (!exynos4_save_soc)
+		goto err_common;
+
+	register_syscore_ops(&exynos4_clk_syscore_ops);
+	return;
+
+err_common:
+	kfree(exynos4_save_common);
+err_warn:
+	pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
+		__func__);
+}
+#else
+static void exynos4_clk_sleep_init(void) {}
+#endif
+
 /* list of all parent clock list */
 PNAME(mout_apll_p)	= { "fin_pll", "fout_apll", };
 PNAME(mout_mpll_p)	= { "fin_pll", "fout_mpll", };
@@ -1091,22 +1166,15 @@ static struct samsung_pll_clock exynos4x12_plls[nr_plls] __initdata = {
 
 /* register exynos4 clocks */
 static void __init exynos4_clk_init(struct device_node *np,
-				    enum exynos4_soc exynos4_soc)
+				    enum exynos4_soc soc)
 {
-	void __iomem *reg_base;
+	exynos4_soc = soc;
 
 	reg_base = of_iomap(np, 0);
 	if (!reg_base)
 		panic("%s: failed to map registers\n", __func__);
 
-	if (exynos4_soc == EXYNOS4210)
-		samsung_clk_init(np, reg_base, nr_clks,
-			exynos4_clk_regs, ARRAY_SIZE(exynos4_clk_regs),
-			exynos4210_clk_save, ARRAY_SIZE(exynos4210_clk_save));
-	else
-		samsung_clk_init(np, reg_base, nr_clks,
-			exynos4_clk_regs, ARRAY_SIZE(exynos4_clk_regs),
-			exynos4x12_clk_save, ARRAY_SIZE(exynos4x12_clk_save));
+	samsung_clk_init(np, reg_base, nr_clks, NULL, 0, NULL, 0);
 
 	samsung_clk_of_register_fixed_ext(exynos4_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos4_fixed_rate_ext_clks),
@@ -1179,6 +1247,8 @@ static void __init exynos4_clk_init(struct device_node *np,
 	samsung_clk_register_alias(exynos4_aliases,
 			ARRAY_SIZE(exynos4_aliases));
 
+	exynos4_clk_sleep_init();
+
 	pr_info("%s clocks: sclk_apll = %ld, sclk_mpll = %ld\n"
 		"\tsclk_epll = %ld, sclk_vpll = %ld, arm_clk = %ld\n",
 		exynos4_soc == EXYNOS4210 ? "Exynos4210" : "Exynos4x12",
-- 
1.8.3.2
