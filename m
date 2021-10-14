Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AE1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 19:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D045610CB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 19:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbhJNT4E (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 15:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbhJNT4C (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 15:56:02 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAF6C061755
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 12:53:57 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id b126-20020a251b84000000b005bd8aca71a2so8396858ybb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 12:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Xk5m1OUs6xlROZitxzzbxSrboaAxE9/sb0cRd/f+MaE=;
        b=MH2Bhw5wDuqvJG/xAW91wzpwzRN9P8Xq8/oHrwChuOSzJyf68asYaGvei13gIfcNJq
         Zm44+DLM6X3jYZdouVap5gBtaUVWy8YRLjkYXAT20WqfBfYKjnJV4sCRLvBAkMveFtB6
         CuMeYt8R8Pm2czjuGPkYPBilLPyucFZ0pHqr04ytHnxLNiuZZY1wIiTzLcG/O4NmOGna
         tui749eENoIjI6Yz3rSxVcvLoaby8SirlsXxknBu3IN0smGKTCrzelg+JDD8OF7fky+f
         I5GPhflaffLhzuSOCpnFEny6l7WNGr4ueLnLf7FCnvcqKODMjUSa5S132UZSwXxHGNdu
         JDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Xk5m1OUs6xlROZitxzzbxSrboaAxE9/sb0cRd/f+MaE=;
        b=40hSQ9FQ8lrWLAdUoMbTaiWLM01lue5cD++oE/y7undBhyIPcKKx8PbUWY+LzJRTvA
         qrfqGX8WTQe+SPZRAola9kGTGFnmUKBz0U5H9DikcIpzhB7vMjKPHB8F7qt5ViqYADFD
         bgN5WwBNns+DBITnWUveq1oC6hQXlEIq6zWwS2zLfbX/9xJPpRwVGJ0Wko97MpXjpmHe
         nTLeO5aVTAtr1atdndh+g28/Q+7F5axnzz81qFFRsvtwHVRxp5aX0zK2PIy1CcqXKbdN
         35w8b12bQ8Svoms0jp56XH7jl7duDIcw0CV+QADliqSxX4mkUzpwid2jsrLIitHajcec
         1eog==
X-Gm-Message-State: AOAM531DDbx+ixRHDDz+eb56MiozCdSvYVmfpBPh73N4GGDcTkqnveyC
        ONmQ2f4nUQzkKsJdX7nbJQuYddHcOG28jtPSxiY=
X-Google-Smtp-Source: ABdhPJxavHkakE5twP+rtyxgB0cOzsP+Ljmncg2Ckz251sx6NNc2BAf6PROhf0MOSFMrJcCQh5KhldyI4pe2UtpYFLk=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a5b:385:: with SMTP id
 k5mr8514820ybp.65.1634241236696; Thu, 14 Oct 2021 12:53:56 -0700 (PDT)
Date:   Thu, 14 Oct 2021 19:53:46 +0000
In-Reply-To: <20211014195347.3635601-1-willmcvicker@google.com>
Message-Id: <20211014195347.3635601-3-willmcvicker@google.com>
Mime-Version: 1.0
References: <20211014195347.3635601-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v4 2/2] [RFT] clk: samsung: exynos5433: update apollo and
 atlas clock probing
From:   Will McVicker <willmcvicker@google.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Will McVicker <willmcvicker@google.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the samsung common clk driver to initialize the apollo and atlas
clocks. This removes their custom init functions and uses the
samsung_cmu_register_one() instead.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
 1 file changed, 48 insertions(+), 72 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index f203074d858b..cec66d2a4ee2 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3675,44 +3675,32 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
 	{  0 },
 };
 
+static const struct samsung_cpu_clock apollo_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_SCLK_APOLLO, "apolloclk", CLK_MOUT_APOLLO_PLL,
+			CLK_MOUT_BUS_PLL_APOLLO_USER,
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
+	CPU_CLK(CLK_SCLK_ATLAS, "atlasclk", CLK_MOUT_ATLAS_PLL,
+			CLK_MOUT_BUS_PLL_ATLAS_USER,
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
2.33.0.1079.g6e70778dc9-goog

