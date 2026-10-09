Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D04E4C42
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546256; cv=none; b=o2HkoqxfTp91TdtZMmME9q6cBzl3Zdq1h3xkOpix/q8jLSqe82nD1Cb2NuTLK9L99GIn9F++GHRgEzrvVqRw8FIXwPMDOpypjOYJdeG1dX6Pb+EZE/m0yl+6YUHrGpEbL22O8IXS9gIqpDDBN41LgwxQcfi6OjvW8E5y9d3cwUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546256; c=relaxed/simple;
	bh=Q50MEg24S2vqQJ+3HOBxHjgRF7KDzYZMdg5Ys/VQreM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=t2c+nsXJzV4B9sJJ+aqDiV4hvsod9o9BUJlGqo0mSnhzgOetPZOFqt+XuCAL/RnpIKMCt83pUGSCPO4FTZcE3BZ+5TCIPg1+l/XoYhy6PLA/QwylRUOHiZ3Nh5JLQwlCL/Nl+S3hNqQtSkJOQ9NvYrZp8xSAbnPS+apUFvv3NLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gQN1tHd9; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gQN1tHd9"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261009114402epoutp04aacc8fce23e1f9f14265f298f61393d4~c2dC3IQhT3063230632epoutp04F
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:44:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261009114402epoutp04aacc8fce23e1f9f14265f298f61393d4~c2dC3IQhT3063230632epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546242;
	bh=ySeRjjT1bYVtRGC/o4/umKPGHAVanArpzajQhf7JQqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQN1tHd9069xNSgAMnqD4uqcoDsOphrWXENEPaVm7thgg/ByoKRvr54B5TLxHWhRx
	 WX+FNX8QbwvtlgpL01QX9EHYPUf3PmTXCUWxkqmJKm0VB4VQL0ihqIQRkR5kBY7KvU
	 DxtMhdxp3LCSHXS9AmlykPNM6ON4Fz1GL5RBiNmI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261009114401epcas5p294aaecd82a4e0be3fe2f83d296c5516a~c2dCICySG0267702677epcas5p2b;
	Fri,  9 Oct 2026 11:44:01 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j1Q4J2hYYz6B9m9; Fri,  9 Oct
	2026 11:44:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6~c2dAJUYl91310413104epcas5p37;
	Fri,  9 Oct 2026 11:43:59 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114356epsmtip27cbb60f6031e077b14e2fa9183e71665~c2c91Wuxe3087430874epsmtip2V;
	Fri,  9 Oct 2026 11:43:56 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 10/14] clk: samsung: exynos8855: add block usb clock
 support
Date: Fri,  9 Oct 2026 17:31:33 +0530
Message-Id: <20261009120137.2801911-11-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6@epcas5p3.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_USB, this provides clocks for USB

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 78 ++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 16d71db11ad0..010ca79116d3 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -20,11 +20,13 @@
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 #define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI  + 1)
+#define CLKS_NR_USB                     (CLK_GOUT_SYSREG_USB + 1)
 
 #define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
 #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
+#define EXYNOS8855_USB_GATE_DBG_OFFSET      0x2004
 
 #define EXYNOS8855_DRCG_EN_OFFSET       0x104
 #define EXYNOS8855_MEMCLK_OFFSET        0x108
@@ -1261,6 +1263,79 @@ static const struct samsung_cmu_info hsi_cmu_info __initconst = {
 	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
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
+#define CMU_USB_CONTROLLER_OPTION0_CMU_CTRL                        0x800
+
+static const unsigned long usb_clk_regs[] __initconst = {
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER,
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER,
+	CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD,
+	CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
+	CMU_USB_CONTROLLER_OPTION0_CMU_CTRL,
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
+	GATE(CLK_GOUT_CMU_USB, "gout_cmu_usb",
+	     "mout_clkcmu_usb_noc_user",
+	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_USB, "gout_sysreg_usb",
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
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_USB_GATE_DBG_OFFSET,
+	.option_offset          = CMU_USB_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1285,6 +1360,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
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

