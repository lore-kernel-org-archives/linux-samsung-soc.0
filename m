From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 05/16] clk: samsung: Modify _get_rate() helper to use
 __clk_lookup()
Date: Tue, 20 Aug 2013 19:31:32 +0200
Message-ID: <1377019903-14614-6-git-send-email-t.figa@samsung.com>
References: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41640 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345Ab3HTRcD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 13:32:03 -0400
In-reply-to: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

There is no need to use clkdev inside the clock driver to retrieve the
clocks for internal use. Instead __clk_lookup() helper can be used to
look up clocks by their platform name.

This patch modifies the behavior of _get_rate() helper to look up clocks
by platform name and adjusts all users of it to pass platform names
instead of clkdev aliases.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c    |  4 ++--
 drivers/clk/samsung/clk-exynos5440.c |  2 +-
 drivers/clk/samsung/clk.c            | 10 ++++------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 7de0769..a974a56 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1096,9 +1096,9 @@ static void __init exynos4_clk_init(struct device_node *np,
 	pr_info("%s clocks: sclk_apll = %ld, sclk_mpll = %ld\n"
 		"\tsclk_epll = %ld, sclk_vpll = %ld, arm_clk = %ld\n",
 		exynos4_soc == EXYNOS4210 ? "Exynos4210" : "Exynos4x12",
-		_get_rate("sclk_apll"),	_get_rate("mout_mpll"),
+		_get_rate("sclk_apll"),	_get_rate("sclk_mpll"),
 		_get_rate("sclk_epll"), _get_rate("sclk_vpll"),
-		_get_rate("armclk"));
+		_get_rate("arm_clk"));
 }
 
 
diff --git a/drivers/clk/samsung/clk-exynos5440.c b/drivers/clk/samsung/clk-exynos5440.c
index 4ef38e0..f865894 100644
--- a/drivers/clk/samsung/clk-exynos5440.c
+++ b/drivers/clk/samsung/clk-exynos5440.c
@@ -132,7 +132,7 @@ static void __init exynos5440_clk_init(struct device_node *np)
 	samsung_clk_register_gate(exynos5440_gate_clks,
 			ARRAY_SIZE(exynos5440_gate_clks));
 
-	pr_info("Exynos5440: arm_clk = %ldHz\n", _get_rate("armclk"));
+	pr_info("Exynos5440: arm_clk = %ldHz\n", _get_rate("arm_clk"));
 	pr_info("exynos5440 clock initialization complete\n");
 }
 CLK_OF_DECLARE(exynos5440_clk, "samsung,exynos5440-clock", exynos5440_clk_init);
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index cd3c40a..f503f32 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -307,14 +307,12 @@ void __init samsung_clk_of_register_fixed_ext(
 unsigned long _get_rate(const char *clk_name)
 {
 	struct clk *clk;
-	unsigned long rate;
 
-	clk = clk_get(NULL, clk_name);
-	if (IS_ERR(clk)) {
+	clk = __clk_lookup(clk_name);
+	if (!clk) {
 		pr_err("%s: could not find clock %s\n", __func__, clk_name);
 		return 0;
 	}
-	rate = clk_get_rate(clk);
-	clk_put(clk);
-	return rate;
+
+	return clk_get_rate(clk);
 }
-- 
1.8.3.2
