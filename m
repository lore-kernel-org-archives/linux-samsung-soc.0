Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D036C43219
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 15:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 179F461073
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 15:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243073AbhJHPp7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 11:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243107AbhJHPp4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 11:45:56 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA81C061768
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 08:43:58 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id p13so38603818edw.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VxxLufFz8LSGyDkzHDaRKQ8X1sXY/c0Ny6fFIjRH6DM=;
        b=ZpGolWITvvQjVxyHaYF0SpF/qbZLAaMeX5IPa2qgMm8xWINpdCjFe3JrbixLU9nNCe
         KGMIuZuCsaMoO9OYIfJXyQr4AmXaDixScrRn7KYTD4halgNgEhapFnFkUIWFq0P/2KoJ
         EC4DulvwZxX+1FCYfy9/7Cu3kmaDyNzClrtjA6THPXo0Z8EMyMnIfsu1nJj9Rex5lHzK
         y5yo0b2rcfKB5YekYssIQFerD5YyeciDhOcdSNe/ob0ZcKlMG6AA55nN0aYocDYErjSz
         UFPyARt21IqNPv65PQPe6vK+matic6WgkkBPaFPnvfmq2gVo6FJ7PIDHp1VXSlUyINbP
         1rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VxxLufFz8LSGyDkzHDaRKQ8X1sXY/c0Ny6fFIjRH6DM=;
        b=BenXtfRNbMCCWLHRQpEGbX/RhteoLC9Of6mrUb6Lwi6r6H3TulnyZ3mcNVa7mnVlvQ
         E+dQ6xsPajMY8RMjIu0vkOmwGBw7j+wd8BGzKrW+/fADpqM+Lrbv/aIJBa09bA7vb6SD
         ubvNhJZPKFsfawUsyZC15oBsrQUDzeCm//xv7hTwBrmzrdih2FrtwFAzqMH0Naule8Sp
         GO2VfJxUPBh/xXmT2450SFrd2GjlawgjEBRnSHQdwFB14Y7Lu8y8D5jGdIF1DjFcx4CB
         xqsZx0SbVb39MYphydGjauc3NjYxOBAUASSK/pDPFIIa2ugnGeAjJyr+05OyLRVQpD54
         ji0w==
X-Gm-Message-State: AOAM530ZtWayWOj+fNPKEuGitvAI79WfEm6/cimgmAUichizT4zztPDA
        WjmC7FihqlotWWGJ0P4QoGroEg==
X-Google-Smtp-Source: ABdhPJzvKW7nGxSf/Dpm+LAvc/O8AhzFVLC1lDLJE4HbbHGtCf4wFDgK44nhD5iV3DuJadpV3HHz6w==
X-Received: by 2002:a05:6402:1d55:: with SMTP id dz21mr3727528edb.164.1633707836543;
        Fri, 08 Oct 2021 08:43:56 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id fx4sm1066209ejb.113.2021.10.08.08.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:43:55 -0700 (PDT)
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
Subject: [PATCH v3 1/5] clk: samsung: clk-pll: Implement pll0822x PLL type
Date:   Fri,  8 Oct 2021 18:43:48 +0300
Message-Id: <20211008154352.19519-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008154352.19519-1-semen.protsenko@linaro.org>
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
Changes in v3:
  - (none)

Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added Ack tag by Chanwoo Choi

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

