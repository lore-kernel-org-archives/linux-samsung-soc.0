Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A84E4C39
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546253; cv=none; b=rx/7vBc8Ec430Vksbi8Od2+MUvCqPJzv8NXPjPWb+C6nDoJXXWNohEJO5g4mPCqjGjIgPTM/BDgkQI9wJjmBsRpmx8BBK2fAxkPUcC1TCq1DX9adsaR6E6opKIY6jAw4+uii8huM67TQcI5ZgAsYXDz+0ZYGXYcoLqotn1h4frA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546253; c=relaxed/simple;
	bh=qsAIUGCu2Nr9CkOsYGLkW2bt7bl/Zwnd5YP6p2PzjVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=g7NRx1DGHKn1vTMrX2bnHHDaDDob2saIOjogmiYiZv6YuQWgTCQjYKmZImIvstZRKB2N5EPJQlyp19tREF2nGYtI+m0OVr2Bwosq6oDapGcTW/72XYmBgCcW6C9Unt05BPKICakSQoQ7AtyeKlLCSST9q2tIJY8XVPviItrWCvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jtjPWkc5; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jtjPWkc5"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261009114358epoutp0486097730ba04fe9c116dffb704707adf~c2c-jj9qJ3022030220epoutp04W
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261009114358epoutp0486097730ba04fe9c116dffb704707adf~c2c-jj9qJ3022030220epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546238;
	bh=ADCo/FiF/M+Gog/73jGMgjnYRKW/94unUVhCAOuF42E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jtjPWkc5rtEss1DQt85yzUl101yd/NJRjk3FvIMDZLAZjbL70beVvW/a9iEUN7UCk
	 +GN4bg2Xv3MyDgZ0NsUv5a8ogF17PSG0Sj+Otslj24CJAioTpBH+UrQ6uRmUF0gQco
	 8AIwuf4Vho+zMNEK0q/ZfTwKvDl8y0ho0gtpbxOw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261009114358epcas5p46ec6f3332011665a9f14df9852836e09~c2c-GOBhl2206022060epcas5p4Z;
	Fri,  9 Oct 2026 11:43:58 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j1Q4F08YPz6B9mD; Fri,  9 Oct
	2026 11:43:57 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d~c2c9mR4wv0307103071epcas5p35;
	Fri,  9 Oct 2026 11:43:56 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114354epsmtip237aac79577c106e5f2392fb08e3f85cf~c2c7RZ7Bf1160511605epsmtip2w;
	Fri,  9 Oct 2026 11:43:53 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 09/14] clk: samsung: exynos8855: add block hsi clock
 support
Date: Fri,  9 Oct 2026 17:31:32 +0530
Message-Id: <20261009120137.2801911-10-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d@epcas5p3.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_HSI, this provides clocks for HSI

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 75 ++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 2bf889a478bc..16d71db11ad0 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -19,7 +19,9 @@
 #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
+#define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI  + 1)
 
+#define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
 #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
@@ -1189,6 +1191,76 @@ static const struct samsung_cmu_info peris_cmu_info __initconst = {
 	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
 };
 
+/* ---- CMU_HSI --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_HSI (0x17000000) */
+#define CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER               0x600
+#define CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER          0x610
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK 0x2000
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK 0x2038
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_ACLK 0x203c
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO 0x2058
+#define CMU_HSI_CONTROLLER_OPTION0_CMU_CTRL                    0x800
+
+static const unsigned long hsi_clk_regs[] __initconst = {
+	CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER,
+	CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
+	CMU_HSI_CONTROLLER_OPTION0_CMU_CTRL,
+};
+
+/* List of parent clocks for Muxes in CMU_HSI */
+PNAME(mout_clkcmu_hsi_noc_user_p) = { "oscclk", "dout_clkcmu_hsi_noc" };
+PNAME(mout_clkcmu_hsi_ufs_embd_user_p) = { "oscclk", "dout_clkcmu_hsi_ufs_embd" };
+
+static const struct samsung_mux_clock hsi_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_HSI_NOC_USER, "mout_clkcmu_hsi_noc_user",
+	    mout_clkcmu_hsi_noc_user_p, CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_HSI_UFS_EMBD_USER, "mout_clkcmu_hsi_ufs_embd_user",
+	    mout_clkcmu_hsi_ufs_embd_user_p, CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER, 4, 1),
+};
+
+static const struct samsung_gate_clock hsi_gate_clks[] __initconst = {
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_CMU_HSI, "gout_cmu_hsi",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_HSI, "gout_sysreg_hsi",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_UFS_EMBD_ACLK_HSI, "gout_ufs_embd_aclk_hsi",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_UFS_EMBD_UNIPRO_HSI, "gout_ufs_embd_unipro_hsi",
+	     "mout_clkcmu_hsi_ufs_embd_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info hsi_cmu_info __initconst = {
+	.mux_clks               = hsi_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(hsi_mux_clks),
+	.gate_clks              = hsi_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(hsi_gate_clks),
+	.nr_clk_ids             = CLKS_NR_HSI,
+	.clk_regs               = hsi_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(hsi_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_HSI_GATE_DBG_OFFSET,
+	.option_offset          = CMU_HSI_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1202,6 +1274,9 @@ static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 
 static const struct of_device_id exynos8855_cmu_of_match[] = {
 	{
+		.compatible = "samsung,exynos8855-cmu-hsi",
+		.data = &hsi_cmu_info,
+	}, {
 		.compatible = "samsung,exynos8855-cmu-peric",
 		.data = &peric_cmu_info,
 	}, {
-- 
2.34.1

