Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6D79CC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2024 01:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720660411; cv=none; b=JiI9Es3CrJEEby5aNZIjHR0tjgKv2Gpbw9NIq9ytKNWn6P1r8ovECpMcTDxEsJnFj4mSos5+Bo6AC8qvlbXPk/ribercWczHA0M5J6RADaEyrJFYQPhcoJ4iFrmcq8h1n0PgiI0gkodii3rBTvzZo3pM+sKNMGuPOTK9DkPJiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720660411; c=relaxed/simple;
	bh=XGSxQ3pZwkEUe2zZU8xieqWWeu7ugX1Kzsyl73kXv1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=sVI3SYjRRVQzJp+VF0rG/2iOkz7KnpBxIsV/p6IywJpC5N9IhMoDUfOFAIDYoclmkIhsOwgArZocFejQobNpijDJeTY6zsaQIYUdZGdCh0QT9ksA2QpzewAfQyuI7gVI/sl6CMSxHW5kMDEs8LOLch1NXnNvjgbWA8+Qp1V9yM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LGaeq+aS; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LGaeq+aS"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240711011326epoutp03d32b30a70600d412253648d21c77c623~hA4XYb4qp1017810178epoutp03N
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2024 01:13:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240711011326epoutp03d32b30a70600d412253648d21c77c623~hA4XYb4qp1017810178epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720660406;
	bh=EqOR8VNGXlKi9esLGoLJ/pwc0hcA7y72iJKk54dGE1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGaeq+aStenSE8bAto60GJnroI1xtg8z91bf3gmrf95HUixBGpL4N4DB6j35Hp5YO
	 KxCmG58FoGHKmDVaRWQvXDWxTXnXMueu6VRwFH5w8hPZUu6zUdfz8Ob9D1mH9GEM1A
	 ytJWHKYTL5y/aFO2Qhy6ur+xuht4KaqciQH7zDbQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240711011325epcas2p373bcee920e645985f1f0229af67490cc~hA4W2dGZF1932619326epcas2p3k;
	Thu, 11 Jul 2024 01:13:25 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.100]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WKGv90kZ2z4x9Q0; Thu, 11 Jul
	2024 01:13:25 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	2E.F6.09806.4B13F866; Thu, 11 Jul 2024 10:13:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240711011324epcas2p1820b1d21b8aae26c6047ee07d23ce8fa~hA4WE5nOk3172531725epcas2p1F;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240711011324epsmtrp22ddc9ca951a28f09fb7fbdb3b1e3f080~hA4WEE3Vp0825708257epsmtrp2v;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
X-AuditID: b6c32a47-c6bff7000000264e-ac-668f31b436cb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CD.65.29940.4B13F866; Thu, 11 Jul 2024 10:13:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240711011324epsmtip26b42092294c795729ddc6a1983b2472f~hA4VxKQXl0460704607epsmtip2K;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v3 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Thu, 11 Jul 2024 10:13:15 +0900
Message-ID: <20240711011316.2713270-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711011316.2713270-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmue4Ww/40g9YOG4sH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1qhsm4zUxJTUIoXUvOT8lMy8
	dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygO5UUyhJzSoFCAYnFxUr6djZF+aUl
	qQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RlrZ19hKvgkVvF83VnWBsYG
	4S5GDg4JAROJdUsCuxi5OIQEdjBK/Nq7ihXC+cQoceVEA3sXIyeQ841RYubaehAbpOHV56ts
	EEV7GSWerzzGDuF8ZJTo+7GDHWQsm4CuxJ9/DiBxEYE9TBJbzi9hAnGYBc4yStydswCsSFjA
	XWLO2UqQqSwCqhJHDlxnBLF5Bewl5h5axwqxTV7i4prnbCA2p4CDxKYra5ghagQlTs58wgJi
	MwPVNG+dzQwyX0JgLofEhM7DUM0uEitnzmSDsIUlXh3fwg5hS0l8frcXKp4vMfn6WyaI5gZG
	iWv/upkhEvYSi878BDuUWUBTYv0ufUh4KUscuQW1l0+i4/Bfdogwr0RHmxBEo5rEpyuXoYbI
	SBw78QzK9pDouHOEERJWkxklLk4+yzqBUWEWkndmIXlnFsLiBYzMqxjFUguKc9NTi40KjOER
	nJyfu4kRnGy13Hcwznj7Qe8QIxMH4yFGCQ5mJRHe+Te604R4UxIrq1KL8uOLSnNSiw8xmgID
	eyKzlGhyPjDd55XEG5pYGpiYmRmaG5kamCuJ895rnZsiJJCeWJKanZpakFoE08fEwSnVwLRB
	xDpMPPoZP9PNRVWOYks3H1nAvGEa08roOykrY6urxWav+MeV9lWybtV+2T+L605Y339yYdF1
	j6UyShNesicsL1/tanPtX9f9I5WS3XuWbPe3U022CZx0u2nBmbCVcnM861Zfb5/aeC+ortFI
	P8Vgk6H47u1Flzf/zOawMjy9Rif2zS/Xd0d6pp3eOW2JiBmj+7ovTpF6b5SvP0qU3vLhlJ4k
	y4GVs6ba1KfLHN++4uRK6Yf/EiQFtrtZfwzuYtN/W91yfUlN4aeCj/KFV6XW+Iln+05cd9uP
	o+bIwzOWqpe9DsV6++x1/rBT+fmp1JI3ms3vF+9iVM1V+Z9q3P9PKGI3j3Xs6Y2/N967/DFc
	iaU4I9FQi7moOBEATB6DvD8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvO4Ww/40g11HpC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MtbO
	vsJU8Ems4vm6s6wNjA3CXYycHBICJhKvPl9l62Lk4hAS2M0ocf3/QjaIhIzExob/7BC2sMT9
	liOsEEXvGSXeTpsFlODgYBPQlfjzzwEkLiJwiEli4uenLCAOs8BlRoljdyczgxQJC7hLzDlb
	CTKIRUBV4siB64wgNq+AvcTcQ+tYIRbIS1xc8xxsMaeAg8SmK2uYQWwhoJpNK9+zQtQLSpyc
	+YQFxGYGqm/eOpt5AqPALCSpWUhSCxiZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525i
	BEeGluYOxu2rPugdYmTiYDzEKMHBrCTCO/9Gd5oQb0piZVVqUX58UWlOavEhRmkOFiVxXvEX
	vSlCAumJJanZqakFqUUwWSYOTqkGptSMyRPOnuKK/J7oEhOZ4bYz7+XNMIUvFpnZsn6Mtzuq
	X7x9qSw+u0Yk16+UO/noSt7O4heheY877hxxn80r4bZ3qyrPlTfBzmu1Kls12WeU6kb96dyz
	bNkbm3TjZBe9n2sd0lY+5fa79n7j6cTZ++6wrX2QvMs7cZ5Sv8ydxPL41+fDDffkVnJ9Lu3f
	G5H+7vPd1ENrzr9Wau3VE9nUq+WbcK7j5fdFp59xPXqloLss/vj3SXK9Zgoxyh5536Zxvuo4
	dTgmytFVQ/OH7WXnezpCh06HtT/aWOcS6LdjoeKxp9F/btmpyee0GFYq+rfXJK35w1T04c9e
	Zg3huXPfyFRbmL/OlS+IaP/349QkJZbijERDLeai4kQAxs+SQPsCAAA=
X-CMS-MailID: 20240711011324epcas2p1820b1d21b8aae26c6047ee07d23ce8fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240711011324epcas2p1820b1d21b8aae26c6047ee07d23ce8fa
References: <20240711011316.2713270-1-sunyeal.hong@samsung.com>
	<CGME20240711011324epcas2p1820b1d21b8aae26c6047ee07d23ce8fa@epcas2p1.samsung.com>

pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
pll531x: Integer/fractional PLL with mid frequency FVCO (800 to 3120 MHz)

PLL531x
FOUT = (MDIV x FIN)/(PDIV x 2^SDIV) for integer PLL
FOUT = (MDIV + F/2^32-F[31]) x FIN/(PDIV x 2^SDIV) for fractional PLL

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 45 +++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 46 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4be879ab917e..b3bcef074ab7 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1261,6 +1261,48 @@ static const struct clk_ops samsung_pll2650xx_clk_min_ops = {
 	.recalc_rate = samsung_pll2650xx_recalc_rate,
 };
 
+/*
+ * PLL531X Clock Type
+ */
+/* Maximum lock time can be 500 * PDIV cycles */
+#define PLL531X_LOCK_FACTOR		(500)
+#define PLL531X_MDIV_MASK		(0x3FF)
+#define PLL531X_PDIV_MASK		(0x3F)
+#define PLL531X_SDIV_MASK		(0x7)
+#define PLL531X_FDIV_MASK		(0xFFFF)
+#define PLL531X_MDIV_SHIFT		(16)
+#define PLL531X_PDIV_SHIFT		(8)
+#define PLL531X_SDIV_SHIFT		(0)
+
+static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 mdiv, pdiv, sdiv, pll_con0, pll_con8;
+	s32 fdiv;
+	u64 fout = parent_rate;
+
+	pll_con0 = readl_relaxed(pll->con_reg);
+	pll_con8 = readl_relaxed(pll->con_reg + 20);
+	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
+	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
+	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
+	fdiv = (s32)(pll_con8 & PLL531X_FDIV_MASK);
+
+	if (fdiv >> 31)
+		mdiv--;
+
+	fout *= ((u64)mdiv << 24) + (fdiv >> 8);
+	do_div(fout, (pdiv << sdiv));
+	fout >>= 24;
+
+	return (unsigned long)fout;
+}
+
+static const struct clk_ops samsung_pll531x_clk_ops = {
+	.recalc_rate = samsung_pll531x_recalc_rate,
+};
+
 static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 				const struct samsung_pll_clock *pll_clk)
 {
@@ -1394,6 +1436,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		else
 			init.ops = &samsung_pll2650xx_clk_ops;
 		break;
+	case pll_531x:
+		init.ops = &samsung_pll531x_clk_ops;
+		break;
 	default:
 		pr_warn("%s: Unknown pll type for pll clk %s\n",
 			__func__, pll_clk->name);
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index ffd3d52c0dec..ce9d6f21f993 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -41,6 +41,7 @@ enum samsung_pll_type {
 	pll_0516x,
 	pll_0517x,
 	pll_0518x,
+	pll_531x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.45.2

