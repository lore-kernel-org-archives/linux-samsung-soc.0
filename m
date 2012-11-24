From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 11/12] ARM: Exynos: use fin_pll clock as the tick clock source for mct
Date: Sun, 25 Nov 2012 02:48:04 +0530
Message-ID: <1353791885-2566-12-git-send-email-thomas.abraham@linaro.org>
References: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:47401 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752389Ab2KXVTc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 16:19:32 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so4187104pad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Nov 2012 13:19:32 -0800 (PST)
In-Reply-To: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

With the migration of Exynos4 clocks to use common clock framework, the old
styled 'xtal' clock is not used anymore. Instead, the clock 'fin_pll' is used
as the tick clock for mct controller.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/mct.c |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index 448ce86..71e1502 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -487,10 +487,22 @@ static struct local_timer_ops exynos4_mct_tick_ops __cpuinitdata = {
 
 static void __init exynos4_timer_resources(struct device_node *np)
 {
+#ifdef CONFIG_COMMON_CLK
+	struct clk *tick_clk;
+
+	tick_clk = clk_get(NULL, "fin_pll");
+	if (IS_ERR(tick_clk))
+		panic("%s: unable to determine tick clock rate\n", __func__);
+	clk_rate = clk_get_rate(tick_clk);
+#else
+	/*
+	 * todo: remove this legacy code after adding common clock support for
+	 * exynos5250.
+	 */
 	struct clk *mct_clk;
 	mct_clk = clk_get(NULL, "xtal");
-
 	clk_rate = clk_get_rate(mct_clk);
+#endif
 
 	reg_base = np ? of_iomap(np, 0) : S5P_VA_SYSTIMER;
 	if (!reg_base)
-- 
1.7.4.4
