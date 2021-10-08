Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6339C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF53B60E53
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbhJHJSr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 05:18:47 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:36973 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237194AbhJHJSp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 05:18:45 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211008091647epoutp046f42d644fcc4a35e6ed4a6863c5d0a41~sA37Isex_0035000350epoutp04R
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 09:16:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211008091647epoutp046f42d644fcc4a35e6ed4a6863c5d0a41~sA37Isex_0035000350epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633684607;
        bh=L6NMxTUF4a1Urvf9vrvwYkd2ZglWGRkKNPGh+IcqlZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gXRfsWtkZb1CAcN3uxtmluSmdhKw0dCy/RKgW899zcUgkDc6HkLDudbKBwHif9z3c
         WwjMOhgbhNIX4nUaFpoDABVA3o+Ro1mzJxkr/DCPhq3ClkaMDRKkA+4gSTPRUZxyYL
         4OLH7BwvEMcnUaPwFYq8HWwFyw+uefjrlmYzEdsw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211008091646epcas2p40b4ea2995f83e27bfe236c56bb32d416~sA36RxMXd0813808138epcas2p4w;
        Fri,  8 Oct 2021 09:16:46 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.98]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HQjHY1q9vz4x9QG; Fri,  8 Oct
        2021 09:16:41 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        9C.F6.09472.87C00616; Fri,  8 Oct 2021 18:16:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211008091640epcas2p280fb1bce16ebff863f6ae4db66b2b240~sA3z3Vkrx1824518245epcas2p2B;
        Fri,  8 Oct 2021 09:16:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211008091640epsmtrp11aa6f0cb112b8cdd664b5d46f138c5b2~sA3z2MBHr2134221342epsmtrp1r;
        Fri,  8 Oct 2021 09:16:40 +0000 (GMT)
X-AuditID: b6c32a48-d75ff70000002500-e6-61600c78621e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.6A.09091.77C00616; Fri,  8 Oct 2021 18:16:39 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211008091639epsmtip1917064cfc30fd82251c531bfff223e09~sA3zqKyTV0190601906epsmtip1S;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynos: add minimal support for
 exynosautov9 sadk board
Date:   Fri,  8 Oct 2021 18:14:43 +0900
Message-Id: <20211008091443.44625-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008091443.44625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmqW4FT0KiwY03yhaX92tbzD9yjtVi
        49sfTBZT/ixnsphxfh+TReveI+wWh9+0s1qs2vWH0YHDY1ZDL5vHzll32T02repk87hzbQ+b
        R9+WVYwenzfJBbBFZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
        +AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
        LbEyNDAwMgUqTMjO2HtbraBRouLX3rvsDYxHhLsYOTkkBEwkHv98wNbFyMUhJLCDUeL6kbdM
        EM4nRokF+xewQjjfGCVaXqxi72LkAGvpuWID0i0ksJdR4tlDH4iaj4wSt468YwNJsAnoSmx5
        /ooRJCEi0MkosfLbNiaQBLPAAUaJLRfsQGxhgViJ/lsvwRpYBFQlmq+9YAGxeQXsJE6+3ckI
        cZ+8xJFfncwgNqeAvcTR9m5GiBpBiZMzn7BAzJSXaN46mxlkmYTAV3aJhRf2sUM0u0h8XbKX
        GcIWlnh1fAtUXEriZX8bO0RDN6NE66P/UInVjBKdjT4Qtr3Er+lbWEFeZhbQlFi/Sx/ie2WJ
        I7eg9vJJdBz+Cw0UXomONiGIRnWJA9uns0DYshLdcz6zQtgeEg1X/jBDAmsSo8SF7wuZJjAq
        zELyziwk78xCWLyAkXkVo1hqQXFuemqxUYEJPIKT83M3MYKTp5bHDsbZbz/oHWJk4mA8xCjB
        wawkwptvH5soxJuSWFmVWpQfX1Sak1p8iNEUGNgTmaVEk/OB6TuvJN7QxNLAxMzM0NzI1MBc
        SZx37j+nRCGB9MSS1OzU1ILUIpg+Jg5OqQamWYX/OG5XVv0P4d+0JTr4s8s/vvriKPF9KWpW
        Ffm6N06/dStXDTaxCTE7v1Jh4eQje1iip6xQuHtUe9HzeJ7vd1/1tts212ezSDVmrTL6n7Xi
        pFeugOODfg0v5pwja0RPdPnpSG+dJZLF/Wnus5ffak553fEseuWg8pw5RCxl/tYYwQCHy8/6
        175rc/lna+jsP7HGZtJNU57vr1+kbgnIvH1ofnLSjzXPBNvXX1TIq54zL0d8w9rM3Revzk6p
        f9Uj80C4gqWob+fKWa8PSCUlT3Gax+R8Q7z3iM+S3oJNoWH8TfMqsrl9Zfdrc98oT7uqFLv9
        88fw9qk7++YkR4qGrHK2CZJ56W34MnDiRw0lluKMREMt5qLiRACuHKTGJwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSnG45T0KiweZp2haX92tbzD9yjtVi
        49sfTBZT/ixnsphxfh+TReveI+wWh9+0s1qs2vWH0YHDY1ZDL5vHzll32T02repk87hzbQ+b
        R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGXsva1W0ChR8WvvXfYGxiPCXYwcHBICJhI9V2y6
        GLk4hAR2M0o8XbydpYuREyguK/Hs3Q52CFtY4n7LEVaIoveMEv2fXjGCJNgEdCW2PAexuThE
        BLqBEo29TCAOs8ARRon/33+BjRIWiJb42XMSrINFQFWi+doLsDivgJ3Eybc7GSFWyEsc+dXJ
        DGJzCthLHG3vBosLAdU8ebEZql5Q4uTMJ2A2M1B989bZzBMYBWYhSc1CklrAyLSKUTK1oDg3
        PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM40LU0dzBuX/VB7xAjEwfjIUYJDmYlEd58+9hEId6U
        xMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpiOZaZN530vtygk
        aAfnvg/XFgp632lX50ietCrbpG5/90qj4Ika9y/8ftks6eI2u9Trb5Wqzjp+53RNM5Z/CXqq
        9nI/ujlXz9mW5y23Ry7DwoX9gNIp+02cy8ynb1xy5/A/e2lVntQ3PL6h912b76n+nfGr1maP
        m98D77U3/ln+W175btcW90vCT1ReeXoknzZdyqAd8K1Q6cDdn49nyX76fLU68+yXUq33ZfNe
        /LC532j1N2xzk4zIurW7K+NkXpv7cu9USlvdGawlO+vXnWVr79tFXJ1/3nEq24NpHtuMTi9f
        zBMbGe0lubio16Kdp3ayx7Ojn57sfnqgVypBbT+vyjEOndbD7tKZ567qbn2txFKckWioxVxU
        nAgA+xMys+MCAAA=
X-CMS-MailID: 20211008091640epcas2p280fb1bce16ebff863f6ae4db66b2b240
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211008091640epcas2p280fb1bce16ebff863f6ae4db66b2b240
References: <20211008091443.44625-1-chanho61.park@samsung.com>
        <CGME20211008091640epcas2p280fb1bce16ebff863f6ae4db66b2b240@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SADK(Samsung Automotive Development Kit) is the development kit to
evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two
256GB Samsung UFS. This patch enables only serial console and ufs0
device.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../bindings/arm/samsung/samsung-boards.yaml  |  6 ++
 arch/arm64/boot/dts/exynos/Makefile           |  3 +-
 .../boot/dts/exynos/exynosautov9-sadk.dts     | 56 +++++++++++++++++++
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 0796f0c87727..ef6dc14be4b5 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -199,6 +199,12 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos Auto v9 based boards
+        items:
+          - enum:
+              - samsung,exynosautov9-sadk   # Samsung Exynos Auto v9 SADK
+          - const: samsung,exynosautov9
+
 required:
   - compatible
 
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index e0a2facde6a2..b41e86df0a84 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -2,4 +2,5 @@
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb	\
 	exynos5433-tm2e.dtb	\
-	exynos7-espresso.dtb
+	exynos7-espresso.dtb	\
+	exynosautov9-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
new file mode 100644
index 000000000000..ef46d7aa6e28
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung ExynosAutov9 SADK board device tree source
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ */
+
+/dts-v1/;
+#include "exynosautov9.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Samsung ExynosAuto v9 SADK board";
+	compatible = "samsung,exynosautov9-sadk", "samsung,exynosautov9";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x77000000>,
+		      <0x8 0x80000000 0x1 0x7ba00000>,
+		      <0xa 0x00000000 0x2 0x00000000>;
+	};
+
+	ufs_0_fixed_vcc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpq0 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+	vcc-fixed-regulator;
+};
-- 
2.33.0

