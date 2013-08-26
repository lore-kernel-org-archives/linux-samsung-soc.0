From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 08/16] clk: samsung: exynos4: Rename exynos4_plls to
 exynos4x12_plls
Date: Mon, 26 Aug 2013 19:09:03 +0200
Message-ID: <1377536951-9307-9-git-send-email-t.figa@samsung.com>
References: <1377536951-9307-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47978 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756655Ab3HZRJw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 13:09:52 -0400
In-reply-to: <1377536951-9307-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This array defines PLLs specific to Exynos 4x12 SoCs and not for all
Exynos 4 SoCs, so the name should represent that.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index f1b61fe..febdce2 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -988,7 +988,7 @@ static struct of_device_id ext_clk_match[] __initdata = {
 	{},
 };
 
-static struct samsung_pll_clock exynos4_plls[nr_plls] __initdata = {
+static struct samsung_pll_clock exynos4x12_plls[nr_plls] __initdata = {
 	[apll] = PLL(pll_35xx, fout_apll, "fout_apll", "fin_pll",
 			APLL_LOCK, APLL_CON0, NULL),
 	[mpll] = PLL(pll_35xx, fout_mpll, "fout_mpll", "fin_pll",
@@ -1040,8 +1040,8 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_add_lookup(epll, fout_epll);
 		samsung_clk_add_lookup(vpll, fout_vpll);
 	} else {
-		samsung_clk_register_pll(exynos4_plls,
-					ARRAY_SIZE(exynos4_plls), reg_base);
+		samsung_clk_register_pll(exynos4x12_plls,
+					ARRAY_SIZE(exynos4x12_plls), reg_base);
 	}
 
 	samsung_clk_register_fixed_rate(exynos4_fixed_rate_clks,
-- 
1.8.3.2
