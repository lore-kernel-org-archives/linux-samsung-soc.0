Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEE03EA69
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724045068; cv=none; b=XNQ2/T4DiF80u+2gIMr3XlQfIJMDn1GqBqosE4zv2YscrZASpPgNKZqJqQvhDj+F/4D3Rg7W0uJkGO1gKxi4Qi8LRZ4hs9pB6z4RnUqn70CKrooT2etvHUvxd34tLYy3jDg6oRV+y9SfzVLpU4Veojh9L8Ybza12Oz8KUJiJx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724045068; c=relaxed/simple;
	bh=jPs5bhw2LqCImzZAB/9qt6gALyVn6+cFOa2QwNPKjzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=B5/BJH6erYe3tQnWv23+Ks140+mu3NEZLyZdK99E7bbgvfeDutK54kBmJdU7GUW7icymPdBRd/PMTTFld5SPvXNRUc1Dw3415dLSmxMaVBiA1ctD5G9CrJc8IuEcIOyP0poyk5lSdFBlhbDax/arTvOK8jlKZ0zxyTaxP9p/1XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UU5vZfyn; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UU5vZfyn"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240819052423epoutp0448cce11dea15038a711be7662837d47a~tCdntkIuB1249612496epoutp046
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240819052423epoutp0448cce11dea15038a711be7662837d47a~tCdntkIuB1249612496epoutp046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724045063;
	bh=hoicPC/VzmDis71v8IRNcpF+6JTBo0KNNr3/qD2gd+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UU5vZfynrSe6MezpPa/1O5sq01IkvXKBwNz1dvKJk+qmI82O++28mR63lZDTYcbvy
	 IcuKKfmtdOGhnJ1UUvMk2oPdqUdy2EbOriqz4d2gV0xj6u/Zvcy34pMSWWXu5egARU
	 SVjQD7LhqQ+4IjfMk+lLvtwsUQ00NYXxS0pe3QTo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240819052423epcas2p38da65b7814d354bb9a8cd6e8a1f03d69~tCdnMuH3O0910709107epcas2p3q;
	Mon, 19 Aug 2024 05:24:23 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.70]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WnLcl0RKfz4x9Q0; Mon, 19 Aug
	2024 05:24:23 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.C8.10066.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epcas2p3f7ae25b479f54f2402ffd11a0942937d~tCdmeV2KO1273712737epcas2p3v;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240819052422epsmtrp1e4ea07594f21df8c6cb81a029cd25625~tCdmdn8u01581915819epsmtrp1j;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
X-AuditID: b6c32a46-24fff70000002752-ec-66c2d706e6b3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E5.80.19367.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epsmtip17095900cd5120418156ab3c74ab5d8d1~tCdmNHGDI1778217782epsmtip1U;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v6 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Mon, 19 Aug 2024 14:24:14 +0900
Message-ID: <20240819052416.2258976-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmmS7b9UNpBjsPWFo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7ofXqFteCpWMXMF7oNjN+E
	uhg5OSQETCR27l7G1MXIxSEksINRYvPXF4wQzidGiXNLV7HCOe/nbGWHaWmdPBMqsZNRYtnh
	R1D9HxklPi+fxNLFyMHBJqAr8eefA0hcRGAPk8SW80vAipgFzjJK3J2zAGyUsIC7RM+ZJlYQ
	m0VAVeL3pA1sIDavgL3E3TuXGSHWyUtcXPMcLM4p4CBx5uU5FogaQYmTM5+A2cxANc1bZzOD
	LJAQmMohcfjnBhaIZheJmd2PoAYJS7w6vgXqBymJl/1tUHa+xOTrb5kgmhsYJa7962aGSNhL
	LDrzkx3kHWYBTYn1u/RBTAkBZYkjt6D28kl0HP7LDhHmlehogwaqmsSnK5ehhshIHDvxDMr2
	kFjU3cIOCazJjBLLz/QwTWBUmIXknVlI3pmFsHgBI/MqRrHUguLc9NRiowIjeBQn5+duYgQn
	XC23HYxT3n7QO8TIxMF4iFGCg1lJhLf75cE0Id6UxMqq1KL8+KLSnNTiQ4ymwMCeyCwlmpwP
	TPl5JfGGJpYGJmZmhuZGpgbmSuK891rnpggJpCeWpGanphakFsH0MXFwSjUwSZhWvt+8aPL+
	iwZd+Q3PX6rN+HrFL4VJw++Fpc/XC70/9edFrp0VvU7/zdF1LGu0uwRfWz5eOa/UXHhxy/cp
	Leqp8iVrj81Mv2a+U3b5hA9Sp88Zb5uetrlGUn0a+wHT/+qOVu+E7wftXXzHLdjz5ORl2yw4
	qjvvc33bemnp/0P375h833u2k1fsmQ1Dge/HLVwywcHTVPZZ+dZ/TIybVuy0OLbPj52/2exC
	xyG9VqdLlzf6qvKwZQb7r1y9u5anX6dIq7r/3mouQ+dpPGVBW7i9Fld9jRGdd/7MzU1+zDNP
	rZHMe3WD/cScWKuHUYpGslWz87iNDeTmVTRt/8HexfHhheO/ljKGgsJzM4/vUWIpzkg01GIu
	Kk4EAGuEyedBBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSnC7b9UNpBhd+yFo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZfQ+
	vcJa8FSsYuYL3QbGb0JdjJwcEgImEq2TZ7J2MXJxCAlsZ5TY/vImG0RCRmJjw392CFtY4n7L
	Eaii94wSbbMmAiU4ONgEdCX+/HMAiYsIHGKSmPj5KQuIwyxwmVHi2N3JzCDdwgLuEj1nmlhB
	bBYBVYnfkzaAbeAVsJe4e+cyI8QGeYmLa56DxTkFHCTOvDzHAmILAdXcvPabEaJeUOLkzCdg
	cWag+uats5knMArMQpKahSS1gJFpFaNoakFxbnpucoGhXnFibnFpXrpecn7uJkZwRGgF7WBc
	tv6v3iFGJg7GQ4wSHMxKIrzdLw+mCfGmJFZWpRblxxeV5qQWH2KU5mBREudVzulMERJITyxJ
	zU5NLUgtgskycXBKNTDJXTjcLRpeGeLfmrLC/PKM3RdXzQlbrZj0OW5lRwT/qz2WW7a9/mrE
	yyr2tv0sT7D06/lTu1YKJWdHyf6sPdWybl9ilMafV3HmXz4FTOUT7JArk3u7g/PO/Jqpsz5a
	RVVXsUdJnt4es10mM05b+cmBTC6Or+UrJTw/+Pb+Pr6rbFf+z89C7CGNnKs1wo6eP7fGqEF7
	1pew35yzPxxrCq05Gzdxd1GitJbpBynfyfnSijszJyT7xLr+fSgV4rqu0eE/zw2OLs/j9XJS
	vkuuiL1fbeOct22zn8Sa23N0xZ/Mze579j1aSvJ8rNIE8ZYzZvyf3sfnM/973lTvEfBSrrAl
	3Hiyu3jovX9xj57+EVRiKc5INNRiLipOBAAWChIE9wIAAA==
X-CMS-MailID: 20240819052422epcas2p3f7ae25b479f54f2402ffd11a0942937d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p3f7ae25b479f54f2402ffd11a0942937d
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p3f7ae25b479f54f2402ffd11a0942937d@epcas2p3.samsung.com>

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

