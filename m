Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B73198858
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338194; cv=none; b=mwGJ6kATVqsE6vaa8StF8gVlYcogJ6x8kPgZxJcgaljwGo+Fd9ac6bqq3cQULgWr6PA/zuSFTxg220rc/va0UP8acGqzA1XIu5FfOR2xEprKk3aVrfSzGETrBQent2lauTyWl4RcwODTFx6YWs6JEEVpqAkbLwXp7EKHYkW5ORE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338194; c=relaxed/simple;
	bh=iTUhhoRU5HL63irCLUt43QUjivIRS8EstPcnmxLQCro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=SreNrB98ygvScXkSM02xXHwN91mQaSokB85I903CrEnELzUa7TCa92npuwbSGy2Vf8fMe3/zYfNhCBPVorEnsPt/JxNVNTN5X2UI1UDdeaOWJeDwy8QxWcd+OiRirYsYQQ+KEZc6LSU22H5eT3RMZKCC+MdBGL/vlfkdox2/MeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WStXUzTd; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WStXUzTd"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240730111630epoutp01c832b653a1fc8029372e8e4764134b92~m_XWRSjW-0516905169epoutp01E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 11:16:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240730111630epoutp01c832b653a1fc8029372e8e4764134b92~m_XWRSjW-0516905169epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722338190;
	bh=WG4pekMnekNHbH9qbttvlmoxeH6/97stlcOmnMH/o0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WStXUzTdFSAWfGhrCCgk2CsH4F9ichXLAuAV2/TVFBAU768k8m5t8jJaSTMZWrK4a
	 Vu/Vdrxk7H7XFcisW6nsSIUOOUuzjypTQ9+sqCZEqp40i1VYW4hK8p1++67Iuc6BOK
	 ebdj7NrHuuHfY6IS9q1A2qFdRY+tUaf1Aluib+WA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240730111630epcas1p14390fa39cdc2bfe461401c914432bd47~m_XVnwNq21944719447epcas1p13;
	Tue, 30 Jul 2024 11:16:30 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.136]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WYCNF23t7z4x9Pt; Tue, 30 Jul
	2024 11:16:29 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	16.54.09623.D8BC8A66; Tue, 30 Jul 2024 20:16:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240730111628epcas1p2c9daa7b7e637f4d66814584519b4b1bf~m_XUL2RDT2584725847epcas1p2F;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730111628epsmtrp1128ee3505d0d846ff8c0b0dfd011e84d~m_XULDdtD2131621316epsmtrp1N;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
X-AuditID: b6c32a36-ef9ff70000002597-27-66a8cb8d115f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D8.B2.08456.C8BC8A66; Tue, 30 Jul 2024 20:16:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240730111628epsmtip175657043f67ee07388915da8265b8bd3~m_XT5nk2u0603306033epsmtip17;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH v2 3/3] clk: samsung: exynosautov9: add dpum clock support
Date: Tue, 30 Jul 2024 20:15:35 +0900
Message-Id: <20240730111535.135301-4-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240730111535.135301-1-k.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmgW7v6RVpBl1nWC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtWid81VJovz5zewW2x6fI3V4mPPPVaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYrFq1x9GBz6P9zda2T12zrrL7rFpVSebx+Yl9R59W1YxenzeJBfAFpVtk5GamJJapJCa
	l5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0rJJCWWJOKVAoILG4WEnf
	zqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAhO+PDvyfMBU0aFTf3
	NbI1MN5U6mLk5JAQMJFouL2asYuRi0NIYAejxJlNp5ggnE+MErPmHWOGcL4xSuzvu8IG07L8
	zkOolr1AiUm/WSGcL4wSTa1nmECq2ATUJZa0rWUHSYgIHAcavKQbrIVZYCWjxINVT1hAqoQF
	vCTaHk9jB7FZBFQldu7bwQpi8wqYSxz8tQFoOQfQPnmJxQ8kQMKcAhYSza+OsUOUCEqcnAkx
	hhmopHnrbLBbJQQWckisb57FCNHrItF/0BbibGGJV8e3sEPYUhIv+9ug7GyJox/3Qr1WInF9
	1iJWCNtYYv/SyUwgY5gFNCXW79KHWMUn8e5rDyvEdF6JjjYhmCNvdZZDNIpKnHn6EWqgh0RX
	y3do8HQzSjx6eIRlAqP8LCQPzELywCyEZQsYmVcxiqUWFOempxYbFhjBYzU5P3cTIzjBapnt
	YJz09oPeIUYmDsZDjBIczEoivPFXlqYJ8aYkVlalFuXHF5XmpBYfYjQFhu5EZinR5Hxgis8r
	iTc0sTQwMTMyNrEwNDNUEuc9c6UsVUggPbEkNTs1tSC1CKaPiYNTqoFJ/sOlkAWcLM1xVZNb
	clcJ/LBNfD8xYJ/Ep3Wyjh7J8wPmL1e5NXvjuhMMvLmKOdYmFdsOZnC2MOeES+10Om0Y4vJK
	9FvQD2cJddWtrrrnX59PPyB5UKnZbktoeMQ/0eSFi+YqGuwIXf04WV3ymKvhNn4nH5Y7ktrG
	DDcmlT400zsw/8nrGX8eTCs8oOnkeTrQx/c4l8wXnvp7J7sKFLxND51y3/v79dadbUz35869
	9NL7y9IFcRucn8dZejIti/v+I2zu473X52+ZtfG2d4O4fN7kvbddb+/1YVgme87Rmem6wtf2
	n80X+Z1vP2A1vaEfzrf18jTO9St/rdzzL/S9ipadybmoDb/aZqgvfLVVWYmlOCPRUIu5qDgR
	ABvugtM5BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSnG7P6RVpBp+Py1k8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLVrj+MDnwe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8SS6ALYrLJiU1J7MstUjf
	LoEr48O/J8wFTRoVN/c1sjUw3lTqYuTkkBAwkVh+5yFjFyMXh5DAbkaJ9/OfsUIkRCU6LjcC
	JTiAbGGJw4eLIWo+MUpMWdTGDFLDJqAusaRtLTtIQkTgMqPE/wWTwCYxC6xllHg65Qk7SJWw
	gJdE2+NpYDaLgKrEzn07wDbwCphLHPy1gRlig7zE4gcSIGFOAQuJ5lfHwMqFgEo2LD/KAlEu
	KHFy5hMwmxmovHnrbOYJjAKzkKRmIUktYGRaxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yf
	u4kRHCNaWjsY96z6oHeIkYmD8RCjBAezkghv/JWlaUK8KYmVValF+fFFpTmpxYcYpTlYlMR5
	v73uTRESSE8sSc1OTS1ILYLJMnFwSjUw7bAqmtr5+ZhQ9ap9y1ySti1/H3KH6cSBY9+yVvIY
	PNZhPJa45fu/V53f5ytNDe4T9eWQSL3Kl/436k19f4N4sHmPqoa1zNuI5ScF792vq1rH+dox
	/5KdVFOi3YOCU13zF7/cvqfL+PSk1YsVr7+acCQj/TU3p2UYw0KzPtbU9h7jFLG2L9ri7WV3
	MuS5onPT7dmUnFqZVput3a6iuT7+xoPN7MYp+//PkbYonhZ0NsV/1vtbpz6aLcox6fUX4N2k
	q+d1p99gEe/cqyVXK5ir2Rh+XPKukF26wuLtp4N75sRrN0o3W4ordVvN2BP31jSwT+R4Rq92
	X3eDmUaqb+KU+Qol/7WXPp427Qf/KUslluKMREMt5qLiRADLXxN4AAMAAA==
X-CMS-MailID: 20240730111628epcas1p2c9daa7b7e637f4d66814584519b4b1bf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730111628epcas1p2c9daa7b7e637f4d66814584519b4b1bf
References: <20240730111535.135301-1-k.son@samsung.com>
	<CGME20240730111628epcas1p2c9daa7b7e637f4d66814584519b4b1bf@epcas1p2.samsung.com>

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

