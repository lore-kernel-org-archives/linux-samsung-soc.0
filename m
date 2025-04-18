Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57C267F43
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Apr 2025 06:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956922; cv=none; b=ChLYzmiKrJqF+FiUVYMaCy5ewOTyxP0I9YxqznrGxBjdXAvaC1UUnJ2Iam6mGg4y+fbrf5SyCWwKQR5XkzEqolKde2XseyXZuXKvyqklPXKRrwG4nSvQnDBdZcJCcnuH314q2scsE7xbrPjyRAwc3oTnzAs+7JfWcaLYJq4N0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956922; c=relaxed/simple;
	bh=ZrHONZWftUWQwJfrbj+Ue8Mnv7Z8ptvW+FydcagdvR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ITZhR35wXbvnmnJjJyGm46wdZpMeHuZD8Sj1xy4V8XUKOY2976r2e3JVvRQfxaSSLp6/EcA3B3jDihmS5TDDvO+N5nFH1gPsn7mLJeuWPNOVH0qJ32JWSpM666zq2wen/dNs/WBbsRCqoJzD190ZZC2XNxNL6a0Kqk6Ac3MYZKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pHC9Zf1a; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pHC9Zf1a"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250418061516epoutp01a94d56ebfffb5d13dd089e14249a75a0~3VRIXramx1425514255epoutp01f
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250418061516epoutp01a94d56ebfffb5d13dd089e14249a75a0~3VRIXramx1425514255epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744956916;
	bh=TfWFCebObC9+M+g0zhj4fb956t5zeDeZz8kN8M/Z3sQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pHC9Zf1aMAQpE+/UWC5Fv1FeY+EwMTcZ3RvhH046oGKjLTcjm26RlqiAsQNy5CRaa
	 TKEwWH9sM9uY3nscJcDAkJb8u7d4Vaiiaipsaq3XNoZe6cfeO3u0sXFpcnWTQ4VMbb
	 2POLK3+qNX6IAeO2DUM8KGb2AstmgRllLvD5lx+0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250418061516epcas2p1b3aac13ff32b4cfd5b1cc99d3cd0a0af~3VRH3iWgD0446704467epcas2p1X;
	Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4Zf4Hl6tbtz2SSKX; Fri, 18 Apr
	2025 06:15:15 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061515epcas2p138fa2f5edacbfba8f73b40182fb8d83f~3VRG5-XzO3220332203epcas2p1y;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250418061515epsmtrp28d78c84cdf14b5fba615e319ce958100~3VRG5HtfU0711707117epsmtrp2i;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-25-6801edf3482d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.A9.07818.3FDE1086; Fri, 18 Apr 2025 15:15:15 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061514epsmtip11740aca291ec8f6984c885eeb3566a16~3VRGqE8BH0362503625epsmtip19;
	Fri, 18 Apr 2025 06:15:14 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: samsung: exynosautov920: add cpucl0 clock support
Date: Fri, 18 Apr 2025 15:14:59 +0900
Message-ID: <20250418061500.1629200-3-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418061500.1629200-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnO7nt4wZBvN3c1o8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8Xk42tZLZqWrWdy4Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjf
	LoErY/21+cwF380rWrp2Mjcw/jHoYuTkkBAwkVjx/StzFyMXh5DAbkaJU5/vskIkJCQOz5jA
	CGELS9xvOcIKUfSeUWLdkUtADgcHm4CqxKbf8iBxEYG3TBLL/x9gAmlgFjjNKLHzjAyILSzg
	LbGo6RQbiM0CVN/R+YsFxOYVsJY41HyKCWSOhIC8RH+HBEiYU8BGYum+WWwgYSGgkoUv6iCq
	BSVOznzCAjFdXqJ562zmCYwCs5CkZiFJLWBkWsUomVpQnJuem2xYYJiXWq5XnJhbXJqXrpec
	n7uJERwfWho7GN99a9I/xMjEwXiIUYKDWUmE95z5v3Qh3pTEyqrUovz4otKc1OJDjNIcLEri
	vCsNI9KFBNITS1KzU1MLUotgskwcnFINTOWcXFKz/5sddM7a2CDzpkSufy7jx6VxIe1ypyfu
	tOtgiCgpurHS4fzrG+ucF7MVmQX8e3XJZ03qi7TnfxK3+aV8cn92cl/WzEwRMUXRn3a+YrOe
	W33Ik70p9nnNzbcOS710Di2YWn9os0/WNI8VK9oDGN5cLgioZwnUnpmjX3/2TFWSTirHJE33
	KW+3bw44u42n2pVXxubluduz5QN3cr2ILOThYDz5UlbPiTHpTtmDl9sPttzqnZ9Qc9Dyxr6r
	qy6WLZ+40eW6rmad0aw03Xnsgqu2WD86vUJe1cXiOEPzEU0O3/8L7vC2GG8VMlPPbcvVd9hw
	cKq4jR3bhE02aV6n+2tknsqGBk9/NbulWYmlOCPRUIu5qDgRAELUt0n+AgAA
X-CMS-MailID: 20250418061515epcas2p138fa2f5edacbfba8f73b40182fb8d83f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p138fa2f5edacbfba8f73b40182fb8d83f
References: <20250418061500.1629200-1-shin.son@samsung.com>
	<CGME20250418061515epcas2p138fa2f5edacbfba8f73b40182fb8d83f@epcas2p1.samsung.com>

Register compatible and cmu_info data to support clock CMU_CPUCL0,
this provides clock for CPUCL0_SWTICH/DBG/CLUSTER.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 129 +++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index dc8d4240f6de..59e5f1e61151 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -18,6 +18,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
+#define CLKS_NR_CPUCL0			(CLK_DOUT_CLUSTER0_PERIPHCLK + 1)
 #define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
 #define CLKS_NR_PERIC1			(CLK_DOUT_PERIC1_I3C + 1)
 #define CLKS_NR_MISC			(CLK_DOUT_MISC_OSC_DIV2 + 1)
@@ -1005,6 +1006,134 @@ static void __init exynosautov920_cmu_top_init(struct device_node *np)
 CLK_OF_DECLARE(exynosautov920_cmu_top, "samsung,exynosautov920-cmu-top",
 	       exynosautov920_cmu_top_init);
 
+/* ---- CMU_CPUCL0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CPUCL0 (0x1EC00000) */
+#define PLL_LOCKTIME_PLL_CPUCL0				0x0000
+#define PLL_CON0_PLL_CPUCL0				0x0100
+#define PLL_CON1_PLL_CPUCL0				0x0104
+#define PLL_CON3_PLL_CPUCL0				0x010c
+#define PLL_CON0_MUX_CLKCMU_CPUCL0_CLUSTER_USER		0x0600
+#define PLL_CON0_MUX_CLKCMU_CPUCL0_DBG_USER		0x0610
+#define PLL_CON0_MUX_CLKCMU_CPUCL0_SWITCH_USER		0x0620
+
+#define CLK_CON_MUX_MUX_CLK_CPUCL0_CLUSTER		0x1000
+#define CLK_CON_MUX_MUX_CLK_CPUCL0_CORE			0x1004
+
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_ACLK		0x1800
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_ATCLK		0x1804
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_MPCLK		0x1808
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_PCLK		0x180c
+#define CLK_CON_DIV_DIV_CLK_CLUSTER0_PERIPHCLK		0x1810
+#define CLK_CON_DIV_DIV_CLK_CPUCL0_DBG_NOC		0x181c
+#define CLK_CON_DIV_DIV_CLK_CPUCL0_DBG_PCLKDBG		0x1820
+#define CLK_CON_DIV_DIV_CLK_CPUCL0_NOCP			0x1824
+
+static const unsigned long cpucl0_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_CPUCL0,
+	PLL_CON0_PLL_CPUCL0,
+	PLL_CON1_PLL_CPUCL0,
+	PLL_CON3_PLL_CPUCL0,
+	PLL_CON0_MUX_CLKCMU_CPUCL0_CLUSTER_USER,
+	PLL_CON0_MUX_CLKCMU_CPUCL0_DBG_USER,
+	PLL_CON0_MUX_CLKCMU_CPUCL0_SWITCH_USER,
+	CLK_CON_MUX_MUX_CLK_CPUCL0_CLUSTER,
+	CLK_CON_MUX_MUX_CLK_CPUCL0_CORE,
+	CLK_CON_DIV_DIV_CLK_CLUSTER0_ACLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER0_ATCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER0_MPCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER0_PCLK,
+	CLK_CON_DIV_DIV_CLK_CLUSTER0_PERIPHCLK,
+	CLK_CON_DIV_DIV_CLK_CPUCL0_DBG_NOC,
+	CLK_CON_DIV_DIV_CLK_CPUCL0_DBG_PCLKDBG,
+	CLK_CON_DIV_DIV_CLK_CPUCL0_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_CPUCL0 */
+PNAME(mout_pll_cpucl0_p)		 = { "oscclk", "fout_cpucl0_pll" };
+PNAME(mout_cpucl0_cluster_user_p)	 = { "oscclk", "dout_clkcmu_cpucl0_cluster" };
+PNAME(mout_cpucl0_dbg_user_p)		 = { "oscclk", "dout_clkcmu_cpucl0_dbg" };
+PNAME(mout_cpucl0_switch_user_p)	 = { "oscclk", "dout_clkcmu_cpucl0_switch" };
+PNAME(mout_cpucl0_cluster_p)		 = { "oscclk", "mout_cpucl0_cluster_user",
+						"mout_cpucl0_switch_user"};
+PNAME(mout_cpucl0_core_p)		 = { "oscclk", "mout_pll_cpucl0",
+						"mout_cpucl0_switch_user"};
+
+static const struct samsung_pll_rate_table cpu_pll_rates[] __initconst = {
+	PLL_35XX_RATE(38400000U, 2400000000U, 250, 4, 0),
+	PLL_35XX_RATE(38400000U, 2304000000U, 240, 4, 0),
+	PLL_35XX_RATE(38400000U, 2208000000U, 230, 4, 0),
+	PLL_35XX_RATE(38400000U, 2112000000U, 220, 4, 0),
+	PLL_35XX_RATE(38400000U, 2016000000U, 210, 4, 0),
+	PLL_35XX_RATE(38400000U, 1824000000U, 190, 4, 0),
+	PLL_35XX_RATE(38400000U, 1680000000U, 175, 4, 0),
+	PLL_35XX_RATE(38400000U, 1344000000U, 140, 4, 0),
+	PLL_35XX_RATE(38400000U, 1152000000U, 120, 4, 0),
+	PLL_35XX_RATE(38400000U, 576000000U, 120, 4, 1),
+	PLL_35XX_RATE(38400000U, 288000000U, 120, 4, 2),
+};
+
+static const struct samsung_pll_clock cpucl0_pll_clks[] __initconst = {
+	/* CMU_CPUCL0_PURECLKCOMP */
+	PLL(pll_531x, CLK_FOUT_CPUCL0_PLL, "fout_cpucl0_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_CPUCL0, PLL_CON3_PLL_CPUCL0, cpu_pll_rates),
+};
+
+static const struct samsung_mux_clock cpucl0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PLL_CPUCL0, "mout_pll_cpucl0", mout_pll_cpucl0_p,
+	    PLL_CON0_PLL_CPUCL0, 4, 1),
+	MUX(CLK_MOUT_CPUCL0_CLUSTER_USER, "mout_cpucl0_cluster_user", mout_cpucl0_cluster_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL0_CLUSTER_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL0_DBG_USER, "mout_cpucl0_dbg_user", mout_cpucl0_dbg_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL0_DBG_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL0_SWITCH_USER, "mout_cpucl0_switch_user", mout_cpucl0_switch_user_p,
+	    PLL_CON0_MUX_CLKCMU_CPUCL0_SWITCH_USER, 4, 1),
+	MUX(CLK_MOUT_CPUCL0_CLUSTER, "mout_cpucl0_cluster", mout_cpucl0_cluster_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL0_CLUSTER, 0, 2),
+	MUX(CLK_MOUT_CPUCL0_CORE, "mout_cpucl0_core", mout_cpucl0_core_p,
+	    CLK_CON_MUX_MUX_CLK_CPUCL0_CORE, 0, 2),
+};
+
+static const struct samsung_div_clock cpucl0_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CLUSTER0_ACLK, "dout_cluster0_aclk",
+	    "mout_cpucl0_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER0_ACLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER0_ATCLK, "dout_cluster0_atclk",
+	    "mout_cpucl0_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER0_ATCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER0_MPCLK, "dout_cluster0_mpclk",
+	    "mout_cpucl0_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER0_MPCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER0_PCLK, "dout_cluster0_pclk",
+	    "mout_cpucl0_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER0_PCLK, 0, 4),
+	DIV(CLK_DOUT_CLUSTER0_PERIPHCLK, "dout_cluster0_periphclk",
+	    "mout_cpucl0_cluster", CLK_CON_DIV_DIV_CLK_CLUSTER0_PERIPHCLK, 0, 4),
+	DIV(CLK_DOUT_CPUCL0_DBG_NOC, "dout_cpucl0_dbg_noc",
+	    "mout_cpucl0_dbg_user", CLK_CON_DIV_DIV_CLK_CPUCL0_DBG_NOC, 0, 3),
+	DIV(CLK_DOUT_CPUCL0_DBG_PCLKDBG, "dout_cpucl0_dbg_pclkdbg",
+	    "mout_cpucl0_dbg_user", CLK_CON_DIV_DIV_CLK_CPUCL0_DBG_PCLKDBG, 0, 3),
+	DIV(CLK_DOUT_CPUCL0_NOCP, "dout_cpucl0_nocp",
+	    "mout_cpucl0_cluster", CLK_CON_DIV_DIV_CLK_CPUCL0_NOCP, 0, 4),
+};
+
+static const struct samsung_cmu_info cpucl0_cmu_info __initconst = {
+	.pll_clks		= cpucl0_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cpucl0_pll_clks),
+	.mux_clks		= cpucl0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cpucl0_mux_clks),
+	.div_clks		= cpucl0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cpucl0_div_clks),
+	.nr_clk_ids		= CLKS_NR_CPUCL0,
+	.clk_regs		= cpucl0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cpucl0_clk_regs),
+	.clk_name		= "cpucl0",
+};
+
+static void __init exynosautov920_cmu_cpucl0_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &cpucl0_cmu_info);
+}
+
+CLK_OF_DECLARE(exynosautov920_cmu_cpucl0, "samsung,exynosautov920-cmu-cpucl0",
+	       exynosautov920_cmu_cpucl0_init);
+
 /* ---- CMU_PERIC0 --------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIC0 (0x10800000) */
-- 
2.49.0

