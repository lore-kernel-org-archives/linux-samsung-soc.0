Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC0AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 09:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A30C7611C3
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 09:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237491AbhJOJlo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 05:41:44 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47922 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237475AbhJOJlo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 05:41:44 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211015093936euoutp02f6c24f526a535837a09e0016c327ea33~uKs1_tg811890918909euoutp02P
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 09:39:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211015093936euoutp02f6c24f526a535837a09e0016c327ea33~uKs1_tg811890918909euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634290776;
        bh=4PFKUejyCe8018deKQnPORsjdKDTprpKSjEBVu+A/b0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=fn4TLnBQgJAAxhM39pLpQn/MB/FqcczwzPNhsXNKuL2H2SmDC9iSWjH0909bBbd3n
         6qg2FHd+Jaregaqie0/4H2M7/SrK6T8KqL0yjpX0TANgWvz94KEwVh1hGpF9FYTqmi
         ajmDGGgqetmCoUNHk5zlAVAjGEc5iKI1EqDaWRZc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211015093936eucas1p2929ef481166af3347840cf69d18f547e~uKs1n53zj1897418974eucas1p2U;
        Fri, 15 Oct 2021 09:39:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 4B.D3.56448.85C49616; Fri, 15
        Oct 2021 10:39:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3~uKs1DDffR2111621116eucas1p2c;
        Fri, 15 Oct 2021 09:39:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211015093935eusmtrp13a6da0ebf5cba86c7b434edb3e5d9a9e~uKs1CWFpl0232902329eusmtrp1L;
        Fri, 15 Oct 2021 09:39:35 +0000 (GMT)
X-AuditID: cbfec7f5-d53ff7000002dc80-68-61694c58ccd7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B8.99.20981.75C49616; Fri, 15
        Oct 2021 10:39:35 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211015093935eusmtip2efc863d20886829f4c024a957f0edebd~uKs0l9g4y1904319043eusmtip2z;
        Fri, 15 Oct 2021 09:39:35 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: samsung: remove __clk_lookup() usage
Date:   Fri, 15 Oct 2021 11:39:31 +0200
Message-Id: <20211015093931.28086-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7djPc7oRPpmJBhf2iFtc//Kc1eL8+Q3s
        Fh977rFazDi/j8li7ZG77BaH37SzWvy7tpHFYtWuP4wOHB47Z91l99i0qpPNo2/LKkaPz5vk
        AliiuGxSUnMyy1KL9O0SuDJu3bjIWrAsreJe/zLWBsbnoV2MnBwSAiYSZ7ddZ+5i5OIQEljB
        KLHt9i0WkISQwBdGiUXNaRCJz4wSh79PZYXpuDy3kQkisZxRYu2hk6xwHZ+7I0BsNgFDia63
        XWwgtoiAg8SuY5PBGpgFvjJKPNx/jREkISxgJdF6+RKYzSKgKrHg2HRmEJtXwFbi7JtVUNvk
        JVZvOMAMYTdySNz8JQNhu0g0PN8AVSMs8er4FnYIW0bi9OQeFpBlEgLNQMvOrWWHcHoYJS43
        zWCEqLKWuHPuF9B5HEAnaUqs36UPEXaUeNuwDiwsIcAnceOtIEiYGcictA3kNpAwr0RHmxBE
        tZrErOPr4NYevHAJ6kwPiSe3r0PDJFbi3YclLBMY5WYh7FrAyLiKUTy1tDg3PbXYOC+1XK84
        Mbe4NC9dLzk/dxMjMBWc/nf86w7GFa8+6h1iZOJgPMQowcGsJML77kB6ohBvSmJlVWpRfnxR
        aU5q8SFGaQ4WJXHeXVvXxAsJpCeWpGanphakFsFkmTg4pRqYWhOmeU46dVp6J5ep21HJaek2
        vXcFHb/l7lV48Vci+EERN1/0k5tKIezvaiVvC2gvenONTTPQ/3rx3eufom8ul2ysWfJcST92
        n9gGlmjRz2IKdfeW/VzhGKdk+cXbN17mYs+rbX82JTfpvvXMO2Nm/GfxoQj/vrbzykaW86dJ
        N/yMzn+zoSyLyzZkr9K104tbmnWmv4jMelPLJvoteefd1/2G3uerahRv8VRbTN73lFPe73A7
        sxZrX8+SsuJXsnNkU/vvf3b6uTLxRe83hfPWfDJrzk11X+12JGtbapTP1F3bFZ8tj1c9Zfxn
        3aN7RoYrtwX5z7PZ8Ftj0am2zn0V3A+dV97teuKwbL3mnNlrlViKMxINtZiLihMBFPpxn3QD
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsVy+t/xe7rhPpmJBs8a9Cyuf3nOanH+/AZ2
        i48991gtZpzfx2Sx9shddovDb9pZLf5d28hisWrXH0YHDo+ds+6ye2xa1cnm0bdlFaPH501y
        ASxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehm3
        blxkLViWVnGvfxlrA+Pz0C5GTg4JAROJy3MbmboYuTiEBJYySjR93s4KkZCRODmtAcoWlvhz
        rYsNougTo8T9W08ZQRJsAoYSXW9BEpwcIgJOEo8+32QHKWIW+MkocXzVC3aQhLCAlUTr5Utg
        DSwCqhILjk1nBrF5BWwlzr5ZBbVBXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dL
        zs/dxAgMw23Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeN8dSE8U4k1JrKxKLcqPLyrNSS0+xGgK
        tG8is5Rocj4wEvJK4g3NDEwNTcwsDUwtzYyVxHlNjqyJFxJITyxJzU5NLUgtgulj4uCUamBa
        MnniL4eLzL93W9jodydcPZ4clVjgynfm9m3jGzEPz53r73L2yfE5GZBsm8bkeKDXwVpppaK7
        9keHN3eyz3xc+1ubccvxr++3KxR6tjXdYkiK+TRzqee1I9Hbo866/VOW+1HJ4XNd55DAh/cf
        LrzRmPdxw73lH4/xOb5ImVvN7PP6Vvgc38/JljIt6QunsTwPv2QsdOi6WWaRWuImp0bN+/v2
        zL79zsXqQvWZZ7JhOxhXN83Ou1E9p8Hu/colLZv2GswTePGhQ+rLxi8LZq2eZeHi+8Gl5om/
        kPRK+e5sdeFrZjEW6d42vurZD2bqr7EqEFof69r/IMIy8vPfAMHy1pv/jZ7JcqvsvNltZVmn
        xFKckWioxVxUnAgAwpSc5swCAAA=
X-CMS-MailID: 20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3
References: <CGME20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

__clk_lookup() interface is obsolete, so remove it from the Samsung clock
drivers. This has been achieved by getting rid of custom _get_rate()
helper and replacing it with clk_hw_get_rate().

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch is based on top of the "[RFT PATCH v4 0/2] clk: samsung: add
common support for CPU clocks" patchset:
https://lore.kernel.org/linux-samsung-soc/20211014195347.3635601-1-willmcvicker@google.com/

Tested on the following Exynos SoC based boards: 4210, 4412, 5250 and
5422. S3C2410, S3C64XX and S5PV210 are only compile-tested.
---
 drivers/clk/samsung/clk-exynos4.c      | 18 ++++++++++--------
 drivers/clk/samsung/clk-exynos5250.c   | 10 +++++-----
 drivers/clk/samsung/clk-exynos5420.c   |  2 +-
 drivers/clk/samsung/clk-s3c2410.c      |  6 ++++--
 drivers/clk/samsung/clk-s3c64xx.c      |  8 ++++++--
 drivers/clk/samsung/clk-s5pv210.c      |  8 ++++++--
 drivers/clk/samsung/clk.c              | 14 --------------
 drivers/clk/samsung/clk.h              |  2 --
 include/dt-bindings/clock/exynos4.h    |  4 +++-
 include/dt-bindings/clock/exynos5250.h |  4 +++-
 10 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index bf13e29a655c..42b4b62bd483 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -437,7 +437,7 @@ static const struct samsung_mux_clock exynos4_mux_clks[] __initconst = {
 
 /* list of mux clocks supported in exynos4210 soc */
 static const struct samsung_mux_clock exynos4210_mux_early[] __initconst = {
-	MUX(0, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP1, 0, 1),
+	MUX(CLK_MOUT_VPLLSRC, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP1, 0, 1),
 };
 
 static const struct samsung_mux_clock exynos4210_mux_clks[] __initconst = {
@@ -603,7 +603,7 @@ static const struct samsung_div_clock exynos4_div_clks[] __initconst = {
 	DIV(0, "div_periph", "div_core2", DIV_CPU0, 12, 3),
 	DIV(0, "div_atb", "mout_core", DIV_CPU0, 16, 3),
 	DIV(0, "div_pclk_dbg", "div_atb", DIV_CPU0, 20, 3),
-	DIV(0, "div_core2", "div_core", DIV_CPU0, 28, 3),
+	DIV(CLK_DIV_CORE2, "div_core2", "div_core", DIV_CPU0, 28, 3),
 	DIV(0, "div_copy", "mout_hpm", DIV_CPU1, 0, 3),
 	DIV(0, "div_hpm", "div_copy", DIV_CPU1, 4, 3),
 	DIV(0, "div_clkout_cpu", "mout_clkout_cpu", CLKOUT_CMU_CPU, 8, 6),
@@ -1254,21 +1254,21 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_register_mux(ctx, exynos4210_mux_early,
 					ARRAY_SIZE(exynos4210_mux_early));
 
-		if (_get_rate("fin_pll") == 24000000) {
+		if (clk_hw_get_rate(hws[CLK_FIN_PLL]) == 24000000) {
 			exynos4210_plls[apll].rate_table =
 							exynos4210_apll_rates;
 			exynos4210_plls[epll].rate_table =
 							exynos4210_epll_rates;
 		}
 
-		if (_get_rate("mout_vpllsrc") == 24000000)
+		if (clk_hw_get_rate(hws[CLK_MOUT_VPLLSRC]) == 24000000)
 			exynos4210_plls[vpll].rate_table =
 							exynos4210_vpll_rates;
 
 		samsung_clk_register_pll(ctx, exynos4210_plls,
 					ARRAY_SIZE(exynos4210_plls), reg_base);
 	} else {
-		if (_get_rate("fin_pll") == 24000000) {
+		if (clk_hw_get_rate(hws[CLK_FIN_PLL]) == 24000000) {
 			exynos4x12_plls[apll].rate_table =
 							exynos4x12_apll_rates;
 			exynos4x12_plls[epll].rate_table =
@@ -1344,9 +1344,11 @@ static void __init exynos4_clk_init(struct device_node *np,
 	pr_info("%s clocks: sclk_apll = %ld, sclk_mpll = %ld\n"
 		"\tsclk_epll = %ld, sclk_vpll = %ld, arm_clk = %ld\n",
 		exynos4_soc == EXYNOS4210 ? "Exynos4210" : "Exynos4x12",
-		_get_rate("sclk_apll"),	_get_rate("sclk_mpll"),
-		_get_rate("sclk_epll"), _get_rate("sclk_vpll"),
-		_get_rate("div_core2"));
+		clk_hw_get_rate(hws[CLK_SCLK_APLL]),
+		clk_hw_get_rate(hws[CLK_SCLK_MPLL]),
+		clk_hw_get_rate(hws[CLK_SCLK_EPLL]),
+		clk_hw_get_rate(hws[CLK_SCLK_VPLL]),
+		clk_hw_get_rate(hws[CLK_DIV_CORE2]));
 }
 
 
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 06588fab408a..fde4998d2aab 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -239,7 +239,7 @@ static const struct samsung_fixed_factor_clock exynos5250_fixed_factor_clks[] __
 };
 
 static const struct samsung_mux_clock exynos5250_pll_pmux_clks[] __initconst = {
-	MUX(0, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1),
+	MUX(CLK_MOUT_VPLLSRC, "mout_vpllsrc", mout_vpllsrc_p, SRC_TOP2, 0, 1),
 };
 
 static const struct samsung_mux_clock exynos5250_mux_clks[] __initconst = {
@@ -351,7 +351,7 @@ static const struct samsung_div_clock exynos5250_div_clks[] __initconst = {
 	 */
 	DIV(0, "div_arm", "mout_cpu", DIV_CPU0, 0, 3),
 	DIV(0, "div_apll", "mout_apll", DIV_CPU0, 24, 3),
-	DIV(0, "div_arm2", "div_arm", DIV_CPU0, 28, 3),
+	DIV(CLK_DIV_ARM2, "div_arm2", "div_arm", DIV_CPU0, 28, 3),
 
 	/*
 	 * CMU_TOP
@@ -801,12 +801,12 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	samsung_clk_register_mux(ctx, exynos5250_pll_pmux_clks,
 				ARRAY_SIZE(exynos5250_pll_pmux_clks));
 
-	if (_get_rate("fin_pll") == 24 * MHZ) {
+	if (clk_hw_get_rate(hws[CLK_FIN_PLL]) == 24 * MHZ) {
 		exynos5250_plls[epll].rate_table = epll_24mhz_tbl;
 		exynos5250_plls[apll].rate_table = apll_24mhz_tbl;
 	}
 
-	if (_get_rate("mout_vpllsrc") == 24 * MHZ)
+	if (clk_hw_get_rate(hws[CLK_MOUT_VPLLSRC]) == 24 * MHZ)
 		exynos5250_plls[vpll].rate_table =  vpll_24mhz_tbl;
 
 	samsung_clk_register_pll(ctx, exynos5250_plls,
@@ -855,6 +855,6 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	samsung_clk_of_add_provider(np, ctx);
 
 	pr_info("Exynos5250: clock setup completed, armclk=%ld\n",
-			_get_rate("div_arm2"));
+		clk_hw_get_rate(hws[CLK_DIV_ARM2]));
 }
 CLK_OF_DECLARE_DRIVER(exynos5250_clk, "samsung,exynos5250-clock", exynos5250_clk_init);
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 3ccd4eabd2a6..747196bbea2a 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1580,7 +1580,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 			ARRAY_SIZE(exynos5x_fixed_rate_ext_clks),
 			ext_clk_match);
 
-	if (_get_rate("fin_pll") == 24 * MHZ) {
+	if (clk_hw_get_rate(hws[CLK_FIN_PLL]) == 24 * MHZ) {
 		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
 		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index 5831d0606077..3d152a46169b 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -323,6 +323,7 @@ void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
 				    void __iomem *base)
 {
 	struct samsung_clk_provider *ctx;
+	struct clk_hw **hws;
 	reg_base = base;
 
 	if (np) {
@@ -332,13 +333,14 @@ void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
 	}
 
 	ctx = samsung_clk_init(np, reg_base, NR_CLKS);
+	hws = ctx->clk_data.hws;
 
 	/* Register external clocks only in non-dt cases */
 	if (!np)
 		s3c2410_common_clk_register_fixed_ext(ctx, xti_f);
 
 	if (current_soc == S3C2410) {
-		if (_get_rate("xti") == 12 * MHZ) {
+		if (clk_hw_get_rate(hws[XTI]) == 12 * MHZ) {
 			s3c2410_plls[mpll].rate_table = pll_s3c2410_12mhz_tbl;
 			s3c2410_plls[upll].rate_table = pll_s3c2410_12mhz_tbl;
 		}
@@ -348,7 +350,7 @@ void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
 				ARRAY_SIZE(s3c2410_plls), reg_base);
 
 	} else { /* S3C2440, S3C2442 */
-		if (_get_rate("xti") == 12 * MHZ) {
+		if (clk_hw_get_rate(hws[XTI]) == 12 * MHZ) {
 			/*
 			 * plls follow different calculation schemes, with the
 			 * upll following the same scheme as the s3c2410 plls
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index 56f95b63f71f..d6b432a26d63 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -394,6 +394,7 @@ void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 			     void __iomem *base)
 {
 	struct samsung_clk_provider *ctx;
+	struct clk_hw **hws;
 
 	reg_base = base;
 	is_s3c6400 = s3c6400;
@@ -405,6 +406,7 @@ void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 	}
 
 	ctx = samsung_clk_init(np, reg_base, NR_CLKS);
+	hws = ctx->clk_data.hws;
 
 	/* Register external clocks. */
 	if (!np)
@@ -459,8 +461,10 @@ void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 	pr_info("%s clocks: apll = %lu, mpll = %lu\n"
 		"\tepll = %lu, arm_clk = %lu\n",
 		is_s3c6400 ? "S3C6400" : "S3C6410",
-		_get_rate("fout_apll"),	_get_rate("fout_mpll"),
-		_get_rate("fout_epll"), _get_rate("armclk"));
+		clk_hw_get_rate(hws[MOUT_APLL]),
+		clk_hw_get_rate(hws[MOUT_MPLL]),
+		clk_hw_get_rate(hws[MOUT_EPLL]),
+		clk_hw_get_rate(hws[ARMCLK]));
 }
 
 static void __init s3c6400_clk_init(struct device_node *np)
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index e7b68ffe36de..4425186bdcab 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -741,8 +741,10 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 				      bool is_s5p6442)
 {
 	struct samsung_clk_provider *ctx;
+	struct clk_hw **hws;
 
 	ctx = samsung_clk_init(np, reg_base, NR_CLKS);
+	hws = ctx->clk_data.hws;
 
 	samsung_clk_register_mux(ctx, early_mux_clks,
 					ARRAY_SIZE(early_mux_clks));
@@ -789,8 +791,10 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 	pr_info("%s clocks: mout_apll = %ld, mout_mpll = %ld\n"
 		"\tmout_epll = %ld, mout_vpll = %ld\n",
 		is_s5p6442 ? "S5P6442" : "S5PV210",
-		_get_rate("mout_apll"), _get_rate("mout_mpll"),
-		_get_rate("mout_epll"), _get_rate("mout_vpll"));
+		clk_hw_get_rate(hws[MOUT_APLL]),
+		clk_hw_get_rate(hws[MOUT_MPLL]),
+		clk_hw_get_rate(hws[MOUT_EPLL]),
+		clk_hw_get_rate(hws[MOUT_VPLL]));
 }
 
 static void __init s5pv210_clk_dt_init(struct device_node *np)
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 336243c6f120..bca4731b14ea 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -268,20 +268,6 @@ void __init samsung_clk_of_register_fixed_ext(struct samsung_clk_provider *ctx,
 	samsung_clk_register_fixed_rate(ctx, fixed_rate_clk, nr_fixed_rate_clk);
 }
 
-/* utility function to get the rate of a specified clock */
-unsigned long _get_rate(const char *clk_name)
-{
-	struct clk *clk;
-
-	clk = __clk_lookup(clk_name);
-	if (!clk) {
-		pr_err("%s: could not find clock %s\n", __func__, clk_name);
-		return 0;
-	}
-
-	return clk_get_rate(clk);
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int samsung_clk_suspend(void)
 {
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 26499e97275b..b23776d540eb 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -381,8 +381,6 @@ extern struct samsung_clk_provider __init *samsung_cmu_register_one(
 			struct device_node *,
 			const struct samsung_cmu_info *);
 
-extern unsigned long _get_rate(const char *clk_name);
-
 #ifdef CONFIG_PM_SLEEP
 extern void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 			const unsigned long *rdump,
diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index 88ec3968b90a..acbfbab875ec 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -209,6 +209,7 @@
 #define CLK_ACLK400_MCUISP	395 /* Exynos4x12 only */
 #define CLK_MOUT_HDMI		396
 #define CLK_MOUT_MIXER		397
+#define CLK_MOUT_VPLLSRC	398
 
 /* gate clocks - ppmu */
 #define CLK_PPMULEFT		400
@@ -236,9 +237,10 @@
 #define CLK_DIV_C2C		458 /* Exynos4x12 only */
 #define CLK_DIV_GDL		459
 #define CLK_DIV_GDR		460
+#define CLK_DIV_CORE2		461
 
 /* must be greater than maximal clock id */
-#define CLK_NR_CLKS		461
+#define CLK_NR_CLKS		462
 
 /* Exynos4x12 ISP clocks */
 #define CLK_ISP_FIMC_ISP		 1
diff --git a/include/dt-bindings/clock/exynos5250.h b/include/dt-bindings/clock/exynos5250.h
index e259cc01f22f..4680da7357d3 100644
--- a/include/dt-bindings/clock/exynos5250.h
+++ b/include/dt-bindings/clock/exynos5250.h
@@ -19,6 +19,7 @@
 #define CLK_FOUT_EPLL		7
 #define CLK_FOUT_VPLL		8
 #define CLK_ARM_CLK		9
+#define CLK_DIV_ARM2		10
 
 /* gate for special clocks (sclk) */
 #define CLK_SCLK_CAM_BAYER	128
@@ -174,8 +175,9 @@
 #define CLK_MOUT_ACLK300_DISP1_SUB	1027
 #define CLK_MOUT_APLL		1028
 #define CLK_MOUT_MPLL		1029
+#define CLK_MOUT_VPLLSRC	1030
 
 /* must be greater than maximal clock id */
-#define CLK_NR_CLKS		1030
+#define CLK_NR_CLKS		1031
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_5250_H */
-- 
2.17.1

