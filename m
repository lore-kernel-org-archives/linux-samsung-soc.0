From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: exynos4: Disable ARMCLK down feature on
 Exynos4210 SoC
Date: Fri, 27 Mar 2015 17:27:10 +0100
Message-ID: <1430933.sM2tQimLcT@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32710 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736AbbC0Q1x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 12:27:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Daniel Drake <drake@endlessm.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

Commit 42773b28e71d ("clk: samsung: exynos4: Enable ARMCLK
down feature") enabled ARMCLK down feature on all Exynos4
SoCs.  Unfortunately on Exynos4210 SoC ARMCLK down feature
causes a lockup when ondemand cpufreq governor is used.
Fix it by limiting ARMCLK down feature to Exynos4x12 SoCs.

This patch was tested on:
- Exynos4210 SoC based Trats board
- Exynos4210 SoC based Origen board
- Exynos4412 SoC based Trats2 board
- Exynos4412 SoC based Odroid-U3 board

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Daniel Drake <drake@endlessm.com>
Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Fixes: 42773b28e71d ("clk: samsung: exynos4: Enable ARMCLK down feature")
Cc: <stable@vger.kernel.org> # v3.17+
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 51462e8..714d6ba 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1354,7 +1354,7 @@ static struct samsung_pll_clock exynos4x12_plls[nr_plls] __initdata = {
 			VPLL_LOCK, VPLL_CON0, NULL),
 };
 
-static void __init exynos4_core_down_clock(enum exynos4_soc soc)
+static void __init exynos4x12_core_down_clock(void)
 {
 	unsigned int tmp;
 
@@ -1373,11 +1373,9 @@ static void __init exynos4_core_down_clock(enum exynos4_soc soc)
 	__raw_writel(tmp, reg_base + PWR_CTRL1);
 
 	/*
-	 * Disable the clock up feature on Exynos4x12, in case it was
-	 * enabled by bootloader.
+	 * Disable the clock up feature in case it was enabled by bootloader.
 	 */
-	if (exynos4_soc == EXYNOS4X12)
-		__raw_writel(0x0, reg_base + E4X12_PWR_CTRL2);
+	__raw_writel(0x0, reg_base + E4X12_PWR_CTRL2);
 }
 
 /* register exynos4 clocks */
@@ -1474,7 +1472,8 @@ static void __init exynos4_clk_init(struct device_node *np,
 	samsung_clk_register_alias(ctx, exynos4_aliases,
 			ARRAY_SIZE(exynos4_aliases));
 
-	exynos4_core_down_clock(soc);
+	if (soc == EXYNOS4X12)
+		exynos4x12_core_down_clock();
 	exynos4_clk_sleep_init();
 
 	samsung_clk_of_add_provider(np, ctx);
-- 
1.7.9.5
