Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9DBC43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D757B61260
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbhINP5c (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Sep 2021 11:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234167AbhINP5b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 11:57:31 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A85AC0613CF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a4so29862477lfg.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FsmxwsvLuhos/2hySe+N+Y45xPpsykMi53i/B9j4YZE=;
        b=Qw6pbbpiV0RVUyrBVEmiDjF5gVxmin9l5k6UbqxBixjZa4efOdsxAPHDCw+co0gtTN
         ePuVd644k9yOSXx+/ak+YVz+c2+zds0/mRdXexVB5h5z7CCoVNZkE+a7liD0SyS00MeK
         pq2qJPgc3s20I4de8szcxP9JMmtD0CkKdxcVVfZPe41Xt97F27UCs/ATKJMiVVawEDbw
         2L7y09HUZgCd0GZDwD5fKa34A1lIUSjaQdKBRlY3TiQ2iOZANzzBvB6+jkWnp3DTwEjL
         yQ9lPRBJ6DFRbmcOgKESi/3AAf3H/5XG8mEzdNy7a3mXcNu1l/yRY7CPJJVzO6lgEnxj
         vgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FsmxwsvLuhos/2hySe+N+Y45xPpsykMi53i/B9j4YZE=;
        b=WtZxJb1S8Hknw0CrLNztH2gjHAzs9J60PoCMUwJrPUAnjA6ZNNuX5daLzSabPADrwG
         b4gU9qAbzOw1GPp9hwFZf8hlqoo/aA493aK4kDF3TnR2zn/COlUuntk+DYTmr9dsEjiT
         3/BjJdkDsatU38OKRAHrdX1OKNGY+HoDoCxxYUslWdmDkmWx8nvql9NHwsT6znQfhzj2
         04Io0La/XmMAqaBCRUn/6Gl1ElPhndeZzOmgABHfUM4pU4aO1dtk0lOPXKs0PzhHp7WO
         nvt8I0hX1DjamsuxMLyNGGBo6Tiv33IRFklxzQZCsNf9lJWP1exFaJlA48Ai2stnbvjH
         abhQ==
X-Gm-Message-State: AOAM531VDknsev2zdQ5bryQcIgLYGqEXJSQn/J2nVoELn3CwBtiFqzB2
        bD4lLCFDCP6Bn9C69rKS57ffmw==
X-Google-Smtp-Source: ABdhPJzECS9jVyTfA2uQ+TtyTGqjZu4NhZcLuqEIUCXaujusPfXE6wMsuvH9yv9/e95OCFrgXFJWuQ==
X-Received: by 2002:a05:6512:10cb:: with SMTP id k11mr13311805lfg.67.1631634972268;
        Tue, 14 Sep 2021 08:56:12 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w3sm851743lfu.147.2021.09.14.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:56:11 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/6] clk: samsung: clk-pll: Implement pll0822x PLL type
Date:   Tue, 14 Sep 2021 18:56:03 +0300
Message-Id: <20210914155607.14122-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914155607.14122-1-semen.protsenko@linaro.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pll0822x PLL is used in Exynos850 SoC for top-level integer PLLs. The
code was derived from very similar pll35xx type, with next differences:

1. Lock time for pll0822x is 150*P_DIV, when for pll35xx it's 270*P_DIV
2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
   performing PLL lock procedure (which is done in pll35xx
   implementation)

When defining pll0822x type, CON3 register offset should be provided as
a "con" parameter of PLL() macro, like this:

    PLL(pll_0822x, 0, "fout_shared0_pll", "oscclk",
        PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
        exynos850_shared0_pll_rates),

To define PLL rates table, one can use PLL_35XX_RATE() macro, e.g.:

    PLL_35XX_RATE(26 * MHZ, 1600 * MHZ, 800, 13, 0)

as it's completely appropriate for pl0822x type and there is no sense in
duplicating that.

If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
possible to set new rate, with next error showing in kernel log:

    Could not lock PLL fout_shared1_pll

That can happen for example if bootloader clears that bit beforehand.
PLL driver doesn't account for that, so if MANUAL_PLL_CTRL bit was
cleared, it's assumed it was done for a reason and it shouldn't be
possible to change that PLL's rate at all.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 91 +++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 92 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 5873a9354b50..03131b149c0b 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -415,6 +415,89 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
 	.recalc_rate = samsung_pll36xx_recalc_rate,
 };
 
+/*
+ * PLL0822x Clock Type
+ */
+/* Maximum lock time can be 150 * PDIV cycles */
+#define PLL0822X_LOCK_FACTOR		(150)
+
+#define PLL0822X_MDIV_MASK		(0x3FF)
+#define PLL0822X_PDIV_MASK		(0x3F)
+#define PLL0822X_SDIV_MASK		(0x7)
+#define PLL0822X_MDIV_SHIFT		(16)
+#define PLL0822X_PDIV_SHIFT		(8)
+#define PLL0822X_SDIV_SHIFT		(0)
+#define PLL0822X_LOCK_STAT_SHIFT	(29)
+#define PLL0822X_ENABLE_SHIFT		(31)
+
+static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 mdiv, pdiv, sdiv, pll_con3;
+	u64 fvco = parent_rate;
+
+	pll_con3 = readl_relaxed(pll->con_reg);
+	mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
+	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
+	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
+
+	fvco *= mdiv;
+	do_div(fvco, (pdiv << sdiv));
+
+	return (unsigned long)fvco;
+}
+
+static int samsung_pll0822x_set_rate(struct clk_hw *hw, unsigned long drate,
+				     unsigned long prate)
+{
+	const struct samsung_pll_rate_table *rate;
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 pll_con3;
+
+	/* Get required rate settings from table */
+	rate = samsung_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	/* Change PLL PMS values */
+	pll_con3 = readl_relaxed(pll->con_reg);
+	pll_con3 &= ~((PLL0822X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
+			(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
+			(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));
+	pll_con3 |= (rate->mdiv << PLL0822X_MDIV_SHIFT) |
+			(rate->pdiv << PLL0822X_PDIV_SHIFT) |
+			(rate->sdiv << PLL0822X_SDIV_SHIFT);
+
+	/* Set PLL lock time */
+	writel_relaxed(rate->pdiv * PLL0822X_LOCK_FACTOR,
+			pll->lock_reg);
+
+	/* Write PMS values */
+	writel_relaxed(pll_con3, pll->con_reg);
+
+	/* Wait for PLL lock if the PLL is enabled */
+	if (pll_con3 & BIT(pll->enable_offs))
+		return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
+
+	return 0;
+}
+
+static const struct clk_ops samsung_pll0822x_clk_ops = {
+	.recalc_rate = samsung_pll0822x_recalc_rate,
+	.round_rate = samsung_pll_round_rate,
+	.set_rate = samsung_pll0822x_set_rate,
+	.enable = samsung_pll3xxx_enable,
+	.disable = samsung_pll3xxx_disable,
+};
+
+static const struct clk_ops samsung_pll0822x_clk_min_ops = {
+	.recalc_rate = samsung_pll0822x_recalc_rate,
+};
+
 /*
  * PLL45xx Clock Type
  */
@@ -1296,6 +1379,14 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		else
 			init.ops = &samsung_pll35xx_clk_ops;
 		break;
+	case pll_0822x:
+		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
+		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
+		if (!pll->rate_table)
+			init.ops = &samsung_pll0822x_clk_min_ops;
+		else
+			init.ops = &samsung_pll0822x_clk_ops;
+		break;
 	case pll_4500:
 		init.ops = &samsung_pll45xx_clk_min_ops;
 		break;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 79e41c226b90..213e94a97f23 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -36,6 +36,7 @@ enum samsung_pll_type {
 	pll_1451x,
 	pll_1452x,
 	pll_1460x,
+	pll_0822x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.30.2

