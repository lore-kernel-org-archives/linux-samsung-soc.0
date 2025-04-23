Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA4265638
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745383326; cv=none; b=VG8/ByKJ7Vx+OIsEvzbYYUu4dB+kzsZh4H+EhZncF5HuxtupNSxqw0s5HpvCp0UtQYOeefT7+UIw9hYT/RRgRUvjiL4rtbXdNVDyxn+HDXnrbmQje+NjhXiTbO6Cl9D0FClvDpYfGZHHPhSBjzQE/VO+B+8h1CfflQ7nQ/Ar3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745383326; c=relaxed/simple;
	bh=poipW4BkT5mgQ2u5/GGgpra2a8zMwe2b2ZsCXoobaYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ck4RrLqVDkxFG7jnV282zuNB0jyRr7n/OWuHzsm/CyGWq+8PLyWlxq7CgakWv5N75bC4wUsx7Re2j7b+rUM6+jvOzWJ7f+PuUTre651Nk+ySbMmUGlvy0+FZhZ2anrdRRJBIwJdbv+wy3VgM0/cP7CMANmQh2zCPpcKEtxqA2z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SflvNJUv; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SflvNJUv"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250423044201epoutp02adc2730069f46c00dfbe05530e02f3d8~42OIneaNH0724407244epoutp02b
	for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2025 04:42:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250423044201epoutp02adc2730069f46c00dfbe05530e02f3d8~42OIneaNH0724407244epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745383321;
	bh=ddQ5rxhlKTdTT82spaXbbOyO2MRWgPZYwr6A8oEqFII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SflvNJUv4HaXHbSCSgvLdjYWFLPZeCEuxlpETQMDFrWM7BFPUZU+LyPEQeV2mUkjl
	 LEBAdidB9lQ3ebLkyLHVmJ27Km90OdXtM0JLzgiq5PFvmgxxFF59zCjp2atBLGjqlR
	 5AEc8vZx6AZtTfqcZsfvaY8iEg1hzyCR96VUV2BU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250423044200epcas2p19b6ad6a736b0fbbd71bdff5b5dc3fb7a~42OH40bjt3184731847epcas2p10;
	Wed, 23 Apr 2025 04:42:00 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4Zj5zr2LhCz2SSKj; Wed, 23 Apr
	2025 04:42:00 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78~42OG73aj62414224142epcas2p3q;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250423044159epsmtrp160bd6af8d65385db4be3c673dc3a12c1~42OG7CvRZ2425824258epsmtrp1J;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-a2-68086f97f463
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D6.66.19478.79F68086; Wed, 23 Apr 2025 13:41:59 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250423044159epsmtip1fdb0893b5c0d55ee622856ba193e4ec0~42OGqEXM_1643416434epsmtip1L;
	Wed, 23 Apr 2025 04:41:59 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clk: samsung: exynosautov920: add cpucl0 clock
 support
Date: Wed, 23 Apr 2025 13:41:52 +0900
Message-ID: <20250423044153.1288077-3-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423044153.1288077-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO70fI4Mg8ff5CwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLy8bWsFk3L1jM58Hu8v9HK7rFpVSebx+Yl9R59W1YxenzeJBfAGsVlk5Kak1mWWqRv
	l8CV8edQF0vBS8uKfa3fWRsYjxp1MXJySAiYSKzYfZ21i5GLQ0hgO6PEj4e/WCESEhKHZ0xg
	hLCFJe63HIEqes8oMeHgOrYuRg4ONgFViU2/5UHiIgJvmSSW/z/ABNLALHCaUWLnGRmQGmEB
	P4meb6ogYRag8rXzz4DN5xWwlpj7ZzkzSImEgLxEf4cESJhTwEZiZsMusLVCQCWTl3xhgygX
	lDg58wkLxHR5ieats5knMArMQpKahSS1gJFpFaNoakFxbnpucoGhXnFibnFpXrpecn7uJkZw
	XGgF7WBctv6v3iFGJg7GQ4wSHMxKIry/3NgzhHhTEiurUovy44tKc1KLDzFKc7AoifMq53Sm
	CAmkJ5akZqemFqQWwWSZODilGph2Sajmx3DzrA9VND/TGmCwxS333Ab1h+7T1ELuNffIT5mo
	szRhv/qZDWFHQ3UmpVzMi7/8bOMXgSlHnSOdG6qjDqhdvZvczV783NrZYvupUvZ9L/pztlZt
	bnoheCHFzCHm+X/O/aaZBosLdpk+v+N5+bW7zUXzKo3KvalhvDXXn5/dwSpv1Hsz8K3yRbfG
	7rw1SvfKvsxaMPH1LI2EWcIVfouy+9ft7WexZnsR03dEPeLoDLP7DmmKMZe7ztfUqbWoHH/9
	Z83l3Y1tE233G/8yn2BTtKX33/TED7uW33RJ2e3+K+DL+T4X15WqMunbgi4+OznjcK347Y/G
	640itR0OJ5/uL95780y3Rv3fyTuUWIozEg21mIuKEwEsYuHB+gIAAA==
X-CMS-MailID: 20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78
References: <20250423044153.1288077-1-shin.son@samsung.com>
	<CGME20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78@epcas2p3.samsung.com>

Register compatible and cmu_info data to support clock CPUCL0(CPU Cluster 0),
this provides clock for CPUCL0_SWTICH/DBG/CLUSTER.
These clocks are required early during boot for the CPUs, so they are declared
using CLK_OF_DECLARE instead of being registered through a platform driver.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 130 +++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index dc8d4240f6de..8021e0912e50 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -18,6 +18,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(DOUT_CLKCMU_TAA_NOC + 1)
+#define CLKS_NR_CPUCL0			(CLK_DOUT_CLUSTER0_PERIPHCLK + 1)
 #define CLKS_NR_PERIC0			(CLK_DOUT_PERIC0_I3C + 1)
 #define CLKS_NR_PERIC1			(CLK_DOUT_PERIC1_I3C + 1)
 #define CLKS_NR_MISC			(CLK_DOUT_MISC_OSC_DIV2 + 1)
@@ -1005,6 +1006,135 @@ static void __init exynosautov920_cmu_top_init(struct device_node *np)
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
+/* Register CMU_CPUCL0 early, as CPU clocks should be available ASAP */
+CLK_OF_DECLARE(exynosautov920_cmu_cpucl0, "samsung,exynosautov920-cmu-cpucl0",
+	       exynosautov920_cmu_cpucl0_init);
+
 /* ---- CMU_PERIC0 --------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIC0 (0x10800000) */
-- 
2.49.0

