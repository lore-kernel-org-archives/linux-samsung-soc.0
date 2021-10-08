Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2B6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 15:44:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D1746101E
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 15:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243107AbhJHPqB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 11:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243108AbhJHPp4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 11:45:56 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B733DC06176C
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 08:43:59 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r18so38061449edv.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=quo/ylhj+3jkRmjrjnpvFvIiOsFBnvRXe7yjbSYLqZ4=;
        b=iK4zWPCzvMD9scJxhjm2v51i5dFh3Az7mofOgBFCuGiFjllH5l8YDdjnab9yjHX+OP
         jiMR4TMzaaUp7DbM1klfK1c4z6VFRm4XiI5bn30HbNR2KSwU/rOe4IV3WTAHV/rd0QIP
         g5grteOI9ZYoMrUhhLRDRnbhm099LyfjdvKh8n/NF0YkcqaIsMvRECX013r8X19nl72x
         c9h2j5YjWFJBnw9S0+HW+BYvCfMmfxTU0G5LGZ1L0yjkgcGUbVNwKQvFRVv8bYEZ5JyF
         e9K4ODVpRmybs4k3sT+N4R0VePVegjbImpmW42S56jPnuWKhzAauStbzjRlM51rj9a+V
         vy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=quo/ylhj+3jkRmjrjnpvFvIiOsFBnvRXe7yjbSYLqZ4=;
        b=WGAJFMjlgi0DjVlCXuFaC1vV1Qmxza4KyZUbmjHpx6ebFcq2OP3o0RwXbGnCAp2mXR
         8/ozD5s29cc1KdW4QjrcX1uPgplMxcnuyg5vzNrzF5pkbB5xE1TNpisv38/BhMovRa0Q
         SxoJ8nMG++PzC1RET1aOq4w5ly33VNCg1D3fkp8g/kykLcXPIWY+WAnCYu3QKQzW+MN6
         TmTyyvyYp3tFWecCIxiHVwjy7wrAqNYZwqLwHIJbPxYjY7nF6EUARh070q7s03U/h14v
         tJ8Gq1vmazdYWT9Z9KSqHkkcL3FmpzKPmckFZSpmzw6m4MBiZh62a+VoCZ/xkc1tT3FC
         aGqw==
X-Gm-Message-State: AOAM532GkO88QMkb2kKbYq57N7gF81/OJ7DGHSQqyiOFHHzXPlZs7u/d
        qo+Edx7sGLVWXEyl1OnlWZl5LA==
X-Google-Smtp-Source: ABdhPJwA0dSDRmAptY2i2sock4IYNHwd7dX4xmiJ8GFw98Ho1SK3UxQyjbudI8DZsQUCm3gI3Q1JzQ==
X-Received: by 2002:a50:9d49:: with SMTP id j9mr15393139edk.39.1633707838261;
        Fri, 08 Oct 2021 08:43:58 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id e7sm1242750edz.95.2021.10.08.08.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:43:57 -0700 (PDT)
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
Subject: [PATCH v3 2/5] clk: samsung: clk-pll: Implement pll0831x PLL type
Date:   Fri,  8 Oct 2021 18:43:49 +0300
Message-Id: <20211008154352.19519-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008154352.19519-1-semen.protsenko@linaro.org>
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pll0831x PLL is used in Exynos850 SoC for top-level fractional PLLs. The
code was derived from very similar pll36xx type, with next differences:

1. Lock time for pll0831x is 500*P_DIV, when for pll36xx it's 3000*P_DIV
2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
   performing PLL lock procedure (which is done in pll36xx
   implementation)
3. The offset from PMS-values register to K-value register is 0x8 for
   pll0831x, when for pll36xx it's 0x4

When defining pll0831x type, CON3 register offset should be provided as
a "con" parameter of PLL() macro, like this:

    PLL(pll_0831x, 0, "fout_mmc_pll", "oscclk",
        PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, pll0831x_26mhz_tbl),

To define PLL rates table, one can use PLL_36XX_RATE() macro, e.g.:

    PLL_36XX_RATE(26 * MHZ, 799999877, 31, 1, 0, -15124)

as it's completely appropriate for pl0831x type and there is no sense in
duplicating that.

If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
possible to set new rate, with next error showing in kernel log:

    Could not lock PLL fout_mmc_pll

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

 drivers/clk/samsung/clk-pll.c | 105 ++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.h |   1 +
 2 files changed, 106 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 03131b149c0b..83d1b03647db 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -498,6 +498,103 @@ static const struct clk_ops samsung_pll0822x_clk_min_ops = {
 	.recalc_rate = samsung_pll0822x_recalc_rate,
 };
 
+/*
+ * PLL0831x Clock Type
+ */
+/* Maximum lock time can be 500 * PDIV cycles */
+#define PLL0831X_LOCK_FACTOR		(500)
+
+#define PLL0831X_KDIV_MASK		(0xFFFF)
+#define PLL0831X_MDIV_MASK		(0x1FF)
+#define PLL0831X_PDIV_MASK		(0x3F)
+#define PLL0831X_SDIV_MASK		(0x7)
+#define PLL0831X_MDIV_SHIFT		(16)
+#define PLL0831X_PDIV_SHIFT		(8)
+#define PLL0831X_SDIV_SHIFT		(0)
+#define PLL0831X_KDIV_SHIFT		(0)
+#define PLL0831X_LOCK_STAT_SHIFT	(29)
+#define PLL0831X_ENABLE_SHIFT		(31)
+
+static unsigned long samsung_pll0831x_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 mdiv, pdiv, sdiv, pll_con3, pll_con5;
+	s16 kdiv;
+	u64 fvco = parent_rate;
+
+	pll_con3 = readl_relaxed(pll->con_reg);
+	pll_con5 = readl_relaxed(pll->con_reg + 8);
+	mdiv = (pll_con3 >> PLL0831X_MDIV_SHIFT) & PLL0831X_MDIV_MASK;
+	pdiv = (pll_con3 >> PLL0831X_PDIV_SHIFT) & PLL0831X_PDIV_MASK;
+	sdiv = (pll_con3 >> PLL0831X_SDIV_SHIFT) & PLL0831X_SDIV_MASK;
+	kdiv = (s16)((pll_con5 >> PLL0831X_KDIV_SHIFT) & PLL0831X_KDIV_MASK);
+
+	fvco *= (mdiv << 16) + kdiv;
+	do_div(fvco, (pdiv << sdiv));
+	fvco >>= 16;
+
+	return (unsigned long)fvco;
+}
+
+static int samsung_pll0831x_set_rate(struct clk_hw *hw, unsigned long drate,
+				     unsigned long parent_rate)
+{
+	const struct samsung_pll_rate_table *rate;
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 pll_con3, pll_con5;
+
+	/* Get required rate settings from table */
+	rate = samsung_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	pll_con3 = readl_relaxed(pll->con_reg);
+	pll_con5 = readl_relaxed(pll->con_reg + 8);
+
+	/* Change PLL PMSK values */
+	pll_con3 &= ~((PLL0831X_MDIV_MASK << PLL0831X_MDIV_SHIFT) |
+			(PLL0831X_PDIV_MASK << PLL0831X_PDIV_SHIFT) |
+			(PLL0831X_SDIV_MASK << PLL0831X_SDIV_SHIFT));
+	pll_con3 |= (rate->mdiv << PLL0831X_MDIV_SHIFT) |
+			(rate->pdiv << PLL0831X_PDIV_SHIFT) |
+			(rate->sdiv << PLL0831X_SDIV_SHIFT);
+	pll_con5 &= ~(PLL0831X_KDIV_MASK << PLL0831X_KDIV_SHIFT);
+	/*
+	 * kdiv is 16-bit 2's complement (s16), but stored as unsigned int.
+	 * Cast it to u16 to avoid leading 0xffff's in case of negative value.
+	 */
+	pll_con5 |= ((u16)rate->kdiv << PLL0831X_KDIV_SHIFT);
+
+	/* Set PLL lock time */
+	writel_relaxed(rate->pdiv * PLL0831X_LOCK_FACTOR, pll->lock_reg);
+
+	/* Write PMSK values */
+	writel_relaxed(pll_con3, pll->con_reg);
+	writel_relaxed(pll_con5, pll->con_reg + 8);
+
+	/* Wait for PLL lock if the PLL is enabled */
+	if (pll_con3 & BIT(pll->enable_offs))
+		return samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
+
+	return 0;
+}
+
+static const struct clk_ops samsung_pll0831x_clk_ops = {
+	.recalc_rate = samsung_pll0831x_recalc_rate,
+	.set_rate = samsung_pll0831x_set_rate,
+	.round_rate = samsung_pll_round_rate,
+	.enable = samsung_pll3xxx_enable,
+	.disable = samsung_pll3xxx_disable,
+};
+
+static const struct clk_ops samsung_pll0831x_clk_min_ops = {
+	.recalc_rate = samsung_pll0831x_recalc_rate,
+};
+
 /*
  * PLL45xx Clock Type
  */
@@ -1407,6 +1504,14 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		else
 			init.ops = &samsung_pll36xx_clk_ops;
 		break;
+	case pll_0831x:
+		pll->enable_offs = PLL0831X_ENABLE_SHIFT;
+		pll->lock_offs = PLL0831X_LOCK_STAT_SHIFT;
+		if (!pll->rate_table)
+			init.ops = &samsung_pll0831x_clk_min_ops;
+		else
+			init.ops = &samsung_pll0831x_clk_ops;
+		break;
 	case pll_6552:
 	case pll_6552_s3c2416:
 		init.ops = &samsung_pll6552_clk_ops;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 213e94a97f23..a739f2b7ae80 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -37,6 +37,7 @@ enum samsung_pll_type {
 	pll_1452x,
 	pll_1460x,
 	pll_0822x,
+	pll_0831x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.30.2

