Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567269;
	b=g1961GVztcouBq5Ij/aR8mvkStqWknQVQiPD7FPfCaFIC7bdaTDk2/Zm/6fFXKv20LDT
	 mrAAmPlkHUJMUeEfNIpH1//is/vMsFNg/tL+0PdlgvV/LBiLAIUWGXhyxXYv0sRSGMTZV
	 6nHp6bxTBngyShKq5kSWWzjjucvYqoMC9LoP02ZaTYkp9wdSxoUHpww8KIsj4a5FDsIDH
	 shR0qgbFJHn3Mkp3rtTZ/YBnJFFw0YmEGaBj3dYHqmG5QMgGAdd5FvuccRWKYq3jVwXt5
	 Gm2UEeue8kzC3bI89epZts7jCu8n/RJXg0oh1zM5kZoXUCveUEr6XzQ+AIsZHPLEb3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567269;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=tKq036ZM4sNp3YqJ4P61pnVIM/olH0cj6QOVO2iDOJo=;
	b=jQjhn/Dw9zV5nXpxpbrD3vqF8dy9O4rgNitp5/Oyg5xt9MfFqtJSpdQxQz+yisunxRv9
	 aqzGcub4ks3Mm+AJVp4O5uKWKQZklvUvOYTQjphiALzdFK89w0l+rSioBFR9xz1HxIKI8
	 mPqUiQFg/8FG30syZPQi5nUcBZqZ7rCr5S2npQgGSu+6H9l5/7wJNqszbdwuHhdhXDS4X
	 iewMS6fD31spC3d4LOs8oKIRrelCuCq4my4ZdbOra+9wD0PMg5lvvOCDOCZU5ByMhLvNN
	 sAP/v8iyitcRMgJnSN4f+NWnmn3RXlmuinmALuD7Z7GWnuwlcAKpCqpjXTwQ3GVs3Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="lDuW68x/";
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D80606A335
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D80606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=lDuW68x/
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261113105427epoutp017f9c859ec19ae384f4df522c3dc61cb3~nlWveCDkk0722007220epoutp01K
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261113105427epoutp017f9c859ec19ae384f4df522c3dc61cb3~nlWveCDkk0722007220epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567267;
	bh=tKq036ZM4sNp3YqJ4P61pnVIM/olH0cj6QOVO2iDOJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDuW68x/JPI8IMYhr4gZgoxlVUqTU3lI0ZUIxRu6UlsJjjDTPqYGT7IcIxhPREnCs
	 /J8TFVavrn36BAQN/jePXOxv/Q1csMiMnQGQVDLwnE8GN1yaoG5vT9jelci/nBPPrF
	 NviQXkpXbOCZbapkjdzVmD9pn3ljvy1AHB4fAK0g=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261113105423epcas5p11c5de50d9cdb5ec9d48103260e9b8e7a~nlWsZwCMr0492704927epcas5p1I;
	Fri, 13 Nov 2026 10:54:23 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvJt4mylz3hhT4; Fri, 13 Nov
	2026 10:54:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca~nlR9RECkE1464514645epcas5p4v;
	Fri, 13 Nov 2026 10:48:58 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104855epsmtip2bc2e23b8a4aa3305c7f3dad364b60d71~nlR618mo_2220522205epsmtip25;
	Fri, 13 Nov 2026 10:48:55 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 10/14 RESEND] clk: samsung: exynos8855: add block usb
 clock support
Date: Fri, 13 Nov 2026 16:36:08 +0530
Message-Id: <20261113110612.3265841-11-raghav.s@samsung.com>
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
X-CMS-MailID: 20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca@epcas5p4.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_USB, this provides clocks for USB

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 77 ++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 0be1cefadb51..87c616c8487e 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -20,11 +20,13 @@
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 #define CLKS_NR_HSI                     (CLK_GOUT_UFS_EMBD_UNIPRO_HSI  + 1)
+#define CLKS_NR_USB                     (CLK_GOUT_SYSREG_USB + 1)
 
 #define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
 #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
+#define EXYNOS8855_USB_GATE_DBG_OFFSET      0x2004
 
 #define EXYNOS8855_DRCG_EN_OFFSET       0x104
 #define EXYNOS8855_MEMCLK_OFFSET        0x108
@@ -1257,6 +1259,78 @@ static const struct samsung_cmu_info hsi_cmu_info __initconst = {
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
@@ -1281,6 +1355,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
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

