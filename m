Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38A1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345760AbiEDHy3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345819AbiEDHx7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:59 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEF41F4
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:19 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220504075011epoutp0304f8e6d18ffcea07a712bd113fa809a7~r13sKhX051219312193epoutp03E
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220504075011epoutp0304f8e6d18ffcea07a712bd113fa809a7~r13sKhX051219312193epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650611;
        bh=HAMZVrcaxAQpSILOFjAhv9O6fW2MogIansTb78Hpv90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ix1xtuwRDSj3+sewQ6PAqU23xBNpiN5jRLWT8TQnEiVpWbaxXxk2bhTkZG3Iwj2uE
         2t5UVHE+AD6HPaepgr2YdYflVe6AYQtc6klxdxfH7vjwJE29EkRwVy/1AO+Ri/gfDf
         glQosB4ZSwWiNJC7zAN2VNa8Jphf66beYfDr81wk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220504075011epcas2p12e37cb6d5912df566a1c495a8d46f168~r13rm8uAu0829908299epcas2p1F;
        Wed,  4 May 2022 07:50:11 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.68]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KtTWh5V0Lz4x9QC; Wed,  4 May
        2022 07:50:08 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        D3.6D.09694.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p3b7508eb948c6e17d3ece429b03540c65~r13lYWwqZ2951629516epcas2p3k;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp2b127fa853e5c3f0d322aea717c6f8d68~r13lXkVJX0425004250epsmtrp2F;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-e1-6272302c5e11
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        9C.EB.08924.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epsmtip13fedaa96db393b3d9a0cda65387a2280~r13lK7kWX2352223522epsmtip1b;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
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
Subject: [PATCH v3 09/12] clk: samsung: exynosautov9: add cmu_peric1 clock
 support
Date:   Wed,  4 May 2022 16:51:51 +0900
Message-Id: <20220504075154.58819-10-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmqa6OQVGSwY9uC4sH87axWVzer21x
        /ctzVov5R86xWvS9eMhssff1VnaLjz33WC1mnN/HZHHxlKtF694j7BaH37SzWvy7tpHF4nkf
        UHzVrj+MDnwe72+0snvsnHWX3WPTqk42jzvX9rB59G1ZxejxeZNcAFtUtk1GamJKapFCal5y
        fkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0LFKCmWJOaVAoYDE4mIlfTub
        ovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMlhevGQsWZ1c8/v+b
        sYHxQlwXIyeHhICJxI4LN1m7GLk4hAR2MEp0/ZnJCOF8YpTYNO0CG0iVkMBnRonvZxhhOk59
        bGaGiO9ilNj/AKr7I6NE46LnLCAJNgFdiS3PX4FNEhHoYpa42HePBcRhFtjKKHH8xiwmkCph
        gRCJU1/WsILYLAKqEvdOP2MHsXkF7CW+LD8KtJoDaJ28xL/FoSAmJ1D48QYLiApBiZMzn4Dt
        YgaqaN46mxlkvITAUg6Jiet2skNc6iKx73ELG4QtLPHq+BaouJTE53d7oeLFEktnfWKCaG5g
        lLi87RdUwlhi1rN2RpDFzAKaEut36UOcoyxx5BbUXj6JjsN/2SHCvBIdbUIQjeoSB7ZPZ4Gw
        ZSW653xmhbA9JHbs2cYMCatJjBK9R++yT2BUmIXknVlI3pmFsHgBI/MqRrHUguLc9NRiowIT
        eAQn5+duYgSnXS2PHYyz337QO8TIxMF4iFGCg1lJhNd5aUGSEG9KYmVValF+fFFpTmrxIUZT
        YFBPZJYSTc4HJv68knhDE0sDEzMzQ3MjUwNzJXFer5QNiUIC6YklqdmpqQWpRTB9TBycUg1M
        069wsF+Y8VjdmOty39yMeYa/d2pMOTyh0JBf5KvxWsYipfX/PknI91z9efvEYUPDzugs0aCz
        NgdauT0N9z2bmax7Y4nMYvOJ67XP9/zdJBncZLp22pKw4nkBZV6uRyLWtsps559bZ+ZRZD7Z
        UunAfyHGM8xt21cu/iwSX5ueaXW/V22imYqf1av6yL9SerfMUn1+xNy5daBnMcvNxHvJDt4v
        iq9XZngcTt20VU5w9dr9OTM3Ppkkv+vjhVVe811m8Sp/Li070W+9a/q1lR8tjhp99+6zl1q/
        3mGF8SqTdOtLEzh4Zlk91t6sdOrrbXbuG/d7ntb/sVrrJ/x18d/7T3g785ht0jRTnpTYFW6s
        UWIpzkg01GIuKk4EABUXnrdEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwcnj0hYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        royWF68ZCxZnVzz+/5uxgfFCXBcjJ4eEgInEqY/NzF2MXBxCAjsYJR73L2eCSMhKPHu3gx3C
        Fpa433KEFaLoPaPEsoePmUESbAK6Eluev2IESYgITGCWeHPlAzuIwyywk1HizqtTbCBVwgJB
        Eu9/nmIFsVkEVCXunX4GNpZXwF7iy/KjQDUcQCvkJf4tDgUxOYHCjzdYgJhCAnYSRycVQRQL
        Spyc+YQFxGYGKm7eOpt5AqPALCSpWUhSCxiZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn
        525iBEeIltYOxj2rPugdYmTiYDzEKMHBrCTC67y0IEmINyWxsiq1KD++qDQntfgQozQHi5I4
        74Wuk/FCAumJJanZqakFqUUwWSYOTqkGpuD0M4fD94l1xJn7PNTd/OirzrW70z+cjHg1pXaN
        35HfUzbO1r1Uxu7ropK8KnzNvy8ZArprWBOTvjRvlkxxfv7DvdbM5nLcD5HLOl/29srdkNBq
        Mrpc+7+4OuY0y8mF85Yv/Xdlxb/jf3+L/61RX/a568bqGWw6EzvmKB6YMPGprfssnrgt0zgv
        fSm/u/HBnJMHJpw2PVb4bVJhoZNW1ucUyYNLlnt92i8Q5vOgdNoXgYY+fS9Jj0M8hSW5S9cV
        T9k0SXGeoZ/s0/Q8Ht3OpzdO1LtnVb031bI49dFos6mb9VKNgIxNH30bpDc5rG/0nt2kO3nS
        17UtHxvD/6dr5qz12nsm5EAB0/O4fZHn731VYinOSDTUYi4qTgQAlZj6rv8CAAA=
X-CMS-MailID: 20220504075004epcas2p3b7508eb948c6e17d3ece429b03540c65
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p3b7508eb948c6e17d3ece429b03540c65
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p3b7508eb948c6e17d3ece429b03540c65@epcas2p3.samsung.com>
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

