Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155031DFDA1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804987; cv=none; b=IigIzM+yINkcOiDMwQlq6v94R1NV/Vkd8xI5ZJIZ+1H00gbYyqq7jamBG9fNZssJFqCSHieDtrLgDHEkV88tMVkRtmKxhF2gcGWOihBy6kzxxoyTRLSnp4Z+2bOfUq5iInxcYxL0H9U+3Wsv5V4qraBR//g66CwJf8420HwApD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804987; c=relaxed/simple;
	bh=YmGtQoqQI3kq2DuxZEt8AFn85u4+q4bNjS+0MG1o1nE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=GzSvbaKPpV94SFChgLlddsyQMMd1csHMCa25XJjnL1WxhPtxBRY87kEPn+uFwWuHtR8CGEnkZjF+xV8py5LY9gYc3Dt3mBOBvQJFLhiKPp8OlLnRICcr5+dM236LRSzSSk0qJFEfb8f59IrhD3UQYe9VydgzGDA3sIcw/oqztPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oc5Xl4BE; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oc5Xl4BE"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250925125622epoutp02034ed571d72dbd8cb61283706e0a666b~oh9ApuXsx2265922659epoutp02J
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 12:56:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250925125622epoutp02034ed571d72dbd8cb61283706e0a666b~oh9ApuXsx2265922659epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758804982;
	bh=Ox9g0fnE72mIrPn8iskqzncYvj7MD62mKUb3nI8lUdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oc5Xl4BEYNd44hIDI8osup4Vvtj/z8UGnefeUJwgHN2Ys4DyKqwCpBhUSLCMYh1gt
	 MN8a4Cs+1vT/QKxxMVQFNQZYTxGcRSuVeMeK8C6mNEfMOUMaBpDaF5J2jPMRkDg39x
	 jZcCpCS+GL7+fdMAfgAJ6EnJj9uZpDTn1SE/obuc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250925125622epcas5p24ce7e7efd4944becde2cd485ed9e9601~oh9AHPSNE0688406884epcas5p2t;
	Thu, 25 Sep 2025 12:56:22 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cXYcj0Td9z6B9m5; Thu, 25 Sep
	2025 12:56:21 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250925125620epcas5p359a6c18a13f2a2f895433e4dd241020e~oh8_pqdaR3191731917epcas5p3b;
	Thu, 25 Sep 2025 12:56:20 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250925125616epsmtip2a9d8b9526bb0079104f1bd1de99262c4~oh87OeJVg1425914259epsmtip2j;
	Thu, 25 Sep 2025 12:56:16 +0000 (GMT)
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
Subject: [PATCH 2/3] clk: samsung: exynosautov920: add block mfc clock
 support
Date: Thu, 25 Sep 2025 18:34:56 +0530
Message-Id: <20250925130457.3476803-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925130457.3476803-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925125620epcas5p359a6c18a13f2a2f895433e4dd241020e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925125620epcas5p359a6c18a13f2a2f895433e4dd241020e
References: <20250925130457.3476803-1-raghav.s@samsung.com>
	<CGME20250925125620epcas5p359a6c18a13f2a2f895433e4dd241020e@epcas5p3.samsung.com>

Add support for CMU_MFC which provides clocks to MFC block, and
register the required compatible and cmu_info for the same.

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 75deec8bece5..b90b73c3518f 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -28,6 +28,7 @@
 #define CLKS_NR_HSI1			(CLK_MOUT_HSI1_USBDRD + 1)
 #define CLKS_NR_HSI2			(CLK_DOUT_HSI2_ETHERNET_PTP + 1)
 #define CLKS_NR_M2M                     (CLK_DOUT_M2M_NOCP + 1)
+#define CLKS_NR_MFC                     (CLK_DOUT_MFC_NOCP + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -1863,6 +1864,47 @@ static const struct samsung_cmu_info m2m_cmu_info __initconst = {
 	.clk_name               = "noc",
 };
 
+/* ---- CMU_MFC --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MFC (0x19c00000) */
+#define PLL_CON0_MUX_CLKCMU_MFC_MFC_USER        0x600
+#define PLL_CON0_MUX_CLKCMU_MFC_WFD_USER        0x610
+#define CLK_CON_DIV_DIV_CLK_MFC_NOCP            0x1800
+
+static const unsigned long mfc_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_MFC_MFC_USER,
+	PLL_CON0_MUX_CLKCMU_MFC_WFD_USER,
+	CLK_CON_DIV_DIV_CLK_MFC_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_MFC */
+PNAME(mout_clkcmu_mfc_mfc_user_p) = { "oscclk", "dout_clkcmu_mfc_mfc" };
+PNAME(mout_clkcmu_mfc_wfd_user_p) = { "oscclk", "dout_clkcmu_mfc_wfd" };
+
+static const struct samsung_mux_clock mfc_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MFC_MFC_USER, "mout_clkcmu_mfc_mfc_user",
+	    mout_clkcmu_mfc_mfc_user_p, PLL_CON0_MUX_CLKCMU_MFC_MFC_USER, 4, 1),
+	MUX(CLK_MOUT_MFC_WFD_USER, "mout_clkcmu_mfc_wfd_user",
+	    mout_clkcmu_mfc_wfd_user_p, PLL_CON0_MUX_CLKCMU_MFC_WFD_USER, 4, 1),
+};
+
+static const struct samsung_div_clock mfc_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MFC_NOCP, "dout_mfc_nocp",
+	    "mout_clkcmu_mfc_mfc_user", CLK_CON_DIV_DIV_CLK_MFC_NOCP,
+	    0, 3),
+};
+
+static const struct samsung_cmu_info mfc_cmu_info __initconst = {
+	.mux_clks               = mfc_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(mfc_mux_clks),
+	.div_clks               = mfc_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(mfc_div_clks),
+	.nr_clk_ids             = CLKS_NR_MFC,
+	.clk_regs               = mfc_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(mfc_clk_regs),
+	.clk_name               = "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1896,6 +1938,9 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-cmu-m2m",
 		.data = &m2m_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-mfc",
+		.data = &mfc_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1

