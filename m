Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B35464B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728447683; cv=none; b=MwGOzYp0ZZg+DzWvg4kkF3/vwgcDIIrdh5VWWANII9H96nZkTv9TE5oZh0wa/ODAAtqV5xhhQpavcyAimhii7D3Tc4w8VP8E5OFwTR61fcNTMB3y+PUNnn2llomwFt6WYNhPRUaclLC5rx+agOiPiPHROwxPueJR/kCHEFfTgBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728447683; c=relaxed/simple;
	bh=dZZSBUVQpjK5HGU9YgpuKDZx/70cy+zLwCTXCP00mxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pM6jTj4N+xwpcI+w/4ZSgSikw4G7CGTBCGt48bEEZGWjIcBj5Vk7ll2lBJ0S68wctnWtgduARyvk6SE+YnGglFeZFCKWpiOb6/5wwxMBf9Z263J4fvROOOJ/u7jfL0Up7cealMe3RwzDHtYnb13JxXgFgysMAmOTfYQO9rJqbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UpcRRdiu; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UpcRRdiu"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241009042119epoutp03da37d94ccfcf6ecba27008bd0bb328bd~8rgGwmnor3231632316epoutp03k
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241009042119epoutp03da37d94ccfcf6ecba27008bd0bb328bd~8rgGwmnor3231632316epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728447679;
	bh=KZIanRU1x/tInM5i+Uiy72m5olWX1MijejRcfkOWrNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UpcRRdiufFdxmmh5Yr3pdV5nereC8s0Cp6JhnSLYVT4YYMspHsh/8zgVlsER+IhaF
	 FLIYMs6Hh1M5fJPAxvTA2qGqRIdcfyXxPoqf8GTEoNuIVJrMuuZArGP8pAnLL+Wirn
	 AHPyrBfEldrvAezjMytuNJi449CPS2edOdAd9R1k=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241009042118epcas2p1b666b635eee4909ab2978e6e15c597e0~8rgGdhiNj2655126551epcas2p1E;
	Wed,  9 Oct 2024 04:21:18 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XNfpQ2R50z4x9Pp; Wed,  9 Oct
	2024 04:21:18 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	AC.F1.09770.EB406076; Wed,  9 Oct 2024 13:21:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epcas2p3805b8b5f3a65ed1ee39d5244310b9581~8rgFVbh9G2577325773epcas2p3N;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241009042117epsmtrp14eda516c217ef110de83cf49e9d74ddf~8rgFUh_Ui1171011710epsmtrp1C;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
X-AuditID: b6c32a46-00dfa7000000262a-e1-670604be0085
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.F8.07371.DB406076; Wed,  9 Oct 2024 13:21:17 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epsmtip233e3e46b6453c1d31b73926ec64d5010~8rgFDRnqS3096030960epsmtip2O;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v3 2/3] clk: samsung: exynosautov920: add peric1, misc and
 hsi0/1 clock support
Date: Wed,  9 Oct 2024 13:21:09 +0900
Message-ID: <20241009042110.2379903-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmme4+FrZ0gy1f+SwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGfcWLGBrWBBXsXjiU2sDYwt
	CV2MnBwSAiYSG359Ze9i5OIQEtjBKNFy9gUzhPOJUeLjnkdQzjdGiU+z5rHDtDT+uMsEkdjL
	KPG65QyU85FR4vfDz4xdjBwcbAK6En/+OYDERQT2MElsOb8ErIhZ4CyjxN05C8BGCQskSpzY
	PIkJxGYRUJW4fr4VzOYVsJd4u/wRC8Q6eYnrj4+CxTkFHCQ65l1hhKgRlDg58wlYDTNQTfPW
	2cwQ9TM5JHp+akLYLhLzZp9ghbCFJV4d3wL1gpTEy/42KDtfYvL1t2DHSQg0MEpc+9cNNche
	YtGZn+wg3zALaEqs36UPYkoIKEscuQW1lk+i4/Bfdogwr0RHmxBEo5rEpyuXoYbISBw78QzK
	9pCYcGMDNKwnA8Pq0AXWCYwKs5B8MwvJN7MQFi9gZF7FKJZaUJybnlpsVGAEj+Lk/NxNjOCE
	q+W2g3HK2w96hxiZOBgPMUpwMCuJ8OouZE0X4k1JrKxKLcqPLyrNSS0+xGgKDOuJzFKiyfnA
	lJ9XEm9oYmlgYmZmaG5kamCuJM57r3VuipBAemJJanZqakFqEUwfEwenVAPTte/OxrsPxhn9
	cbAvW33+fskflv/FRhnfnr5aqfD8+mbn783CFX9ZHTxb/r5eHyt7+nlQp9fHnZdaFd9/v/P+
	0Pxt13yVJskb6UY729Wv3ecj9mOG6efoHR8+Z6keejuB6TRLxu2Zd5iPqm593LN4/4FFxx9f
	5Vg3w8dTsy05acHBjlil9mfXzxV0eVbbXdfyUVvb4b90moNx1rf1tV9WLp/drfD06OFJ9y4p
	6voV/P+vPfvFgTV8ksr88b5OJtN0jigGTAiud0vlrXUx/uXw2ar2j8K233M3LS+Zf2lDNjtb
	c0PFjtI8T4OarXIlB650iws7Nzq+qBHfHGt66/Hrvklywl8shdgdRKa5Ha+7p8RSnJFoqMVc
	VJwIADpmkyNBBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvO5eFrZ0gw87lC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mm6s
	2MBWsCCv4vHEJtYGxpaELkZODgkBE4nGH3eZQGwhgd2MEmv2K0PEZSQ2Nvxnh7CFJe63HGHt
	YuQCqnnPKPF3awdQgoODTUBX4s8/B5C4iMAhJomJn5+ygDjMApcZJY7dncwM0i0sEC/R9WsO
	C4jNIqAqcf18K9g2XgF7ibfLH7FAbJCXuP74KFicU8BBomPeFUaIi+wlnrRMZYaoF5Q4OfMJ
	WD0zUH3z1tnMExgFZiFJzUKSWsDItIpRMrWgODc9N9mwwDAvtVyvODG3uDQvXS85P3cTIzgy
	tDR2MN6b/0/vECMTB+MhRgkOZiURXt2FrOlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeQ1nzE4R
	EkhPLEnNTk0tSC2CyTJxcEo1MAla+vJN+fJk9pGtrFJ1tysmTl1fr3pzb+HHU5qb7vy1bku2
	3xtqYnDaZh9farrY8lPbExwVUsS2ufI8LVH8w1HOEVW8//gCWRnv8w/MHZLyWGUc3Xn1J99l
	jtgma8iTczz+FPMG6W95F6ZUXo2TnCD3m8miN0Nkzacax2bpl4UfP97lC1m560vo4ZnPjt2y
	UJ3wUvGLneh5hmcHkk4qr2u5+CWwRlrcdoGvR/XFHe+5yxOrmirqipnbVvK7GOy5dHjvXL7I
	das5hfiW3VEsdAnNi/AIuvY0+cmqY7UbW/5IF646xLb39p99DJ6igsUX5l3wOeii9Vc79lNg
	zI3roU/al6hfrLm1WOpj3qk1CUosxRmJhlrMRcWJALTsc/X7AgAA
X-CMS-MailID: 20241009042117epcas2p3805b8b5f3a65ed1ee39d5244310b9581
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241009042117epcas2p3805b8b5f3a65ed1ee39d5244310b9581
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
	<CGME20241009042117epcas2p3805b8b5f3a65ed1ee39d5244310b9581@epcas2p3.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_PERIC1, this provides clocks for USI09 ~ USI17, USI_I2C and USI_I3C.
CMU_MISC, this provides clocks for MISC, GIC and OTP.
CMU_HSI0, this provides clocks for PCIE.
CMU_HSI1, this provides clocks for USB and MMC.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 289 +++++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index f60f0a0c598d..2a8bfd5d9abc 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -19,6 +19,10 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
 #define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
+#define CLKS_NR_PERIC1			(CLK_DOUT_PERIC1_I3C + 1)
+#define CLKS_NR_MISC			(CLK_DOUT_MISC_OSC_DIV2 + 1)
+#define CLKS_NR_HSI0			(CLK_DOUT_HSI0_PCIE_APB + 1)
+#define CLKS_NR_HSI1			(CLK_MOUT_HSI1_USBDRD + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -974,6 +978,8 @@ static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initcon
 		"mout_shared5_pll", 1, 3, 0),
 	FFACTOR(DOUT_SHARED5_DIV4, "dout_shared5_div4",
 		"mout_shared5_pll", 1, 4, 0),
+	FFACTOR(DOUT_TCXO_DIV2, "dout_tcxo_div2",
+		"oscclk", 1, 2, 0),
 };
 
 static const struct samsung_cmu_info top_cmu_info __initconst = {
@@ -1139,6 +1145,277 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.clk_name		= "noc",
 };
 
+/* ---- CMU_PERIC1 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC1 (0x10C00000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC1_IP_USER	0x600
+#define PLL_CON0_MUX_CLKCMU_PERIC1_NOC_USER	0x610
+#define CLK_CON_MUX_MUX_CLK_PERIC1_I3C		0x1000
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI09_USI	0x1004
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI10_USI	0x1008
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI11_USI	0x100c
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI12_USI	0x1010
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI13_USI	0x1014
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI14_USI	0x1018
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI15_USI	0x101c
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI16_USI	0x1020
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI17_USI	0x1024
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI_I2C	0x1028
+#define CLK_CON_DIV_DIV_CLK_PERIC1_I3C		0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI	0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI	0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI	0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI	0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI13_USI	0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI14_USI	0x1818
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI15_USI	0x181c
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI	0x1820
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI	0x1824
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C	0x1828
+
+static const unsigned long peric1_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC1_IP_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_NOC_USER,
+	CLK_CON_MUX_MUX_CLK_PERIC1_I3C,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI09_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI10_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI11_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI12_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI13_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI14_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI15_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI16_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI17_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI_I2C,
+	CLK_CON_DIV_DIV_CLK_PERIC1_I3C,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI13_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI14_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI15_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC1 */
+PNAME(mout_peric1_ip_user_p) = { "oscclk", "dout_clkcmu_peric1_ip" };
+PNAME(mout_peric1_noc_user_p) = { "oscclk", "dout_clkcmu_peric1_noc" };
+PNAME(mout_peric1_usi_p) = { "oscclk", "mout_peric1_ip_user" };
+
+static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC1_IP_USER, "mout_peric1_ip_user",
+	    mout_peric1_ip_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_IP_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC1_NOC_USER, "mout_peric1_noc_user",
+	    mout_peric1_noc_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_NOC_USER, 4, 1),
+	/* USI09 ~ USI17 */
+	MUX(CLK_MOUT_PERIC1_USI09_USI, "mout_peric1_usi09_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI09_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI10_USI, "mout_peric1_usi10_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI10_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI11_USI, "mout_peric1_usi11_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI11_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI12_USI, "mout_peric1_usi12_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI12_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI13_USI, "mout_peric1_usi13_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI13_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI14_USI, "mout_peric1_usi14_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI14_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI15_USI, "mout_peric1_usi15_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI15_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI16_USI, "mout_peric1_usi16_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI16_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI17_USI, "mout_peric1_usi17_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI17_USI, 0, 1),
+	/* USI_I2C */
+	MUX(CLK_MOUT_PERIC1_USI_I2C, "mout_peric1_usi_i2c",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI_I2C, 0, 1),
+	/* USI_I3C */
+	MUX(CLK_MOUT_PERIC1_I3C, "mout_peric1_i3c",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_I3C, 0, 1),
+};
+
+static const struct samsung_div_clock peric1_div_clks[] __initconst = {
+	/* USI09 ~ USI17 */
+	DIV(CLK_DOUT_PERIC1_USI09_USI, "dout_peric1_usi09_usi",
+	    "mout_peric1_usi09_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI10_USI, "dout_peric1_usi10_usi",
+	    "mout_peric1_usi10_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI11_USI, "dout_peric1_usi11_usi",
+	    "mout_peric1_usi11_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI12_USI, "dout_peric1_usi12_usi",
+	    "mout_peric1_usi12_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI13_USI, "dout_peric1_usi13_usi",
+	    "mout_peric1_usi13_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI13_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI14_USI, "dout_peric1_usi14_usi",
+	    "mout_peric1_usi14_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI14_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI15_USI, "dout_peric1_usi15_usi",
+	    "mout_peric1_usi15_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI15_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI16_USI, "dout_peric1_usi16_usi",
+	    "mout_peric1_usi16_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI17_USI, "dout_peric1_usi17_usi",
+	    "mout_peric1_usi17_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI,
+	    0, 4),
+	/* USI_I2C */
+	DIV(CLK_DOUT_PERIC1_USI_I2C, "dout_peric1_usi_i2c",
+	    "mout_peric1_usi_i2c", CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C, 0, 4),
+	/* USI_I3C */
+	DIV(CLK_DOUT_PERIC1_I3C, "dout_peric1_i3c",
+	    "mout_peric1_i3c", CLK_CON_DIV_DIV_CLK_PERIC1_I3C, 0, 4),
+};
+
+static const struct samsung_cmu_info peric1_cmu_info __initconst = {
+	.mux_clks		= peric1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric1_mux_clks),
+	.div_clks		= peric1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric1_div_clks),
+	.nr_clk_ids		= CLKS_NR_PERIC1,
+	.clk_regs		= peric1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+	.clk_name		= "noc",
+};
+
+/* ---- CMU_MISC --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MISC (0x10020000) */
+#define PLL_CON0_MUX_CLKCMU_MISC_NOC_USER	0x600
+#define CLK_CON_MUX_MUX_CLK_MISC_GIC		0x1000
+#define CLK_CON_DIV_CLKCMU_OTP			0x1800
+#define CLK_CON_DIV_DIV_CLK_MISC_NOCP		0x1804
+#define CLK_CON_DIV_DIV_CLK_MISC_OSC_DIV2	0x1808
+
+static const unsigned long misc_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_MISC_NOC_USER,
+	CLK_CON_MUX_MUX_CLK_MISC_GIC,
+	CLK_CON_DIV_CLKCMU_OTP,
+	CLK_CON_DIV_DIV_CLK_MISC_NOCP,
+	CLK_CON_DIV_DIV_CLK_MISC_OSC_DIV2,
+};
+
+/* List of parent clocks for Muxes in CMU_MISC */
+PNAME(mout_misc_noc_user_p) = { "oscclk", "dout_clkcmu_misc_noc" };
+PNAME(mout_misc_gic_p) = { "dout_misc_nocp", "oscclk" };
+
+static const struct samsung_mux_clock misc_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MISC_NOC_USER, "mout_misc_noc_user",
+	    mout_misc_noc_user_p, PLL_CON0_MUX_CLKCMU_MISC_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_MISC_GIC, "mout_misc_gic",
+	    mout_misc_gic_p, CLK_CON_MUX_MUX_CLK_MISC_GIC, 0, 1),
+};
+
+static const struct samsung_div_clock misc_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MISC_NOCP, "dout_misc_nocp",
+	    "mout_misc_noc_user", CLK_CON_DIV_DIV_CLK_MISC_NOCP,
+	    0, 3),
+};
+
+static const struct samsung_fixed_factor_clock misc_fixed_factor_clks[] __initconst = {
+	FFACTOR(CLK_DOUT_MISC_OTP, "dout_misc_otp",
+		"oscclk", 1, 10, 0),
+	FFACTOR(CLK_DOUT_MISC_OSC_DIV2, "dout_misc_osc_div2",
+		"oscclk", 1, 2, 0),
+};
+
+static const struct samsung_cmu_info misc_cmu_info __initconst = {
+	.mux_clks		= misc_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(misc_mux_clks),
+	.div_clks		= misc_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(misc_div_clks),
+	.fixed_factor_clks	= misc_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(misc_fixed_factor_clks),
+	.nr_clk_ids		= CLKS_NR_MISC,
+	.clk_regs		= misc_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
+	.clk_name		= "noc",
+};
+
+/* ---- CMU_HSI0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_HSI0 (0x16000000) */
+#define PLL_CON0_MUX_CLKCMU_HSI0_NOC_USER	0x600
+#define CLK_CON_DIV_DIV_CLK_HSI0_PCIE_APB	0x1800
+
+static const unsigned long hsi0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_HSI0_NOC_USER,
+	CLK_CON_DIV_DIV_CLK_HSI0_PCIE_APB,
+};
+
+/* List of parent clocks for Muxes in CMU_HSI0 */
+PNAME(mout_hsi0_noc_user_p) = { "oscclk", "dout_clkcmu_hsi0_noc" };
+
+static const struct samsung_mux_clock hsi0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_HSI0_NOC_USER, "mout_hsi0_noc_user",
+	    mout_hsi0_noc_user_p, PLL_CON0_MUX_CLKCMU_HSI0_NOC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock hsi0_div_clks[] __initconst = {
+	DIV(CLK_DOUT_HSI0_PCIE_APB, "dout_hsi0_pcie_apb",
+	    "mout_hsi0_noc_user", CLK_CON_DIV_DIV_CLK_HSI0_PCIE_APB,
+	    0, 4),
+};
+
+static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
+	.mux_clks		= hsi0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(hsi0_mux_clks),
+	.div_clks		= hsi0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(hsi0_div_clks),
+	.nr_clk_ids		= CLKS_NR_HSI0,
+	.clk_regs		= hsi0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(hsi0_clk_regs),
+	.clk_name		= "noc",
+};
+
+/* ---- CMU_HSI1 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_HSI1 (0x16400000) */
+#define PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER	0x600
+#define PLL_CON0_MUX_CLKCMU_HSI1_NOC_USER	0x610
+#define PLL_CON0_MUX_CLKCMU_HSI1_USBDRD_USER	0x620
+#define CLK_CON_MUX_MUX_CLK_HSI1_USBDRD		0x1000
+
+static const unsigned long hsi1_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER,
+	PLL_CON0_MUX_CLKCMU_HSI1_NOC_USER,
+	PLL_CON0_MUX_CLKCMU_HSI1_USBDRD_USER,
+	CLK_CON_MUX_MUX_CLK_HSI1_USBDRD,
+};
+
+/* List of parent clocks for Muxes in CMU_HSI1 */
+PNAME(mout_hsi1_mmc_card_user_p) = {"oscclk", "dout_clkcmu_hsi1_mmc_card"};
+PNAME(mout_hsi1_noc_user_p) = { "oscclk", "dout_clkcmu_hsi1_noc" };
+PNAME(mout_hsi1_usbdrd_user_p) = { "oscclk", "mout_clkcmu_hsi1_usbdrd" };
+PNAME(mout_hsi1_usbdrd_p) = { "dout_tcxo_div2", "mout_hsi1_usbdrd_user" };
+
+static const struct samsung_mux_clock hsi1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_HSI1_MMC_CARD_USER, "mout_hsi1_mmc_card_user",
+	    mout_hsi1_mmc_card_user_p, PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER, 4, 1),
+	MUX(CLK_MOUT_HSI1_NOC_USER, "mout_hsi1_noc_user",
+	    mout_hsi1_noc_user_p, PLL_CON0_MUX_CLKCMU_HSI1_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_HSI1_USBDRD_USER, "mout_hsi1_usbdrd_user",
+	    mout_hsi1_usbdrd_user_p, PLL_CON0_MUX_CLKCMU_HSI1_USBDRD_USER, 4, 1),
+	MUX(CLK_MOUT_HSI1_USBDRD, "mout_hsi1_usbdrd",
+	    mout_hsi1_usbdrd_p, CLK_CON_MUX_MUX_CLK_HSI1_USBDRD, 4, 1),
+};
+
+static const struct samsung_cmu_info hsi1_cmu_info __initconst = {
+	.mux_clks		= hsi1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(hsi1_mux_clks),
+	.nr_clk_ids		= CLKS_NR_HSI1,
+	.clk_regs		= hsi1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(hsi1_clk_regs),
+	.clk_name		= "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1154,6 +1431,18 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynosautov920-cmu-peric0",
 		.data = &peric0_cmu_info,
+	}, {
+		 .compatible = "samsung,exynosautov920-cmu-peric1",
+		 .data = &peric1_cmu_info,
+	}, {
+		 .compatible = "samsung,exynosautov920-cmu-misc",
+		 .data = &misc_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-hsi0",
+		.data = &hsi0_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-hsi1",
+		.data = &hsi1_cmu_info,
 	},
 	{ }
 };
-- 
2.46.0

