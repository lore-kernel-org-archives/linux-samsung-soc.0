From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 07/16] clk: samsung: exynos4: Remove checks for DT node
Date: Tue, 20 Aug 2013 19:31:34 +0200
Message-ID: <1377019903-14614-8-git-send-email-t.figa@samsung.com>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37421 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512Ab3HTRcE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 13:32:04 -0400
In-reply-to: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Exynos 4 supports only DT based bootup, so non-DT cases does not need to
be handled anymore.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 457b15a..f1b61fe 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1006,11 +1006,9 @@ static void __init exynos4_clk_init(struct device_node *np,
 {
 	struct clk *apll, *mpll, *epll, *vpll;
 
-	if (np) {
-		reg_base = of_iomap(np, 0);
-		if (!reg_base)
-			panic("%s: failed to map registers\n", __func__);
-	}
+	reg_base = of_iomap(np, 0);
+	if (!reg_base)
+		panic("%s: failed to map registers\n", __func__);
 
 	if (exynos4_soc == EXYNOS4210)
 		samsung_clk_init(np, reg_base, nr_clks,
@@ -1021,8 +1019,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 			exynos4_clk_regs, ARRAY_SIZE(exynos4_clk_regs),
 			exynos4x12_clk_save, ARRAY_SIZE(exynos4x12_clk_save));
 
-	if (np)
-		samsung_clk_of_register_fixed_ext(exynos4_fixed_rate_ext_clks,
+	samsung_clk_of_register_fixed_ext(exynos4_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos4_fixed_rate_ext_clks),
 			ext_clk_match);
 
-- 
1.8.3.2
