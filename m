Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AB28689
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847230; cv=none; b=o6LJ2wpWVw8kyRlqwOvMtnZdknic1mOPkJh2f9BSkoF4Ot5zGoZjjzc/7alV7wWIA/in2p1TT5jWcOQlxiv8cMIC8Sk7FACaCCm/qEZxnA6sL1vE0EAh+FT5UuaNEeulassxk0mA3d4I8sz4GTX/yEzFszpx32xMND1THuIqFsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847230; c=relaxed/simple;
	bh=4gdw7KLY0bf7E4/bbQ0Yime+Sw7v4XfIJdztd+7Ty/s=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=Ud6x6Y/LUqoXD/JCMwzKz+gDlvcF0UBwFM06VGecLMCmsqk+/Y6Z1Cv5uMatZ6dFB3wQ3uKo1BGtXQFHqTCfDMyDQAS7Cn9XhA647dqqEuRakeXqlkERPjfIjJ5pwJo7TUhrkB2VzO5vZn3dG5ML7NwZE8hOuAB9Qf+jZC8g7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uHiNevB6; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uHiNevB6"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241002053345epoutp01572ad223a2f7fb22f3c8be2555ad4c28~6i_WeJd_R2729527295epoutp01c
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241002053345epoutp01572ad223a2f7fb22f3c8be2555ad4c28~6i_WeJd_R2729527295epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727847225;
	bh=kiAOLO2gl6E1YQnGjEXXcY0QWv/n6vcGITEpGA9VMhk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=uHiNevB6VJ/IxG6LfS1CY6OCD4iau1ZfGhEnFxNxC88KI+ki9LiCvPmWS50R6TYDd
	 xNG2800a39wEdzKXij0wye/mG/d3TGwCfavPzCSMdWwER2zn/ZSb5tmybw7v3UsNH/
	 bC7pwjGWjYTxiV3PRy6l9ecksRK/b4sn9/XZbtGU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241002053344epcas1p292465a00a9517cbd47461cba4b035351~6i_WGZ97W3276032760epcas1p2i;
	Wed,  2 Oct 2024 05:33:44 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.237]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XJNlC6vTvz4x9Q1; Wed,  2 Oct
	2024 05:33:43 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	AA.07.09403.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20241002053342epcas1p342b73a5c369bcda11e0367555e682039~6i_TeTfS13203832038epcas1p3g;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241002053342epsmtrp192894d6e2448077a9e50d9c0c8c87a07~6i_TdlXf71588615886epsmtrp1V;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
X-AuditID: b6c32a37-297b8700000024bb-41-66fcdb36ba06
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E0.94.08229.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053341epsmtip12fea418ab9fcbcc070f28801b09c96da~6i_TTcAE42935629356epsmtip1W;
	Wed,  2 Oct 2024 05:33:41 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Wed, 02 Oct 2024 14:33:25 +0900
Subject: [PATCH WIP 5/7] clk: samsung: exynoautov9: Add dptx cmu
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-auto9-v1-5-c4dc3385f415@samsung.com>
In-Reply-To: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,  David Virag
	<virag.david003@gmail.com>,  Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmvq7Z7T9pBkdaxC0ezNvGZjHp/gQW
	i941V5kszp/fwG4x4/w+JovnfUDi+PvHjA7sHjtn3WX32LSqk83jzrU9bB59W1YxenzeJBfA
	GpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hpJC
	WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAh
	O2PN1RNMBackK2Y/38XewPhHtIuRk0NCwERi57U5TF2MXBxCAjsYJRade8cC4XxilDjZ+4kZ
	wvnGKLH0zH42mJbeGXPAbCGBvYwSOzpVIYpeMUpc33KMGSTBJqAusaRtLTuIzSKgKvHp4W5G
	EFtYwEHi9dNnYHFeAUGJkzOfsIDYzALyEtvfzgHq5QCKW0k07DAGCXMKWEusuvUUrFVE4DSj
	xP+5ihDlHhIznq1jh7hHWOLz7jVsIDdICDRySHybOwXqUBeJ7tVfmGGKXh3fAtUgJfGyvw3K
	zpY4+nEvVH2JxPVZi1ghbGOJ/UsnM4HcwyygKbF+lz7EXj6Jd197WEHCEgK8Eh1tQhCmvMSt
	znKIRlGJM08/Qg30kHg5dw0jJKT6GCW2HGadwCg/C8nvs5D8Pgth1wJG5lWMYqkFxbnpqcWG
	BcbwKE3Oz93ECE6HWuY7GKe9/aB3iJGJg/EQowQHs5II771DP9OEeFMSK6tSi/Lji0pzUosP
	MZoCY2Ais5Rocj4wIeeVxBuaWBqYmBkZm1gYmhkqifOeuVKWKiSQnliSmp2aWpBaBNPHxMEp
	1cDkvfb8z3lfwjr1k4IX3T2zscDSovX7u01+2+ft2tkx4YDPbsVp95PSo1lkbaWs/yxYsSZ8
	i/D9n52XOjWtwsOu32G2m573ZlVTWPPyBQ0/NyyaG7Beu+7l4Vf/zd6XTBW5sGL6J/HSl/lp
	tzz8DPw37q6o+rHqY5ff9G9yG96VdxmyXeaU3XLRZf2NvbkbZ4f78IUq63cEh9g8kVYIPW75
	4c+kOffkFEX8N38TOTCP1Wa2Tq3lWYu8m/sFVBbOzZv1zkfhy5+FpUsuvfh4bFvzoRMyWxYb
	5WWxBE754W3OIME4V1pw0YJZPA5TEzZILUtaOT2OefX/ZU6zujQFCmfJuhamPf7iKiAQachT
	mnl8ohJLcUaioRZzUXEiAP+PE4MQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsWy7bCSnK7Z7T9pBvsvs1g8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NYrLJiU1J7MstUjfLoErY83VE0wFpyQrZj/fxd7A+Ee0i5GTQ0LARKJ3xhy2LkYuDiGB3YwS
	rYtbWCASohIdlxsZuxg5gGxhicOHi0HCQgIvGCVeT8kAsdkE1CWWtK1lB7FZBFQlPj3czQhi
	Cws4SLx++gwszisgKHFy5hMWkDHMApoS63fpg4SZBeQltr+dwwwS5hWwkmjYYQwx3Upi7c43
	rCA2p4C1xKpbTxlBLhMROMcoce3PXnaIXg+JGc/WsUNcKSzxefcatgmMgrOQbJuFsG0Wkm0L
	GJlXMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIEh7+W5g7G7as+6B1iZOJgPMQowcGs
	JMJ779DPNCHelMTKqtSi/Pii0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2CyTBycUg1M
	htz5MUbO8enLtlfqebB4LawUffMmoMkz78668BWpt+LCLll0ZNXtM9v6lvHTwqst9h94DTft
	6jz0VrqgwWaOhVz4ojneeiws5p1TL71hXmfAIVtiodsn/9t0wq6t02Mclc6yLJQ9dsnXdDs7
	c7xrkFxJAee91TX2R8RK1hUvEJ4bb75w9bOty5+mlgnP/v003sR9btffez/uB+tI5xibFTou
	qrOMZupj3Cq0faPwQsa3LwUnxO20+GrybOK9jxwml2In7BJkmCTIr6H2o4q7U2aO+G+/6/Pk
	Fv97Ifmw1PZIxvOH96NCHdQ0l/y0lHEOUjooN+unfVrFqsq5ktE+LCkSnZNfajm9EEl7Yq3E
	UpyRaKjFXFScCAC+9d9v7gIAAA==
X-CMS-MailID: 20241002053342epcas1p342b73a5c369bcda11e0367555e682039
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241002053342epcas1p342b73a5c369bcda11e0367555e682039
References: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
	<CGME20241002053342epcas1p342b73a5c369bcda11e0367555e682039@epcas1p3.samsung.com>

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c           | 35 ++++++++++++++++++++++++
 include/dt-bindings/clock/samsung,exynosautov9.h |  4 +++
 2 files changed, 39 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 5971e680e566..ea9c02360e7f 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -20,6 +20,7 @@
 #define CLKS_NR_TOP			(GOUT_CLKCMU_PERIS_BUS + 1)
 #define CLKS_NR_BUSMC			(CLK_GOUT_BUSMC_SPDMA_PCLK + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_CORE_CMU_CORE_PCLK + 1)
+#define CLKS_NR_DPTX			(CLK_MOUT_DPTX_DPGTC_USER + 1)
 #define CLKS_NR_DPUM			(CLK_GOUT_DPUM_SYSMMU_D3_CLK + 1)
 #define CLKS_NR_FSYS0			(CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK + 1)
 #define CLKS_NR_FSYS1			(CLK_GOUT_FSYS1_USB30_1_ACLK + 1)
@@ -1077,6 +1078,37 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_core_bus",
 };
 
+/* ---- CMU_DPTX ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_DPTX (0x18a00000) */
+#define PLL_CON0_MUX_CLKCMU_DPTX_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_DPTX_DPGTC_USER	0x0610
+
+static const unsigned long dptx_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_DPTX_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_DPTX_DPGTC_USER
+};
+
+PNAME(mout_dptx_bus_user_p) = { "oscclk", "dout_clkcmu_dptx_bus" };
+PNAME(mout_dptx_dpgtc_user_p) = { "oscclk", "dout_clkcmu_dptx_dpgtc" };
+
+
+static const struct samsung_mux_clock dptx_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_DPTX_BUS_USER, "mout_dptx_bus_user",
+	    mout_dptx_bus_user_p, PLL_CON0_MUX_CLKCMU_DPTX_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_DPTX_DPGTC_USER, "mout_dptx_dpgtc_user",
+	    mout_dptx_dpgtc_user_p, PLL_CON0_MUX_CLKCMU_DPTX_DPGTC_USER, 4, 1),
+};
+
+static const struct samsung_cmu_info dptx_cmu_info __initconst = {
+	.mux_clks		= dptx_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(dptx_mux_clks),
+	.nr_clk_ids		= CLKS_NR_DPTX,
+	.clk_regs		= dptx_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(dptx_clk_regs),
+	.clk_name		= "dout_clkcmu_dptx_bus",
+};
+
 /* ---- CMU_DPUM ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_DPUM (0x18c00000) */
@@ -2165,6 +2197,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-dptx",
+		.data = &dptx_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-dpum",
 		.data = &dpum_cmu_info,
diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index ce8fb8f7d718..8fd81a62c2c9 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -179,6 +179,10 @@
 #define CLK_GOUT_CORE_CCI_PCLK		4
 #define CLK_GOUT_CORE_CMU_CORE_PCLK	5
 
+/* CMU_DPTX */
+#define CLK_MOUT_DPTX_BUS_USER		1
+#define CLK_MOUT_DPTX_DPGTC_USER	2
+
 /* CMU_DPUM */
 #define CLK_MOUT_DPUM_BUS_USER		1
 #define CLK_DOUT_DPUM_BUSP		2

-- 
2.39.2

