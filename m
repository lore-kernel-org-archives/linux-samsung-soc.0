Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05603C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 00:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiF0AyY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Jun 2022 20:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiF0AyY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 20:54:24 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590FA2DE4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 17:54:17 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220627005415epoutp036c76b074f0c81cdc37cd9d17c5a909e6~8VB8I7oLn1135711357epoutp03B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 00:54:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220627005415epoutp036c76b074f0c81cdc37cd9d17c5a909e6~8VB8I7oLn1135711357epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656291255;
        bh=2bYDakazMhORhkpKFTLVwtVSU0xMZ8gJSY96tOj7Txc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ql74zXfqpiygPdtvwZ275Qk5/Z71oH/AKYoMbmaOBHXEQ/x3RN/K7HAnEyvy0+SOY
         XNF6z/l7uZm45kEcUE6RUvo1qhL3tVmBSTRAhE6w51iqkseeipYnAhc6qDdJIPDeob
         MzXaLs/bfSzsGZUuxyiwoQA7pdEgbEqhyhVfJoKU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220627005414epcas2p4020ed7367d60c7ddf8b0208169e904f8~8VB7YBobn2680726807epcas2p42;
        Mon, 27 Jun 2022 00:54:14 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LWTkt0T3cz4x9Pw; Mon, 27 Jun
        2022 00:54:14 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        19.98.09642.5BFF8B26; Mon, 27 Jun 2022 09:54:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3~8VB6YdliU1318313183epcas2p3o;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220627005413epsmtrp2db1c1f99a597cda3b78e937c41d9f91a~8VB6W10lm0577205772epsmtrp2J;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
X-AuditID: b6c32a47-5e1ff700000025aa-05-62b8ffb5edf6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        72.3E.08905.5BFF8B26; Mon, 27 Jun 2022 09:54:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220627005413epsmtip256a2715c101eb3a0c6c8c2f559450d6d~8VB6JEL-Z1506915069epsmtip2Z;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 2/3] clk: samsung: exynosautov9: add missing gate clks for
 peric0/c1
Date:   Mon, 27 Jun 2022 09:52:09 +0900
Message-Id: <20220627005210.6473-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627005210.6473-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmhe7W/zuSDA48t7J4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hisWrXH0YHPo/3N1rZPXbOusvusWlVJ5vHnWt72Dw2L6n36NuyitHj8ya5APaobJuM1MSU
        1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoIOVFMoSc0qBQgGJ
        xcVK+nY2RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZE76tYCq4
        x1ux7N5B5gbGi9xdjJwcEgImEnsb7zN1MXJxCAnsYJToXjeHHcL5xCjx58ofVgjnG6PEobMg
        GYiWg1OnMoLYQgJ7GSUOPM6EsD8ySqxozQGx2QR0JbY8f8UI0iwi8JhJ4vCRNjaQBLPADUaJ
        w1uZQWxhgTCJBc93gw1iEVCVOHZ3KVgNr4CtxLtpO1khlslLbJjfC1TPwcEpYCfRNEsGokRQ
        4uTMJywQI+UlmrfOZgbZJSGwkkPi7NmZzBC9LhJ35r+FsoUlXh3fAvWAlMTnd3vZIOxiiaWz
        PjFBNDcwSlze9gsqYSwx61k7I8hiZgFNifW79EFMCQFliSO3oPbySXQc/ssOEeaV6GgTgmhU
        lziwfToLhC0r0T3nM9QnHhITWx5BA3cio8S0w5eZJzAqzELyziwk78xCWLyAkXkVo1hqQXFu
        emqxUYExPIKT83M3MYLTr5b7DsYZbz/oHWJk4mA8xCjBwawkwvv6+tYkId6UxMqq1KL8+KLS
        nNTiQ4ymwLCeyCwlmpwPzAB5JfGGJpYGJmZmhuZGpgbmSuK8XikbEoUE0hNLUrNTUwtSi2D6
        mDg4pRqYDnYvmJPU/XHKPdcbraLlc34/WfZRPMrbWkiwbLvAXrXttjrr3siKL1nVwPf5iWd/
        5lvF0PhuGX6V2CCL2YsDf2V2bZPedyOj2lt68pXqOBvh1YeTJ19mOvblPEvze869005svPO1
        2YZdTUmwaj9/SWOnhLOwIcdm2ze5S7Za/Jp1INamWL8mM+mCz7VUg8enHZT7hJ8enCLvvqFY
        4fe3Z+Uyd/T93J+F/mPbaPG3kdU0nuUdN9dX4VqDTY3J3M6itp/zLdbc23/ZaUnr9ysfomdx
        f02/1bPfXeBpGVOcPB/bOe4/zneW8LrP1D9m/lH8kLbY9OdnZ6/euWz+BVV9f8bXn5h3Vqrm
        /fJvYZNUYinOSDTUYi4qTgQAQfTrrEgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsWy7bCSvO7W/zuSDE7P5bN4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hisWrXH0YHPo/3N1rZPXbOusvusWlVJ5vHnWt72Dw2L6n36NuyitHj8ya5APYoLpuU1JzM
        stQifbsErowJ31YwFdzjrVh27yBzA+NF7i5GTg4JAROJg1OnMnYxcnEICexmlFh67yUjREJW
        4tm7HewQtrDE/ZYjrBBF7xklFrdcBytiE9CV2PL8FVi3iMBzJokpKw6COcwCdxglpsyezQRS
        JSwQIvGu9QjYKBYBVYljd5eygdi8ArYS76btZIVYIS+xYX4vcxcjBwengJ1E0ywZEFMIqGTv
        sxyIakGJkzOfsIDYzEDVzVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwLDvNRyveLE3OLS
        vHS95PzcTYzgWNHS3MG4fdUHvUOMTByMhxglOJiVRHhfX9+aJMSbklhZlVqUH19UmpNafIhR
        moNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwenVAOTV5uHyPbPJ5jzqgw+/RV6zFZ/49Hd/lLW
        DHXT/1+vneG1/6Zb2aAkp/du4fqnObO4JSNqSp5cy1iofvOP+j9JdqUPlnn7t3zkDj357OZp
        DkWf73XdOT3Gt5VfSVVOuVQjpW3D/i75r5T5Xi9mj5V+p68UBu/Rmcq3WPSaZdzpOWkuXode
        zSiOv17fuvJJs2Sn7vNyV3OLDSyNRsvWzDrwZkvJ9S1e5WZ+BxWXKm4pKt44o7pv/8Xyw6nB
        e/5M/SYvy2j1cEbW1P9u5sZmwvt4WBzK/54U5vxUUm+4ZaKEpeHd4vI//MLK0SfyLO8vdCrv
        qd+svKJyFmdtWZFCxpe/0/0m6VvpZCV+2OVhHaTEUpyRaKjFXFScCAAg8tqPBAMAAA==
X-CMS-MailID: 20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3
References: <20220627005210.6473-1-chanho61.park@samsung.com>
        <CGME20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to peric0
and peric1 respectively.

Fixes: f2dd366992d0 ("clk: samsung: exynosautov9: add cmu_peric0 clock support")
Fixes: b35f27fe73d8 ("clk: samsung: exynosautov9: add cmu_peric1 clock support")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index d9e1f8e4a7b4..c5a4e1bee711 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1330,6 +1330,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_1, "gout_peric0_pclk_1",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC0_PCLK_2, "gout_peric0_pclk_2",
 	     "mout_peric0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
@@ -1581,6 +1585,10 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 	     "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_PCLK_1, "gout_peric1_pclk_1",
+	     "mout_peric1_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIC1_PCLK_2, "gout_peric1_pclk_2",
 	     "mout_peric1_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,
-- 
2.36.1

