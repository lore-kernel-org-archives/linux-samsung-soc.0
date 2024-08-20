Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC9918785A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139926; cv=none; b=hqbrWFg6g7/A77MsX1YXoPZfg6BODygxntTkWnEWEBS/lILDXRPH2lG+pduGmEuj6tts7a1gHgxmmyGHX7bUGwDT97+wVuCYPoUlGZLN+1fJpj0MYpdn90/5rKC96YSnOiqLzvQYB9DtPkP/G7h8yIE7l3Iaw37lu0vCwQE33CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139926; c=relaxed/simple;
	bh=jPs5bhw2LqCImzZAB/9qt6gALyVn6+cFOa2QwNPKjzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=e0SAOS/kdLdxXxCBxnSMP+8h5HFNy8PqZxNrXLsqxCs5bGx1+KIalbvr7YX5WHzafFC+pqYgHw+CR6YGxDovK+oelDI6/wKf+YU4SEN6X1MsrdpFPKGxxtL1UcvUoRWcK83vYdvKDeWXOfvOMXqruuBBMQ/oVm7iZs1ZwYdn7t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hNSInyvw; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hNSInyvw"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240820074521epoutp045913ec95308830da3b9f4ad2e54b004d~tYB_l4W7v0427604276epoutp04T
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240820074521epoutp045913ec95308830da3b9f4ad2e54b004d~tYB_l4W7v0427604276epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724139921;
	bh=hoicPC/VzmDis71v8IRNcpF+6JTBo0KNNr3/qD2gd+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hNSInyvwSMpXpYPgdZR6Nz5zCxuxtUfwoOqPPw3bOZVlUmDbE4W5UnG0DfYhTH4+s
	 F+igaHetHneTw4RxqdH4p1Ud180sZjfyip+LeZTgb3FGCx9XPvbeJ8/H4a8y4KKkvk
	 E4OxdgXp6IyWOtRgDV5jtcOEioeC7O8uayYEffyY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240820074520epcas2p24f9fbc7b9b52d08105ebba05e6c1a8b3~tYB_KpUQj3099630996epcas2p2F;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wp1hw3n5Qz4x9Q7; Tue, 20 Aug
	2024 07:45:20 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	4E.39.10012.09944C66; Tue, 20 Aug 2024 16:45:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240820074520epcas2p1547ef0a07fc76af76e21f18220d41c41~tYB9XIRIj2005020050epcas2p1V;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820074520epsmtrp178a034b27d5cf6af0ae232562dbea5c9~tYB9WCvil0727807278epsmtrp1B;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
X-AuditID: b6c32a47-ea1fa7000000271c-66-66c4499069e9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6A.E0.08964.F8944C66; Tue, 20 Aug 2024 16:45:19 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240820074519epsmtip283a15c02f199466406f413ec52ada974~tYB9MQA712557725577epsmtip20;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v7 4/5] clk: samsung: clk-pll: Add support for pll_531x
Date: Tue, 20 Aug 2024 16:45:13 +0900
Message-ID: <20240820074514.3123767-5-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmqe4EzyNpBgfWSVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7ofXqFteCpWMXMF7oNjN+E
	uhg5OSQETCReTLnB1MXIxSEksINRYvnxbewQzidGiXNnXrNCON8YJZZ8+csO07Jj1lFmEFtI
	YC+jxNOrQRBFHxklfp1dA1TEwcEmoCvx558DSFxEYA+TxJbzS8B2MAucZZS4O2cB2CRhAXeJ
	JyffgU1iEVCVmPv7CROIzStgL7H2zgUmiG3yEhfXPGcDsTkFHCRmdB5hhagRlDg58wkLiM0M
	VNO8dTYzyAIJgbkcErP6zzBCNLtI7L3WBDVIWOLV8S1QL0hJvOxvg7LzJSZff8sE0dzAKHHt
	XzczRMJeYtGZn2DvMAtoSqzfpQ9iSggoSxy5BbWXT6Lj8F92iDCvREcbNEzVJD5duQw1REbi
	2IlnULaHxO9zU6EhOplR4sfur0wTGBVmIXlnFpJ3ZiEsXsDIvIpRLLWgODc9tdiowBgew8n5
	uZsYwelWy30H44y3H/QOMTJxMB5ilOBgVhLh7X55ME2INyWxsiq1KD++qDQntfgQoykwsCcy
	S4km5wMTfl5JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp2ampBalFMH1MHJxSDUwTri2u
	XDT7g81+46e+6e3K8ZJnf9VF5HWzrn246/jyuYIPvzitF5v52y0+6M8CiYadr+acEJ8+b3XL
	F90XTh8l+FJWP8pZz5hryruBWUHdIZ/9QPziVPmSg9/duVSOMG3oqGnoajJufbGPPeTciSjb
	vXLv1149I1/nHv5OQXOj0a+XqRXr/v56t0JgnvHF2tp+65BGuVnzNOImhN4rmfi5N0CuoXbm
	K+lJjhlGe2qr57zTf7LQe4nly4U7alOULkTa/3lzJkI7Wujc5MW2YYedVXVsm4ISd0hftKm5
	cnGzn/Ri+SDhWV+DQo433okQOdhkaTfdY8O0nSLz6xuq2bSTXlmJ77V8viFw7b3eR8pKLMUZ
	iYZazEXFiQCyppsfQAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSvO4EzyNpBrfsLR7M28ZmsWbvOSaL
	61+es1rMP3KO1eL8+Q3sFpseX2O1+Nhzj9Xi8q45bBYzzu9jsrh4ytXi/54d7BaH37SzWvy7
	tpHFomnZeiYHPo/3N1rZPTat6mTz2Lyk3qNvyypGj8+b5AJYo7hsUlJzMstSi/TtErgyep9e
	YS14KlYx84VuA+M3oS5GTg4JAROJHbOOMncxcnEICexmlJj24BI7REJGYmPDfyhbWOJ+yxFW
	iKL3jBKL1j9m6WLk4GAT0JX4888BJC4icIhJYuLnpywgDrPAZUaJY3cnM4N0Cwu4Szw5+Q7M
	ZhFQlZj7+wkTiM0rYC+x9s4FJogN8hIX1zxnA7E5BRwkZnSCbOMA2mYv8XipMUS5oMTJmU9Y
	QGxmoPLmrbOZJzAKzEKSmoUktYCRaRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnBU
	aGnuYNy+6oPeIUYmDsZDjBIczEoivN0vD6YJ8aYkVlalFuXHF5XmpBYfYpTmYFES5xV/0Zsi
	JJCeWJKanZpakFoEk2Xi4JRqYDq6+POxgvQHa3n+zngW6WYR52quKdXetSTs8IIFn1qyLkav
	3/14VaxlidqTo5dEzvzruxyvcj+/R/yVvilTj/ai/SFzAwoXNh2Z1GIsYiF1J6PoeEsny3nf
	i4943n45vLpu1Z2lDF8T/xadqnb+8GrtAqbfjGmPup0fHb676KlAC3exe7D6/EPH/rI3bNhj
	KB2dcsjbLDTKfPKjdRyBy1QqZrhtymR+NtloGb9ir8wRo28Nr3O159eGfT7+wzhzx8KqCfb/
	RDzubfbS/fdvM//snadOmqh2OV9mEBIpFrdbzJR7ILz4U5hb2tUDU3JahdlrJgQePLugMXnG
	Ld17pe+ib854u3Dn73ula6IjWM4psRRnJBpqMRcVJwIAGunXLPkCAAA=
X-CMS-MailID: 20240820074520epcas2p1547ef0a07fc76af76e21f18220d41c41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820074520epcas2p1547ef0a07fc76af76e21f18220d41c41
References: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
	<CGME20240820074520epcas2p1547ef0a07fc76af76e21f18220d41c41@epcas2p1.samsung.com>

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

