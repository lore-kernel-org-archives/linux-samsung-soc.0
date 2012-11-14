From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 10/11] ARM: Exynos: use fin_pll clock as the tick clock source for mct
Date: Thu, 15 Nov 2012 03:37:32 +0530
Message-ID: <1352930853-12268-11-git-send-email-thomas.abraham@linaro.org>
References: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:44128 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423412Ab2KNWJa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 17:09:30 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so608817pad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Nov 2012 14:09:30 -0800 (PST)
In-Reply-To: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

With the migration of Exynos4 clocks to use common clock framework, the old
styled 'xtal' clock is not used anymore. Instead, the clock 'fin_pll' is used
as the tick clock for mct controller.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/mct.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index cd061b2..47bc6b35 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -489,10 +489,12 @@ static struct local_timer_ops exynos4_mct_tick_ops __cpuinitdata = {
 
 static void __init exynos4_timer_resources(struct device_node *np)
 {
-	struct clk *mct_clk;
-	mct_clk = clk_get(NULL, "xtal");
+	struct clk *tick_clk;
 
-	clk_rate = clk_get_rate(mct_clk);
+	tick_clk = clk_get(NULL, "fin_pll");
+	if (IS_ERR(tick_clk))
+		panic("%s: unable to determine tick clock rate\n", __func__);
+	clk_rate = clk_get_rate(tick_clk);
 
 	reg_base = (np) ? of_iomap(np, 0) : S5P_VA_SYSTIMER;
 	if (!reg_base)
-- 
1.7.4.4
