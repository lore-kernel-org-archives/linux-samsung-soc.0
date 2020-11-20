Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B00AC5519F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 15:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A851222264
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 15:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kAI/Q3KG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbgKTP6G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 10:58:06 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59279 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729945AbgKTP6F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 10:58:05 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201120155754euoutp02d7ae7c208098a3b445408dee8665f97a~JQoNcUpYW2114321143euoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2020 15:57:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201120155754euoutp02d7ae7c208098a3b445408dee8665f97a~JQoNcUpYW2114321143euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605887874;
        bh=mJ7tA81AK0Z77Z+3ZEjUVCU+x515iFoUHn4Cwgl/Rjw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=kAI/Q3KGLil7Fc+YA3xMegFgReKk4cw9hVf/hyQ8ULcdNlQpi50DMSURdEzQ/ovGq
         ybrMj7Ore1nbGBt8QbYXrTemwqixhvluowuF9IAXyrLg5lYt+NA2m36td9YmEpjpmo
         M6+AK2+zHA665dg+p3aW1qbCFD6cuU/D3o5jDgnM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201120155748eucas1p14243ff862ab203297b063ef0113f72e7~JQoIGdJcF3174931749eucas1p14;
        Fri, 20 Nov 2020 15:57:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id AB.C1.44805.C77E7BF5; Fri, 20
        Nov 2020 15:57:48 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201120155747eucas1p248a1f0b71fbd8f329271494d7a207347~JQoHliDF81488714887eucas1p2b;
        Fri, 20 Nov 2020 15:57:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201120155747eusmtrp155b4e4c18e4274cdeae1c9f6d2935ccb~JQoHk3GPb1261812618eusmtrp18;
        Fri, 20 Nov 2020 15:57:47 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-21-5fb7e77c2df6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id AC.00.21957.B77E7BF5; Fri, 20
        Nov 2020 15:57:47 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201120155747eusmtip112487d9e984fdd76236f9905e676d198~JQoG8iVQa0505805058eusmtip1q;
        Fri, 20 Nov 2020 15:57:47 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     linux-clk@vger.kernel.org, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, krzk@kernel.org, m.szyprowski@samsung.com
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com
Subject: [PATCH v5] clk: samsung: Prevent potential endless loop in the PLL
 ops
Date:   Fri, 20 Nov 2020 16:57:31 +0100
Message-Id: <20201120155731.26898-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRmVeSWpSXmKPExsWy7djPc7o1z7fHG+z/yWuxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLy7vmsFnMOL+PyWLtkbvsFhdPuVocftPOavHv2kYWi1W7/jA6cHu8v9HK
        7rFz1l12j02rOtk8+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK2PeodPsBcf8K94evc/WwHjJ
        oYuRk0NCwETiZecx9i5GLg4hgRWMEoeXHWWCcL4wShy73swC4XxmlNjy6SETTMuKZZuZQWwh
        geWMEnt/acN17J7yigUkwSZgKNF7tI8RxBYRqJA4fekC2A5mgSWMEtuXbQRLCAsESjTuusMO
        YrMIqEosmPUWbCqvgLVEx9ZPLBDb5CVWbzjADNIsIbCQQ+Lk3VWsEAkXiR3PTkKdJCzx6vgW
        dghbRuL05B4WiIZmRome3bfZIZwJjBL3jy9ghKiylrhz7hdbFyMH0E2aEut36UOEHSUOPXjB
        BBKWEOCTuPFWECTMDGRO2jadGSLMK9HRJgRRrSLxe9V0qBOkJLqf/Ie62UNi4fGpLJAQipXY
        MPUA8wRGuVkIuxYwMq5iFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITBqn/x3/soNx+auP
        eocYmTgYDzFKcDArifCu1dwaL8SbklhZlVqUH19UmpNafIhRmoNFSZw3acuaeCGB9MSS1OzU
        1ILUIpgsEwenVANTSNlUWV3l+3OLfwZyz52TVDNjAptntc380FOtBtyzln+Y4f9Qd/KmUzc1
        mtvP/+Hdtt6D9dGWKzbRN0Jert5bufSt4saiPXo81/KCtu5q7J1w27SEVTMgKX5H6w7m5Xry
        S+8/UzCZ7nTpVYWcl95yicPl1c/fHUpzmunMa8U7cTqbn/j8MN+fzw5KqKsf1M6J2pGzNz9N
        nc/o+XqtNOVgFc+VSyeG7rmvFWT0u/5czf9lkp/+88Vtf/7/zeYNBX01V/+ERfuWPXudsKQ6
        UGv1M6N/QpcWcRluW1ui9qGLXVV217a2BULT78lWTZxdkvD05KJZTJWzyqWvbIiykIy6ZFZy
        9XfZDS3ON7/6dyxbrcRSnJFoqMVcVJwIAKN7+w+JAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xu7rVz7fHG9y9rmaxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLy7vmsFnMOL+PyWLtkbvsFhdPuVocftPOavHv2kYWi1W7/jA6cHu8v9HK
        7rFz1l12j02rOtk8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
        1srIVEnfziYlNSezLLVI3y5BL2PeodPsBcf8K94evc/WwHjJoYuRk0NCwERixbLNzF2MXBxC
        AksZJQ7dWMnSxcgBlJCSmN+iBFEjLPHnWhcbRM0nRomGp38ZQRJsAoYSvUf7wGwRgTqJE8un
        sIPYzAKrGCXO3PUBsYUF/CXuvDrBAmKzCKhKLJj1lhnE5hWwlujY+okFYoG8xOoNB5gnMPIs
        YGRYxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERio24793LyDcd6rj3qHGJk4GA8xSnAwK4nw
        rtXcGi/Em5JYWZValB9fVJqTWnyI0RRo30RmKdHkfGCs5JXEG5oZmBqamFkamFqaGSuJ826d
        uyZeSCA9sSQ1OzW1ILUIpo+Jg1OqgamU48m6n2k6uipNeY/ykzi3Lt1leX7bK+cpWzt9Z1S9
        dSn38lTO6f53vdb2+cLZtz7/+pl0Z13BiWlumz+L/buXxeby/+9PX4Vfp1erJq3dcyLmMMtu
        16BJCxhv8b9+7ygW62y36pr/CV7hCdZ+n2PFrYsjttscn/hykdKb0FOJHBf1eOqTl+jviHwU
        96i7Uf2jPKfo/byt/qKNx+bJJ3gvbl07p/xyT5iD5dS3j4uKxVr5rlv3nvH0vvlI2fKSXPnB
        +vL85xaHvh46kCcbp3q923qqd3NQxO3Lj2+fjpP3Ofu862uf6nvzyLMprjzy53OOarDdbmE8
        V/KvNrmZX7Px5O26qQu+S9a+qUvJ91BiKc5INNRiLipOBACB2wBM3QIAAA==
X-CMS-MailID: 20201120155747eucas1p248a1f0b71fbd8f329271494d7a207347
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201120155747eucas1p248a1f0b71fbd8f329271494d7a207347
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201120155747eucas1p248a1f0b71fbd8f329271494d7a207347
References: <CGME20201120155747eucas1p248a1f0b71fbd8f329271494d7a207347@eucas1p2.samsung.com>
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

Changes since v4:
 - s/__early_timeout/pll_early_timeout

Changes since v3:
 - dropped udelay() from the PLL status bit polling loop as it didn't
   work on arm64 at early boot time, before timekeeping was initialized,
 - use the timekeeping API in cases when it is already initialized and
   not suspended,
 - use samsung_pll_lock_wait() also in samsung_pll3xxx_enable() function,
   now all potential endless loops are eliminated.
---
 drivers/clk/samsung/clk-pll.c | 147 ++++++++++++++++++++----------------------
 1 file changed, 71 insertions(+), 76 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index ac70ad7..5873a93 100644
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
 
+static bool pll_early_timeout = true;
+
+static int __init samsung_pll_disable_early_timeout(void)
+{
+	pll_early_timeout = false;
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
+	if (pll_early_timeout || timekeeping_suspended) {
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

