Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0B1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345786AbiEDHxx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345746AbiEDHxu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:50 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3438DBFF
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:13 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220504075007epoutp013a564f9dabdd062aa0eda786bce8814a~r13nuhDoi2135821358epoutp01V
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220504075007epoutp013a564f9dabdd062aa0eda786bce8814a~r13nuhDoi2135821358epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650607;
        bh=lpy5wIgyotijaWU2pQ8mkUh6CJHHGwMOQRzL9VAk+pM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uRUbtSlYAtEhlOP2wvLR3MYRi5r4LxhqDJYVzXVSAGnYOpuKMtIBY8YIksdU6B4US
         uvi0+6kAn5YAI+PnaIxB39OCC90wRyNETOdOQ++K6hYSZWvEFsHIpzvI0SEtPIoEVk
         xBJ5h6F1l2l3Yrr2SczXy2HCoiifkAV30YLrK+G4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220504075006epcas2p1c7be0dca081b8a87ab16e6dd74db588f~r13m-5h_13182931829epcas2p1H;
        Wed,  4 May 2022 07:50:06 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KtTWc749cz4x9Pr; Wed,  4 May
        2022 07:50:04 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C2.6D.09694.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p218759eec1e29313c879eda085e37f0b7~r13k89Z4k2519725197epcas2p2c;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp14093ab0a35de14790deedae3466899ca~r13k8B86N2992129921epsmtrp1V;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-dd-6272302c519f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        59.EB.08924.B2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epsmtip1dc92e6d1cb0bedaa37c25821207bca83~r13kxZDON2352223522epsmtip1a;
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
Subject: [PATCH v3 05/12] clk: samsung: exynosautov9: add cmu_peris clock
 support
Date:   Wed,  4 May 2022 16:51:47 +0900
Message-Id: <20220504075154.58819-6-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmma6OQVGSweyvUhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZ674uYyo4JVmx5PhC
        9gbGHrEuRk4OCQETiZM/p7J0MXJxCAnsYJSYveYoI4TziVHix8u/TBDOZ0aJc50v2GFadrZc
        gmrZxSix5cNnVgjnI6PEwoUdLCBVbAK6EluevwKbJSLQxSxxse8eWAuzwFZGieM3ZjGBVAkL
        BEs8nPkQzGYRUJWY/GUbmM0rYCfx8nAzUAMH0D55iX+LQ0FMTgF7iccbLCAqBCVOznwCtosZ
        qKJ562xmiOsWckj82h0NYbtI3Hi1iwXCFpZ4dXwL1AdSEi/726DsYomlsz6BvSkh0MAocXnb
        LzaIhLHErGftjCB7mQU0Jdbv0oe4RlniyC2otXwSHYf/skOEeSU62oQgGtUlDmyfDrVVVqJ7
        Dih4QGwPiTmPe6HhNolRYse8VWwTGBVmIflmFpJvZiEsXsDIvIpRLLWgODc9tdiowAQew8n5
        uZsYwYlXy2MH4+y3H/QOMTJxMB5ilOBgVhLhdV5akCTEm5JYWZValB9fVJqTWnyI0RQY0hOZ
        pUST84GpP68k3tDE0sDEzMzQ3MjUwFxJnNcrZUOikEB6YklqdmpqQWoRTB8TB6dUA1OW96GL
        a45vTSzm28x4LWC7Y9eh9t4Go9N63v0OXbKB3brmsbt/PJy3baK+X0cZ983QF9FfeMNVT64J
        WP05beGhgpgch0V1tvclHmR3TGjb9axAykrNlVvjygveYyEe5eEJcn8bq9xi1xz7vzTLXV2Y
        kWnKw+pXOX0SvHvlzi169nVtoolylSXryw0tJxSuexk2Xra6ZPVn/dVlbYo746ef1X8tIpr3
        oJ4lZ+UdJRP39r+aCzca8K3QnLZGQH9axdnG9smpb1hn7HuZ13JkcvP0+XJ+Rs+TEh0aj4Xt
        Km5/vPtH7uWWxYpMGUWL1ueuvPjZ4VNFyubvHWE+UXXi73gP/uQ6edR6koTajhV6c5VYijMS
        DbWYi4oTAWWecOhFBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwZFCiwfztrFZXN6vbXH9
        y3NWi/lHzrFa9L14yGyx9/VWdouPPfdYLWac38dkcfGUq0Xr3iPsFofftLNa/Lu2kcXieR9Q
        fNWuP4wOfB7vb7Sye+ycdZfdY9OqTjaPO9f2sHn0bVnF6PF5k1wAWxSXTUpqTmZZapG+XQJX
        xrqvy5gKTklWLDm+kL2BsUesi5GTQ0LARGJnyyWWLkYuDiGBHYwSR79/YYRIyEo8e7eDHcIW
        lrjfcoQVoug9o8SU1U/BitgEdCW2PH/FCJIQEZjALPHmygd2EIdZYCejxJ1Xp9hAqoQFAiVe
        fpnNDGKzCKhKTP6yjQnE5hWwk3h5uBloNwfQCnmJf4tDQUxOAXuJxxssQEwhoIqjk4ogigUl
        Ts58wgJiMwMVN2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNz
        NzGC40NLawfjnlUf9A4xMnEwHmKU4GBWEuF1XlqQJMSbklhZlVqUH19UmpNafIhRmoNFSZz3
        QtfJeCGB9MSS1OzU1ILUIpgsEwenVAPT6Wc9FwyuzHu419uqoS/mneExu8hD4pK2BZfMa4Sz
        tXP0GSrDdPZ1935hi70QXBBXzLj8Qo56/olZu8ImBByUVph7elns4a939YNMVAWumdcrdez+
        1J2XpKLmWb2sU/L2nwOagSGhHM1pF5/7rH+57I7+d6Hg2j9POznWbKhO8mnLTDyxNGi6St1x
        pWlOSfu+zFfqCRbZPiFS4f+a+ZEuLG+L33v2ajoc3isXqn8sLeh11EW9jc7/Y1uN/sf7dN6c
        cHnfhQ+KIp0fzip0cN6xzFFNnpQaLGu58sTiq16iF++evP2bS23mzfIelnxOUaunPVHxoie3
        trTv1mU/EKxSJlhT+V/u08JpRb/afyqxFGckGmoxFxUnAgAfXh5c/gIAAA==
X-CMS-MailID: 20220504075004epcas2p218759eec1e29313c879eda085e37f0b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p218759eec1e29313c879eda085e37f0b7
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p218759eec1e29313c879eda085e37f0b7@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_PERIS is responsible to control clocks of BLK_PERIS which has
OPT/MCT/WDT and TMU. This patch only supports WDT gate clocks and all
other clocks except WDT will be supported later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 51 ++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 984ecba83e42..b3ea586c0d21 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1015,6 +1015,53 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_core_bus",
 };
 
+/* ---- CMU_PERIS ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10020000) */
+#define PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER	0x0600
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK	0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK	0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER1_IPCLKPORT_PCLK	0x2060
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIS */
+PNAME(mout_peris_bus_user_p) = { "oscclk", "dout_clkcmu_peris_bus" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
+	    mout_peris_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIS_BUS_USER, 4, 1),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_SYSREG_PERIS_PCLK, "gout_sysreg_peris_pclk",
+	     "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_WDT_CLUSTER0, "gout_wdt_cluster0", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT_CLUSTER1, "gout_wdt_cluster1", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks		= peris_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peris_mux_clks),
+	.gate_clks		= peris_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids		= PERIS_NR_CLK,
+	.clk_regs		= peris_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peris_clk_regs),
+	.clk_name		= "dout_clkcmu_peris_bus",
+};
+
 static int __init exynosautov9_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1031,6 +1078,10 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
 	}, {
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-peris",
+		.data = &peris_cmu_info,
+	}, {
 	},
 };
 
-- 
2.36.0

