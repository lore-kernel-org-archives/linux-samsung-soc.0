Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567255;
	b=KdGoTEb5lvR4FfPN4dz9J9CzEheepLxTTt0fxaDNxUn20DPLCNyHgdyIXo5MhjZI7Vqm
	 M2VWwYVZN3I+kSv89yi8588ggoK8XCISPy2lnC7TFPlG1tCdGRfZ0skfD/OKuWLj4rLIq
	 D0jSJLf8fWsctnB4Zr9Wfe5FPapmMLGVlk6tSQwcvNTTv067ZKB55BW1BeLkHgXcVUJsi
	 jFAgfjOkKTgfDUmruT8J5QpXcxlR5mseZSwHg+YucPBQsUsWOAYwhs5F8VUIse7DBVI24
	 wUAGAbsyDh3bjNguUOM6xtUZZIFPo4fu4Zel+ELN48sjwDXIvPsPolTdUzTRN96mucA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567255;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=M76yB7aKyunzTAs8QYlgj7W01OAF+Oiv2Cw7Fi7kWFA=;
	b=eHDck0vT7OY7X7KFvmnNuUlnLPbYifU5DzYzl6imnm9ooOj3rCDbokeq3nER5dZ+l0OC
	 XrYkhTOAKq3ALPioRJgIV1v5STPn57vSOw+oPJzmq1G4YN+rbf6+/mgPojp7pI8CQxjCA
	 lNeQ3VZ/gykdKpPL9QcI2ilrsw8A8TJvG08y8crgoRhdi4EgVfufn1N3LANvplNR45ZE2
	 DCBRQKV8pkjnjdhOSFOod/xCPGHxhM6oeza323bURSnLDdPpk6cg0xwaQ+jQP8CgamXWW
	 fAsUhUaiNXbZ8Sbt5hRWwGTYhJHrVhDG3q11cqPJui3Z0hW3EiDP0sIgtjmj28+21QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HVIgRrh2;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BA606B245
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643BA606B245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HVIgRrh2
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261113105412epoutp01e10131d2548a5fe89cb246bb1a81834e~nlWh0JPZ10797107971epoutp01v
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261113105412epoutp01e10131d2548a5fe89cb246bb1a81834e~nlWh0JPZ10797107971epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567252;
	bh=M76yB7aKyunzTAs8QYlgj7W01OAF+Oiv2Cw7Fi7kWFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVIgRrh2ijbAU14qxIwvA0Wwgj1l9X7OolrIeXwKttdMF8KBeNC/uonJyYKiWN5Rw
	 +3+x1zmhjYN16CqPOXIAZefAissBynJoBOHFpv72KvBtpMDVjhuQQSjGgnrFG1IEnl
	 sK2yLujl3rPJep0cG9S1TvdZtcdqfL4OlmGmRAM8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261113105411epcas5p4431905997a4da4257c4496eb4ea76cd0~nlWhE1ly00323803238epcas5p43;
	Fri, 13 Nov 2026 10:54:11 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jQvJf3xbTz2SSKZ; Fri, 13 Nov
	2026 10:54:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104855epcas5p1ed56e1444542349a8f2839cf27df3d60~nlR6nrFNp0699906999epcas5p1K;
	Fri, 13 Nov 2026 10:48:55 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104852epsmtip294ae89502bd43001a115e2037ab98e91~nlR4ONJVz2501325013epsmtip2P;
	Fri, 13 Nov 2026 10:48:52 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 09/14 RESEND] clk: samsung: exynos8855: add block hsi
 clock support
Date: Fri, 13 Nov 2026 16:36:07 +0530
Message-Id: <20261113110612.3265841-10-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104855epcas5p1ed56e1444542349a8f2839cf27df3d60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104855epcas5p1ed56e1444542349a8f2839cf27df3d60
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104855epcas5p1ed56e1444542349a8f2839cf27df3d60@epcas5p1.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_HSI, this provides clocks for HSI

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 12b5ae54b560..0be1cefadb51 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -19,7 +19,9 @@
 #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
+#define CLKS_NR_HSI                     (CLK_GOUT_UFS_EMBD_UNIPRO_HSI  + 1)
 
+#define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
 #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
@@ -1186,6 +1188,75 @@ static const struct samsung_cmu_info peris_cmu_info __initconst = {
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
@@ -1199,6 +1270,9 @@ static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 
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

