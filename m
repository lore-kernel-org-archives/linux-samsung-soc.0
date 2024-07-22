Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E145BEC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721687630; cv=none; b=EFoYefL1VIIgXE37jCZ1ZzVoMD1iEyMOFglPv7LSHcN9lqpmc9weClx4aVAi4uG+PIKvawlsiIEOW6+2GlKXSLByV4Tf7yuontpdzDrVJb8dMfZGYQx1M3GO77HLYhhDI8l1qyexgYWS+zL3uX+IAV9fM7TWD/RAtxFIYXNisyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721687630; c=relaxed/simple;
	bh=jPs5bhw2LqCImzZAB/9qt6gALyVn6+cFOa2QwNPKjzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=kTFyFtT3Wh27Jtx2mvlJIKPjXftTJX6d8WasgRbeWXJ2mZbuZcmG1v7dpq7w7ZEAsbh1ql4V8niw7pp5aNAlqCK0ol5/9GqtcRNTb/ydMsDQTGmNPvIWJlCNSUsa+yLLmlCCsAuP2K9LZbutzLNvU0iQMIdvVlt821EdIBm9rJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=buSn8KFE; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="buSn8KFE"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240722223342epoutp0324f59c9a04102ad0f890af3687adf326~kqcVjUPmH1083810838epoutp03x
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240722223342epoutp0324f59c9a04102ad0f890af3687adf326~kqcVjUPmH1083810838epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721687622;
	bh=hoicPC/VzmDis71v8IRNcpF+6JTBo0KNNr3/qD2gd+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=buSn8KFEarJJNEuFTWqwSQkgKxJw4Uo3cRmSHo8pj0H18HLfcE0G+R5vf2YZ6IWf8
	 vu5MaD2Smi/BjhOpyOdDzYgGsqnX9KKdK1vYByvw+39lkVjbhpO1+hmRcP1JVLSy7D
	 6pmVkW3Kw6czrlyt7+qAPVJVLmQTdz9YhF/L+OEc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240722223342epcas2p450b26fdbe79c8b7fda9395fe5bde0256~kqcU6i_CO1651716517epcas2p4y;
	Mon, 22 Jul 2024 22:33:42 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.97]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WSZnK5TDQz4x9Px; Mon, 22 Jul
	2024 22:33:41 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	66.37.10066.54EDE966; Tue, 23 Jul 2024 07:33:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240722223341epcas2p3937838f701942cc76b85858720e97a50~kqcT7w0bn0259002590epcas2p3D;
	Mon, 22 Jul 2024 22:33:41 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240722223341epsmtrp1bccf7c2d69249661d26c5813d771303e~kqcT6UzQz2611526115epsmtrp1H;
	Mon, 22 Jul 2024 22:33:41 +0000 (GMT)
X-AuditID: b6c32a46-24fff70000002752-14-669ede45af43
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	64.78.19367.44EDE966; Tue, 23 Jul 2024 07:33:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240722223340epsmtip1f2c22379f0246fe648818a3fbb383874~kqcTvDsgr2290522905epsmtip14;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v4 3/4] clk: samsung: clk-pll: Add support for pll_531x
Date: Tue, 23 Jul 2024 07:33:32 +0900
Message-ID: <20240722223333.1137947-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmua7rvXlpButuqVo8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7ofXqFteCpWMXMF7oNjN+E
	uhg5OSQETCQentvL3MXIxSEksINRonPLTijnE6PE675l7HDOwY37WGBaui+/h6raySix5tY/
	JgjnI6PE9m8XWbsYOTjYBHQl/vxzAImLCOxhkthyfglYEbPAWUaJu3MWsIOMEhZwl7jWvBRs
	LIuAqsTXAweZQWxeAXuJw+susUKsk5e4uOY5G8hQTgEHicm3FCBKBCVOznwC1soMVNK8dTbY
	RRICUzkkJi9fAHWqi8Sr1gNQtrDEq+Nb2CFsKYmX/W1Qdr7E5OtvmSCaGxglrv3rZoZI2Ess
	OvOTHWQxs4CmxPpd+iCmhICyxJFbUHv5JDoO/2WHCPNKdLRBw1RN4tOVy1BDZCSOnXgGZXtI
	3GzsYIGE1WRGia9T1jJOYFSYheSdWUjemYWweAEj8ypGsdSC4tz01GKjAiN4DCfn525iBKdb
	LbcdjFPeftA7xMjEwXiIUYKDWUmE98mruWlCvCmJlVWpRfnxRaU5qcWHGE2BYT2RWUo0OR+Y
	8PNK4g1NLA1MzMwMzY1MDcyVxHnvtc5NERJITyxJzU5NLUgtgulj4uCUamBSyg0WsFXUyzqp
	2F7jVGnR6/yls/VFcc7EO9JHuQ5FzdeImyP8Z5Zdv1Cv6YUpj0QSTT/I3be5HvFXprU2cNed
	RQVxHkwHu/YdbRAyz0v8EnVL7I25dK+14cYFMs3Zz3zurmBUmKpdyPn5Q2rC73jnKVsdo85Z
	vUsXeaZvljbh0/5tBe+nPO22+5729vO28Gpdn3314geaOR5sCFANOhq3cQNnExOnEEOMcw3H
	xbyC2b9OsOvpmz59cl/uNOf1H31z2a+KGWl3n5duMLi7UUm9MZg5jHvvtHcrM9+/VzP4Me3p
	5yr/rUpb9J6uef/uz4r7stttWR4Ub7TvmnzuU1DK3cUzdqa4u1pN5P28p0OJpTgj0VCLuag4
	EQDeDvI1QAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSnK7LvXlpBtsnWFs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZfQ+
	vcJa8FSsYuYL3QbGb0JdjJwcEgImEt2X3zN3MXJxCAlsZ5TYNv8YG0RCRmJjw392CFtY4n7L
	EVaIoveMEn3bHjF2MXJwsAnoSvz55wASFxE4xCQx8fNTFhCHWeAyo8Sxu5OZQbqFBdwlrjUv
	ZQGxWQRUJb4eOAgW5xWwlzi87hIrxAZ5iYtrnrOBDOUUcJCYfEsBJCwEVDLr5TWockGJkzOf
	gI1hBipv3jqbeQKjwCwkqVlIUgsYmVYxiqYWFOem5yYXGOoVJ+YWl+al6yXn525iBMeDVtAO
	xmXr/+odYmTiYDzEKMHBrCTC++TV3DQh3pTEyqrUovz4otKc1OJDjNIcLErivMo5nSlCAumJ
	JanZqakFqUUwWSYOTqkGJrM+tvC3FxsNZ1TnNd1uefZWXf3yUv89oX3VDwuWrQtPfnW7ZXer
	YAxzsM5txq5ctfuHw49bh52/1/RGd/UqviTrzFvWxw0Zb3sdE7m6eMqnC7YLviy5a5Z4U3dt
	dsokb6euCbdzO79VWoZIzd+SxGxt8H1OtVxP8ecff2MrAwIjy/tD7ndEdRt81Zx0UE/G3727
	2VTg89aba782/pNUl54/+ffbdYHPRVUfvrp85PmZJ1vlUmVelTSwP24LUVm0WtXgS9yqX7tj
	1Jj90n5O4gu/Kn7raUjakedshnoWvLNLLt5oujn/0LN6061hhw9u+df64WvhD9vVUhnlGfyb
	7tjb/1x1W+jVd56GjzXdk5RYijMSDbWYi4oTAQTS1xr2AgAA
X-CMS-MailID: 20240722223341epcas2p3937838f701942cc76b85858720e97a50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223341epcas2p3937838f701942cc76b85858720e97a50
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
	<CGME20240722223341epcas2p3937838f701942cc76b85858720e97a50@epcas2p3.samsung.com>

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

