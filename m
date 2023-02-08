Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853F6C64EC5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 23:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjBHXnD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 18:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjBHXnC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 18:43:02 -0500
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFE11C337
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 15:42:57 -0800 (PST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-16a291b16bfso558831fac.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Feb 2023 15:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6pc/fxZMqv/Ba/3boRFvyXeTwbRFVS36kkuAwIqnb0=;
        b=ms6fYZYwIzi415PDWqcer3XQBcB+0FiHQLuo9/eIrAzIyPlQToKSy3Bl2WEOggky1w
         XBDS+yBayYWaTOe+owm+t6AbQaiZAeIEv0TOfLU3ubbCMk+UAAkK6LkeR5Kn7ee/xNeP
         NGvIP/BSLths9V/mIHiThoIDtiAoAmRd1/hsUJKOTrUKwy1PSuUGv4wSWENfJPUeo4bl
         4Epl1BOp4CnG9hKFWNvcDpucSKnk1CMNXXnmY4WfBtjs7F1fnKuDiSox5FauogLDuPUz
         mhpSj8n7yF/ocqUtuhPT+1U4vJyLQ2GmEW7/VEwI/dCYupiPDRWrTk2QETcpn5imorOs
         4CuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6pc/fxZMqv/Ba/3boRFvyXeTwbRFVS36kkuAwIqnb0=;
        b=6ITGy7yKVsyNLLT5RcsWcJ5PKg1TR0N/7DGerF6IYWGb0ksyamFXaqechdyVKi6vOy
         tCxxrXLQTK98cb9zIg2B6WcJqyjbFTpLmYKI3u3hgStb4zqCgsPNJT1VM0d00EhxEy0O
         gosTlv/9Zr4jdpQlGDWeocstO/naLMl4X6jYJrvTRY/4ofe4AQbpiGd0GDi7V2H8KL3O
         w5yUx1KOWvj6kiLyNnlLA3k0xSHwNyyr3jOsBWXWKESWX/X/bdLbZe5+tR/82JBeqQqd
         IEdaecam0k0jzxpgHXALZdrOZ1m/E2ZSz81jP/xCJRPcKGn5LEj8t/Kktq8jOLw8InTq
         68zQ==
X-Gm-Message-State: AO0yUKVgTf6oKcdXKVqFtPRX2QK1pKv793V1e1Quy//vGlci6L5IjHmR
        vGdzgblYawCAH16y1PJw4LJqnw==
X-Google-Smtp-Source: AK7set96GA4LKo/5gp5MfM+JfCqQgefR3/bB/21FB4FKPhxgFkCKrYJjeGox3xF34bejHSuty3OynA==
X-Received: by 2002:a05:6870:6591:b0:169:decf:6ce3 with SMTP id fp17-20020a056870659100b00169decf6ce3mr5245087oab.14.1675899776178;
        Wed, 08 Feb 2023 15:42:56 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id c20-20020a4a4f14000000b0051a4b0ab2d0sm8018135oob.28.2023.02.08.15.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:42:55 -0800 (PST)
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
Subject: [PATCH v2 1/6] clk: samsung: Don't pass reg_base to samsung_clk_register_pll()
Date:   Wed,  8 Feb 2023 17:43:08 -0600
Message-Id: <20230208234313.23863-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208234313.23863-1-semen.protsenko@linaro.org>
References: <20230208234313.23863-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Base address can be derived from context structure. Remove `base'
argument from samsung_clk_register_pll() and use `ctx->reg_base'
instead, as it's done in other clock registering functions.

No functional change.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on top of latest soc/for-next tree

 drivers/clk/samsung/clk-exynos4.c    |  4 ++--
 drivers/clk/samsung/clk-exynos5250.c |  3 +--
 drivers/clk/samsung/clk-exynos5420.c |  3 +--
 drivers/clk/samsung/clk-exynos5433.c |  4 ++--
 drivers/clk/samsung/clk-pll.c        | 11 +++++------
 drivers/clk/samsung/clk-s3c64xx.c    |  2 +-
 drivers/clk/samsung/clk-s5pv210.c    |  4 ++--
 drivers/clk/samsung/clk.c            |  3 +--
 drivers/clk/samsung/clk.h            |  2 +-
 9 files changed, 16 insertions(+), 20 deletions(-)

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
index df7812371d70..5ceac4c25c1c 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1259,8 +1259,7 @@ static const struct clk_ops samsung_pll2650xx_clk_min_ops = {
 };
 
 static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
-				const struct samsung_pll_clock *pll_clk,
-				void __iomem *base)
+				const struct samsung_pll_clock *pll_clk)
 {
 	struct samsung_clk_pll *pll;
 	struct clk_init_data init;
@@ -1395,8 +1394,8 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 
 	pll->hw.init = &init;
 	pll->type = pll_clk->type;
-	pll->lock_reg = base + pll_clk->lock_offset;
-	pll->con_reg = base + pll_clk->con_offset;
+	pll->lock_reg = ctx->reg_base + pll_clk->lock_offset;
+	pll->con_reg = ctx->reg_base + pll_clk->con_offset;
 
 	ret = clk_hw_register(ctx->dev, &pll->hw);
 	if (ret) {
@@ -1412,10 +1411,10 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 
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
2.39.1

