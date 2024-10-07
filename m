Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCE8187874
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728285228; cv=none; b=A+ANQ5KkXSaKpQXc/YkjXCprqoa37NgJ4+WBNoUDQ0sU8eE9yNLHevRapxrF7GfRBbAWOjJRWXy5bRHYs6ByiBKQOfhTJ/h/LXORh2E4EPOhCzYvg+0tjtKo5PPPrh4ltDQ2e8952spTGbDBYqV0cPNMnsGls7bSFGW54rDVxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728285228; c=relaxed/simple;
	bh=wFk/MmCtD1njyaZXRAVjwbJkUwNMs5iZ2HsYcLIfZUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=G7yE674DGwJNsfCyXu8fdJ0GvwDJ5BMDsNL1jNBfFQ+ohBfLFMvwANJ8QxZE8iChfO9OA49Qx5T6qcdHFXuijN3Rwy/Win10YziGV0lth8ukJ1hd2yKF67IqYsAZzo2bunrLwKk5U/VntnZvrz0vlwbu2O1PeT53uZFUEgrUrAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mvU4tPYu; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mvU4tPYu"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241007071340epoutp0305cfc00732635d1b4c613662ea050b69~8GkBF7uKR2031620316epoutp03x
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 07:13:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241007071340epoutp0305cfc00732635d1b4c613662ea050b69~8GkBF7uKR2031620316epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728285220;
	bh=rhAj9kuYBsA53wliGhzjxfdZgLNHovYuS3VZbgQNBTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mvU4tPYuHp74SPvvbdhl3p7ywf4Y0qxUFzU9xth1xdornTVq/nLA0HukYaJM8x+5d
	 8zD5CQqy2jWoGqvUF8+fRIlBvmv1PU6FjjdofEGmqYuDjoK0aOCkZ5c5AD+Da3G9k0
	 wY+Mln2RcY2mJgknOjDU2dkUpDYp46j73aq1QmVk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241007071339epcas2p4ee527fc0ddd1442a0f649cc59d80ab8c~8GkAlvC_g2310723107epcas2p4W;
	Mon,  7 Oct 2024 07:13:39 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XMVkC1d5Hz4x9QJ; Mon,  7 Oct
	2024 07:13:39 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	D2.B9.09770.32A83076; Mon,  7 Oct 2024 16:13:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241007071338epcas2p38971f2dc241357031befe59e4c4a9241~8Gj-ZInvS0629006290epcas2p3Z;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241007071338epsmtrp231e5736c4783d8e356116816df613215~8Gj-YWW0W2804728047epsmtrp2-;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
X-AuditID: b6c32a46-00dfa7000000262a-f6-67038a237c29
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4D.EA.07371.22A83076; Mon,  7 Oct 2024 16:13:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241007071338epsmtip2704d021d8abe83bb214f524533bb7518~8Gj-GICwE1371013710epsmtip2-;
	Mon,  7 Oct 2024 07:13:38 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v1 2/3] clk: samsung: exynosautov920: add peric1, misc and
 hsi0/1 clock support
Date: Mon,  7 Oct 2024 16:13:32 +0900
Message-ID: <20241007071333.3011125-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007071333.3011125-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmha5yF3O6waoVrBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjNOHPvCWrAir2L3nb+MDYwd
	CV2MnBwSAiYSh55MZu5i5OIQEtjBKDH33V4WCOcTo8Tla4uYIJxvjBJv/v5kh2mZt3ING0Ri
	L6PEi0/T2SGcj4wSG+c/Z+xi5OBgE9CV+PPPASQuIrCHSWLL+SVgo5gFzjJK3J2zAGyUsECi
	xIb/9xlBbBYBVYn1K1aAxXkF7CVOz9rCBLFOXuL646NgNqeAg8Szcw8ZIWoEJU7OfMICYjMD
	1TRvnQ32hYTAXA6J7otLoZpdJJpWr2aDsIUlXh3fAvWDlMTnd3uh4vkSk6+/ZYJobmCUuPav
	mxkiYS+x6AzI0xxAGzQl1u/SBzElBJQljtyC2ssn0XH4LztEmFeio00IolFN4tOVy1BDZCSO
	nXgGZXtInJw+DxpYkxklFvWeYp/AqDALyTuzkLwzC2HxAkbmVYxiqQXFuempxUYFRvA4Ts7P
	3cQITrlabjsYp7z9oHeIkYmD8RCjBAezkghvxBrGdCHelMTKqtSi/Pii0pzU4kOMpsDAnsgs
	JZqcD0z6eSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1MB3lVVba
	HfuL2yM44nC5+q++u/5Xjz+Z9Gdd89YPJg/eXmkMOdJ1mbnysi+voF/4g9NX3wizvQpxVQ+9
	82nuSjeXBlERFal6vj82k2y8lsZxbb84Te6ZmeOiExN84uY/+P2IY8sfFxkjx/m7ZEwvfdPX
	Xb1mouq7eUeE1zPKuqVMWfripN3bmCtbl93M/fL2475rh9fF+xU8ckgKX3Kf791Uj0Pbe5i/
	GUu9X/tnrcUL/lTTnautcwomXfznY92xRTU788avEzUTcxOLbzWG/fwg1Gd8LS/l28niKl8h
	ZtZAv0sezkf3tPrNKOL7HdxQXGF6forpl5yzJ2PqxRcmV4SfEnn+sP+Zs1N8yWWH+J9KLMUZ
	iYZazEXFiQB/v1NLQgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSvK5SF3O6QcsZcYsH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujBPH
	vrAWrMir2H3nL2MDY0dCFyMnh4SAicS8lWvYQGwhgd2MEuenJEPEZSQ2Nvxnh7CFJe63HGHt
	YuQCqnnPKHGzdw5zFyMHB5uArsSffw4gcRGBQ0wSEz8/ZQFxmAUuM0ocuzsZrEhYIF7i8ocg
	kEEsAqoS61esABvKK2AvcXrWFiaIBfIS1x8fBbM5BRwknp17yAjSKgRUc/NDAkS5oMTJmU9Y
	QGxmoPLmrbOZJzAKzEKSmoUktYCRaRWjZGpBcW56brJhgWFearlecWJucWleul5yfu4mRnBU
	aGnsYLw3/5/eIUYmDsZDjBIczEoivBFrGNOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xrOmJ0i
	JJCeWJKanZpakFoEk2Xi4JRqYFr74o8Ee321wctK9b627hMtX/8f/uZ1VWLO0lObf7EJt4na
	v5yeGfyS997bo9sqz65LvvGkiYOltSqw8exrFavUCaKmdSu8hJWCM68E+p3xmj1Jwmb1H4/T
	Mikx6ucvsZmce79tz6Od3xO0iiO5/304k6zhsUVJUt9l0mZphreSOpoxvwSNu5cHbY1Qc4vU
	m+dvfP68T+5vyR1CKqfr5Vu97tXesbn3cZqKLSPn8l0/D/HP83nDvvHsD+7gjoqXjNvniZre
	SFOySfJZWv3j8Plb8+bpa/xeYyp/5shBCeOjcVMXC+1ar5S1V8RGecsl5VdnHkpqyhw9tzBH
	NXXJrfy/v0/UK5+9uXZJfcmF43uUWIozEg21mIuKEwErLdiz+QIAAA==
X-CMS-MailID: 20241007071338epcas2p38971f2dc241357031befe59e4c4a9241
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007071338epcas2p38971f2dc241357031befe59e4c4a9241
References: <20241007071333.3011125-1-sunyeal.hong@samsung.com>
	<CGME20241007071338epcas2p38971f2dc241357031befe59e4c4a9241@epcas2p3.samsung.com>

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

