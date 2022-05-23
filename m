Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B66C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 11:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbiEWLjR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 07:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbiEWLjG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 07:39:06 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DF250459
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 04:39:05 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220523113903epoutp016a503002eed0994eb778e54b84296abc~xuP73NhGu2097420974epoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 11:39:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220523113903epoutp016a503002eed0994eb778e54b84296abc~xuP73NhGu2097420974epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653305943;
        bh=QTnuRgwdtfc4648MyAX/JHurfFX4SVS6f1GtBil8Cm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AqVKZRh3Wv5xx3NTFULW8Benmv4gSdmrVbePNR43IKIsNrctrcefGoxHOF18cQiw+
         FPa8pMeMOn0fgJkZiSwLuUPqOiDCrNDf8ilfUBBxH/nRxWHUA93MokrgScBRGKQ+XL
         V6brgitSVRk3TD+oV1GbFtVPiHXGCedaJsWx3i20=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220523113902epcas2p38eb326bb340d499b306d91741507be72~xuP7SCaLP0050400504epcas2p3E;
        Mon, 23 May 2022 11:39:02 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4L6Fj13nKLz4x9Pw; Mon, 23 May
        2022 11:39:01 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        C9.70.10028.5527B826; Mon, 23 May 2022 20:39:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220523113901epcas2p3373d84386a309ea2cebc364dbf876bf2~xuP5skNtp0050400504epcas2p39;
        Mon, 23 May 2022 11:39:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220523113901epsmtrp1750e657284e8b2cbda26f64f2ad23b7b~xuP5qW8X_2953729537epsmtrp1N;
        Mon, 23 May 2022 11:39:01 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-be-628b7255c1d0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AC.FD.11276.4527B826; Mon, 23 May 2022 20:39:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220523113900epsmtip11b0e60405086a1a6321ed6077afca59e~xuP5cfNkw1792417924epsmtip1j;
        Mon, 23 May 2022 11:39:00 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: watchdog: add exynosautov9 compatible
Date:   Mon, 23 May 2022 20:39:17 +0900
Message-Id: <20220523113919.59571-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523113919.59571-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmuW5oUXeSwcrjMhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5tG3ZRWj
        x+dNcgEsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6Z
        OUCnKCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0M
        jEyBChOyM569Oc9YMJ+7Yvm7T0wNjH0cXYycHBICJhLLJ15i72Lk4hAS2MEo0fBxLiOE84lR
        4ujKzVCZb4wSO1d+ZO5i5ABrWTA7CKRbSGAvo8S7+VUQNR8ZJXbt3s0IkmAT0JXY8vwVmC0i
        EC9x/k0jC0gRs8BCJokJp3azgiSEBbwklq+ZzgRiswioSvxd9QbM5hWwk5jwew4jxH3yEhvm
        9zKD2JwC9hLv7/2CqhGUODnzCQuIzQxU07x1NjPIAgmBr+wSLQcPsUE0u0jsWbmGCcIWlnh1
        fAs7hC0l8bK/Dcoullg66xMTRHMDo8Tlbb+gmo0lZj1rZwR5mVlAU2L9Ln2I75UljtyC2ssn
        0XH4LztEmFeio00IolFd4sD26SwQtqxE95zPrBC2h8S3phdskMCaxCgx5dYRtgmMCrOQvDML
        yTuzEBYvYGRexSiWWlCcm55abFRgDI/h5PzcTYzgpKnlvoNxxtsPeocYmTgYDzFKcDArifBu
        T+xIEuJNSaysSi3Kjy8qzUktPsRoCgzsicxSosn5wLSdVxJvaGJpYGJmZmhuZGpgriTO65Wy
        IVFIID2xJDU7NbUgtQimj4mDU6qBKUMpxJVJYnftlGN6+kqdd1iWezbN/LnHylPqq5KGdd07
        Zmf/+w3vLl0QWsNp6h63LVb8Z5HvlF0iXNx3uQIEFDn/LTlRqteXUR1/smvnFu2X99YnZieH
        /3//drbvghcGMg7qd9doloot+RIY0xQ48SRrsnnyNpGZN3N6GyfZZ12VNTJP37bQdX/Rlp3r
        OEyeduiK7RFNbXsjbX561QbFebYeBS9tE0P323gcuyi6aYfVBtWXAvl34pY+7Du3UpjV6PuN
        v8UM7al/pqi/M491NW0st12++V7zlImsogL6e86ckZtavvKpzK3vPlZ6fDciS8+btSp7ppV/
        LnaJECpdwM+ppSjc71fvmsbPN1GJpTgj0VCLuag4EQD6WYgbIwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnG5IUXeSwY0dlhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5tG3ZRWj
        x+dNcgEsUVw2Kak5mWWpRfp2CVwZz96cZyyYz12x/N0npgbGPo4uRg4OCQETiQWzg7oYuTiE
        BHYzStzvvs7cxcgJFJeVePZuBzuELSxxv+UIK0TRe0aJa1uWgyXYBHQltjx/xQhiiwjESyw9
        94MFpIhZYCmTxPrV7UwgCWEBL4nla6aD2SwCqhJ/V70Bs3kF7CQm/J7DCLFBXmLD/F6wzZwC
        9hLv7/0CqxECqnnevIAZol5Q4uTMJywgNjNQffPW2cwTGAVmIUnNQpJawMi0ilEytaA4Nz23
        2LDAMC+1XK84Mbe4NC9dLzk/dxMjOLy1NHcwbl/1Qe8QIxMH4yFGCQ5mJRHe7YkdSUK8KYmV
        ValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwTbhwYfpJq2ft6cdY
        m+Y+Ln/pd2/e4ZTGzyLH7v6vmLPryfHSJ9ENbG0/lqn4TDw09Wvxk5NBLSe9f9/W53h7cb+E
        66J1HUoGrDZ5N6/es30osmNe1fz5ZRw7jXcnyMbnSHrkbopbvKmHOTXp1Nf7bFLssht/ylUu
        E9u3fUuZtdV+H/9JU48udL7V1u63sfFhE6vLqgXNlxPXVvCsf7Bg53lBRju3jR9ZJ18KK2hW
        /CYbcXuNy1uXKTszTJ/4+l14cjqQf/Jp2fO/Vy2vCLQ0F/m/+EqL3IrenGWL3y83S/kyYcUm
        P3NFgfXHrjJ77xbrnbO3SDGOXT8mMnDDlO7DM5kPzlmgt7vy5mPDR6cFFtsrsRRnJBpqMRcV
        JwIAG447Wd4CAAA=
X-CMS-MailID: 20220523113901epcas2p3373d84386a309ea2cebc364dbf876bf2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523113901epcas2p3373d84386a309ea2cebc364dbf876bf2
References: <20220523113919.59571-1-chanho61.park@samsung.com>
        <CGME20220523113901epcas2p3373d84386a309ea2cebc364dbf876bf2@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Adds "samsung,exynosautov9-wdt" to samsung-wdt compatible. This has two
cpu watchdogs like exynos850.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index b08373336b16..8fb6656ba0c2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -23,6 +23,7 @@ properties:
       - samsung,exynos5420-wdt                # for Exynos5420
       - samsung,exynos7-wdt                   # for Exynos7
       - samsung,exynos850-wdt                 # for Exynos850
+      - samsung,exynosautov9-wdt              # for Exynosautov9
 
   reg:
     maxItems: 1
@@ -67,6 +68,7 @@ allOf:
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
+              - samsung,exynosautov9-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -76,6 +78,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wdt
+              - samsung,exynosautov9-wdt
     then:
       properties:
         clocks:
-- 
2.36.1

