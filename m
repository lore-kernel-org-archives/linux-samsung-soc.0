Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555918E766
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323554; cv=none; b=jMXcYzW4Iz3cCeRvs/zoRP6y/qmvOhySNNMF7OkijV/Ybh4dTf846H3888WInqZl2LeCyla4pzd9u61PCPg01bZup9X6EwkLe4pxDclnZ7/TrZY4fSU+17N9THFKBCK62pLmI0JB/yDNWVhyE+HaPRHV5/hS3/GOFmbqi+otPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323554; c=relaxed/simple;
	bh=jPs5bhw2LqCImzZAB/9qt6gALyVn6+cFOa2QwNPKjzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=i+898I85eZNymRetm/YOqR3qP8bRVEP3E2U0AJw4n0zuhHSvJq+c2UM2hNgjHPuAuyS4nnfvjPCI5151TIE3bz3JDex+3sixh5oucKuIuYEKQLfcj4lbUJup9qChc6ODersuqpq/uAppypq+b95nC3ElazXZgMtM/000yQQm9ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ptyK6prT; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ptyK6prT"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240730071229epoutp0124216397db0719f175b26e574d48c67f~m7CSY-QGk2294022940epoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240730071229epoutp0124216397db0719f175b26e574d48c67f~m7CSY-QGk2294022940epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722323549;
	bh=hoicPC/VzmDis71v8IRNcpF+6JTBo0KNNr3/qD2gd+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ptyK6prT9RRAWNv1w7yocRYj6vadTOD4p3VxA+zkvzkVObcakkKRbzeNOJKeNjlII
	 bzyfBRL6BI/alqCfGb/8L0YIXqcxmutoIGyjpDFooF4wZomCPVyDi39t7+L5X/a2gk
	 bRqeSu4nq3LwR0T1pQIrTi7ahyydNdpzEuu/hdQc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240730071228epcas2p399eb8d1654447762f3732e533287cff5~m7CRx5qJK0692706927epcas2p3C;
	Tue, 30 Jul 2024 07:12:28 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WY5yh3HGPz4x9Q3; Tue, 30 Jul
	2024 07:12:28 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.D5.10431.C5298A66; Tue, 30 Jul 2024 16:12:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epcas2p356635cf71f4d652be2bfa733c8b5848e~m7CRA_RkY0692706927epcas2p3-;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730071227epsmtrp1d8c50f25c45d41a272ddc0de2e5589ae~m7CRAMkSE1008010080epsmtrp1M;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
X-AuditID: b6c32a45-ffffa700000028bf-c4-66a8925cb2cf
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A8.4B.08964.B5298A66; Tue, 30 Jul 2024 16:12:27 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epsmtip298183ce0431a94e4d92c1110c1aab7e5~m7CQx-izC0427904279epsmtip2V;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v5 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Tue, 30 Jul 2024 16:12:20 +0900
Message-ID: <20240730071221.2590284-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmmW7MpBVpBosOi1g8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7ofXqFteCpWMXMF7oNjN+E
	uhg5OCQETCQ+Hs/pYuTiEBLYwSgxc8MFpi5GTiDnE6PEwkuKEIlvjBLPjn1jBEmANJx6uJwd
	IrGXUeLimvWMEB0fGSVOvlEHmcomoCvx558DSI2IwB4miS3nlzCBOMwCZxkl7s5ZwA7SICzg
	LjHvxWQWEJtFQFVifv9RsDivgL1E76t5zBDb5IEWPGcDsTkFHCQOfJzHAlEjKHFy5hMwmxmo
	pnnrbGaQBRICMzkkLnZ9g2p2kZg+o4cNwhaWeHV8CzuELSXxsr8Nys6XmHz9LRNEcwOjxLV/
	3VDN9hKLzvxkB3mHWUBTYv0ufUh4KUscuQW1l0+i4/Bfdogwr0RHmxBEo5rEpyuXoYbISBw7
	8QzK9pDomNrKCgmryYwSs56mTmBUmIXkm1lIvpmFsHcBI/MqRrHUguLc9NRiowJDePQm5+du
	YgQnWi3XHYyT337QO8TIxMF4iFGCg1lJhDf+ytI0Id6UxMqq1KL8+KLSnNTiQ4ymwLCeyCwl
	mpwPTPV5JfGGJpYGJmZmhuZGpgbmSuK891rnpggJpCeWpGanphakFsH0MXFwSjUwGSiJ+76T
	ncBsNZvNTdP0wtNlWwTEjvvtX+rwYXrWhDWdtlv+G/uuCcixmfo6qNRhX2RTvvUPjeIHPyLE
	2JY9UGZpfz/zxESnW7s25q7OWPrJ2+XtvZ4XsVe8Ze4XaO648/LAvxzhPv6aZa45fIXezV3t
	SQzLQ1cHbqo74JYyc3bUgV3zo04l5vrsvfsl9f0TnpnOt88YPNHjfnBI5ND2QvVdJpsvmRzc
	2Mq97FVnaFL3ooJTk87n2tmzn01cfyo5PGCa6E7/HyKZc4yVZL7vLX92zu6IcKv59bMvd/5S
	Tm9Uehq6eekSEc6/jO7BJTLiracib3nY8vyN3hLab9y8I8U2zEfg28Njj+Y42v20UmIpzkg0
	1GIuKk4EAANASfI9BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvG70pBVpBk92GFs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZfQ+
	vcJa8FSsYuYL3QbGb0JdjJwcEgImEqceLmfvYuTiEBLYzSixectDJoiEjMTGhv/sELawxP2W
	I6wQRe8ZJc4tvQnkcHCwCehK/PnnABIXETjEJDHx81MWEIdZ4DKjxLG7k5lBuoUF3CXmvZjM
	AmKzCKhKzO8/CjaVV8BeovfVPGaIDfISF9c8ZwOxOQUcJA58nAdWLwRU8775IjNEvaDEyZlP
	wOLMQPXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjODI
	0NLcwbh91Qe9Q4xMHIyHGCU4mJVEeOOvLE0T4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdF
	SCA9sSQ1OzW1ILUIJsvEwSnVwMQsFS8Rd8t9/u2dK8tPb62ymvLJy0rG/obsuy1bN3/hTZ3Q
	Eng8+eHuzot+V+craVnfjEpk2/nFOuouWwDbt1tvjfZw/b4rN7E06NXLlF9bVnAdb+v2eKgo
	fsPl+7yZBWEqgv/vdxgU/Q9SbklLZEkImWS7cu7r6/5GUb0x8RXqz3iPxd6V0nFNWcKhyi76
	sul5+YJei2KNg/8SHvHOK+qUy7ZeryzJ72e3Kvhy4WIRP8F1yhOms0ddDauq+cO8dFPzdC4J
	rWTt7ed2sM0JqVb6+97bYv25o6+Zkk/+axdi1qq8LvOhkz/ErkZyUkHz3p/GIbqirL+zVn4P
	+9N2cd65F++YZh7qkajmMOB6r8RSnJFoqMVcVJwIAKHcaTb7AgAA
X-CMS-MailID: 20240730071227epcas2p356635cf71f4d652be2bfa733c8b5848e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730071227epcas2p356635cf71f4d652be2bfa733c8b5848e
References: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
	<CGME20240730071227epcas2p356635cf71f4d652be2bfa733c8b5848e@epcas2p3.samsung.com>

pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
pll531x: Integer/fractional PLL with mid frequency FVCO (800 to 3120 MHz)

PLL531x
FOUT = (MDIV x FIN)/(PDIV x 2^SDIV) for integer PLL
FOUT = (MDIV + F/2^32-F[31]) x FIN/(PDIV x 2^SDIV) for fractional PLL

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 44 +++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 45 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 4be879ab917e..a6c81075417a 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1261,6 +1261,47 @@ static const struct clk_ops samsung_pll2650xx_clk_min_ops = {
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
+#define PLL531X_FDIV_MASK		(0xFFFFFFFF)
+#define PLL531X_MDIV_SHIFT		(16)
+#define PLL531X_PDIV_SHIFT		(8)
+#define PLL531X_SDIV_SHIFT		(0)
+
+static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 pdiv, sdiv, fdiv, pll_con0, pll_con8;
+	u64 mdiv, fout = parent_rate;
+
+	pll_con0 = readl_relaxed(pll->con_reg);
+	pll_con8 = readl_relaxed(pll->con_reg + 20);
+	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
+	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
+	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
+	fdiv = (pll_con8 & PLL531X_FDIV_MASK);
+
+	if (fdiv >> 31)
+		mdiv--;
+
+	fout *= (mdiv << 24) + (fdiv >> 8);
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
@@ -1394,6 +1435,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
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

