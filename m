From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: SAMSUNG: Remove redundant return code from s3c24xx_register_clock
Date: Wed, 29 Aug 2012 11:01:47 +0530
Message-ID: <1346218307-671-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:46844 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914Ab2H2FeO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 01:34:14 -0400
Received: by pbbrr13 with SMTP id rr13so526049pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 22:34:13 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, patches@linaro.org

s3c24xx_register_clock(struct clk *clk) always returns 0, so checking
its return value has no meaning.

There are a few other functions which also return the error code of
s3c24xx_register_clock.

Forcing all these functions to return void would help us save some
line of code.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---

This patch is rebased on v3.6-rc3.

 arch/arm/mach-s3c24xx/clock-s3c2412.c      |   31 ++-------------
 arch/arm/mach-s3c24xx/clock-s3c244x.c      |    7 +---
 arch/arm/plat-s3c24xx/s3c2410-clock.c      |   15 +------
 arch/arm/plat-samsung/clock-clksrc.c       |    9 +----
 arch/arm/plat-samsung/clock.c              |   59 ++++++---------------------
 arch/arm/plat-samsung/include/plat/clock.h |    8 ++--
 arch/arm/plat-samsung/pwm-clock.c          |   19 ++-------
 arch/arm/plat-samsung/s5p-clock.c          |    6 +--
 8 files changed, 32 insertions(+), 122 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/clock-s3c2412.c b/arch/arm/mach-s3c24xx/clock-s3c2412.c
index d10b695..bd2bcc0 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c2412.c
@@ -634,14 +634,9 @@ static void __init s3c2412_clk_initparents(void)
 	struct clk_init *cip = clks_src;
 	struct clk *src;
 	int ptr;
-	int ret;
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clks_src); ptr++, cip++) {
-		ret = s3c24xx_register_clock(cip->clk);
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       cip->clk->name, ret);
-		}
+		s3c24xx_register_clock(cip->clk);
 
 		src = (clksrc & cip->bit) ? cip->src_1 : cip->src_0;
 
@@ -670,7 +665,6 @@ int __init s3c2412_baseclk_add(void)
 	unsigned long clkcon  = __raw_readl(S3C2410_CLKCON);
 	unsigned int dvs;
 	struct clk *clkp;
-	int ret;
 	int ptr;
 
 	clk_upll.enable = s3c2412_upll_enable;
@@ -683,12 +677,7 @@ int __init s3c2412_baseclk_add(void)
 
 	for (ptr = 0; ptr < ARRAY_SIZE(clks); ptr++) {
 		clkp = clks[ptr];
-
-		ret = s3c24xx_register_clock(clkp);
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       clkp->name, ret);
-		}
+		s3c24xx_register_clock(clkp);
 	}
 
 	/* set the dvs state according to what we got at boot time */
@@ -723,14 +712,8 @@ int __init s3c2412_baseclk_add(void)
 	clkp = init_clocks;
 	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks); ptr++, clkp++) {
 		/* ensure that we note the clock state */
-
 		clkp->usage = clkcon & clkp->ctrlbit ? 1 : 0;
-
-		ret = s3c24xx_register_clock(clkp);
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       clkp->name, ret);
-		}
+		s3c24xx_register_clock(clkp);
 	}
 
 	/* We must be careful disabling the clocks we are not intending to
@@ -747,13 +730,7 @@ int __init s3c2412_baseclk_add(void)
 
 	clkp = init_clocks_disable;
 	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks_disable); ptr++, clkp++) {
-
-		ret = s3c24xx_register_clock(clkp);
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       clkp->name, ret);
-		}
-
+		s3c24xx_register_clock(clkp);
 		s3c2412_clkcon_enable(clkp, 0);
 	}
 
diff --git a/arch/arm/mach-s3c24xx/clock-s3c244x.c b/arch/arm/mach-s3c24xx/clock-s3c244x.c
index 6d9b688..cd40d89 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c244x.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c244x.c
@@ -77,18 +77,13 @@ static int s3c244x_clk_add(struct device *dev, struct subsys_interface *sif)
 	unsigned long camdivn = __raw_readl(S3C2440_CAMDIVN);
 	unsigned long clkdivn;
 	struct clk *clock_upll;
-	int ret;
 
 	printk("S3C244X: Clock Support, DVS %s\n",
 	       (camdivn & S3C2440_CAMDIVN_DVSEN) ? "on" : "off");
 
 	clk_arm.parent = (camdivn & S3C2440_CAMDIVN_DVSEN) ? &clk_h : &clk_f;
 
-	ret = s3c24xx_register_clock(&clk_arm);
-	if (ret < 0) {
-		printk(KERN_ERR "S3C24XX: Failed to add armclk (%d)\n", ret);
-		return ret;
-	}
+	s3c24xx_register_clock(&clk_arm);
 
 	clock_upll = clk_get(NULL, "upll");
 	if (IS_ERR(clock_upll)) {
diff --git a/arch/arm/plat-s3c24xx/s3c2410-clock.c b/arch/arm/plat-s3c24xx/s3c2410-clock.c
index 25dc4d4..a174922 100644
--- a/arch/arm/plat-s3c24xx/s3c2410-clock.c
+++ b/arch/arm/plat-s3c24xx/s3c2410-clock.c
@@ -193,33 +193,25 @@ static struct clk init_clocks[] = {
  * done.
 */
 
-int __init s3c2410_baseclk_add(void)
+void __init s3c2410_baseclk_add(void)
 {
 	unsigned long clkslow = __raw_readl(S3C2410_CLKSLOW);
 	unsigned long clkcon  = __raw_readl(S3C2410_CLKCON);
 	struct clk *clkp;
 	struct clk *xtal;
-	int ret;
 	int ptr;
 
 	clk_upll.enable = s3c2410_upll_enable;
 
-	if (s3c24xx_register_clock(&clk_usb_bus) < 0)
-		printk(KERN_ERR "failed to register usb bus clock\n");
+	s3c24xx_register_clock(&clk_usb_bus);
 
 	/* register clocks from clock array */
 
 	clkp = init_clocks;
 	for (ptr = 0; ptr < ARRAY_SIZE(init_clocks); ptr++, clkp++) {
 		/* ensure that we note the clock state */
-
 		clkp->usage = clkcon & clkp->ctrlbit ? 1 : 0;
-
-		ret = s3c24xx_register_clock(clkp);
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       clkp->name, ret);
-		}
+		s3c24xx_register_clock(clkp);
 	}
 
 	/* We must be careful disabling the clocks we are not intending to
@@ -249,5 +241,4 @@ int __init s3c2410_baseclk_add(void)
 	       (clkslow & S3C2410_CLKSLOW_UCLK_OFF) ? "off" : "on");
 
 	s3c_pwmclk_init();
-	return 0;
 }
diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
index 786a410..27c00d9 100644
--- a/arch/arm/plat-samsung/clock-clksrc.c
+++ b/arch/arm/plat-samsung/clock-clksrc.c
@@ -177,8 +177,6 @@ static struct clk_ops clksrc_ops_nosrc = {
 
 void __init s3c_register_clksrc(struct clksrc_clk *clksrc, int size)
 {
-	int ret;
-
 	for (; size > 0; size--, clksrc++) {
 		if (!clksrc->reg_div.reg && !clksrc->reg_src.reg)
 			printk(KERN_ERR "%s: clock %s has no registers set\n",
@@ -202,11 +200,6 @@ void __init s3c_register_clksrc(struct clksrc_clk *clksrc, int size)
 		 */
 		s3c_set_clksrc(clksrc, false);
 
-		ret = s3c24xx_register_clock(&clksrc->clk);
-
-		if (ret < 0) {
-			printk(KERN_ERR "%s: failed to register %s (%d)\n",
-			       __func__, clksrc->clk.name, ret);
-		}
+		s3c24xx_register_clock(&clksrc->clk);
 	}
 }
diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index 65c5eca..dd39f3b 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -276,7 +276,7 @@ struct clk s3c24xx_uclk = {
  *
  * Add the specified clock to the list of clocks known by the system.
  */
-int s3c24xx_register_clock(struct clk *clk)
+void s3c24xx_register_clock(struct clk *clk)
 {
 	if (clk->enable == NULL)
 		clk->enable = clk_null_enable;
@@ -286,8 +286,6 @@ int s3c24xx_register_clock(struct clk *clk)
 	clk->lookup.con_id = clk->name;
 	clk->lookup.clk = clk;
 	clkdev_add(&clk->lookup);
-
-	return 0;
 }
 
 /**
@@ -298,20 +296,10 @@ int s3c24xx_register_clock(struct clk *clk)
  * Call s3c24xx_register_clock() for all the clock pointers contained
  * in the @clks list. Returns the number of failures.
  */
-int s3c24xx_register_clocks(struct clk **clks, int nr_clks)
+void s3c24xx_register_clocks(struct clk **clks, int nr_clks)
 {
-	int fails = 0;
-
-	for (; nr_clks > 0; nr_clks--, clks++) {
-		if (s3c24xx_register_clock(*clks) < 0) {
-			struct clk *clk = *clks;
-			printk(KERN_ERR "%s: failed to register %p: %s\n",
-			       __func__, clk, clk->name);
-			fails++;
-		}
-	}
-
-	return fails;
+	for (; nr_clks > 0; nr_clks--, clks++)
+		s3c24xx_register_clock(*clks);
 }
 
 /**
@@ -324,16 +312,8 @@ int s3c24xx_register_clocks(struct clk **clks, int nr_clks)
  */
 void __init s3c_register_clocks(struct clk *clkp, int nr_clks)
 {
-	int ret;
-
-	for (; nr_clks > 0; nr_clks--, clkp++) {
-		ret = s3c24xx_register_clock(clkp);
-
-		if (ret < 0) {
-			printk(KERN_ERR "Failed to register clock %s (%d)\n",
-			       clkp->name, ret);
-		}
-	}
+	for (; nr_clks > 0; nr_clks--, clkp++)
+		s3c24xx_register_clock(clkp);
 }
 
 /**
@@ -353,7 +333,7 @@ void __init s3c_disable_clocks(struct clk *clkp, int nr_clks)
 
 /* initialise all the clocks */
 
-int __init s3c24xx_register_baseclocks(unsigned long xtal)
+void __init s3c24xx_register_baseclocks(unsigned long xtal)
 {
 	printk(KERN_INFO "S3C24XX Clocks, Copyright 2004 Simtec Electronics\n");
 
@@ -361,25 +341,12 @@ int __init s3c24xx_register_baseclocks(unsigned long xtal)
 
 	/* register our clocks */
 
-	if (s3c24xx_register_clock(&clk_xtal) < 0)
-		printk(KERN_ERR "failed to register master xtal\n");
-
-	if (s3c24xx_register_clock(&clk_mpll) < 0)
-		printk(KERN_ERR "failed to register mpll clock\n");
-
-	if (s3c24xx_register_clock(&clk_upll) < 0)
-		printk(KERN_ERR "failed to register upll clock\n");
-
-	if (s3c24xx_register_clock(&clk_f) < 0)
-		printk(KERN_ERR "failed to register cpu fclk\n");
-
-	if (s3c24xx_register_clock(&clk_h) < 0)
-		printk(KERN_ERR "failed to register cpu hclk\n");
-
-	if (s3c24xx_register_clock(&clk_p) < 0)
-		printk(KERN_ERR "failed to register cpu pclk\n");
-
-	return 0;
+	s3c24xx_register_clock(&clk_xtal);
+	s3c24xx_register_clock(&clk_mpll);
+	s3c24xx_register_clock(&clk_upll);
+	s3c24xx_register_clock(&clk_f);
+	s3c24xx_register_clock(&clk_h);
+	s3c24xx_register_clock(&clk_p);
 }
 
 #if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-samsung/include/plat/clock.h
index a62753d..bed3c73 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -101,13 +101,13 @@ extern spinlock_t clocks_lock;
 
 extern int s3c2410_clkcon_enable(struct clk *clk, int enable);
 
-extern int s3c24xx_register_clock(struct clk *clk);
-extern int s3c24xx_register_clocks(struct clk **clk, int nr_clks);
+extern void s3c24xx_register_clock(struct clk *clk);
+extern void s3c24xx_register_clocks(struct clk **clk, int nr_clks);
 
 extern void s3c_register_clocks(struct clk *clk, int nr_clks);
 extern void s3c_disable_clocks(struct clk *clkp, int nr_clks);
 
-extern int s3c24xx_register_baseclocks(unsigned long xtal);
+extern void s3c24xx_register_baseclocks(unsigned long xtal);
 
 extern void s5p_register_clocks(unsigned long xtal_freq);
 
@@ -121,7 +121,7 @@ extern void s3c244x_setup_clocks(void);
 
 /* S3C2410 specific clock functions */
 
-extern int s3c2410_baseclk_add(void);
+extern void s3c2410_baseclk_add(void);
 
 /* S3C2443/S3C2416 specific clock functions */
 
diff --git a/arch/arm/plat-samsung/pwm-clock.c b/arch/arm/plat-samsung/pwm-clock.c
index a35ff3b..e9ac985 100644
--- a/arch/arm/plat-samsung/pwm-clock.c
+++ b/arch/arm/plat-samsung/pwm-clock.c
@@ -307,7 +307,7 @@ static struct pwm_tdiv_clk clk_timer_tdiv[] = {
 	},
 };
 
-static int __init clk_pwm_tdiv_register(unsigned int id)
+static void __init clk_pwm_tdiv_register(unsigned int id)
 {
 	struct pwm_tdiv_clk *divclk = &clk_timer_tdiv[id];
 	unsigned long tcfg1 = __raw_readl(S3C2410_TCFG1);
@@ -318,7 +318,7 @@ static int __init clk_pwm_tdiv_register(unsigned int id)
 	divclk->clk.id = id;
 	divclk->divisor = tcfg_to_divisor(tcfg1);
 
-	return s3c24xx_register_clock(&divclk->clk);
+	s3c24xx_register_clock(&divclk->clk);
 }
 
 static inline struct clk *s3c24xx_pwmclk_tclk(unsigned int id)
@@ -411,11 +411,8 @@ static __init int clk_pwm_tin_register(struct clk *pwm)
 	unsigned int id = pwm->id;
 
 	struct clk *parent;
-	int ret;
 
-	ret = s3c24xx_register_clock(pwm);
-	if (ret < 0)
-		return ret;
+	s3c24xx_register_clock(pwm);
 
 	tcfg1 >>= S3C2410_TCFG1_SHIFT(id);
 	tcfg1 &= S3C2410_TCFG1_MUX_MASK;
@@ -455,14 +452,8 @@ __init void s3c_pwmclk_init(void)
 	s3c_register_clocks(clk_timer_scaler, ARRAY_SIZE(clk_timer_scaler));
 	s3c_register_clocks(clk_timer_tclk, ARRAY_SIZE(clk_timer_tclk));
 
-	for (clk = 0; clk < ARRAY_SIZE(clk_timer_tdiv); clk++) {
-		ret = clk_pwm_tdiv_register(clk);
-
-		if (ret < 0) {
-			printk(KERN_ERR "error adding pwm%d tdiv clock\n", clk);
-			return;
-		}
-	}
+	for (clk = 0; clk < ARRAY_SIZE(clk_timer_tdiv); clk++)
+		clk_pwm_tdiv_register(clk);
 
 	for (clk = 0; clk < ARRAY_SIZE(clk_tin); clk++) {
 		ret = clk_pwm_tin_register(&clk_tin[clk]);
diff --git a/arch/arm/plat-samsung/s5p-clock.c b/arch/arm/plat-samsung/s5p-clock.c
index 48a1599..4b7ac92 100644
--- a/arch/arm/plat-samsung/s5p-clock.c
+++ b/arch/arm/plat-samsung/s5p-clock.c
@@ -284,11 +284,7 @@ static struct clk *s5p_clks[] __initdata = {
 
 void __init s5p_register_clocks(unsigned long xtal_freq)
 {
-	int ret;
-
 	clk_ext_xtal_mux.rate = xtal_freq;
 
-	ret = s3c24xx_register_clocks(s5p_clks, ARRAY_SIZE(s5p_clks));
-	if (ret > 0)
-		printk(KERN_ERR "Failed to register s5p clocks\n");
+	s3c24xx_register_clocks(s5p_clks, ARRAY_SIZE(s5p_clks));
 }
-- 
1.7.4.1
