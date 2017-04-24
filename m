From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2.1 2/6] clk: samsung: Add local variable to match it purpose
Date: Mon, 24 Apr 2017 09:54:12 +0200
Message-ID: <1493020452-23085-1-git-send-email-m.szyprowski@samsung.com>
References: <CAJKOXPdDBsqHp-qXFFjcK10PUb_Vo1q6DsdgerYW4j+9ESpxfw@mail.gmail.com>
 <CGME20170424075423eucas1p239eaef08b93dade23292c175b838d9a5@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62319 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166314AbdDXHy1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 03:54:27 -0400
In-reply-to: <CAJKOXPdDBsqHp-qXFFjcK10PUb_Vo1q6DsdgerYW4j+9ESpxfw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Add new variable to avoid using clk pointer for different purposes across
the exynos_register_cpu_clock() function. This will help in future rewrite
for the new clk_hw API.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-cpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 8bf7e805fd34..c6dd83dce09d 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -410,6 +410,7 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 {
 	struct exynos_cpuclk *cpuclk;
 	struct clk_init_data init;
+	struct clk *parent_clk;
 	struct clk *clk;
 	int ret = 0;
 
@@ -440,15 +441,15 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		goto free_cpuclk;
 	}
 
-	clk = __clk_lookup(parent);
-	if (!clk) {
+	parent_clk = __clk_lookup(parent);
+	if (!parent_clk) {
 		pr_err("%s: could not lookup parent clock %s\n",
 				__func__, parent);
 		ret = -EINVAL;
 		goto free_cpuclk;
 	}
 
-	ret = clk_notifier_register(clk, &cpuclk->clk_nb);
+	ret = clk_notifier_register(parent_clk, &cpuclk->clk_nb);
 	if (ret) {
 		pr_err("%s: failed to register clock notifier for %s\n",
 				__func__, name);
@@ -476,7 +477,7 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 free_cpuclk_data:
 	kfree(cpuclk->cfg);
 unregister_clk_nb:
-	clk_notifier_unregister(__clk_lookup(parent), &cpuclk->clk_nb);
+	clk_notifier_unregister(parent_clk, &cpuclk->clk_nb);
 free_cpuclk:
 	kfree(cpuclk);
 	return ret;
-- 
1.9.1
