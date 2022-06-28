Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5E9C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 10:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344182AbiF1KoJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 06:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345027AbiF1KoD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 06:44:03 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF24313BE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 03:43:55 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220628104349epoutp0107d09847614a6a26c5ec9caa57c95dd7~8wt_5EaPs1118511185epoutp01k
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 10:43:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220628104349epoutp0107d09847614a6a26c5ec9caa57c95dd7~8wt_5EaPs1118511185epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656413029;
        bh=YFv9lgcSRhso3kr6bQpndwLFpoYghZyYPb5zfEzZU3Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iTqwRq4YbhPd4p1lcfBIDI9Cc3eWwV5oTwA+axWVHVTLqdPrnKcJChGJy5XF1sov9
         Y9NxLba+tdLpOifLow9IMMHb7eKC+0rjNXyt8maLTYaI2TiI38siX6xTwc9qrOohUu
         Qwax1da7kwo15mAAyehIYZJHYtcUVkYKRdHCbt+A=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220628104348epcas2p3df730ae7f721cfa13494efcda477ca07~8wt_Tcdye1967919679epcas2p3d;
        Tue, 28 Jun 2022 10:43:48 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.88]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LXLmh0hy1z4x9Pt; Tue, 28 Jun
        2022 10:43:48 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        02.4E.09666.36BDAB26; Tue, 28 Jun 2022 19:43:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220628104347epcas2p48a7fe482ad82004c145fcf90e32eaec6~8wt9QALo00845308453epcas2p4C;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220628104347epsmtrp26dcf56f1ac0cf38b7fb405c7ffe3b0e6~8wt9PGYR40643306433epsmtrp2L;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
X-AuditID: b6c32a45-471ff700000025c2-78-62badb632e06
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D9.58.08802.36BDAB26; Tue, 28 Jun 2022 19:43:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220628104347epsmtip1c15e98d815f99ab2a106b37ac1470550~8wt9EuAL01977719777epsmtip1F;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
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
Subject: [PATCH v2 3/3] clk: samsung: exynosautov9: correct register offsets
 of peric0/c1
Date:   Tue, 28 Jun 2022 19:41:38 +0900
Message-Id: <20220628104138.152118-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628104138.152118-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmuW7K7V1JBnvfMVo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHtUtk1GamJK
        apFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0MFKCmWJOaVAoYDE
        4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMw4u7GAsm
        K1R8P7CCqYHxrmwXIyeHhICJxPkV/1m7GLk4hAR2MEoc3b6IHcL5xCjxdPE0qMxnRok1iy8x
        wrQceT+dDSKxi1Fi7pmfUFUfGSXenJzCBFLFJqArseX5K0aQhIjAYyaJw0fa2EASzAI3GCUO
        b2UGsYUFoiV+nJ4N1sAioCpx9/ZCFhCbV8Be4s6S38wQ6+QlNszvBbI5ODgFHCR27vGAKBGU
        ODnzCQvESHmJ5q2zmUF2SQis5JDYvWgO1KkuEp+fHGODsIUlXh3fwg5hS0l8frcXKl4ssXTW
        JyaI5gZGicvbfkEljCVmPWtnBFnMLKApsX6XPogpIaAsceQW1F4+iY7Df9khwrwSHW1CEI3q
        Ege2T2eBsGUluud8ZoWwPSTeNhxigYTVZGDAdT9jmcCoMAvJO7OQvDMLYfECRuZVjGKpBcW5
        6anFRgWG8ChOzs/dxAhOwVquOxgnv/2gd4iRiYPxEKMEB7OSCO/CMzuThHhTEiurUovy44tK
        c1KLDzGaAsN6IrOUaHI+MAvklcQbmlgamJiZGZobmRqYK4nzeqVsSBQSSE8sSc1OTS1ILYLp
        Y+LglGpgqtQx8n5b/uEqb+yHtB4djm1KevuvLTLI10w+yHIxIaY0iClIpjF5QbHkXgPeYyXT
        Jq2vDErLVt0a6/Dk0L3nhwqcoz4rpe4qTPzrmRQ08aVCbbte2KnMeL9rvB/mZDoLHLj0cPqv
        +cbmD0XfLXpstnF7yLPtNawLj0d8WqB0tPdmZIDxHXddBn8rz9dVVz9sNGNRnzG5hMP/uaZf
        yVP1mJUntn2JKur90Lm8P5Ez44ePzBGrOV/bjxwqlwrmLuX5xazq9616P1+mwdONVQyuHN0B
        PP8MGj+Fp312vrBjx9azoWprKh6ZlJfwyIVszz/3XPAk7xKf/5eu8YvM+h7+/NrVN1etbx6Y
        rdDC5OikxFKckWioxVxUnAgA+p/DakoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsWy7bCSnG7y7V1JBl/vCFg8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHsUl01Kak5m
        WWqRvl0CV8bhxV2MBZMVKr4fWMHUwHhXtouRk0NCwETiyPvpbF2MXBxCAjsYJe793cAEkZCV
        ePZuBzuELSxxv+UIK0TRe0aJa/s7WUESbAK6Eluev2IESYgIPGeSmLLiIJjDLHCHUWLK7Nlg
        o4QFIiV273vNCGKzCKhK3L29kAXE5hWwl7iz5DczxAp5iQ3ze4FsDg5OAQeJnXs8QEwhoJLD
        3zIgqgUlTs58AtbJDFTdvHU28wRGgVlIUrOQpBYwMq1ilEwtKM5Nzy02LDDKSy3XK07MLS7N
        S9dLzs/dxAiOFS2tHYx7Vn3QO8TIxMF4iFGCg1lJhHfhmZ1JQrwpiZVVqUX58UWlOanFhxil
        OViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTCtm5RuyMvYKbQvpPNrQI718YIyBp1tW+6J
        dZ6ct1OGZb5VoI1Yq4iI4PF7pnMTrv0tfn7se4/iKYPpjx6vWfxil/uJ2fsr9Nd9jJ93XUZ1
        88Yp6tK6V6xeHZvmt+r5k4f/xVf8Wfx1FnupEk9jWfhLJ6GGjcGlmySiCp4pmq/kqIv95Gr2
        cuGHHSXfLc2NDvj12VXpMP3br+t/UtLpb8jmBMOEly7thXUl7y60Gn97L9i+rnuTyfxbcqxW
        /wT9OScweDX1l50QFjqnfqz5jh//zJV9rIqbNz7lux8pvYjXoiHroseey2si5F3VdnF72uzL
        Lr748qpffWLtROZA55O3WT1bOewYBapbXDqsZyixFGckGmoxFxUnAgDOBRsxBAMAAA==
X-CMS-MailID: 20220628104347epcas2p48a7fe482ad82004c145fcf90e32eaec6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220628104347epcas2p48a7fe482ad82004c145fcf90e32eaec6
References: <20220628104138.152118-1-chanho61.park@samsung.com>
        <CGME20220628104347epcas2p48a7fe482ad82004c145fcf90e32eaec6@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some register offsets of peric0 and peric1 cmu blocks need to be
corrected and re-ordered by numerical order.

Fixes: f2dd366992d0 ("clk: samsung: exynosautov9: add cmu_peric0 clock support")
Fixes: b35f27fe73d8 ("clk: samsung: exynosautov9: add cmu_peric1 clock support")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

