Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE098CCA480
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 10:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344062AbiF1KoG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 06:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343909AbiF1Kn7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 06:43:59 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7570E313A8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 03:43:54 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220628104348epoutp044e1c7d232b55aa0f7c21c7ac1df4853d~8wt_yRYiE2527525275epoutp046
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 10:43:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220628104348epoutp044e1c7d232b55aa0f7c21c7ac1df4853d~8wt_yRYiE2527525275epoutp046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656413029;
        bh=mGTW5Nc9Mvj5nOYp8hSbnY4sxqFaSbbpPdoMvKHF0Uk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bTAKgeOmnJOmN24+s3pYE76bWci1EKCCpEoURa4kmsU2IcX43abm96c58J+0vaM/l
         CPqr9jW9HH4C+FJfkN7nTz35No3I8HGJAuG+5Cvhg7iw2AZhKyhn/b1jl023u02yRx
         jjl1b7ATi0mal6y719/5kkPOOx55GS66fdHCzCvo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220628104348epcas2p2895cef4e1ba9f962bd510efc4b30613b~8wt_NxOAG1795617956epcas2p2A;
        Tue, 28 Jun 2022 10:43:48 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.69]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LXLmh0MFZz4x9Px; Tue, 28 Jun
        2022 10:43:48 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.BF.09650.36BDAB26; Tue, 28 Jun 2022 19:43:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220628104347epcas2p4502a4524de0c98ababe8cab4b7b73c3f~8wt9SWtxo1212012120epcas2p4h;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220628104347epsmtrp2f9c9b9f9bb9b1281ec9ee669c34a6bfe~8wt9P6kSC0697306973epsmtrp2O;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
X-AuditID: b6c32a46-0b9ff700000025b2-e9-62badb6397d1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3C.FC.08905.36BDAB26; Tue, 28 Jun 2022 19:43:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220628104347epsmtip162347e6292be6c487dff78b5cecc98e4~8wt9ANnQY1978119781epsmtip1C;
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
Subject: [PATCH v2 2/3] clk: samsung: exynosautov9: add missing gate clks
 for peric0/c1
Date:   Tue, 28 Jun 2022 19:41:37 +0900
Message-Id: <20220628104138.152118-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628104138.152118-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmmW7y7V1JBn/W21g8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHtUtk1GamJK
        apFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0MFKCmWJOaVAoYDE
        4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMptlPGQt2
        8VSser+YsYHxIFcXIyeHhICJxMolc5i7GLk4hAR2MErMe/mRBcL5xChx89UWJgjnG6PEsp41
        7DAtWye/YYdI7GWUaPrbwQrhfGSU+DdlJxNIFZuArsSW568YQRIiAo+ZJA4faWMDSTAL3GCU
        OLyVGcQWFoiUmL/uCthYFgFViX09f8BsXgF7iUe710Otk5fYML8XqJ6Dg1PAQWLnHg+IEkGJ
        kzOfsECMlJdo3job7AkJgaUcErNv/WSC6HWReL75JQuELSzx6vgWqJlSEp/f7WWDsIslls76
        xATR3MAocXnbL6iEscSsZ+2MIIuZBTQl1u/SBzElBJQljtyC2ssn0XH4LztEmFeio00IolFd
        4sD26VBbZSW653xmhbA9JE5N7YMG3GRGiSvnp7FPYFSYheSdWUjemYWweAEj8ypGsdSC4tz0
        1GKjAiN4FCfn525iBKdgLbcdjFPeftA7xMjEwXiIUYKDWUmEd+GZnUlCvCmJlVWpRfnxRaU5
        qcWHGE2BYT2RWUo0OR+YBfJK4g1NLA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqemFqQWwfQx
        cXBKNTBdvOdj5Gy1SaP/SMOpZwtbZJaUlkUqrHWd2/XnmOSX3+L9m5o+/uXWVfZ3iDgyjc3V
        drtd2rlp4Z+n6YRX/0z/nuPgrrV83z2x509cxe9OP8KTdPdnj7U3V4Pi8phnW6UvndE+PeG/
        friwbO6ZdbdXOi52YzP/Mt0mflkMP9uDDb8PqVdf/dWxZrca29xNWu9XavOJ/8w7EtgePqHY
        q3Xeu7jaOdvblTqE4+pafz1//Fn78q1/4TsfL2vbt0k8fGmMqvp8j56yoxN3L9m3YNs3vVst
        Lf95jr38d948JJ8p+0LXlFPCCfkn2zKLZ23imS73ffmvBbLJyhsq9p2x5rg2s3xKyZV1h+co
        rfEN72R7qMRSnJFoqMVcVJwIAMkMLDtKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsWy7bCSnG7y7V1JBq97eCwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYrNr1h9GBz+P9jVZ2j52z7rJ7bFrVyeZx59oeNo/NS+o9+rasYvT4vEkugD2KyyYlNSez
        LLVI3y6BK6Np9lPGgl08FaveL2ZsYDzI1cXIySEhYCKxdfIbdhBbSGA3o8T6oxIQcVmJZ+92
        sEPYwhL3W46wdjFyAdW8Z5RY+qYJLMEmoCux5fkrRpCEiMBzJokpKw6COcwCdxglpsyezQRS
        JSwQLrFy7Swwm0VAVWJfzx+wbl4Be4lHu9dDrZCX2DC/l7mLkYODU8BBYuceDxBTCKjk8LcM
        iGpBiZMzn7CA2MxA1c1bZzNPYBSYhSQ1C0lqASPTKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0
        veT83E2M4EjR0tzBuH3VB71DjEwcjIcYJTiYlUR4F57ZmSTEm5JYWZValB9fVJqTWnyIUZqD
        RUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QD085zNUVfX1QGnllY0qVwyrl27ff+bQ9OSZ/J
        Zeg9mRd7Zkvy08c7Sn9EJ4iGPQxJss3qLr3slfRM++GjbKdvyjcf3xP1/Tr95w272ZdOPj52
        X7hSZ/Gkr4UsZav1Pth8ci7cfP9vwYWUs4Yznb3OmB49JS9rM7/kVZzqorOa/Du2Gl+Kl+ve
        mRSSo/DEbrb26x92JmpazN+bH1aWKryaFVW7xn7ynj25zx2OPtshenazzd7Znd2FhtGaMc5t
        MbGnt6386pbs0se4g00oI8L46ful4mWRdjMXHcpf6Fi/T5nXw7bsaGyaUdbEO3IFEuL7vwfl
        rD2602Fb8tey79eiWyYn/jfqnmggvlpCULZ/ghJLcUaioRZzUXEiAAzLOQ8DAwAA
X-CMS-MailID: 20220628104347epcas2p4502a4524de0c98ababe8cab4b7b73c3f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220628104347epcas2p4502a4524de0c98ababe8cab4b7b73c3f
References: <20220628104138.152118-1-chanho61.park@samsung.com>
        <CGME20220628104347epcas2p4502a4524de0c98ababe8cab4b7b73c3f@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to peric0
and peric1 respectively.

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

