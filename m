From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH] clk: samsung: fix cpll clock register offsets for exynos5420 SoC
Date: Wed, 25 Sep 2013 14:34:24 +0530
Message-ID: <1380099864-32031-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:43138 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754771Ab3IYJEl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Sep 2013 05:04:41 -0400
Received: by mail-pd0-f170.google.com with SMTP id x10so5832103pdj.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Sep 2013 02:04:40 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, yadi.brar@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

Fixes cpll control and lock register offset values for Exynos5420 SoC.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 drivers/clk/samsung/clk-exynos5420.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 86dfc64..892aac0 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -730,8 +730,8 @@ struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 struct __initdata samsung_pll_clock exynos5420_plls[nr_plls] = {
 	[apll] = PLL(pll_2550, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, NULL),
-	[cpll] = PLL(pll_2550, fout_mpll, "fout_mpll", "fin_pll", MPLL_LOCK,
-		MPLL_CON0, NULL),
+	[cpll] = PLL(pll_2550, fout_cpll, "fout_cpll", "fin_pll", CPLL_LOCK,
+		CPLL_CON0, NULL),
 	[dpll] = PLL(pll_2550, fout_dpll, "fout_dpll", "fin_pll", DPLL_LOCK,
 		DPLL_CON0, NULL),
 	[epll] = PLL(pll_2650, fout_epll, "fout_epll", "fin_pll", EPLL_LOCK,
-- 
1.7.9.5
