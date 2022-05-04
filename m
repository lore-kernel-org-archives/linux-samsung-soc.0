Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B21C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345817AbiEDHyW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345792AbiEDHxz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:55 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CFA6554
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:18 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220504075010epoutp0352546958cfd1a1791ebf575d09f71186~r13rNq02k1244212442epoutp03P
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220504075010epoutp0352546958cfd1a1791ebf575d09f71186~r13rNq02k1244212442epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650610;
        bh=2EYLIgRjCUI2RyhRk+xXju9EyipKSDXK+7kOWsy6m+o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tj60EY9g3fe8DzA9pxXXwUSbJpxO+bBBo0s0VUeLaEgBUQFLcVNw24EPhxzwJiDMZ
         WuhG1a2MxKW0jxf06ToN3LNvS/ovB3Q61b3uFl9Z5Pdtc59Bejn5sGIOg8rvhv7+M2
         RpGX7laey6NScJOizOUj9BSjPHcuAxQVsf/2EuOs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220504075010epcas2p2850c0191f020fb69871dbb99552850ba~r13q1RuHc2519725197epcas2p28;
        Wed,  4 May 2022 07:50:10 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KtTWc74sYz4x9Px; Wed,  4 May
        2022 07:50:04 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        B1.6D.09694.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epcas2p17f37265b522bb0c26dbdd4ebeec92ab9~r13ksGvzO2925229252epcas2p1U;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075003epsmtrp1b63541ef978f110babe8c646c4772202~r13krR7-52992129921epsmtrp1T;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-dc-6272302ca1cc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E7.EB.08924.B2032726; Wed,  4 May 2022 16:50:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075003epsmtip170892b3f55e240eb049d16c2f832b94c~r13keC7xN2390523905epsmtip1B;
        Wed,  4 May 2022 07:50:03 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Date:   Wed,  4 May 2022 16:51:44 +0900
Message-Id: <20220504075154.58819-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmma6OQVGSwfOzPBYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZU9q3sBRcMK243D6R
        uYHxq0oXIweHhICJxJVOqy5GLg4hgR2MEq+XbmOEcD4xSqx5PoMdwvnMKLGqfxeQwwnW8btl
        JjNEYhejxIpV86Gcj4wSmzasYwOpYhPQldjy/BXYLBGBLmaJi333WEAcZoGtjBLHb8xiAqkS
        FgiWmPvjIiOIzSKgKnHr2x6wbl4BO4l1L7tZIS6Ul/i3OBTE5BSwl3i8wQKiQlDi5MwnLCA2
        M1BF89bZYEdICCzkkPh0/C3UqS4Sj2cvgLKFJV4d3wJlS0m87G+Dsoslls76xATR3MAocXnb
        LzaIhLHErGftjCCLmQU0Jdbv0oc4R1niyC2ovXwSHYf/skOEeSU62oQgGtUlDmyfzgJhy0p0
        z/nMCmF7SFyatRAavJOAofDkEuMERoVZSN6ZheSdWQiLFzAyr2IUSy0ozk1PLTYqMIHHcHJ+
        7iZGcOLV8tjBOPvtB71DjEwcjIcYJTiYlUR4nZcWJAnxpiRWVqUW5ccXleakFh9iNAUG9URm
        KdHkfGDqzyuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKanZpakFoE08fEwSnVwCSRk55Y
        2zlP5ytzDFuxYfzPJ2aHSv8bC8ezSRT94yoLeLqSbVXJoroNrrNY+hueyAZr/bxf43zx/OkV
        /sURfK1Ozv92ulxjeJYVq/t56pGj+x69mLGpU+DJ+YpT92p2rv9/Oa97/ZEZs6dxLukKMvOq
        vtxmq6G1ZFpphOGPO68/zzmiwuKq6ZVb/z5+SdycveKzBRwr/iybyyn0g/04hxaPXdOiHS72
        ETl8reu2tHOKr7kb737kyAt5uV2i98qXsede17vb/UvA+9T0NcUrefLPiHXOXOP3OmkDg6LR
        ifuREw3/HZ5/4XKS+wWtJ2f0rl74xseY6vpfWmtL1r2lj+6UL9I94uazjWeTOzdbYI8SS3FG
        oqEWc1FxIgCe1HVmRQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnK62QVGSQfN/TYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhssff1VnaLjz33WC1mnN/HZHHxlKtF694j7BaH37SzWvy7tpHF4nkf
        UHzVrj+MDnwe72+0snvsnHWX3WPTqk42jzvX9rB59G1ZxejxeZNcAFsUl01Kak5mWWqRvl0C
        V8aU9i0sBRdMKy63T2RuYPyq0sXIySEhYCLxu2UmcxcjF4eQwA5GiYftE1kgErISz97tYIew
        hSXutxxhBbGFBN4zSjx4ZQxiswnoSmx5/ooRpFlEYAKzxJsrH9hBHGaBnYwSd16dYgOpEhYI
        lGjubwSbxCKgKnHr2x6wOK+AncS6l91AUzmANshL/FscCmJyCthLPN5gAWIKAVUcnVQEUSwo
        cXLmE7DTmIGKm7fOZp7AKDALSWoWktQCRqZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5
        mxjB8aGltYNxz6oPeocYmTgYDzFKcDArifA6Ly1IEuJNSaysSi3Kjy8qzUktPsQozcGiJM57
        oetkvJBAemJJanZqakFqEUyWiYNTqoFp3jPWY8ESyxIVbE+2JlWVHtv84fmqPC3LnZ+e9/kZ
        TCs5HOQ6/WLkUyHhCQ3Su6xl1X4sUMyfVyW1XGv/rTtXn75IzOy+7Z3E+3auyaGzxRsCn7l+
        2xkTk1/1cXvFpaKCbcaTJA9eNOlbsXlWn+DlQ1Eub9KMXqkwXVBgvXKxact5fosSxvSNzNt7
        T9q9vnak/bpDzb0JN1k/mplZBtfYCG1Vfr19ofLtI2zbrB9cSJu77qtGbn+SSt4Hvo1L0qwC
        Jh1SF7EIPbfz5/rqGy+kQ+p4LnCd2nHgh9W0BVcX+2Xo8dk/u8x8yLBnwn2B3zEcG5zZrlp+
        qkj/91dFvdbp3Zu9NXuXPLh/64V51vzjG5VYijMSDbWYi4oTAYPOHu3+AgAA
X-CMS-MailID: 20220504075003epcas2p17f37265b522bb0c26dbdd4ebeec92ab9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075003epcas2p17f37265b522bb0c26dbdd4ebeec92ab9
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075003epcas2p17f37265b522bb0c26dbdd4ebeec92ab9@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add dt-schema for Exynos Auto v9 SoC clock controller.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../clock/samsung,exynosautov9-clock.yaml     | 219 ++++++++++++++++++
 1 file changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
new file mode 100644
index 000000000000..eafc715d2d02
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -0,0 +1,219 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynosautov9-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Auto v9 SoC clock controller
+
+maintainers:
+  - Chanho Park <chanho61.park@samsung.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  Exynos Auto v9 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. Root clocks in that clock tree are
+  two external clocks:: OSCCLK/XTCXO (26 MHz) and RTCCLK/XrtcXTI (32768 Hz).
+  The external OSCCLK must be defined as fixed-rate clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynosautov9.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynosautov9-cmu-top
+      - samsung,exynosautov9-cmu-busmc
+      - samsung,exynosautov9-cmu-core
+      - samsung,exynosautov9-cmu-fsys2
+      - samsung,exynosautov9-cmu-peric0
+      - samsung,exynosautov9-cmu-peric1
+      - samsung,exynosautov9-cmu-peris
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-busmc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_BUSMC bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_busmc_bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-core
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_CORE bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_core_bus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-fsys2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_FSYS2 bus clock (from CMU_TOP)
+            - description: UFS clock (from CMU_TOP)
+            - description: Ethernet clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_fsys2_bus
+            - const: dout_fsys2_clkcmu_ufs_embd
+            - const: dout_fsys2_clkcmu_ethernet
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_PERIC0 bus clock (from CMU_TOP)
+            - description: PERIC0 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_peric0_bus
+            - const: dout_clkcmu_peric0_ip
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-peric1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_PERIC1 bus clock (from CMU_TOP)
+            - description: PERIC1 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_peric1_bus
+            - const: dout_clkcmu_peric1_ip
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_PERIS bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_peris_bus
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_FSYS2
+  - |
+    #include <dt-bindings/clock/samsung,exynosautov9.h>
+
+    cmu_fsys2: clock-controller@17c00000 {
+        compatible = "samsung,exynosautov9-cmu-fsys2";
+        reg = <0x17c00000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&xtcxo>,
+                 <&cmu_top DOUT_CLKCMU_FSYS2_BUS>,
+                 <&cmu_top DOUT_CLKCMU_FSYS2_UFS_EMBD>,
+                 <&cmu_top DOUT_CLKCMU_FSYS2_ETHERNET>;
+        clock-names = "oscclk",
+                      "dout_clkcmu_fsys2_bus",
+                      "dout_fsys2_clkcmu_ufs_embd",
+                      "dout_fsys2_clkcmu_ethernet";
+    };
+
+...
-- 
2.36.0

