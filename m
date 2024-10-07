Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C51185952
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285522; cv=none; b=GMekoxnY7MZucItFWZJx+W3YqoGi2QfvEdLH3OB1lmUzXrwNAOybUDfbAiLHE4+dqpaYqM1eHj0apVS6gMKIteDcQ2n4al+qVYe7C55IF9u2cXlWMSm7llYq4Wp6QQch5FI87aRqGhqNF6lQVoY28HP4tR04+Ky6w/qB+R6hmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285522; c=relaxed/simple;
	bh=wFk/MmCtD1njyaZXRAVjwbJkUwNMs5iZ2HsYcLIfZUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=UDIEaK5lxgWyAKqtj7TU7XRBLDS/dQ3UBN2TTJo/YZjLC2UPQ38qyYG0UzJsLE1G9dTy/ibYy0OfmDdykL2gaV2xwXwMJ9SaBb6KN0+2Li738Varm279eeFgplQodU6b2BFa7tm1RBmQLo6SAO3d7E6BsbgE8vhpbfXgdpxxy8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LEO4afoE; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LEO4afoE"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241007071836epoutp03f1dcb83a440945fc4c95273fa94e4d9c~8GoUjyhlG2504925049epoutp03W
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:18:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241007071836epoutp03f1dcb83a440945fc4c95273fa94e4d9c~8GoUjyhlG2504925049epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728285516;
	bh=rhAj9kuYBsA53wliGhzjxfdZgLNHovYuS3VZbgQNBTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEO4afoEXCW1/HE4ewsmGETDcmJ2eHfgrDgXWLLawHbN79gRjJ0SwLlZZTZQzaLRG
	 bHV/BGhTSeDPk3c0RwQeX3aobNKcufNVDRyxkLdc1PaE3BszEYY808H3TNNJFxfRdU
	 b6+wGTwvVFsY2CP9i48e0eMAfldUuCkZdKNWL2WY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241007071835epcas2p15302ceb0481c536ecfe3d8b52fde5a28~8GoT-Qo750296602966epcas2p1h;
	Mon,  7 Oct 2024 07:18:35 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.69]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XMVqt4Tksz4x9Q8; Mon,  7 Oct
	2024 07:18:34 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	9A.89.09776.A4B83076; Mon,  7 Oct 2024 16:18:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241007071834epcas2p45175287442b1fc4497aae2f5d0c285de~8GoSv3HFV1419514195epcas2p4X;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007071834epsmtrp258f5a51187ae2bdf4074b791ff27d425~8GoSu8D4k3077230772epsmtrp2W;
	Mon,  7 Oct 2024 07:18:34 +0000 (GMT)
X-AuditID: b6c32a47-aefff70000002630-eb-67038b4aaec9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	18.7B.07371.A4B83076; Mon,  7 Oct 2024 16:18:34 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241007071833epsmtip13ee85b935888de2d42240d6ecc43e8db~8GoSgL5bz0688406884epsmtip1i;
	Mon,  7 Oct 2024 07:18:33 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v2 2/3] clk: samsung: exynosautov920: add peric1, misc and
 hsi0/1 clock support
Date: Mon,  7 Oct 2024 16:18:28 +0900
Message-ID: <20241007071829.3042094-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007071829.3042094-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmma5XN3O6Qf9ZOYsH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1qhsm4zUxJTUIoXUvOT8lMy8
	dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygO5UUyhJzSoFCAYnFxUr6djZF+aUl
	qQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2Rknjn1hLViRV7H7zl/GBsaO
	hC5GTg4JAROJhn2PWLoYuTiEBHYwSjz9eIMNwvnEKLF27hF2COcbo8SCtktsMC0P7j6DqtrL
	KPG47R8rhPORUeLFtmlADgcHm4CuxJ9/DiBxEYE9TBJbzi9hAnGYBc4yStyds4AdpEhYIFHi
	x055kKksAqoShzc+ZgexeQXsJVZcn8wCsU1e4vrjo0wgNqeAg8TdGx8ZIWoEJU7OfAJWwwxU
	07x1NjPIfAmBmRwSk57vZIVodpFY//EPE4QtLPHq+BZ2CFtK4vO7vVDv5EtMvv6WCaK5gVHi
	2r9uZoiEvcSiMz/BDmUW0JRYv0sfxJQQUJY4cgtqL59Ex+G/7BBhXomONiGIRjWJT1cuQw2R
	kTh24hmU7SFx5c1EaMBNZpSY9XUvywRGhVlI3pmF5J1ZCIsXMDKvYhRLLSjOTU8tNiowhkdx
	cn7uJkZwwtVy38E44+0HvUOMTByMhxglOJiVRHgj1jCmC/GmJFZWpRblxxeV5qQWH2I0BQb2
	RGYp0eR8YMrPK4k3NLE0MDEzMzQ3MjUwVxLnvdc6N0VIID2xJDU7NbUgtQimj4mDU6qBid86
	ra1SYfuW4tUzRJP7M5dEVUQypKkfD+s59dXlz4yLx8UyGwxXRzdI/ilcucpJ/dxW+ccWVUum
	Pef+rvBm9cLFifMk/Vv/yP3+9lvgbd0/x9lakm59EY9XBNYfD7X5o2XSfXDBWUM+We01bGUb
	z8v7B16Xn7SsWtY98WfB6+3nF0wT2v5h43OtTS7ehTxfCyTuvOL+tEz6eOxBG37OOXFPWJmT
	hE/e1VzJH8Qmeirnv9qF9rJD0QabMzLjzW+bvzbvMnjN3Lr7Z+8E9qeLpa9O3up+/4Lf8TOX
	PG/fNngv9ypGxfOCx4HVYrxpdyapPrdK9dry8tnKcKldh04d3LpfZK+WXO6CNzt4zt6dxqfE
	UpyRaKjFXFScCABjECnjQQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnK5XN3O6wfVNLBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGSeO
	fWEtWJFXsfvOX8YGxo6ELkZODgkBE4kHd5+xdTFycQgJ7GaUOP1mBzNEQkZiY8N/dghbWOJ+
	yxFWiKL3jBILr28FSnBwsAnoSvz55wASFxE4xCQx8fNTFhCHWeAyo8Sxu5PBJgkLxEv8ujWf
	EcRmEVCVOLzxMdhUXgF7iRXXJ7NAbJCXuP74KBOIzSngIHH3xkeweiGgmhdn3zNC1AtKnJz5
	BKyeGai+eets5gmMArOQpGYhSS1gZFrFKJlaUJybnptsWGCYl1quV5yYW1yal66XnJ+7iREc
	G1oaOxjvzf+nd4iRiYPxEKMEB7OSCG/EGsZ0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryGM2an
	CAmkJ5akZqemFqQWwWSZODilGph2COo5OX106fh08KqWRM+x3MuZnN0Mz3XtbN3TmptfaRjr
	pd1t9+hLPxHjcLrus/pvFzb96XFvun84RO/P/vjOY/2ZbV/aLe6s4Kw6J9TLu8OfXzvT3VTo
	ScqtfzdWfl346ffin1OnTBCY0PywPTQg6uRm40im63fPrGAsa/h8wdRF7eGiwzyKRm1vVW8t
	OctZwL2pLnpdRMpcNrO1B6xNYj86eAqsmTvnU+2po26MSxcmLzukwlPQGhEifpVDbvs92Tdz
	qh3DLb+ruYbLuJ53n/i0L9fejFmErevypZbzMZq/RW712no1s9y5FNgcIL/dST4tZm1l+R3N
	2bfSZ822Ub2nUJUpdX/znWlFr5RYijMSDbWYi4oTAfXhNfH8AgAA
X-CMS-MailID: 20241007071834epcas2p45175287442b1fc4497aae2f5d0c285de
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071834epcas2p45175287442b1fc4497aae2f5d0c285de
References: <20241007071829.3042094-1-sunyeal.hong@samsung.com>
	<CGME20241007071834epcas2p45175287442b1fc4497aae2f5d0c285de@epcas2p4.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_PERIC1, this provides clocks for USI09 ~ USI17, USI_I2C and USI_I3C.
CMU_MISC, this provides clocks for MISC, GIC and OTP.
CMU_HSI0, this provides clocks for PCIE.
CMU_HSI1, this provides clocks for USB and MMC.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 290 +++++++++++++++++++++++
 1 file changed, 290 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index f60f0a0c598d..f96998b0a864 100644
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
@@ -1154,6 +1431,19 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
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
+	}, {
 	},
 	{ }
 };
-- 
2.46.0

