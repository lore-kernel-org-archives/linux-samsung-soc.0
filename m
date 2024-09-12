Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A0F1A0BEF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726137557; cv=none; b=SULO93wb7YZZYAAIrG/uvoifDK68beSq3x3ZG7fSsyOH64kjwlEAefQ9hIamqJOYB2EgBOD6VEt9nxESaU7qPT8LoN3p44KJaJC79YPmMMBBqi/el7F2xxWiMbFIP9Gx/DXUxJmPdxosj0Jsof/BkBraQI0ARWh+i8I8oXB834U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726137557; c=relaxed/simple;
	bh=iftX/Rjav/wmTPkKHdyxT06ma1pQ2ayA6pbIFzvB8jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=XFTWWPUzsOV1Oqi2d+KO3pMZuI8vfGQeaMky+eXw151dp9695aIQgP4QxTwt69VUr+Xt78iqrhzKW25lzBpOWkcAXv4SAdlArydLqW5xg//jWP5iu1lV6YGXfd8h3EjNdmXiCl7bNaOzi45mCU2IaGR9HKjfpDg4DZJL1tEkR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=u5vVlV/a; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="u5vVlV/a"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240912103905epoutp02724e82c2468609f377018393b5c7a8d5~0ePO7_qu-1053710537epoutp02V
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240912103905epoutp02724e82c2468609f377018393b5c7a8d5~0ePO7_qu-1053710537epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726137545;
	bh=phNItcOYeVZBFCYspn0CbFNikokuT1JBZyfqaWWdUSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u5vVlV/abPAEiGkjYCeXeECH3YyVtnquucEGEqkKDVER7zK3svPNN+VJXqEZKQBEa
	 HomcwIzSIkOYOelTAd5Qmcmznb9ozc1MgiXQRsrSEdZQqs7aD1bxMVkqUPxTwZDyV7
	 Ki5iKsGVgn7m9R0A74yZ7k3d2/zIV8vf3UQFieAw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240912103904epcas2p4bfb7ff02b60bfa8859bd10194d5b605a~0ePOUFyoE0547505475epcas2p4U;
	Thu, 12 Sep 2024 10:39:04 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4X4DSm1K6Vz4x9Pt; Thu, 12 Sep
	2024 10:39:04 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	62.FC.10016.7C4C2E66; Thu, 12 Sep 2024 19:39:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d~0ePNBR7L32539125391epcas2p4V;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240912103903epsmtrp21aa16164a3130a7a68db685dea851db0~0ePNAdkJr1072510725epsmtrp21;
	Thu, 12 Sep 2024 10:39:03 +0000 (GMT)
X-AuditID: b6c32a48-4b5ff70000002720-1e-66e2c4c782ce
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BC.6E.08964.7C4C2E66; Thu, 12 Sep 2024 19:39:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240912103903epsmtip156207177d0a2b1744db9409fb191d775~0ePMsYrYH3154031540epsmtip1W;
	Thu, 12 Sep 2024 10:39:02 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 2/3] clk: samsung: exynosautov920: add peric1, misc and
 hsi0/1 clock support
Date: Thu, 12 Sep 2024 19:38:55 +0900
Message-ID: <20240912103856.3330631-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmue7xI4/SDGattLJ4MG8bm8WaveeY
	LK5/ec5qMf/IOVaLl7PusVlsenyN1eJjzz1Wi8u75rBZzDi/j8ni4ilXi/97drBbHH7Tzmrx
	79pGFoumZeuZHPg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nM
	S7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBulNJoSwxpxQoFJBYXKykb2dTlF9a
	kqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ3x5oJPwb/ciuvnPrI0MD6N
	72Lk5JAQMJFoPv6NvYuRi0NIYAejxM9bM1hAEkICnxgl7rZEQiS+MUrc717FBNNx9/FXqI69
	jBL/X3QzQjgfGSUWL93F3MXIwcEmoCvx558DSFxEYD+TxK0FM1lBHGaBs4wSqw7vAdshLBAn
	0fj/AyuIzSKgKvF41XRmEJtXwF5i5rNLjBDr5CWuPz4KtppTwEFizT2I+3gFBCVOznwCZjMD
	1TRvnc0MskBCYCaHRNODxWBXSAi4SEz4HgMxR1ji1fEt7BC2lMTnd3vZIOx8icnX3zJB9DYw
	Slz7180MkbCXWHTmJzvIHGYBTYn1u/QhRipLHLkFtZZPouPwX3aIMK9ER5sQRKOaxKcrl6GG
	yEgcO/EMyvaQ6DzaAw2ryYwSzy5+YJzAqDALyTezkHwzC2HxAkbmVYxiqQXFuempxUYFJvAI
	Ts7P3cQITrZaHjsYZ7/9oHeIkYmD8RCjBAezkgjvJLZHaUK8KYmVValF+fFFpTmpxYcYTYFh
	PZFZSjQ5H5ju80riDU0sDUzMzAzNjUwNzJXEee+1zk0REkhPLEnNTk0tSC2C6WPi4JRqYDLb
	OXnGtSRep3VT7D3ypK6cva1laPsq3XLbsZ4azlv8KiYuuRFai+7J9Uw735La8f1b0OW+e2V8
	lmcKOHR+LdcUut8YZGGptsPzqPnyXUllMtOW33i6Jk2+69+cTyXJ501n3Ku87KU0Kdx5/S2+
	6IxLLSa1t26+si3OPD6pYq6t/52/F4Nf31dau0lNQyXzupWF/uKlm16eMFb4wG8oy1n86Exy
	923Pk2uCnyX8fHmzIO7aBI1ojWVBnI7rrqplHo76tvfbottMfydzxs/6cHremQ0xb+dMypvP
	r+n15IqcxooWg2kGPS9uHrzjP/lomOiVroo3yyL566K39j487z0v99qpY7t6mi+9sbizuE9C
	iaU4I9FQi7moOBEAZcZ0RT8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO7xI4/SDG7381o8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvFy1n32Cw2Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZby5
	4FPwL7fi+rmPLA2MT+O7GDk5JARMJO4+/srexcjFISSwm1Hi8ao3zBAJGYmNDf/ZIWxhifst
	R1hBbCGB94wSc8/ldjFycLAJ6Er8+ecA0isicJRJYtOCZ8wgDrPAZUaJs7sgmoUFYiTO3T7B
	CGKzCKgCLZgOtoBXwF5i5rNLjBAL5CWuPz7KBGJzCjhIrLk3gwVimb3E7l1fWCDqBSVOznwC
	ZjMD1Tdvnc08gVFgFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxguNC
	S3MH4/ZVH/QOMTJxMB5ilOBgVhLhncT2KE2INyWxsiq1KD++qDQntfgQozQHi5I4r/iL3hQh
	gfTEktTs1NSC1CKYLBMHp1QDU8s0yVnlwkxFiqxmhxtet5y0+f96/4m9O09Y7U0puFPEfcJ+
	ScsjZpMHDHomk5sEry+PvF32eKlSXfL9rTKen3dfaC66UeBSsdpqw6fmW9EhHnHXV591smXb
	5hHLv7fGqkjwd33gO4uTSz8Uz53+v+5MfLj71p4VAX/lZNZkv07u0N2Xyhr/Q1ntQF5P1wKf
	TxVbZYTUZ373zn68YJae8O9na7aerlZSd9600rLovswXS97dRc2HnUWd3B5Mqsq9vzHq46oD
	+YfC81jFDoluy+rVE/2V+INn3yKW4k6rXVvX87PJxqg0aKUecGZhPnDhQux1ozNNCQZzi7cI
	fMh1fRVRGO/5pOpjw9a/zMcNlViKMxINtZiLihMBEQ/UKPoCAAA=
X-CMS-MailID: 20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d
References: <20240912103856.3330631-1-sunyeal.hong@samsung.com>
	<CGME20240912103903epcas2p4fb9aaeafb223b63c57c2f0cac7f37c3d@epcas2p4.samsung.com>

Like CMU_PERIC1, this provides clocks for USI09 ~ USI17, USI_I2C and USI_I3C.
Like CMU_MISC, this provides clocks for MISC, GIC and OTP.
Like CMU_HSI0, this provides clocks for PCIE.
Like CMU_HSI1, this provides clocks for USB and MMC.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 290 +++++++++++++++++++++++
 1 file changed, 290 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 7ba9748c0526..d9f8e6efdbd8 100644
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
 };
 
-- 
2.46.0

