Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A8262FC2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840161; cv=none; b=OwThHKbU7jkjJsTMaXcsAeKXU2Bu/Xl7KDHYVzFbxx17yTzCQbduARJprt8CCkfm46Rb7el7OME1o2b4S95baPJZyFCoeJitBam/gSTVPMhps/Fvby732bKU7UMIDSpVncE5SZe31cJZLvNVYc0ako1daH+2tBXKflfd85j3jSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840161; c=relaxed/simple;
	bh=pIc3LM8yFth+/ZGNLhZYEZadHoVt5fIS0UnyO+uFMDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Q2NmIAlJyuuzr8ea75DRna4FcWewxth3vzYx+DgihqHZDvWcrD/YODcgBmz32X7dy6HjLyzcXKPjexpQATiID46J8Ctt6ESE5rhIe7lza5bMpDaTCm6AI85HybqnUcvVfSm4hXuzrHxJoO/HAIWyhZJHZBoiM5+4f5RA0u4gk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=K3O2JCcZ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="K3O2JCcZ"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250428113557epoutp049fe030fb528688cf28ddf08dee57f7ac~6eF_fUEYx2147821478epoutp04L
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:35:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250428113557epoutp049fe030fb528688cf28ddf08dee57f7ac~6eF_fUEYx2147821478epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745840157;
	bh=nUgprotmOrCwcYVQPFdS/8TCSXS+ns60j+aTVol2gbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K3O2JCcZFBgVfv+T2W7ePc1tlOWmXp+UTygJ4ZI+sqAaQAXrEVjiVPDiyaWolayGw
	 ClVuTdFGXkiht9Ezn0qffYLXfvkxLiUV720PVRugH/HEGxG07PtBR4ZRTQp2J9KnDH
	 Rt22c8X83anRifE6tRVQVcbdBB0qYK3PvDpWX8Bs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250428113557epcas2p19f07d9037847e7277ef18fcca4107442~6eF99oeWq0617706177epcas2p1E;
	Mon, 28 Apr 2025 11:35:57 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmLx85V4bz3hhT4; Mon, 28 Apr
	2025 11:35:56 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250428113555epcas2p2416815cf6a41e0004f56c0a26b7be5f4~6eF8viufd2175721757epcas2p2z;
	Mon, 28 Apr 2025 11:35:55 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428113555epsmtrp24f17dafc72396730f2ad1933e42368e3~6eF8uvOoW1223812238epsmtrp2b;
	Mon, 28 Apr 2025 11:35:55 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-b2-680f681a6621
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E4.02.08805.A186F086; Mon, 28 Apr 2025 20:35:54 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428113554epsmtip163443f8ba7bedf1698a8c22ab34a1f69~6eF7mDX4E2519925199epsmtip1p;
	Mon, 28 Apr 2025 11:35:54 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] clk: samsung: exynosautov920: add cpucl1/2 clock
 support
Date: Mon, 28 Apr 2025 20:35:15 +0900
Message-ID: <20250428113517.426987-3-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428113517.426987-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnK5UBn+GwcP3GhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYjH5+FpWi6Zl65kc+D3e32hl99i0qpPNY/OSeo++LasYPT5vkgtgjeKySUnNySxLLdK3
	S+DK2N5wnq1gQXDFitOsDYy3PLoYOTkkBEwk+l9cZe5i5OIQEtjNKHFy2UtWiISExOEZExgh
	bGGJ+y1HWCGK3jNKnN/xgamLkYODTUBVYtNveZC4iMBbJonl/w8wgTQwC5xmlNh5RgakRlgg
	QGLVB3mQMAtQ+eJXr8Dm8wpYSWzaDzKfA2i+vER/hwRImFPAWuLTxXXMILYQUMmEx2fYIMoF
	JU7OfMICMV1eonnrbOYJjAKzkKRmIUktYGRaxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yf
	u4kRHB1aWjsY96z6oHeIkYmD8RCjBAezkghvlQF/hhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe
	b697U4QE0hNLUrNTUwtSi2CyTBycUg1MSz6dfHf/TbxwhITbTL0wzlq3t99nfhFZLvKkUrvi
	9LH/69f4btr39MvWFy97pG7Nkl5Wk7bV4TqH5aO8lR9WX/blPzP1UGmoksK6zo3bp2Wu2yb2
	hlWHZXup8oH6wCdzlSQmbPVznVay00v5Qv9jZqmT0ZNKfZyvXbZqU3t3YdId9q7LTNZ3y9Mk
	SzNPRojZbbxYcKjsffri/+2TOS7Nnbf3HZt4iinbN8e6aav7qpVfbT7Guox5Iuukw25tExIj
	95pOEZu6Zfa2OR83MXzWY57zd8FkD902M5tj06bvMdW/OiVnyXvNtSuCTralimlV7NXRljDS
	2D8hof7yt9XGYS/e2zFVNdaLz9Z+lfVFqkSJpTgj0VCLuag4EQBDirge/QIAAA==
X-CMS-MailID: 20250428113555epcas2p2416815cf6a41e0004f56c0a26b7be5f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428113555epcas2p2416815cf6a41e0004f56c0a26b7be5f4
References: <20250428113517.426987-1-shin.son@samsung.com>
	<CGME20250428113555epcas2p2416815cf6a41e0004f56c0a26b7be5f4@epcas2p2.samsung.com>

Register compatible and cmu_info data to support clock CPUCL1/2
(CPU Cluster 1 and CPU Cluster 2),
these provide clock for CPUCL1/2_SWTICH/CLUSTER.

These clocks are required early during boot for the CPUs,
so they are declared using CLK_OF_DECLARE instead of being registered
through a platform driver.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 206 +++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 8021e0912e50..c1b0203b8cb4 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -19,6 +19,8 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
 #define CLKS_NR_CPUCL0			(CLK_DOUT_CLUSTER0_PERIPHCLK + 1)
+#define CLKS_NR_CPUCL1			(CLK_DOUT_CPUCL1_NOCP + 1)
+#define CLKS_NR_CPUCL2			(CLK_DOUT_CPUCL2_NOCP + 1)
 #define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
 #define CLKS_NR_PERIC1			(CLK_DOUT_PERIC1_I3C + 1)
 #define CLKS_NR_MISC			(CLK_DOUT_MISC_OSC_DIV2 + 1)
@@ -1135,6 +1137,210 @@ static void __init exynosautov920_cmu_cpucl0_init(struct device_node *np)
 CLK_OF_DECLARE(exynosautov920_cmu_cpucl0, "samsung,exynosautov920-cmu-cpucl0",
 	       exynosautov920_cmu_cpucl0_init);
 
+/* ---- CMU_CPUCL1 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CPUCL1 (0x1ED00000) */
+#define PLL_LOCKTIME_PLL_CPUCL1				0x0000
+#define PLL_CON0_PLL_CPUCL1				0x0100
+#define PLL_CON1_PLL_CPUCL1				0x0104
+#define PLL_CON3_PLL_CPUCL1				0x010c
+#define PLL_CON0_MUX_CLKCMU_CPUCL1_CLUSTER_USER		0x0600
+#define PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER		0x0610
+
+#define CLK_CON_MUX_MUX_CLK_CPUCL1_CLUSTER		0x1000
+#define CLK_CON_MUX_MUX_CLK_CPUCL1_CORE			0x1004
+
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK		0x1800
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_ATCLK		0x1804
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_MPCLK		0x1808
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_PCLK		0x180c
+#define CLK_CON_DIV_DIV_CLK_CLUSTER1_PERIPHCLK		0x1810
+#define CLK_CON_DIV_DIV_CLK_CPUCL1_NOCP			0x181c
+
+static const unsigned long cpucl1_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_CPUCL1,
+	PLL_CON0_PLL_CPUCL1,
+	PLL_CON1_PLL_CPUCL1,
+	PLL_CON3_PLL_CPUCL1,
+	PLL_CON0_MUX_CLKCMU_CPUCL1_CLUSTER_USER,
+	PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER,
+	CLK_CON_MUX_MUX_CLK_CPUCL1_CLUSTER,
+	CLK_CON_MUX_MUX_CLK_CPUCL1_CORE,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_ATCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_MPCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_PCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER1_PERIPHCLK,
+	CLK_CON_DIV_DIV_CLK_CPUCL1_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_CPUCL1 */
+PNAME(mout_pll_cpucl1_p)		 = { "oscclk", "fout_cpucl1_pll" };
+PNAME(mout_cpucl1_cluster_user_p)	 = { "oscclk", "dout_clkcmu_cpucl1_cluster" };
+PNAME(mout_cpucl1_switch_user_p)	 = { "oscclk", "dout_clkcmu_cpucl1_switch" };
+PNAME(mout_cpucl1_cluster_p)		 = { "oscclk", "mout_cpucl1_cluster_user",
+						"mout_cpucl1_switch_user"};
+PNAME(mout_cpucl1_core_p)		 = { "oscclk", "mout_pll_cpucl1",
+						"mout_cpucl1_switch_user"};
+
+static const struct samsung_pll_clock cpucl1_pll_clks[] __initconst = {
+	/* CMU_CPUCL1_PURECLKCOMP */
+	PLL(pll_531x, CLK_FOUT_CPUCL1_PLL, "fout_cpucl1_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_CPUCL1, PLL_CON3_PLL_CPUCL1, cpu_pll_rates),
+};
+
+static const struct samsung_mux_clock cpucl1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PLL_CPUCL1, "mout_pll_cpucl1", mout_pll_cpucl1_p,
+	    PLL_CON0_PLL_CPUCL1, 4, 1),
+	MUX(CLK_MOUT_CPUCL1_CLUSTER_USER, "mout_cpucl1_cluster_user", mout_cpucl1_cluster_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL1_CLUSTER_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL1_SWITCH_USER, "mout_cpucl1_switch_user", mout_cpucl1_switch_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL1_SWITCH_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL1_CLUSTER, "mout_cpucl1_cluster", mout_cpucl1_cluster_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL1_CLUSTER, 0, 2),
+	MUX(CLK_MOUT_CPUCL1_CORE, "mout_cpucl1_core", mout_cpucl1_core_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL1_CORE, 0, 2),
+};
+
+static const struct samsung_div_clock cpucl1_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CLUSTER1_ACLK, "dout_cluster1_aclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_ACLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_ATCLK, "dout_cluster1_atclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_ATCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_MPCLK, "dout_cluster1_mpclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_MPCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_PCLK, "dout_cluster1_pclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_PCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER1_PERIPHCLK, "dout_cluster1_periphclk",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER1_PERIPHCLK, 0, 4),
+	DIV(CLK_DOUT_CPUCL1_NOCP, "dout_cpucl1_nocp",
+	    "mout_cpucl1_cluster", CLK_CON_DIV_DIV_CLK_CPUCL1_NOCP, 0, 4),
+};
+
+static const struct samsung_cmu_info cpucl1_cmu_info __initconst = {
+	.pll_clks		= cpucl1_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cpucl1_pll_clks),
+	.mux_clks		= cpucl1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cpucl1_mux_clks),
+	.div_clks		= cpucl1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cpucl1_div_clks),
+	.nr_clk_ids		= CLKS_NR_CPUCL1,
+	.clk_regs		= cpucl1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cpucl1_clk_regs),
+	.clk_name		= "cpucl1",
+};
+
+static void __init exynosautov920_cmu_cpucl1_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &cpucl1_cmu_info);
+}
+
+/* Register CMU_CPUCL1 early, as CPU clocks should be available ASAP */
+CLK_OF_DECLARE(exynosautov920_cmu_cpucl1, "samsung,exynosautov920-cmu-cpucl1",
+	       exynosautov920_cmu_cpucl1_init);
+
+/* ---- CMU_CPUCL2 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CPUCL2 (0x1EE00000) */
+#define PLL_LOCKTIME_PLL_CPUCL2				0x0000
+#define PLL_CON0_PLL_CPUCL2				0x0100
+#define PLL_CON1_PLL_CPUCL2				0x0104
+#define PLL_CON3_PLL_CPUCL2				0x010c
+#define PLL_CON0_MUX_CLKCMU_CPUCL2_CLUSTER_USER		0x0600
+#define PLL_CON0_MUX_CLKCMU_CPUCL2_SWITCH_USER		0x0610
+
+#define CLK_CON_MUX_MUX_CLK_CPUCL2_CLUSTER		0x1000
+#define CLK_CON_MUX_MUX_CLK_CPUCL2_CORE			0x1004
+
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_ACLK		0x1800
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_ATCLK		0x1804
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_MPCLK		0x1808
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_PCLK		0x180c
+#define CLK_CON_DIV_DIV_CLK_CLUSTER2_PERIPHCLK		0x1810
+#define CLK_CON_DIV_DIV_CLK_CPUCL2_NOCP			0x181c
+
+static const unsigned long cpucl2_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_CPUCL2,
+	PLL_CON0_PLL_CPUCL2,
+	PLL_CON1_PLL_CPUCL2,
+	PLL_CON3_PLL_CPUCL2,
+	PLL_CON0_MUX_CLKCMU_CPUCL2_CLUSTER_USER,
+	PLL_CON0_MUX_CLKCMU_CPUCL2_SWITCH_USER,
+	CLK_CON_MUX_MUX_CLK_CPUCL2_CLUSTER,
+	CLK_CON_MUX_MUX_CLK_CPUCL2_CORE,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_ACLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_ATCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_MPCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_PCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER2_PERIPHCLK,
+	CLK_CON_DIV_DIV_CLK_CPUCL2_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_CPUCL2 */
+PNAME(mout_pll_cpucl2_p)		 = { "oscclk", "fout_cpucl2_pll" };
+PNAME(mout_cpucl2_cluster_user_p)	 = { "oscclk", "dout_clkcmu_cpucl2_cluster" };
+PNAME(mout_cpucl2_switch_user_p)	 = { "oscclk", "dout_clkcmu_cpucl2_switch" };
+PNAME(mout_cpucl2_cluster_p)		 = { "oscclk", "mout_cpucl2_cluster_user",
+						"mout_cpucl2_switch_user"};
+PNAME(mout_cpucl2_core_p)		 = { "oscclk", "mout_pll_cpucl2",
+						"mout_cpucl2_switch_user"};
+
+static const struct samsung_pll_clock cpucl2_pll_clks[] __initconst = {
+	/* CMU_CPUCL2_PURECLKCOMP */
+	PLL(pll_531x, CLK_FOUT_CPUCL2_PLL, "fout_cpucl2_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_CPUCL2, PLL_CON3_PLL_CPUCL2, cpu_pll_rates),
+};
+
+static const struct samsung_mux_clock cpucl2_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PLL_CPUCL2, "mout_pll_cpucl2", mout_pll_cpucl2_p,
+	    PLL_CON0_PLL_CPUCL2, 4, 1),
+	MUX(CLK_MOUT_CPUCL2_CLUSTER_USER, "mout_cpucl2_cluster_user", mout_cpucl2_cluster_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL2_CLUSTER_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL2_SWITCH_USER, "mout_cpucl2_switch_user", mout_cpucl2_switch_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL2_SWITCH_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL2_CLUSTER, "mout_cpucl2_cluster", mout_cpucl2_cluster_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL2_CLUSTER, 0, 2),
+	MUX(CLK_MOUT_CPUCL2_CORE, "mout_cpucl2_core", mout_cpucl2_core_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL2_CORE, 0, 2),
+};
+
+static const struct samsung_div_clock cpucl2_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CLUSTER2_ACLK, "dout_cluster2_aclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_ACLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_ATCLK, "dout_cluster2_atclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_ATCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_MPCLK, "dout_cluster2_mpclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_MPCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_PCLK, "dout_cluster2_pclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_PCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER2_PERIPHCLK, "dout_cluster2_periphclk",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER2_PERIPHCLK, 0, 4),
+	DIV(CLK_DOUT_CPUCL2_NOCP, "dout_cpucl2_nocp",
+	    "mout_cpucl2_cluster", CLK_CON_DIV_DIV_CLK_CPUCL2_NOCP, 0, 4),
+};
+
+static const struct samsung_cmu_info cpucl2_cmu_info __initconst = {
+	.pll_clks		= cpucl2_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cpucl2_pll_clks),
+	.mux_clks		= cpucl2_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cpucl2_mux_clks),
+	.div_clks		= cpucl2_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cpucl2_div_clks),
+	.nr_clk_ids		= CLKS_NR_CPUCL2,
+	.clk_regs		= cpucl2_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cpucl2_clk_regs),
+	.clk_name		= "cpucl2",
+};
+
+static void __init exynosautov920_cmu_cpucl2_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &cpucl2_cmu_info);
+}
+
+/* Register CMU_CPUCL2 early, as CPU clocks should be available ASAP */
+CLK_OF_DECLARE(exynosautov920_cmu_cpucl2, "samsung,exynosautov920-cmu-cpucl2",
+	       exynosautov920_cmu_cpucl2_init);
+
 /* ---- CMU_PERIC0 --------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIC0 (0x10800000) */
-- 
2.49.0

