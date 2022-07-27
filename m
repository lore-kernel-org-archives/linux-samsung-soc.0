Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D519C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 02:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiG0CSc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240015AbiG0CS3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 22:18:29 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7583C8C9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:27 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220727021825epoutp032ae5f57ae7f3e2fe34944205486d034f~Fjh-uRUDc1624816248epoutp03B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 02:18:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220727021825epoutp032ae5f57ae7f3e2fe34944205486d034f~Fjh-uRUDc1624816248epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658888305;
        bh=ck3RfitAPpNNJJioRxPw37Pjc8mWVn8Q7LAJggBkf08=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YwL3CZuGDCo1doa4jsGvxKYRM2aG6jvc4HvSrkOECJ3yPPeWDa+NUlViUw2YQj8kb
         B7C72D9Ftqy/Lryir8WKoh/WO8vbFDPi/nouxCcrberCUn0BF+ChN3hU7isWrebsBo
         N48ulMhNbhWnm8s5+PXbzmkoNTyfIBMcSM+7wIAQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220727021824epcas2p1fc4b4b1f2c07b78aa3175cc0b745d510~Fjh-DzJ_W0147501475epcas2p1P;
        Wed, 27 Jul 2022 02:18:24 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.68]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LsyB83vk2z4x9Q6; Wed, 27 Jul
        2022 02:18:24 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        8E.21.09650.070A0E26; Wed, 27 Jul 2022 11:18:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220727021824epcas2p122d13c927fc8e3304b84aae2a9ca298d~Fjh_UJuJs0147401474epcas2p1P;
        Wed, 27 Jul 2022 02:18:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727021824epsmtrp1749d4036dd88b50c5c4eec01fc0ba283~Fjh_TX9X83129031290epsmtrp1K;
        Wed, 27 Jul 2022 02:18:24 +0000 (GMT)
X-AuditID: b6c32a46-0b9ff700000025b2-c4-62e0a07032f7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DD.E7.08802.F60A0E26; Wed, 27 Jul 2022 11:18:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727021823epsmtip16d6c8f5a32f2a9e505436543ddf3fb4e~Fjh_KgqGv2106921069epsmtip1j;
        Wed, 27 Jul 2022 02:18:23 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [RESEND PATCH v2 1/3] dt-bindings: clock: exynosautov9: correct
 clock numbering of peric0/c1
Date:   Wed, 27 Jul 2022 11:13:55 +0900
Message-Id: <20220727021357.152421-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727021357.152421-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmuW7BggdJBrOWyFo8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B4
        53hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygC5UUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUl
        tkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2Rn/9wcV7JSsaP51irGB8btoFyMnh4SA
        icSdh03sXYxcHEICOxglVv5aDeV8YpRY/WsmI4TzmVFiyqdvTF2MHGAtl4+7Q8R3MUocfnEH
        quMjo0Rn0zcWkLlsAroSW56/AusWEWhhkmg9uIEVxGEW2MMo8W/JWnaQKmGBdIm1s1+CdbAI
        qErM7F7HDGLzCthLzG89wQxxobzE9ZttYDangIPEvp7JTBA1ghInZz4B62UGqmneOpsZZIGE
        wFQOiTtr/zFCNLtIPGm7zQJhC0u8Or6FHcKWknjZ3wZlF0ssnfWJCaK5gVHi8rZfbBAJY4lZ
        z9oZQZ5mFtCUWL9LH+J/ZYkjt6D28kl0HP7LDhHmlehoE4JoVJc4sH061FZZie45n1khbA+J
        SevPskJCazKjxNrzU1knMCrMQvLOLCTvzEJYvICReRWjWGpBcW56arFRgRE8ipPzczcxgpOs
        ltsOxilvP+gdYmTiYDzEKMHBrCTCmxB9P0mINyWxsiq1KD++qDQntfgQoykwsCcyS4km5wPT
        fF5JvKGJpYGJmZmhuZGpgbmSOK9XyoZEIYH0xJLU7NTUgtQimD4mDk6pBqaw9siTYmscmfc8
        sJmnFrv/35pbG2MyS/8U9XGF+1+y+uvINlfq9en6vUyN4f2Tpx29e7LojKZNhfRhO/0Xu0Ij
        V01RTJa/d2d/1Nf/J3ZqPbX+du9l9JwZJ519f0npaqzZ12bex32WKzBwH/t33vMTXGQzOYI/
        7fF9Z3feY/7nD+fWLxMX98r6yLaE6bDkrV7XrczNCSuXZs7bNHvJm6DY13ItTSlSsy2aNq84
        t2jmgz9vf8mbizG1n4g6MWlq8yqPTrX1V26fy9okuD7I5BRHmP4qgUSddwr6plqzN9zYVnBN
        oPpgoanFVpPPj2o1/vS+1tJnCGaOVU7O++wdcSb8X8IH7pUqvj5xPE0z1u9QYinOSDTUYi4q
        TgQARpjECTsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsWy7bCSnG7+ggdJBucOWVs8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9igum5TUnMyy1CJ9uwSujP/7gwp2SlY0
        /zrF2MD4XbSLkYNDQsBE4vJx9y5GLg4hgR2MEtO2rWTsYuQEistKPHu3gx3CFpa433KEFaLo
        PaPEjZcL2UASbAK6Eluev2IESYgIdDBJzFpxEayKWWAfo8Tc45uYQVYIC6RKbNnDBdLAIqAq
        MbN7HTOIzStgLzG/9QQzxAZ5ies328BsTgEHiX09k5lAbCGgmrU/jrND1AtKnJz5hAXEZgaq
        b946m3kCo8AsJKlZSFILGJlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIEx4KW1g7G
        Pas+6B1iZOJgPMQowcGsJMKbEH0/SYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6Ykl
        qdmpqQWpRTBZJg5OqQamzDXn6w/dUFmzbtNKnfyTSzd6OH5e3fFOSefg9QP8N9d43amOPBLA
        Y8Lfcz/m+QKmrczbJdQDLreHZS2UvuAeOqEszTlEo5rzh+nXfqfZp9hDxbLCr4SUXv5UUery
        x1fsxYw+72vf/rx5lyYzzbJ0fb1swK7ZdcUtW9y7k9buq5jaw6LDp8yxgbu/4Pjfr10Pmu0s
        KuwMjYV5NJ1fXo1K3Vt7urwjdvOMvqv1ilrGE54WbKtY6mHDq3aqYvcRx0TPNUrpqw7Xm78U
        DdLiPCKpLGst9vpf8xXui/p3zvipZUXdt4nLlbhzo+zlX7NWrylrRDIj6mZejd55sPiEUAn7
        0Rx11bTtn0xub7q6XVuJpTgj0VCLuag4EQDkQoYS9AIAAA==
X-CMS-MailID: 20220727021824epcas2p122d13c927fc8e3304b84aae2a9ca298d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727021824epcas2p122d13c927fc8e3304b84aae2a9ca298d
References: <20220727021357.152421-1-chanho61.park@samsung.com>
        <CGME20220727021824epcas2p122d13c927fc8e3304b84aae2a9ca298d@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There are duplicated definitions of peric0 and peric1 cmu blocks. Thus,
they should be defined correctly as numerical order.

Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
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
2.37.1

