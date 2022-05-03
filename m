Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23EFC43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbiECLB2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiECLBX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:23 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EC62C12C
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:37 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220503105733epoutp03d18d1b52aec5eba5dda1fdc9d4a44a1a~rkx-QmEGq0799307993epoutp03I
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220503105733epoutp03d18d1b52aec5eba5dda1fdc9d4a44a1a~rkx-QmEGq0799307993epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575453;
        bh=rxFrevYTxz4KSwunX+xHEs5yzs+B195gVazytQbuK2Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SwLrHvT5kxxLzaoXniZbJn3iMFwXe7A89g4vHgKiRO+eJsD66OHSfWMww2xuHbeiB
         bUji3lwwvVc7USTKRFIUhW1P5pCOcQRy3Or0O24obFK+pn6iDh0C4yj5CpA0qNjXBN
         Gkc7qy3XOat4SCzgjK3W/v/YTGNytdWtjWz+d5c0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220503105732epcas2p48fab9a4ec40728a19bdc6fbe7e1cb906~rkx_o4Ip11759317593epcas2p4X;
        Tue,  3 May 2022 10:57:32 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.68]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4KsxkK6qX1z4x9Ps; Tue,  3 May
        2022 10:57:29 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        01.E8.10028.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p357a7bfae9731010d7fda00ba78cf8b97~rkx7t3xAh3115231152epcas2p3I;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp1e898883b1c0e749fa708f479f00603fc~rkx7soHi40279502795epsmtrp1d;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-5d-62710a996f87
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        91.42.08853.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip203376f23e0d2322ea7b10d2939778583~rkx7b4gpT0548105481epsmtip2J;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
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
Subject: [PATCH v2 02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Date:   Tue,  3 May 2022 19:59:04 +0900
Message-Id: <20220503105914.117625-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmue5MrsIkg2fPjC0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzbtxcxFxw2LTi4d5H
        jA2ML1S6GDk5JARMJCZs3MHUxcjFISSwg1Fizr4LrBDOJ0aJDdfeMINUCQl8Y5S4s6sGpuPs
        yk9QRXsZJW7tbWGCKPrIKLFtKR+IzSagK7Hl+StGkCIRgS5miYt991hAHGaBrYwSx2/MAusQ
        FgiW+LXyEzuIzSKgKrF8518wm1fAXuLKgmagGg6gdfIS/xaHgoQ5BRwkru86xwRRIihxcuYT
        FhCbGaikeetsZpD5EgJLOSS29n9igzjVRaJ95wJWCFtY4tXxLewQtpTEy/42KLtYYumsT0wQ
        zQ2MEpe3/YJqNpaY9aydEeQIZgFNifW79CHuUZY4cgtqL59Ex2GQk0HCvBIdbUIQjeoSB7ZP
        Z4GwZSW653yGusBD4sGFr9CAm8wosX7TPtYJjAqzkLwzC8k7sxAWL2BkXsUollpQnJueWmxU
        YAyP4eT83E2M4MSr5b6DccbbD3qHGJk4GA8xSnAwK4nwOi8tSBLiTUmsrEotyo8vKs1JLT7E
        aAoM64nMUqLJ+cDUn1cSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1Oq
        gclsvtl0pV0bl8QynJYoumnx20rmbMqc7BUenl/bw1uj7q+uiw1L+7r4g7xbRcnOQs0U31eu
        vvd4Rc/dezHP3ZKpoU9NIDjvPofPyoDU69sPV0+7uqRHm/l4ZfetnZdeCPe8ta2Z1Tmd5YbN
        3g9Bz2QmOpjGT9jQMTlxafTGJ4azZYxSk15khxyee8Jjp15n3KwPm1Jent3TG94qo//haVVL
        862rK876LXg+I1DiIssVxi+fJhT9nxX6e80ppctzDplt32ds+1L1oOxtUZU8R6+7sVPuW81L
        EcxW5GFrYuu5xaq6f7bxpJfrz570t+hX+j5pilKK0pK4s5sWTi5+9/5eY8TO5+/+L/ia+WPX
        8ln3lFiKMxINtZiLihMBBOw1HEUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg6O3BCwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBk3bi5iLjhsWvFw7yPGBsYXKl2MnBwSAiYSZ1d+Yu1i5OIQEtjNKNHft5cFIiEr8ezdDnYI
        W1jifssRVhBbSOA9o8TzJzogNpuArsSW568YQZpFBCYwS7y58oEdxGEW2MkocefVKbYuRg4O
        YYFAiasPMkEaWARUJZbv/As2lFfAXuLKgmYmkBIJAXmJf4tDQcKcAg4S13edY4LYZS+x8+92
        ZohyQYmTM5+A3cYMVN68dTbzBEaBWUhSs5CkFjAyrWKUTC0ozk3PLTYsMMxLLdcrTswtLs1L
        10vOz93ECI4QLc0djNtXfdA7xMjEwXiIUYKDWUmE13lpQZIQb0piZVVqUX58UWlOavEhRmkO
        FiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTJJMuyOWSvrU90Xrf+YK87x88v+GetajsyPV
        I+yu/9CSLrSVunJnhUDMtpkzf+S+jLnWGzzF7TXXrilMe97+ypdicHu4k7Hv4fewv/smS0zb
        dLMu+ySLSJqkXrPPEs2bEhGhL+5lFi93Fbgp8Evsff9l19LXh1cfqHSVOZEiUjZ184tT9ydp
        bXxevySf8aGe109VV/tPa3ni1+ZcXCXmNcWiuyPpzMrIS/KmRV0bf1ya9+DX2o0KHMcyZU2O
        bK1/vf5+c3v6kyjT7XvtC5xTKvnqNPxqP/9m2G6+M0WscGvSVkH/3lfZU0VPHEn/fMrVVO/S
        pcu1CQE/xP7f77uUejrya7+zu+dXz5dKikHJvUosxRmJhlrMRcWJAGMt9Dz/AgAA
X-CMS-MailID: 20220503105729epcas2p357a7bfae9731010d7fda00ba78cf8b97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p357a7bfae9731010d7fda00ba78cf8b97
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p357a7bfae9731010d7fda00ba78cf8b97@epcas2p3.samsung.com>
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
index 000000000000..9f9cd8606728
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

