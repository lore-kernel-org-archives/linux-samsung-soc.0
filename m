Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2629ACCA485
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Jun 2022 10:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344142AbiF1KoI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 06:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345045AbiF1KoD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 06:44:03 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC03231504
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 03:43:55 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220628104350epoutp01b82eaacc3006509641740780be4d0409~8wt-6b10q0979209792epoutp011
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 10:43:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220628104350epoutp01b82eaacc3006509641740780be4d0409~8wt-6b10q0979209792epoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656413030;
        bh=oh726WCvjS8AIcBLdFNqBAzXa7f6s1csNe98ULBAajY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t8qxVt7exc6ECr49Q3yko5KXfY11W9Tw0DbDkESK/MseKjzP8PweH5AI5LQ4N+Gc5
         tCkRA5HnGaP5LMK8Snkc0kJ5kKyukY83lyCodNNfb9dXSM5VC/IjxarQFQr1f/mxco
         uOVz3A9/NEdxrt1MbhVmeXPdKZ/LLh1g70pF59/g=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220628104348epcas2p16f259fcb2635ac1bc28a013e3b30d0fc~8wt_iSDnz2715027150epcas2p18;
        Tue, 28 Jun 2022 10:43:48 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.89]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LXLmh2bNJz4x9Pv; Tue, 28 Jun
        2022 10:43:48 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        10.5C.09662.46BDAB26; Tue, 28 Jun 2022 19:43:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220628104347epcas2p3cc1c9c7b17a449814fc2596f00052985~8wt9IjjIZ0735507355epcas2p3d;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220628104347epsmtrp151f0ce998b28da2bbdfceab176709be2~8wt9HeKnb0757407574epsmtrp1y;
        Tue, 28 Jun 2022 10:43:47 +0000 (GMT)
X-AuditID: b6c32a48-9e1ff700000025be-c1-62badb64cc33
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B8.58.08802.36BDAB26; Tue, 28 Jun 2022 19:43:47 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220628104346epsmtip1fe3a349f54b102974e2b500009fb6188~8wt87oE4T1977719777epsmtip1E;
        Tue, 28 Jun 2022 10:43:46 +0000 (GMT)
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
Subject: [PATCH v2 1/3] dt-bindings: clock: exynosautov9: correct clock
 numbering of peric0/c1
Date:   Tue, 28 Jun 2022 19:41:36 +0900
Message-Id: <20220628104138.152118-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628104138.152118-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmqW7K7V1JBlOXCVo8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbbHp8jdXiY889VosZ5/cxWVw85WrRuvcIu8XhN+2sFv+u
        bWSxWLXrD6MDn8f7G63sHjtn3WX32LSqk83jzrU9bB6bl9R79G1ZxejxeZNcAHtUtk1GamJK
        apFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0MFKCmWJOaVAoYDE
        4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMGV3NLAWd
        khXftnxgbWA8I9rFyMkhIWAisXjrJ6YuRi4OIYEdjBJnexdBOZ8YJd5uX8kO4XxmlHgwax87
        TMvzd8sZIRK7GCXurDoAVfWRUWJWTy8bSBWbgK7EluevwKpEBB4zSRw+0gaWYBa4wShxeCsz
        iC0skCAxeeoPIJuDg0VAVWJ3NwtImFfAXuLi0g4WiG3yEhvm94KVcAo4SOzc4wFRIihxcuYT
        FoiJ8hLNW2czQ5Qv5ZBou1kNYbtIfLg+gw3CFpZ4dXwL1ANSEi/726DsYomlsyD+lxBoYJS4
        vO0XVIOxxKxn7Ywge5kFNCXW79IHMSUElCWO3IJayyfRcfgvO0SYV6KjTQiiUV3iwPbpUMfL
        SnTP+cwKYXtIXN69BxpSkxklvs//yTqBUWEWkm9mIflmFsLiBYzMqxjFUguKc9NTi40KTOAR
        nJyfu4kRnH61PHYwzn77Qe8QIxMH4yFGCQ5mJRHehWd2JgnxpiRWVqUW5ccXleakFh9iNAWG
        9ERmKdHkfGAGyCuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKanZpakFoE08fEwSnVwFTk
        dSni5tr7L2XZxNfPXB/2snHqyQcrnx3ZsNJJ/7h5yVOlhVOmsfVp2bqnuCz79Dnaft6OQlfp
        p0d72L/9MufeY3V414pQ4foLHrsvTFzqetVo2v6UZ2e2is1cs+KxqFTwbl0tliTHrbY8t3d0
        NzTPOz5db2rH5MNrNTiT3z1v8xTIN64xWhpStUZqdb5Pb95l1Qv3l235bub4QGXzVsFLTS/a
        lzu83dqxvLD8lHPy+09TfF0LFvim/ogVMSnuqljqlp9TP+fBK2HeaZPcuC6lpPdwuHCvStzB
        1Dyn0/j2yscPGS+/lzqTw68/4W1A3T/v6b33uxNZZD8LSt/gY2393tefqtT6cHLNg5U8GyKU
        WIozEg21mIuKEwH8RNxQSAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsWy7bCSnG7y7V1JBt2v2C0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYrNr1h9GBz+P9jVZ2j52z7rJ7bFrVyeZx59oeNo/NS+o9+rasYvT4vEkugD2KyyYlNSez
        LLVI3y6BK2NGVzNLQadkxbctH1gbGM+IdjFyckgImEg8f7ecsYuRi0NIYAejxLxL89ggErIS
        z97tYIewhSXutxxhhSh6zygxceEesCI2AV2JLc9fgXWLCDxnkpiy4iCYwyxwh1FiyuzZTCBV
        wgJxEn8nHgRq5+BgEVCV2N3NAhLmFbCXuLi0gwVig7zEhvm9zCAlnAIOEjv3eICYQkAlh79l
        QFQLSpyc+QSsmhmounnrbOYJjAKzkKRmIUktYGRaxSiZWlCcm55bbFhglJdarlecmFtcmpeu
        l5yfu4kRHClaWjsY96z6oHeIkYmD8RCjBAezkgjvwjM7k4R4UxIrq1KL8uOLSnNSiw8xSnOw
        KInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpg6mFoSLRZtXB2zy0XpsPyuqyHjNS9pV9cr+Bs
        da7ZmKGQ/531sWdS/7E7SfJ/3xfYZv6dN/uXhgXXC9O9X/m3yT9lPiGb8yf8zqxbTjO7J2dc
        io+qKPVaLbxMrZwlT0xHpMAue4F55LMrSQnzbcRfNmXqRN5f3BzxOeJb179I/SsbGD+LMYcr
        Bb133Pn/1GnuFz/Os9tMtJr6fAGPptXGPTMfGApdf+XyZhb7lB2r1jXGxhwOjl+3dxcjU3LJ
        PA0rjh6//5OeBopv4XCyOXR81epHZqErmf2kY+sizr28ofnocjLL1NPzPi+SMxM+O1NFeJ1f
        h3PLXLn/mVquy05IvT4kkN70dUNctG/lVEtdJZbijERDLeai4kQAvn3vRQMDAAA=
X-CMS-MailID: 20220628104347epcas2p3cc1c9c7b17a449814fc2596f00052985
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220628104347epcas2p3cc1c9c7b17a449814fc2596f00052985
References: <20220628104138.152118-1-chanho61.park@samsung.com>
        <CGME20220628104347epcas2p3cc1c9c7b17a449814fc2596f00052985@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There are duplicated definitions of peric0 and peric1 cmu blocks. Thus,
they should be defined correctly as numerical order.

Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index ea9f91b4eb1a..a7db6516593f 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -226,21 +226,21 @@
 #define CLK_GOUT_PERIC0_IPCLK_8		28
 #define CLK_GOUT_PERIC0_IPCLK_9		29
 #define CLK_GOUT_PERIC0_IPCLK_10	30
-#define CLK_GOUT_PERIC0_IPCLK_11	30
-#define CLK_GOUT_PERIC0_PCLK_0		31
-#define CLK_GOUT_PERIC0_PCLK_1		32
-#define CLK_GOUT_PERIC0_PCLK_2		33
-#define CLK_GOUT_PERIC0_PCLK_3		34
-#define CLK_GOUT_PERIC0_PCLK_4		35
-#define CLK_GOUT_PERIC0_PCLK_5		36
-#define CLK_GOUT_PERIC0_PCLK_6		37
-#define CLK_GOUT_PERIC0_PCLK_7		38
-#define CLK_GOUT_PERIC0_PCLK_8		39
-#define CLK_GOUT_PERIC0_PCLK_9		40
-#define CLK_GOUT_PERIC0_PCLK_10		41
-#define CLK_GOUT_PERIC0_PCLK_11		42
+#define CLK_GOUT_PERIC0_IPCLK_11	31
+#define CLK_GOUT_PERIC0_PCLK_0		32
+#define CLK_GOUT_PERIC0_PCLK_1		33
+#define CLK_GOUT_PERIC0_PCLK_2		34
+#define CLK_GOUT_PERIC0_PCLK_3		35
+#define CLK_GOUT_PERIC0_PCLK_4		36
+#define CLK_GOUT_PERIC0_PCLK_5		37
+#define CLK_GOUT_PERIC0_PCLK_6		38
+#define CLK_GOUT_PERIC0_PCLK_7		39
+#define CLK_GOUT_PERIC0_PCLK_8		40
+#define CLK_GOUT_PERIC0_PCLK_9		41
+#define CLK_GOUT_PERIC0_PCLK_10		42
+#define CLK_GOUT_PERIC0_PCLK_11		43
 
-#define PERIC0_NR_CLK			43
+#define PERIC0_NR_CLK			44
 
 /* CMU_PERIC1 */
 #define CLK_MOUT_PERIC1_BUS_USER	1
@@ -272,21 +272,21 @@
 #define CLK_GOUT_PERIC1_IPCLK_8		28
 #define CLK_GOUT_PERIC1_IPCLK_9		29
 #define CLK_GOUT_PERIC1_IPCLK_10	30
-#define CLK_GOUT_PERIC1_IPCLK_11	30
-#define CLK_GOUT_PERIC1_PCLK_0		31
-#define CLK_GOUT_PERIC1_PCLK_1		32
-#define CLK_GOUT_PERIC1_PCLK_2		33
-#define CLK_GOUT_PERIC1_PCLK_3		34
-#define CLK_GOUT_PERIC1_PCLK_4		35
-#define CLK_GOUT_PERIC1_PCLK_5		36
-#define CLK_GOUT_PERIC1_PCLK_6		37
-#define CLK_GOUT_PERIC1_PCLK_7		38
-#define CLK_GOUT_PERIC1_PCLK_8		39
-#define CLK_GOUT_PERIC1_PCLK_9		40
-#define CLK_GOUT_PERIC1_PCLK_10		41
-#define CLK_GOUT_PERIC1_PCLK_11		42
+#define CLK_GOUT_PERIC1_IPCLK_11	31
+#define CLK_GOUT_PERIC1_PCLK_0		32
+#define CLK_GOUT_PERIC1_PCLK_1		33
+#define CLK_GOUT_PERIC1_PCLK_2		34
+#define CLK_GOUT_PERIC1_PCLK_3		35
+#define CLK_GOUT_PERIC1_PCLK_4		36
+#define CLK_GOUT_PERIC1_PCLK_5		37
+#define CLK_GOUT_PERIC1_PCLK_6		38
+#define CLK_GOUT_PERIC1_PCLK_7		39
+#define CLK_GOUT_PERIC1_PCLK_8		40
+#define CLK_GOUT_PERIC1_PCLK_9		41
+#define CLK_GOUT_PERIC1_PCLK_10		42
+#define CLK_GOUT_PERIC1_PCLK_11		43
 
-#define PERIC1_NR_CLK			43
+#define PERIC1_NR_CLK			44
 
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER		1
-- 
2.36.1

