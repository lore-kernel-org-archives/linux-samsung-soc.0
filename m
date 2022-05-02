Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50ADC4321E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241684AbiEBJE4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384029AbiEBJEr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:47 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7CF583B2
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:14 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220502090106epoutp04f85564fcd1018a52be5fe4ce3189e376~rPjCaJ-sc0419704197epoutp04E
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220502090106epoutp04f85564fcd1018a52be5fe4ce3189e376~rPjCaJ-sc0419704197epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482066;
        bh=rnKxo2ejc4qZjq2IjIKHcWsLcB9bUGGMxp/IDw6k2v0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MRNBuBSyqnv/TSUoRI++J8acPMnMLboVKzCIRDtZjvPJKDWt1CdAG0jfnuLA5PyX1
         1KFENEkHFzgQFd+yzjmEQZLGsUi7YSGUqhCtxYdwLHyL4wSsD36obV6M0BR+CTdT2C
         fpSjkmiyVfUpqzXm6+uIzYfkihGy1XeOvAvJeHmg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220502090106epcas2p409b1058cd224f4e3c2c8c76c691e4e86~rPjB0-Izx0489804898epcas2p4s;
        Mon,  2 May 2022 09:01:06 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.89]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KsHBR0RVXz4x9Q1; Mon,  2 May
        2022 09:01:03 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3A.53.09764.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220502090101epcas2p38a695a825488201724663ba7f5302b2d~rPi9LPc8o2741227412epcas2p3t;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090101epsmtrp28200b713809b3505201b20ec5c5f6f1a~rPi9KWGC33259032590epsmtrp2B;
        Mon,  2 May 2022 09:01:01 +0000 (GMT)
X-AuditID: b6c32a46-f75ff70000002624-ee-626f9dcda8ec
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        05.FB.08924.DCD9F626; Mon,  2 May 2022 18:01:01 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip26b850a81c2bf5aa767207b65fbb50dc1~rPi88mg_a1979719797epsmtip2V;
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
Subject: [PATCH 09/12] clk: samsung: exynosautov9: add cmu_peric1 clock
 support
Date:   Mon,  2 May 2022 18:02:27 +0900
Message-Id: <20220502090230.12853-10-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmqe7ZuflJBm171S0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iz3m/9zFjwIKviyfVX
        LA2Mk+K6GDk5JARMJCZ1rWLsYuTiEBLYwSjx8P4qVpCEkMAnRonXT8IhEp8ZJU7+O8PexcgB
        1jH9rhhEzS6geD8HRM1HRokzby6ygyTYBHQltjx/BTZVRKCLWeJi3z0WEIdZYCujxPEbs5hA
        qoQFAiVOX5gE1sEioCpx8v0NZhCbV8BeYv6dTkaIbfIS/xaHgoQ5gcJntj5nhCgRlDg58wkL
        iM0MVNK8dTYzyHwJgaUcEu3P2tkgfnORONG+lR3CFpZ4dXwLlC0l8fndXqiaYomlsz4xQTQ3
        MEpc3vYLKmEsMetZO9gRzAKaEut36UPcoyxx5BbUXj6JjsN/oYHCK9HRJgTRqC5xYPt0Fghb
        VqJ7zmdWCNtDou9bIxMksCYxSkw5tZ5pAqPCLCTvzELyziyExQsYmVcxiqUWFOempxYbFRjB
        Izg5P3cTIzjtarntYJzy9oPeIUYmDsZDjBIczEoivG0bcpKEeFMSK6tSi/Lji0pzUosPMZoC
        w3ois5Rocj4w8eeVxBuaWBqYmJkZmhuZGpgrifN6pWxIFBJITyxJzU5NLUgtgulj4uCUamBa
        ydl55tfThd9/yZT6W9/Ur+jmvRckYBgyzXbCZu8tx1jLA9cJPl8rv03kNEvMgZc6LXqJkwIS
        ttw7aPM3rI5jt/ljfn3N+3KP5n0InLnc3VKpsFyUWXnbzB1T2hWCFmp0brn2IetOPusNaW9F
        zwPcaQ7qe95ze93KbwnY/Oxj3hm/ZepBzD2JrcqmtzZP1rGRiXTrNH6uq2Qc/1TU79df2WXX
        RCJ2HhFp3FLzcYvR/73efvfmOX7/fPwHwzHfbIGYOf1fEljcfj5OtV5697yZVU7a6tt7wg6Z
        mnW+3DL/EMeybx6HbpkbL51SGeGRKuTkf6Ix7oNDlBlz18Hm4lXZhjrGEi9vTZYR3xQvoqbE
        UpyRaKjFXFScCADXs+XdRAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO7ZuflJBvOXslo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDLeb/3MWPAgq+LJ9VcsDYyT4roYOTgkBEwkpt8V62Lk4hAS2MEosXfeZ7YuRk6guKzEs3c7
        2CFsYYn7LUdYIYreM0r8mTIFrIhNQFdiy/NXjCAJEYEJzBJvrnxgB3GYBXYyStx5dQqsSljA
        X2Lhq0Ngo1gEVCVOvr/BDGLzCthLzL/TyQhxhrzEv8WhIGFOoPCZrc8ZQWwhATuJHyfuQ5UL
        Spyc+YQFxGYGKm/eOpt5AqPALCSpWUhSCxiZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn
        525iBMeIltYOxj2rPugdYmTiYDzEKMHBrCTC27YhJ0mINyWxsiq1KD++qDQntfgQozQHi5I4
        74Wuk/FCAumJJanZqakFqUUwWSYOTqkGJim1XwtWrudo1pvM0/96QlyE8vYX30rOcW1Ypcmm
        G+Wqor47OeqsOvtfI7eLb8v+K0nO6olT2cY8s3UVU8mWJ8Hrtl5s2rZwEtsM/rNRu0qDOA4c
        5OZ49nz+sqQ3U9K7BbR9MkoPWq3J3VFR+0li9QP+t80qlQ/2RIRKOq7yeuLDf+fE5WKdtEP7
        b0W0LLA7krfuxAof5v4zOdEz8pkOXbm2+N/csHBxy40f1n3zmZjQGLD48UtefbXcJe5ZN1zd
        9x4LswtsvFR4P27lbq5Ds9u3CHiZxbydqnJBhfHzifnrGLiSGVUapzkfuHYootvP5sKjG5IP
        2m8zrWp2qfJcP+GFoH1t2/bJ+ne5du3qdFViKc5INNRiLipOBAB7uwAlAAMAAA==
X-CMS-MailID: 20220502090101epcas2p38a695a825488201724663ba7f5302b2d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090101epcas2p38a695a825488201724663ba7f5302b2d
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090101epcas2p38a695a825488201724663ba7f5302b2d@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Like CMU_PERIC0, this provides clocks for USI06 ~ USI11 and USI_I2C.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 254 +++++++++++++++++++++++++
 1 file changed, 254 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index d3adc4b687da..8a6d91f2e81a 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1388,6 +1388,257 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
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
@@ -1459,6 +1710,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
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

