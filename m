Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7994E0B97
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546249; cv=none; b=uphqSmahjdcmvZ5sAGDGUfBEXMuMmuJkfYt18UCcnnFAhhHFaEE8ziVc6pa02AaOCPVaD5XsNgts/qXgBx7yIwo4wudfGcc9bMhrjQveNi4vDgpSdEeely6y/RxHZ8aS2GYj5HX4STnpFGdHCif14LLlgvnyBFhDfECvPl7tPUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546249; c=relaxed/simple;
	bh=HMbsGc/P/hZgEcN5CzKodEoxEbqvCt1BKHd+ZfcwPig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=IebvunHf4S5ijx9ZzNgHxWV+8VYtc+pLIrAvrwm1Ny51F4+C6L1fr6fAMBrfwx5NDMCu47SmSSdUI6C4O33DFCICZsXHKv9SJQ34XPsf2iOfGRA96PX+rzLdmsx9QmjMNhLempWA8Rc/qnW4Sa4aqj7FL2yK9dfWo+kEjliYSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Dt1bi8yV; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Dt1bi8yV"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114355epoutp01067f5d851ac9e3006363dd2e69008f25~c2c82D5PR1420514205epoutp01B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114355epoutp01067f5d851ac9e3006363dd2e69008f25~c2c82D5PR1420514205epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546235;
	bh=QPySnsWHLurv7iJhgQhqAkvO8BpmKq9lBzL6S0RCGA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dt1bi8yVimSqzUPcNL5Hws/6Qh9Ed7Yrx83Ncy1m7NuxogmOHs9cs35iaeAilXZKR
	 0ETBJHdQUDJgclo4+wX+Y0PGX72MMIY8N0mhbP/POs4ewAtjO9sRl2FlGdXzDipHAa
	 RRr/oqcEaXI8um+xWh/lZUSdm4kWYNJBrakFgB7Q=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261009114355epcas5p2e6e4f03712d15d0b9cfd9895c40c9569~c2c8V9JxP3018230182epcas5p24;
	Fri,  9 Oct 2026 11:43:55 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j1Q4B1tc8z6B9m4; Fri,  9 Oct
	2026 11:43:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9~c2c6_3fxc3018230182epcas5p20;
	Fri,  9 Oct 2026 11:43:53 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114351epsmtip29b7bc626e8890a70f6c563ac6797ac64~c2c4qgtwu1160511605epsmtip2v;
	Fri,  9 Oct 2026 11:43:51 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 08/14] clk: samsung: exynos8855: add block peris clock
 support
Date: Fri,  9 Oct 2026 17:31:31 +0530
Message-Id: <20261009120137.2801911-9-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114353epcas5p2ab971c641319dc38209c55619e8c8ed9@epcas5p2.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_PERIS, this provides clocks for PERIS

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 98 ++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 5394706d214c..2bf889a478bc 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -18,7 +18,9 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
+#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 
+#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
 
@@ -1094,6 +1096,99 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
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
+#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
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
+	CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
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
+	GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const unsigned long dcrg_sysreg[] __initconst = {
+	EXYNOS8855_DRCG_EN_OFFSET,
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
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_PERIS_GATE_DBG_OFFSET,
+	.option_offset          = CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1109,6 +1204,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
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

