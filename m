Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DFBC25B06
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Jul 2022 00:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbiG2AgU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbiG2AgT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 20:36:19 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A23278217
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 17:36:16 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220729003614epoutp0429e5a7dbae9f8ce0d14bbbb54bbd0e23~GJbV14LcK2142521425epoutp04o
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2022 00:36:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220729003614epoutp0429e5a7dbae9f8ce0d14bbbb54bbd0e23~GJbV14LcK2142521425epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659054974;
        bh=tpWhkDTEy1qfXTB5XQbk/zcg8j0xVeAX2VxvQJeenlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I+rpoX93ddqXu4vSGkNSZhiZJD6JxC0WWPi547fvDv51eP8VxpMOmMLXWHg8rLO0X
         XYghMpxP9du2pYr1A9v/wLGSmhlz/bRMI3zgPxEvy8Y99FFZOyu0BKqM2ZtAfgfYE1
         siQzo2TC9aQXls6a18HWe4I5PbTQvke1G/fCLUAM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220729003613epcas2p3aa696c66761abedcf65b7c931a3b08f3~GJbU6op3q2821828218epcas2p3p;
        Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.70]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Lv7qJ5B45z4x9Q7; Fri, 29 Jul
        2022 00:36:12 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        54.66.09662.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epcas2p2594f5e2a74c93232834882895d9824ea~GJbUHBS-53088830888epcas2p2u;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220729003612epsmtrp12ef3c2beee12c2e0e18b4aba93c944c5~GJbUF6l8Q3217232172epsmtrp1o;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-b1-62e32b7c169e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4A.70.08802.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003611epsmtip2bb4e58339afeec0a5dbbd24fe679b979~GJbT2kB7g0182201822epsmtip2i;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 3/6] dt-bindings: clock: exynosautov9: add schema for
 cmu_fsys0/1
Date:   Fri, 29 Jul 2022 09:30:21 +0900
Message-Id: <49eaadecfb346982dff46cffb870400b76a4e281.1659054220.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1659054220.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmqW6N9uMkg08L1S0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9Ktsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hqJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xpRb
        fYwF94UrWpu/szQwzuLrYuTgkBAwkVg3L6OLkYtDSGAHo8SZdxdYIZxPjBKNV7rZIZzPjBLL
        Oj+zdTFygnV07dnABpHYxSgx7fd2RgjnI6PE46+7wKrYBHQltjx/BZYQEXjMJHH4SBtYC7NA
        G5PEtGcbWUGqhAXCJBbunskOYrMIqEq82/aZEcTmFYiXuPHsItQ+eYnrN9uYQWxOAVuJrqbv
        LBA1ghInZz4Bs5mBapq3zmYGWSAhsJZD4vzTNlaIZheJo017GSFsYYlXx7ewQ9hSEi/726Ds
        Yomlsz4xQTQ3MEpc3vYLarOxxKxn7YygcGIW0JRYv0sfEmTKEkduQe3lk+g4/JcdIswr0dEm
        BNGoLnFg+3QWCFtWonvOZ6hrPCR6/u1mgYTWBEaJrztes0xgVJiF5J1ZSN6ZhbB4ASPzKkax
        1ILi3PTUYqMCE3gcJ+fnbmIEp2Mtjx2Ms99+0DvEyMTBeIhRgoNZSYQ3Ifp+khBvSmJlVWpR
        fnxRaU5q8SFGU2BgT2SWEk3OB2aEvJJ4QxNLAxMzM0NzI1MDcyVxXq+UDYlCAumJJanZqakF
        qUUwfUwcnFINTGedVY/XLJmaXDGlR1BC1EVC1cOn66dhQ0LzrcJeuc3fLA8v5ZE94TFDUL/2
        9xztCWFP7wTWiuz6+u3FpnfHYyIOL2K71eD9w3JS5Lx58TnTBWrM3/W+PPZdtdvAwHHBI8vQ
        kD/18Z/K6xdM3ZD5ReRCpVm32qbsiX7Xk1tO2+fKbp8gyiR9nOWXBv+JGQmbplVs13j8d8LN
        ydPmnNO+HfjksVr1R2bfu4cF5N+4spto1aby+8wwUeeWsee9PbXOXWQb10NT2Vt+V2e/m/Tn
        yn/uTY8Zuj88nc10pvjX51j9epaSxUaKelJLGj9Vnq2xcpNNzXH51+NZ+7hEK6GvLVZFs+aH
        eOFmFUPHR86LlFiKMxINtZiLihMB8kNVEVAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvG6N9uMkgwtTWCwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9issm
        JTUnsyy1SN8ugStjyq0+xoL7whWtzd9ZGhhn8XUxcnJICJhIdO3ZwNbFyMUhJLCDUWLHqxeM
        EAlZiWfvdrBD2MIS91uOsEIUvWeUmD55BgtIgk1AV2LL81eMIAkRgedMElNWHARzmAW6mCTu
        tH0CaxcWCJF43dgANpZFQFXi3bbPYDavQLzEjWcX2SBWyEtcv9nGDGJzCthKdDV9B9sgJGAj
        sWXZIjaIekGJkzOfgMWZgeqbt85mnsAoMAtJahaS1AJGplWMkqkFxbnpucWGBUZ5qeV6xYm5
        xaV56XrJ+bmbGMGRo6W1g3HPqg96hxiZOBgPMUpwMCuJ8CZE308S4k1JrKxKLcqPLyrNSS0+
        xCjNwaIkznuh62S8kEB6YklqdmpqQWoRTJaJg1OqgWmtO0Ndw+xK0QitCyWT/Ax/1fG/dq45
        +Df5fIGc14fn+7Jmnzpve3b2tQ9GyXUhGuaGD/kvejYeexm5OOirpX6a3bwpK/YELVfwWinT
        3NphohJ1ImX731D2PY63Wtb+EOCfdYuV5UFQ4/xFUx6uzeDL9ppSGvxOYZKA6L3+UzoBSZbs
        a6S/qEWLSXz+4ygTPGHv4e/B38ublfwNJooddXl1JurtIZf5L3L4RLTldv9v/Ga7x8ZVqryh
        9c7z3y3HPN35w47kbHwvxtU9eYe4rGOF0ic2y+kLVDIulqxJXCeju+Tf85s2qxqrv12sdTwr
        qS1x9pHavD21AZ47j/h42QdN23koaRtvlrf+33MTJimxFGckGmoxFxUnAgD2+4VoCwMAAA==
X-CMS-MailID: 20220729003612epcas2p2594f5e2a74c93232834882895d9824ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729003612epcas2p2594f5e2a74c93232834882895d9824ea
References: <cover.1659054220.git.chanho61.park@samsung.com>
        <CGME20220729003612epcas2p2594f5e2a74c93232834882895d9824ea@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add "samsung,exynosautov9-cmu-fsys0/1" compatibles to illustrate
cmu_fsys0 and fsys1 for Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 .../clock/samsung,exynosautov9-clock.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index eafc715d2d02..2ab4642679c0 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -35,6 +35,8 @@ properties:
       - samsung,exynosautov9-cmu-top
       - samsung,exynosautov9-cmu-busmc
       - samsung,exynosautov9-cmu-core
+      - samsung,exynosautov9-cmu-fsys0
+      - samsung,exynosautov9-cmu-fsys1
       - samsung,exynosautov9-cmu-fsys2
       - samsung,exynosautov9-cmu-peric0
       - samsung,exynosautov9-cmu-peric1
@@ -107,6 +109,48 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_core_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-fsys0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_FSYS0 bus clock (from CMU_TOP)
+            - description: CMU_FSYS0 pcie clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_fsys0_bus
+            - const: dout_clkcmu_fsys0_pcie
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-fsys1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_FSYS1 bus clock (from CMU_TOP)
+            - description: CMU_FSYS1 mmc card clock (from CMU_TOP)
+            - description: CMU_FSYS1 usb clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_fsys1_bus
+            - const: dout_clkcmu_fsys1_mmc_card
+            - const: dout_clkcmu_fsys1_usbdrd
+
   - if:
       properties:
         compatible:
-- 
2.37.1

