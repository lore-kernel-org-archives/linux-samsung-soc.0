Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E994CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 00:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiF0Ay0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Jun 2022 20:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiF0AyY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 20:54:24 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516792BFA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 17:54:17 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220627005414epoutp037747182dda1230ec50ca5a76b7e37380~8VB74240j1135711357epoutp03A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 00:54:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220627005414epoutp037747182dda1230ec50ca5a76b7e37380~8VB74240j1135711357epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656291255;
        bh=2EWk4jmoQTQKtcHTg9SONlILwJ3HOWUht6CxvpuD0mY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K2tkNutBmuLIaj7zPg48+VU7IX/BXKfZmFLHKUx7SclrABDVBcT7rKXD3P2Icd8Tz
         QPaQRW4iZqglgfexAq2UqMzVfJGu8SEH5i/lWuuqNUWyeh8tBJWTQdmYrHyS+rCaVG
         2cA8QcnA554aYEsM20hHXqLHqgEbQnEbPj2dJj+Q=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220627005414epcas2p189128443f1165df1352c307c4462c418~8VB7NJ_Vn3200032000epcas2p15;
        Mon, 27 Jun 2022 00:54:14 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LWTks6bcsz4x9Pv; Mon, 27 Jun
        2022 00:54:13 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        AB.F8.09662.5BFF8B26; Mon, 27 Jun 2022 09:54:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220627005413epcas2p452229025b91f81ac86a4ddd403c64765~8VB6datr52680726807epcas2p41;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220627005413epsmtrp24a162fe1eb4a3052561c76acee0caaab~8VB6cWJOQ0577205772epsmtrp2K;
        Mon, 27 Jun 2022 00:54:13 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-fd-62b8ffb5459e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7A.1A.08802.5BFF8B26; Mon, 27 Jun 2022 09:54:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220627005413epsmtip262bbffe8b0f31949cd8b1ef539aa35d6~8VB6OsdLV1517115171epsmtip2f;
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
Subject: [PATCH 3/3] clk: samsung: exynosautov9: correct register offsets of
 peric0/c1
Date:   Mon, 27 Jun 2022 09:52:10 +0900
Message-Id: <20220627005210.6473-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627005210.6473-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmue7W/zuSDN70mFo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHtUtk1GamJK
        apFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0MFKCmWJOaVAoYDE
        4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMJxvLCy7I
        Vyy4OpmtgXG+bBcjJ4eEgInEjmnvWboYuTiEBHYwSvyd0ccG4XxilLi07hFU5jOjRNPBV+ww
        LVNP/WCHSOxilPh69zETSEJI4COjRM/jHBCbTUBXYsvzV4wgRSICj5kkDh9pYwNJMAvcYJQ4
        vJUZxBYWiJBYtr4JLM4ioCqxdkc30CAODl4BW4k/a5khlslLbJjfywwS5hSwk2iaJQMS5hUQ
        lDg58wkLxER5ieats5lBVkkIrOSQuLx+EiNEr4vEpBmroI4Wlnh1fAuULSXx+d1eNgi7WGLp
        rE9MEM0NjBKXt/2CShhLzHrWzgiymFlAU2L9Ln0QU0JAWeLILai9fBIdh/+yQ4R5JTrahCAa
        1SUObJ/OAmHLSnTP+cwKYXtILFk8iRESbBMZJR7vP846gVFhFpJ3ZiF5ZxbC4gWMzKsYxVIL
        inPTU4uNCkzg8Zucn7uJEZx8tTx2MM5++0HvECMTB+MhRgkOZiUR3tfXtyYJ8aYkVlalFuXH
        F5XmpBYfYjQFBvVEZinR5Hxg+s8riTc0sTQwMTMzNDcyNTBXEuf1StmQKCSQnliSmp2aWpBa
        BNPHxMEp1cDEbhsp1Hr4q3FTsoqflOeFNbNdtV9O9jOWM1u06bbJ02LlmOm71xU9PrNQ7PjW
        ZuWUHx3Bn00C1J9NybxdrGac+nZfbe7Ro29b0sR4X/1YU9xyrlmx4ZauwBrZlW9Oe19pPR6v
        N/nq3seJdnXcz0yM0t9OvPfrxFHfaQqu4aqN580zvSwiwxaaPJDn09jv6HNZc9njrJc/iq7Y
        s05dc+rB07+6FmJOzXPXZLmwd8qWn0udOt3LfuL7lJ/2os1REwqqp0szf3BK4apPNW+YnbVo
        olRGZXx+58KnX3f4WIoEVX8NXrntzsOrkUc/eSzlnFuo//TNp7wDNdWPj+RvbJBT/8zz2PPP
        T6481QkPHCWVWIozEg21mIuKEwFqB6feRwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsWy7bCSvO7W/zuSDC6dFLZ4MG8bm8Xl/doW
        1788Z7WYf+Qcq0Xfi4fMFntfb2W32PT4GqvFx557rBYzzu9jsrh4ytWide8RdovDb9pZLf5d
        28hisWrXH0YHPo/3N1rZPXbOusvusWlVJ5vHnWt72Dw2L6n36NuyitHj8ya5APYoLpuU1JzM
        stQifbsErownG8sLLshXLLg6ma2Bcb5sFyMnh4SAicTUUz/Yuxi5OIQEdjBKLLnbyQ6RkJV4
        9m4HlC0scb/lCCtE0XtGiblbfjGDJNgEdCW2PH/FCJIQEXjOJDFlxUEwh1ngDqPElNmzmUCq
        hAXCJG78ncUKYrMIqEqs3dENFOfg4BWwlfizlhlig7zEhvm9zCBhTgE7iaZZMiCmEFDF3mc5
        IBW8AoISJ2c+YQGxmYGqm7fOZp7AKDALSWoWktQCRqZVjJKpBcW56bnFhgVGeanlesWJucWl
        eel6yfm5mxjBcaKltYNxz6oPeocYmTgYDzFKcDArifC+vr41SYg3JbGyKrUoP76oNCe1+BCj
        NAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQYmxaM8cxis8g/wBC7QvR4rseTyvoCsrekG
        J35pi019rj730CyDd+uyxbYwMhmGbnxqsHmb+01hwwvt27MLpc3aJc5JFXcuEBV/+zQy5OXM
        bXcP/W/5K7T52/eLaz3N0vKeL699mXb15omHFw/lLfQv2cY6+7pldYCU7dkJy3V+ec2oKr4o
        UpXPWJVa1zF3/c5NZ0XuxvD5sN3l/rVswWtnqZNvvEIWXue6GPldUSQ3R+B5bHiXBs/qXJet
        cx0ksvxND94qlf3F6syzYZVGLm92u8aSjG/Fbr4T2059N3kntbVIu3b5z9VrYmVnFfGnnGtd
        dqYv/IJXdcbrD7N0dJtjzL6/nFryi3Prx4t3njDuU2Ipzkg01GIuKk4EAJfvEMgCAwAA
X-CMS-MailID: 20220627005413epcas2p452229025b91f81ac86a4ddd403c64765
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627005413epcas2p452229025b91f81ac86a4ddd403c64765
References: <20220627005210.6473-1-chanho61.park@samsung.com>
        <CGME20220627005413epcas2p452229025b91f81ac86a4ddd403c64765@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some register offsets of peric0 and peric1 cmu blocks need to be
corrected and re-ordered by numerical order.

Fixes: f2dd366992d0 ("clk: samsung: exynosautov9: add cmu_peric0 clock support")
Fixes: b35f27fe73d8 ("clk: samsung: exynosautov9: add cmu_peric1 clock support")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index c5a4e1bee711..76c4841f2970 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1170,9 +1170,9 @@ static const struct samsung_cmu_info fsys2_cmu_info __initconst = {
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2	0x2058
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3	0x205c
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4	0x2060
-#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5	0x2064
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6	0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8	0x2070
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9	0x2074
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10	0x204c
@@ -1422,14 +1422,14 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11	0x2020
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0	0x2044
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1	0x2048
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2	0x2058
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3	0x205c
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4	0x2060
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7	0x206c
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5	0x2064
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6	0x2068
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8	0x2070
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9	0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2	0x2054
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3	0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4	0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5	0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6	0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7	0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8	0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9	0x2070
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10	0x204c
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11	0x2050
 
@@ -1467,9 +1467,9 @@ static const unsigned long peric1_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4,
-	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10,
-- 
2.36.1

