Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DAB321D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722227469; cv=none; b=eoirKgUy1lSFtpqigqz4uX/NVcy6WRt3md35os02GSZzundiWq4IKci/K4BzdszOdnZLqQKbs34h26tvKd9Q3MmPktk9waYKxd5GV5QbLwSkPUolMiY6AwnSU3WsuNUUIBv8BUpIqpVg+94DvL/XEU7oxAbjhrBsjqhua2mCmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722227469; c=relaxed/simple;
	bh=iTUhhoRU5HL63irCLUt43QUjivIRS8EstPcnmxLQCro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=jGCetKdosI7Da+9q8XCe3XN83bZh+ziP7Kxyt6HcyPfeG6Sthio5+o+m2aDvnmyJvpL7yimlFaM2ya9jxjWjKrPggQO5vtTw8PGydcmRjoJa6ypI0NZK9kSFgvLIUUeiHcv5VWIzwmSMLGe02gj9Wc8E4w0wH6gEhYu3dVjKUww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qaKlVzTM; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qaKlVzTM"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240729043104epoutp021bff483034b6c9ec43c1e94bd72cf8c2~mlMEqse321203112031epoutp02H
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 04:31:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240729043104epoutp021bff483034b6c9ec43c1e94bd72cf8c2~mlMEqse321203112031epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722227464;
	bh=WG4pekMnekNHbH9qbttvlmoxeH6/97stlcOmnMH/o0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qaKlVzTMA8YHHDEvaS+R9RKa2SeeNeBgU/fDVft07Wox6EA2kEGHHZpX2n/4+Z44g
	 NkKn+Q45sfR0jUyFYZEyRCRsfLTJ9ImuQf5K66ascvfWkIynM2y1ZOZw0at8loxL/D
	 PD3evB/Cojo631GpjnVBT+AorZ+7x6lmFyeevBl0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20240729043104epcas1p43aabc0eace945f5c9e93168d1faac38c~mlMEJq5We2386323863epcas1p4W;
	Mon, 29 Jul 2024 04:31:04 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.132]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WXQQv0wfyz4x9Pw; Mon, 29 Jul
	2024 04:31:03 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E2.08.19509.60B17A66; Mon, 29 Jul 2024 13:31:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20240729043102epcas1p4e4c20eb6335103e4956f7233d35cd79b~mlMCg3xLD2709827098epcas1p4Q;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240729043102epsmtrp19db89debd06eddbdc50621c17f808a01~mlMCfxx8p0743307433epsmtrp1B;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
X-AuditID: b6c32a4c-9ebcba8000004c35-af-66a71b06f536
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	98.24.19367.60B17A66; Mon, 29 Jul 2024 13:31:02 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240729043102epsmtip112fa8e23bfb60ac6898ab21d36e8361f~mlMCPFJUs1808918089epsmtip1C;
	Mon, 29 Jul 2024 04:31:02 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH 4/4] clk: samsung: exynosautov9: add dpum clock support
Date: Mon, 29 Jul 2024 13:30:39 +0900
Message-Id: <20240729043039.134435-5-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729043039.134435-1-k.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmgS6b9PI0g/6jlhYP5m1js1iz9xyT
	xfUvz1kt5h85x2rRu+Yqk8X58xvYLTY9vsZq8bHnHqvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksVi16w+jA5/H+xut7B47Z91l99i0qpPNY/OSeo++LasYPT5vkgtgi8q2yUhNTEktUkjN
	S85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAE6VkmhLDGnFCgUkFhcrKRv
	Z1OUX1qSqpCRX1xiq5RakJJTYFqgV5yYW1yal66Xl1piZWhgYGQKVJiQnfHh3xPmgiaNipv7
	GtkaGG8qdTFyckgImEj0fDrO1MXIxSEksIdR4szHY8wQzidGiWOdXWxwTvObeewwLZ+2HGGF
	SOxklOi93A7V8oVR4tXHk6wgVWwC6hJL2taygyREBI4DDV7SzQjiMAusZJR4sOoJC0iVsIC7
	RPfiuWwgNouAqkTHgRlgNq+AucTp9pNAYzmA9slLLH4gARLmFLCQ6Po3kRmiRFDi5EyIMcxA
	Jc1bZ4NdISEwl0Pi950bzBC3uki8ebSWBcIWlnh1fAvUD1ISL/vboOxsiaMf97JB2CUS12ct
	YoWwjSX2L53MBHIDs4CmxPpd+hC7+CTefe1hhTiNV6KjTQjmylud5RCNohJnnn6EGughsXzl
	HLADhAS6GSWm9phPYJSfheSBWUgemIWwawEj8ypGqdSC4tz01GTDAkPdvNRyeMwm5+duYgQn
	Wi2fHYzf1//VO8TIxMF4iFGCg1lJhDf+ytI0Id6UxMqq1KL8+KLSnNTiQ4ymwBCeyCwlmpwP
	TPV5JfGGJpYGJmZGxiYWhmaGSuK8Z66UpQoJpCeWpGanphakFsH0MXFwSjUwGaq8E+laOF2t
	TSOV8eMDgcczeXVarrVdmyhsp+y3e06Na7r1lNXPG7Napv8O3rkqSM/c+01G/s7mtfuZj+36
	zLt+9oHL8xdeOra17jfj2RqDh2vZp6tFz2/Yq9Rqrvcx2n2t/sTcz4rCiw62FYrc+cx/dNEJ
	fg6Fki6rKa+yvu85ZXFv/1SeC8bR2zVl9STY/z55lOTnX7gx5r/8lBWNu+yfXeY696qppTDw
	6slr2X1tk8y7vE0WsletWF6tyV8XOUXg7o6l+4XyNnSmyTW6CN3l3VvwTlHdy/25HM8pmcfR
	+rx8wTnf7q7zDo37cZFp1a1KDo0n+j41oWqxK2PSZpxtViznlCvyyK9avvmCEktxRqKhFnNR
	cSIAcsLkqz0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnC6b9PI0g0v3ZSwezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYrFq1x9GBz6P9zda2T12zrrL7rFpVSebx+Yl9R59W1YxenzeJBfAFsVlk5Kak1mWWqRv
	l8CV8eHfE+aCJo2Km/sa2RoYbyp1MXJySAiYSHzacoQVxBYS2M4ocXUiVFxUouNyI2MXIweQ
	LSxx+HBxFyMXUMknRonrt+ezg9SwCahLLGlbyw6SEBG4zCjxf8EkRhCHWWAto8TTKU/AqoQF
	3CW6F89lA7FZBFQlOg7MALN5BcwlTrefZIbYIC+x+IEESJhTwEKi699EZoiDzCXuX50AVS4o
	cXLmExYQmxmovHnrbOYJjAKzkKRmIUktYGRaxSiaWlCcm56bXGCoV5yYW1yal66XnJ+7iREc
	GVpBOxiXrf+rd4iRiYPxEKMEB7OSCG/8laVpQrwpiZVVqUX58UWlOanFhxilOViUxHmVczpT
	hATSE0tSs1NTC1KLYLJMHJxSDUyMqQ8y9n3dpjlhQXAE/2LjE6fEDl958OiN9sclDr5fJ3rf
	OXv8x58fVkfs9/dr+FxX3HvrWYW+6l6FN7FyB919zwsGz7LVSF2V6BnbY+8kZznLvc1nl4X6
	9bAFn5tLvk5xbd8va3Czbd7J3ETXu64n86UCYjzZts6w/qhbEsux/3P2hANe7Cy7VtZ2t/qr
	e7440sg6befj325phifeXp7tL5+w2OpK84UVcfIPrrit9+JymH1cNaPkrFxqX5vr2klzY2O6
	v+3VnXtfkfOlg8oiDddHLyLu/5QS9dZ6r/6383FrzNq2hSc29TYcCZbPUDywxkxI7/jpK1fC
	bT5Mep38hTO9O6hQv+3W7mAX+aVKLMUZiYZazEXFiQBvgue++wIAAA==
X-CMS-MailID: 20240729043102epcas1p4e4c20eb6335103e4956f7233d35cd79b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240729043102epcas1p4e4c20eb6335103e4956f7233d35cd79b
References: <20240729043039.134435-1-k.son@samsung.com>
	<CGME20240729043102epcas1p4e4c20eb6335103e4956f7233d35cd79b@epcas1p4.samsung.com>

Add dpum clock for exynosautov9.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 83 ++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index f04bacacab2c..3569748b30a9 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -20,6 +20,7 @@
 #define CLKS_NR_TOP			(GOUT_CLKCMU_PERIS_BUS + 1)
 #define CLKS_NR_BUSMC			(CLK_GOUT_BUSMC_SPDMA_PCLK + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_CORE_CMU_CORE_PCLK + 1)
+#define CLKS_NR_DPUM			(CLK_GOUT_DPUM_SYSMMU_D3_CLK + 1)
 #define CLKS_NR_FSYS0			(CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK + 1)
 #define CLKS_NR_FSYS1			(CLK_GOUT_FSYS1_USB30_1_ACLK + 1)
 #define CLKS_NR_FSYS2			(CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO + 1)
@@ -1076,6 +1077,85 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_core_bus",
 };
 
+/* ---- CMU_DPUM ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_DPUM (0x18c00000) */
+#define PLL_CON0_MUX_CLKCMU_DPUM_BUS_USER				0x0600
+#define CLK_CON_DIV_DIV_CLK_DPUM_BUSP					0x1800
+#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DECON		0x202c
+#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DMA		0x2030
+#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DPP		0x2034
+#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D0_DPUM_IPCLKPORT_CLK_S1	0x207c
+#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D1_DPUM_IPCLKPORT_CLK_S1	0x2084
+#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D2_DPUM_IPCLKPORT_CLK_S1	0x208c
+#define CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D3_DPUM_IPCLKPORT_CLK_S1	0x2094
+
+static const unsigned long dpum_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_DPUM_BUS_USER,
+	CLK_CON_DIV_DIV_CLK_DPUM_BUSP,
+	CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DECON,
+	CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DMA,
+	CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DPP,
+	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D0_DPUM_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D1_DPUM_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D2_DPUM_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D3_DPUM_IPCLKPORT_CLK_S1,
+};
+
+PNAME(mout_dpum_bus_user_p) = { "oscclk", "dout_clkcmu_dpum_bus" };
+
+static const struct samsung_mux_clock dpum_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_DPUM_BUS_USER, "mout_dpum_bus_user",
+	    mout_dpum_bus_user_p, PLL_CON0_MUX_CLKCMU_DPUM_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock dpum_div_clks[] __initconst = {
+	DIV(CLK_DOUT_DPUM_BUSP, "dout_dpum_busp", "mout_dpum_bus_user",
+	    CLK_CON_DIV_DIV_CLK_DPUM_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock dpum_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_DPUM_ACLK_DECON, "gout_dpum_decon_aclk",
+	     "mout_dpum_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DECON, 21,
+	     0, 0),
+	GATE(CLK_GOUT_DPUM_ACLK_DMA, "gout_dpum_dma_aclk", "mout_dpum_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DMA, 21,
+	     0, 0),
+	GATE(CLK_GOUT_DPUM_ACLK_DPP, "gout_dpum_dpp_aclk", "mout_dpum_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_DPUM_IPCLKPORT_ACLK_DPP, 21,
+	     0, 0),
+	GATE(CLK_GOUT_DPUM_SYSMMU_D0_CLK, "gout_dpum_sysmmu_d0_clk",
+	     "mout_dpum_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D0_DPUM_IPCLKPORT_CLK_S1, 21,
+	     0, 0),
+	GATE(CLK_GOUT_DPUM_SYSMMU_D1_CLK, "gout_dpum_sysmmu_d1_clk",
+	     "mout_dpum_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D1_DPUM_IPCLKPORT_CLK_S1, 21,
+	     0, 0),
+	GATE(CLK_GOUT_DPUM_SYSMMU_D2_CLK, "gout_dpum_sysmmu_d2_clk",
+	     "mout_dpum_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D2_DPUM_IPCLKPORT_CLK_S1, 21,
+	     0, 0),
+	GATE(CLK_GOUT_DPUM_SYSMMU_D3_CLK, "gout_dpum_sysmmu_d3_clk",
+	     "mout_dpum_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPUM_UID_SYSMMU_D3_DPUM_IPCLKPORT_CLK_S1, 21,
+	     0, 0),
+};
+
+static const struct samsung_cmu_info dpum_cmu_info __initconst = {
+	.mux_clks		= dpum_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(dpum_mux_clks),
+	.div_clks		= dpum_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(dpum_div_clks),
+	.gate_clks		= dpum_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(dpum_gate_clks),
+	.nr_clk_ids		= CLKS_NR_DPUM,
+	.clk_regs		= dpum_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(dpum_clk_regs),
+	.clk_name		= "dout_clkcmu_dpum_bus",
+};
+
 /* ---- CMU_FSYS0 ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_FSYS2 (0x17700000) */
@@ -2085,6 +2165,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-dpum",
+		.data = &dpum_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-fsys0",
 		.data = &fsys0_cmu_info,
-- 
2.39.2

