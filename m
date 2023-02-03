Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CBEC63797
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 06:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjBCGJG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbjBCGJF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 01:09:05 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA327167F
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Feb 2023 22:09:03 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-16346330067so5535958fac.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2023 22:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP1kmPfCeQKgCd6GN37+7ZY116BDOd653jRamI2rf4Q=;
        b=JbwS6hQ/EPlcMMnSMfrsjVyEYVxwTJUzWKRRg8v+WilnqkjNzttyZJjJ3mQvAjKLK7
         kvSfAx5XsSqW2C5Nnmi5SpTH1xeTM5N29GFuJceJQCGQUHzsJS7fZgleAVWs7tFxMOm1
         FHOnPhpRHLkgGKSdUE+HEnwcMTrVhik1sCEZu3axrqa7R83YY8TUpmqf2/PNias9Kl6A
         t13cLppfKbnozcNCpu95zHOUPcB6EoSoLVg6Sx78zyeMJsRDF/k8j/cBdo3qbbxi9CJE
         7sQRNRNMCFqr/zPaxftFUnXKyqq5b0QrY71tsaegZnMCIFTAKKzwQhCGHi7FnmmaAbxo
         Sh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP1kmPfCeQKgCd6GN37+7ZY116BDOd653jRamI2rf4Q=;
        b=pAbnaQ/RD4lFdSIx2NxURT5J6/b3syKpQW+uhGW43vhyCEZ6tjQ2aeP4bOR6aPrlxs
         YRwAzt+mn5Vucbui4TNSEK21e/+Fc/zDtaEhMPuP9KZ/BUquU35aJPToP4j9n34xTcL3
         I3Ih6bVGLUCk1QbBumc1IBFP/KS8rNIaKiJKoWLuN52cICVASS7TyRyrqadCuv84pmki
         AjqoerZEDG8Llm6nYO/97C8DWUr99Qzd2r6dz1sk4J5v7KhC6duxjAU3VXV967UNqrKQ
         rZDMuWQ7wrNIXKzJ60tOCdgmZsn4vMjKa8FrdydED4s5g4ZjgC4ZSORxk8EOFOxSTdWP
         2sCw==
X-Gm-Message-State: AO0yUKXjOJe4CGxWiB8D2ql+dJaj+GB8xa5qPy/vBm4fCgQbU/pSJk/S
        ZLF7TolRQt9gKq9lM5QbrJPhwg==
X-Google-Smtp-Source: AK7set/iszwxO1qsbnnzQ/GgAqXJ2hMKbUIZ4jpJpe9w0tIAMANdSsBQNyexdqqlPjE5zji2IZBFHQ==
X-Received: by 2002:a05:6870:390c:b0:163:35f9:a4cd with SMTP id b12-20020a056870390c00b0016335f9a4cdmr4470812oap.51.1675404542767;
        Thu, 02 Feb 2023 22:09:02 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id u3-20020a05687036c300b001428eb454e9sm603570oak.13.2023.02.02.22.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 22:09:02 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] clk: samsung: Don't pass reg_base to samsung_clk_register_pll()
Date:   Fri,  3 Feb 2023 00:09:19 -0600
Message-Id: <20230203060924.8257-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230203060924.8257-1-semen.protsenko@linaro.org>
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Base address can be derived from context structure. Remove `base'
argument from samsung_clk_register_pll() and use `ctx->reg_base'
instead, as it's done in other clock registering functions.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos4.c    |  4 ++--
 drivers/clk/samsung/clk-exynos5250.c |  3 +--
 drivers/clk/samsung/clk-exynos5420.c |  3 +--
 drivers/clk/samsung/clk-exynos5433.c |  4 ++--
 drivers/clk/samsung/clk-pll.c        | 11 +++++------
 drivers/clk/samsung/clk-s3c2410.c    |  4 ++--
 drivers/clk/samsung/clk-s3c2412.c    |  3 +--
 drivers/clk/samsung/clk-s3c2443.c    |  4 ++--
 drivers/clk/samsung/clk-s3c64xx.c    |  2 +-
 drivers/clk/samsung/clk-s5pv210.c    |  4 ++--
 drivers/clk/samsung/clk.c            |  3 +--
 drivers/clk/samsung/clk.h            |  2 +-
 12 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 22009cb53428..244f74f31746 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1276,7 +1276,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 							exynos4210_vpll_rates;
 
 		samsung_clk_register_pll(ctx, exynos4210_plls,
-					ARRAY_SIZE(exynos4210_plls), reg_base);
+					ARRAY_SIZE(exynos4210_plls));
 	} else {
 		if (clk_hw_get_rate(hws[CLK_FIN_PLL]) == 24000000) {
 			exynos4x12_plls[apll].rate_table =
@@ -1288,7 +1288,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 		}
 
 		samsung_clk_register_pll(ctx, exynos4x12_plls,
-					ARRAY_SIZE(exynos4x12_plls), reg_base);
+					ARRAY_SIZE(exynos4x12_plls));
 	}
 
 	samsung_clk_register_fixed_rate(ctx, exynos4_fixed_rate_clks,
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 113df773ee44..69862ab6dc52 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -815,8 +815,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		exynos5250_plls[vpll].rate_table =  vpll_24mhz_tbl;
 
 	samsung_clk_register_pll(ctx, exynos5250_plls,
-			ARRAY_SIZE(exynos5250_plls),
-			reg_base);
+			ARRAY_SIZE(exynos5250_plls));
 	samsung_clk_register_fixed_rate(ctx, exynos5250_fixed_rate_clks,
 			ARRAY_SIZE(exynos5250_fixed_rate_clks));
 	samsung_clk_register_fixed_factor(ctx, exynos5250_fixed_factor_clks,
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index caad74dee297..df9e93d6adf2 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1606,8 +1606,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 	else
 		exynos5x_plls[bpll].rate_table = exynos5422_bpll_rate_table;
 
-	samsung_clk_register_pll(ctx, exynos5x_plls, ARRAY_SIZE(exynos5x_plls),
-					reg_base);
+	samsung_clk_register_pll(ctx, exynos5x_plls, ARRAY_SIZE(exynos5x_plls));
 	samsung_clk_register_fixed_rate(ctx, exynos5x_fixed_rate_clks,
 			ARRAY_SIZE(exynos5x_fixed_rate_clks));
 	samsung_clk_register_fixed_factor(ctx, exynos5x_fixed_factor_clks,
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index f9daae20f393..eb72bf2aaee8 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5610,8 +5610,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	if (info->pll_clks)
-		samsung_clk_register_pll(ctx, info->pll_clks, info->nr_pll_clks,
-					 reg_base);
+		samsung_clk_register_pll(ctx, info->pll_clks,
+					 info->nr_pll_clks);
 	if (info->mux_clks)
 		samsung_clk_register_mux(ctx, info->mux_clks,
 					 info->nr_mux_clks);
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 0ff28938943f..96b2b15fafc3 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1422,8 +1422,7 @@ static const struct clk_ops samsung_pll2650xx_clk_min_ops = {
 };
 
 static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
-				const struct samsung_pll_clock *pll_clk,
-				void __iomem *base)
+				const struct samsung_pll_clock *pll_clk)
 {
 	struct samsung_clk_pll *pll;
 	struct clk_init_data init;
@@ -1576,8 +1575,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 
 	pll->hw.init = &init;
 	pll->type = pll_clk->type;
-	pll->lock_reg = base + pll_clk->lock_offset;
-	pll->con_reg = base + pll_clk->con_offset;
+	pll->lock_reg = ctx->reg_base + pll_clk->lock_offset;
+	pll->con_reg = ctx->reg_base + pll_clk->con_offset;
 
 	ret = clk_hw_register(ctx->dev, &pll->hw);
 	if (ret) {
@@ -1593,10 +1592,10 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 
 void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			const struct samsung_pll_clock *pll_list,
-			unsigned int nr_pll, void __iomem *base)
+			unsigned int nr_pll)
 {
 	int cnt;
 
 	for (cnt = 0; cnt < nr_pll; cnt++)
-		_samsung_clk_register_pll(ctx, &pll_list[cnt], base);
+		_samsung_clk_register_pll(ctx, &pll_list[cnt]);
 }
diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index 3d152a46169b..d72c79fa9b63 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -347,7 +347,7 @@ void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
 
 		/* Register PLLs. */
 		samsung_clk_register_pll(ctx, s3c2410_plls,
-				ARRAY_SIZE(s3c2410_plls), reg_base);
+				ARRAY_SIZE(s3c2410_plls));
 
 	} else { /* S3C2440, S3C2442 */
 		if (clk_hw_get_rate(hws[XTI]) == 12 * MHZ) {
@@ -363,7 +363,7 @@ void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
 
 		/* Register PLLs. */
 		samsung_clk_register_pll(ctx, s3c244x_common_plls,
-				ARRAY_SIZE(s3c244x_common_plls), reg_base);
+				ARRAY_SIZE(s3c244x_common_plls));
 	}
 
 	/* Register common internal clocks. */
diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
index 724ef642f048..367f3ecb68e8 100644
--- a/drivers/clk/samsung/clk-s3c2412.c
+++ b/drivers/clk/samsung/clk-s3c2412.c
@@ -223,8 +223,7 @@ void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
 		s3c2412_common_clk_register_fixed_ext(ctx, xti_f, ext_f);
 
 	/* Register PLLs. */
-	samsung_clk_register_pll(ctx, s3c2412_plls, ARRAY_SIZE(s3c2412_plls),
-				 reg_base);
+	samsung_clk_register_pll(ctx, s3c2412_plls, ARRAY_SIZE(s3c2412_plls));
 
 	/* Register common internal clocks. */
 	samsung_clk_register_mux(ctx, s3c2412_muxes, ARRAY_SIZE(s3c2412_muxes));
diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index a827d63766d1..bfcad2a24dbe 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -362,10 +362,10 @@ void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
 	/* Register PLLs. */
 	if (current_soc == S3C2416 || current_soc == S3C2450)
 		samsung_clk_register_pll(ctx, s3c2416_pll_clks,
-				ARRAY_SIZE(s3c2416_pll_clks), reg_base);
+				ARRAY_SIZE(s3c2416_pll_clks));
 	else
 		samsung_clk_register_pll(ctx, s3c2443_pll_clks,
-				ARRAY_SIZE(s3c2443_pll_clks), reg_base);
+				ARRAY_SIZE(s3c2443_pll_clks));
 
 	/* Register common internal clocks. */
 	samsung_clk_register_mux(ctx, s3c2443_common_muxes,
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index d6b432a26d63..d582bac68bb7 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -414,7 +414,7 @@ void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 
 	/* Register PLLs. */
 	samsung_clk_register_pll(ctx, s3c64xx_pll_clks,
-				ARRAY_SIZE(s3c64xx_pll_clks), reg_base);
+				ARRAY_SIZE(s3c64xx_pll_clks));
 
 	/* Register common internal clocks. */
 	samsung_clk_register_fixed_rate(ctx, s3c64xx_fixed_rate_clks,
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index 4425186bdcab..b91d20994bf5 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -753,7 +753,7 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 		samsung_clk_register_fixed_rate(ctx, s5p6442_frate_clks,
 			ARRAY_SIZE(s5p6442_frate_clks));
 		samsung_clk_register_pll(ctx, s5p6442_pll_clks,
-			ARRAY_SIZE(s5p6442_pll_clks), reg_base);
+			ARRAY_SIZE(s5p6442_pll_clks));
 		samsung_clk_register_mux(ctx, s5p6442_mux_clks,
 				ARRAY_SIZE(s5p6442_mux_clks));
 		samsung_clk_register_div(ctx, s5p6442_div_clks,
@@ -764,7 +764,7 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 		samsung_clk_register_fixed_rate(ctx, s5pv210_frate_clks,
 			ARRAY_SIZE(s5pv210_frate_clks));
 		samsung_clk_register_pll(ctx, s5pv210_pll_clks,
-			ARRAY_SIZE(s5pv210_pll_clks), reg_base);
+			ARRAY_SIZE(s5pv210_pll_clks));
 		samsung_clk_register_mux(ctx, s5pv210_mux_clks,
 				ARRAY_SIZE(s5pv210_mux_clks));
 		samsung_clk_register_div(ctx, s5pv210_div_clks,
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index bca4731b14ea..e132d63933c3 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -344,8 +344,7 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 	ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
 
 	if (cmu->pll_clks)
-		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks,
-			reg_base);
+		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
 	if (cmu->mux_clks)
 		samsung_clk_register_mux(ctx, cmu->mux_clks,
 			cmu->nr_mux_clks);
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b46e83a2581f..1b7315063edd 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -373,7 +373,7 @@ void samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 			unsigned int nr_clk);
 void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			const struct samsung_pll_clock *pll_list,
-			unsigned int nr_clk, void __iomem *base);
+			unsigned int nr_clk);
 void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
-- 
2.39.0

