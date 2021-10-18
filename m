Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08808C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 13:21:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3098610A1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 13:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhJRNXO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 18 Oct 2021 09:23:14 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39980 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbhJRNXN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 09:23:13 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211018132101euoutp02904059ab05556c64aeccab894b87ffb3~vIqBCBM7t1738917389euoutp022
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Oct 2021 13:21:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211018132101euoutp02904059ab05556c64aeccab894b87ffb3~vIqBCBM7t1738917389euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634563261;
        bh=6lJKEaDsrdQshXPjk7JFHbJASIJ7C66uboM/bE+MvXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t3wYcYK+QnBI5+bHlhvgcQS40cqzXj0aYeVfseq4f3fZ1ibO6OY5mdW6cF4pLo953
         NFDhoeTyjDSyuYgRadW8Vt03GOH7Rcn2SnMOxCAMdjo2bgk07c6Q83zVDvtzqu6Ekt
         ViNfljC1K5rCu48dFlREBKVaHrqMV/eCc97gq2C8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211018132100eucas1p1fb2d645b512fd2d08bb319dbf749dde7~vIqAci88X0520205202eucas1p1z;
        Mon, 18 Oct 2021 13:21:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 40.4E.45756.CB47D616; Mon, 18
        Oct 2021 14:21:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f~vIp-9hDFq2231722317eucas1p15;
        Mon, 18 Oct 2021 13:21:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211018132100eusmtrp2bf3e37326e1772fe7974eda9f655c5d6~vIp-7n0Vd0985809858eusmtrp2M;
        Mon, 18 Oct 2021 13:21:00 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-56-616d74bcf1d2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C3.D8.31287.CB47D616; Mon, 18
        Oct 2021 14:21:00 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211018132059eusmtip2fe9b85d99f02f792a6894c27369fcf15~vIp-gkOFp0384303843eusmtip22;
        Mon, 18 Oct 2021 13:20:59 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 2/2] clk: samsung: remove __clk_lookup() usage
Date:   Mon, 18 Oct 2021 14:54:56 +0200
Message-Id: <20211018125456.8292-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211018125456.8292-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djPc7p7SnITDab261tc//Kc1eL8+Q3s
        Fh977rFazDi/j8li7ZG77BaH37SzWvy7tpHFYtWuP4wOHB47Z91l99i0qpPNo2/LKkaPz5vk
        AliiuGxSUnMyy1KL9O0SuDJmrW5iK9gVUbHl9m62BsadXl2MnBwSAiYSp1d3snYxcnEICaxg
        lPh/+zgzhPOFUeJBz08o5zOjxJPXB1lhWtpubWGESCxnlDh/eB8rXMukzhYmkCo2AUOJrrdd
        bCC2iICDxK5jk5lAipgFvjJKPNx/jREkISzgKDFt0nUWEJtFQFXi1vmzzCA2r4CNxJ5VbUwQ
        6+QlVm84ABTn4OAUsJWYtYwDZI6EwEwOiYutjVAnuUhc33eXHcIWlnh1fAuULSPxf+d8JoiG
        ZqDF59ayQzg9jBKXm2YwQlRZS9w594sNZAOzgKbE+l36EGGg4w7dYwUJSwjwSdx4KwgSZgYy
        J22bzgwR5pXoaBOCqFaTmHV8HdzagxcuMUPYHhI3p5wGh4OQwARGiV//2Ccwys9C2LWAkXEV
        o3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYJo4/e/4px2Mc1991DvEyMTBeIhRgoNZSYQ3
        yTU3UYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvqtlr4oUE0hNLUrNTUwtSi2CyTBycUg1MrfxR
        85deK6jxcEt88ex50eXcYuESt5QrYWXm3afeik+8saOwkl3c6uHNdy4PHVZc/qSnfWvL5BAO
        xZ+F19aeT5vQPV+Wk2W+dCZLmcmjDK1l3LsurP7DyMDd+frP61XJHA+PySUnNRRWXfc/nnxY
        TUe1zOOlzfNZv+zXlx0MDvw998JO/x/MVy5dsj3x2jLmrqHYxbPnphbzq78PStyQUVitJF2t
        tTdGRNObp26ete5BVQOB+saFn6vCEr9z+YoJf3pYYDzPfnatwSXb43KXth0pnBaxSKC2QtY/
        +kXpsTZZvsDORW3ux26n3Vsk5sDqeO0F9993ZSr9FlKKhd/cP3wKOLnqSvAr8ybZxLtKLMUZ
        iYZazEXFiQAE9SjfggMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsVy+t/xe7p7SnITDSYd4LG4/uU5q8X58xvY
        LT723GO1mHF+H5PF2iN32S0Ov2lntfh3bSOLxapdfxgdODx2zrrL7rFpVSebR9+WVYwenzfJ
        BbBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GXM
        Wt3EVrAromLL7d1sDYw7vboYOTkkBEwk2m5tYexi5OIQEljKKHHuZw8TREJG4uS0BlYIW1ji
        z7UuNoiiT4wS+95uYANJsAkYSnS97QKzRQScJB59vskOUsQs8JNR4viqF+wgCWEBR4lpk66z
        gNgsAqoSt86fZQaxeQVsJPasaoPaJi+xesMBoDgHB6eArcSsZRwgphBQycpOoQmMfAsYGVYx
        iqSWFuem5xYb6hUn5haX5qXrJefnbmIEhuy2Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIrxJrrmJ
        QrwpiZVVqUX58UWlOanFhxhNga6YyCwlmpwPjJq8knhDMwNTQxMzSwNTSzNjJXHerXPXxAsJ
        pCeWpGanphakFsH0MXFwSjUwGR+ewmc21zhMxOX8pr814pdkHPtPN8wWefLiVU6O5u4Lgffd
        m0MvaIQV3VtV+6WtrLPPrLPpz1XJ7Gvha+2/evAHn1n3z/7QvdPuy1zuC79TXNDIdf1gGt9H
        vddJFrNVqpxX9m/gWtRacuXRu6K3y1PXnS+2myVydMqUA99L/isvfh3I8l/w+wGGiVrszA1v
        DaL3vLmw7fHSHKmUFRlPZnNoG9lVCNWwOdjPmXXodPkc4U2/41g3hFuUTxBO7jRaUnJ68jrh
        wKNKIYtOH9pkpHGhfqNxl2aug4XLjRTfQgWTdw/+f4iuWDKlsXdqvNfiP+9ranff4cv/zKsw
        XctpXfmKusJlyafTZOWeX+j7pMRSnJFoqMVcVJwIAO8+d1PiAgAA
X-CMS-MailID: 20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f
References: <20211018125456.8292-1-m.szyprowski@samsung.com>
        <CGME20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

__clk_lookup() interface is obsolete, so remove it from the Samsung clock
drivers. This has been achieved by getting rid of custom _get_rate()
helper and replacing it with clk_hw_get_rate().

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
v2: moved include/dt-bindings/clock/exynos*.h changes to separate file
---
 drivers/clk/samsung/clk-exynos4.c    | 18 ++++++++++--------
 drivers/clk/samsung/clk-exynos5250.c | 10 +++++-----
 drivers/clk/samsung/clk-exynos5420.c |  2 +-
 drivers/clk/samsung/clk-s3c2410.c    |  6 ++++--
 drivers/clk/samsung/clk-s3c64xx.c    |  8 ++++++--
 drivers/clk/samsung/clk-s5pv210.c    |  8 ++++++--
 drivers/clk/samsung/clk.c            | 14 --------------
 drivers/clk/samsung/clk.h            |  2 --
 8 files changed, 32 insertions(+), 36 deletions(-)

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
-- 
2.17.1

