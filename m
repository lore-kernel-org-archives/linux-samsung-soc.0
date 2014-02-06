From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 1/9] clk: exynos4: Remove remnants of non-DT support
Date: Thu, 06 Feb 2014 19:16:48 +0100
Message-ID: <1391710616-14226-2-git-send-email-t.figa@samsung.com>
References: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62068 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681AbaBFSRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 13:17:06 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00JM06SB6LA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 18:16:59 +0000 (GMT)
In-reply-to: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch simplifies a bit clock initialization code by removing
remnants of non-DT clock initialization, such as reg_base and xom values
passed in function parameters.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 010f071..12a9f28 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -908,12 +908,13 @@ static unsigned long exynos4_get_xom(void)
 	return xom;
 }
 
-static void __init exynos4_clk_register_finpll(unsigned long xom)
+static void __init exynos4_clk_register_finpll(void)
 {
 	struct samsung_fixed_rate_clock fclk;
 	struct clk *clk;
 	unsigned long finpll_f = 24000000;
 	char *parent_name;
+	unsigned int xom = exynos4_get_xom();
 
 	parent_name = xom & 1 ? "xusbxti" : "xxti";
 	clk = clk_get(NULL, parent_name);
@@ -1038,9 +1039,10 @@ static struct samsung_pll_clock exynos4x12_plls[nr_plls] __initdata = {
 
 /* register exynos4 clocks */
 static void __init exynos4_clk_init(struct device_node *np,
-				    enum exynos4_soc exynos4_soc,
-				    void __iomem *reg_base, unsigned long xom)
+				    enum exynos4_soc exynos4_soc)
 {
+	void __iomem *reg_base;
+
 	reg_base = of_iomap(np, 0);
 	if (!reg_base)
 		panic("%s: failed to map registers\n", __func__);
@@ -1058,7 +1060,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 			ARRAY_SIZE(exynos4_fixed_rate_ext_clks),
 			ext_clk_match);
 
-	exynos4_clk_register_finpll(xom);
+	exynos4_clk_register_finpll();
 
 	if (exynos4_soc == EXYNOS4210) {
 		samsung_clk_register_mux(exynos4210_mux_early,
@@ -1136,12 +1138,12 @@ static void __init exynos4_clk_init(struct device_node *np,
 
 static void __init exynos4210_clk_init(struct device_node *np)
 {
-	exynos4_clk_init(np, EXYNOS4210, NULL, exynos4_get_xom());
+	exynos4_clk_init(np, EXYNOS4210);
 }
 CLK_OF_DECLARE(exynos4210_clk, "samsung,exynos4210-clock", exynos4210_clk_init);
 
 static void __init exynos4412_clk_init(struct device_node *np)
 {
-	exynos4_clk_init(np, EXYNOS4X12, NULL, exynos4_get_xom());
+	exynos4_clk_init(np, EXYNOS4X12);
 }
 CLK_OF_DECLARE(exynos4412_clk, "samsung,exynos4412-clock", exynos4412_clk_init);
-- 
1.8.5.2
