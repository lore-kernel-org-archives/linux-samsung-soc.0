Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4A4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 19:05:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A92656105A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 19:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238331AbhJOTHr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 15:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238258AbhJOTHq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 15:07:46 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF47AC061570
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 12:05:39 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id i14-20020a63d44e000000b002955652e9deso5476490pgj.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 12:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=BIAqeiF1ipNOnkkfHeej3hsJmkUqtlrfrCGwYOFZF+Y=;
        b=PuHVKwDvCo4nEbJZGWPKYfAhs98frdZv0z3knUbUOFYvpzf+e35DN85meFmczFu7dY
         VhU9x2tc7pv/FOAPU1jQmqCIykpmeNx1x3bfpkxSbp1cM9YcEfcNVGKrp0CaIbg246Nb
         GMiyQsjbcWLuCTZCiefVSLiYBQqS2lx9qtlA0yvkHXI6+fBVCrExpwgyiZV9KAH7hUE4
         TMmvJVRIKykOAHtAIQGTSiWHW8YgRn8Mnd0QzeJvrNe6VDi9x8NBR9M39rx41ao84MhL
         7VrRnWx0Zrh8BU8pJKqIbJPiYBfbg9nJ7mmOfwL76L4+Y0NSzn7ToujgVe6t2lIH6hRE
         Y8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=BIAqeiF1ipNOnkkfHeej3hsJmkUqtlrfrCGwYOFZF+Y=;
        b=XN+URA7LjmKqn79w3fXmtTsBr0T++XZ/uinpMgrk23uErqSLkL7jNvd3h135UeUSuz
         +r64arkY7U+/FDBQLq1CoYsSYrhe246tCHsTEMkOq4ovN7Galld/GeU5h4nYDDuk+B5D
         QhhJWZ/8bEh/3GBK88i+9696dqLddqxi11gPzQQWCg9qoxQNDLlLJdhJZawEAQ/NgS0i
         cR9qeTtaVkAvxNaM8gEvPxjr6e6wL1/1C2m+maImAorxDIwVTi832SwIQ+EFMWojTPNg
         jnRjZaVN5YUvkkTbwNg+euKr+ufcOtTBv5lp6RYHMc7+zWsrhxRVcXOpTui0hvPrXfmN
         LoUg==
X-Gm-Message-State: AOAM531LVEXjV5HYWNepl54GvJKupKFC7J09zUTrcWhvFFpDEHmUrhYj
        n/JpMZ3JOqH+T59EDsR7FssQVzOFy58ykb+Hvls=
X-Google-Smtp-Source: ABdhPJzZAMFUPfNrg3/zBN2hd5wgMc+uFIgzQP5FmJu2NR8X0XaTZfkCKsbrZBt8sBVRRR7Q2KLUg4a7qpbofhFkqQc=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a62:1d46:0:b0:44d:1a4d:5d03 with SMTP
 id d67-20020a621d46000000b0044d1a4d5d03mr13459685pfd.55.1634324739335; Fri,
 15 Oct 2021 12:05:39 -0700 (PDT)
Date:   Fri, 15 Oct 2021 19:05:14 +0000
Message-Id: <20211015190515.3760577-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v1] clk: samsung: update CPU clk registration
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

Convert the remaining exynos clock drivers to use
samsung_clk_register_cpu() or if possible use
samsung_cmu_register_one(). With this we can now make
exynos_register_cpu_clock() a static function so that future CPU clock
registration changes will use the samsung common clock driver.

The main benefit of this change is that it standardizes the CPU clock
registration for the samsung clock drivers.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk-cpu.c        |  2 +-
 drivers/clk/samsung/clk-cpu.h        |  7 ----
 drivers/clk/samsung/clk-exynos3250.c | 54 ++++++++++++++--------------
 drivers/clk/samsung/clk-exynos4.c    | 25 +++++++------
 drivers/clk/samsung/clk-exynos5250.c | 13 +++----
 drivers/clk/samsung/clk-exynos5420.c | 27 +++++++++-----
 6 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 7f20d9aedaa9..3e62ade120c5 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -400,7 +400,7 @@ static int exynos5433_cpuclk_notifier_cb(struct notifier_block *nb,
 }
 
 /* helper function to register a CPU clock */
-int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
+static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		unsigned int lookup_id, const char *name,
 		const struct clk_hw *parent, const struct clk_hw *alt_parent,
 		unsigned long offset, const struct exynos_cpuclk_cfg_data *cfg,
diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index af74686db9ef..fc9f67a3b22e 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -62,11 +62,4 @@ struct exynos_cpuclk {
 #define CLK_CPU_HAS_E5433_REGS_LAYOUT	(1 << 2)
 };
 
-int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
-			unsigned int lookup_id, const char *name,
-			const struct clk_hw *parent, const struct clk_hw *alt_parent,
-			unsigned long offset,
-			const struct exynos_cpuclk_cfg_data *cfg,
-			unsigned long num_cfgs, unsigned long flags);
-
 #endif /* __SAMSUNG_CLK_CPU_H */
diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 17df7f9755aa..6cc65ccf867c 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -748,6 +748,31 @@ static const struct samsung_pll_clock exynos3250_plls[] __initconst = {
 			UPLL_LOCK, UPLL_CON0, exynos3250_pll_rates),
 };
 
+#define E3250_CPU_DIV0(apll, pclk_dbg, atb, corem)			\
+		(((apll) << 24) | ((pclk_dbg) << 20) | ((atb) << 16) |	\
+		((corem) << 4))
+#define E3250_CPU_DIV1(hpm, copy)					\
+		(((hpm) << 4) | ((copy) << 0))
+
+static const struct exynos_cpuclk_cfg_data e3250_armclk_d[] __initconst = {
+	{ 1000000, E3250_CPU_DIV0(1, 7, 4, 1), E3250_CPU_DIV1(7, 7), },
+	{  900000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  800000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  700000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  600000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  500000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  400000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  300000, E3250_CPU_DIV0(1, 5, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  200000, E3250_CPU_DIV0(1, 3, 3, 1), E3250_CPU_DIV1(7, 7), },
+	{  100000, E3250_CPU_DIV0(1, 1, 1, 1), E3250_CPU_DIV1(7, 7), },
+	{  0 },
+};
+
+static const struct samsung_cpu_clock exynos3250_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
+			CLK_CPU_HAS_DIV1, 0x14200, e3250_armclk_d),
+};
+
 static void __init exynos3_core_down_clock(void __iomem *reg_base)
 {
 	unsigned int tmp;
@@ -780,46 +805,21 @@ static const struct samsung_cmu_info cmu_info __initconst = {
 	.nr_gate_clks		= ARRAY_SIZE(gate_clks),
 	.fixed_factor_clks	= fixed_factor_clks,
 	.nr_fixed_factor_clks	= ARRAY_SIZE(fixed_factor_clks),
+	.cpu_clks		= exynos3250_cpu_clks,
+	.nr_cpu_clks		= ARRAY_SIZE(exynos3250_cpu_clks),
 	.nr_clk_ids		= CLK_NR_CLKS,
 	.clk_regs		= exynos3250_cmu_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(exynos3250_cmu_clk_regs),
 };
 
-#define E3250_CPU_DIV0(apll, pclk_dbg, atb, corem)			\
-		(((apll) << 24) | ((pclk_dbg) << 20) | ((atb) << 16) |	\
-		((corem) << 4))
-#define E3250_CPU_DIV1(hpm, copy)					\
-		(((hpm) << 4) | ((copy) << 0))
-
-static const struct exynos_cpuclk_cfg_data e3250_armclk_d[] __initconst = {
-	{ 1000000, E3250_CPU_DIV0(1, 7, 4, 1), E3250_CPU_DIV1(7, 7), },
-	{  900000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  800000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  700000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  600000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  500000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  400000, E3250_CPU_DIV0(1, 7, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  300000, E3250_CPU_DIV0(1, 5, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  200000, E3250_CPU_DIV0(1, 3, 3, 1), E3250_CPU_DIV1(7, 7), },
-	{  100000, E3250_CPU_DIV0(1, 1, 1, 1), E3250_CPU_DIV1(7, 7), },
-	{  0 },
-};
-
 static void __init exynos3250_cmu_init(struct device_node *np)
 {
 	struct samsung_clk_provider *ctx;
-	struct clk_hw **hws;
 
 	ctx = samsung_cmu_register_one(np, &cmu_info);
 	if (!ctx)
 		return;
 
-	hws = ctx->clk_data.hws;
-	exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-			hws[CLK_MOUT_APLL], hws[CLK_MOUT_MPLL_USER_C],
-			0x14200, e3250_armclk_d, ARRAY_SIZE(e3250_armclk_d),
-			CLK_CPU_HAS_DIV1);
-
 	exynos3_core_down_clock(ctx->reg_base);
 }
 CLK_OF_DECLARE(exynos3250_cmu, "samsung,exynos3250-cmu", exynos3250_cmu_init);
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index bf13e29a655c..9e98d59eb716 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1228,12 +1228,21 @@ static const struct exynos_cpuclk_cfg_data e4412_armclk_d[] __initconst = {
 	{  0 },
 };
 
+static const struct samsung_cpu_clock exynos4210_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_SCLK_MPLL,
+			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4210_armclk_d),
+};
+
+static const struct samsung_cpu_clock exynos4412_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL_USER_C,
+			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1, 0x14200, e4412_armclk_d),
+};
+
 /* register exynos4 clocks */
 static void __init exynos4_clk_init(struct device_node *np,
 				    enum exynos4_soc soc)
 {
 	struct samsung_clk_provider *ctx;
-	struct clk_hw **hws;
 
 	exynos4_soc = soc;
 
@@ -1242,7 +1251,6 @@ static void __init exynos4_clk_init(struct device_node *np,
 		panic("%s: failed to map registers\n", __func__);
 
 	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
-	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos4_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos4_fixed_rate_ext_clks),
@@ -1304,10 +1312,8 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_register_fixed_factor(ctx,
 			exynos4210_fixed_factor_clks,
 			ARRAY_SIZE(exynos4210_fixed_factor_clks));
-		exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-			hws[CLK_MOUT_APLL], hws[CLK_SCLK_MPLL], 0x14200,
-			e4210_armclk_d, ARRAY_SIZE(e4210_armclk_d),
-			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
+		samsung_clk_register_cpu(ctx, exynos4210_cpu_clks,
+				ARRAY_SIZE(exynos4210_cpu_clks));
 	} else {
 		samsung_clk_register_mux(ctx, exynos4x12_mux_clks,
 			ARRAY_SIZE(exynos4x12_mux_clks));
@@ -1318,11 +1324,8 @@ static void __init exynos4_clk_init(struct device_node *np,
 		samsung_clk_register_fixed_factor(ctx,
 			exynos4x12_fixed_factor_clks,
 			ARRAY_SIZE(exynos4x12_fixed_factor_clks));
-
-		exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-			hws[CLK_MOUT_APLL], hws[CLK_MOUT_MPLL_USER_C], 0x14200,
-			e4412_armclk_d, ARRAY_SIZE(e4412_armclk_d),
-			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
+		samsung_clk_register_cpu(ctx, exynos4412_cpu_clks,
+				ARRAY_SIZE(exynos4412_cpu_clks));
 	}
 
 	if (soc == EXYNOS4X12)
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 06588fab408a..0baf28312231 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -772,6 +772,11 @@ static const struct exynos_cpuclk_cfg_data exynos5250_armclk_d[] __initconst = {
 	{  0 },
 };
 
+static const struct samsung_cpu_clock exynos5250_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MPLL, CLK_CPU_HAS_DIV1, 0x200,
+			exynos5250_armclk_d),
+};
+
 static const struct of_device_id ext_clk_match[] __initconst = {
 	{ .compatible = "samsung,clock-xxti", .data = (void *)0, },
 	{ },
@@ -782,7 +787,6 @@ static void __init exynos5250_clk_init(struct device_node *np)
 {
 	struct samsung_clk_provider *ctx;
 	unsigned int tmp;
-	struct clk_hw **hws;
 
 	if (np) {
 		reg_base = of_iomap(np, 0);
@@ -793,7 +797,6 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	}
 
 	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
-	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5250_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos5250_fixed_rate_ext_clks),
@@ -822,10 +825,8 @@ static void __init exynos5250_clk_init(struct device_node *np)
 			ARRAY_SIZE(exynos5250_div_clks));
 	samsung_clk_register_gate(ctx, exynos5250_gate_clks,
 			ARRAY_SIZE(exynos5250_gate_clks));
-	exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-			hws[CLK_MOUT_APLL], hws[CLK_MOUT_MPLL], 0x200,
-			exynos5250_armclk_d, ARRAY_SIZE(exynos5250_armclk_d),
-			CLK_CPU_HAS_DIV1);
+	samsung_clk_register_cpu(ctx, exynos5250_cpu_clks,
+			ARRAY_SIZE(exynos5250_cpu_clks));
 
 	/*
 	 * Enable arm clock down (in idle) and set arm divider
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 3ccd4eabd2a6..83607b384665 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1551,6 +1551,20 @@ static const struct exynos_cpuclk_cfg_data exynos5420_kfcclk_d[] __initconst = {
 	{  0 },
 };
 
+static const struct samsung_cpu_clock exynos5420_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0, 0x200,
+			exynos5420_eglclk_d),
+	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0, 0x28200,
+			exynos5420_kfcclk_d),
+};
+
+static const struct samsung_cpu_clock exynos5800_cpu_clks[] __initconst = {
+	CPU_CLK(CLK_ARM_CLK, "armclk", CLK_MOUT_APLL, CLK_MOUT_MSPLL_CPU, 0, 0x200,
+			exynos5800_eglclk_d),
+	CPU_CLK(CLK_KFC_CLK, "kfcclk", CLK_MOUT_KPLL, CLK_MOUT_MSPLL_KFC, 0, 0x28200,
+			exynos5420_kfcclk_d),
+};
+
 static const struct of_device_id ext_clk_match[] __initconst = {
 	{ .compatible = "samsung,exynos5420-oscclk", .data = (void *)0, },
 	{ },
@@ -1625,17 +1639,12 @@ static void __init exynos5x_clk_init(struct device_node *np,
 	}
 
 	if (soc == EXYNOS5420) {
-		exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-			hws[CLK_MOUT_APLL], hws[CLK_MOUT_MSPLL_CPU], 0x200,
-			exynos5420_eglclk_d, ARRAY_SIZE(exynos5420_eglclk_d), 0);
+		samsung_clk_register_cpu(ctx, exynos5420_cpu_clks,
+				ARRAY_SIZE(exynos5420_cpu_clks));
 	} else {
-		exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
-			hws[CLK_MOUT_APLL], hws[CLK_MOUT_MSPLL_CPU], 0x200,
-			exynos5800_eglclk_d, ARRAY_SIZE(exynos5800_eglclk_d), 0);
+		samsung_clk_register_cpu(ctx, exynos5800_cpu_clks,
+				ARRAY_SIZE(exynos5800_cpu_clks));
 	}
-	exynos_register_cpu_clock(ctx, CLK_KFC_CLK, "kfcclk",
-		hws[CLK_MOUT_KPLL], hws[CLK_MOUT_MSPLL_KFC],  0x28200,
-		exynos5420_kfcclk_d, ARRAY_SIZE(exynos5420_kfcclk_d), 0);
 
 	samsung_clk_extended_sleep_init(reg_base,
 		exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
-- 
2.33.0.1079.g6e70778dc9-goog

