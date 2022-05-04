Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12536C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345825AbiEDHyR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345777AbiEDHxw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:52 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FA8249
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:14 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220504075008epoutp045a135bf2de16c394ed77ab07469012ea~r13ovTfeo1925419254epoutp04V
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220504075008epoutp045a135bf2de16c394ed77ab07469012ea~r13ovTfeo1925419254epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650608;
        bh=P+q+yelvYRTKGTijeseNuv7U4mLYX4TDEHihhBDo3jo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sXMR/l/5rGlUvG+Vh71PiJzlDwywSD1R9qa9FK9vSB5jvvl++mQ2amuiorMmpsowM
         NrEP40T3XYRukRvNiWqViBj+4HOc7mfjdwJuYaLXHtTiEU48o5pNekrnyASDy715dg
         sxEpvVLrKg0XRmtm+1YcEh1IW+71iukBFBPWyzIU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220504075007epcas2p2119cbfbdf0d0a653da3906034e029b2a~r13oF2Ona2949029490epcas2p28;
        Wed,  4 May 2022 07:50:07 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KtTWd0XZ6z4x9QJ; Wed,  4 May
        2022 07:50:05 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        68.E4.10069.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p3f08dab53b53f4dfb05e53dd4b7a8d242~r13lGGsxF2951229512epcas2p3q;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp1e9eaa81c58ef58109283bfbcc4d05014~r13lD_SM33031930319epsmtrp1E;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a45-a8fff70000002755-50-6272302ccbe1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7A.EB.08924.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epsmtip164f500835c94fbf637a08fc62a787fb7~r13k25Db22116721167epsmtip1V;
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
Subject: [PATCH v3 06/12] clk: samsung: exynosautov9: add cmu_busmc clock
 support
Date:   Wed,  4 May 2022 16:51:48 +0900
Message-Id: <20220504075154.58819-7-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmma6OQVGSQesUFYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhssff1VnaLjz33WC1mnN/HZHHxlKtF694j7BaH37SzWvy7tpHF4nkf
        UHzVrj+MDnwe72+0snvsnHWX3WPTqk42jzvX9rB59G1ZxejxeZNcAFtUtk1GamJKapFCal5y
        fkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0LFKCmWJOaVAoYDE4mIlfTub
        ovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMQ8fXMxdMka5ovXeA
        qYFxg3gXIyeHhICJxP+Ok4xdjFwcQgI7GCW2nf/ABOF8YpSY+OwDVOYzo8Trxg2MMC3T/01m
        hkjsYpT40b8YquUjo8SvC81sIFVsAroSW56/AmsXEehilrjYd48FxGEW2MoocfzGLCaQKmGB
        YImVp5+wgtgsAqoSnxpPAhVxcPAK2EmcvVsFYkoIyEv8WxwKYnIK2Es83mABUswrIChxcuYT
        FhCbGaiieetssIMkBBZySDTvesMEcamLxIMVF1khbGGJV8e3sEPYUhIv+9ug7GKJpbM+MUE0
        NzBKXN72iw0iYSwx61k7I8hiZgFNifW79CHOUZY4cgtqL59Ex+G/7BBhXomONiGIRnWJA9un
        s0DYshLdcz6zQpR4SNxZ6A4JqUmMElPb+lkmMCrMQvLNLCTfzELYu4CReRWjWGpBcW56arFR
        gSE8gpPzczcxgtOulusOxslvP+gdYmTiYDzEKMHBrCTC67y0IEmINyWxsiq1KD++qDQntfgQ
        oykwoCcyS4km5wMTf15JvKGJpYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU7NTUgtQimD4mDk6p
        BqZaYwvrFJ9QfjOvPOEn/2PDYq7/ibgwuz4utbgqZv41VvYdG2Tn+fAz7vXpLOOOKEt6e27v
        I3/dE5X/l06+Ke/nPMGjSnvWjJCwbx8VGExXvF19XHGnm3VW88mJPc1KwrESHxa3LdBWD7Kd
        Ov18gOKxqVsXdFyIezYremoZw2Y2O/G+iYIdrYYZdyIjt6q3nmw7VcgsPlns1T8T32i/p892
        +F5WTEqLsXk1KzC2PHo348vU4o9BTiZFH19lr6wwjjCvFJOf+NLO9tqXkNNFDB+N//240deS
        uHauz3YRs0ijUi67+M8CiyMu3hER/hVr5vv0ekPIq4uHOjsmmPQ0Nhy1Ftmlw96TYfc72+OM
        EktxRqKhFnNRcSIAmpInZEQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwdMuNosH87axWVzer21x
        /ctzVov5R86xWvS9eMhssff1VnaLjz33WC1mnN/HZHHxlKtF694j7BaH37SzWvy7tpHF4nkf
        UHzVrj+MDnwe72+0snvsnHWX3WPTqk42jzvX9rB59G1ZxejxeZNcAFsUl01Kak5mWWqRvl0C
        V8ah4+uZC6ZIV7TeO8DUwLhBvIuRk0NCwERi+r/JzF2MXBxCAjsYJebP/s8KkZCVePZuBzuE
        LSxxv+UIK0TRe0aJRTe6WEASbAK6Eluev2IESYgITGCWeHPlAzuIwyywk1HizqtTbCBVwgKB
        Eq0/poJ1sAioSnxqPAlkc3DwCthJnL1bBWJKCMhL/FscCmJyCthLPN5gAWIKARUcnVQE0scr
        IChxcuYTsBnMQMXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k
        /NxNjOD40NLawbhn1Qe9Q4xMHIyHGCU4mJVEeJ2XFiQJ8aYkVlalFuXHF5XmpBYfYpTmYFES
        573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwDTHsE7i5rkPF0IrkuOTa98rbMm4bSyovWnbIYfm
        PCuNskdMgoaOX9dO3cjuHhr3b/qCQoHTevlGnNraiw8r5uv83D69fOoqz5Q3l5y5FiqKRGez
        zei91PqzUvrEbE62OVYCl877/RAvrvu/8GtC+4aoM4+m8J6V2C7b8y0yafO9uVul8pj4cr9s
        PfSb/+1JlmfKpR8zpAwP3+OePHtvsra6gmuOJHPIVQ+9rrLr+ttTkv52r1rrv2TlkfUlwszO
        RVyvZ1x2n2cgYVUeYjJX+vsuk5P/+wtObxTNcvpyf4uKeHb5k1Z72Wjubxe7s86qBfEWKXsw
        flg02/qfvKJc1fqpoR9WLigqzfgWYvvuhxJLcUaioRZzUXEiAG2ZdJH+AgAA
X-CMS-MailID: 20220504075004epcas2p3f08dab53b53f4dfb05e53dd4b7a8d242
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p3f08dab53b53f4dfb05e53dd4b7a8d242
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p3f08dab53b53f4dfb05e53dd4b7a8d242@epcas2p3.samsung.com>
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

