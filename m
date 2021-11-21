Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D883BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 23:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhKUXbD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbhKUXbA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 18:31:00 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E7DC061758
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:53 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id y26so72019878lfa.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ASvzk7ohHyiTP3YMvvAST+eBDkFoGlnVX0ALjg78UAc=;
        b=SNK18cDfgnV/g2hvAq8DXWOiW6z5wss10k0z6+X4KtVMTsHxppPlFQPrB4m5rPHoMc
         puyBZt0Mu+1tOKVTAJf28wlSKfMB/re3wZsryRf4Kf/kyyKd8eV74RY4II8KVE9scbhF
         SA4Umlr3ynyheVernvW8XrU4eRL0p7POuV1t4LxUxtYeRJD0GdAPTk/OyrVd3p/RcwDS
         4GombRiX4dUu8zXjR6aUfKQQchz39qD1yN85R9WHzdboT/GgAaoYULpRqwcErdbwbh8O
         c9GpGwOp7+KCLBcokbFUtQPfffKL411LShZummAlfWYPUQi3KnwCSbFfpI2/OkEL6Tck
         LWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ASvzk7ohHyiTP3YMvvAST+eBDkFoGlnVX0ALjg78UAc=;
        b=RMml4pVMVewYUmQBjO/Q3VDeTqV9vvOVBuRo3sR3cemh7yfdt+37KNcMk2TpQYc142
         Gf4932rWGIWylCpbbks0BW6VUyHUmNWM3NhhZMgiHCKX48PW/xSBO5E1/mDeBdsmwQ4p
         YUnRuHefvuDe1kBrTWeY7aODn3hRpLWT+DYtemQhOjWp291YYdyd/OdFRuFcqnayOeFS
         D3NtAVpkJ14NtH6e2CP7cYKwzZTN2XOVeInOWROPrppwE8AX9F/txswllBa/HEHD1J8t
         WiaIlojbKWBmNJOs8EPxXAMVXRJOlf41jU78qgtG3Gl5UDH5cH37AJB4mvOwo0hfMXYe
         Ja/w==
X-Gm-Message-State: AOAM530nA/GNQl0Yy0jFX1DppEoMvRuKlLmLaetGcHqyJjlrqFHqt2wo
        7lnSi9Bi2+rSIvUT6vyEXszcUw==
X-Google-Smtp-Source: ABdhPJwtGR/mGT3UelM1AbYFFy9HrkIkg9VjocR5ySYmzAvkZVbdsD2rBubXI6grFTWAgbjb3xc0Lw==
X-Received: by 2002:a2e:9703:: with SMTP id r3mr46831569lji.422.1637537271615;
        Sun, 21 Nov 2021 15:27:51 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id v6sm888012lfa.170.2021.11.21.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 15:27:51 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 5/6] clk: samsung: exynos850: Register clocks early
Date:   Mon, 22 Nov 2021 01:27:40 +0200
Message-Id: <20211121232741.6967-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121232741.6967-1-semen.protsenko@linaro.org>
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some clocks must be registered before init calls. For example MCT clock
(from CMU_PERI) is needed for MCT timer driver, which is registered
with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
clk-exynos850 platform driver init, it's already too late. Inability to
get "mct" clock in MCT driver leads to kernel panic, as functions
registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
can't be fixed either, as it's acting as a clock source and it's
essential to register it in start_kernel() -> time_init().

Let's register CMU_PERI clocks early, using CLK_OF_DECLARE_DRIVER(), and
do all stuff relying on "struct dev" object (like runtime PM) later in
platform driver probe. Basically CLK_OF_DECLARE_DRIVER() matches CMU
compatible, but clears OF_POPULATED flag, which allows the same device
to be matched again later. CMU_TOP generates clocks needed for CMU_PERI,
but it's already registered early.

While at it, let's cleanup the code a bit, by extracting everything
related to CMU initialization and registration to the separate function.

Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
("clk: renesas: cpg-mssr: Add early clock support"), as well as in
drivers/clk/mediatek/clk-mt2712.c.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/samsung/clk-exynos850.c | 68 +++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 0eab7a115b44..1d257bca8b37 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -60,6 +60,43 @@ static void __init exynos850_init_clocks(struct device_node *np,
 	iounmap(reg_base);
 }
 
+/**
+ * exynos850_register_cmu - Register specified Exynos850 CMU domain
+ * @dev:	Device object; may be NULL if this function is not being
+ *		called from platform driver probe function
+ * @np:		CMU device tree node
+ * @cmu:	CMU data
+ *
+ * Register specified CMU domain, which includes next steps:
+ *
+ * 1. Enable parent clock of @cmu CMU
+ * 2. Set initial registers configuration for @cmu CMU clocks
+ * 3. Register @cmu CMU clocks using Samsung clock framework API
+ */
+static void __init exynos850_register_cmu(struct device *dev,
+		struct device_node *np, const struct samsung_cmu_info *cmu)
+{
+	/* Keep CMU parent clock running (needed for CMU registers access) */
+	if (cmu->clk_name) {
+		struct clk *parent_clk;
+
+		if (dev)
+			parent_clk = clk_get(dev, cmu->clk_name);
+		else
+			parent_clk = of_clk_get_by_name(np, cmu->clk_name);
+
+		if (IS_ERR(parent_clk)) {
+			pr_err("%s: could not find bus clock %s; err = %ld\n",
+			       __func__, cmu->clk_name, PTR_ERR(parent_clk));
+		} else {
+			clk_prepare_enable(parent_clk);
+		}
+	}
+
+	exynos850_init_clocks(np, cmu->clk_regs, cmu->nr_clk_regs);
+	samsung_cmu_register_one(np, cmu);
+}
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x120e0000) */
@@ -367,10 +404,10 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 
 static void __init exynos850_cmu_top_init(struct device_node *np)
 {
-	exynos850_init_clocks(np, top_clk_regs, ARRAY_SIZE(top_clk_regs));
-	samsung_cmu_register_one(np, &top_cmu_info);
+	exynos850_register_cmu(NULL, np, &top_cmu_info);
 }
 
+/* Register CMU_TOP early, as it's a dependency for other early domains */
 CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
 	       exynos850_cmu_top_init);
 
@@ -850,6 +887,15 @@ static const struct samsung_cmu_info peri_cmu_info __initconst = {
 	.clk_name		= "dout_peri_bus",
 };
 
+static void __init exynos850_cmu_peri_init(struct device_node *np)
+{
+	exynos850_register_cmu(NULL, np, &peri_cmu_info);
+}
+
+/* Register CMU_PERI early, as it's needed for MCT timer */
+CLK_OF_DECLARE_DRIVER(exynos850_cmu_peri, "samsung,exynos850-cmu-peri",
+		      exynos850_cmu_peri_init);
+
 /* ---- CMU_CORE ------------------------------------------------------------ */
 
 /* Register Offset definitions for CMU_CORE (0x12000000) */
@@ -1014,24 +1060,12 @@ static int __init exynos850_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 
 	info = of_device_get_match_data(dev);
-	exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
-	samsung_cmu_register_one(np, info);
 
-	/* Keep bus clock running, so it's possible to access CMU registers */
-	if (info->clk_name) {
-		struct clk *bus_clk;
-
-		bus_clk = clk_get(dev, info->clk_name);
-		if (IS_ERR(bus_clk)) {
-			pr_err("%s: could not find bus clock %s; err = %ld\n",
-			       __func__, info->clk_name, PTR_ERR(bus_clk));
-		} else {
-			clk_prepare_enable(bus_clk);
-		}
-	}
+	/* Early clocks are already registered using CLK_OF_DECLARE_DRIVER() */
+	if (info != &peri_cmu_info)
+		exynos850_register_cmu(dev, dev->of_node, info);
 
 	return 0;
 }
-- 
2.30.2

