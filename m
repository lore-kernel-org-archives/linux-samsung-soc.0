Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C699C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbiECLBs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbiECLB3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:29 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A427939809
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:47 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220503105734epoutp025580b802df4e3451361d963f09a65da6~rkyAFUafX1141511415epoutp02a
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220503105734epoutp025580b802df4e3451361d963f09a65da6~rkyAFUafX1141511415epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575454;
        bh=HAMZVrcaxAQpSILOFjAhv9O6fW2MogIansTb78Hpv90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EvuuDOgZA/LrO2XTQCbtxDrLwPhWRy3v/1lZhHXNR9keFIzWrVXXAbd7YLYLwOf5u
         jvGWSFSkfy2P5T+B77n+Gnt4OVLkOJKPrl58TCswEal/NceQsj6p3kuAoahUMt7k/C
         SOO7x2PNv2ux6wSW4t5MqiQw6WIow7YJSdza+bZk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220503105733epcas2p34e6a71e626dfe70f55f49a615d5a8a3c~rkx-hhK0h3115231152epcas2p3Q;
        Tue,  3 May 2022 10:57:33 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsxkL5WH4z4x9Pp; Tue,  3 May
        2022 10:57:30 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        A3.DA.09694.A9A01726; Tue,  3 May 2022 19:57:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p2a45738fe3facba70433e022213c5d4ec~rkx8ML7Yj1964019640epcas2p2A;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp1dcea5431d7836779ee1fb02c26ab4c00~rkx8GuLGY0279502795epsmtrp1g;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-98-62710a9a6f41
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4B.A3.08924.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip2ed14933dd8844be13fe4f908e2ecc97c~rkx78zSbN0549605496epsmtip2_;
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
Subject: [PATCH v2 09/12] clk: samsung: exynosautov9: add cmu_peric1 clock
 support
Date:   Tue,  3 May 2022 19:59:11 +0900
Message-Id: <20220503105914.117625-10-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmhe4srsIkg+2TtC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzWl68ZixYnF3x+P9v
        xgbGC3FdjJwcEgImEs/2v2LvYuTiEBLYwSixf2knK4TziVHi6LdZjBDOZ0aJeXf2s8O0nHvx
        gwkisYtR4v+hLSwQzkdGiTVL54NVsQnoSmx5/gqsXUSgi1niYt89sCpmga2MEsdvzGICqRIW
        CJH4v+woI4jNIqAqseNeBwuIzSvgIHFz6yagOAfQPnmJf4tDQcKcQOHru84xQZQISpyc+QSs
        nBmopHnrbGaI85ZySNw6bw5hu0g09OxigrCFJV4d3wL1gpTEy/42KLtYYumsT2DvSAg0MEpc
        3vaLDSJhLDHrWTvYDcwCmhLrd+lDnKMsceQW1Fo+iY7Df9khwrwSHW1CEI3qEge2T2eBsGUl
        uud8ZoWwPSROn+phhoTVZEaJbzNusU1gVJiF5JtZSL6ZhbB4ASPzKkax1ILi3PTUYqMCE3gU
        J+fnbmIEp14tjx2Ms99+0DvEyMTBeIhRgoNZSYTXeWlBkhBvSmJlVWpRfnxRaU5q8SFGU2BQ
        T2SWEk3OByb/vJJ4QxNLAxMzM0NzI1MDcyVxXq+UDYlCAumJJanZqakFqUUwfUwcnFINTGpf
        kk1U59ka6nM8/ccWfrOP7e6BnYtznXqadO5y116ee5g1sMxaqfZHp8XSpI8u7Ikf+KPX8Ttf
        j3/gtWGeRxHz70R+rtUaGu5xj58KWi1jlVa1X+GXea7+g9H8kNgNc3YZH/mof8/5Xv6Rug0R
        MWUralfZPt3D8op1w9XTp3v/rWe1+Nl4lSlFXf72dNV9zUdFVs96FWrH2iKxJEV/l1W0Su3z
        NyeT+dpeuITwLQ49UNmyvlEtUkIisdnoG/POPuFNe17tqWO8WJzR5ilbdevSBY28FPlw2z/K
        V9XOeM//HLb3fFspi+gk90Mvq9cJBrht+Va6/0Bl9/yg8l+LJBLcvs82qHmV2vxov/kjJZbi
        jERDLeai4kQAVSmShEYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg3/T9S0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBktL14zFizOrnj8/zdjA+OFuC5GTg4JAROJcy9+MHUxcnEICexglHizfQ0LREJW4tm7HewQ
        trDE/ZYjrBBF7xkl5s54ygaSYBPQldjy/BUjSEJEYAKzxJsrH9hBHGaBnYwSd16dAqri4BAW
        CJI4PLcIpIFFQFVix70OsA28Ag4SN7duYgQpkRCQl/i3OBQkzAkUvr7rHBOILSRgL7Hz73Zm
        iHJBiZMzn4C1MgOVN2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1
        kvNzNzGCY0RLawfjnlUf9A4xMnEwHmKU4GBWEuF1XlqQJMSbklhZlVqUH19UmpNafIhRmoNF
        SZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVANTanpRwM7p98LZRVX2f/9yJtZaOeGj6to12bJd
        dzTtJxxyF3nIfvSZf5XzwgXmpTWaIZsL2BxMlrxpCbVKvXTqvaHaoY3H5aI7P/5SX5FowsnY
        qLQkMW3P15TuPusI0X2y7haNS9sOBb5+/sOLQ83Vre7Zm7/PSmbuOaJatyLS/eqvdObLtdMk
        7XevsYgWVJa+G391D9dJvm3hmx6XuElx7bDIda5nfMAYmeCUxcR7Xv/sy07Xji/fzmzylItj
        CM8UzZu1vS6ntL9/Z+jcNdlml3Qtbtjf3twS8OHQFK8Zd+tWbP2bYa4hH5121PCD0KTZD+cJ
        L+mQ/PsrI2aH2kWZ2a56fxsiMu1XXePctU6JpTgj0VCLuag4EQAAlmMGAAMAAA==
X-CMS-MailID: 20220503105729epcas2p2a45738fe3facba70433e022213c5d4ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p2a45738fe3facba70433e022213c5d4ec
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p2a45738fe3facba70433e022213c5d4ec@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Like CMU_PERIC0, this provides clocks for USI06 ~ USI11 and USI_I2C.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 254 +++++++++++++++++++++++++
 1 file changed, 254 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index e85efc6c3f71..d9e1f8e4a7b4 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1385,6 +1385,257 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_peric0_bus",
 };
 
+/* ---- CMU_PERIC1 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC1 (0x10800000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_PERIC1_IP_USER	0x0610
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI06_USI	0x1000
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI07_USI	0x1004
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI08_USI	0x1008
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI09_USI	0x100c
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI10_USI	0x1010
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI11_USI	0x1014
+#define CLK_CON_MUX_MUX_CLK_PERIC1_USI_I2C	0x1018
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI	0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI	0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI	0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI	0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI	0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI	0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C	0x1818
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_0	0x2014
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_1	0x2018
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_2	0x2024
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_3	0x2028
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4	0x202c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_5	0x2030
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_6	0x2034
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_7	0x2038
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_8	0x203c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_9	0x2040
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_10	0x201c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11	0x2020
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0	0x2044
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1	0x2048
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2	0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3	0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4	0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7	0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5	0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6	0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8	0x2070
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9	0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10	0x204c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11	0x2050
+
+static const unsigned long peric1_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC1_IP_USER,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI06_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI07_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI08_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI09_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI10_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI11_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC1_USI_I2C,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC1 */
+PNAME(mout_peric1_bus_user_p) = { "oscclk", "dout_clkcmu_peric1_bus" };
+PNAME(mout_peric1_ip_user_p) = { "oscclk", "dout_clkcmu_peric1_ip" };
+PNAME(mout_peric1_usi_p) = { "oscclk", "mout_peric1_ip_user" };
+
+static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC1_BUS_USER, "mout_peric1_bus_user",
+	    mout_peric1_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC1_IP_USER, "mout_peric1_ip_user",
+	    mout_peric1_ip_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_IP_USER, 4, 1),
+	/* USI06 ~ USI11 */
+	MUX(CLK_MOUT_PERIC1_USI06_USI, "mout_peric1_usi06_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI06_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI07_USI, "mout_peric1_usi07_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI07_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI08_USI, "mout_peric1_usi08_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI08_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI09_USI, "mout_peric1_usi09_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI09_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI10_USI, "mout_peric1_usi10_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI10_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC1_USI11_USI, "mout_peric1_usi11_usi",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI11_USI, 0, 1),
+	/* USI_I2C */
+	MUX(CLK_MOUT_PERIC1_USI_I2C, "mout_peric1_usi_i2c",
+	    mout_peric1_usi_p, CLK_CON_MUX_MUX_CLK_PERIC1_USI_I2C, 0, 1),
+};
+
+static const struct samsung_div_clock peric1_div_clks[] __initconst = {
+	/* USI06 ~ USI11 */
+	DIV(CLK_DOUT_PERIC1_USI06_USI, "dout_peric1_usi06_usi",
+	    "mout_peric1_usi06_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI07_USI, "dout_peric1_usi07_usi",
+	    "mout_peric1_usi07_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI08_USI, "dout_peric1_usi08_usi",
+	    "mout_peric1_usi08_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI09_USI, "dout_peric1_usi09_usi",
+	    "mout_peric1_usi09_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI10_USI, "dout_peric1_usi10_usi",
+	    "mout_peric1_usi10_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC1_USI11_USI, "dout_peric1_usi11_usi",
+	    "mout_peric1_usi11_usi", CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
+	    0, 4),
+	/* USI_I2C */
+	DIV(CLK_DOUT_PERIC1_USI_I2C, "dout_peric1_usi_i2c",
+	    "mout_peric1_usi_i2c", CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C, 0, 4),
+};
+
+static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
+	/* IPCLK */
+	GATE(CLK_GOUT_PERIC1_IPCLK_0, "gout_peric1_ipclk_0",
+	     "dout_peric1_usi06_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_1, "gout_peric1_ipclk_1",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_2, "gout_peric1_ipclk_2",
+	     "dout_peric1_usi07_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_3, "gout_peric1_ipclk_3",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_4, "gout_peric1_ipclk_4",
+	     "dout_peric1_usi08_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_5, "gout_peric1_ipclk_5",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_6, "gout_peric1_ipclk_6",
+	     "dout_peric1_usi09_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_7, "gout_peric1_ipclk_7",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_8, "gout_peric1_ipclk_8",
+	     "dout_peric1_usi10_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_9, "gout_peric1_ipclk_9",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_10, "gout_peric1_ipclk_10",
+	     "dout_peric1_usi11_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IPCLK_11, "gout_peric1_ipclk_11",
+	     "dout_peric1_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11,
+	     21, 0, 0),
+
+	/* PCLK */
+	GATE(CLK_GOUT_PERIC1_PCLK_0, "gout_peric1_pclk_0",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_2, "gout_peric1_pclk_2",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_3, "gout_peric1_pclk_3",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_4, "gout_peric1_pclk_4",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_5, "gout_peric1_pclk_5",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_6, "gout_peric1_pclk_6",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_7, "gout_peric1_pclk_7",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_8, "gout_peric1_pclk_8",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_9, "gout_peric1_pclk_9",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_10, "gout_peric1_pclk_10",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_11, "gout_peric1_pclk_11",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peric1_cmu_info __initconst = {
+	.mux_clks		= peric1_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric1_mux_clks),
+	.div_clks		= peric1_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric1_div_clks),
+	.gate_clks		= peric1_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peric1_gate_clks),
+	.nr_clk_ids		= PERIC1_NR_CLK,
+	.clk_regs		= peric1_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+	.clk_name		= "dout_clkcmu_peric1_bus",
+};
+
 /* ---- CMU_PERIS ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIS (0x10020000) */
@@ -1456,6 +1707,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-peric0",
 		.data = &peric0_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-peric1",
+		.data = &peric1_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-peris",
 		.data = &peris_cmu_info,
-- 
2.36.0

