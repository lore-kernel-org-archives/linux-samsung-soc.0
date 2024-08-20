Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BD18C028
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145314; cv=none; b=Q4wX+WCUC2187OKKuwcfyJcCxYFNs17ZtobYFoUU4Vv666jWfZfbHyH5VdW7sIEfLEhKkjlSDjG3hZ9ci3pkMxGJ1md1FcGj/H3HjoRnGkF+r62bV2Jn5RF1B1so7H2w0WFeKfP/16cuy6siRzWgr9jsFMT+mOs2nx8ETRxbaNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145314; c=relaxed/simple;
	bh=jPs5bhw2LqCImzZAB/9qt6gALyVn6+cFOa2QwNPKjzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=JGLqclTaevEVQsfWNb9VECueGmG1hMlfLSZ8OqWe4Dq11Ok/5h4iIe8tSKm1E1OyY76bsikNSlC9/cs/LSWKJHCHTFdOZabTRDT0GeAuEXllLh7p32O18Oywa3XSkLcLaZmDKGbFTA/mB7Z/YjhnOOGhuhqHaU5hl96EtgpmomM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Gj7F4m0T; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Gj7F4m0T"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240820091506epoutp02e75ff25304de4f1641b695007b8cd125~tZQV5WY1I3161531615epoutp02-
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240820091506epoutp02e75ff25304de4f1641b695007b8cd125~tZQV5WY1I3161531615epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724145306;
	bh=hoicPC/VzmDis71v8IRNcpF+6JTBo0KNNr3/qD2gd+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gj7F4m0TuirboR8wpwUVLrPc5GMg20fTGYOAXk+WsJrK6xszDBz6YIW5MKjgkDqP8
	 twDFdNP5y0a/MzkyY84WMobtrVIodyqPATLdAMb/CDKnS8uU3WVXEsHIanjl94HW0w
	 j5X+d9iljBgRHWy2RvccTtshDjDU4ewl51S2sw6c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240820091506epcas2p3580cbc4afbdc9732b162f090a0aeba75~tZQVgcV690259302593epcas2p3N;
	Tue, 20 Aug 2024 09:15:06 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Wp3hT5DZvz4x9Ps; Tue, 20 Aug
	2024 09:15:05 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	C9.31.08901.99E54C66; Tue, 20 Aug 2024 18:15:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epcas2p181485bd0cd2bf7ae0e0874408e81d81d~tZQUQbWdA2860628606epcas2p1A;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820091504epsmtrp193070356883a8caffad3e2c3526d74ae~tZQUPnV8L2606226062epsmtrp13;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-f0-66c45e9953cb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	49.6C.08456.89E54C66; Tue, 20 Aug 2024 18:15:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epsmtip17741e0bdf3a08159053fea08ff6f948e~tZQUBZd_H3033030330epsmtip1G;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v8 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Tue, 20 Aug 2024 18:14:59 +0900
Message-ID: <20240820091501.3395841-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820091501.3395841-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmhe7MuCNpBr8Palg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7ofXqFteCpWMXMF7oNjN+E
	uhg5OSQETCSWPXvN1MXIxSEksINRYt7XfSwQzidGiQ2bzjFCON8YJaadn88I03LuXgdUYi+j
	xOtPd1ghnI+MEuu3dbF3MXJwsAnoSvz55wASFxHYwySx5fwSsCXMAmcZJe7OWcAOMkpYwF1i
	6+ldLCA2i4CqxJnfq1lAmnkF7CV6rrtAbJOXuLjmORuIzSngIHFp7VcmEJtXQFDi5MwnYK3M
	QDXNW2czg8yXEFjIITHrYD8rRLOLxPvdR5ghbGGJV8e3sEPYUhIv+9ug7HyJydffMkE0NzBK
	XPvXDdVgL7HozE+wb5gFNCXW79IHMSUElCWO3ILayyfRcfgvO0SYV6KjDRqmahKfrlyGGiIj
	cezEMyjbQ+Ln0mnQ4J3MKLHjTzfLBEaFWUjemYXknVkIixcwMq9iFEstKM5NT002KjCEx3By
	fu4mRnC61XLewXhl/j+9Q4xMHIyHGCU4mJVEeLtfHkwT4k1JrKxKLcqPLyrNSS0+xGgKDOuJ
	zFKiyfnAhJ9XEm9oYmlgYmZmaG5kamCuJM57r3VuipBAemJJanZqakFqEUwfEwenVAPTjaJp
	nzu+GScKfNDX/r1+bV6t1ZVey9jjBTI50zd2JU+uORsm+fSfdPF5b3sD//e7j90wf3us8TvP
	W8eTJzcc0WFMblb+e39u8rzwlvbqvTPmFUu+3XVv99n7x51bjObcKTse5dTjmcW2MqtrX03/
	Cb2lLklaov/6g2NnVvE1Pk2tfbAuLVRGM+D2xbDVr2b531toeLiuP9zxsK8Lo0V2846cmF4b
	thKvvXkqReEHOnOvvzQ0PzpbtnOm+a4F7pqyeZ5uRy/UnJie/DVunm3TctUfGxa/7VK4tLjN
	fX/cs2drhf4anPGdv7HrZnTug8iovn/lf+/ae3/1nLXj58ODlguWxX5u6WqbuDlsQuY/JZbi
	jERDLeai4kQAJ1c4xEAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO6MuCNpBh3HNS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mnqf
	XmEteCpWMfOFbgPjN6EuRk4OCQETiXP3Ohi7GLk4hAR2M0pc3HufFSIhI7Gx4T87hC0scb/l
	CCtE0XtGiXkbp7B1MXJwsAnoSvz55wASFxE4xCQx8fNTFhCHWeAyo8Sxu5OZQbqFBdwltp7e
	xQJiswioSpz5vZoFpJlXwF6i57oLxAJ5iYtrnrOB2JwCDhKX1n5lArGFgErmLWgGG8MrIChx
	cuYTsDHMQPXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxN
	jOC40NLawbhn1Qe9Q4xMHIyHGCU4mJVEeLtfHkwT4k1JrKxKLcqPLyrNSS0+xCjNwaIkzvvt
	dW+KkEB6YklqdmpqQWoRTJaJg1OqgalyV+yXnheJ76unHZ3/VLRunZ3CnPy0N6rzAlklohUz
	zqtWXork+3XGh/NxTnHeTQvfs0s9Ax5+u8q1wia/Wt1k1/cyO+FK9pP6WetMZXZn3P60Mkhi
	9eb5Srs+bXvqMvNk6IXb6f94jb/oL9tvuPxVRb3FM8Vimzk1k2tU/Kd+Fhds4axOv3ReSKFo
	au4ORradh3mkNmb9dKubsbbTr1JfmmlBjoJyhM+sU57t249du+7OLe3/Q3Bb4Bqhf06G2Vnz
	vX/fvjwrdXfn2s7/k0OefT95TXFVxKLQt4bWc25bPVnJpP7IzmpBv8KBtuO6jrbfNhY0Thfq
	lW5cW8plmWpyZJdkadHjI/W7svZMjVZiKc5INNRiLipOBABl8CS++gIAAA==
X-CMS-MailID: 20240820091504epcas2p181485bd0cd2bf7ae0e0874408e81d81d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820091504epcas2p181485bd0cd2bf7ae0e0874408e81d81d
References: <20240820091501.3395841-1-sunyeal.hong@samsung.com>
	<CGME20240820091504epcas2p181485bd0cd2bf7ae0e0874408e81d81d@epcas2p1.samsung.com>

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

