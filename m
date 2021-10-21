Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6D2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 05:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D9B7610FF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 05:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhJUFxj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 01:53:39 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:43624 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhJUFxj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 01:53:39 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211021055122epoutp040f8c5f5625bbe8cd3b5f50a646796ebd~v9dRk2yu71448614486epoutp04T
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 05:51:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211021055122epoutp040f8c5f5625bbe8cd3b5f50a646796ebd~v9dRk2yu71448614486epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634795482;
        bh=ru+uOL2q5VmxNAOoqGn5+BJ/Rhwo/jGdnJB8swVwP1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ct+skbyVHwSJhkKIrVk9bOJDp39w1jdYy9bk1MNv1O2IMOocChpnCQXO7nzJ+xakX
         u7a9sbRHYVQBGwQTGGC0q/s2FnaV+f8CMWr3/5eat8emv81RwRFysJ4Smpu9YIeeTL
         tFhA1uSlRQI3pCHTbFKk/nri8D6/n6lCuBoD9Weo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211021055121epcas2p38b49ce4935c92f20d91998cf5152b1cf~v9dQ_q2EE1269412694epcas2p3i;
        Thu, 21 Oct 2021 05:51:21 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.99]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HZc6X3DKrz4x9QK; Thu, 21 Oct
        2021 05:51:16 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        BB.35.09868.4DFF0716; Thu, 21 Oct 2021 14:51:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211021055115epcas2p158fbf3ac61d3deeb5995bd100d7edef1~v9dLpFk8u1782017820epcas2p1I;
        Thu, 21 Oct 2021 05:51:15 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211021055115epsmtrp2bc51f586c13b8ca0b9cf670a1f2bca8e~v9dLoPn4a1931519315epsmtrp2O;
        Thu, 21 Oct 2021 05:51:15 +0000 (GMT)
X-AuditID: b6c32a45-9a3ff7000000268c-77-6170ffd4a612
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        0D.7B.08902.3DFF0716; Thu, 21 Oct 2021 14:51:15 +0900 (KST)
Received: from localhost.localdomain (unknown [12.36.155.123]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211021055115epsmtip2c3fe60e80f0973c678e701cf9064f24d~v9dLdJ31Q3000430004epsmtip2F;
        Thu, 21 Oct 2021 05:51:15 +0000 (GMT)
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     krzysztof.kozlowski@canonical.com
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v1 2/2] dt-bindings: timer: samsung,s5e99xx-mct: Document
 s5e99xx-mct bindings
Date:   Thu, 21 Oct 2021 15:18:04 +0900
Message-Id: <20211021061804.39118-3-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021061804.39118-1-youngmin.nam@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmhe6V/wWJBrdmiFvM+yxr0bT/ErPF
        8bWvWS02vv3BZLHp8TVWi8u75rBZzDi/j8li8eMVTBb/eg8yWmzeNJXZYvGBT+wO3B6zGnrZ
        PO5c28Pm8e7cOXaPzUvqPfq2rGL0+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xu+nK9kKLkhXrN3+lLmBcYJIFyMnh4SAicSN
        w40sXYxcHEICOxglXr67wQKSEBL4xCjxbo8cROIbo8TKU5eYuhg5wDpWXVGGiO9llDhw/zUT
        hPMZqGHjCVaQbjYBXYltJ/4xgtgiAqoS83Z0soHYzAIrmSReTHcCGSQskCBx7lQCSJgFqOTq
        iTfMIDavgK3E8i0XWSCuk5c48qsTLM4pYCdx/9NkVogaQYmTM5+wQIyUl2jeOpsZ5AYJgV4O
        iQuvN0E1u0ic7nzLCGELS7w6voUdwpaS+PxuLxuEXS+xeNtSqOYJjBLzN32AKjKWmPWsnRHk
        UGYBTYn1u/QhnleWOHILai+fRMfhv+wQYV6JjjYhiEY1iV9TNkBtlZHYvXgFM0SJh8SkVllI
        SE1klNi2eCb7BEaFWUi+mYXkm1kIexcwMq9iFEstKM5NTy02KjCER29yfu4mRnBS1XLdwTj5
        7Qe9Q4xMHIyHGCU4mJVEeHdX5CcK8aYkVlalFuXHF5XmpBYfYjQFhvVEZinR5HxgWs8riTc0
        sTQwMTMzNDcyNTBXEue1FM1OFBJITyxJzU5NLUgtgulj4uCUamDq3qvMePQAy+POWO0DglOS
        wg76re1gOqTHc+nV9pIt9o/mH6tmzvnLI9xrXNwo8eBZ7MZKpt9JQUHG7t/kxFPn183+vbqg
        piMnYX/Nt/AgA5987YQLP7nL2HJe78tqKyqwCBaZNvdX2U0pwYlzS0UPz8iW49631Pid76+9
        WR7bxRtufp1q83BzTPDlabGys0+dfjTfKOi2l6bkNe7QBS2Xfh72cD1zIvesVsHU+mLJ0mq+
        CLP4/bmXlQv8Z555tsjkzafk3cWmvjt2GeVKcvgZd8x+o+j20635S/O0j+fPzJpx6yozC9MK
        +xtPSxex5B9Ys+z3loN+S+7lrL42k+/bsrufGNbd+b9dWSK1tqFHiaU4I9FQi7moOBEA6Euw
        EDMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWy7bCSvO7l/wWJBhs/mVrM+yxr0bT/ErPF
        8bWvWS02vv3BZLHp8TVWi8u75rBZzDi/j8li8eMVTBb/eg8yWmzeNJXZYvGBT+wO3B6zGnrZ
        PO5c28Pm8e7cOXaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSvj99OVbAUXpCvWbn/K
        3MA4QaSLkYNDQsBEYtUV5S5GLg4hgd2MEot+LmPuYuQEistI3F55mRXCFpa433KEFaLoI6PE
        zy8zwIrYBHQltp34xwhiiwioSszb0ckGUsQssJlJ4srbCWwgCWGBOIk9j/eD2SxARVdPvAFr
        5hWwlVi+5SILxAZ5iSO/OsHinAJ2Evc/TWYFuU4IqOb+G26IckGJkzOfgJUzA5U3b53NPIFR
        YBaS1CwkqQWMTKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYJjQEtzB+P2VR/0DjEy
        cTAeYpTgYFYS4d1dkZ8oxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQi
        mCwTB6dUA5PazalVr4+/+Ndybo+qjVfJhVnpH2dvaL6vWqe8WiyiMGFagPltdo/YDVd0tv7f
        87P37GKxGdOXxDrLX5zNXzHj7CXpzR/TXAJPq7pv/FN5PW1SUHTHq5VeGe1MJzkWmWxkunzj
        dsspTjWT4y+Y1H6Zrbnb+/DErr7lUce3sCVbRjMsSyp6ZyzZ88lwuq1v0O7HReXMPE/ijE98
        PtL4eFXg3RdX2xk5bL2yq1NOf4i8MPGOo7riTnW+h6IXc3KXLzlns6W/fXMDe4uMlfP/p5cm
        XfDeeerftxX8kRNNbi7mOKSy5M/b8LvVtltvh33jPNriGqfP2OBu9XbjXibPDZqr+b31f/fr
        OzD8YeVemsOmxFKckWioxVxUnAgAGKUXPPACAAA=
X-CMS-MailID: 20211021055115epcas2p158fbf3ac61d3deeb5995bd100d7edef1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021055115epcas2p158fbf3ac61d3deeb5995bd100d7edef1
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
        <CGME20211021055115epcas2p158fbf3ac61d3deeb5995bd100d7edef1@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the MCT version 2 bindings for the s5e99xx SoC from samsung.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
---
 .../bindings/timer/samsung,s5e99xx-mct.yaml   | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/samsung,s5e99xx-mct.yaml

diff --git a/Documentation/devicetree/bindings/timer/samsung,s5e99xx-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,s5e99xx-mct.yaml
new file mode 100644
index 000000000000..c887c7797ca8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/samsung,s5e99xx-mct.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/samsung,s5e99xx-mct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC Multi Core Timer (MCT)
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |+
+  The Samsung's Multi Core Timer (MCT) version 2 module includes
+  one 64-bit FRC(Free Running Counter) and 12 comparators.
+  The FRC serves up-counter and starts running at power-on.
+  The 12 comparators use the FRC value to produce interrupts.
+  They will produce interrupts when their internal value is matched with the FRC value.
+  Theses interrupts can be used as local timer interrupt of each CPU.
+
+properties:
+  compatible:
+    enum:
+      - samsung,s5e99xx-mct
+
+  clocks:
+    items:
+      - description: OSC clock
+      - description: PCLK clock
+      - description: RTC clock(optional)
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: fin_pll
+      - const: mct
+      - const: rtc
+    minItems: 2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      Interrupts should be put in specific order.
+      0: Local Timer Interrupt 0
+      1: Local Timer Interrupt 1
+      2: Local Timer Interrupt 2
+      3: ..
+      4: ..
+      i: Local Timer Interrupt n
+    minItems: 1              #  1 local timer interrupts
+    maxItems: 12             # 12 local timer interrupts
+
+  div:
+    description: If present, OSC clock freqency will be divided with this value.
+      And the divided value will be provided to MCT module.
+
+required:
+  - compatible
+  - clock-names
+  - clocks
+  - interrupts
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    // In this example, the IP contains 12 local timers, using separate interrupts,
+    // so 12 local timer interrupts have been specified,
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@10050000 {
+        compatible = "samsung,s5e99xx-mct";
+        reg = <0x10050000 0x800>;
+        clocks = <&clock 1>, <&clock 10>;
+        clock-names = "fin_pll", "mct";
+
+        interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.33.0

