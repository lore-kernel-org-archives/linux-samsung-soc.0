Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E720FA85;
	Fri,  6 Dec 2024 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733501642; cv=none; b=Bfow6ErPVzQdX0Bcd3yIMtMNdybsfBgVCJRm3r/4jlQ95Knw3hsbxGb7RpIWtRMvZQ3ry4hyB0JbBFlbybl6L8P/oLuAyUCUoere93ltTWwY2MRj2x3PVoXncNoLYyjlKW8YfrAW138VnpvnKwqD53mqpfsxDJSPYfI1/YqPL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733501642; c=relaxed/simple;
	bh=MXQb7MHpgBulLftpol9O2MJH0kLaSQxWBG4hQ+IsTUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9Jud8zGlYdu8Z4KhwEDYskCAcBVWe0q3OftkjoJdu+4FJA1X98nbhM4UA+Jf2PNnKhsxruuO87DGJLeKewh3fMrCyKXoWKanOJza+WNA2ILe/uP42x7iTYsXJ6FQoBobj9W4dMbMXfseTGUfyG8rMigW6wQMcBv5mYhTMuGxHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=gNjqE4UF; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="gNjqE4UF"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4bsz2rpXz4w9K;
	Fri, 06 Dec 2024 16:13:59 +0000 (UTC)
Received: from [127.0.1.1] (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4bsq31Ccz2x9C;
	Fri,  6 Dec 2024 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733501634;
	bh=MXQb7MHpgBulLftpol9O2MJH0kLaSQxWBG4hQ+IsTUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gNjqE4UFJrSM9qdasCZXnz87yqSyUnyd2//JmBKT6IPQyaKFdLhxvaG3p2bUMC4sA
	 6CvgLlc9uAdCEvWmEScXIc2KLlEULSNIE7E+SKWdvDkin7dvcBHQWKZ2UZnETsXuks
	 t0QQSouD++nU+E0dJAL8zijqSPtEm/yHQ2FzXOAB1R3mErADLIgHn6fj+8hL/ahlo8
	 w6Sq7BvoQOppWH+4rQ5mYl8mkKHY0L8zRw4TZTM0Pff7FsCmsHU1s0MyKpjrgBOh+6
	 rf07/ePmA1d8n9UxybORpHiK8qvbwcEV0W78SMNdbzM1ROojnkxSAgI84LC4RHSzqv
	 YHg1OOABtnCqg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 06 Dec 2024 17:12:19 +0100
Subject: [PATCH v2 2/3] clk: samsung: clk-pll: Add support for pll_{0717x,
 0718x, 0732x}
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-exynos990-cmu-v2-2-4666ff0a099b@mentallysanemainliners.org>
References: <20241206-exynos990-cmu-v2-0-4666ff0a099b@mentallysanemainliners.org>
In-Reply-To: <20241206-exynos990-cmu-v2-0-4666ff0a099b@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733501552; l=2550;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=MXQb7MHpgBulLftpol9O2MJH0kLaSQxWBG4hQ+IsTUI=;
 b=VU41m1+334DL4xde/g7rs4dtSSiHHtqVt0jew5Ic+URv2mFkRFMSeKs3Fwn7ZzbLOS8P1p24M
 lR8b71f+lS1BN5IMwSUSXP8pf14bljGiuCK2Y0vOC2J/enQFYkU97pp
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

These PLLs are found in the Exynos990 SoC. The PLLs are similar
to pll0822x.

pll0717x and pll0718x are an exception, and they use the mdiv
mask from 1718X (that is, one bit smaller).

Apart from that, the masks/shifts are identical to those of 0822x.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/clk/samsung/clk-pll.c | 14 ++++++++++++--
 drivers/clk/samsung/clk-pll.h |  3 +++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index be6b516949193f103696c814b5cffad5d4ea9a66..2e94bba6c3966b9470f0ef42ad101ee3da0519b9 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -430,7 +430,10 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
 #define PLL0822X_LOCK_STAT_SHIFT	(29)
 #define PLL0822X_ENABLE_SHIFT		(31)
 
-/* PLL1418x is similar to PLL0822x, except that MDIV is one bit smaller */
+/*
+ * PLL1418x, PLL0717x and PLL0718x are similar
+ * to PLL0822x, except that MDIV is one bit smaller
+ */
 #define PLL1418X_MDIV_MASK		(0x1FF)
 
 static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
@@ -441,10 +444,14 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con3 = readl_relaxed(pll->con_reg);
-	if (pll->type != pll_1418x)
+
+	if (pll->type != pll_1418x &&
+	    pll->type != pll_0717x &&
+	    pll->type != pll_0718x)
 		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
 	else
 		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL1418X_MDIV_MASK;
+
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
@@ -1377,6 +1384,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_0516x:
 	case pll_0517x:
 	case pll_0518x:
+	case pll_0717x:
+	case pll_0718x:
+	case pll_0732x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 858ab367eb6552bf880ef9d14cd89713b08960a4..6ddc54d173a01e201d93f1ed1679ca6a6ebfa939 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -45,6 +45,9 @@ enum samsung_pll_type {
 	pll_531x,
 	pll_1051x,
 	pll_1052x,
+	pll_0717x,
+	pll_0718x,
+	pll_0732x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \

-- 
2.45.2

