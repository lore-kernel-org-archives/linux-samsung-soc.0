Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7947DC43219
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383990AbiEBJEv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384020AbiEBJEp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:45 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B846F2C109
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:14 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220502090107epoutp0447d22c151d3ce45ebd7aeefbdcd6af33~rPjDKAeVd0502605026epoutp04p
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220502090107epoutp0447d22c151d3ce45ebd7aeefbdcd6af33~rPjDKAeVd0502605026epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482067;
        bh=X7FZalOKqmRFzkr83vIqav3Q2MJn+A79w2YK6rhbj3o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jyL7iJLrxZtFVgrjfFF1SqgAJxHx/CrOiiJjR9v7vxGUASmuw9ovVDZ27CEQ6ybFU
         sHqXIk0+go43gpTDoBpQNxooWe1rIBOAT3euL9NdVI+75CmZiCuAZmXLHA0s+aO1sJ
         3SpLim8+P6GcYyvAMUVp57lQIPcriTDHNzjH6C0I=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220502090107epcas2p16988ac761a9b9b4d8f898d66f2bc6bc7~rPjCunGcV2148221482epcas2p1N;
        Mon,  2 May 2022 09:01:07 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.70]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsHBP5GFNz4x9QG; Mon,  2 May
        2022 09:01:01 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        EA.7D.10069.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epcas2p35615025b6f6295af9323d0514015d5af~rPi88lPEx2741227412epcas2p3o;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp1062ff15d1ace0fcb7edac82d1aa7ae4c~rPi863iNk2529725297epsmtrp1c;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a45-a8fff70000002755-6f-626f9dcdeddc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        22.FB.08924.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip297ee962cc4a7fcee25e3c7062c7200b2~rPi8v6F_y1979619796epsmtip2Z;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 06/12] clk: samsung: exynosautov9: add cmu_busmc clock
 support
Date:   Mon,  2 May 2022 18:02:24 +0900
Message-Id: <20220502090230.12853-7-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmqe7ZuflJBp9uSVg8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnLN22kbngolTF5acn
        mBoYP4l1MXJySAiYSBzqecPUxcjFISSwg1Gi4d42NgjnE6PEi92PoTKfGSWmz9/AAtOyZcEb
        VojELkaJDyePsEA4H4H6V54Eq2IT0JXY8vwVI0hCRKCLWeJi3z2wKmaBrYwSx2/MYgKpEhYI
        kPi5fgWYzSKgKjH1Yi+YzStgJ/H6STtzFyMH0D55iX+LQ0HCnAL2Eme2PmeEKBGUODnzCdgy
        ZqCS5q2zmUHmSwgs5ZD4v+EiK8StLhKt/z4wQtjCEq+Ob2GHsKUkXva3QdnFEktnfWKCaG5g
        lLi87RcbRMJYYtazdkaQI5gFNCXW79KHuEdZ4sgtqL18Eh2H/7JDhHklOtqEIBrVJQ5snw4N
        LVmJ7jmfoa7xkLi+9As0SCcxSqy7cZltAqPCLCTvzELyziyExQsYmVcxiqUWFOempxYbFRjC
        4zg5P3cTIzj5arnuYJz89oPeIUYmDsZDjBIczEoivG0bcpKEeFMSK6tSi/Lji0pzUosPMZoC
        w3ois5Rocj4w/eeVxBuaWBqYmJkZmhuZGpgrifN6pWxIFBJITyxJzU5NLUgtgulj4uCUamCq
        VV5/Iynl/brs4o3f6q6zL814JCl1XSVvVuKFwNs6Tw9dbt8+77SG7BKlzRqy84V/uUjP2P30
        3kkJv1X96evYV3S7/uffK8xoXxKh1X3nGJ/S8aL/ewN536vcbKlKtrOafyyz4PaXwtQ1ih5N
        Ygovp79OYMl1yTtceKxX+lvfqW9TDFzeT+T8cWUjy719omczMoRu7VnemPavc/mx5VPCp5rW
        GJcf+b3tpJjTwt6i2n/Xlr8O7xeeG7SOv896QkVkbWQuy8qmm4/eZc5sKvtUZf+jd7G3o2ZT
        llmT/XE7lwsWIrrFJxaXPJz/OTp+1oNVa1vez5j4Z0PX1E9xjMfXWrF/ldVXOX/naWOByZ4g
        JZbijERDLeai4kQAAiYVgEcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBqeOm1g8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDKWbtvIXHBRquLy0xNMDYyfxLoYOTkkBEwktix4w9rFyMUhJLCDUeL0vJWsEAlZiWfvdrBD
        2MIS91uOgMWFBN4zSjS91Aax2QR0JbY8f8UI0iwiMIFZ4s2VD+wgDrPATkaJO69OsYFUCQv4
        SZztnsUIYrMIqEpMvdjLBGLzCthJvH7SztzFyAG0QV7i3+JQkDCngL3Ema3PGSGW2Un8OHGf
        GaJcUOLkzCcsIDYzUHnz1tnMExgFZiFJzUKSWsDItIpRMrWgODc9t9iwwCgvtVyvODG3uDQv
        XS85P3cTIzhGtLR2MO5Z9UHvECMTB+MhRgkOZiUR3rYNOUlCvCmJlVWpRfnxRaU5qcWHGKU5
        WJTEeS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MCVm6Hl9VZhqUvMvf1vWjnPlTmrB85t7Z7Hk
        bfG99/7JShkjBiON9KDXvLYfHjQbz7iwiIG3L2DZkkLZG6f4+6dcYaq9UPqUyZf5+qc9hYe3
        lKz9dPCwWXZmx+p5ImmTWKVSJqiGLko6eYt7jcDvLoHrZ/3ZVA5yp+YKP1jK4ZBfllLMn+bo
        Xqu3UEnXq2Pp9f+S0wrPfz20K2SW7RennO2TOpoZ53snbjmxeItLy8zW4lkZ85d1sB/L/64+
        +ZeMtbTcny67jmNP1E7qfHs+jT235onl/3Ypbsb1acHK03Rj4memJu8o3P162+W5X019PUzf
        ccqe7vv0Tb4yXSOpzL8vTDL37zr7j45PGQ4oKrEUZyQaajEXFScCAEs5mvEAAwAA
X-CMS-MailID: 20220502090100epcas2p35615025b6f6295af9323d0514015d5af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p35615025b6f6295af9323d0514015d5af
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p35615025b6f6295af9323d0514015d5af@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_BUSMC is responsible to control clocks of BLK_BUSMC which represents
Data/Peri buses. Most clocks except PDMA/SPDMA are not necessary to
be controlled by HLOS. So, this adds PDMA/SPDMA gate clocks.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 78b7366702a6..65d769875297 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -960,6 +960,58 @@ static void __init exynosautov9_cmu_top_init(struct device_node *np)
 CLK_OF_DECLARE(exynosautov9_cmu_top, "samsung,exynosautov9-cmu-top",
 	       exynosautov9_cmu_top_init);
 
+/* ---- CMU_BUSMC ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_BUSMC (0x1b200000) */
+#define PLL_CON0_MUX_CLKCMU_BUSMC_BUS_USER				0x0600
+#define CLK_CON_DIV_DIV_CLK_BUSMC_BUSP					0x1800
+#define CLK_CON_GAT_GOUT_BLK_BUSMC_UID_QE_PDMA0_IPCLKPORT_PCLK		0x2078
+#define CLK_CON_GAT_GOUT_BLK_BUSMC_UID_QE_SPDMA_IPCLKPORT_PCLK		0x2080
+
+static const unsigned long busmc_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_BUSMC_BUS_USER,
+	CLK_CON_DIV_DIV_CLK_BUSMC_BUSP,
+	CLK_CON_GAT_GOUT_BLK_BUSMC_UID_QE_PDMA0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_BUSMC_UID_QE_SPDMA_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_BUSMC */
+PNAME(mout_busmc_bus_user_p) = { "oscclk", "dout_clkcmu_busmc_bus" };
+
+static const struct samsung_mux_clock busmc_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_BUSMC_BUS_USER, "mout_busmc_bus_user",
+	    mout_busmc_bus_user_p, PLL_CON0_MUX_CLKCMU_BUSMC_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock busmc_div_clks[] __initconst = {
+	DIV(CLK_DOUT_BUSMC_BUSP, "dout_busmc_busp", "mout_busmc_bus_user",
+	    CLK_CON_DIV_DIV_CLK_BUSMC_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock busmc_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_BUSMC_PDMA0_PCLK, "gout_busmc_pdma0_pclk",
+	     "dout_busmc_busp",
+	     CLK_CON_GAT_GOUT_BLK_BUSMC_UID_QE_PDMA0_IPCLKPORT_PCLK, 21,
+	     0, 0),
+	GATE(CLK_GOUT_BUSMC_SPDMA_PCLK, "gout_busmc_spdma_pclk",
+	     "dout_busmc_busp",
+	     CLK_CON_GAT_GOUT_BLK_BUSMC_UID_QE_SPDMA_IPCLKPORT_PCLK, 21,
+	     0, 0),
+};
+
+static const struct samsung_cmu_info busmc_cmu_info __initconst = {
+	.mux_clks		= busmc_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(busmc_mux_clks),
+	.div_clks		= busmc_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(busmc_div_clks),
+	.gate_clks		= busmc_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(busmc_gate_clks),
+	.nr_clk_ids		= BUSMC_NR_CLK,
+	.clk_regs		= busmc_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(busmc_clk_regs),
+	.clk_name		= "dout_clkcmu_busmc_bus",
+};
+
 /* ---- CMU_CORE ----------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_CORE (0x1b030000) */
@@ -1078,6 +1130,9 @@ static int __init exynosautov9_cmu_probe(struct platform_device *pdev)
 
 static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	{
+		.compatible = "samsung,exynosautov9-cmu-busmc",
+		.data = &busmc_cmu_info,
+	}, {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
 	}, {
-- 
2.36.0

