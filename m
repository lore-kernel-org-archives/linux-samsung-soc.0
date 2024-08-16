Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0513BC11;
	Fri, 16 Aug 2024 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723830854; cv=none; b=ccxMPgFRga9UVz7tnbm8Dsmt964e3WQDgtgrPeK7FczDVxxy4ObHP3iqtZgSe/ZahnctY6ucXA5UAICWKX2fwa//235rZ9xr8n9VdwlSksBw0B/s4d+ex5KS6UU8nxB9BNbPJAwu/rwNkQZOvaqQWravYGGmwuxSbnS7jyt+lT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723830854; c=relaxed/simple;
	bh=fOT+2RH0b2NeZzP27R+TY1UCyUhHuazKUQl6EroAhqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+HIYyPIBc1cXzAL3I4GSUhCQVTUtiknveZtkhBOZ/1pytQFObiiU5xn60WUMXUkF8vERVshy730Fn1jpnB2wxS9QIUHuGiJf1Ufe8mpFiU9glrbCjdAsFFvUcqXNHjERzyIDOsbvvXfOi6nbAhJZmI76XRhHIQdx1hvFueQTFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7nbNrEJ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7nbNrEJ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bec4fc82b0so2909940a12.1;
        Fri, 16 Aug 2024 10:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723830851; x=1724435651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYjogMBtNSopjmDaf3XCuzNg5vZISggYzr30XJ9QRhI=;
        b=T7nbNrEJyWuRaAJ4sqEA+DGPhFyz1rFTwIqhSI6PD1b3LOgiltpr8gF4zYWQmo3mHI
         Z0n0rag93Y47hADzXbj1zYMrdZcltaRIR2jrE+IBiR61z9dN+2vCqwnjgVx6D4YVL5Le
         7rOJ956eBnqGOZosOHafQWaRiwhe/IkD2qvS7nIfp17/xPUvWt2Dv9DVFQLEhk3IQBpQ
         o8T/4+O5J4L430TLOXZfKq52Xfyk0HSZ8WBozaakf0u9wA8yaROs0op1+8mZws3HI9mw
         78NLiXmyc9F5sXsie22o0PKgYMk5X0YwluW9ilsY1XsadVLJr7E9bI51wqWbfEy3JgIq
         KFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723830851; x=1724435651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYjogMBtNSopjmDaf3XCuzNg5vZISggYzr30XJ9QRhI=;
        b=ckGC3BVWAn9Mstb7XdQ0SQDRmX+PUvwppyYqsiWms3ZegsJV9QzzrCxl+eyPzDq5Jl
         g9jfWwB9ttOtGfBUje862GeYa6IU0EExENk9Pat1SAjZeqSH2dcto6LkWWg1oFGGxzld
         PORGLE25KQUVfi8TytDWKYOhujBEx2vR6XvAYtPeD+JolKzdp0ujU+2XI8Yc6WBuSEE2
         TA7EfSc7MVsPD4dN1eYWR6XSjrCYnUxPPQveIDxTer+sqMd5mFBDb5vG2WzCmCNBV0me
         38YVzPDQqNEwYZv707S1pftv1/z0/GR8FJxVH9MzrLvaC5yHG7QKozUyhQoo9C27bI/b
         assg==
X-Forwarded-Encrypted: i=1; AJvYcCXUAkH3jqfioUc6oZdpe19cvefcySlgJgWtlXAXPSpmOyWmS3idlufXk7APBI8jbNpbYlu8CBIgauEENIliOfDQ7t2DyrIrEhrCzaf7rc4QoA0vW+HrjTzE9a9hPGx01rT0fWxQbrxJgpK/pSxw8vJl9myBgD43KstW79uLlnVGOOri6M9IRABOyRg=
X-Gm-Message-State: AOJu0YwJlHRrhCeY7BhkiKWDX6bm/eiMy1GkOELLMHTbcuJlRUvt4pdP
	ekQ0SO2e67KMEsYhXuIBkZ3hy1LxjQx/OJwO7ZOq+iSkGh4jvlOK
X-Google-Smtp-Source: AGHT+IEhrh56okZbmvy9C8HwDNy5xwpiZQq52uQq/hi8jnlhVoMry9g9W6uYptcJ6SG8XC/2yTyWnQ==
X-Received: by 2002:a17:907:7d8b:b0:a77:c051:36a9 with SMTP id a640c23a62f3a-a8394dc741bmr339367066b.9.1723830850657;
        Fri, 16 Aug 2024 10:54:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a83838c66b6sm290520866b.16.2024.08.16.10.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 10:54:10 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: David Virag <virag.david003@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] clk: samsung: clk-pll: Add support for pll_1418x
Date: Fri, 16 Aug 2024 19:50:31 +0200
Message-ID: <20240816175034.769628-2-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816175034.769628-1-virag.david003@gmail.com>
References: <20240816175034.769628-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pll1418x is used in Exynos7885 SoC for USB PHY clock.
Operation-wise it is very similar to pll0822x, except that MDIV is only
9 bits wide instead of 10, and we use the CON1 register in the PLL
macro's "con" parameter instead of CON3 like this:

	PLL(pll_1418x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
	    PLL_LOCKTIME_PLL_USB, PLL_CON0_PLL_USB,
	    pll_usb_rate_table),

Technically the PLL should work fine with pll0822x code if the PLL
tables are correct, but it's more "correct" to actually update the mask.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

Changes in v3:
  - Simplify set_rate part

 drivers/clk/samsung/clk-pll.c | 18 +++++++++++++++---
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4be879ab917e..4307cd534ee6 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -430,6 +430,9 @@ static const struct clk_ops samsung_pll36xx_clk_min_ops = {
 #define PLL0822X_LOCK_STAT_SHIFT	(29)
 #define PLL0822X_ENABLE_SHIFT		(31)
 
+/* PLL1418x is similar to PLL0822x, except that MDIV is one bit smaller */
+#define PLL1418X_MDIV_MASK		(0x1FF)
+
 static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
@@ -438,7 +441,10 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_con3 = readl_relaxed(pll->con_reg);
-	mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
+	if (pll->type != pll_1418x)
+		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL0822X_MDIV_MASK;
+	else
+		mdiv = (pll_con3 >> PLL0822X_MDIV_SHIFT) & PLL1418X_MDIV_MASK;
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
@@ -456,7 +462,12 @@ static int samsung_pll0822x_set_rate(struct clk_hw *hw, unsigned long drate,
 {
 	const struct samsung_pll_rate_table *rate;
 	struct samsung_clk_pll *pll = to_clk_pll(hw);
-	u32 pll_con3;
+	u32 mdiv_mask, pll_con3;
+
+	if (pll->type != pll_1418x)
+		mdiv_mask = PLL0822X_MDIV_MASK;
+	else
+		mdiv_mask = PLL1418X_MDIV_MASK;
 
 	/* Get required rate settings from table */
 	rate = samsung_get_pll_settings(pll, drate);
@@ -468,7 +479,7 @@ static int samsung_pll0822x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	/* Change PLL PMS values */
 	pll_con3 = readl_relaxed(pll->con_reg);
-	pll_con3 &= ~((PLL0822X_MDIV_MASK << PLL0822X_MDIV_SHIFT) |
+	pll_con3 &= ~((mdiv_mask << PLL0822X_MDIV_SHIFT) |
 			(PLL0822X_PDIV_MASK << PLL0822X_PDIV_SHIFT) |
 			(PLL0822X_SDIV_MASK << PLL0822X_SDIV_SHIFT));
 	pll_con3 |= (rate->mdiv << PLL0822X_MDIV_SHIFT) |
@@ -1317,6 +1328,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			init.ops = &samsung_pll35xx_clk_ops;
 		break;
 	case pll_1417x:
+	case pll_1418x:
 	case pll_0818x:
 	case pll_0822x:
 	case pll_0516x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index ffd3d52c0dec..1efbe4c446d0 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -30,6 +30,7 @@ enum samsung_pll_type {
 	pll_2650x,
 	pll_2650xx,
 	pll_1417x,
+	pll_1418x,
 	pll_1450x,
 	pll_1451x,
 	pll_1452x,
-- 
2.46.0

