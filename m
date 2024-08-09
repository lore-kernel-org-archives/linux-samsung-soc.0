Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B135194090
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723204513; cv=none; b=Jnwbyf84IGUFvQgGAIeUl7NIxB1yE3RJw84hWSZO272krEQspShFCGdzzKHrrNrVgcNQi3mpt3WIzRbWermXm2dakSBtA2SPGrpivxeGHduSeyDMBt4guxhylFXTA6oxR2Q7p7FF7Bq+12H5GBUKre1boq7VTS/Sa6fI6y3NhYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723204513; c=relaxed/simple;
	bh=R0q/IOIPXcMsyPFLcPBQhRysfTBtfQH3cXZEtAybYwE=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=VtTDlOasNLO0QW58gjRsLwzHZCrHhl2U4UQilLXY36h20xib81RioCxSt8N3XgcLlP/jqDDf1qP+K21YNWim3YUFxFiZKr3HBgRdBg9+5N2/pGfEIYMOFcvLuwmXT8HHKk6i322MQ6PpJe2S8nsF+gUjcPMH3SDc/TVTtA/HGII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BJLG+l31; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BJLG+l31"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240809115502epoutp0245e6d8aa31ccd2aab87a17e599b85184~qDV2CrtS13024430244epoutp02X
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240809115502epoutp0245e6d8aa31ccd2aab87a17e599b85184~qDV2CrtS13024430244epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723204502;
	bh=oNAixaoIFl5Jvo3oZWyuHNh3u30bHQ/tEZRYaZSbFuo=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=BJLG+l313+FkuNYdK2p+D02xfp0pYfDPjMgLi0k/n+cdvnDa2L2Nn+Xjw+NTec/53
	 Mi0uK7jR0JkbF3myBO57rZK6xzQgU7SYie0Az3UDj/anUSnlIQTu1fjv9eg42YPjt0
	 zbBsindns0hjH4P+K49Qa7FWhcDuowgxMC/Vspfg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20240809115502epcas1p488f61f09bd9f63b57fdfd74213788467~qDV1lA_Gi2221722217epcas1p4f;
	Fri,  9 Aug 2024 11:55:02 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.132]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WgMm51dprz4x9Px; Fri,  9 Aug
	2024 11:55:01 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D9.53.19509.49306B66; Fri,  9 Aug 2024 20:55:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20240809115500epcas1p458405a51caf1af8e9d4e2f7130b82725~qDV0N67Oo0888308883epcas1p4c;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240809115500epsmtrp18737ddff3c97a3b506951fea438610fa~qDV0M33Fa2135421354epsmtrp1f;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
X-AuditID: b6c32a4c-10bff70000004c35-16-66b603941f99
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	01.53.19367.49306B66; Fri,  9 Aug 2024 20:55:00 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240809115500epsmtip1cac26f8bc4791bba8bace1794fb38bf6~qDVz2Q_xT0657906579epsmtip1l;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Fri, 09 Aug 2024 20:54:14 +0900
Subject: [PATCH v3 3/3] clk: samsung: exynosautov9: add dpum clock support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-clk_dpum-v3-3-359decc30fe2@samsung.com>
In-Reply-To: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,  Sylwester Nawrocki
	<s.nawrocki@samsung.com>,  Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmru5U5m1pBud/Mlo8mLeNzeLyfm2L
	NXvPMVlc//Kc1WL+kXOsFr1rrjJZvJx1j83i/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4
	eMrV4v+eHewWh9+0s1r8u7aRxWLVrj+MDoIe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8
	SS6ALSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfo
	dCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEp
	UGFCdkbX2/ksBb/VK9bvDW9gvKDUxcjJISFgIvF1yS5WEFtIYA+jxPuV9V2MXED2J0aJvX13
	2eGc/9cuMsN03N6+Hiqxk1Hi7+bdjBDtrxglpm70BLHZBNQllrStZQexWQRUJe6+OsoCYgsL
	eEls6ZkLZvMKCEqcnPkEzGYWkJfY/nYOM0TcVuLcvWVgNqeAncSxY6dYQZaJCOxnljj18Dkb
	iMMscIJR4tftBYwQJwlLfN69BiwhIXCCQ+L448dQCReJFb8+MsEUvTq+hR3ClpJ42d8GZWdL
	HP24lw3CLpG4PmsRK4RtLLF/6WSgXg6gbZoS63fpQ1zKJ/Huaw8rSFhCgFeio00IwpSXuNVZ
	DtEoKnHm6UeogR4S139+ZIME1kRGifa3b1kmMMrPQvL/LCT/z0JYtoCReRWjVGpBcW56arJh
	gaFuXmo5PGKT83M3MYJTsJbPDsbv6//qHWJk4mA8xCjBwawkwtscvilNiDclsbIqtSg/vqg0
	J7X4EKMpMCYmMkuJJucDs0BeSbyhiaWBiZmRsYmFoZmhkjjvmStlqUIC6YklqdmpqQWpRTB9
	TBycUg1MBsnipYmvAsRcmo4KTdgtPNvv/AWnsInJU9yO3cm0+bM2Ks8s0O5gY4Y3+33lECnJ
	nVdeaS1ODWFW4mf+nJ603jRJOi++R/xBcNfVQ7WbLK8W2opwp2z/+vCVs4w/+yX2HWzz11U+
	Fkxb4Hdq6zPtnR+4bLQ6yzQvsL1tZ9waspgzWtliy5Oq334ZkfU8BTHJf7IkFBevmVd08vA0
	lRvya2aGyOXb8uz5qVU8d+MKca3TqVbPfTPXTGHVfrtUdUJA9owNp+1aXluI79M+qnW1ser1
	sROpueve8vI3B9RJnLuskZhQ2PNx+qtJppbuaRknxOulfju3HfXaJ1b//em1lhC5XFF9vn8b
	n4qumqDEUpyRaKjFXFScCABUZnPcSgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJTncK87Y0g33nFC0ezNvGZnF5v7bF
	mr3nmCyuf3nOajH/yDlWi941V5ksXs66x2Zx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlc
	POVq8X/PDnaLw2/aWS3+XdvIYrFq1x9GB0GP9zda2T12zrrL7rFpVSebx+Yl9R59W1Yxenze
	JBfAFsVlk5Kak1mWWqRvl8CV0fV2PkvBb/WK9XvDGxgvKHUxcnJICJhI3N6+nr2LkYtDSGA7
	o8Td9YeYIRKiEh2XGxm7GDmAbGGJw4eLIWpeMEpcevQRrIZNQF1iSdtadhCbRUBV4u6roywg
	trCAl8SWnrlgNq+AoMTJmU9YQOYwC2hKrN+lDxJmFpCX2P52DjNEia3EuXvLmEFKhIDs80/Y
	QMKcAnYSx46dYgVZKyJwkFni95tvYHcyC5xklJi4YDs7xJ3CEp93r2GbwCg4C8m6WQjrZiFZ
	t4CReRWjaGpBcW56bnKBoV5xYm5xaV66XnJ+7iZGcIRpBe1gXLb+r94hRiYOxkOMEhzMSiK8
	zeGb0oR4UxIrq1KL8uOLSnNSiw8xSnOwKInzKud0pggJpCeWpGanphakFsFkmTg4pRqYRLmm
	yh6ZWrS5ZDWzZVLkVpn6aXYGZ1xNdx3TNbXZ8nGCuFuAZ1PIzoaDefcX8QgJ1qQ9fOfY88Ez
	b8/5mMBNhZtW/VtgX7AvJKb5bF/iqhjmiAky109oLrxW+mVn78IXR65/LF2z99PWojhTwcdT
	F7JxPZ4yMbGO//wVG9GjE7cFcIl+1KnX/VV6ePOE+4/rRA476lya2W1/OcbURNjGRzRh/fpO
	Y+3WZ10Jfayrz/Ee27/jnLXzu6l6T9imnDPtmH8qv3jzqswJP1RlNnv7HJujFtN5qvhHpEr0
	mzDvnOSm7NgzuTaKP87Irj286sa5aQxhvwwerFtpF5lWOrfM8ORUnbM2t2azvNmV/JE1UYml
	OCPRUIu5qDgRAN44CHMfAwAA
X-CMS-MailID: 20240809115500epcas1p458405a51caf1af8e9d4e2f7130b82725
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240809115500epcas1p458405a51caf1af8e9d4e2f7130b82725
References: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
	<CGME20240809115500epcas1p458405a51caf1af8e9d4e2f7130b82725@epcas1p4.samsung.com>

Add dpum clock for exynosautov9.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 83 ++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index f04bacacab2c..5971e680e566 100644
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
+	.clk_name		= "bus",
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

