Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C53559F4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552377; cv=none; b=V5597nz1D456NaSd3LqJEpAhxyji73uPWLas8sX7+rb26opnyYB2uWhBAug9I1hgMOyV2SMlu/QgRb04ieZNfw1Rrh2UeBKYEE4GoVF93ioeSpuGKzXMD2zNmdFBbgc9KPPxLREfTuipKkyFfbLykLpPPu96H7vMn/49UgzABqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552377; c=relaxed/simple;
	bh=r5ao64s6u2fRi4LYmw+oBWl2ithC/FF3AL4VROH5vWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=M+GAUF8OeSCaS8gia3PUlGwG4Rj23MuqeXSeBhlhHVyZ9wI6HtFYngLezTjRXDWnC4zQ1vVT0K0lNNAstQ9XMyBAUiU03EMRPKf50UXgR7eRsVbXXz+AZueRdksb5FDHzrv4S0mFOnYi62up6CTt4flYLDZsYQaK6HEElINOSBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PK/OwtHy; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PK/OwtHy"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251119113933epoutp035291440eb57b490c26e8ffd94c5d2195~5ZYpBqedC1887818878epoutp03D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:39:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251119113933epoutp035291440eb57b490c26e8ffd94c5d2195~5ZYpBqedC1887818878epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763552373;
	bh=snTsm0Od8JHbqR2PGaULP4861ZNyCDyP366Aovostc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PK/OwtHy9/q/81qDT2qSndEDaBakW6rYJVgw0a1kDiq57mNoSxLELfPnWXzDCkcb1
	 675P/BvFHBLAGjxJjFI896a4aOpFqCzSA/zXu1ARingKZMvEZskgHWcTzV4SIfNVCS
	 nHTweVWt4126Yd/2+L+g6K2a92RNwNBWR7TTR7Yc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119113932epcas5p3bf1755ec6016889c2a0820b0224be48f~5ZYoFZB_d0624206242epcas5p3X;
	Wed, 19 Nov 2025 11:39:32 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dBKJg5mCvz6B9m5; Wed, 19 Nov
	2025 11:39:31 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56~5ZYmhppwQ2232422324epcas5p11;
	Wed, 19 Nov 2025 11:39:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113928epsmtip1f2e82d66959d34db9de131b6828cf15d~5ZYkEscR_0221802218epsmtip1r;
	Wed, 19 Nov 2025 11:39:28 +0000 (GMT)
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
Subject: [PATCH 2/3] clk: samsung: exynosautov920: add clock support
Date: Wed, 19 Nov 2025 17:17:43 +0530
Message-Id: <20251119114744.1914416-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119114744.1914416-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56
References: <20251119114744.1914416-1-raghav.s@samsung.com>
	<CGME20251119113930epcas5p1116fba63f1fa2905a67e2f5f3e016c56@epcas5p1.samsung.com>

Add support for CMU_MFD which provides clocks to MFD block, and
register the required compatible and cmu_info for the same.

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index b90b73c3518f..d0617c7fff3a 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -29,6 +29,7 @@
 #define CLKS_NR_HSI2			(CLK_DOUT_HSI2_ETHERNET_PTP + 1)
 #define CLKS_NR_M2M                     (CLK_DOUT_M2M_NOCP + 1)
 #define CLKS_NR_MFC                     (CLK_DOUT_MFC_NOCP + 1)
+#define CLKS_NR_MFD                     (CLK_DOUT_MFD_NOCP + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -1905,6 +1906,42 @@ static const struct samsung_cmu_info mfc_cmu_info __initconst = {
 	.clk_name               = "noc",
 };
 
+/* ---- CMU_MFD --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_MFD (0x19e00000) */
+#define PLL_CON0_MUX_CLKCMU_MFD_NOC_USER        0x600
+#define CLK_CON_DIV_DIV_CLK_MFD_NOCP            0x1800
+
+static const unsigned long mfd_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_MFD_NOC_USER,
+	CLK_CON_DIV_DIV_CLK_MFD_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_MFD */
+PNAME(mout_clkcmu_mfd_noc_user_p) = { "oscclk", "dout_clkcmu_mfd_noc" };
+
+static const struct samsung_mux_clock mfd_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MFD_NOC_USER, "mout_clkcmu_mfd_noc_user",
+	    mout_clkcmu_mfd_noc_user_p, PLL_CON0_MUX_CLKCMU_MFD_NOC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock mfd_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MFD_NOCP, "dout_mfd_nocp",
+	    "mout_clkcmu_mfd_noc_user", CLK_CON_DIV_DIV_CLK_MFD_NOCP,
+	    0, 3),
+};
+
+static const struct samsung_cmu_info mfd_cmu_info __initconst = {
+	.mux_clks               = mfd_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(mfd_mux_clks),
+	.div_clks               = mfd_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(mfd_div_clks),
+	.nr_clk_ids             = CLKS_NR_MFD,
+	.clk_regs               = mfd_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(mfd_clk_regs),
+	.clk_name               = "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1941,6 +1978,9 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-cmu-mfc",
 		.data = &mfc_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-mfd",
+		.data = &mfd_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1

