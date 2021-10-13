Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B26C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 22:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEE90611BD
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 22:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhJMWMf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Oct 2021 18:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbhJMWMf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 18:12:35 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B46C061570
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 15:10:31 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id t4-20020a62ea04000000b0044b333f5d1bso2315179pfh.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=wqNELjpmtlGEH41rLEk9ERkQkG/0kIH/3vHQh1QjL18=;
        b=shMjCyt21hCl3oG5ov9YV/koHCJMWMBpeRKIZiTz/TdlcaUZY4c5029DWcjOLBg55v
         pP/p3ziQunijS7XGR4kOYNbDzOR6MtUq/BOKmmgTSddZKHNI0pM513UrfHdw8LpaxyAl
         SIci4bHoNukoPscZnCMqpCstVAqQYHRiXBzxZahL991idYJeK0uCtq1IywfOAIE8AtVr
         VCCKjdgwleV+Hu4O1F018Lc8VAqXJHmRKiuMmfA3yU1GIIiSYK8cKqfp7neNULCIjHiz
         eArEfyh63J19/YrLexQIp4Uj2WlfTGHVcRz5R/C+noXT3JLTUEMpTr+H0fBM1ncPlnWa
         QhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wqNELjpmtlGEH41rLEk9ERkQkG/0kIH/3vHQh1QjL18=;
        b=LTzafX11CqNFSgzLKTP/3RbHIqRoPXpYTcdmqUdSs+rE4lpCe7QjIRymV8/cwQtV2F
         uTVp9ZgUhXBRNZCIkbVqJwFeWlJqLwYI66nLWlZc7EoLxtfbx72qjBrhvTWLECTje7Wk
         Cm5I48eINa9LxAlVwpwfZRy35Ab1/f7ou7f5w3K3D/bznQVfEoRyYEeUoUh6iz59hAIV
         usDTJxiB1nqs46Q+Rj6apUNC0xYqXBKU327Ybv71RLZ1HgPb76AOSWkPZ12TPDgeKa9x
         /l5LyVYxPkVJP7DXaGQb1MIbbcSGgPGPIkAYZkhy6pRUWHCapKiJUHytkocdIaPukqOJ
         EcvA==
X-Gm-Message-State: AOAM531eHwPWNSa8rfaEtcD3oibQYwNM+e1AeXLA3CSzx70vmKBCOxHU
        FmxsoibS3tbhzTe81ltrCiJKlZzQFmcn+b4s6lU=
X-Google-Smtp-Source: ABdhPJwSHq7t4EDLLAtv4RUzmCWL7n/SHCwJF1dRQXyJ3LKA9du+tmSUO665Mf74ZPLjq2ZJLDufZJT9YVDHODWdxaA=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:8b81:b0:13f:3d30:f624 with
 SMTP id ay1-20020a1709028b8100b0013f3d30f624mr1635638plb.51.1634163031149;
 Wed, 13 Oct 2021 15:10:31 -0700 (PDT)
Date:   Wed, 13 Oct 2021 22:10:20 +0000
In-Reply-To: <20211013221021.3433704-1-willmcvicker@google.com>
Message-Id: <20211013221021.3433704-3-willmcvicker@google.com>
Mime-Version: 1.0
References: <20211013221021.3433704-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v3 2/2] [RFT] clk: samsung: exynos5433: update apollo and
 atlas clock probing
From:   Will McVicker <willmcvicker@google.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the samsung common clk driver to initialize and probe the apollo and
atlas clocks. This removes their custom init functions and uses the
samsung_cmu_register_one() instead.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
 1 file changed, 48 insertions(+), 72 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index f203074d858b..0ef809c9e2da 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3675,44 +3675,32 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
 	{  0 },
 };
 
+static const struct samsung_cpu_clock apollo_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_SCLK_APOLLO, "apolloclk", "mout_apollo_pll",
+			"mout_bus_pll_apollo_user",
+			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
+			exynos5433_apolloclk_d),
+};
+
+static const struct samsung_cmu_info apollo_cmu_info __initconst = {
+	.pll_clks	= apollo_pll_clks,
+	.nr_pll_clks	= ARRAY_SIZE(apollo_pll_clks),
+	.mux_clks	= apollo_mux_clks,
+	.nr_mux_clks	= ARRAY_SIZE(apollo_mux_clks),
+	.div_clks	= apollo_div_clks,
+	.nr_div_clks	= ARRAY_SIZE(apollo_div_clks),
+	.gate_clks	= apollo_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(apollo_gate_clks),
+	.cpu_clks	= apollo_cpu_clks,
+	.nr_cpu_clks	= ARRAY_SIZE(apollo_cpu_clks),
+	.nr_clk_ids	= APOLLO_NR_CLK,
+	.clk_regs	= apollo_clk_regs,
+	.nr_clk_regs	= ARRAY_SIZE(apollo_clk_regs),
+};
+
 static void __init exynos5433_cmu_apollo_init(struct device_node *np)
 {
-	void __iomem *reg_base;
-	struct samsung_clk_provider *ctx;
-	struct clk_hw **hws;
-
-	reg_base = of_iomap(np, 0);
-	if (!reg_base) {
-		panic("%s: failed to map registers\n", __func__);
-		return;
-	}
-
-	ctx = samsung_clk_init(np, reg_base, APOLLO_NR_CLK);
-	if (!ctx) {
-		panic("%s: unable to allocate ctx\n", __func__);
-		return;
-	}
-
-	samsung_clk_register_pll(ctx, apollo_pll_clks,
-				 ARRAY_SIZE(apollo_pll_clks), reg_base);
-	samsung_clk_register_mux(ctx, apollo_mux_clks,
-				 ARRAY_SIZE(apollo_mux_clks));
-	samsung_clk_register_div(ctx, apollo_div_clks,
-				 ARRAY_SIZE(apollo_div_clks));
-	samsung_clk_register_gate(ctx, apollo_gate_clks,
-				  ARRAY_SIZE(apollo_gate_clks));
-
-	hws = ctx->clk_data.hws;
-
-	exynos_register_cpu_clock(ctx, CLK_SCLK_APOLLO, "apolloclk",
-		hws[CLK_MOUT_APOLLO_PLL], hws[CLK_MOUT_BUS_PLL_APOLLO_USER], 0x200,
-		exynos5433_apolloclk_d, ARRAY_SIZE(exynos5433_apolloclk_d),
-		CLK_CPU_HAS_E5433_REGS_LAYOUT);
-
-	samsung_clk_sleep_init(reg_base, apollo_clk_regs,
-			       ARRAY_SIZE(apollo_clk_regs));
-
-	samsung_clk_of_add_provider(np, ctx);
+	samsung_cmu_register_one(np, &apollo_cmu_info);
 }
 CLK_OF_DECLARE(exynos5433_cmu_apollo, "samsung,exynos5433-cmu-apollo",
 		exynos5433_cmu_apollo_init);
@@ -3932,44 +3920,32 @@ static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] __initconst =
 	{  0 },
 };
 
-static void __init exynos5433_cmu_atlas_init(struct device_node *np)
-{
-	void __iomem *reg_base;
-	struct samsung_clk_provider *ctx;
-	struct clk_hw **hws;
-
-	reg_base = of_iomap(np, 0);
-	if (!reg_base) {
-		panic("%s: failed to map registers\n", __func__);
-		return;
-	}
-
-	ctx = samsung_clk_init(np, reg_base, ATLAS_NR_CLK);
-	if (!ctx) {
-		panic("%s: unable to allocate ctx\n", __func__);
-		return;
-	}
-
-	samsung_clk_register_pll(ctx, atlas_pll_clks,
-				 ARRAY_SIZE(atlas_pll_clks), reg_base);
-	samsung_clk_register_mux(ctx, atlas_mux_clks,
-				 ARRAY_SIZE(atlas_mux_clks));
-	samsung_clk_register_div(ctx, atlas_div_clks,
-				 ARRAY_SIZE(atlas_div_clks));
-	samsung_clk_register_gate(ctx, atlas_gate_clks,
-				  ARRAY_SIZE(atlas_gate_clks));
-
-	hws = ctx->clk_data.hws;
-
-	exynos_register_cpu_clock(ctx, CLK_SCLK_ATLAS, "atlasclk",
-		hws[CLK_MOUT_ATLAS_PLL], hws[CLK_MOUT_BUS_PLL_ATLAS_USER], 0x200,
-		exynos5433_atlasclk_d, ARRAY_SIZE(exynos5433_atlasclk_d),
-		CLK_CPU_HAS_E5433_REGS_LAYOUT);
+static const struct samsung_cpu_clock atlas_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_SCLK_ATLAS, "atlasclk", "mout_atlas_pll",
+			"mout_bus_pll_atlas_user",
+			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
+			exynos5433_atlasclk_d),
+};
 
-	samsung_clk_sleep_init(reg_base, atlas_clk_regs,
-			       ARRAY_SIZE(atlas_clk_regs));
+static const struct samsung_cmu_info atlas_cmu_info __initconst = {
+	.pll_clks	= atlas_pll_clks,
+	.nr_pll_clks	= ARRAY_SIZE(atlas_pll_clks),
+	.mux_clks	= atlas_mux_clks,
+	.nr_mux_clks	= ARRAY_SIZE(atlas_mux_clks),
+	.div_clks	= atlas_div_clks,
+	.nr_div_clks	= ARRAY_SIZE(atlas_div_clks),
+	.gate_clks	= atlas_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(atlas_gate_clks),
+	.cpu_clks	= atlas_cpu_clks,
+	.nr_cpu_clks	= ARRAY_SIZE(atlas_cpu_clks),
+	.nr_clk_ids	= ATLAS_NR_CLK,
+	.clk_regs	= atlas_clk_regs,
+	.nr_clk_regs	= ARRAY_SIZE(atlas_clk_regs),
+};
 
-	samsung_clk_of_add_provider(np, ctx);
+static void __init exynos5433_cmu_atlas_init(struct device_node *np)
+{
+	samsung_cmu_register_one(np, &atlas_cmu_info);
 }
 CLK_OF_DECLARE(exynos5433_cmu_atlas, "samsung,exynos5433-cmu-atlas",
 		exynos5433_cmu_atlas_init);
-- 
2.33.0.882.g93a45727a2-goog

