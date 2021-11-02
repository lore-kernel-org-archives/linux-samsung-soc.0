Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6B4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 23:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E64B460F3A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 23:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhKAXrx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 19:47:53 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:33954 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhKAXrs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 19:47:48 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211101234513epoutp04bffff44d9fa5b2269a052c9670fd8a07~zkNAkvr7f1736317363epoutp04L
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 23:45:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211101234513epoutp04bffff44d9fa5b2269a052c9670fd8a07~zkNAkvr7f1736317363epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635810313;
        bh=ru+uOL2q5VmxNAOoqGn5+BJ/Rhwo/jGdnJB8swVwP1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d4jDYuRJxeg+vZsQwiBSq48zVfVf9Ny+493QhbK2Kcx0QrmNi57F6aXW4UHsARMRZ
         kNxgKR7U9DD6PusVuI61SUYtFqD/S1KdLmV8ycMxybkQLmVQTYo2UYgpEnHQw4aBQy
         CJMQ/PG1tqTi3pqbWSVPCQIPt8VSm7WSsraRcKXM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211101234512epcas2p2469a6acb607d7d5ad172616d912341a5~zkM-_r7Ev0124001240epcas2p2c;
        Mon,  1 Nov 2021 23:45:12 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HjqQT2qJWz4x9Q7; Mon,  1 Nov
        2021 23:45:05 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        6D.6E.51767.00C70816; Tue,  2 Nov 2021 08:45:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211101234503epcas2p2502c113c1821ecb85faf959d059f26c6~zkM3qi7Da0124001240epcas2p2_;
        Mon,  1 Nov 2021 23:45:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211101234503epsmtrp17e470317d934e667d3dfb8b36268ee11~zkM3pt69r0970709707epsmtrp1O;
        Mon,  1 Nov 2021 23:45:03 +0000 (GMT)
X-AuditID: b6c32a45-45dff7000000ca37-00-61807c00d44a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        78.9C.08738.FFB70816; Tue,  2 Nov 2021 08:45:03 +0900 (KST)
Received: from localhost.localdomain (unknown [12.36.155.123]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211101234503epsmtip1690c433a5af41bb27e0d3ee9ba098002~zkM3YkT252653626536epsmtip1S;
        Mon,  1 Nov 2021 23:45:03 +0000 (GMT)
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     krzysztof.kozlowski@canonical.com, will@kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v2 2/2] dt-bindings: timer: samsung,s5e99xx-mct: Document
 s5e99xx-mct bindings
Date:   Tue,  2 Nov 2021 09:11:22 +0900
Message-Id: <20211102001122.27516-3-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102001122.27516-1-youngmin.nam@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmuS5DTUOiQescLot5n2UtmvZfYrY4
        vvY1q0X/49fMFhvf/mCy2PT4GqvF5V1z2CxmnN/HZLH0+kUmi8WPVzBZ/Os9yGixedNUZouW
        O6YWiw98Ynfg81gzbw2jx6yGXjaPTas62TzuXNvD5vHu3Dl2j81L6j36tqxi9Pi8SS6AIyrb
        JiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoaiWFssSc
        UqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsbv
        pyvZCi5IV6zd/pS5gXGCSBcjJ4eEgInE8ie9zF2MXBxCAjsYJW7PmcACkhAS+MQo8W91OoT9
        mVFidpskTMPa7gYmiIZdjBKdf95AdQMVrf1+hhWkik1AV2LbiX+MILaIQKbEhy+fWEGKmAUW
        MElcOPyUHSQhLJAg0b7rBDOIzSKgKjF/5VUmEJtXwFZi44wNrBDr5CWO/OoEq+EUsJO49beJ
        BaJGUOLkzCdgNjNQTfPW2WBXSAis5JC4d2M7VLOLxKs9TxkhbGGJV8e3sEPYUhIv+9ug7HqJ
        xduWQjVPYJSYv+kDVMJYYtazdqBmDqANmhLrd+mDmBICyhJHbkHt5ZPoOPyXHSLMK9HRJgTR
        qCbxa8oGqK0yErsXr2CGsD0k3j9YzQYJrImMEvf3zGOZwKgwC8k7s5C8Mwth8QJG5lWMYqkF
        xbnpqcVGBYbwGE7Oz93ECE7FWq47GCe//aB3iJGJg/EQowQHs5IIb8SFmkQh3pTEyqrUovz4
        otKc1OJDjKbAwJ7ILCWanA/MBnkl8YYmlgYmZmaG5kamBuZK4ryWotmJQgLpiSWp2ampBalF
        MH1MHJxSDUyGP3im5nxe9eW/S8eMWGGL9p3CR1Q/WFju3794v3z98mgum7USJ0tO9s1z8ypd
        e/S0st7EnIWt2fff3bMsObjY//PeO5/a3vCfnSEStnTvbrdmhrS1UeERxgunrTc953HvfX/B
        12VdAofuqv9Islk/62Hom9fxh56l7dvw/qPUy+N/14YybuDcudNv+eJvD61XVEQc2eycsNQq
        f533jLJA0ekOc88sXS14Ya3WP2t3zlX1NWsPS358Oi9a43eKqfXGJULcB/qqPG57zVpvrHF4
        8tW5uZoFIssuSwQ/WLHvN+fp3imOiqaTP+z5efFE4uxN+UU5R/xsd/k5vFt7vMvhiGZn7Rnd
        7tkKlTerHijVrlNiKc5INNRiLipOBADR5fzCTgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSnO7/6oZEgx2dKhbzPstaNO2/xGxx
        fO1rVov+x6+ZLTa+/cFksenxNVaLy7vmsFnMOL+PyWLp9YtMFosfr2Cy+Nd7kNFi86apzBYt
        d0wtFh/4xO7A57Fm3hpGj1kNvWwem1Z1snncubaHzePduXPsHpuX1Hv0bVnF6PF5k1wARxSX
        TUpqTmZZapG+XQJXxu+nK9kKLkhXrN3+lLmBcYJIFyMnh4SAicTa7gamLkYuDiGBHYwSR+63
        sUIkZCRur7wMZQtL3G85wgpR9JFR4t6CXywgCTYBXYltJ/4xgtgiArkSHQfmMIIUMQusYpJ4
        0nEKrEhYIE7iyKMmMJtFQFVi/sqrTCA2r4CtxMYZG6A2yEsc+dXJDGJzCthJ3PoLUS8EVPOg
        /QIjRL2gxMmZT8DizED1zVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLS
        vHS95PzcTYzguNHS2sG4Z9UHvUOMTByMhxglOJiVRHgjLtQkCvGmJFZWpRblxxeV5qQWH2KU
        5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cCUvcqrVo9V7cfm+AM928qS9r4Lu+3X8MQt
        0vvGBCkjeaWVIZk8vIZv3p84xu4XGMc0Z29dh1Tnv5m9XMJ8D2Ui2bT1pCMXTpPgfZz6r36m
        C9elCOW4GAPuCXPna+nN7ddsEwwunXFMf0+HuP1T4bMTT9j8PvbqVPl5/gs+/uIie/imFHiL
        mMuVs4rvPHLATvWH/hK3CQ1RtxZOnnJv/749W6cHZHqz5gutDOsvnXTwibLm9h+v15zfGdOQ
        l3lE/kzE5X5f9W2v5p29s+BmmadR48l7k/z3/btbf05k1r3vh94zq3hnPhbj/rM5VtJFblV2
        F1e+yeFlE+90n9iq8zhviWXurLWfk1ItfecaBJxSYinOSDTUYi4qTgQAjFsOdgoDAAA=
X-CMS-MailID: 20211101234503epcas2p2502c113c1821ecb85faf959d059f26c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101234503epcas2p2502c113c1821ecb85faf959d059f26c6
References: <20211102001122.27516-1-youngmin.nam@samsung.com>
        <CGME20211101234503epcas2p2502c113c1821ecb85faf959d059f26c6@epcas2p2.samsung.com>
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

