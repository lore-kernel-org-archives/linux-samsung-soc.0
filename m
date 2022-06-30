Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8280CCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 02:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbiF3CUA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 22:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbiF3CT7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 22:19:59 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BC03E5DE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 19:19:58 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220630021953epoutp04fd903e2b27374635dea4385a3feeb600~9RIkCtTs71949819498epoutp04-
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 02:19:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220630021953epoutp04fd903e2b27374635dea4385a3feeb600~9RIkCtTs71949819498epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656555593;
        bh=hmW8eNuBvvWQC9ycLsiNeB1JB/qnhbz48tVNZvUgZvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qqDqu6+4pN6FbNWbO1b/lD/amOXirQkYWzImKsCxdvb5w1H7rx9qfNV7RjTOmCRqE
         62VUSYFN9FUGnPJ2WUNgnZ0+UC+D7M1/ujmGUCfEQrVAgeyWAkkPcDKZesgfpw6fjp
         a13yBqDB0q3Oxvx2J9DxIH+e16WU1ZmqYDcTQjlc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220630021952epcas2p1806a2e24cd92ed3864a82413897d1143~9RIjiNM_e0692706927epcas2p1F;
        Thu, 30 Jun 2022 02:19:52 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.69]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LYMVJ0tLcz4x9QB; Thu, 30 Jun
        2022 02:19:52 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        29.47.09662.8480DB26; Thu, 30 Jun 2022 11:19:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epcas2p1d35e3e0b6d4267eccbe0468b15a558f0~9RIilDSIE0692706927epcas2p1B;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220630021951epsmtrp14a0dc223f69e7c078b1afb97fa81d3d7~9RIiexVrw1478414784epsmtrp1k;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
X-AuditID: b6c32a48-9e1ff700000025be-27-62bd084835c1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        11.1A.08905.7480DB26; Thu, 30 Jun 2022 11:19:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epsmtip2b259ed570f90fa0bde25c31fce8926f3~9RIiSt9L83063230632epsmtip2A;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 2/4] dt-bindings: serial: samsung: add exynosautov9-uart
 compatible
Date:   Thu, 30 Jun 2022 11:16:54 +0900
Message-Id: <eb82ba7e93f6b0e5c22d1e2bbad2cc4056e5cb31.1656554759.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656554759.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmua4Hx94kgztTWCwezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4
        BOi6ZeYAnaOkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0st
        sTI0MDAyBSpMyM44+ekQU8FXtooXzYtYGxjPsXYxcnJICJhIbNwwnbmLkYtDSGAHo8STnx+Y
        IJxPjBIPXjRDOd8YJfYcXAzXcu70BjaIxF5GiQVHj7JDOB8ZJW51XmcDqWIT0JXY8vwVI4gt
        IhAv8fzCexaQImaBSUwS5zuamUESwgIREiuv7GQCsVkEVCWONf5iAbF5gRoOHOhnhFgnL7Fh
        fi9YPaeArUTT2u/MEDWCEidnPgGrZwaqad46G+wLCYGv7BK/Z69hgWh2kdhx9yrU3cISr45v
        YYewpSRe9rdB2cUSS2d9YoJobmCUuLztFxtEwlhi1rN2oCs4gDZoSqzfpQ9iSggoSxy5BbWX
        T6Lj8F92iDCvREebEESjusSB7dOhLpCV6J7zGeoCD4lVs1ZCA2sCo8TyN/tYJjAqzELyziwk
        78xCWLyAkXkVo1hqQXFuemqxUYEJPI6T83M3MYITqJbHDsbZbz/oHWJk4mA8xCjBwawkwrvw
        zM4kId6UxMqq1KL8+KLSnNTiQ4ymwMCeyCwlmpwPTOF5JfGGJpYGJmZmhuZGpgbmSuK8Xikb
        EoUE0hNLUrNTUwtSi2D6mDg4pRqY8r6zv6/ZsmbxypZlftHVBwtO+D3MK3v7rCJIyeYlL4dM
        iv7knzf2fJ3n8OxMnP06jpXPvVa77eSwS6v4LaFXdfnSMdPNq5YmX+O6XrbxlHu4YdDqSInt
        +4IeHojvXKU2a4JTv+WUU6V/H9bmBWx4eN855oBzmeO6okQO7on6WgmZrxc7hbDN4X3fHXvt
        nsnmVOEJU6w6wwM03u3P1jV325vdtc9GenpvKrPWmt0CqR9MFi7y7fI09ZF8kGOwu7a44+LU
        NuefOr1RMvUzLObr6C1yzrKocfgd0Do7mil/xeb3u/zub/hkUqhVLv/zS/KkM1/23qja+Yhz
        f9D5qKzdm25uWGZ9Kn5myzenfdePKbEUZyQaajEXFScCAAg6yuApBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSvK47x94kg52PpS0ezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZZz8dIip4CtbxYvmRawNjOdYuxg5OSQETCTOnd7A
        1sXIxSEksJtR4tu2uSwQCVmJZ+92sEPYwhL3W46wQhS9Z5TYf2E/M0iCTUBXYsvzV4wgtohA
        vMTmLwtZQIqYBaYxSXQ8ngHWLSwQJvF45XOwBhYBVYljjb/ANvACNRw40M8IsUFeYsP8XrAa
        TgFbiaa138FsIQEbid0LljJC1AtKnJz5BKyXGai+eets5gmMArOQpGYhSS1gZFrFKJlaUJyb
        nltsWGCYl1quV5yYW1yal66XnJ+7iREc6FqaOxi3r/qgd4iRiYPxEKMEB7OSCO/CMzuThHhT
        EiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamDi2SpyQtCT93zd
        w7M1TUqfWnZIfijpKZ72+FhWUoz/1Ilz/zpFLmpYqH+rd9GdmVOicjiWHZ+2p1Fn0o32RtP6
        jty19iU2af1H5KoPusZWrZ76Lere1IXfL8bEVk314n7COPUA61OOUG9r5YiUzhe/1JYF3pz+
        /ubfCUtctt9gqbUw4YjRmr7j5WQjR0afK3JxCdNfz9i0rKxXe08g47qC37OddtW1Tbx9QFyx
        /9hGEZXrfItXrpp8Vn8NM/+v0AWJoeb/fhpPc9xk+dJu2vnZWx9yXImx03Epnh1QP8nGUjW/
        r9T2jNbe/zoff1tVnZURsLuTtz5k/kxm87c/mg89Prhyb9uhVX+PHLX9O7fomBJLcUaioRZz
        UXEiAFDYy4njAgAA
X-CMS-MailID: 20220630021951epcas2p1d35e3e0b6d4267eccbe0468b15a558f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220630021951epcas2p1d35e3e0b6d4267eccbe0468b15a558f0
References: <cover.1656554759.git.chanho61.park@samsung.com>
        <CGME20220630021951epcas2p1d35e3e0b6d4267eccbe0468b15a558f0@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add samsung,exynosautov9-uart dedicated compatible for representing
uart of Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 901c1e2cea28..41d3b082eb72 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -17,7 +17,10 @@ description: |+
 
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - const: samsung,exynosautov9-uart
+          - const: samsung,exynos850-uart
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
-- 
2.36.1

