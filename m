Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C45FC43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 00:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbiGGA6u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 20:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbiGGA6t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 20:58:49 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2102CE22
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 17:58:48 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220707005846epoutp03f89e65ec8ee0a5e6179a57431f927f0d~-ZivDZ5QR2806328063epoutp030
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Jul 2022 00:58:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220707005846epoutp03f89e65ec8ee0a5e6179a57431f927f0d~-ZivDZ5QR2806328063epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657155526;
        bh=FjXUdABVx22HW08SvjEjJGy8FTKHZ2JybLp4lVPug5Y=;
        h=From:To:Cc:Subject:Date:References:From;
        b=VKqdDLHzOWMC9CSv3ZFXjoLoHsTAJbqDFcmdNUAhobbV93oGvV/VMPPrfz7mSnj2Q
         DPmGHGHPm84Dy64kKkyepLwxVOzkNFHstVyjeTSuTYslCNQ9hjQuQSUlmBJ4eFG4np
         /MC5ERjI0X/W184VcvU42CmluF50ZCl31j3Q00sI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220707005845epcas2p1a5ca3c6a81eebdd51e9da71770ab4804~-ZiumbUZ40551205512epcas2p1D;
        Thu,  7 Jul 2022 00:58:45 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LddMT1tCwz4x9Q7; Thu,  7 Jul
        2022 00:58:45 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        4F.07.09642.5CF26C26; Thu,  7 Jul 2022 09:58:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220707005844epcas2p474d0ac5ca2d11bb37bc6353b9e7d50bc~-Zit_3seM0091600916epcas2p4M;
        Thu,  7 Jul 2022 00:58:44 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220707005844epsmtrp1eb78ce2bdbb283ec19ce9b17c713f6c7~-Zit_BWki1544915449epsmtrp1M;
        Thu,  7 Jul 2022 00:58:44 +0000 (GMT)
X-AuditID: b6c32a47-5e1ff700000025aa-b7-62c62fc5b1ce
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        20.94.08802.4CF26C26; Thu,  7 Jul 2022 09:58:44 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220707005844epsmtip22ecb08fac2a97916418bd99d35a4c3aa~-Zit0Qfxo0185701857epsmtip2E;
        Thu,  7 Jul 2022 00:58:44 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: phy: samsung,ufs-phy: match clock items
Date:   Thu,  7 Jul 2022 09:55:54 +0900
Message-Id: <20220707005554.98268-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkk+LIzCtJLcpLzFFi42LZdljTVPeo/rEkg7ldPBYP5m1js7i8X9ti
        /pFzrBZ9Lx4yW+x9vZXdYtPja6wWM87vY7Jo3XuE3YHDY9OqTjaPO9f2sHlsXlLv0bdlFaPH
        501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5
        QJcoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyM
        TIEKE7Iz1q53KNgqUnHjwRq2BsZXfF2MnBwSAiYS/WsWsHUxcnEICexglNh2fxsjhPOJUeLL
        sbnMEM5nRon7G96zwbT8bn7KCGILCexilHjxJhyi6COjxO+JF1lAEmwCuhJbnr8CKxIRiJd4
        fuE9C0gRM8ik3nN3gSZxcAgLuErc2JkMUsMioCoxpXciWC+vgJ3Eurd97BDL5CU2HNwOFReU
        ODnzCZjNDBRv3job7DoJgXPsEl2P10M1uEhc+PedGcIWlnh1fAtUXEriZX8blF0ssXTWJyaI
        5gZGicvbfkG9Ziwx61k7I8hxzAKaEut36YOYEgLKEkduQe3lk+g4/JcdIswr0dEmBNGoLnFg
        +3QWCFtWonvOZ1YI20PixtFv7JCwipV4t/Qu2wRG+VlIvpmF5JtZCHsXMDKvYhRLLSjOTU8t
        Niowhsdpcn7uJkZwWtRy38E44+0HvUOMTByMhxglOJiVRHhz248mCfGmJFZWpRblxxeV5qQW
        H2I0BYbvRGYp0eR8YGLOK4k3NLE0MDEzMzQ3MjUwVxLn9UrZkCgkkJ5YkpqdmlqQWgTTx8TB
        KdXApOc9x/bZ5IldvJ9jJQuMFpXOsgoXDZXfoahyikf88s8VzYYGv03KZyUJXFkceWvJBl/f
        S9Y77bZMXHE/b943XgNbXdHni5fN2CB6u2jn566/P3qije59jeoRTPmk567yVfvVJ+5lncnM
        /w1fXeM0bjnoyHZTl3ev96xHxfLFCnvuiIbp70u05cqQq5Y6vDjU5lC5yk/eXXuLHjlJXAlz
        +lgkdeZ72fevB5RfeG+Y/8b6a+/dY0Gd5id32s1asJazbF1msGldla2TaXacL8erDbyBvoen
        rHCXZJcUXZThnHz8AkdRke7U810LPvF4LtMV3J/8OGrZmfKeiSnCn/NMnHndb6WEW7hf2lHc
        yWCpxFKckWioxVxUnAgA8hVd7xQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSvO4R/WNJBh1vDS0ezNvGZnF5v7bF
        /CPnWC36Xjxkttj7eiu7xabH11gtZpzfx2TRuvcIuwOHx6ZVnWwed67tYfPYvKTeo2/LKkaP
        z5vkAlijuGxSUnMyy1KL9O0SuDLWrnco2CpScePBGrYGxld8XYycHBICJhK/m58ydjFycQgJ
        7GCUWH39GztEQlbi2bsdULawxP2WI6wQRe8ZJeauPsICkmAT0JXY8vwVI4gtIhAvsfnLQhaQ
        ImaB74wSlzpbmboYOTiEBVwlbuxMBqlhEVCVmNI7EayXV8BOYt3bPqgF8hIbDm6HigtKnJz5
        BMxmBoo3b53NPIGRbxaS1CwkqQWMTKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYJD
        VUtrB+OeVR/0DjEycTAeYpTgYFYS4c1tP5okxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4
        IYH0xJLU7NTUgtQimCwTB6dUAxOfQ7nhGsf48Njta6fwsby14nhz6lQCX3C42A7vv/Hvtyhp
        TFJsljO4L3OftXaxiYfsI2Z5gfAt21xfnNac1D7zW+XqvhzZu6U+rjNrVmVdOrrp4Ik65wyP
        xhnC+37POnfVR0wk48XNnepB5TcSS334w0z3TxDv9YkReFusq6T6uqxQdPOlY+opVhMETU4H
        Lnpbw2CaPbuBS5rjc5yJuO6i3q25TaVfT6w5sJhj7Vt/9/Bru/5O3RFzR1Ug/kfFBCfRFddr
        /LVsoj3+fzV7cjVbSKl60Ta2B98Ub5mI8+fPKDqvqXGmtvixZvjvi6tlq7ZLVnjU9z/7d7rn
        3HP3Kw/eTa2uWZNX69N3cfHJvUosxRmJhlrMRcWJAFxU4yHEAgAA
X-CMS-MailID: 20220707005844epcas2p474d0ac5ca2d11bb37bc6353b9e7d50bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220707005844epcas2p474d0ac5ca2d11bb37bc6353b9e7d50bc
References: <CGME20220707005844epcas2p474d0ac5ca2d11bb37bc6353b9e7d50bc@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Below error is detected from dtbs_check. exynos7-ufs-phy is required
symbol clocks otherwise only PLL ref clock is required.

clock-names: ['ref_clk'] is too short

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../bindings/phy/samsung,ufs-phy.yaml         | 47 +++++++++++++++----
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index 8da99461e817..3b04f31d9f21 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -27,18 +27,12 @@ properties:
       - const: phy-pma
 
   clocks:
-    items:
-      - description: PLL reference clock
-      - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
-      - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
-      - description: symbol clock for output symbol ( tx0 symbol clock)
+    minItems: 1
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: ref_clk
-      - const: rx1_symbol_clk
-      - const: rx0_symbol_clk
-      - const: tx0_symbol_clk
+    minItems: 1
+    maxItems: 4
 
   samsung,pmu-syscon:
     $ref: '/schemas/types.yaml#/definitions/phandle-array'
@@ -53,6 +47,39 @@ properties:
       It can be phandle/offset pair. The second cell which can represent an
       offset is optional.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7-ufs-phy
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PLL reference clock
+            - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
+            - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
+            - description: symbol clock for output symbol ( tx0 symbol clock)
+
+        clock-names:
+          items:
+            - const: ref_clk
+            - const: rx1_symbol_clk
+            - const: rx0_symbol_clk
+            - const: tx0_symbol_clk
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: PLL reference clock
+
+        clock-names:
+          items:
+            - const: ref_clk
+
 required:
   - "#phy-cells"
   - compatible
-- 
2.37.0

