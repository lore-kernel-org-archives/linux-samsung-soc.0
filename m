From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 2/4] ARM: S3C24XX: add get_rate for clk_h on S3C2416/2443
Date: Sat, 3 Mar 2012 22:16:05 +0100
Message-ID: <201203032216.06249.heiko@sntech.de>
References: <201203032214.36820.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:46251 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752136Ab2CCVQL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Mar 2012 16:16:11 -0500
In-Reply-To: <201203032214.36820.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Currently the rate of clk_h is calculated once and set through the
s3c24xx_setup_clocks call. As the clk_h is a child of the prediv
we can evaluate its divider and calculate the rate in get_rate.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/common-s3c2443.c |   31 ++++++++++++++++++++++---------
 1 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common-s3c2443.c b/arch/arm/mach-s3c24xx/common-s3c2443.c
index 30a3019..39f9613 100644
--- a/arch/arm/mach-s3c24xx/common-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
@@ -168,6 +168,25 @@ static struct clk clk_prediv = {
 	},
 };
 
+/* hclk divider
+ *
+ * divides the prediv and provides the hclk.
+ */
+
+static unsigned long s3c2443_hclkdiv_getrate(struct clk *clk)
+{
+	unsigned long rate = clk_get_rate(clk->parent);
+	unsigned long clkdiv0 = __raw_readl(S3C2443_CLKDIV0);
+
+	clkdiv0 &= S3C2443_CLKDIV0_HCLKDIV_MASK;
+
+	return rate / (clkdiv0 + 1);
+}
+
+static struct clk_ops clk_h_ops = {
+	.get_rate	= s3c2443_hclkdiv_getrate,
+};
+
 /* armdiv
  *
  * this clock is sourced from msysclk and can have a number of
@@ -524,13 +543,6 @@ static struct clk hsmmc1_clk = {
 	.ctrlbit	= S3C2443_HCLKCON_HSMMC,
 };
 
-static inline unsigned long s3c2443_get_hdiv(unsigned long clkcon0)
-{
-	clkcon0 &= S3C2443_CLKDIV0_HCLKDIV_MASK;
-
-	return clkcon0 + 1;
-}
-
 /* EPLLCON compatible enough to get on/off information */
 
 void __init_or_cpufreq s3c2443_common_setup_clocks(pll_fn get_mpll)
@@ -554,8 +566,7 @@ void __init_or_cpufreq s3c2443_common_setup_clocks(pll_fn get_mpll)
 	clk_msysclk.clk.rate = pll;
 
 	fclk = clk_get_rate(&clk_armdiv);
-	hclk = s3c2443_prediv_getrate(&clk_prediv);
-	hclk /= s3c2443_get_hdiv(clkdiv0);
+	hclk = clk_get_rate(&clk_h);
 	pclk = hclk / ((clkdiv0 & S3C2443_CLKDIV0_HALF_PCLK) ? 2 : 1);
 
 	s3c24xx_setup_clocks(fclk, hclk, pclk);
@@ -621,6 +632,8 @@ void __init s3c2443_common_init_clocks(int xtal, pll_fn get_mpll,
 
 	/* s3c2443 parents h and p clocks from prediv */
 	clk_h.parent = &clk_prediv;
+	clk_h.ops = &clk_h_ops;
+
 	clk_p.parent = &clk_prediv;
 
 	clk_usb_bus.parent = &clk_usb_bus_host.clk;
-- 
1.7.2.3
