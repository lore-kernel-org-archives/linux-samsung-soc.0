Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EFC439912;
	Thu, 16 Jul 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222105; cv=none; b=ipyuwfgvt6MLW3N6j4DZEIlZfxj4MqRivkRUGg+BAJF6lKnZciRjpun2MI/abZmrGWHCwNgAj6h59N/vQrbQ/jU3+tbcYcOELZnM+q/QLvMUvTUajU5dZfUBmdqXulDhqiaasQC8tjTmFnzstKwGtb1rE2sDVWBxj/eAM4A9o94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222105; c=relaxed/simple;
	bh=rQHGNu66WLj3qMAdputSH02cPVxAB/2D8RcwzPrPGfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQmJHpWJZ0DzjgkQdkur8crwXrf5hMQT/linylORolCCjsdCGedf6q1wf9C7GzmQAykbO3rKumWU8XftdkOxclyUn5Dkgbm7vzqb5Oc8/iA5U+smX1moegQXfSeu85I6fbOcFerOojmMaKmPfdnw/0ia665NGSHXBCYv4XmKYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2vdd7cX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2vdd7cX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6B8AC2BCFB;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784222104;
	bh=rQHGNu66WLj3qMAdputSH02cPVxAB/2D8RcwzPrPGfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k2vdd7cXgTmCpIIfCuedC08pj7oR4z5naYbtzShBYJX4UgTO+VKtwYPIAeZrE8BmF
	 jVWQishjDci7cCYJKfPIF33gxeMWa7goeLwNsTvTqpuRAzQIk47jbeSSVb2Oz1RIJ1
	 VsxAHai7dBgXqmvjpdbHG3oLoZvVfU0kUgBLagSdmCYQQ2xKU8gWks6p4ZwhENHlyE
	 tji4N7BIND4gyhKkp+6VVcEB3r5SlbOi6quynDS6kVac1j79lJPhWcLMySuzKzPIB2
	 PeV6OzmndIkySNhA/+HC8NNL4q7wDyU9IMxmw8z2PRlIXwvn0a2swLGXcJy56+lvnc
	 JaM6XPSWfICEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4B6C44516;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
From: Alexandru Chimac via B4 Relay <devnull+alex.chimac.ro@kernel.org>
Date: Thu, 16 Jul 2026 20:14:57 +0300
Subject: [PATCH v2 3/5] clk: samsung: clk-pll: Add support for pll_1061x
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-exynos9610-clocks-v2-3-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
In-Reply-To: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784222102; l=4101;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=ODGsgpJOf8c8DBGqrueSP4LxQrliVu1HTxoqn/yCzcY=;
 b=vKkm9xPZXynFemrr5/pLaJeUtWXRI6krVoiiqw6O1KlUWDd8v5WTIBLuE9bJWnpX9Ra5m6BNT
 q6ia8iZLru1DW3aYKTHN0qOF0K/1P8Fd7rAis31ugE8MpFHqhD4Pona
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-Endpoint-Received: by B4 Relay for alex@chimac.ro/20250914 with
 auth_id=877
X-Original-From: Alexandru Chimac <alex@chimac.ro>
Reply-To: alex@chimac.ro

From: Alexandru Chimac <alex@chimac.ro>

These PLLs are found in the Exynos9610 and Exynos9810 SoCs, and
are similar to pll_1460x (using CON3 instead of CON1), so the code
for that can handle this PLL with a few small adaptations.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/clk/samsung/clk-pll.c | 29 ++++++++++++++++++++++-------
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index fdb84bcec912..5ec9423009c7 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -781,15 +781,20 @@ static unsigned long samsung_pll46xx_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con0 = readl_relaxed(pll->con_reg);
-	pll_con1 = readl_relaxed(pll->con_reg + 4);
-	mdiv = (pll_con0 >> PLL46XX_MDIV_SHIFT) & ((pll->type == pll_1460x) ?
+	if (pll->type == pll_1061x)
+		pll_con1 = readl_relaxed(pll->con_reg + 0xc);
+	else
+		pll_con1 = readl_relaxed(pll->con_reg + 0x4);
+	mdiv = (pll_con0 >> PLL46XX_MDIV_SHIFT) & (((pll->type == pll_1460x)
+				|| (pll->type == pll_1061x)) ?
 				PLL1460X_MDIV_MASK : PLL46XX_MDIV_MASK);
 	pdiv = (pll_con0 >> PLL46XX_PDIV_SHIFT) & PLL46XX_PDIV_MASK;
 	sdiv = (pll_con0 >> PLL46XX_SDIV_SHIFT) & PLL46XX_SDIV_MASK;
 	kdiv = pll->type == pll_4650c ? pll_con1 & PLL4650C_KDIV_MASK :
 					pll_con1 & PLL46XX_KDIV_MASK;
 
-	shift = ((pll->type == pll_4600) || (pll->type == pll_1460x)) ? 16 : 10;
+	shift = ((pll->type == pll_4600) || (pll->type == pll_1460x)
+		 || (pll->type == pll_1061x)) ? 16 : 10;
 
 	fvco *= (mdiv << shift) + kdiv;
 	do_div(fvco, (pdiv << sdiv));
@@ -827,7 +832,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	con0 = readl_relaxed(pll->con_reg);
-	con1 = readl_relaxed(pll->con_reg + 0x4);
+	if (pll->type == pll_1061x)
+		con1 = readl_relaxed(pll->con_reg + 0xc);
+	else
+		con1 = readl_relaxed(pll->con_reg + 0x4);
 
 	if (!(samsung_pll46xx_mpk_change(con0, con1, rate))) {
 		/* If only s change, change just s value only*/
@@ -845,7 +853,7 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 		lock = 0xffff;
 
 	/* Set PLL PMS and VSEL values. */
-	if (pll->type == pll_1460x) {
+	if ((pll->type == pll_1460x) || (pll->type == pll_1061x)) {
 		con0 &= ~((PLL1460X_MDIV_MASK << PLL46XX_MDIV_SHIFT) |
 			(PLL46XX_PDIV_MASK << PLL46XX_PDIV_SHIFT) |
 			(PLL46XX_SDIV_MASK << PLL46XX_SDIV_SHIFT));
@@ -862,7 +870,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 			(rate->sdiv << PLL46XX_SDIV_SHIFT);
 
 	/* Set PLL K, MFR and MRR values. */
-	con1 = readl_relaxed(pll->con_reg + 0x4);
+	if (pll->type == pll_1061x)
+		con1 = readl_relaxed(pll->con_reg + 0xc);
+	else
+		con1 = readl_relaxed(pll->con_reg + 0x4);
 	con1 &= ~((PLL46XX_KDIV_MASK << PLL46XX_KDIV_SHIFT) |
 			(PLL46XX_MFR_MASK << PLL46XX_MFR_SHIFT) |
 			(PLL46XX_MRR_MASK << PLL46XX_MRR_SHIFT));
@@ -873,7 +884,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, unsigned long drate,
 	/* Write configuration to PLL */
 	writel_relaxed(lock, pll->lock_reg);
 	writel_relaxed(con0, pll->con_reg);
-	writel_relaxed(con1, pll->con_reg + 0x4);
+	if (pll->type == pll_1061x)
+		writel_relaxed(con1, pll->con_reg + 0xc);
+	else
+		writel_relaxed(con1, pll->con_reg + 0x4);
 
 	/* Wait for PLL lock */
 	return samsung_pll_lock_wait(pll, PLL46XX_LOCKED);
@@ -1703,6 +1717,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_4650:
 	case pll_4650c:
 	case pll_1460x:
+	case pll_1061x:
 		if (!pll->rate_table)
 			init.ops = &samsung_pll46xx_clk_min_ops;
 		else
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index d6eb3246611b..44f5e99d303d 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -45,6 +45,7 @@ enum samsung_pll_type {
 	pll_531x,
 	pll_1051x,
 	pll_1052x,
+	pll_1061x,
 	pll_0717x,
 	pll_0718x,
 	pll_0732x,

-- 
2.54.0


