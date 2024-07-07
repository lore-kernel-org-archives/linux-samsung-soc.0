Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F036F30C
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Jul 2024 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720394098; cv=none; b=CuRSQ+hkuyhI+3g1nsqFLScaLV4B+VHo7LquLwE/qX2zaUECMvPWNNeQQPC0fpLsMbOcEzwWmsACYCVolqb6qvd4IR6ONqiq+43HmbwUHJBExK7j/LOItlHNSdJsWZUp2C9VjcbjQi6PTdriHKqAbr56xfDV0Io2y+VDNACow+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720394098; c=relaxed/simple;
	bh=Cdw/w018u634O2wOV+RIvDSQaKLV7PeLzYYRuGwV7oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=rzFG/yMCVl/6LoVL1llTo4mKOy6swu0xVw7GjFk5/AWabRi/c/esexLCAMvF8l1/RhYEbRs4Jy6b52mratwIiX1btvKL/eG2KQDbw/uto9gOObRh3mNoBHrY0JOCUroWHh3mfSHOAXgdr7p8i/Pn0IVFHDqqqiv3oboPuZ4f0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BfGKa559; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BfGKa559"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240707231447epoutp031ed6b442db4cac59e5e2e323fb672425~gEU6je4GM1839118391epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Jul 2024 23:14:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240707231447epoutp031ed6b442db4cac59e5e2e323fb672425~gEU6je4GM1839118391epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720394087;
	bh=kiPJQMbtI4tibVPY59mFXWyZ4lmoOE/X8MtEDbo9tak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BfGKa559T/ulHCuuJxCf3rxK8HzF2fCCsGQx0LQm4iq4Q+UxHH2nUW7EFobbCCYsM
	 rbJxbrevtTRDtU6flDyLnqaruUzF/VP6wf267sNdVrvbF5KCVngCB/R9/xk5Naf7At
	 Os9fGfQrqV/iG3mFPup90cN9Cg8laHoYPmvI9L28=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240707231446epcas2p15670159116d8cea9bdd0b14e47d5a395~gEU50QTUt0164701647epcas2p1I;
	Sun,  7 Jul 2024 23:14:46 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.70]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WHNPd6snzz4x9Q6; Sun,  7 Jul
	2024 23:14:45 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	FB.35.09485.5612B866; Mon,  8 Jul 2024 08:14:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240707231445epcas2p18815fee7d176f63619d244d836ab64fc~gEU4ygtJU0673306733epcas2p1D;
	Sun,  7 Jul 2024 23:14:45 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240707231445epsmtrp17c12ab5d6f31c32efb05834043a87d68~gEU4xvzk00845308453epsmtrp10;
	Sun,  7 Jul 2024 23:14:45 +0000 (GMT)
X-AuditID: b6c32a46-19bfa7000000250d-f5-668b2165e872
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	20.B8.18846.4612B866; Mon,  8 Jul 2024 08:14:45 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240707231444epsmtip1efa3111d7418afcf4c03efe6521ff610~gEU4fVT-g2453524535epsmtip17;
	Sun,  7 Jul 2024 23:14:44 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v2 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Mon,  8 Jul 2024 08:13:30 +0900
Message-ID: <20240707231331.3433340-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmhW6qYneawZFuZYsH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1qhsm4zUxJTUIoXUvOT8lMy8
	dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygO5UUyhJzSoFCAYnFxUr6djZF+aUl
	qQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2Rmb9j9hK/gmWnHl0zGWBsbp
	Ql2MnBwSAiYShxpXs3UxcnEICexglGib854dwvnEKPHp/HVWOKf9w04mmJZ/z3ZCtexklPi7
	dTELSEJI4COjxOe5KV2MHBxsAroSf/45gNSICOxhkthyfgkTiMMscJZR4u6cBewgDcIC7hLH
	ziwCm8oioCqxaHkDC0gzr4C9xJ2OIohl8hIX1zxnA7E5BRwk7jRcYQSxeQUEJU7OfAK2lxmo
	pnnrbGaQ+RICMzkkLixbywLR7CLx7dpWZghbWOLV8S3sELaUxMv+Nig7X2Ly9bdMEM0NjBLX
	/nVDNdhLLDrzkx3kIGYBTYn1u/RBTAkBZYkjt6D28kl0HP7LDhHmlehogwapmsSnK5ehhshI
	HDvxDMr2kDjwZiMTJNwmM0q8aW1knMCoMAvJO7OQvDMLYfECRuZVjGKpBcW56anFRgVG8BhO
	zs/dxAhOt1puOxinvP2gd4iRiYPxEKMEB7OSCO/px+1pQrwpiZVVqUX58UWlOanFhxhNgWE9
	kVlKNDkfmPDzSuINTSwNTMzMDM2NTA3MlcR577XOTRESSE8sSc1OTS1ILYLpY+LglGpgkrrx
	lKtMPp9Rsf7Nu+VHXrJfb1x3e0Ggr6/RjTO6v095t58NqDfaF7s610N56wLbCAXpB1rzr/Na
	uq5c4HLwouOmxKx9tXNlrFLWTBZnPGwdJM/y9tm3Kzy5L/wPPV913PbzSsUrjpUFWzz+elZP
	j58W0HA/ad7RU696ubvd7hzZXD5xUpjOyUgtrSs/nWL/f7k/UfC6Wa2lVbfmAjl5M6tP+7UO
	Osr4J72MtJt28mr6FLZNgj13Dr4X2JYROe+D1HuGGR83fxPRn5alfPvh6Xs3eKZInGK8vvDL
	VRHJKet2dKUZ628ua5NMn3RcKMo7pEPsZrmxAp+5xbMet+jJ8Wbhsx39F1md6vjdx+/eocRS
	nJFoqMVcVJwIAPJ/DrdABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSnG6qYneawfbJzBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGZv2
	P2Er+CZaceXTMZYGxulCXYycHBICJhL/nu1k62Lk4hAS2M4oMXvTCiaIhIzExob/7BC2sMT9
	liOsEEXvGSW+PPkOVMTBwSagK/HnnwNIXETgEJPExM9PWUAcZoHLjBLH7k5mBukWFnCXOHZm
	EdhUFgFViUXLG1hAmnkF7CXudBRBLJCXuLjmORuIzSngIHGn4QojiC0EVPLuy3QWEJtXQFDi
	5MwnYDYzUH3z1tnMExgFZiFJzUKSWsDItIpRNLWgODc9N7nAUK84Mbe4NC9dLzk/dxMjOCK0
	gnYwLlv/V+8QIxMH4yFGCQ5mJRHe04/b04R4UxIrq1KL8uOLSnNSiw8xSnOwKInzKud0pggJ
	pCeWpGanphakFsFkmTg4pRqYdjXej034MJlRsOjLxDcb2/W2vphS6HTrebTb/AUx+rpVSvqR
	RtlOJ1lZErOPNVk+dvq3VltYpNpgWr7LI/8DV6b3/W2LrzXfrv1g+vJXS1KdLcpc4+M+K2Rz
	z2h7qLtq/lIHJc2s2zdljd/6/PlWdqh+z2reSbMv/kwUy686IVbXFPbwheYS/SNtDyfWbOe6
	lhceUuu0PeigceShKNnNrPtLfZmiZNyu7ffUm5Mxq/rbJGGthUcleT7IvlP89dPrjsKlO/43
	T1xwefWR2dVOL+rApG/NGQ/vTFu5rTzj0eMjy8O3Fj4v9Vjtpr0xYvHnhz/mWkiK3tLJ3mDE
	+KApXU9Y/rmX7N9K9/xjS3valViKMxINtZiLihMB0T+UWvcCAAA=
X-CMS-MailID: 20240707231445epcas2p18815fee7d176f63619d244d836ab64fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p18815fee7d176f63619d244d836ab64fc
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p18815fee7d176f63619d244d836ab64fc@epcas2p1.samsung.com>

pll531x PLL is used in Exynos Auto v920 SoC for shared pll.
pll531x: Integer/fractional PLL with mid frequency FVCO (800 to 3120 MHz)

PLL531x
FOUT = (MDIV + F/2^32-F[31]) * FIN/(PDIV x 2^SDIV)

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
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

