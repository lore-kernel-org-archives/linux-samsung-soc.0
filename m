Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA24AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbiECLBh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbiECLB3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:29 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92D81DA50
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:49 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220503105734epoutp02cdbbe1b634dd02ef48e50f0abfa757bd~rkyAe3FUO1140711407epoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220503105734epoutp02cdbbe1b634dd02ef48e50f0abfa757bd~rkyAe3FUO1140711407epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575454;
        bh=P+q+yelvYRTKGTijeseNuv7U4mLYX4TDEHihhBDo3jo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QnyrKQZahf8GiziHOHb5n0ZC9ZW5H0CkPuNkY/l/N5GxFfv763w21cqx0M2yRHwKy
         mzhsI7q73QJpTpyBDwAk+pdsk8Zkp7NoYljOvVbJ9kzIYIFTNhWmPV8J2iuI3apgbL
         WxUl2AZQuBWnyKFwnl+vN/sw0DPwqjONRdvt5Mas=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220503105733epcas2p14f31b8f48de4a28b3f6583aeadeadab1~rkx-nUWps1158911589epcas2p1N;
        Tue,  3 May 2022 10:57:33 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsxkM2XLRz4x9Q1; Tue,  3 May
        2022 10:57:31 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        79.DA.09764.A9A01726; Tue,  3 May 2022 19:57:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p2ae4f7212d1adc6c329edcc0a4c0c28f4~rkx7_KeAo1964019640epcas2p29;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp2757ba510ca85169cf2bc528c6d3623f3~rkx79UR5S1021210212epsmtrp2R;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-32-62710a9a8fd6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        69.A3.08924.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip28a1c879b7cee9573ee65e51e240bfef8~rkx7xMQSL0549905499epsmtip2V;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
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
Subject: [PATCH v2 06/12] clk: samsung: exynosautov9: add cmu_busmc clock
 support
Date:   Tue,  3 May 2022 19:59:08 +0900
Message-Id: <20220503105914.117625-7-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmhe4srsIkgxdrNS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzDh1fz1wwRbqi9d4B
        pgbGDeJdjJwcEgImEg0T29m7GLk4hAR2MEpsX/afCcL5xCix6OJXRgjnM6PEiv8nGWFa1h/f
        DVW1i1Fi/cZ7zBDOR0aJQyt6WUGq2AR0JbY8fwXWLiLQxSxxse8eC4jDLLCVUeL4jVlMIFXC
        AsESK46eYAaxWQRUJdZ9usPWxcjBwStgLzHpVRqIKSEgL/FvcShIBaeAg8T1XefAOnkFBCVO
        znzCAmIzA5U0b50NdoSEwEoOiRXHDzNBnOoicfDWW6izhSVeHd/CDmFLSXx+t5cNwi6WWDrr
        ExNEcwOjxOVtv6ASxhKznrUzghzBLKApsX6XPsQ9yhJHbkHt5ZPoOPyXHSLMK9HRJgTRqC5x
        YPt0FghbVqJ7zmdWCNtDomXfUTBbSGAyo8SZBx4TGBVmIflmFpJvZiHsXcDIvIpRLLWgODc9
        tdiowAgew8n5uZsYwYlXy20H45S3H/QOMTJxMB5ilOBgVhLhdV5akCTEm5JYWZValB9fVJqT
        WnyI0RQY0hOZpUST84GpP68k3tDE0sDEzMzQ3MjUwFxJnNcrZUOikEB6YklqdmpqQWoRTB8T
        B6dUA1PnasOqB5Fx2nPWPZ7/dNEvffcim03H5sdu0Vu5OqH5zf2wQ+vSo5Z9ENzrv/0rc02M
        blwq99rkEmd7dqYX0zbcu73IcWW+wFb1r8+S1l3eset5m8+TUO/9FwO/Nj+K+dgemjtr9c3Y
        xCvfVtydVGw5qZL93+qq7TZCE1b8z+rxlheoYsm0e+eYs2nL6QXtpTYzZBdKTFke4DHzisyL
        85s43KLPdXHPnqJp8E2K/7b/sdL/mzyzzzWxC2zbVfb7qJ348/hZs7v2vldVCNG88HfL9Ylq
        ZwUn7H6udeKzRlC4W2P0KVHPAin7n9fPTTqrei5u85rrG2o75RalGAl2Lbuw937SDi3GXRdS
        2cIXKCudUmIpzkg01GIuKk4EANdEEp5FBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg/kvlSwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBmHjq9nLpgiXdF67wBTA+MG8S5GTg4JAROJ9cd3M3UxcnEICexglHi+bB8LREJW4tm7HewQ
        trDE/ZYjrBBF7xklFr1ZzASSYBPQldjy/BUjSEJEYAKzxJsrH9hBHGaBnYwSd16dYgOpEhYI
        lNh3qYMVxGYRUJVY9+kOUJyDg1fAXmLSqzQQU0JAXuLf4lCQCk4BB4nru86BzRcCqtj5dzsz
        iM0rIChxcuYTsOOYgcqbt85mnsAoMAtJahaS1AJGplWMkqkFxbnpucWGBUZ5qeV6xYm5xaV5
        6XrJ+bmbGMExoqW1g3HPqg96hxiZOBgPMUpwMCuJ8DovLUgS4k1JrKxKLcqPLyrNSS0+xCjN
        waIkznuh62S8kEB6YklqdmpqQWoRTJaJg1OqgUnjyKczN95aNy/fF+o2YwHzU295ncTw6es6
        1u18I5Ee2XbtzbGOU3e9dNU82FiPP7Z7z7/7UtWehNlRjeLWc810X57KfXzW//SJT8svvFC1
        vudR/k05bKVE2cqU+fPO/Qwtle9M7JG0utwQL5zvtdbvTOM82VMtV0W9pZm3bL2o84L38qYV
        hfL1831CM6OrD4ukaEw6l5lt12opr+gm/4WbJcbtkFEEh6uA0IyFtu8avWaun6CelSue7njq
        88XPi02c+46szInSfpb+VeLK3ck9HzVXLRV341PsWPcm5MU/tif7ePMqi7tkTvEv+eS0M6pq
        3ae1ZTOMC1bzBje3TclgfWW5bJf95TkRrb/X1ymxFGckGmoxFxUnAgA+Xu25AAMAAA==
X-CMS-MailID: 20220503105729epcas2p2ae4f7212d1adc6c329edcc0a4c0c28f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p2ae4f7212d1adc6c329edcc0a4c0c28f4
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p2ae4f7212d1adc6c329edcc0a4c0c28f4@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_BUSMC is responsible to control clocks of BLK_BUSMC which represents
Data/Peri buses. Most clocks except PDMA/SPDMA are not necessary to
be controlled by HLOS. So, this adds PDMA/SPDMA gate clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index b3ea586c0d21..aaa78b921fde 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -957,6 +957,58 @@ static void __init exynosautov9_cmu_top_init(struct device_node *np)
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
@@ -1075,6 +1127,9 @@ static int __init exynosautov9_cmu_probe(struct platform_device *pdev)
 
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

