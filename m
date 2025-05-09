Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C9929116A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 May 2025 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797236; cv=none; b=mv5sJBaYbqLDhWAB3NXQ6LK//oOJwgVcvpCcLsy7K8uXz9YbQbm8R7uhhXONGOf+b4FDefNIKnv5Mjurh3IBqwFIofzKWoE4gvQLpBobDdakFFd9Q7w3NL6V2O3SS0zoosnBeZ0shZvp4me5R5OHnUrRp1zx4g9ajnYaxQAOOGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797236; c=relaxed/simple;
	bh=doZKpPxAQpxaBkO/YlN9rUxl+kd59lEXLwgpO7DZBAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=QfhL3qJ/E0BKqy4CN5m1s6IoM7aeXThtYi4gIdSbCMdYrq2MLQ4MMfpwl5T68gsjj4IN7cd6g1gBGRB0nTpMYs4IzkKqopL3cioO7/pjjxqLQ9Q7A4oRAhlisukFySN/OdPeaAKX8ahwrTHytPLHKskoX4UZTxaZf8dhU+nF5/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cXe4/vvP; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cXe4/vvP"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250509132712epoutp02ed638988355559638fe36550d352cf8c~93tPyBnGE2005320053epoutp022
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 May 2025 13:27:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250509132712epoutp02ed638988355559638fe36550d352cf8c~93tPyBnGE2005320053epoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746797232;
	bh=e0Eu3ZZtuZQ0K6JhQyN7GxUowK7inRr+RYFTzz6V1gY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cXe4/vvPDnsUyQ/zYa+6dRFdUBtEjIZxq97KBqyqwbHFw99YXPAKwTYEgu2gWDFLA
	 aWEvcyV1dI1wFxRLWchs6w+n9FrogP/FCFyYellSveTB6+hMdaybGJ1iti4G3+stZE
	 l5Cy+HYPYwKzo60c51a1z22udEajNYjqU/S3kmqg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250509132711epcas5p2decb26bfdfcd376a21cd9ef17d7ea02f~93tPDhFaE1216212162epcas5p20;
	Fri,  9 May 2025 13:27:11 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.175]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zv8tP5tbbz6B9m7; Fri,  9 May
	2025 13:27:09 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62~93XoXd59A0846108461epcas5p3K;
	Fri,  9 May 2025 13:02:26 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250509130226epsmtrp1f24d8b7de12cdf7a6cbea7e38cc19009~93XoWtUdw2431924319epsmtrp1Y;
	Fri,  9 May 2025 13:02:26 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-64-681dfce2c039
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.FC.19478.2ECFD186; Fri,  9 May 2025 22:02:26 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250509130224epsmtip1e3878beea0dbc1db6802ec0f36e702e9~93XmiwAWx2265322653epsmtip1L;
	Fri,  9 May 2025 13:02:24 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v1] clk: samsung: exynosautov920: add block hsi2 clock
 support
Date: Fri,  9 May 2025 18:42:10 +0530
Message-Id: <20250509131210.3192208-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnO6jP7IZBjMvGFg8mLeNzeL6l+es
	FufPb2C32PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhbHFohZfF95h9HiyJkXzBaH37SzWvy7
	tpHFgdfj/Y1Wdo+ds+6ye2xa1cnmsXlJvUffllWMHp83yQWwRXHZpKTmZJalFunbJXBlzPj/
	n7FgvnLFwpcdLA2MR2S7GDk5JARMJG6dP8vUxcjFISSwnVFi0b8jjBAJCYl9/39D2cISK/89
	Z4coesso8Wn7U7AEm4CWxJXt79hAEiICaxglPvbNB0swC5xhlJg5UQjEFhbwk2ic/J2li5GD
	g0VAVWLVN3aQMK+AtcSZ3XNYIBbIS+w/eJYZIi4ocXLmExaIMfISzVtnM09g5JuFJDULSWoB
	I9MqRtHUguLc9NzkAkO94sTc4tK8dL3k/NxNjODw1grawbhs/V+9Q4xMHIyHGCU4mJVEeJ93
	ymQI8aYkVlalFuXHF5XmpBYfYpTmYFES51XO6UwREkhPLEnNTk0tSC2CyTJxcEo1MFm1FlRO
	q7CN9rm8QjB/4uejCbul/tz7qf9TRTPyVPbDEHbXBdxi1QtYjN0ez2Lt8ntXU3BYa/l8a4ls
	dh3frr63Hb+Z938y0X+U96Rzb+mlhnc2B1a8WJl14P8nkT9uMdbzNM48k9ye4LaIb397sFpM
	zypWz9kF6jIxl7IFljw57WB6MCnh49LJ6w+baXx5HFk3lfOv8/yiCi1hi2eLNx1OLhGRWnfN
	J8f9NFO4T6OM320ea4l0pbQ/Zc+1m5ni10yavKrrK9+Xx/ZCGncMNYW2PMozjzn3rnb1/muB
	y77Vnr25LFEp/4lHx7OPFUye3YUSHj/ee3x89GmvZGOT3FYZa4dDCXW8yk2Wyfe5lFiKMxIN
	tZiLihMBaYD+fN4CAAA=
X-CMS-MailID: 20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62
References: <CGME20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62@epcas5p3.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_HSI2, this provides clocks for HSI2 block

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index f8168eed4a66..89d6ea10515d 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -26,6 +26,7 @@
 #define CLKS_NR_MISC			(CLK_DOUT_MISC_OSC_DIV2 + 1)
 #define CLKS_NR_HSI0			(CLK_DOUT_HSI0_PCIE_APB + 1)
 #define CLKS_NR_HSI1			(CLK_MOUT_HSI1_USBDRD + 1)
+#define CLKS_NR_HSI2			(CLK_DOUT_HSI2_ETHERNET_PTP + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -1752,6 +1753,74 @@ static const struct samsung_cmu_info hsi1_cmu_info __initconst = {
 	.clk_name		= "noc",
 };
 
+/* ---- CMU_HSI2 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_HSI2 (0x16b00000) */
+#define PLL_LOCKTIME_PLL_ETH                    0x0
+#define PLL_CON3_PLL_ETH			0x10c
+#define PLL_CON0_MUX_CLKCMU_HSI2_ETHERNET_USER  0x600
+#define PLL_CON0_MUX_CLKCMU_HSI2_NOC_UFS_USER   0x610
+#define PLL_CON0_MUX_CLKCMU_HSI2_UFS_EMBD_USER  0x630
+#define CLK_CON_MUX_MUX_CLK_HSI2_ETHERNET       0x1000
+#define CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET       0x1800
+#define CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET_PTP   0x1804
+
+static const unsigned long hsi2_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_ETH,
+	PLL_CON3_PLL_ETH,
+	PLL_CON0_MUX_CLKCMU_HSI2_ETHERNET_USER,
+	PLL_CON0_MUX_CLKCMU_HSI2_NOC_UFS_USER,
+	PLL_CON0_MUX_CLKCMU_HSI2_UFS_EMBD_USER,
+	CLK_CON_MUX_MUX_CLK_HSI2_ETHERNET,
+	CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET,
+	CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET_PTP,
+};
+
+static const struct samsung_pll_clock hsi2_pll_clks[] __initconst = {
+	/* CMU_HSI2_PLL */
+	PLL(pll_531x, FOUT_PLL_ETH, "fout_pll_eth", "oscclk",
+	    PLL_LOCKTIME_PLL_ETH, PLL_CON3_PLL_ETH, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_HSI2 */
+PNAME(mout_clkcmu_hsi2_noc_ufs_user_p) = { "oscclk", "dout_clkcmu_hsi2_noc_ufs" };
+PNAME(mout_clkcmu_hsi2_ufs_embd_user_p) = { "oscclk", "dout_clkcmu_hsi2_ufs_embd" };
+PNAME(mout_hsi2_ethernet_p) = { "fout_pll_eth", "mout_clkcmu_hsi2_ethernet_user" };
+PNAME(mout_clkcmu_hsi2_ethernet_user_p) = { "oscclk", "dout_clkcmu_hsi2_ethernet" };
+
+static const struct samsung_mux_clock hsi2_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_HSI2_NOC_UFS_USER, "mout_clkcmu_hsi2_noc_ufs_user",
+	    mout_clkcmu_hsi2_noc_ufs_user_p, PLL_CON0_MUX_CLKCMU_HSI2_NOC_UFS_USER, 4, 1),
+	MUX(CLK_MOUT_HSI2_UFS_EMBD_USER, "mout_clkcmu_hsi2_ufs_embd_user",
+	    mout_clkcmu_hsi2_ufs_embd_user_p, PLL_CON0_MUX_CLKCMU_HSI2_UFS_EMBD_USER, 4, 1),
+	MUX(CLK_MOUT_HSI2_ETHERNET, "mout_hsi2_ethernet",
+	    mout_hsi2_ethernet_p, CLK_CON_MUX_MUX_CLK_HSI2_ETHERNET, 0, 1),
+	MUX(CLK_MOUT_HSI2_ETHERNET_USER, "mout_clkcmu_hsi2_ethernet_user",
+	    mout_clkcmu_hsi2_ethernet_user_p, PLL_CON0_MUX_CLKCMU_HSI2_ETHERNET_USER, 4, 1),
+};
+
+static const struct samsung_div_clock hsi2_div_clks[] __initconst = {
+	DIV(CLK_DOUT_HSI2_ETHERNET, "dout_hsi2_ethernet",
+	    "mout_hsi2_ethernet", CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET,
+	    0, 4),
+	DIV(CLK_DOUT_HSI2_ETHERNET_PTP, "dout_hsi2_ethernet_ptp",
+	    "mout_hsi2_ethernet", CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET_PTP,
+	    0, 4),
+};
+
+static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
+	.pll_clks               = hsi2_pll_clks,
+	.nr_pll_clks            = ARRAY_SIZE(hsi2_pll_clks),
+	.mux_clks               = hsi2_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(hsi2_mux_clks),
+	.div_clks               = hsi2_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(hsi2_div_clks),
+	.nr_clk_ids             = CLKS_NR_HSI2,
+	.clk_regs               = hsi2_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(hsi2_clk_regs),
+	.clk_name               = "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1779,6 +1848,9 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-cmu-hsi1",
 		.data = &hsi1_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-hsi2",
+		.data = &hsi2_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1

