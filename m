Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349F431A22
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239601; cv=none; b=T06dLV9EvrlQDz200vSPoVrIO7e/99FZ2MbuhtCyy1axozgI88HyYoXFTcU4Od17m6bbYbtFWftIkxLW3lwJKC5AiGgW6rUOvEROLW7LAW93gLG7G57WgHf5WwS8eOj+6CcSYTR243zC0B6bqTYN/AqyImA0KNBiegeazBo1LWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239601; c=relaxed/simple;
	bh=dEmwgYTuU+DXPWbbkmXK3DoqqsFpVHwhc1iVlukZn/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=s1fjsz1UZS+MBy900bsLARR7rff8iDgzfRGxP2+6uQRJpNmS6rgxgDSjofE6V/oV0VQbnViHqYJTHoxsqAjxUHntka2YN+XYPpnPHQicsmFOFVILxpGWfjMCmXDgy/pt/MiMJLJnlfcuuN1YzxwCa9KYL+2fVPxVij1KrfdccD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YO4LDQXN; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YO4LDQXN"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260728115316epoutp03fc3fa329ad63f0f8e23a58ac3d2a901d~GcfRcTRaq2172421724epoutp03e
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260728115316epoutp03fc3fa329ad63f0f8e23a58ac3d2a901d~GcfRcTRaq2172421724epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239596;
	bh=9DxKenrUVN76ruyESOYxQfzMqPBRTUzH+EoyDyc7fTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YO4LDQXNAnb1y2BUUC0PdEfQKXLHLndKal+6iqxFjV+hFF0vIFZBtrJcAQOqbAwhd
	 aUWTgqxnTjV4vV1cClS5hZHJMoV4fFqpG8w0+ERXkM+DYIq6zeFMQiTIAibQVfJSc5
	 JoVlReGmGo/chKP5ksFlRC/k8USt4SQXkYym4bv8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260728115315epcas5p14869d15743f98cfdaac423de37cffd12~GcfQpYJWw2742927429epcas5p11;
	Tue, 28 Jul 2026 11:53:15 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4h8Ykf5yQqz6B9m9; Tue, 28 Jul
	2026 11:53:14 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260728115314epcas5p28e12e88f1dbae36f7dff07501301e4ad~GcfPVeNrJ0256002560epcas5p2I;
	Tue, 28 Jul 2026 11:53:14 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115311epsmtip18a368d329c32590410be5f9a2eca8137~GcfMk31sc2127021270epsmtip1T;
	Tue, 28 Jul 2026 11:53:11 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 09/13] clk: samsung: exynos8855: add block hsi clock support
Date: Tue, 28 Jul 2026 17:41:07 +0530
Message-Id: <20260728121111.2077860-10-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115314epcas5p28e12e88f1dbae36f7dff07501301e4ad
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115314epcas5p28e12e88f1dbae36f7dff07501301e4ad
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115314epcas5p28e12e88f1dbae36f7dff07501301e4ad@epcas5p2.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_HSI, this provides clocks for HSI

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 81 +++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 40745f04be0c..293f461f26cf 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -17,9 +17,10 @@
 #include "clk-exynos-arm64.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP                     (FOUT_MMC_PLL_CLKOUT_DIV2 + 1)
+#define CLKS_NR_TOP                     (CLKCMU_DOUT_HSI_UFS_EMBD + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS_IPCLKPORT_PCLK + 1)
+#define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI_IPCLKPORT_PCLK  + 1)
 
 /* ---- CMU_TOP --------------------------------------------------------- */
 
@@ -57,6 +58,10 @@
 #define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC                 0x10c8
 #define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC                 0x18c0
 #define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC                 0x18c4
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC                   0x1050
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD              0x1054
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC                   0x1850
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD              0x1854
 
 static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_MMC,
@@ -87,6 +92,10 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC,
 	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC,
 	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD,
 };
 
 static const struct samsung_pll_clock top_pll_clks[] __initconst = {
@@ -129,6 +138,14 @@ PNAME(mout_clkcmu_peris_noc_p)            = { "dout_shared0_div2", "dout_shared0
 						"dout_shared1_div2", "dout_shared1_div3",
 						"dout_shared1_div4", "dout_shared2_div2",
 						"fout_mmc_pll_div2", "dout_shared3_div3"};
+PNAME(mout_clkcmu_hsi_noc_p)            = { "dout_shared0_div2", "dout_shared0_div3",
+						"dout_shared1_div2", "dout_shared1_div3",
+						"dout_shared2_div2", "dout_shared2_div3",
+						"dout_shared3_div2", "dout_shared3_div3"};
+PNAME(mout_clkcmu_hsi_ufs_embd_p)            = { "dout_shared0_div2", "dout_shared0_div3",
+						"dout_shared1_div2", "dout_shared1_div3",
+						"dout_shared2_div2", "dout_shared2_div3",
+						"dout_shared3_div2", "dout_shared3_div3"};
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
@@ -153,6 +170,10 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    mout_clkcmu_peris_gic_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC, 0, 3),
 	MUX(CLKCMU_MOUT_PERIS_NOC, "mout_clkcmu_peris_noc",
 	    mout_clkcmu_peris_noc_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC, 0, 3),
+	MUX(CLKCMU_MOUT_HSI_NOC, "mout_clkcmu_hsi_noc",
+	    mout_clkcmu_hsi_noc_p, CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC, 0, 3),
+	MUX(CLKCMU_MOUT_HSI_UFS_EMBD, "mout_clkcmu_hsi_ufs_embd",
+	    mout_clkcmu_hsi_ufs_embd_p, CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD, 0, 3),
 };
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
@@ -171,6 +192,12 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLKCMU_DOUT_PERIS_NOC, "dout_clkcmu_peris_noc",
 	    "mout_clkcmu_peris_noc", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC,
 	    0, 4),
+	DIV(CLKCMU_DOUT_HSI_NOC, "dout_clkcmu_hsi_noc",
+	    "mout_clkcmu_hsi_noc", CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC,
+	    0, 4),
+	DIV(CLKCMU_DOUT_HSI_UFS_EMBD, "dout_clkcmu_hsi_ufs_embd",
+	    "mout_clkcmu_hsi_ufs_embd", CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD,
+	    0, 4),
 };
 
 static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
@@ -490,6 +517,55 @@ static const struct samsung_cmu_info peris_cmu_info __initconst = {
 	.clk_name               = "bus",
 };
 
+/* ---- CMU_HSI --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_HSI (0x17000000) */
+#define CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER               0x600
+#define CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER          0x610
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK        0x2000
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK     0x2038
+
+static const unsigned long hsi_clk_regs[] __initconst = {
+	CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER,
+	CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK,
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
+	GATE(CLK_GOUT_CMU_HSI_IPCLKPORT_PCLK, "gout_cmu_hsi_ipclkport_pclk",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_SYSREG_HSI_IPCLKPORT_PCLK, "gout_sysreg_hsi_ipclkport_pclk",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK,
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
+	.clk_name               = "bus",
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -503,6 +579,9 @@ static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 
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

