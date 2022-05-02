Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB56EC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 May 2022 09:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384039AbiEBJEs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 May 2022 05:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384022AbiEBJEp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 05:04:45 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2B258E57
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 02:01:15 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220502090105epoutp0372a8ecea61976949a80f9aca7eeaa9af~rPjBcwqYJ0334403344epoutp03g
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 May 2022 09:01:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220502090105epoutp0372a8ecea61976949a80f9aca7eeaa9af~rPjBcwqYJ0334403344epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651482065;
        bh=3/ertmdWLmfMUb8s6WX35aS/CZLH5kWIJ7lCKW3o9EY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j6vjsyBcKwFwRzm78p8du+DGtrqt3lSzSMLA0i9ajo1V/CMqQWu3Y9w2MkdZJuMh5
         o5nZzDh0/QuarYzxRnTgl19nL3YRENhIt3G+rxkixKi6J/5A0pZ8XQgkixOR/I5Iyk
         AlJ/LmL4UifZsjMNBIyVQJSBWysr1rintCJCMPvY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220502090105epcas2p33df99a1bd5d3c9a9dc4f40c7093ad61a~rPjA3K1Lv1205712057epcas2p3I;
        Mon,  2 May 2022 09:01:05 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.91]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4KsHBP0ckwz4x9Pw; Mon,  2 May
        2022 09:01:01 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        14.F8.09694.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234~rPi8mopB50033600336epcas2p4t;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220502090100epsmtrp260456481a6ec92a61ac9376006c5bb4c~rPi8leeK43250332503epsmtrp2W;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-89-626f9dcc086b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        5F.EB.08924.CCD9F626; Mon,  2 May 2022 18:01:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220502090100epsmtip26b895a300d87c752380777278b119b4c~rPi8XiSUC1727017270epsmtip22;
        Mon,  2 May 2022 09:01:00 +0000 (GMT)
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
Subject: [PATCH 01/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Date:   Mon,  2 May 2022 18:02:19 +0900
Message-Id: <20220502090230.12853-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502090230.12853-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmue6ZuflJButvWVk8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnXJx4lLVggmnFuoZj
        rA2M91S6GDk5JARMJA7u+s0KYgsJ7GCUWHBFqIuRC8j+xCgx4+A+RgjnM6PE0Q9XmGA6nqx/
        wgzRsYtR4uZ8Doiij4wSXRvXg41iE9CV2PL8FVi3iEAXs8TFvnssIA6zwFZGieM3ZoGNEhYI
        kPhz+B/YKBYBVYmXLfPZuhg5OHgF7CTeHxADMSUE5CX+LQ4FqeAUsJc4s/U5I4jNKyAocXLm
        ExYQmxmopHnrbGaQ8RICSzkk9izqgbrUReLptBssELawxKvjW9ghbCmJz+/2skHYxRJLZ31i
        gmhuYJS4vO0XVMJYYtazdkaQI5gFNCXW79KHuEdZ4sgtqL18Eh2H/7JDhHklOtqEIBrVJQ5s
        nw61VVaie85nVgjbQ+L46eNskLCaxCjRe6KdfQKjwiwk78xC8s4shMULGJlXMYqlFhTnpqcW
        GxWYwCM4OT93EyM47Wp57GCc/faD3iFGJg7GQ4wSHMxKIrxtG3KShHhTEiurUovy44tKc1KL
        DzGaAoN6IrOUaHI+MPHnlcQbmlgamJiZGZobmRqYK4nzeqVsSBQSSE8sSc1OTS1ILYLpY+Lg
        lGpgUnu+Ymrt30LlcLcUsa+uBiuOaSbEdjw6K5Ji633kyTsJjmPfW+4z+OwX3jVx9QfHFV5n
        vxW/2S637+r2pMqTqYteiWg+nKOWLGV8MX4Xp/X6ZMmJ2zO+FOmwLM4R9n0YKbd6ke9q8Qal
        /VVLEvkOMVcvm9mfJrJ1xtqFFebRoQ/FWjl4p1XO2uCWf+vAyfRNN03DPG7u+WSo4DXxWOyi
        4N9yXIcnq/zY8uq8lXOPcvyqaTmvGURmfS1siH3M1nfAuo+tx77mUsa0G0uYzM63LnKU4tlp
        4FTwXjr0962gk2ErVLwzIzyUz/1Yf/mZXDOLJ/9L1j2RN/QV17UEFB1vCNX8zHGMP8BwqYTi
        hYLZSizFGYmGWsxFxYkAvINWakQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvO6ZuflJBq8ny1g8mLeNzeLyfm2L
        61+es1rMP3KO1aLvxUNmi72vt7JbfOy5x2ox4/w+JouLp1wtWvceYbc4/Kad1eLftY0sFs/7
        gOKrdv1hdODzeH+jld1j56y77B6bVnWyedy5tofNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0S
        uDIuTjzKWjDBtGJdwzHWBsZ7Kl2MnBwSAiYST9Y/Ye5i5OIQEtjBKLFvbgsrREJW4tm7HewQ
        trDE/ZYjrBBF7xklHvxpZAJJsAnoSmx5/ooRJCEiMIFZ4s2VD+wgDrPATkaJO69OsXUxcnAI
        C/hJHFiYDtLAIqAq8bJlPliYV8BO4v0BMRBTQkBe4t/iUJAKTgF7iTNbnzOC2EJAFT9O3GcG
        sXkFBCVOznzCAmIzA5U3b53NPIFRYBaS1CwkqQWMTKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz
        0vWS83M3MYIjREtrB+OeVR/0DjEycTAeYpTgYFYS4W3bkJMkxJuSWFmVWpQfX1Sak1p8iFGa
        g0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA1O8wRkXP8nJk7bF2+y8pnw8bp/EgotHK3yu
        REl9+u+7O83prdTNpp0dobIJWXH+yl4p6foz5gstlVCJEPNi0fbjzzOcoFfN/L7ietv6R9ed
        9GffCpTmUdaX+d/jcv/q52k82wV2Tvf+WWHf+v1Cj/bRwmObeI4l11kJZV4NPu+4hVf9/tv4
        oModR7bfuWhnHT9BqivzuslE49O7NY7rvDee8btc/k9e1CSRmSez+6YfDszd9pn/fy6P7nen
        Yx83+iSxXVzuLPGe6f0E1kVL7A3Wxb4TafVgfHrAXjeh4Wmm6o2mJfUM60zvBAisf/o630V9
        hesfpUUG5jL376gHOr1RXVXinzh7x9XCkrCnlUosxRmJhlrMRcWJAPcSvVz/AgAA
X-CMS-MailID: 20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234
References: <20220502090230.12853-1-chanho61.park@samsung.com>
        <CGME20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add dt-schema for Exynos Auto v9 SoC clock controller.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../clock/samsung,exynosautov9-clock.yaml     | 217 ++++++++++++++++++
 1 file changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
new file mode 100644
index 000000000000..e2a01f50db6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -0,0 +1,217 @@
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
+  Those external clocks must be defined as fixed-rate clocks in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/exynosautov9.h' header.
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
+    #include <dt-bindings/clock/exynosautov9.h>
+
+    cmu_fsys2: clock-controller@17c00000 {
+        compatible = "samsung,exynosautov9-cmu-fsys2";
+        reg = <0x17c00000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&xtcxo>, <&cmu_top DOUT_CLKCMU_FSYS2_BUS>,
+                 <&cmu_top DOUT_CLKCMU_FSYS2_UFS_EMBD>,
+                 <&cmu_top DOUT_CLKCMU_FSYS2_ETHERNET>;
+        clock-names = "oscclk", "dout_clkcmu_fsys2_bus",
+                      "dout_fsys2_clkcmu_ufs_embd",
+                      "dout_fsys2_clkcmu_ethernet";
+    };
+
+...
-- 
2.36.0

