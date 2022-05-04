Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB227C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345764AbiEDHyN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345751AbiEDHxv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:51 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435F0BD9
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:13 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220504075009epoutp038e400800f22d623d73be3cfdbdbf0b99~r13qA9Pxi1244212442epoutp03L
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220504075009epoutp038e400800f22d623d73be3cfdbdbf0b99~r13qA9Pxi1244212442epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650609;
        bh=T7CVS9r67GFR6/T7eHLQLhUpvYf8L09khe8ej5bUJlM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qF7nyzfLtsw/6V+B0AR9Y7RluAs+Gff+215K5YjEsOsTNyyado7bkAikQz+RugvCt
         IHx4/9aJZTIOd5b+sx6gLQwMcGbFTLAfFxu+XxcIud3zNaT8ZvUbbpa5KP3hb6MQdI
         VqtJKu3alL1lUgl50gY7d3v0UmhH/7VnBdUUXzSw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220504075009epcas2p4a531fa93cc002d30e4faf9d1acc0613b~r13pm2Gg51669516695epcas2p46;
        Wed,  4 May 2022 07:50:09 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KtTWd5vP0z4x9Q1; Wed,  4 May
        2022 07:50:05 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        77.1F.09764.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p45eda7f97897fde225da2dee2611c290f~r13k46_ct1669516695epcas2p4F;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075003epsmtrp1593cd55555f9aaa4c6d4676161c289b4~r13k32MSu3031930319epsmtrp1C;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-2e-6272302c8a1d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        13.3A.08853.B2032726; Wed,  4 May 2022 16:50:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epsmtip19e2aedb5086f67a0dfe9aa02fbcfb1e3~r13kpLZKn2390523905epsmtip1C;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
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
Subject: [PATCH v3 04/12] clk: samsung: exynosautov9: add cmu_core clock
 support
Date:   Wed,  4 May 2022 16:51:46 +0900
Message-Id: <20220504075154.58819-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmha6OQVGSQftFaYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhssff1VnaLjz33WC1mnN/HZHHxlKtF694j7BaH37SzWvy7tpHF4nkf
        UHzVrj+MDnwe72+0snvsnHWX3WPTqk42jzvX9rB59G1ZxejxeZNcAFtUtk1GamJKapFCal5y
        fkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0LFKCmWJOaVAoYDE4mIlfTub
        ovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM7ic72AumKVVM7F3B
        0sC4RbaLkZNDQsBE4urEiWxdjFwcQgI7GCWmt+9mgXA+MUpsWnyYEcL5xigxacdDVpiWlzva
        GEFsIYG9jBLXbvFBFH1klLi58hFYgk1AV2LL81dg3SICXcwSF/vugc1lFtjKKHH8xiwmkCph
        gSCJTfffsoHYLAKqEucurGQHsXkF7CRa724AauAAWicv8W9xKIjJKWAv8XiDBUSFoMTJmU9Y
        QGxmoIrmrbOZQcZLCCzkkFh3qx/qUheJNb8/s0DYwhKvjm9hh7ClJF72t0HZxRJLZ31igmhu
        YJS4vO0XG0TCWGLWs3ZGkMXMApoS63fpQ5yjLHHkFtRePomOw3/ZIcK8Eh1tQhCN6hIHtk+H
        2ior0T3nM9Q1HhLfOxczQ8JqEqPEzo9/mCcwKsxC8s4sJO/MQli8gJF5FaNYakFxbnpqsVGB
        ETyGk/NzNzGCE6+W2w7GKW8/6B1iZOJgPMQowcGsJMLrvLQgSYg3JbGyKrUoP76oNCe1+BCj
        KTCoJzJLiSbnA1N/Xkm8oYmlgYmZmaG5kamBuZI4r1fKhkQhgfTEktTs1NSC1CKYPiYOTqkG
        pu07f85pf1dqU2vg0fXDUDZ/ntK7+7WKuX0C8/faTeyZeGSp1rmq7a+0d/aYH3h/4EO/Y4b5
        zCUvTu78JpQ+6YBRsbug0ssai59fpbw/vXffXrb7sPyOBf+9L6598F3/p7uM2VT3DwuSPwX8
        lfolsbolR/nyfubLC77N43tVtNZdJy85ZsvVLMvzLEdnRuR6a1ht9/0x//N9xwcm/dYTzvhN
        893/S771z5Ttj5K7XLRLqjLCt8Rfb4l5rJBbubV4YWOH98Z6nkl5hqVXmx99nLmXe/o0pc7M
        tpj1Yur6z8sc3otwTxWev0lBNE8jUddr1VIRRele6cuJb1etFXyl/tZji7/EX4U19/YtmzrD
        1FiJpTgj0VCLuag4EQDtQvRORQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSnK62QVGSweyv5hYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        rozuJzvYC6YpVUzsXcHSwLhFtouRk0NCwETi5Y42xi5GLg4hgd2MEmv+TmKCSMhKPHu3gx3C
        Fpa433KEFaLoPaNE2/UWsASbgK7EluevwLpFBCYwS7y58oEdxGEW2MkocefVKTaQKmGBAImN
        H1Yzg9gsAqoS5y6sBOvmFbCTaL27gaWLkQNohbzEv8WhICangL3E4w0WIKYQUMXRSUUQxYIS
        J2c+YQGxmYGKm7fOZp7AKDALSWoWktQCRqZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5
        mxjBEaKluYNx+6oPeocYmTgYDzFKcDArifA6Ly1IEuJNSaysSi3Kjy8qzUktPsQozcGiJM57
        oetkvJBAemJJanZqakFqEUyWiYNTqoGp/aOO/fWDmhWV18OdmAyXG5skp/O0f0mdL/VTQujD
        zId+WgxXGE98inNgWfwg99OPc5uPOM/mL7tR333P57jhtN6kI8dm3firPf3mt3VfIv27Gs/l
        rlX5Y757W8yiHgbthjY7XYfHSkmLn+cdEcvednSGxp912mu3l09c33E/1fH51/e67CXOEx+L
        S/y1W3F1L+OiuggnE/28ukvlXRvLGJgi9YuVWg0NubqyP87du/+TwKcZb6yF9vFx5CwM5pso
        Nq07dX3swuifExonzTgstisgckJCmM/i/cUiFoc2XPqpZ5b0PfCbqVfYm8g5/bIy8pz/LR3v
        si9bdmSpRjTjxU0nkloY2WaWVMvX7ddSYinOSDTUYi4qTgQAq6A0Cf8CAAA=
X-CMS-MailID: 20220504075004epcas2p45eda7f97897fde225da2dee2611c290f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p45eda7f97897fde225da2dee2611c290f
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p45eda7f97897fde225da2dee2611c290f@epcas2p4.samsung.com>
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

