Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D17C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 19:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEB1520781
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 19:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KsLUF6DZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732885AbgKJTdZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 14:33:25 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53873 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732199AbgKJTdR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 14:33:17 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201110193305euoutp01c072336c661ead785ea6dcb52f659c87~GPHPXGF4h1687916879euoutp01x
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2020 19:33:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201110193305euoutp01c072336c661ead785ea6dcb52f659c87~GPHPXGF4h1687916879euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605036785;
        bh=7x3FDqNd6yPXfLPVkvxpFZBwfx5uRBDKoJCZsN7uMCo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=KsLUF6DZ/ntqH/mrif1Oq16hKKj4BpAolXyF4FaAC/pmEHkd1PB9QoTgVvMxhRA12
         pKGRBBPZyzspCSGzwWxevFCfSlKLxL7xhDkCaupsw3kYOf9FLNfgpiAexegD+44Yph
         ou9V3NAIgkh3XpbTkyNyJBEcGolb7OiIe5uQA5LE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201110193254eucas1p2bdc2cc70408736e36a729cb03e2a8921~GPHFaVMDH2267922679eucas1p2A;
        Tue, 10 Nov 2020 19:32:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EB.36.06318.6EAEAAF5; Tue, 10
        Nov 2020 19:32:54 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201110193254eucas1p22e954946d03c07995c73a019e5593ba0~GPHE001x61074010740eucas1p2E;
        Tue, 10 Nov 2020 19:32:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201110193254eusmtrp1717507b811654c1b7837bbb628fc0c62~GPHE0Gtsn2264122641eusmtrp13;
        Tue, 10 Nov 2020 19:32:54 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-b8-5faaeae62949
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B9.8A.06314.5EAEAAF5; Tue, 10
        Nov 2020 19:32:54 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201110193253eusmtip24871e6f4d8ba4e0d277fdc21a381f25c~GPHETCJnf2622526225eusmtip2N;
        Tue, 10 Nov 2020 19:32:53 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-clk@vger.kernel.org, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, krzk@kernel.org, m.szyprowski@samsung.com
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com
Subject: [PATCH v4] clk: samsung: Prevent potential endless loop in the PLL
 set_rate ops
Date:   Tue, 10 Nov 2020 20:32:26 +0100
Message-Id: <20201110193226.20681-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42LZduzned1nr1bFG5xs0rDYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvF5V1z2CxmnN/HZLH2yF12i4unXC0Ov2lntfh3bSOLxapdfxgduD3e32hl
        99g56y67x6ZVnWwefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlbFo3VHWggb/iu/vixsYpzl0
        MXJySAiYSMx5spW5i5GLQ0hgBaPEuesPWSCcL4wSXVsWMEI4nxklPjSfYO9i5ABrOf6yFCK+
        nFHiwO4jjHAdW38fYgOZyyZgKNF7tI8RxBYRqJA4fekCO0gRs8ASRontyzYygkwSFoiS6G5T
        AKlhEVCVmNS5EKyeV8Ba4tfPM0wQ98lLrN5wAOw+CYHPbBIvDn1kgUi4SHy9dQ2qSFji1fEt
        7BC2jMTpyT0sEA3NjBI9u2+zQzgTGCXuH1/ACFFlLXHn3C82kCuYBTQl1u/Shwg7Snz6f5sJ
        4k0+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1SoSv1dNhzpBSqL7yX+o0zwkTh35B2YLCcRKPHp5
        gW0Co9wshF0LGBlXMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBCaM0/+Of93BuO9P0iFG
        AQ5GJR7eA3+WxQuxJpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/x
        opexQgLpiSWp2ampBalFMFkmDk6pBsbjgh6X13EJxEn6GRy+cr75zh6j86eWsskZJuvsDDnW
        da6DxWVpuWiqZFMlh2xaxY71JWUuNySUDmWHP5k971ipgtjlCPss9iW+MxdfrC/tbMtc7Va0
        8/CZvftnTLjOy/BnXdW9dA1BwczLNgI2y2v67zRekpxw/95aeedajuRF8kpd/aU5K5RYijMS
        DbWYi4oTAUbfsokUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsVy+t/xe7rPXq2KN3h6nsli44z1rBbXvzxn
        tTh/fgO7xceee6wWl3fNYbOYcX4fk8XaI3fZLS6ecrU4/Kad1eLftY0sFqt2/WF04PZ4f6OV
        3WPnrLvsHptWdbJ59G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
        rJWRqZK+nU1Kak5mWWqRvl2CXsaidUdZCxr8K76/L25gnObQxcjBISFgInH8ZWkXIxeHkMBS
        RokLn7+wQsSlJOa3KHUxcgKZwhJ/rnWxgdhCAp8YJV626YPYbAKGEr1H+xhBbBGBOokTy6ew
        g9jMAqsYJc7c9QEZIywQIXH7fRpImEVAVWJS50Kwcl4Ba4lfP88wQYyXl1i94QDzBEaeBYwM
        qxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQIDdNuxn5t3MF7aGHyIUYCDUYmH98CfZfFCrIll
        xZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCrR8IrOUaHI+MHrySuINTQ3NLSwN
        zY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUw5s7iOpy8PLREjG/jdIcoi+Brlfy7
        AlepBuzblX9BXcjb1p9fn23l2Ssdc34eX8jn2xU5tUn7h8vaiT9WJ58rF3U2nfJNlMlG6cbJ
        kAkPPp96cfTGz7RjYZzdP27ulnp4k7Hb66USgz6nzu4NmpbfCrubYmYnbDh5IUblY3HsCdtP
        p5vZDs2ercRSnJFoqMVcVJwIAGTXd0dmAgAA
X-CMS-MailID: 20201110193254eucas1p22e954946d03c07995c73a019e5593ba0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201110193254eucas1p22e954946d03c07995c73a019e5593ba0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201110193254eucas1p22e954946d03c07995c73a019e5593ba0
References: <CGME20201110193254eucas1p22e954946d03c07995c73a019e5593ba0@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The PLL status polling loops in the set_rate callbacks of some PLLs
have no timeout detection and may become endless loops when something
goes wrong with the PLL.

For some PLLs there is already the ktime API based timeout detection,
but it will not work in all conditions when .set_rate gets called.
In particular, before the clocksource is initialized or when the
timekeeping is suspended.

This patch adds a common helper with the PLL status bit polling and
timeout detection. For conditions where the timekeeping API should not
be used a simple readl_relaxed/cpu_relax() busy loop is added with the
iterations limit derived from measurements of readl_relaxed() execution
time for various PLL types and Exynos SoCs variants.

Actual PLL lock time depends on the P divider value, the VCO frequency
and a constant PLL type specific LOCK_FACTOR and can be calculated as

 lock_time = Pdiv * LOCK_FACTOR / VCO_freq

For the ktime API use cases a common timeout value of 20 ms is applied
for all the PLLs with an assumption that maximum possible value of Pdiv
is 64, maximum possible LOCK_FACTOR value is 3000 and minimum VCO
frequency is 24 MHz.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
I'm not sure whether we actually need to implement precise timeouts,
likely the simple busy loop case would be enough. AFAIK the PLL
failures happen very rarely, mostly in early code development stage
for given platform.

Changes since v3:
 - dropped udelay() from the PLL status bit polling loop as it didn't
   work on arm64 at early boot time, before timekeeping was initialized,
 - use the timekeeping API in cases when it is already initialized and
   not suspended,
 - use samsung_pll_lock_wait() also in samsung_pll3xxx_enable() function,
   now all potential endless loops are removed.
---
 drivers/clk/samsung/clk-pll.c | 147 ++++++++++++++++++++----------------------
 1 file changed, 71 insertions(+), 76 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index ac70ad7..cefb57e 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -8,14 +8,17 @@
 
 #include <linux/errno.h>
 #include <linux/hrtimer.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/timekeeping.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include "clk.h"
 #include "clk-pll.h"
 
-#define PLL_TIMEOUT_MS		10
+#define PLL_TIMEOUT_US		20000U
+#define PLL_TIMEOUT_LOOPS	1000000U
 
 struct samsung_clk_pll {
 	struct clk_hw		hw;
@@ -63,6 +66,53 @@ static long samsung_pll_round_rate(struct clk_hw *hw,
 	return rate_table[i - 1].rate;
 }
 
+static bool __early_timeout = true;
+
+static int __init samsung_pll_disable_early_timeout(void)
+{
+	__early_timeout = false;
+	return 0;
+}
+arch_initcall(samsung_pll_disable_early_timeout);
+
+/* Wait until the PLL is locked */
+static int samsung_pll_lock_wait(struct samsung_clk_pll *pll,
+				 unsigned int reg_mask)
+{
+	int i, ret;
+	u32 val;
+
+	/*
+	 * This function might be called when the timekeeping API can't be used
+	 * to detect timeouts. One situation is when the clocksource is not yet
+	 * initialized, another when the timekeeping is suspended. udelay() also
+	 * cannot be used when the clocksource is not running on arm64, since
+	 * the current timer is used as cycle counter. So a simple busy loop
+	 * is used here in that special cases. The limit of iterations has been
+	 * derived from experimental measurements of various PLLs on multiple
+	 * Exynos SoC variants. Single register read time was usually in range
+	 * 0.4...1.5 us, never less than 0.4 us.
+	 */
+	if (__early_timeout || timekeeping_suspended) {
+		i = PLL_TIMEOUT_LOOPS;
+		while (i-- > 0) {
+			if (readl_relaxed(pll->con_reg) & reg_mask)
+				return 0;
+
+			cpu_relax();
+		}
+		ret = -ETIMEDOUT;
+	} else {
+		ret = readl_relaxed_poll_timeout_atomic(pll->con_reg, val,
+					val & reg_mask, 0, PLL_TIMEOUT_US);
+	}
+
+	if (ret < 0)
+		pr_err("Could not lock PLL %s\n", clk_hw_get_name(&pll->hw));
+
+	return ret;
+}
+
 static int samsung_pll3xxx_enable(struct clk_hw *hw)
 {
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
@@ -72,13 +122,7 @@ static int samsung_pll3xxx_enable(struct clk_hw *hw)
 	tmp |= BIT(pll->enable_offs);
 	writel_relaxed(tmp, pll->con_reg);
 
-	/* wait lock time */
-	do {
-		cpu_relax();
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & BIT(pll->lock_offs)));
-
-	return 0;
+	return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
 }
 
 static void samsung_pll3xxx_disable(struct clk_hw *hw)
@@ -240,13 +284,10 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
 	writel_relaxed(tmp, pll->con_reg);
 
-	/* Wait until the PLL is locked if it is enabled. */
-	if (tmp & BIT(pll->enable_offs)) {
-		do {
-			cpu_relax();
-			tmp = readl_relaxed(pll->con_reg);
-		} while (!(tmp & BIT(pll->lock_offs)));
-	}
+	/* Wait for PLL lock if the PLL is enabled */
+	if (tmp & BIT(pll->enable_offs))
+		return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
+
 	return 0;
 }
 
@@ -318,7 +359,7 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
 					unsigned long parent_rate)
 {
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
-	u32 tmp, pll_con0, pll_con1;
+	u32 pll_con0, pll_con1;
 	const struct samsung_pll_rate_table *rate;
 
 	rate = samsung_get_pll_settings(pll, drate);
@@ -356,13 +397,8 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	pll_con1 |= rate->kdiv << PLL36XX_KDIV_SHIFT;
 	writel_relaxed(pll_con1, pll->con_reg + 4);
 
-	/* wait_lock_time */
-	if (pll_con0 & BIT(pll->enable_offs)) {
-		do {
-			cpu_relax();
-			tmp = readl_relaxed(pll->con_reg);
-		} while (!(tmp & BIT(pll->lock_offs)));
-	}
+	if (pll_con0 & BIT(pll->enable_offs))
+		return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
 
 	return 0;
 }
@@ -437,7 +473,6 @@ static int samsung_pll45xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
 	const struct samsung_pll_rate_table *rate;
 	u32 con0, con1;
-	ktime_t start;
 
 	/* Get required rate settings from table */
 	rate = samsung_get_pll_settings(pll, drate);
@@ -488,21 +523,8 @@ static int samsung_pll45xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	writel_relaxed(con1, pll->con_reg + 0x4);
 	writel_relaxed(con0, pll->con_reg);
 
-	/* Wait for locking. */
-	start = ktime_get();
-	while (!(readl_relaxed(pll->con_reg) & PLL45XX_LOCKED)) {
-		ktime_t delta = ktime_sub(ktime_get(), start);
-
-		if (ktime_to_ms(delta) > PLL_TIMEOUT_MS) {
-			pr_err("%s: could not lock PLL %s\n",
-					__func__, clk_hw_get_name(hw));
-			return -EFAULT;
-		}
-
-		cpu_relax();
-	}
-
-	return 0;
+	/* Wait for PLL lock */
+	return samsung_pll_lock_wait(pll, PLL45XX_LOCKED);
 }
 
 static const struct clk_ops samsung_pll45xx_clk_ops = {
@@ -588,7 +610,6 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
 	const struct samsung_pll_rate_table *rate;
 	u32 con0, con1, lock;
-	ktime_t start;
 
 	/* Get required rate settings from table */
 	rate = samsung_get_pll_settings(pll, drate);
@@ -647,21 +668,8 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	writel_relaxed(con0, pll->con_reg);
 	writel_relaxed(con1, pll->con_reg + 0x4);
 
-	/* Wait for locking. */
-	start = ktime_get();
-	while (!(readl_relaxed(pll->con_reg) & PLL46XX_LOCKED)) {
-		ktime_t delta = ktime_sub(ktime_get(), start);
-
-		if (ktime_to_ms(delta) > PLL_TIMEOUT_MS) {
-			pr_err("%s: could not lock PLL %s\n",
-					__func__, clk_hw_get_name(hw));
-			return -EFAULT;
-		}
-
-		cpu_relax();
-	}
-
-	return 0;
+	/* Wait for PLL lock */
+	return samsung_pll_lock_wait(pll, PLL46XX_LOCKED);
 }
 
 static const struct clk_ops samsung_pll46xx_clk_ops = {
@@ -1035,14 +1043,9 @@ static int samsung_pll2550xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			(rate->sdiv << PLL2550XX_S_SHIFT);
 	writel_relaxed(tmp, pll->con_reg);
 
-	/* wait_lock_time */
-	do {
-		cpu_relax();
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & (PLL2550XX_LOCK_STAT_MASK
-			<< PLL2550XX_LOCK_STAT_SHIFT)));
-
-	return 0;
+	/* Wait for PLL lock */
+	return samsung_pll_lock_wait(pll,
+			PLL2550XX_LOCK_STAT_MASK << PLL2550XX_LOCK_STAT_SHIFT);
 }
 
 static const struct clk_ops samsung_pll2550xx_clk_ops = {
@@ -1132,13 +1135,9 @@ static int samsung_pll2650x_set_rate(struct clk_hw *hw, unsigned long drate,
 	con1 |= ((rate->kdiv & PLL2650X_K_MASK) << PLL2650X_K_SHIFT);
 	writel_relaxed(con1, pll->con_reg + 4);
 
-	do {
-		cpu_relax();
-		con0 = readl_relaxed(pll->con_reg);
-	} while (!(con0 & (PLL2650X_LOCK_STAT_MASK
-			<< PLL2650X_LOCK_STAT_SHIFT)));
-
-	return 0;
+	/* Wait for PLL lock */
+	return samsung_pll_lock_wait(pll,
+			PLL2650X_LOCK_STAT_MASK << PLL2650X_LOCK_STAT_SHIFT);
 }
 
 static const struct clk_ops samsung_pll2650x_clk_ops = {
@@ -1196,7 +1195,7 @@ static int samsung_pll2650xx_set_rate(struct clk_hw *hw, unsigned long drate,
 					unsigned long parent_rate)
 {
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
-	u32 tmp, pll_con0, pll_con2;
+	u32 pll_con0, pll_con2;
 	const struct samsung_pll_rate_table *rate;
 
 	rate = samsung_get_pll_settings(pll, drate);
@@ -1229,11 +1228,7 @@ static int samsung_pll2650xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	writel_relaxed(pll_con0, pll->con_reg);
 	writel_relaxed(pll_con2, pll->con_reg + 8);
 
-	do {
-		tmp = readl_relaxed(pll->con_reg);
-	} while (!(tmp & (0x1 << PLL2650XX_PLL_LOCKTIME_SHIFT)));
-
-	return 0;
+	return samsung_pll_lock_wait(pll, 0x1 << PLL2650XX_PLL_LOCKTIME_SHIFT);
 }
 
 static const struct clk_ops samsung_pll2650xx_clk_ops = {
-- 
2.7.4

