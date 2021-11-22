Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D24C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 14:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239768AbhKVOpR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 09:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbhKVOpQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 09:45:16 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE61AC061574
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 06:42:09 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f18so82002211lfv.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 06:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY9o9Qw6OAmM2h7GF5DXcC1VsO28vOcpSP4iXZPByYc=;
        b=UHDbtxGzA/5hiFwXBixij0WHcZACiUNY6U5OUIqC4pMhb/7nls3bOLzuU9mPEAQ7h/
         iV6nS/1dxSQSdCk1k9VNfjLBjJnAJ4dFpmMcBVlzybOuJqOZPXdQ8HKbILGAtAPCv+oU
         khBui81vf01KJaujHuCNxJ679lrQJ3bzRq3uxOjimkOIt6t+rFc+BjmGN+X5Avkg3JxD
         yodg2ybtR2ixMT2O+OdCuWsnDhM4phmWc5cDVhskI5HRFAWe4pjIBUTU5IorGkXY8ZMp
         sh5qyVjwD70a+DOcNGb0m9ek3IeXUPEFHu9nS2QtFZkTIv+3SF08AFXm8rgZou6T4EBu
         Pr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY9o9Qw6OAmM2h7GF5DXcC1VsO28vOcpSP4iXZPByYc=;
        b=ItIq27uKezl7g4MiNLJINzJ67YoNcTTMGiIsRg72kfZRngGtPvvxZK4T8vDXj3yA7W
         XONNb1CnOXjGnzaAheERgqUuD7M2ks6UfIH2FKpcVVuSPAzsG8b+LyYeCCzlHXUBIqfp
         wudHiNt8RBCFmFjo/jUwG3m1d2QJkxN6JUQiUDQca73XILrp1UoIO3oqcPdhs4Ec1LmI
         tQrgpRZIj4yg5VVOiGk3etEgnzBXUGbz6pc9uH2Bd8PvIGAZDB/tlq1Z6kN1L1AEOdbi
         JoPf3VSC0Gbbjdf1Jea1+KLwUzAJjD+nV3U/E56R8yS4nvvNZga+OraSHV+23QB7cRdG
         FM0w==
X-Gm-Message-State: AOAM530V2Kt+Dfk7IvcNMF6dcav/jgPlMOo6U/kYKiYjTR2GgrBWklOZ
        nrQRf3ZANnLTYRi2lGyZJ0O1rA==
X-Google-Smtp-Source: ABdhPJxMdHB47e9WyBvRhkaCVvTJFHk1GZPxZIy4C6Igcqz3WurfOJOB7T0ZdbmuMdgykSdyQR7Pbg==
X-Received: by 2002:a2e:b7d4:: with SMTP id p20mr51346402ljo.248.1637592128216;
        Mon, 22 Nov 2021 06:42:08 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f9sm614684lfu.10.2021.11.22.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 06:42:07 -0800 (PST)
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
Subject: [PATCH v2 1/1] clk: samsung: exynos850: Register clocks early
Date:   Mon, 22 Nov 2021 16:42:06 +0200
Message-Id: <20211122144206.23134-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
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

Let's register CMU_PERI clocks early, using CLK_OF_DECLARE(). CMU_TOP
generates clocks needed for CMU_PERI, but it's already registered early.

While at it, let's cleanup the code a bit, by extracting everything
related to CMU initialization and registration to the separate function.

Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
("clk: renesas: cpg-mssr: Add early clock support"), as well as in
drivers/clk/mediatek/clk-mt2712.c.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v2:
  - Use of_clk_get_by_name() API to get parent clock when registering
    CMU early (as suggested by Sylwester Nawrocki)
  - Extracted CMU registration code to separate routine
  - Use CLK_OF_DECLARE() for CMU_PERI init, instead of
    CLK_OF_DECLARE_DRIVER(), as parent clock now can be enabled early
  - Remove "samsung,exynos850-cmu-peri" from exynos850_cmu_of_match[]
  - Add some comments for early domains

 drivers/clk/samsung/clk-exynos850.c | 70 ++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 04a8d202c939..568ac97c8120 100644
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
 
@@ -853,6 +890,15 @@ static const struct samsung_cmu_info peri_cmu_info __initconst = {
 	.clk_name		= "dout_peri_bus",
 };
 
+static void __init exynos850_cmu_peri_init(struct device_node *np)
+{
+	exynos850_register_cmu(NULL, np, &peri_cmu_info);
+}
+
+/* Register CMU_PERI early, as it's needed for MCT timer */
+CLK_OF_DECLARE(exynos850_cmu_peri, "samsung,exynos850-cmu-peri",
+	       exynos850_cmu_peri_init);
+
 /* ---- CMU_CORE ------------------------------------------------------------ */
 
 /* Register Offset definitions for CMU_CORE (0x12000000) */
@@ -1021,24 +1067,9 @@ static int __init exynos850_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 
 	info = of_device_get_match_data(dev);
-	exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
-	samsung_cmu_register_one(np, info);
-
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
+	exynos850_register_cmu(dev, dev->of_node, info);
 
 	return 0;
 }
@@ -1053,9 +1084,6 @@ static const struct of_device_id exynos850_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-cmu-hsi",
 		.data = &hsi_cmu_info,
-	}, {
-		.compatible = "samsung,exynos850-cmu-peri",
-		.data = &peri_cmu_info,
 	}, {
 		.compatible = "samsung,exynos850-cmu-core",
 		.data = &core_cmu_info,
-- 
2.30.2

