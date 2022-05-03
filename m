Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19FBC43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbiECLBY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbiECLBT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:19 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C4519C1B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:34 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220503105731epoutp02f096a079545bc6bf34490142e5988666~rkx98qGGa1140711407epoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220503105731epoutp02f096a079545bc6bf34490142e5988666~rkx98qGGa1140711407epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575451;
        bh=lpy5wIgyotijaWU2pQ8mkUh6CJHHGwMOQRzL9VAk+pM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N+ZmmuCYD9CeNNZERptOe3wUU6Qc6I+wTb1oi+xXW8iq6BqDPksJ7We4tH9xcvGcO
         MnI1J5pmPVuyZpMYtJFKoM7lhhsW+kKksnzGIrb5oS+9frUuN3mg39skgum07Zc+y3
         WyFa1qC2aFabkljmSm2wZ5fFADjrUxYO8xP90hPU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220503105731epcas2p412fa139f5f0276708f19d6af73269a87~rkx9cR1EW1759317593epcas2p4S;
        Tue,  3 May 2022 10:57:31 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsxkL0DTMz4x9Q1; Tue,  3 May
        2022 10:57:30 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C1.DA.09694.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p32540f21b33f85ff1a5f966ca03b8defa~rkx74BwLo2361523615epcas2p3_;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp2f2f3638cfc3c3299ad33ba8dbbc4801c~rkx73K9IW0978209782epsmtrp2K;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-95-62710a998025
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        78.A3.08924.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip2e497806620bfcd9a0c985b5f04b437d1~rkx7tgE6j1107911079epsmtip2E;
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
Subject: [PATCH v2 05/12] clk: samsung: exynosautov9: add cmu_peris clock
 support
Date:   Tue,  3 May 2022 19:59:07 +0900
Message-Id: <20220503105914.117625-6-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmme5MrsIkg71bLC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iz1n1dxlRwSrJiyfGF
        7A2MPWJdjJwcEgImEq1fHzCC2EICOxglXvc5djFyAdmfGCUudpxmhXA+M0p8WLKaFabj7Znj
        TBCJXYwS594/Y4dwPjJK9He+ZAOpYhPQldjy/BUjSEJEoItZ4mLfPRYQh1lgK6PE8RuzmECq
        hAWCJTZ2TQPq4OBgEVCVeNNjChLmFbCX+L90OitIWEJAXuLf4lCQMKeAg8T1XeeYIEoEJU7O
        fMICYjMDlTRvnc0MMl5CYCmHxMqeVjaIU10kjp9qZIawhSVeHd/CDmFLSXx+txeqplhi6axP
        TBDNDYwSl7f9gkoYS8x61s4IcgSzgKbE+l36EPcoSxy5BbWXT6Lj8F92iDCvREebEESjusSB
        7dNZIGxZie45n6E+8ZD408oLCarJjBIrmm4wTmBUmIXkm1lIvpmFsHcBI/MqRrHUguLc9NRi
        owITeAQn5+duYgSnXS2PHYyz337QO8TIxMF4iFGCg1lJhNd5aUGSEG9KYmVValF+fFFpTmrx
        IUZTYEhPZJYSTc4HJv68knhDE0sDEzMzQ3MjUwNzJXFer5QNiUIC6YklqdmpqQWpRTB9TByc
        Ug1MaY1LxBcXNk3xnnJcRudw7Anh4P9OJyJy9npN0zu540JHvuiZGNer4mGPNBrnsl4Oit45
        T/BFIdMCSQ2/GGNHti+8Ny7fkkp0etB6Y9qSozf/zPrNqyzyySxr2+5i78tsMek/rqROW2Cw
        VLpR6bPB0Q9zTdaktPxbI3vz+WxTZZZ+p7mlay5InVG/LO1Vvixt0nS9Va9bvW0u9k7/IJCv
        cXTj8zX1z+Mssh5wObxyj7JaF5XksE1+zrH7b5xnrWxZwJe4sOakxcIktr2+LenCl6Kkp7z4
        /bVQyWjf/6YrOt9eHwvKkYz4oKxv6+Cady/TPHldbu39dcFfdracSj3Erbl6/90Tnxct8/tg
        VH51txJLcUaioRZzUXEiAOj+d2lEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkgxe75C0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBnrvi5jKjglWbHk+EL2BsYesS5GTg4JAROJt2eOM3UxcnEICexglJj4vZEVIiEr8ezdDnYI
        W1jifssRVoii94wSJ469YQJJsAnoSmx5/ooRJCEiMIFZ4s2VD+wgDrPATkaJO69OsYFUCQsE
        Suyc+gCog4ODRUBV4k2PKUiYV8Be4v/S6awgYQkBeYl/i0NBwpwCDhLXd50Dmy8EVLLz73Zm
        iHJBiZMzn7CA2MxA5c1bZzNPYBSYhSQ1C0lqASPTKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0
        veT83E2M4BjR0trBuGfVB71DjEwcjIcYJTiYlUR4nZcWJAnxpiRWVqUW5ccXleakFh9ilOZg
        URLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXAtLz0YNIXjS+HVrzbU/hXeooV16TlUv/yGLQy
        37y6L/POyO+Ky9f8nldcTGqshbOOpXALc2grJB8s4p51qKzI+Xvq1K4zZqctptboCnyR/fWJ
        4+vtL3GK6xiMOtx4dx4NjvEuzj/G+ODF2uU37/m0P0o6fHSuempfkuaX/7NZznBXOofX2oZn
        nWrp6JockujgvONOdE+bHdeLjeqX9sbkPRVVXLaw9FL27+fW1rsizbR/ZYTPN5qsENK140Pg
        tutxevdztr5l4LxreeZGu1rBm49fyiX+TXZ5dXRNb9SD7g2L/1kb3z1ZX9qpczd/aqOv/CKj
        MysMT02/LiN1ft96/0lfexWPH3o+jeHjxmlMi5RYijMSDbWYi4oTAZmPjesAAwAA
X-CMS-MailID: 20220503105729epcas2p32540f21b33f85ff1a5f966ca03b8defa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p32540f21b33f85ff1a5f966ca03b8defa
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p32540f21b33f85ff1a5f966ca03b8defa@epcas2p3.samsung.com>
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

