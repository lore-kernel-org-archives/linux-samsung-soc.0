Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2A2F99B8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929521; cv=none; b=XLo8IfgW8C3/XFqTClEaFQIss2RgghWlbqJRzkVeYxSwv8dl3H2LZtfL9EJpkU/qdghBX1oTV+jMTG/JWs49KA8KbJT6dQxx3y0cOuFsVkZDCgrxP3qPZWHJ8xOczdEMT2rkkviGn88kLunxnX2Nbs+zDKHr5tf1Dzto9B1QFOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929521; c=relaxed/simple;
	bh=ln5ORykojGXgOohZxDX4ae7MatfVfN5KFHsbfIrKxCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Am9iGf5vnVVYkJL6fuHaj8EjkEH5z61hZ+ZJqR0ti+jWXrPFRta392C4NU+LZ3YzHvTtmAMEqXS35SnKB8wprLJLJccjjkXYghMWyJN53mB4hNRu57u8SbxWdWJ6NmjgM4N4SGzCSLaSr4ZWIn2h0EVneKDCIskeudh8wZ3ziP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uCu9GZuI; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uCu9GZuI"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250915094517epoutp02d5ad3caa060cfcec18fb46ba62a44c51~la5UauI_I0296602966epoutp02I
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 09:45:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250915094517epoutp02d5ad3caa060cfcec18fb46ba62a44c51~la5UauI_I0296602966epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757929517;
	bh=AJ9+g8lkBAZ58DT0T4J7XS/I3gsTi6pRT012Sw5pz0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uCu9GZuIDv+CzwrpHtf10FZkrIDLoElhpHBY+pwsfLKwWPUH1iQsHv91beqtMRzun
	 22G0/Fd/VjE84eucPjNUVOjUr6Z0zchEAQBMsM2C7rcZRDHP0ztyiwETllVm2lOGGZ
	 LLo1/Xdpatedg5fCdRCXOI5lZACHNv0gqY3f843U=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250915094516epcas5p4d9e2f61d84f1637dac7c5ec9533eab5d~la5TgP2Gu1092910929epcas5p4E;
	Mon, 15 Sep 2025 09:45:16 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQKrq564Tz6B9m6; Mon, 15 Sep
	2025 09:45:15 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89~la5R8b5L52434524345epcas5p3j;
	Mon, 15 Sep 2025 09:45:15 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094512epsmtip265804811e091d1c92f81b7275247ed9c~la5PipG0g0931709317epsmtip2j;
	Mon, 15 Sep 2025 09:45:12 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH v2 2/3] clk: samsung: exynosautov920: add clock support
Date: Mon, 15 Sep 2025 15:24:00 +0530
Message-Id: <20250915095401.3699849-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915095401.3699849-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89@epcas5p3.samsung.com>

Add support for CMU_M2M which provides clocks to M2M block, and
register the required compatible and cmu_info for the same.

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 572b6ace14ac..75deec8bece5 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -27,6 +27,7 @@
 #define CLKS_NR_HSI0			(CLK_DOUT_HSI0_PCIE_APB + 1)
 #define CLKS_NR_HSI1			(CLK_MOUT_HSI1_USBDRD + 1)
 #define CLKS_NR_HSI2			(CLK_DOUT_HSI2_ETHERNET_PTP + 1)
+#define CLKS_NR_M2M                     (CLK_DOUT_M2M_NOCP + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -1821,6 +1822,47 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.clk_name               = "noc",
 };
 
+/* ---- CMU_M2M --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_M2M (0x1a800000) */
+#define PLL_CON0_MUX_CLKCMU_M2M_JPEG_USER       0x600
+#define PLL_CON0_MUX_CLKCMU_M2M_NOC_USER        0x610
+#define CLK_CON_DIV_DIV_CLK_M2M_NOCP            0x1800
+
+static const unsigned long m2m_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_M2M_JPEG_USER,
+	PLL_CON0_MUX_CLKCMU_M2M_NOC_USER,
+	CLK_CON_DIV_DIV_CLK_M2M_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_M2M */
+PNAME(mout_clkcmu_m2m_noc_user_p) = { "oscclk", "dout_clkcmu_m2m_noc" };
+PNAME(mout_clkcmu_m2m_jpeg_user_p) = { "oscclk", "dout_clkcmu_m2m_jpeg" };
+
+static const struct samsung_mux_clock m2m_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_M2M_JPEG_USER, "mout_clkcmu_m2m_jpeg_user",
+	    mout_clkcmu_m2m_jpeg_user_p, PLL_CON0_MUX_CLKCMU_M2M_JPEG_USER, 4, 1),
+	MUX(CLK_MOUT_M2M_NOC_USER, "mout_clkcmu_m2m_noc_user",
+	    mout_clkcmu_m2m_noc_user_p, PLL_CON0_MUX_CLKCMU_M2M_NOC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock m2m_div_clks[] __initconst = {
+	DIV(CLK_DOUT_M2M_NOCP, "dout_m2m_nocp",
+	    "mout_clkcmu_m2m_noc_user", CLK_CON_DIV_DIV_CLK_M2M_NOCP,
+	    0, 3),
+};
+
+static const struct samsung_cmu_info m2m_cmu_info __initconst = {
+	.mux_clks               = m2m_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(m2m_mux_clks),
+	.div_clks               = m2m_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(m2m_div_clks),
+	.nr_clk_ids             = CLKS_NR_M2M,
+	.clk_regs               = m2m_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(m2m_clk_regs),
+	.clk_name               = "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1851,6 +1893,9 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-cmu-hsi2",
 		.data = &hsi2_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-m2m",
+		.data = &m2m_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1

