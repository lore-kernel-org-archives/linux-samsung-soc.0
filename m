Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3B30CD84
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099037; cv=none; b=qQ6LmCOyD76+sLmA5hTwxTKAZ4BwKkIwP1hnRNSu5w6HH4h3evNTjGiMEwB6AjfJdEF2kPpfsqMO5AKuq0qgG7o/i3CTdFlgW4FBQ2OfU5CmgzXHLMlLgSgKBdz6H1zUb1jngAjjbfuoBiN0SjOfBck0UzqD3V9iysTTRB1EO5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099037; c=relaxed/simple;
	bh=9OK6yt0OsTzUyhCvE8DP4Qza3pefa22sUHTuLoNwEs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=BrF2z77Jnqqadul8Ns+gHoEWrnS8c2XXk6KmwB2EjEFlPsdEv7PKDwiCiM+O/hpooYtyu0qnuF+OutFavKG/bMIrBJ8KIqsHvhDUzQMkfI5GhvX2RHMAiuDpqn47d8YqfCAZh3Q87vP6xONIWkT49Oqo5lpXuXiB8WG4lwLV0TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=agprEyQ6; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="agprEyQ6"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250917085033epoutp0209c30bd0af1b43ff780c947899c684d0~mBcGV23Ro1604316043epoutp02E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:50:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250917085033epoutp0209c30bd0af1b43ff780c947899c684d0~mBcGV23Ro1604316043epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758099033;
	bh=HQOAFdRrIY5XydIM5ZJNbyD7Rg68INpw8NlHo6bfzLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agprEyQ6TKTYUwbGR4g2wb3iyxj3Z+WkThJS0fSYrS8Am4bU9dTtOw55RAukxuQBm
	 BhWo9qg3HSM7wwD6tMw8hA0KWeUhxecXO4iuCYBbkRpbYmuCTg+r2/NwZJeo9j0YB3
	 tJfShRhXd1AQ0Db5PV6Bj6bMhVG/dZCoWXtq/+cw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250917085032epcas5p2fec81de4b6d39f09124bcaf326bfe0b7~mBcFne9682561225612epcas5p2S;
	Wed, 17 Sep 2025 08:50:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRXXm0Mrkz3hhT8; Wed, 17 Sep
	2025 08:50:32 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250917085030epcas5p37cfe7031a7355d4336def6e15d8e62ee~mBcD6sX_B0767007670epcas5p3z;
	Wed, 17 Sep 2025 08:50:30 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085026epsmtip2db8033f8a8b0bd00a9ab68b0355e9d83~mBb-pGAay2767627676epsmtip2p;
	Wed, 17 Sep 2025 08:50:26 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH 2/7] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 14:19:59 +0530
Message-ID: <20250917085005.89819-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917085030epcas5p37cfe7031a7355d4336def6e15d8e62ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085030epcas5p37cfe7031a7355d4336def6e15d8e62ee
References: <20250917085005.89819-1-ravi.patel@samsung.com>
	<CGME20250917085030epcas5p37cfe7031a7355d4336def6e15d8e62ee@epcas5p3.samsung.com>

From: GyoungBo Min <mingyoungbo@coasia.com>

Add below clock PLL support for Axis ARTPEC-9 SoC platform:
- pll_a9fracm: Integer PLL with mid frequency FVCO (800 to 6400 MHz)
             This is used in ARTPEC-9 SoC for shared PLL

- pll_a9fraco: Integer/Fractional PLL with mid frequency FVCO
             (600 to 2400 MHz)
             This is used in ARTPEC-9 SoC for Audio PLL

FOUT calculation for pll_a9fracm and pll_a9fraco:
FOUT = (MDIV x FIN)/(PDIV x (SDIV + 1)) for integer PLL
FOUT = (((MDIV + (KDIV/2^24)) x FIN)/(PDIV x (SDIV + 1)) for fractional PLL

Signed-off-by: GyoungBo Min <mingyoungbo@coasia.com>
Reviewed-by: Kyunghwan Kim <kenkim@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 184 ++++++++++++++++++++++++++++++++--
 drivers/clk/samsung/clk-pll.h |  17 ++++
 2 files changed, 193 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d7e4..87348b0888d0 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -222,6 +222,9 @@ static const struct clk_ops samsung_pll3000_clk_ops = {
 #define PLL35XX_LOCK_STAT_SHIFT	(29)
 #define PLL35XX_ENABLE_SHIFT	(31)
 
+/* A9FRACM is similar to PLL35xx, except that MDIV is bit different */
+#define PLLA9FRACM_MDIV_SHIFT	(14)
+
 static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 				unsigned long parent_rate)
 {
@@ -230,7 +233,12 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con = readl_relaxed(pll->con_reg);
-	mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+
+	if (pll->type == pll_a9fracm)
+		mdiv = (pll_con >> PLLA9FRACM_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+	else
+		mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+
 	pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
 	sdiv = (pll_con >> PLL35XX_SDIV_SHIFT) & PLL35XX_SDIV_MASK;
 
@@ -240,12 +248,15 @@ static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)fvco;
 }
 
-static inline bool samsung_pll35xx_mp_change(
-		const struct samsung_pll_rate_table *rate, u32 pll_con)
+static inline bool samsung_pll35xx_mp_change(u32 pll_type,
+					     const struct samsung_pll_rate_table *rate, u32 pll_con)
 {
 	u32 old_mdiv, old_pdiv;
 
-	old_mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+	if (pll_type == pll_a9fracm)
+		old_mdiv = (pll_con >> PLLA9FRACM_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
+	else
+		old_mdiv = (pll_con >> PLL35XX_MDIV_SHIFT) & PLL35XX_MDIV_MASK;
 	old_pdiv = (pll_con >> PLL35XX_PDIV_SHIFT) & PLL35XX_PDIV_MASK;
 
 	return (rate->mdiv != old_mdiv || rate->pdiv != old_pdiv);
@@ -257,6 +268,12 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
 	const struct samsung_pll_rate_table *rate;
 	u32 tmp;
+	u32 mdiv_shift;
+
+	if (pll->type == pll_a9fracm)
+		mdiv_shift = PLLA9FRACM_MDIV_SHIFT;
+	else
+		mdiv_shift = PLL35XX_MDIV_SHIFT;
 
 	/* Get required rate settings from table */
 	rate = samsung_get_pll_settings(pll, drate);
@@ -268,7 +285,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	tmp = readl_relaxed(pll->con_reg);
 
-	if (!(samsung_pll35xx_mp_change(rate, tmp))) {
+	if (!(samsung_pll35xx_mp_change(pll->type, rate, tmp))) {
 		/* If only s change, change just s value only*/
 		tmp &= ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
 		tmp |= rate->sdiv << PLL35XX_SDIV_SHIFT;
@@ -278,7 +295,7 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	/* Set PLL lock time. */
-	if (pll->type == pll_142xx || pll->type == pll_1017x)
+	if (pll->type == pll_142xx || pll->type == pll_1017x || pll->type == pll_a9fracm)
 		writel_relaxed(rate->pdiv * PLL142XX_LOCK_FACTOR,
 			pll->lock_reg);
 	else
@@ -286,10 +303,10 @@ static int samsung_pll35xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			pll->lock_reg);
 
 	/* Change PLL PMS values */
-	tmp &= ~((PLL35XX_MDIV_MASK << PLL35XX_MDIV_SHIFT) |
+	tmp &= ~((PLL35XX_MDIV_MASK << mdiv_shift) |
 			(PLL35XX_PDIV_MASK << PLL35XX_PDIV_SHIFT) |
 			(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT));
-	tmp |= (rate->mdiv << PLL35XX_MDIV_SHIFT) |
+	tmp |= (rate->mdiv << mdiv_shift) |
 			(rate->pdiv << PLL35XX_PDIV_SHIFT) |
 			(rate->sdiv << PLL35XX_SDIV_SHIFT);
 	writel_relaxed(tmp, pll->con_reg);
@@ -1449,6 +1466,148 @@ static const struct clk_ops samsung_pll1031x_clk_min_ops = {
 	.recalc_rate = samsung_pll1031x_recalc_rate,
 };
 
+/*
+ * PLLA9FRACO Clock Type
+ */
+#define PLLA9FRACO_LOCK_FACTOR		(500)
+
+#define PLLA9FRACO_MDIV_MASK		(0x3ff)
+#define PLLA9FRACO_PDIV_MASK		(0x3f)
+#define PLLA9FRACO_SDIV_MASK		(0x7)
+#define PLLA9FRACO_MDIV_SHIFT		(14)
+#define PLLA9FRACO_PDIV_SHIFT		(8)
+#define PLLA9FRACO_SDIV_SHIFT		(0)
+
+#define PLLA9FRACO_PLL_CON5_DIV_FRAC	(0x14)
+#define PLLA9FRACO_KDIV_MASK		(0xffffff)
+#define PLLA9FRACO_KDIV_SHIFT		(0)
+#define PLLA9FRACO_DAC_MODE		BIT(30)
+#define PLLA9FRACO_DSM_EN		BIT(31)
+#define PLLA9FRACO_FOUTPOSTDIVEN	BIT(3)
+#define PLLA9FRACO_MUX_SEL		BIT(4)
+#define PLLA9FRACO_ENABLE_SHIFT		(31)
+#define PLLA9FRACO_LOCK_STAT_SHIFT	(29)
+
+static unsigned long samsung_a9fraco_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 pll_con0, pll_con5;
+	u64 mdiv, pdiv, sdiv, kdiv;
+	u64 fvco = parent_rate;
+
+	pll_con0 = readl_relaxed(pll->con_reg);
+	pll_con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+	mdiv = (pll_con0 >> PLLA9FRACO_MDIV_SHIFT) & PLLA9FRACO_MDIV_MASK;
+	pdiv = (pll_con0 >> PLLA9FRACO_PDIV_SHIFT) & PLLA9FRACO_PDIV_MASK;
+	sdiv = (pll_con0 >> PLLA9FRACO_SDIV_SHIFT) & PLLA9FRACO_SDIV_MASK;
+	kdiv = (pll_con5 & PLLA9FRACO_KDIV_MASK);
+
+	/* fvco = fref * (M + K/2^24) / p * (S+1) */
+	fvco *= mdiv;
+	fvco = ((fvco << 24) + kdiv) / ((pdiv * (sdiv + 1)) << 24);
+
+	return (unsigned long)fvco;
+}
+
+static bool samsung_a9fraco_mpk_change(u32 pll_con0, u32 pll_con5,
+				       const struct samsung_pll_rate_table *rate)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv = (pll_con0 >> PLLA9FRACO_MDIV_SHIFT) & PLLA9FRACO_MDIV_MASK;
+	old_pdiv = (pll_con0 >> PLLA9FRACO_PDIV_SHIFT) & PLLA9FRACO_PDIV_MASK;
+	old_kdiv = (pll_con5 >> PLLA9FRACO_KDIV_SHIFT) & PLLA9FRACO_KDIV_MASK;
+
+	return (old_mdiv != rate->mdiv || old_pdiv != rate->pdiv || old_kdiv != rate->kdiv);
+}
+
+static int samsung_a9fraco_set_rate(struct clk_hw *hw, unsigned long drate, unsigned long prate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	const struct samsung_pll_rate_table *rate;
+	u32 con0, con5;
+	int ret;
+
+	/* Get required rate settings from table */
+	rate = samsung_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+		       drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	con0 = readl_relaxed(pll->con_reg);
+	con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+
+	if (!(samsung_a9fraco_mpk_change(con0, con5, rate))) {
+		/* If only s change, change just s value only */
+		con0 &= ~(PLLA9FRACO_SDIV_MASK << PLLA9FRACO_SDIV_SHIFT);
+		con0 |= rate->sdiv << PLLA9FRACO_SDIV_SHIFT;
+		writel_relaxed(con0, pll->con_reg);
+
+		return 0;
+	}
+
+	/* Select OSCCLK (0) */
+	con0 = readl_relaxed(pll->con_reg);
+	con0 &= ~(PLLA9FRACO_MUX_SEL);
+	writel_relaxed(con0, pll->con_reg);
+
+	/* Disable PLL */
+	con0 &= ~BIT(PLLA9FRACO_ENABLE_SHIFT);
+	writel_relaxed(con0, pll->con_reg);
+
+	/* Set PLL lock time. */
+	writel_relaxed(rate->pdiv * PLLA9FRACO_LOCK_FACTOR, pll->lock_reg);
+
+	/* Set PLL M, P, and S values. */
+	con0 &= ~((PLLA9FRACO_MDIV_MASK << PLLA9FRACO_MDIV_SHIFT) |
+		  (PLLA9FRACO_PDIV_MASK << PLLA9FRACO_PDIV_SHIFT) |
+		  (PLLA9FRACO_SDIV_MASK << PLLA9FRACO_SDIV_SHIFT));
+
+	/* The field FOUTPOSTDIVEN should always be 1, else FOUT might be 0 Hz. */
+	con0 |= (rate->mdiv << PLLA9FRACO_MDIV_SHIFT) |
+		(rate->pdiv << PLLA9FRACO_PDIV_SHIFT) |
+		(rate->sdiv << PLLA9FRACO_SDIV_SHIFT) | (PLLA9FRACO_FOUTPOSTDIVEN);
+
+	/* Set PLL K, DSM_EN and DAC_MODE values. */
+	con5 = readl_relaxed(pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+	con5 &= ~((PLLA9FRACO_KDIV_MASK << PLLA9FRACO_KDIV_SHIFT) |
+		  PLLA9FRACO_DSM_EN | PLLA9FRACO_DAC_MODE);
+	con5 |= (rate->kdiv << PLLA9FRACO_KDIV_SHIFT) | PLLA9FRACO_DSM_EN | PLLA9FRACO_DAC_MODE;
+
+	/* Write configuration to PLL */
+	writel_relaxed(con0, pll->con_reg);
+	writel_relaxed(con5, pll->con_reg + PLLA9FRACO_PLL_CON5_DIV_FRAC);
+
+	/* Enable PLL */
+	con0 = readl_relaxed(pll->con_reg);
+	con0 |= BIT(PLLA9FRACO_ENABLE_SHIFT);
+	writel_relaxed(con0, pll->con_reg);
+
+	/* Wait for PLL lock if the PLL is enabled */
+	ret = samsung_pll_lock_wait(pll, BIT(pll->lock_offs));
+	if (ret < 0)
+		return ret;
+
+	/* Select FOUT (1) */
+	con0 |= (PLLA9FRACO_MUX_SEL);
+	writel_relaxed(con0, pll->con_reg);
+
+	return 0;
+}
+
+static const struct clk_ops samsung_a9fraco_clk_ops = {
+	.recalc_rate = samsung_a9fraco_recalc_rate,
+	.determine_rate = samsung_pll_determine_rate,
+	.set_rate = samsung_a9fraco_set_rate,
+};
+
+static const struct clk_ops samsung_a9fraco_clk_min_ops = {
+	.recalc_rate = samsung_a9fraco_recalc_rate,
+};
+
 static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 				const struct samsung_pll_clock *pll_clk)
 {
@@ -1498,6 +1657,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1452x:
 	case pll_142xx:
 	case pll_1017x:
+	case pll_a9fracm:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
@@ -1599,6 +1759,14 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		else
 			init.ops = &samsung_pll1031x_clk_ops;
 		break;
+	case pll_a9fraco:
+		pll->enable_offs = PLLA9FRACO_ENABLE_SHIFT;
+		pll->lock_offs = PLLA9FRACO_LOCK_STAT_SHIFT;
+		if (!pll->rate_table)
+			init.ops = &samsung_a9fraco_clk_min_ops;
+		else
+			init.ops = &samsung_a9fraco_clk_ops;
+		break;
 	default:
 		pr_warn("%s: Unknown pll type for pll clk %s\n",
 			__func__, pll_clk->name);
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c8bb7f26da5..d6eb3246611b 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -51,6 +51,8 @@ enum samsung_pll_type {
 	pll_4311,
 	pll_1017x,
 	pll_1031x,
+	pll_a9fracm,
+	pll_a9fraco,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
@@ -58,6 +60,11 @@ enum samsung_pll_type {
 #define PLL_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) ((_fout) + \
 	BUILD_BUG_ON_ZERO(PLL_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)))
 
+#define PLL_FRACO_RATE(_fin, _m, _p, _s, _k, _ks) \
+	((u64)(_fin) * (BIT(_ks) * (_m) + (_k)) / BIT(_ks) / ((_p) * ((_s) + 1)))
+#define PLL_FRACO_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) ((_fout) + \
+	BUILD_BUG_ON_ZERO(PLL_FRACO_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)))
+
 #define PLL_35XX_RATE(_fin, _rate, _m, _p, _s)			\
 	{							\
 		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
@@ -111,6 +118,16 @@ enum samsung_pll_type {
 		.vsel	=	(_vsel),			\
 	}
 
+#define PLL_A9FRACO_RATE(_fin, _rate, _m, _p, _s, _k)		\
+	{							\
+		.rate	=	PLL_FRACO_VALID_RATE(_fin, _rate, \
+				_m, _p, _s, _k, 24),		\
+		.mdiv	=	(_m),				\
+		.pdiv	=	(_p),				\
+		.sdiv	=	(_s),				\
+		.kdiv	=	(_k),				\
+	}
+
 /* NOTE: Rate table should be kept sorted in descending order. */
 
 struct samsung_pll_rate_table {
-- 
2.17.1

