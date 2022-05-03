Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450ACC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbiECLBs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbiECLBU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:20 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B895BBE2D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:37 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220503105732epoutp03bae6c14f9f352d53f5d3f27a7e69e6bd~rkx_M6E7C0493804938epoutp03S
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220503105732epoutp03bae6c14f9f352d53f5d3f27a7e69e6bd~rkx_M6E7C0493804938epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575452;
        bh=T7CVS9r67GFR6/T7eHLQLhUpvYf8L09khe8ej5bUJlM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vQRZl5eE1PkNa2G9xWN8fb2w6OQou/uwZkYiqX9co3KeeUufrFRqQLe3TyuAq5aAZ
         22hBvtBaCnHOVdBtbc0JHqmo2tjalh2olQMXGwxQGiaO8/yU689jETtHVSSIBU5fQ/
         dk/fMLecPHOJqv+OoP08jT2bm/5qHHJvVUapH2jY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220503105731epcas2p4a70635da03774ccf4a525f65c9f1af91~rkx9tHSB51759317593epcas2p4U;
        Tue,  3 May 2022 10:57:31 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.68]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KsxkL19RZz4x9Pv; Tue,  3 May
        2022 10:57:30 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        68.DA.09764.A9A01726; Tue,  3 May 2022 19:57:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p10749080bcb9da2348edb8fd639d18640~rkx73PNv_1880618806epcas2p1T;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp18e6b37577f8533547bdc6e17142695e2~rkx70cCgt0279502795epsmtrp1e;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-30-62710a9ab46d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        68.A3.08924.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip2c83b418e837c86d3f0a91d12abf63096~rkx7pMbsE1109211092epsmtip2D;
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
Subject: [PATCH v2 04/12] clk: samsung: exynosautov9: add cmu_core clock
 support
Date:   Tue,  3 May 2022 19:59:06 +0900
Message-Id: <20220503105914.117625-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmqe4srsIkg45nbBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZ3U92sBdMU6qY2LuC
        pYFxi2wXIyeHhICJxLcjR9m7GLk4hAR2MEqc/XmFFcL5xCix8eVSFgjnM6PE0oUgZRAtnR9f
        MYLYQgK7GCWOr62FKPrIKNHSfREswSagK7HlOUgRF4eIQBezxMW+e2CjmAW2AnXcmMUEUiUs
        ECSxdVYbM4jNIqAqMevJbTCbV8BeYuG3i0A2B9A6eYl/i0NBwpwCDhLXd51jgigRlDg58wkL
        iM0MVNK8dTYzyHwJgbkcEh0XJ7JBnOoicfToC6izhSVeHd8CZUtJvOxvg7KLJZbO+sQE0dzA
        KHF52y+oZmOJWc/aGUGOYBbQlFi/Sx/iHmWJI7eg9vJJdBz+yw4R5pXoaBOCaFSXOLB9OguE
        LSvRPeczK0SJh8SzV7GQsJrMKPH6yU7mCYwKs5B8MwvJN7MQ9i5gZF7FKJZaUJybnlpsVGAE
        j+Hk/NxNjODEq+W2g3HK2w96hxiZOBgPMUpwMCuJ8DovLUgS4k1JrKxKLcqPLyrNSS0+xGgK
        DOqJzFKiyfnA1J9XEm9oYmlgYmZmaG5kamCuJM7rlbIhUUggPbEkNTs1tSC1CKaPiYNTqoFJ
        jUNI5sPfApkLrObr7J7+My1oVNd9dmh94b9FqmpzPbZZvzkqo8W3LKHU5oh0xI39r2eYqGod
        Y4to59dmPmfJGnKldNJOP6XGpodL7jFMMl0wZbG9rI5B6rpqheur107Kelw68cJJBb+4RwXT
        XX42bBcw/vwibfsbB6elR55sczVjS1ZVVsswefPD4yL3iZ1+L+TXs5RsXv4/2G+f0fzyJ8rH
        swscV6U7zZ/VZPbgWlzA/xOVGXsWr2hNl7s093pJS+eUWgeNr6IVomuKj183TlJ+E7xWPLpr
        mpjzhE2PNm7wnJripme8b0pe/MfX03KftWowmBaVrJ6Zt21VwOVpKpZMHeymz3vnc8vs/WCk
        xFKckWioxVxUnAgAt1uIP0UEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg9vnpS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBndT3awF0xTqpjYu4KlgXGLbBcjJ4eEgIlE58dXjF2MXBxCAjsYJW6ePswOkZCVePZuB5Qt
        LHG/5QgrRNF7RomdjzrZQBJsAroSW55DdIsITGCWeHPlAzuIwyywk1HizqtTYFXCAgESa77f
        YgaxWQRUJWY9uQ1m8wrYSyz8dhHI5gBaIS/xb3EoSJhTwEHi+q5zTCC2EFDJzr/bocoFJU7O
        fMICYjMDlTdvnc08gVFgFpLULCSpBYxMqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcx
        gqNES2sH455VH/QOMTJxMB5ilOBgVhLhdV5akCTEm5JYWZValB9fVJqTWnyIUZqDRUmc90LX
        yXghgfTEktTs1NSC1CKYLBMHp1QDU54eU2DOxiVLj8pPzjmzSJvpisSV1dsKai8ryH5Vs99R
        vTqrfbfehbvbfgRW9+YtXxk4UysgS+vHlJMVqyTYu4+pxJpOCLrOezPreuCDcCuzIz7bV/bW
        vo3+yDxLtiXA13mhpOnHUvtmC/EZR9Uvpd6+Uj+hN33qZKvFZsfOzn/6JTG+8uK7ncsPZv8p
        rkkMeRkwdfPU82/PHGDoevBi2/FpO2N1TLJlpt5LC35dzpKuqrD22vSeixLrFNZIH1ihx7jF
        /upfr0k5l81sXP65LTQTWn7AsDmwaqZTjGRhwUq3DTInPwmUeak532UXrOa9qRd65ritNLP6
        POeJKseZf936J3vr744eZYHgtUUSfUosxRmJhlrMRcWJACaJYewBAwAA
X-CMS-MailID: 20220503105729epcas2p10749080bcb9da2348edb8fd639d18640
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p10749080bcb9da2348edb8fd639d18640
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p10749080bcb9da2348edb8fd639d18640@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add CMU_CORE clock which represents Core BUS clocks. The source clocks
of this CMU block are oscclk or dout_clkcmu_core_bus. Thus, two source
clocks should be provided via device tree. All the gate clocks are
defined as CLK_IS_CRITICAL because they control(gate/ungate) core bus
clocks but not been assigned to any drivers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 92 ++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 96c6c9dbc995..984ecba83e42 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -956,3 +956,95 @@ static void __init exynosautov9_cmu_top_init(struct device_node *np)
 /* Register CMU_TOP early, as it's a dependency for other early domains */
 CLK_OF_DECLARE(exynosautov9_cmu_top, "samsung,exynosautov9-cmu-top",
 	       exynosautov9_cmu_top_init);
+
+/* ---- CMU_CORE ----------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_CORE (0x1b030000) */
+#define PLL_CON0_MUX_CLKCMU_CORE_BUS_USER				0x0600
+#define CLK_CON_MUX_MUX_CORE_CMUREF					0x1000
+#define CLK_CON_DIV_DIV_CLK_CORE_BUSP					0x1800
+#define CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_CLK			0x2000
+#define CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_PCLK			0x2004
+#define CLK_CON_GAT_CLK_BLK_CORE_UID_CORE_CMU_CORE_IPCLKPORT_PCLK	0x2008
+
+static const unsigned long core_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_CORE_BUS_USER,
+	CLK_CON_MUX_MUX_CORE_CMUREF,
+	CLK_CON_DIV_DIV_CLK_CORE_BUSP,
+	CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_CLK,
+	CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_CORE_UID_CORE_CMU_CORE_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_CORE */
+PNAME(mout_core_bus_user_p) = { "oscclk", "dout_clkcmu_core_bus" };
+
+static const struct samsung_mux_clock core_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_CORE_BUS_USER, "mout_core_bus_user", mout_core_bus_user_p,
+	    PLL_CON0_MUX_CLKCMU_CORE_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock core_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CORE_BUSP, "dout_core_busp", "mout_core_bus_user",
+	    CLK_CON_DIV_DIV_CLK_CORE_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock core_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_CORE_CCI_CLK, "gout_core_cci_clk", "mout_core_bus_user",
+	     CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_CLK, 21,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CORE_CCI_PCLK, "gout_core_cci_pclk", "dout_core_busp",
+	     CLK_CON_GAT_CLK_BLK_CORE_UID_CCI_IPCLKPORT_PCLK, 21,
+	     CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_CORE_CMU_CORE_PCLK, "gout_core_cmu_core_pclk",
+	     "dout_core_busp",
+	     CLK_CON_GAT_CLK_BLK_CORE_UID_CORE_CMU_CORE_IPCLKPORT_PCLK, 21,
+	     CLK_IS_CRITICAL, 0),
+};
+
+static const struct samsung_cmu_info core_cmu_info __initconst = {
+	.mux_clks		= core_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(core_mux_clks),
+	.div_clks		= core_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(core_div_clks),
+	.gate_clks		= core_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(core_gate_clks),
+	.nr_clk_ids		= CORE_NR_CLK,
+	.clk_regs		= core_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(core_clk_regs),
+	.clk_name		= "dout_clkcmu_core_bus",
+};
+
+static int __init exynosautov9_cmu_probe(struct platform_device *pdev)
+{
+	const struct samsung_cmu_info *info;
+	struct device *dev = &pdev->dev;
+
+	info = of_device_get_match_data(dev);
+	exynos_arm64_register_cmu(dev, dev->of_node, info);
+
+	return 0;
+}
+
+static const struct of_device_id exynosautov9_cmu_of_match[] = {
+	{
+		.compatible = "samsung,exynosautov9-cmu-core",
+		.data = &core_cmu_info,
+	}, {
+	},
+};
+
+static struct platform_driver exynosautov9_cmu_driver __refdata = {
+	.driver = {
+		.name = "exynosautov9-cmu",
+		.of_match_table = exynosautov9_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = exynosautov9_cmu_probe,
+};
+
+static int __init exynosautov9_cmu_init(void)
+{
+	return platform_driver_register(&exynosautov9_cmu_driver);
+}
+core_initcall(exynosautov9_cmu_init);
-- 
2.36.0

