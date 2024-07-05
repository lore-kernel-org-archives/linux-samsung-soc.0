Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E817BBA
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145537; cv=none; b=tb4Pd5ppSl72hB6Yn3A+z/BgLG5Ly9Ee3in2mRI7O1miQxAX0eLv35S6olZir6/6WP1cdTVVKUd+Ba45p4jrSDbU0pyxmqnPQLH2Dl2rfFZxvkCxrHlyuEL8WUF3AMxi+Lbzsk34xA97OOp7hX0tK0dKYi69IMw9n6TRdA2FtV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145537; c=relaxed/simple;
	bh=jeI1xgAbhsF/PnB1f34w6MS63fU/Rf1eMcVQGVaYLIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=P+EtE2QXvsfeREMFOqQ/vQQp0fLy3g9u3NfPkaVtTpGu3hqWWlMLVpqSM30d75QvaWCBN6/Dh0CXgOwp3viFgSuBgvFYOAk7lOVlo1AxAi6uuzSNNCSc9v6VouRguzvjxNcBNcTwTLqdL7CvOzB9tXmJzgyIPW0SwG5GT/s8BvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OtP0xT8L; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OtP0xT8L"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240705021214epoutp02fb6d6038279a29a360d62f2628a6b8ae~fL0AABtwA2901529015epoutp02C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:12:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240705021214epoutp02fb6d6038279a29a360d62f2628a6b8ae~fL0AABtwA2901529015epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720145534;
	bh=K89LyXQ7B4uoUa7XRg9nL8XmPnMBaYJfFW9fC0K8rdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OtP0xT8LKWRRBW5G87txtMLn7BHU9uLcx33Wh2yNckyLgrKM1mfuY96gMMVO5eZyv
	 oDJaoaoiIiHzpUyutPf75ahsHB7oAVeTpPFbu0YJVseUlC+Q6/MgU5u4i7hekVgdjA
	 Sjr55KOW9igQCcXT3/1WPhWql4OMslZDn6hcmTzY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240705021213epcas2p2597248504a53684c87b10335afad388a~fLz-B7aYm2503225032epcas2p2h;
	Fri,  5 Jul 2024 02:12:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WFcTn176Tz4x9Pp; Fri,  5 Jul
	2024 02:12:13 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.3A.36191.C7657866; Fri,  5 Jul 2024 11:12:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240705021212epcas2p392c9e1f046c9a6bd98631083fd7ec583~fLz_BhbF42016320163epcas2p3V;
	Fri,  5 Jul 2024 02:12:12 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705021212epsmtrp2ea9d6eca87716e279f9eeaa0cc836141~fLz_AyqOV0908709087epsmtrp2_;
	Fri,  5 Jul 2024 02:12:12 +0000 (GMT)
X-AuditID: b6c32a48-5cfff70000018d5f-a5-6687567c2c6a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.39.19057.C7657866; Fri,  5 Jul 2024 11:12:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240705021212epsmtip2b96803643de4dc82440c02511b5c2ece~fLz9303kj0053300533epsmtip2W;
	Fri,  5 Jul 2024 02:12:12 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 4/5] clk: samsung: clk-pll: Add support for pll_531x
Date: Fri,  5 Jul 2024 11:11:09 +0900
Message-ID: <20240705021110.2495344-5-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmqW5tWHuawfJgiwfztrFZXP/ynNXi
	/PkN7BYfe+6xWlzeNYfNYsb5fUwWF0+5Whx+085q8e/aRhaLpmXrmRy4PN7faGX32LSqk82j
	b8sqRo/Pm+QCWKKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8
	AnTdMnOAzlFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWW
	WBkaGBiZAhUmZGd8XNvPVvBNtGLGlbfsDYzThboYOTgkBEwkZm1N7GLk4hAS2MEoMffZdSYI
	5xOjxJkXzxkhnG+MEnOWzWXvYuQE6zi6aQUzRGIvo0Tb2g9sEM5HRonmw83sIHPZBHQl/vxz
	AImLCHxnlOh/u48FxGEW6GSUuHp0OxPIKGEBF4l7244wgjSwCKhKfOguAQnzCthLPHv/DGqb
	vMTFNc/ZQGxOAQeJ50cOsELUCEqcnPmEBcRmBqpp3job7CIJgZ/sEhc23GGFaHaRePf+DwuE
	LSzx6vgWqKFSEp/f7WWDsPMlJl9/ywTR3MAoce1fNzNEwl5i0ZmfYN8wC2hKrN+lDwkwZYkj
	t6D28kl0HP7LDhHmlehoE4JoVJP4dOUy1BAZiWMnnkHZHhJPXu5lh4TVZEaJTYf/Mk9gVJiF
	5J1ZSN6ZhbB4ASPzKkax1ILi3PTUYqMCE3gMJ+fnbmIEJ08tjx2Ms99+0DvEyMTBeIhRgoNZ
	SYRX6n1zmhBvSmJlVWpRfnxRaU5q8SFGU2BYT2SWEk3OB6bvvJJ4QxNLAxMzM0NzI1MDcyVx
	3nutc1OEBNITS1KzU1MLUotg+pg4OKUamEJmBTw4P1Xq1oF6n6tta/4kTCmI3857cav0OZlH
	vJMyzCfuXJWtkSM2xWNh59VFGp+f9B5RXMuQojNn5c2sFVcu5EUerL8vUKyoGnI2qnhn5Cz3
	9cW5JTE1/J3zriR2n949r0BeVycn5XBHouR55ZU2Cl/a1Odu/beha+GZiQXuuaIrj59ztP8i
	2eBuOlXl3eULXrqx2UdqI9KPX9Jg8L/11DPIcUNLaNijhMhrT77xyv96F7JiogHHWtW6STWC
	Xz6s/2Egrbk5zD3KaNVvPV+rWGXdtb/m378kZ9K9V/dlcdb7TR8PyDScj1m07c70g+n6NQK3
	ftr5XVT5kMElJCCV1mK5PO/fbcvtPFqhXEosxRmJhlrMRcWJAB3e2BAnBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSvG5NWHuaQdM5SYsH87axWVz/8pzV
	4vz5DewWH3vusVpc3jWHzWLG+X1MFhdPuVocftPOavHv2kYWi6Zl65kcuDze32hl99i0qpPN
	o2/LKkaPz5vkAliiuGxSUnMyy1KL9O0SuDI+ru1nK/gmWjHjylv2BsbpQl2MnBwSAiYSRzet
	YO5i5OIQEtjNKPHr80FmiISMxMaG/+wQtrDE/ZYjrBBF7xklDp+9ApTg4GAT0JX4888BJC4i
	8JtR4sfe74wgDrNAL6PEndv/mEC6hQVcJO5tO8II0sAioCrxobsEJMwrYC/x7P0zqAXyEhfX
	PGcDsTkFHCSeHznACmILAdV0LbvJAlEvKHFy5hMwmxmovnnrbOYJjAKzkKRmIUktYGRaxSiZ
	WlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRHOhaWjsY96z6oHeIkYmD8RCjBAezkgiv1Pvm
	NCHelMTKqtSi/Pii0pzU4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqY1jGYqH0u
	EugOfCTw7s6qAw+lXZRLDnhkSnU9TFKYO09B99u0RWoXRGxSjy55eCFlyb3L4gyWR+Ru7zyf
	wXRxpbuw77KqFfWTYlc9L/hQyaj+s9u/K3DlqTgmwYxk3bDFq5dvmNnrW/dRszeKPfqDzpkb
	Wo5W/FOmzlVZfv/l5X1xT/1eMBWudP11wu5v4eUOk8nO647dPPjU6nJgxTOXzg21ZyUEChpf
	z4soYT3/4tSmPM51M3mEeZi3NKTMfdH+REZQo9RMNc6+okZs7ue4oFcRD+csydi9a+LneRYN
	SRPS3tm7XppmcE2pffvsC7cP3ny/U+35uTlSsgLhal+Mp8R1Ga+vstrdE9h+UkxCU4mlOCPR
	UIu5qDgRAKl5Yg7jAgAA
X-CMS-MailID: 20240705021212epcas2p392c9e1f046c9a6bd98631083fd7ec583
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021212epcas2p392c9e1f046c9a6bd98631083fd7ec583
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021212epcas2p392c9e1f046c9a6bd98631083fd7ec583@epcas2p3.samsung.com>

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
2.43.2

