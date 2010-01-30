From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 6/6] ARM: S3C2443: Add set_rate and round_rate calls for armdiv clock
Date: Sat, 30 Jan 2010 15:11:33 +0200
Message-ID: <1264857093-4040-7-git-send-email-ben-linux@fluff.org>
References: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [82.203.205.227] ([82.203.205.227]:2541 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753063Ab0A3NXj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2010 08:23:39 -0500
In-Reply-To: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add set_rate and round_rate calls to armdiv for future use with cpu
frequency scaling.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2443/clock.c |   93 ++++++++++++++++++++++++++++++++---------
 1 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index 177719c..62cd4ea 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -165,10 +165,83 @@ static struct clksrc_clk clk_msysclk = {
  * divider values applied to it to then be fed into armclk.
 */
 
+/* armdiv divisor table */
+
+static unsigned int armdiv[16] = {
+	[S3C2443_CLKDIV0_ARMDIV_1 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 1,
+	[S3C2443_CLKDIV0_ARMDIV_2 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 2,
+	[S3C2443_CLKDIV0_ARMDIV_3 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 3,
+	[S3C2443_CLKDIV0_ARMDIV_4 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 4,
+	[S3C2443_CLKDIV0_ARMDIV_6 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 6,
+	[S3C2443_CLKDIV0_ARMDIV_8 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 8,
+	[S3C2443_CLKDIV0_ARMDIV_12 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 12,
+	[S3C2443_CLKDIV0_ARMDIV_16 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 16,
+};
+
+static inline unsigned int s3c2443_fclk_div(unsigned long clkcon0)
+{
+	clkcon0 &= S3C2443_CLKDIV0_ARMDIV_MASK;
+
+	return armdiv[clkcon0 >> S3C2443_CLKDIV0_ARMDIV_SHIFT];
+}
+
+static unsigned long s3c2443_armclk_roundrate(struct clk *clk,
+					      unsigned long rate)
+{
+	unsigned long parent = clk_get_rate(clk->parent);
+	unsigned long calc;
+	unsigned best = 256; /* bigger than any value */
+	unsigned div;
+	int ptr;
+
+	for (ptr = 0; ptr < ARRAY_SIZE(armdiv); ptr++) {
+		div = armdiv[ptr];
+		calc = parent / div;
+		if (calc <= rate && div < best)
+			best = div;
+	}
+
+	return parent / best;
+}
+
+static int s3c2443_armclk_setrate(struct clk *clk, unsigned long rate)
+{
+	unsigned long parent = clk_get_rate(clk->parent);
+	unsigned long calc;
+	unsigned div;
+	unsigned best = 256; /* bigger than any value */
+	int ptr;
+	int val = -1;
+
+	for (ptr = 0; ptr < ARRAY_SIZE(armdiv); ptr++) {
+		div = armdiv[ptr];
+		calc = parent / div;
+		if (calc <= rate && div < best) {
+			best = div;
+			val = ptr;
+		}
+	}
+
+	if (val >= 0) {
+		unsigned long clkcon0;
+
+		clkcon0 = __raw_readl(S3C2443_CLKDIV0);
+		clkcon0 &= S3C2443_CLKDIV0_ARMDIV_MASK;
+		clkcon0 |= val << S3C2443_CLKDIV0_ARMDIV_SHIFT;
+		__raw_writel(clkcon0, S3C2443_CLKDIV0);
+	}
+
+	return (val == -1) ? -EINVAL : 0;
+}
+
 static struct clk clk_armdiv = {
 	.name		= "armdiv",
 	.id		= -1,
 	.parent		= &clk_msysclk.clk,
+	.ops		= &(struct clk_ops) {
+		.round_rate = s3c2443_armclk_roundrate,
+		.set_rate = s3c2443_armclk_setrate,
+	},
 };
 
 /* armclk
@@ -619,26 +692,6 @@ static void __init s3c2443_clk_initparents(void)
 		s3c_set_clksrc(init_list[ptr], true);
 }
 
-/* armdiv divisor table */
-
-static unsigned int armdiv[16] = {
-	[S3C2443_CLKDIV0_ARMDIV_1 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 1,
-	[S3C2443_CLKDIV0_ARMDIV_2 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 2,
-	[S3C2443_CLKDIV0_ARMDIV_3 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 3,
-	[S3C2443_CLKDIV0_ARMDIV_4 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 4,
-	[S3C2443_CLKDIV0_ARMDIV_6 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 6,
-	[S3C2443_CLKDIV0_ARMDIV_8 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 8,
-	[S3C2443_CLKDIV0_ARMDIV_12 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 12,
-	[S3C2443_CLKDIV0_ARMDIV_16 >> S3C2443_CLKDIV0_ARMDIV_SHIFT]	= 16,
-};
-
-static inline unsigned int s3c2443_fclk_div(unsigned long clkcon0)
-{
-	clkcon0 &= S3C2443_CLKDIV0_ARMDIV_MASK;
-
-	return armdiv[clkcon0 >> S3C2443_CLKDIV0_ARMDIV_SHIFT];
-}
-
 static inline unsigned long s3c2443_get_hdiv(unsigned long clkcon0)
 {
 	clkcon0 &= S3C2443_CLKDIV0_HCLKDIV_MASK;
-- 
1.6.3.3
