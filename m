Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E642F6FB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239590; cv=none; b=i97cHveETwKoF4X1Z69lG6+1/50Jb9rvghZmFFmPB7BIccTUpx6Oyqhhz8f6x+4U76JzDRn0i4WiLpVBRzBMeebc5XFltj4wgmrvDUWY6dcW0LkFepuE+thsi9lFAnNt2aooMVa5a0h0zIvLUqjAD1OfEwE0RRAdvnWwNla1kkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239590; c=relaxed/simple;
	bh=gs4xL1gbhAcL9UXfEBZFGhP4wK+6lVRCukA6gftwWII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mxp2QZhnQM5xIIFcriQreXz5P6RyX6UmCcnVhnGirvasD9FH1H127LghO0tsyHPa4pVHqiMds4U60lUXK9XuW2D2g8W3/sUthrpeGUBDj3Jb4e26dzX5w1biJAiIMpKMukIo5iAVpkYHipXvY4ubRvAtww7vsO01jvL0n7qaGPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=I5KpSaWv; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="I5KpSaWv"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260728115307epoutp02b642b46419b7c573cd3b38fd88680991~GcfIqPle02382823828epoutp02e
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260728115307epoutp02b642b46419b7c573cd3b38fd88680991~GcfIqPle02382823828epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239587;
	bh=5meaQn+RjaNvkmAykjRjZIiT62y3InUiWn5u/c+ewBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5KpSaWv+n3GRvXyqtfgKsVjhyImOE5ZNOHSIy/vsc0V5TOgKLQKqsO4y1bpCfsuh
	 raBZTOQdjtcrT5ZxdZZAJfMFTgunxBYt8XBL+92DAJcEQbjBycclA+3Z48oAzhQwpW
	 /C+xSy9Rs/mauRmkmXlF/eFbGGHNkc2q7CbDt/xg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115306epcas5p4a69c988eec3fcf783aca0447284ba76f~GcfIHu-ox2959829598epcas5p4u;
	Tue, 28 Jul 2026 11:53:06 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8YkT4LWFz2SSKZ; Tue, 28 Jul
	2026 11:53:05 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260728115305epcas5p4394f65825a0a04aa7d2bd5068507e8ca~GcfGvU37N2034920349epcas5p4g;
	Tue, 28 Jul 2026 11:53:05 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115300epsmtip131a9d6807d2a4a5c047319c64a87f740~GcfCrZtBI2649126491epsmtip1g;
	Tue, 28 Jul 2026 11:53:00 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 06/13] clk: samsung: exynos8855: add block peris clock
 support
Date: Tue, 28 Jul 2026 17:41:04 +0530
Message-Id: <20260728121111.2077860-7-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115305epcas5p4394f65825a0a04aa7d2bd5068507e8ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115305epcas5p4394f65825a0a04aa7d2bd5068507e8ca
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115305epcas5p4394f65825a0a04aa7d2bd5068507e8ca@epcas5p4.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_PERIS, this provides clocks for PERIS

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 117 ++++++++++++++++++++++++++-
 1 file changed, 114 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 93528f0077a4..40745f04be0c 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -17,8 +17,9 @@
 #include "clk-exynos-arm64.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP                     (FOUT_MMC_PLL_DIV2 + 1)
+#define CLKS_NR_TOP                     (FOUT_MMC_PLL_CLKOUT_DIV2 + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK + 1)
+#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS_IPCLKPORT_PCLK + 1)
 
 /* ---- CMU_TOP --------------------------------------------------------- */
 
@@ -52,6 +53,10 @@
 #define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC                 0x1878
 #define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD            0x187c
 #define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP                  0x1880
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC                 0x10c4
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC                 0x10c8
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC                 0x18c0
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC                 0x18c4
 
 static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_MMC,
@@ -78,6 +83,10 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC,
 	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD,
 	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC,
 };
 
 static const struct samsung_pll_clock top_pll_clks[] __initconst = {
@@ -112,6 +121,14 @@ PNAME(mout_clkcmu_peric_mmc_card_p)       = { "oscclk", "dout_shared0_div2",
 						"dout_shared2_div2", "dout_shared2_div3",
 						"dout_shared3_div2", "dout_shared3_div3"};
 PNAME(mout_clkcmu_peric_ip_p)            = { "dout_shared0_div4", "dout_shared1_div4"};
+PNAME(mout_clkcmu_peris_gic_p)            = { "dout_shared0_div2", "dout_shared0_div3",
+						"dout_shared1_div2", "dout_shared1_div3",
+						"dout_shared1_div4", "dout_shared2_div2",
+						"fout_mmc_pll_clkout_div2", "dout_shared3_div3"};
+PNAME(mout_clkcmu_peris_noc_p)            = { "dout_shared0_div2", "dout_shared0_div3",
+						"dout_shared1_div2", "dout_shared1_div3",
+						"dout_shared1_div4", "dout_shared2_div2",
+						"fout_mmc_pll_div2", "dout_shared3_div3"};
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
@@ -132,6 +149,10 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    mout_clkcmu_peric_mmc_card_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD, 0, 3),
 	MUX(CLKCMU_MOUT_PERIC_IP, "mout_clkcmu_peric_ip",
 	    mout_clkcmu_peric_ip_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP, 0, 1),
+	MUX(CLKCMU_MOUT_PERIS_GIC, "mout_clkcmu_peris_gic",
+	    mout_clkcmu_peris_gic_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC, 0, 3),
+	MUX(CLKCMU_MOUT_PERIS_NOC, "mout_clkcmu_peris_noc",
+	    mout_clkcmu_peris_noc_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC, 0, 3),
 };
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
@@ -144,7 +165,12 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLKCMU_DOUT_PERIC_IP, "dout_clkcmu_peric_ip",
 	    "mout_clkcmu_peric_ip", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP,
 	    0, 4),
-
+	DIV(CLKCMU_DOUT_PERIS_GIC, "dout_clkcmu_peris_gic",
+	    "mout_clkcmu_peris_gic", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC,
+	    0, 4),
+	DIV(CLKCMU_DOUT_PERIS_NOC, "dout_clkcmu_peris_noc",
+	    "mout_clkcmu_peris_noc", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC,
+	    0, 4),
 };
 
 static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
@@ -192,7 +218,8 @@ static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initcon
 		"mout_mmc_pll", 1, 1, 0),
 	FFACTOR(FOUT_MMC_PLL_DIV2, "fout_mmc_pll_div2",
 		"mout_mmc_pll", 1, 2, 0),
-
+	FFACTOR(FOUT_MMC_PLL_CLKOUT_DIV2, "fout_mmc_pll_clkout_div2",
+		"mout_mmc_pll", 1, 2, 0),
 };
 
 static const struct samsung_cmu_info top_cmu_info __initconst = {
@@ -382,6 +409,87 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.clk_name               = "bus",
 };
 
+/* ---- CMU_PERIS --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10030000) */
+#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
+#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
+#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
+	CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
+	CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIS */
+PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
+PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
+PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
+	    mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
+	    mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
+	MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
+	    mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock peris_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
+	    "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	    0, 4),
+	DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
+	    "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_CMU_PERIS_IPCLKPORT_PCLK, "gout_cmu_peris_ipclkport_pclk",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_SYSREG_PERIS_IPCLKPORT_PCLK, "gout_sysreg_peris_ipclkport_pclk",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT0_PERIS_IPCLKPORT_PCLK, "gout_wdt0_peris_ipclkport_pclk",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT1_PERIS_IPCLKPORT_PCLK, "gout_wdt1_peris_ipclkport_pclk",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks               = peris_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(peris_mux_clks),
+	.div_clks               = peris_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(peris_div_clks),
+	.gate_clks              = peris_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids             = CLKS_NR_PERIS,
+	.clk_regs               = peris_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(peris_clk_regs),
+	.clk_name               = "bus",
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -397,6 +505,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynos8855-cmu-peric",
 		.data = &peric_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-peris",
+		.data = &peris_cmu_info,
 	}, {
 		.compatible = "samsung,exynos8855-cmu-top",
 		.data = &top_cmu_info,
-- 
2.34.1

