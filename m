Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78F6C352A1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Dec 2022 10:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbiLGK7n (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Dec 2022 05:59:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiLGK70 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Dec 2022 05:59:26 -0500
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3485F4D5E5
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Dec 2022 02:59:18 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20221207105917epoutp018e569fc11acd154c9c91f3bdd729c313~ufbu8XmWA2637426374epoutp01g
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Dec 2022 10:59:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20221207105917epoutp018e569fc11acd154c9c91f3bdd729c313~ufbu8XmWA2637426374epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1670410757;
        bh=Qhh/uDlIcj0/Zmm/lNRBvD5K+etcfrKF1SfSyxyp2tQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NGs9WrBztK68cnu5qg67oBlsGwXEiOpWslUpi0DvEKyc713s3HuV7J7RyQIcZCvQx
         pox+B6+zkNgSxzNs9qMLAecWxqFDbn13nk22CjK1u2IQaosEAytoe/e0kPY47UZTX/
         CmNcTzGCoOQ7sVP0BZxtBYIP3PCKH6Z2cJHLPpbw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTP id
        20221207105916epcas5p1220bb306fd327d70787fe264b94c5b66~ufbuCHl5M1623516235epcas5p1q;
        Wed,  7 Dec 2022 10:59:16 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4NRvRk257Sz4x9Py; Wed,  7 Dec
        2022 10:59:14 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        10.9B.56352.20270936; Wed,  7 Dec 2022 19:59:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20221207105049epcas5p305d9c9c22c164ba7e88f93cc59b8b865~ufUWXm_bv1100011000epcas5p3Q;
        Wed,  7 Dec 2022 10:50:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20221207105049epsmtrp1add21a5d6923b6b918bd0e1eef87a574~ufUWW_Yxk2884028840epsmtrp1I;
        Wed,  7 Dec 2022 10:50:49 +0000 (GMT)
X-AuditID: b6c32a4b-5f7fe7000001dc20-5f-639072028d63
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        36.D0.14392.90070936; Wed,  7 Dec 2022 19:50:49 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
        [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20221207105047epsmtip10d2061ad1ea6310669bf5441f78652be~ufUUnr7P42633226332epsmtip1c;
        Wed,  7 Dec 2022 10:50:47 +0000 (GMT)
From:   Sriranjani P <sriranjani.p@samsung.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, alim.akhtar@samsung.com,
        pankaj.dubey@samsung.com, ravi.patel@samsung.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>
Subject: [PATCH v2 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynosautov9
Date:   Wed,  7 Dec 2022 16:20:31 +0530
Message-Id: <20221207105032.103510-4-sriranjani.p@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207105032.103510-1-sriranjani.p@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPKsWRmVeSWpSXmKPExsWy7bCmli5T0YRkg9ZefosH87axWcw/co7V
        ou/FQ2aLTY+vsVpc3jWHzWLG+X1MFou2fmG3ePhhD7tF694j7Ba336xjdeDy2LSqk83jzrU9
        bB6bl9R79G1ZxejxeZNcAGtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJe
        Ym6qrZKLT4CuW2YO0FFKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi
        0rx0vbzUEitDAwMjU6DChOyMb/+PMBa85a3YcPceWwPjH84uRk4OCQETiWtnXrF0MXJxCAns
        ZpQ4ceUmI0hCSOATo0Tzn1yIxDdGidUzbjHBdLx6MY8VIrGXUeLxq0fsEE4rk8SixwfZQKrY
        BHQlWq99ZgJJiAgsYZRo7d7FCOIwC0xhlDj2axnYEmGBEomDN46CdbAIqEr0Xj/BCmLzCthJ
        7Fizlx1in7zE6g0HmEFsTgF7iQtLHzGDDJIQuMcusX/XGUaIIheJtj1NrBC2sMSr41ugmqUk
        Xva3QdnpEpuPbIaqyZHoaGpmhrDtJQ5cmQMMAg6g6zQl1u/ShwjLSkw9tQ7sZ2YBPone30+g
        /ueV2DEPxlaTWPyoE8qWkVj76BMryBgJAQ+Jr7/1IaEyiVHi0uxnLBMY5WYhbFjAyLiKUTK1
        oDg3PbXYtMA4L7UcHm3J+bmbGMEpT8t7B+OjBx/0DjEycTAeYpTgYFYS4X2xsTdZiDclsbIq
        tSg/vqg0J7X4EKMpMPwmMkuJJucDk25eSbyhiaWBiZmZmYmlsZmhkjjv0ikdyUIC6Yklqdmp
        qQWpRTB9TBycUg1Md5zEGTxFuQKW3J3oadkUmie3R+vJktSEBYtCtrsa3ktOqwg5kiTcY+W3
        7GjNtEP6bW4Lcp5X/Lasl4369XHXsudBR0x8Tl13ML4RH2zp8enCXx/RdbvjvQqz9r35cnUT
        /8n7j7lNVy1hXTo/alLV1bSOC78c7zTl+It29TDxHEirfD+hcF9lotie9Jqa6UK/JvJ717+e
        9/HEy5/BnRPOvr+9ekvP2sO7b2ztz+FWnrNiRUjjk467XeGcu3KuL9mRbyNVtFr0M8eESn8e
        kQt/tk0SW+jyvX1C6OsNBhcXLpLmtuE90Tp5HrfC3wwT4YSs9ZLTmq1/AfODd2KyXdfVnoU9
        mwQ5Gd8fTMmc4rROiaU4I9FQi7moOBEAW2VpDQIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsWy7bCSnC5nwYRkgwfP5SwezNvGZjH/yDlW
        i74XD5ktNj2+xmpxedccNosZ5/cxWSza+oXd4uGHPewWrXuPsFvcfrOO1YHLY9OqTjaPO9f2
        sHlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBnf/h9hLHjLW7Hh7j22BsY/nF2MnBwS
        AiYSr17MYwWxhQR2M0ps+F4IEZeROPlgCTOELSyx8t9z9i5GLqCaZiaJnhnH2UESbAK6Eq3X
        PjOBJEQEVjFKnHk0FcxhFpjBKLF06Rk2kCphgSKJU8evMILYLAKqEr3XT4Ct4xWwk9ixZi87
        xAp5idUbDoCt4xSwl7iw9BEzxEl2ErtW7GCbwMi3gJFhFaNkakFxbnpusWGBYV5quV5xYm5x
        aV66XnJ+7iZGcFBqae5g3L7qg94hRiYOxkOMEhzMSiK8Lzb2JgvxpiRWVqUW5ccXleakFh9i
        lOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXA1BZQ2bPuu/3XNWnZfjEqh+0OhOx6wWI+
        ZYms36EZrssbI2qlwr6qlSyfZJrNtu5Scan3pc0zz9rn/JOM2Lf5bav4P4/JtWW7mZSnPeLa
        alUSzJLL7VYc2n9IaupSx+LCVft/SM4L3qJ+xm+ahJBInUjPnR9toXcN7Y5e8G7YdF26QpLB
        pkGKZTFf3jIjlmtLS/9+rMvatTkuvvvg5dmajDI7xAP39vhsPJLxKGlT1qbnslJRbYY3eIP0
        9p3cNefrsrWFT2sW9s/OP7b0/x7mhYVBv3dt9TypKf3dpMBMMFHGbQ2HUkzXvtoTrx2OBnfk
        nv8UKGymwHrQMNol/xUfy5J49bp3WZPulXdtKGpWYinOSDTUYi4qTgQAScmAebkCAAA=
X-CMS-MailID: 20221207105049epcas5p305d9c9c22c164ba7e88f93cc59b8b865
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221207105049epcas5p305d9c9c22c164ba7e88f93cc59b8b865
References: <20221207105032.103510-1-sriranjani.p@samsung.com>
        <CGME20221207105049epcas5p305d9c9c22c164ba7e88f93cc59b8b865@epcas5p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynosautov9 has several different SYSREGs, so use dedicated compatibles
for them and deprecate usage of generic Exynosautov9 compatible alone.

Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index a37452965100..ffca0c118bcf 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -17,7 +17,6 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
-              - samsung,exynosautov9-sysreg
               - tesla,fsd-cam-sysreg
               - tesla,fsd-fsys0-sysreg
               - tesla,fsd-fsys1-sysreg
@@ -35,6 +34,7 @@ properties:
           - enum:
               - const: samsung,exynos5433-sysreg
               - const: samsung,exynos850-sysreg
+              - const: samsung,exynosautov9-sysreg
               - const: syscon
             deprecated: true
       - items:
@@ -43,6 +43,13 @@ properties:
               - samsung,exynos850-peri-sysreg
           - const: samsung,exynos850-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - samsung,exynosautov9-fsys2-sysreg
+              - samsung,exynosautov9-peric0-sysreg
+              - samsung,exynosautov9-peric1-sysreg
+          - const: samsung,exynosautov9-sysreg
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.17.1

