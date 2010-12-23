From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V3 6/7] ARM: S5PV310: Add FOUT APLL get rate function
Date: Thu, 23 Dec 2010 14:49:56 +0900
Message-ID: <1293083397-15969-7-git-send-email-kgene.kim@samsung.com>
References: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56532 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081Ab0LWGHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 01:07:50 -0500
In-Reply-To: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Jaecheol Lee <jc.lee@samsung.com>, Sangwook Ju <sw.ju@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Jaecheol Lee <jc.lee@samsung.com>

FOUT APLL clock is used as a source of ARM core clock. So we need that the
clock source can be changed dynamically by using CPUFREQ driver. This patch
can give correct frequency when calling clk_get_rate() function.

Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Signed-off-by: Sangwook Ju <sw.ju@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/clock.c |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
index fdce2b4..752a07e 100644
--- a/arch/arm/mach-s5pv310/clock.c
+++ b/arch/arm/mach-s5pv310/clock.c
@@ -990,6 +990,17 @@ static struct clksrc_clk *sysclks[] = {
 	&clk_dout_mmc4,
 };
 
+static int xtal_rate;
+
+static unsigned long s5pv310_fout_apll_get_rate(struct clk *clk)
+{
+	return s5p_get_pll45xx(xtal_rate, __raw_readl(S5P_APLL_CON0), pll_4508);
+}
+
+static struct clk_ops s5pv310_fout_apll_ops = {
+	.get_rate = s5pv310_fout_apll_get_rate,
+};
+
 void __init_or_cpufreq s5pv310_setup_clocks(void)
 {
 	struct clk *xtal_clk;
@@ -1013,6 +1024,9 @@ void __init_or_cpufreq s5pv310_setup_clocks(void)
 	BUG_ON(IS_ERR(xtal_clk));
 
 	xtal = clk_get_rate(xtal_clk);
+
+	xtal_rate = xtal;
+
 	clk_put(xtal_clk);
 
 	printk(KERN_DEBUG "%s: xtal is %ld\n", __func__, xtal);
@@ -1026,7 +1040,7 @@ void __init_or_cpufreq s5pv310_setup_clocks(void)
 	vpll = s5p_get_pll46xx(vpllsrc, __raw_readl(S5P_VPLL_CON0),
 				__raw_readl(S5P_VPLL_CON1), pll_4650);
 
-	clk_fout_apll.rate = apll;
+	clk_fout_apll.ops = &s5pv310_fout_apll_ops;
 	clk_fout_mpll.rate = mpll;
 	clk_fout_epll.rate = epll;
 	clk_fout_vpll.rate = vpll;
-- 
1.6.2.5
