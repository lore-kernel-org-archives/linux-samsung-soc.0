From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 3/6] ARM: S3C2443: Further clksrc-clk conversions
Date: Sat, 30 Jan 2010 15:11:30 +0200
Message-ID: <1264857093-4040-4-git-send-email-ben-linux@fluff.org>
References: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [82.203.205.227] ([82.203.205.227]:4077 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753189Ab0A3NXn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2010 08:23:43 -0500
In-Reply-To: <1264857093-4040-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Move more of the core clocks that where left over from the last commit
as they are much more core to the system operation. This should allow
for easier tracking of any problems.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    3 -
 arch/arm/mach-s3c2443/clock.c                      |  187 +++++++-------------
 2 files changed, 62 insertions(+), 128 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
index 64217ca..d87ebe0 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
@@ -48,11 +48,8 @@
 #define S3C2443_CLKSRC_EPLLREF_MPLLREF2	(1<<7)
 #define S3C2443_CLKSRC_EPLLREF_MASK	(3<<7)
 
-#define S3C2443_CLKSRC_ESYSCLK_EPLL	(1<<6)
-#define S3C2443_CLKSRC_MSYSCLK_MPLL	(1<<4)
 #define S3C2443_CLKSRC_EXTCLK_DIV	(1<<3)
 
-#define S3C2443_CLKDIV0_DVS		(1<<13)
 #define S3C2443_CLKDIV0_HALF_HCLK	(1<<3)
 #define S3C2443_CLKDIV0_HALF_PCLK	(1<<2)
 
diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index f89e71f..1307f69 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -1,6 +1,6 @@
 /* linux/arch/arm/mach-s3c2443/clock.c
  *
- * Copyright (c) 2007,2010 Simtec Electronics
+ * Copyright (c) 2007, 2010 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
  * S3C2443 Clock control support
@@ -145,33 +145,24 @@ static struct clk clk_mdivclk = {
 	},
 };
 
-static int s3c2443_setparent_msysclk(struct clk *clk, struct clk *parent)
-{
-	unsigned long clksrc = __raw_readl(S3C2443_CLKSRC);
-
-	clksrc &= ~(S3C2443_CLKSRC_MSYSCLK_MPLL |
-		    S3C2443_CLKSRC_EXTCLK_DIV);
-
-	if (parent == &clk_mpll)
-		clksrc |= S3C2443_CLKSRC_MSYSCLK_MPLL;
-	else if (parent == &clk_mdivclk)
-		clksrc |= S3C2443_CLKSRC_EXTCLK_DIV;
-	else if (parent != &clk_mpllref)
-		return -EINVAL;
-
-	__raw_writel(clksrc, S3C2443_CLKSRC);
-	clk->parent = parent;
-
-	return 0;
-}
+static struct clk *clk_msysclk_sources[] = {
+	[0] = &clk_mpllref,
+	[1] = &clk_mpll,
+	[2] = &clk_mdivclk,
+	[3] = &clk_mpllref,
+};
 
-static struct clk clk_msysclk = {
-	.name		= "msysclk",
-	.parent		= &clk_xtal,
-	.id		= -1,
-	.ops		= &(struct clk_ops) {
-		.set_parent	= s3c2443_setparent_msysclk,
+static struct clksrc_clk clk_msysclk = {
+	.clk	= {
+		.name		= "msysclk",
+		.parent		= &clk_xtal,
+		.id		= -1,
+	},
+	.sources = &(struct clksrc_sources) {
+		.sources = clk_msysclk_sources,
+		.nr_sources = ARRAY_SIZE(clk_msysclk_sources),
 	},
+	.reg_src = { .reg = S3C2443_CLKSRC, .size = 2, .shift = 3 },
 };
 
 /* armdiv
@@ -183,38 +174,29 @@ static struct clk clk_msysclk = {
 static struct clk clk_armdiv = {
 	.name		= "armdiv",
 	.id		= -1,
-	.parent		= &clk_msysclk,
+	.parent		= &clk_msysclk.clk,
 };
 
 /* armclk
  *
- * this is the clock fed into the ARM core itself, either from
- * armdiv or from hclk.
+ * this is the clock fed into the ARM core itself, from armdiv or from hclk.
  */
 
-static int s3c2443_setparent_armclk(struct clk *clk, struct clk *parent)
-{
-	unsigned long clkdiv0;
-
-	clkdiv0 = __raw_readl(S3C2443_CLKDIV0);
-
-	if (parent == &clk_armdiv)
-		clkdiv0 &= ~S3C2443_CLKDIV0_DVS;
-	else if (parent == &clk_h)
-		clkdiv0 |= S3C2443_CLKDIV0_DVS;
-	else
-		return -EINVAL;
-
-	__raw_writel(clkdiv0, S3C2443_CLKDIV0);
-	return 0;
-}
+static struct clk *clk_arm_sources[] = {
+	[0] = &clk_armdiv,
+	[1] = &clk_h,
+};
 
-static struct clk clk_arm = {
-	.name		= "armclk",
-	.id		= -1,
-	.ops		= &(struct clk_ops) {
-		.set_parent	= s3c2443_setparent_armclk,
+static struct clksrc_clk clk_arm = {
+	.clk	= {
+		.name		= "armclk",
+		.id		= -1,
 	},
+	.sources = &(struct clksrc_sources) {
+		.sources = clk_arm_sources,
+		.nr_sources = ARRAY_SIZE(clk_arm_sources),
+	},
+	.reg_src = { .reg = S3C2443_CLKDIV0, .size = 1, .shift = 13 },
 };
 
 /* esysclk
@@ -222,30 +204,22 @@ static struct clk clk_arm = {
  * this is sourced from either the EPLL or the EPLLref clock
 */
 
-static int s3c2443_setparent_esysclk(struct clk *clk, struct clk *parent)
-{
-	unsigned long clksrc = __raw_readl(S3C2443_CLKSRC);
-
-	if (parent == &clk_epll)
-		clksrc |= S3C2443_CLKSRC_ESYSCLK_EPLL;
-	else if (parent == &clk_epllref.clk)
-		clksrc &= ~S3C2443_CLKSRC_ESYSCLK_EPLL;
-	else
-		return -EINVAL;
-
-	__raw_writel(clksrc, S3C2443_CLKSRC);
-	clk->parent = parent;
-
-	return 0;
-}
+static struct clk *clk_sysclk_sources[] = {
+	[0] = &clk_epllref.clk,
+	[1] = &clk_epll,
+};
 
-static struct clk clk_esysclk = {
-	.name		= "esysclk",
-	.parent		= &clk_epll,
-	.id		= -1,
-	.ops		= &(struct clk_ops) {
-		.set_parent	= s3c2443_setparent_esysclk,
+static struct clksrc_clk clk_esysclk = {
+	.clk	= {
+		.name		= "esysclk",
+		.parent		= &clk_epll,
+		.id		= -1,
 	},
+	.sources = &(struct clksrc_sources) {
+		.sources = clk_sysclk_sources,
+		.nr_sources = ARRAY_SIZE(clk_sysclk_sources),
+	},
+	.reg_src = { .reg = S3C2443_CLKSRC, .size = 1, .shift = 6 },
 };
 
 /* uartclk
@@ -257,7 +231,7 @@ static struct clksrc_clk clk_uart = {
 	.clk	= {
 		.name		= "uartclk",
 		.id		= -1,
-		.parent		= &clk_esysclk,
+		.parent		= &clk_esysclk.clk,
 	},
 	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 4, .shift = 8 },
 };
@@ -272,7 +246,7 @@ static struct clksrc_clk clk_hsspi = {
 	.clk	= {
 		.name		= "hsspi",
 		.id		= -1,
-		.parent		= &clk_esysclk,
+		.parent		= &clk_esysclk.clk,
 		.ctrlbit	= S3C2443_SCLKCON_HSSPICLK,
 		.enable		= s3c2443_clkcon_enable_s,
 	},
@@ -288,7 +262,7 @@ static struct clksrc_clk clk_usb_bus_host = {
 	.clk	= {
 		.name		= "usb-bus-host-parent",
 		.id		= -1,
-		.parent		= &clk_esysclk,
+		.parent		= &clk_esysclk.clk,
 		.ctrlbit	= S3C2443_SCLKCON_USBHOST,
 		.enable		= s3c2443_clkcon_enable_s,
 	},
@@ -306,7 +280,7 @@ static struct clksrc_clk clk_hsmmc_div = {
 	.clk	= {
 		.name		= "hsmmc-div",
 		.id		= -1,
-		.parent		= &clk_esysclk,
+		.parent		= &clk_esysclk.clk,
 	},
 	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 2, .shift = 6 },
 };
@@ -358,7 +332,7 @@ static struct clksrc_clk clk_i2s_eplldiv = {
 	.clk	= {
 		.name		= "i2s-eplldiv",
 		.id		= -1,
-		.parent		= &clk_esysclk,
+		.parent		= &clk_esysclk.clk,
 	},
 	.reg_div = { .reg = S3C2443_CLKDIV1, .size = 4, .shift = 12, },
 };
@@ -401,7 +375,7 @@ static struct clksrc_clk clk_cam = {
 	.clk	= {
 		.name		= "camif-upll",	/* same as 2440 name */
 		.id		= -1,
-		.parent		= &clk_esysclk,
+		.parent		= &clk_esysclk.clk,
 		.ctrlbit	= S3C2443_SCLKCON_CAMCLK,
 		.enable		= s3c2443_clkcon_enable_s,
 	},
@@ -417,7 +391,7 @@ static struct clksrc_clk clk_display = {
 	.clk	= {
 		.name		= "display-if",
 		.id		= -1,
-		.parent		= &clk_esysclk,
+		.parent		= &clk_esysclk.clk,
 		.ctrlbit	= S3C2443_SCLKCON_DISPCLK,
 		.enable		= s3c2443_clkcon_enable_s,
 	},
@@ -443,7 +417,7 @@ static unsigned long s3c2443_prediv_getrate(struct clk *clk)
 static struct clk clk_prediv = {
 	.name		= "prediv",
 	.id		= -1,
-	.parent		= &clk_msysclk,
+	.parent		= &clk_msysclk.clk,
 	.ops		= &(struct clk_ops) {
 		.get_rate	= s3c2443_prediv_getrate,
 	},
@@ -629,19 +603,11 @@ static struct clk init_clocks[] = {
 
 /* clocks to add where we need to check their parentage */
 
-/* s3c2443_clk_initparents
- *
- * Initialise the parents for the clocks that we get at start-time
-*/
-
-static int __init clk_init_set_parent(struct clk *clk, struct clk *parent)
-{
-	printk(KERN_DEBUG "clock %s: parent %s\n", clk->name, parent->name);
-	return clk_set_parent(clk, parent);
-}
-
 static struct clksrc_clk __initdata *init_list[] = {
 	&clk_epllref, /* should be first */
+	&clk_esysclk,
+	&clk_msysclk,
+	&clk_arm,
 	&clk_i2s_eplldiv,
 	&clk_i2s,
 	&clk_cam,
@@ -653,39 +619,10 @@ static struct clksrc_clk __initdata *init_list[] = {
 
 static void __init s3c2443_clk_initparents(void)
 {
-	unsigned long clksrc = __raw_readl(S3C2443_CLKSRC);
-	struct clk *parent;
 	int ptr;
 
-	/* esysclk source */
-
-	parent = (clksrc & S3C2443_CLKSRC_ESYSCLK_EPLL) ?
-		&clk_epll : &clk_epllref.clk;
-
-	clk_init_set_parent(&clk_esysclk, parent);
-
-	/* msysclk source */
-
-	if (clksrc & S3C2443_CLKSRC_MSYSCLK_MPLL) {
-		parent = &clk_mpll;
-	} else {
-		parent = (clksrc & S3C2443_CLKSRC_EXTCLK_DIV) ?
-			&clk_mdivclk : &clk_mpllref;
-	}
-
-	clk_init_set_parent(&clk_msysclk, parent);
-
-	/* arm */
-
-	if (__raw_readl(S3C2443_CLKDIV0) & S3C2443_CLKDIV0_DVS)
-		parent = &clk_h;
-	else
-		parent = &clk_armdiv;
-
-	clk_init_set_parent(&clk_arm, parent);
-
 	for (ptr = 0; ptr < ARRAY_SIZE(init_list); ptr++)
-		s3c_set_clksrc(init_list[ptr], false);
+		s3c_set_clksrc(init_list[ptr], true);
 }
 
 /* armdiv divisor table */
@@ -720,6 +657,9 @@ static inline unsigned long s3c2443_get_hdiv(unsigned long clkcon0)
 static struct clksrc_clk *clksrcs[] __initdata = {
 	&clk_usb_bus_host,
 	&clk_epllref,
+	&clk_esysclk,
+	&clk_msysclk,
+	&clk_arm,
 	&clk_uart,
 	&clk_display,
 	&clk_cam,
@@ -733,12 +673,9 @@ static struct clk *clks[] __initdata = {
 	&clk_ext,
 	&clk_epll,
 	&clk_usb_bus,
-	&clk_esysclk,
 	&clk_mpllref,
-	&clk_msysclk,
 	&clk_hsmmc,
 	&clk_armdiv,
-	&clk_arm,
 	&clk_prediv,
 };
 
@@ -758,7 +695,7 @@ void __init_or_cpufreq s3c2443_setup_clocks(void)
 	clk_put(xtal_clk);
 
 	pll = s3c2443_get_mpll(mpllcon, xtal);
-	clk_msysclk.rate = pll;
+	clk_msysclk.clk.rate = pll;
 
 	fclk = pll / s3c2443_fclk_div(clkdiv0);
 	hclk = s3c2443_prediv_getrate(&clk_prediv);
-- 
1.6.3.3
