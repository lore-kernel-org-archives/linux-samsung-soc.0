Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7742F709
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239610; cv=none; b=El0Pei4eZdNy0SLydDsAfuFxQj9Vs9RPMywzkWmzNPG/Yv5+bqZSTPh0rRFGAge4m3SvMGaH6Rml7+a/XesBsvpx9yAONomrwnft0f7nxwR1tCnMG7kZ4tyN91UCrSqqlJSXehTn4CCSV7Bv/x7J4maOG1ZWEKTomYgXv0j0/1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239610; c=relaxed/simple;
	bh=4eGJ5VlhFW3bP4x9oPR/oQtOceCzIBtGmCAuE1P970o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=HoCvM2uW4BlzXlTyBrkCkxYSEguHBug3PVUTnXqm3WKG2H4hR8Ac305hjnB1v1vtP+eJXlQKMGM0fzTG2h+VJJxYm6SdWJWIQhYsfOOfyNtwhxo0o+HLDHUF/wwu9OiczvBasDGZk9Is1hAA0wfHgHIyw3xHa+nZySNwb3h2P1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=F6TvZhle; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="F6TvZhle"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260728115326epoutp03936fef237b96c1ab9c5cb79f939ce256~GcfainoW-2189721897epoutp03U
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260728115326epoutp03936fef237b96c1ab9c5cb79f939ce256~GcfainoW-2189721897epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239606;
	bh=YoE2mjBXgP1OrT/RVQqfz9MXzwiu1N3UhMcX3uUM1h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6TvZhle0Swx9Kox/ctaA1VNugHpqS5Pl2ExvsXDKby5404KXeiIOq61wxbkzi3qM
	 sk9KvX6r1ioYlPzV+G25uQh1ILbnaJmJ0DiWuZ/s7sVaMfwi/qCFdkkXK2Ou91oigu
	 S5EBJMf8GI/3PvhOaOdDtoWLkxoTDM1kryd+FKNc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260728115325epcas5p4491d7cf29a604b082c9bb3ebdea4b562~GcfaDyz452959829598epcas5p4U;
	Tue, 28 Jul 2026 11:53:25 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8Ykr5sfYz2SSKb; Tue, 28 Jul
	2026 11:53:24 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260728115323epcas5p3b4a6147d08051df05c8223e75546aa88~GcfYNE0PU1872318723epcas5p3y;
	Tue, 28 Jul 2026 11:53:23 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115321epsmtip1d90b584e9f031726791145aaa7b57823~GcfVpUu8U2127021270epsmtip1V;
	Tue, 28 Jul 2026 11:53:21 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 12/13] clk: samsung: exynos8855: add block usb clock support
Date: Tue, 28 Jul 2026 17:41:10 +0530
Message-Id: <20260728121111.2077860-13-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115323epcas5p3b4a6147d08051df05c8223e75546aa88
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115323epcas5p3b4a6147d08051df05c8223e75546aa88
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115323epcas5p3b4a6147d08051df05c8223e75546aa88@epcas5p3.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_USB, this provides clocks for USB

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 102 ++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 293f461f26cf..7865f38a0174 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -17,10 +17,11 @@
 #include "clk-exynos-arm64.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP                     (CLKCMU_DOUT_HSI_UFS_EMBD + 1)
+#define CLKS_NR_TOP                     (CLKCMU_DOUT_USB_USB20DRD + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS_IPCLKPORT_PCLK + 1)
 #define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI_IPCLKPORT_PCLK  + 1)
+#define CLKS_NR_USB                     (CLK_GOUT_SYSREG_USB_IPCLKPORT_PCLK + 1)
 
 /* ---- CMU_TOP --------------------------------------------------------- */
 
@@ -62,6 +63,10 @@
 #define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD              0x1054
 #define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC                   0x1850
 #define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD              0x1854
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_NOC                   0x1088
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_USB20DRD              0x108c
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_NOC                   0x1888
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_USB20DRD              0x188c
 
 static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_MMC,
@@ -96,6 +101,10 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD,
 	CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC,
 	CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_USB_NOC,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_USB_USB20DRD,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_USB_NOC,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_USB_USB20DRD,
 };
 
 static const struct samsung_pll_clock top_pll_clks[] __initconst = {
@@ -146,6 +155,14 @@ PNAME(mout_clkcmu_hsi_ufs_embd_p)            = { "dout_shared0_div2", "dout_shar
 						"dout_shared1_div2", "dout_shared1_div3",
 						"dout_shared2_div2", "dout_shared2_div3",
 						"dout_shared3_div2", "dout_shared3_div3"};
+PNAME(mout_clkcmu_usb_noc_p)            = { "dout_shared0_div2", "dout_shared0_div3",
+						"dout_shared0_div4", "dout_shared1_div3",
+						"dout_shared2_div2", "dout_shared2_div3",
+						"dout_shared3_div2", "dout_shared3_div3"};
+PNAME(mout_clkcmu_usb_usb20drd_p)            = { "dout_shared0_div2", "dout_shared0_div3",
+						"dout_shared0_div4", "dout_shared1_div3",
+						"dout_shared2_div2", "dout_shared2_div3",
+						"dout_shared3_div2", "dout_shared3_div3"};
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
@@ -174,6 +191,10 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    mout_clkcmu_hsi_noc_p, CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC, 0, 3),
 	MUX(CLKCMU_MOUT_HSI_UFS_EMBD, "mout_clkcmu_hsi_ufs_embd",
 	    mout_clkcmu_hsi_ufs_embd_p, CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD, 0, 3),
+	MUX(CLKCMU_MOUT_USB_NOC, "mout_clkcmu_usb_noc",
+	    mout_clkcmu_usb_noc_p, CMU_TOP_CLK_CON_MUX_CLKCMU_USB_NOC, 0, 3),
+	MUX(CLKCMU_MOUT_USB_USB20DRD, "mout_clkcmu_usb_usb20drd",
+	    mout_clkcmu_usb_usb20drd_p, CMU_TOP_CLK_CON_MUX_CLKCMU_USB_USB20DRD, 0, 3),
 };
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
@@ -198,6 +219,12 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLKCMU_DOUT_HSI_UFS_EMBD, "dout_clkcmu_hsi_ufs_embd",
 	    "mout_clkcmu_hsi_ufs_embd", CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD,
 	    0, 4),
+	DIV(CLKCMU_DOUT_USB_NOC, "dout_clkcmu_usb_noc",
+	    "mout_clkcmu_usb_noc", CMU_TOP_CLK_CON_DIV_CLKCMU_USB_NOC,
+	    0, 4),
+	DIV(CLKCMU_DOUT_USB_USB20DRD, "dout_clkcmu_usb_usb20drd",
+	    "mout_clkcmu_usb_usb20drd", CMU_TOP_CLK_CON_DIV_CLKCMU_USB_USB20DRD,
+	    0, 5),
 };
 
 static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
@@ -249,6 +276,10 @@ static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initcon
 		"mout_mmc_pll", 1, 2, 0),
 };
 
+static const struct samsung_fixed_rate_clock top_fixed_rate_clks[] __initconst = {
+	FRATE(0, "oscclk_usb_link", NULL, 0, 19200000),
+};
+
 static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.pll_clks		= top_pll_clks,
 	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
@@ -258,6 +289,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_div_clks            = ARRAY_SIZE(top_div_clks),
 	.fixed_factor_clks	= top_fixed_factor_clks,
 	.nr_fixed_factor_clks	= ARRAY_SIZE(top_fixed_factor_clks),
+	.fixed_clks             = top_fixed_rate_clks,
+	.nr_fixed_clks          = ARRAY_SIZE(top_fixed_rate_clks),
 	.nr_clk_ids             = CLKS_NR_TOP,
 	.clk_regs               = top_clk_regs,
 	.nr_clk_regs            = ARRAY_SIZE(top_clk_regs),
@@ -566,6 +599,70 @@ static const struct samsung_cmu_info hsi_cmu_info __initconst = {
 	.clk_name               = "bus",
 };
 
+/* ---- CMU_USB --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_USB (0x13000000) */
+#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER                   0x600
+#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER              0x610
+#define CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD                       0x1000
+#define CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3                       0x1800
+#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK     0x2000
+#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK  0x2030
+
+static const unsigned long usb_clk_regs[] __initconst = {
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER,
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER,
+	CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD,
+	CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_USB */
+PNAME(mout_clkcmu_usb_noc_user_p) = { "oscclk", "dout_clkcmu_usb_noc" };
+PNAME(mout_clkcmu_usb_usb20drd_user_p) = { "oscclk", "dout_clkcmu_usb_usb20drd" };
+PNAME(mout_clk_usb_usb20drd_p) = { "oscclk_usb_link", "mout_clkcmu_usb_usb20drd_user" };
+
+static const struct samsung_mux_clock usb_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_USB_NOC_USER, "mout_clkcmu_usb_noc_user",
+	    mout_clkcmu_usb_noc_user_p, CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_USB_USB20DRD_USER, "mout_clkcmu_usb_usb20drd_user",
+	    mout_clkcmu_usb_usb20drd_user_p, CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER, 4, 1),
+	MUX(CLK_MOUT_USB_USB20DRD, "mout_clk_usb_usb20drd",
+	    mout_clk_usb_usb20drd_p, CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD, 0, 1),
+};
+
+static const struct samsung_div_clock usb_div_clks[] __initconst = {
+	DIV(CLK_DOUT_USB_NOC_DIV3, "dout_clkcmu_usb_noc_div3",
+	    "mout_clkcmu_usb_noc_user", CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock usb_gate_clks[] __initconst = {
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_CMU_USB_IPCLKPORT_PCLK, "gout_cmu_usb_ipclkport_pclk",
+	     "mout_clkcmu_usb_noc_user",
+	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_SYSREG_USB_IPCLKPORT_PCLK, "gout_sysreg_usb_ipclkport_pclk",
+	     "mout_clkcmu_usb_noc_user",
+	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info usb_cmu_info __initconst = {
+	.mux_clks               = usb_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(usb_mux_clks),
+	.div_clks               = usb_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(usb_div_clks),
+	.gate_clks              = usb_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(usb_gate_clks),
+	.nr_clk_ids             = CLKS_NR_USB,
+	.clk_regs               = usb_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(usb_clk_regs),
+	.clk_name               = "bus",
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -590,6 +687,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos8855-cmu-top",
 		.data = &top_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-usb",
+		.data = &usb_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1

