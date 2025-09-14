Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0772E62C0
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884781; cv=none; b=swW3Q2UldsS4Zu184vA9RNSopbp7/AAA/N/w/dEv/79r4m+amPwg84YAmsi9MJvLYO6Ih+Z8OG8mKOFZJzsb8G9IGb14BP6SAcoXNiqalIMoVXG01b7E+jp0qMhP0cm7oW+5ENpaSyaFiSl6mnKPPA+3xZBbR25z4YJaEHfTvDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884781; c=relaxed/simple;
	bh=8+/ClMG+St9z3suvo/tgfd92vbMs5WQGeMQbpIM/M6o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjdIQzncvipOgdigr4U/kkPyCdZUocDa+sgOHt6dcf2eGf3wC8ZZNiRBUW88quINhClMlFhPfTi+/WqXDRx8pIAjXOoJcskbqFsK7thD1KitrdP9dm5xFaJUYTssVQTxpgy1ZfGgoz90hdBcKAFNwIFoUxlWki/2gHoF3kSg/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=UBGsRiN2; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="UBGsRiN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884777; x=1758143977;
	bh=PZnRAM4NTUz6a26lNJhwUr/8t1nxItg9+fBTr6Z/4EU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UBGsRiN2nzuLcOyns1Y86gZJXqGKtNegR3F0Hach2xDu+G70kN9Fhr5yVKuJ+XBev
	 nK9lX7kwJ0wsgotJ5G4mNcWtw97njHO8sARr1fPAqv5mw8gQeRW3fKfg3W688no0WB
	 iNKal8o/SJ0sSxjXLEgJD/fwSttSXKnqPDHdAlmaPubt6IB4cKDsxloj0qvmc+g8qY
	 5K/jHL6UVikosb38KiukKZCioxhwihDJoYHXiiZloedznpR8vk3t74059p1UKUn5ye
	 K/iqvwGnO9yGFqNxdzTVQcBmyn3T0KCrIASfJD8hTJPN2LJwWsp0+h4y31/XWxqHVN
	 tN1wsm2E1TMQg==
Date: Sun, 14 Sep 2025 21:19:32 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/8] clk: samsung: clk-pll: Add support for pll_1061x
Message-ID: <20250915-exynos9610-clocks-v1-2-3f615022b178@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: a7b2c46f0923d45efb9cf8f71e4a6d359616d4be
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These PLLs are found in the Exynos9610 and Exynos9810 SoCs, and
are similar to pll_1460x, so the code for that can handle this
PLL with a few small adaptations.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/clk/samsung/clk-pll.c | 29 ++++++++++++++++++++++-------
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 7bea7be1d7e45c32f0b303ffa55ce9cde4a4f71d..5fa553eab8e4b53a8854848737f=
619ef6a9c645a 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -785,15 +785,20 @@ static unsigned long samsung_pll46xx_recalc_rate(stru=
ct clk_hw *hw,
 =09u64 fvco =3D parent_rate;
=20
 =09pll_con0 =3D readl_relaxed(pll->con_reg);
-=09pll_con1 =3D readl_relaxed(pll->con_reg + 4);
-=09mdiv =3D (pll_con0 >> PLL46XX_MDIV_SHIFT) & ((pll->type =3D=3D pll_1460=
x) ?
+=09if (pll->type =3D=3D pll_1061x)
+=09=09pll_con1 =3D readl_relaxed(pll->con_reg + 12);
+=09else
+=09=09pll_con1 =3D readl_relaxed(pll->con_reg + 4);
+=09mdiv =3D (pll_con0 >> PLL46XX_MDIV_SHIFT) & (((pll->type =3D=3D pll_146=
0x)
+=09=09=09=09|| (pll->type =3D=3D pll_1061x)) ?
 =09=09=09=09PLL1460X_MDIV_MASK : PLL46XX_MDIV_MASK);
 =09pdiv =3D (pll_con0 >> PLL46XX_PDIV_SHIFT) & PLL46XX_PDIV_MASK;
 =09sdiv =3D (pll_con0 >> PLL46XX_SDIV_SHIFT) & PLL46XX_SDIV_MASK;
 =09kdiv =3D pll->type =3D=3D pll_4650c ? pll_con1 & PLL4650C_KDIV_MASK :
 =09=09=09=09=09pll_con1 & PLL46XX_KDIV_MASK;
=20
-=09shift =3D ((pll->type =3D=3D pll_4600) || (pll->type =3D=3D pll_1460x))=
 ? 16 : 10;
+=09shift =3D ((pll->type =3D=3D pll_4600) || (pll->type =3D=3D pll_1460x)
+=09=09 || (pll->type =3D=3D pll_1061x)) ? 16 : 10;
=20
 =09fvco *=3D (mdiv << shift) + kdiv;
 =09do_div(fvco, (pdiv << sdiv));
@@ -831,7 +836,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw,=
 unsigned long drate,
 =09}
=20
 =09con0 =3D readl_relaxed(pll->con_reg);
-=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
+=09if (pll->type =3D=3D pll_1061x)
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0xc);
+=09else
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
=20
 =09if (!(samsung_pll46xx_mpk_change(con0, con1, rate))) {
 =09=09/* If only s change, change just s value only*/
@@ -849,7 +857,7 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw, =
unsigned long drate,
 =09=09lock =3D 0xffff;
=20
 =09/* Set PLL PMS and VSEL values. */
-=09if (pll->type =3D=3D pll_1460x) {
+=09if ((pll->type =3D=3D pll_1460x) || (pll->type =3D=3D pll_1061x)) {
 =09=09con0 &=3D ~((PLL1460X_MDIV_MASK << PLL46XX_MDIV_SHIFT) |
 =09=09=09(PLL46XX_PDIV_MASK << PLL46XX_PDIV_SHIFT) |
 =09=09=09(PLL46XX_SDIV_MASK << PLL46XX_SDIV_SHIFT));
@@ -866,7 +874,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw,=
 unsigned long drate,
 =09=09=09(rate->sdiv << PLL46XX_SDIV_SHIFT);
=20
 =09/* Set PLL K, MFR and MRR values. */
-=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
+=09if (pll->type =3D=3D pll_1061x)
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0xc);
+=09else
+=09=09con1 =3D readl_relaxed(pll->con_reg + 0x4);
 =09con1 &=3D ~((PLL46XX_KDIV_MASK << PLL46XX_KDIV_SHIFT) |
 =09=09=09(PLL46XX_MFR_MASK << PLL46XX_MFR_SHIFT) |
 =09=09=09(PLL46XX_MRR_MASK << PLL46XX_MRR_SHIFT));
@@ -877,7 +888,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw,=
 unsigned long drate,
 =09/* Write configuration to PLL */
 =09writel_relaxed(lock, pll->lock_reg);
 =09writel_relaxed(con0, pll->con_reg);
-=09writel_relaxed(con1, pll->con_reg + 0x4);
+=09if (pll->type =3D=3D pll_1061x)
+=09=09writel_relaxed(con1, pll->con_reg + 0xc);
+=09else
+=09=09writel_relaxed(con1, pll->con_reg + 0x4);
=20
 =09/* Wait for PLL lock */
 =09return samsung_pll_lock_wait(pll, PLL46XX_LOCKED);
@@ -1563,6 +1577,7 @@ static void __init _samsung_clk_register_pll(struct s=
amsung_clk_provider *ctx,
 =09case pll_4650:
 =09case pll_4650c:
 =09case pll_1460x:
+=09case pll_1061x:
 =09=09if (!pll->rate_table)
 =09=09=09init.ops =3D &samsung_pll46xx_clk_min_ops;
 =09=09else
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6c8bb7f26da5436dfccae89a95d1b0025f7f3e0b..7f36d1d03dcf5888027ce9b6f75=
ccc9a7a135be2 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -45,6 +45,7 @@ enum samsung_pll_type {
 =09pll_531x,
 =09pll_1051x,
 =09pll_1052x,
+=09pll_1061x,
 =09pll_0717x,
 =09pll_0718x,
 =09pll_0732x,

--=20
2.47.3


