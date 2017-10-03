From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/9] clk: samsung: Remove double assignment to CLK_ARM_CLK
 id in Exynos4 driver
Date: Tue, 03 Oct 2017 12:00:10 +0200
Message-ID: <20171003100016.32029-4-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100030eucas1p1a20ef57eada2009d1c83804b475fd1b6@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44528 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751469AbdJCKAe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 06:00:34 -0400
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

CLK_ARM_CLK ("armclk") clock is provided by cpu-clk subdriver, which is
instantiated after creating all divider clocks from exynos4_div_clks
array. There is no point assigning this id to "div_core2" clock and later
overwrite with proper "armcpu" clock by cpu-clk subdriver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 3fbfd9ed82b7..3bd2d84b2a17 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -721,7 +721,7 @@ static const struct samsung_div_clock exynos4_div_clks[] __initconst = {
 	DIV(0, "div_periph", "div_core2", DIV_CPU0, 12, 3),
 	DIV(0, "div_atb", "mout_core", DIV_CPU0, 16, 3),
 	DIV(0, "div_pclk_dbg", "div_atb", DIV_CPU0, 20, 3),
-	DIV(CLK_ARM_CLK, "div_core2", "div_core", DIV_CPU0, 28, 3),
+	DIV(0, "div_core2", "div_core", DIV_CPU0, 28, 3),
 	DIV(0, "div_copy", "mout_hpm", DIV_CPU1, 0, 3),
 	DIV(0, "div_hpm", "div_copy", DIV_CPU1, 4, 3),
 	DIV(0, "div_clkout_cpu", "mout_clkout_cpu", CLKOUT_CMU_CPU, 8, 6),
-- 
2.14.2
