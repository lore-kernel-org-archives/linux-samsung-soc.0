Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F12F1C5CCC
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733755745; cv=none; b=nC7H36G8XSabOcXgaM+PyqGy/A3w4doq5xPtxhyy84eIrPx3dmdTX+jZKcZ6Ymbwx5yhnmgblCqds4xMsmEJMJ+JKm0K2WwIBWg1Yvxdveirvi1Kq4ElZPDB98iiqlhqaSk2tucPffNY8I7VrcIXefDaBlS/Ie8AqdVT67S1pfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733755745; c=relaxed/simple;
	bh=MXQb7MHpgBulLftpol9O2MJH0kLaSQxWBG4hQ+IsTUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZK8TAWYJR2mXbX5huP4gIvCSZy45YPkJp+Ae4J//rA5rYfNzQBLeDZgUe+evT6N/qqKRV256Xq4aaQmToHl97+L4kwxlZ/RhErlH2S/h+ARxlOwkIIG2/jBXNpttMy6YH8q52ThNk30WxGc1p5z1WzrL/ViM/AoGUi1sWFn0arE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=NnwUB1H0; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="NnwUB1H0"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=NnwUB1H0+eOsyH3nEpRadkNc+0K5RiawH413caspIdzNjULqqehrCbc4sTiIJqZzHI4TgvHFJuyzimKLe6vWk35OhS1Cpi0qT7XjNf5VmtJqwDTSRUn7PpO9xI6wv5TcERSdMIXhV9KOVwGisfH/EfF1LekvjG7MEfLmKL0AjDoZxW0tq2xACZ08E7Jhitp3K7ghMqfigcl8Ta9+HYdhhSdjIkSW4XtoYB2lYDjZp5UeRiqYg5VhqAxcf5wPOhxtiKN0vxUM893eqEU2jqVNbr44zU8wGq24dZzmsNN8njLOw7vrd3Da/GtTrsOjl8wCkgR0tMG63Y2fQ4wKDgu4Zg==; s=purelymail2; d=purelymail.com; v=1; bh=MXQb7MHpgBulLftpol9O2MJH0kLaSQxWBG4hQ+IsTUI=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -291099510;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 09 Dec 2024 14:48:41 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 09 Dec 2024 15:45:22 +0100
Subject: [PATCH v4 2/3] clk: samsung: clk-pll: Add support for pll_{0717x,
 0718x, 0732x}
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-exynos990-cmu-v4-2-57f07080f9e4@mentallysanemainliners.org>
References: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
In-Reply-To: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733755636; l=2550;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=MXQb7MHpgBulLftpol9O2MJH0kLaSQxWBG4hQ+IsTUI=;
 b=Zxb3zzE+bb93vB8o3ttDQIAZzHVziDKdoXOGiP0HiPIypDhGHn00QRlGgBzegbfqTAYScAPgc
 o9KiOO7ulLxBCyyGpJ//k06mc4s84rVniOHAvB6Ng3ef/4J1J6u4Fmx
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

