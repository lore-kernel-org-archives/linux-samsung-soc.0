From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 03/18] ARM: S5PV210: Rearrange assignment of clock for fout apll/mpll/epll clocks
Date: Mon, 17 May 2010 09:38:28 +0900
Message-ID: <1274056708-14283-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33025 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751293Ab0EQAmI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 May 2010 20:42:08 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

The assignment of clock rates for fout apll/mpll/epll is moved further
up in the s5pv210_setup_clocks function because the subsequent patches
require the clock rate of fout clocks to be setup.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index 25b73a3..d782fed 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -369,6 +369,10 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 	mpll = s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_CON), pll_4502);
 	epll = s5p_get_pll45xx(xtal, __raw_readl(S5P_EPLL_CON), pll_4500);
 
+	clk_fout_apll.rate = apll;
+	clk_fout_mpll.rate = mpll;
+	clk_fout_epll.rate = epll;
+
 	printk(KERN_INFO "S5PV210: PLL settings, A=%ld, M=%ld, E=%ld",
 			apll, mpll, epll);
 
@@ -398,10 +402,6 @@ void __init_or_cpufreq s5pv210_setup_clocks(void)
 			HCLKP=%ld, PCLKM=%ld, PCLKD=%ld, PCLKP=%ld\n",
 	       armclk, hclk200, hclk166, hclk133, pclk100, pclk83, pclk66);
 
-	clk_fout_apll.rate = apll;
-	clk_fout_mpll.rate = mpll;
-	clk_fout_epll.rate = epll;
-
 	clk_f.rate = armclk;
 	clk_h.rate = hclk133;
 	clk_p.rate = pclk66;
-- 
1.6.2.5
