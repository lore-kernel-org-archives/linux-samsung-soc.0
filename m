Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064B9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBD7B6101E
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 09:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236195AbhJHJSs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 05:18:48 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:37005 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237487AbhJHJSp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 05:18:45 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211008091649epoutp04c538bc88e06b1422e6ba5df59093cef9~sA38K-M020193001930epoutp04Y
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 09:16:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211008091649epoutp04c538bc88e06b1422e6ba5df59093cef9~sA38K-M020193001930epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633684609;
        bh=2NZOG9/5oiuPyIBtf1mpNSwm6Fv3JILfbta+X3WDxbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ncChA46qlQ1VHMBLH39fheBWprOXCLvtq0uPTotUUa8tms203CuYVGGx0qSuw3Y4q
         +YsVoq9KhOSpUNV5LVJeJHlYerbSoCmxzmsxRe5z6QEr5lQdp7bDJ8jmbujFjYxN9J
         xW4GXhaowPlg21KH1G9hBM3ul3WOWxUPg8hSi0kY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211008091648epcas2p2e1eff5b05143cf7fa069fb11e696bb96~sA37h0zp01825818258epcas2p2Q;
        Fri,  8 Oct 2021 09:16:48 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HQjHb1G2xz4x9Q6; Fri,  8 Oct
        2021 09:16:43 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B3.53.09816.97C00616; Fri,  8 Oct 2021 18:16:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211008091640epcas2p1fde9bedf5492db3f35207d118e5d9123~sA3zy-oFo0167201672epcas2p1u;
        Fri,  8 Oct 2021 09:16:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211008091639epsmtrp2388785cca342cdda0d168fa2551d9b89~sA3zyA4RR2339723397epsmtrp2Q;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
X-AuditID: b6c32a46-63bff70000002658-ff-61600c79d950
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        2D.6A.09091.77C00616; Fri,  8 Oct 2021 18:16:39 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211008091639epsmtip19d6a4176ed7c1bc5dc05070de78ccd32~sA3zmS0il0184801848epsmtip1T;
        Fri,  8 Oct 2021 09:16:39 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 2/3] arm64: dts: exynos: add initial support for
 exynosautov9 SoC
Date:   Fri,  8 Oct 2021 18:14:42 +0900
Message-Id: <20211008091443.44625-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008091443.44625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmuW4lT0KiwbsLfBaX92tbzD9yjtVi
        49sfTBZT/ixnsphxfh+TReveI+wWh9+0s1qs2vWH0YHDY1ZDL5vHzll32T02repk87hzbQ+b
        R9+WVYwenzfJBbBFZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
        +AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
        LbEyNDAwMgUqTMjOuLaphbXg5kWmil0LbjE1MG6YzNTFyMkhIWAi0fhtC3sXIxeHkMAORon7
        096xQjifGCU+zb3BAuF8Y5Q4v/4JC0zL6a1XoRJ7GSU+ftrODOF8ZJT4ee0WWBWbgK7Eluev
        GEESIgKdjBIrv20D28gscIBRYssFOxBbWCBM4vzZM8wgNouAqsSJ/euBlnNw8ArYSXT8sYDY
        Ji9x5FcnWAmngL3E0fZuRhCbV0BQ4uRMiIuYgWqat84GO0JC4C+7xK7pz9lA5kgIuEhseiMN
        MUdY4tVxkEdBbCmJz+/2skHUdzNKtD76D5VYzSjR2egDYdtL/Jq+BeweZgFNifW79CFGKksc
        uQW1lk+i4/Bfdogwr0RHmxBEo7rEge3ToWElK9E95zMrhO0hsXztBiZIUE1ilLi6qIt9AqPC
        LCTfzELyzSyExQsYmVcxiqUWFOempxYbFRjB4zg5P3cTIziFarntYJzy9oPeIUYmDsZDjBIc
        zEoivPn2sYlCvCmJlVWpRfnxRaU5qcWHGE2BQT2RWUo0OR+YxPNK4g1NLA1MzMwMzY1MDcyV
        xHnn/nNKFBJITyxJzU5NLUgtgulj4uCUamDq3hx/aa/i1POe2iGN6xp2cPxiP1O1JLH+5uXw
        mODAINU7X+QYzCWYHxXbfX1okxvYW3s3RmOvc4BpUaHtpRW7lieG2844ae5zLmXi6SeWn+ex
        Fs79u+7pob3Hj1z/IcTPuovdV3KfQpEfg/zCqWck43P02E+mnPw169dkaf516rG9pufCfr8K
        V51xbd+i8qnb5Nxl1z0R73+0Y57T+/8WTo2mqxgDsuq9itcVms4zEj4zewpzzavsPQU2a46b
        XdsSM6fulATDnGXiRsdOu8nHbrhf7neRNUBXN7TprEBZ0KFJwiuubWbYfJvXY6vh5fxzBwUY
        HlRM88xnC7PXfyNblGV0wm6iqqId/3XjuAolluKMREMt5qLiRABXI5mNKgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSnG45T0KiwbE+DYvL+7Ut5h85x2qx
        8e0PJospf5YzWcw4v4/JonXvEXaLw2/aWS1W7frD6MDhMauhl81j56y77B6bVnWyedy5tofN
        o2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDKubWphLbh5kali14JbTA2MGyYzdTFyckgImEic
        3nqVpYuRi0NIYDejxMEJ3SwQCVmJZ+92sEPYwhL3W46wQhS9Z5RYsusHM0iCTUBXYsvzV4wg
        CRGBbkaJ/sZeJhCHWeAIo8T/77/ARgkLhEj8bl/BBmKzCKhKnNi/HmgUBwevgJ1Exx8LiA3y
        Ekd+dYIN5RSwlzja3s0IYgsBlTx5sRlsDK+AoMTJmU/AbGag+uats5knMArMQpKahSS1gJFp
        FaNkakFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcLhrae5g3L7qg94hRiYOxkOMEhzMSiK8
        +faxiUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUw8Sxe
        evjZo/PbJJKZsxpXr1n7qmzbjGv2otc1j8k5H50fOff9hWUPLT4kciW/3OTcst5wlZ02bzN/
        YyCnQ+GzlVrNThF19fOf7taIuCbptEzz6Zk32uK2mf8eJylyuod5NFV9+vniALPvsiD5l1vl
        U5UmzO8KaVfTLU894Sz+9Nel1c9fCc+Qvd764bRg4T6+Y/UtO2NUkrmTDj+f/zZr+fVUwygW
        3Tmn+U7Ofhxi377ir/rRSRoZV9XULpf8Ppa2PDWtQfhM5cc2VvndFQsfbr3D4c3CqeLMf+vU
        ZruJm/ntnrD6rLrfN+NMh4BSb1leYu2ZlDBtmb171lasFb3DdPBc2z2tl69i1Psu88dJKrEU
        ZyQaajEXFScCADdi3XnmAgAA
X-CMS-MailID: 20211008091640epcas2p1fde9bedf5492db3f35207d118e5d9123
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211008091640epcas2p1fde9bedf5492db3f35207d118e5d9123
References: <20211008091443.44625-1-chanho61.park@samsung.com>
        <CGME20211008091640epcas2p1fde9bedf5492db3f35207d118e5d9123@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add minimal support for ExynosAuto v9 SoC[1].

- Enumarate all pinctrl nodes
- UART with exynos850 compatible
- UFS0 HCI + Phy

Like exynos850, this also uses fixed-rate clock nodes until clock driver
has been supported. The clock nodes are initialized on bootloader stage
thus we don't need to control them so far.

[1]: https://www.samsung.com/semiconductor/minisite/exynos/products/automotiveprocessor/exynos-auto-v9/

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../devicetree/bindings/mfd/syscon.yaml       |    1 +
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi | 1189 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  301 +++++
 3 files changed, 1491 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index abe3fd817e0b..75dcbb741010 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
               - samsung,exynos5433-sysreg
+              - samsung,exynosautov9-sysreg
 
           - const: syscon
 
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
new file mode 100644
index 000000000000..8489b9bea3c9
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
@@ -0,0 +1,1189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's ExynosAutov9 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Samsung's ExynosAutov9 SoC pin-mux and pin-config options are listed as
+ * device tree nodes in this file.
+ */
+
+#include <dt-bindings/pinctrl/samsung.h>
+
+&pinctrl_alive {
+	gpa0: gpa0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpa1: gpa1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	dp0_hpd_pin: dp0-hpd-pin {
+		samsung,pins = "gpa1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	dp1_hpd_pin: dp1-hpd-pin {
+		samsung,pins = "gpa1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	gpq0: gpq0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	speedy0_pin: speedy0-pin {
+		samsung,pins = "gpq0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	speedy1_pin: speedy1-pin {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+};
+
+&pinctrl_aud {
+	gpb0: gpb0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb1: gpb1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb2: gpb2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb3: gpb3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	aud_codec_mclk_pin: aud-codec-mclk-pin {
+		samsung,pins = "gpb0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_codec_mclk_idle_pin: aud-codec-mclk-idle-pin {
+		samsung,pins = "gpb0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s0_pins: aud-i2s0-pins {
+		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s0_idle_pins_pins: aud-i2s0-idle-pins-pins {
+		samsung,pins = "gpb0-0", "gpb0-1", "gpb0-2", "gpb0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s1_pins: aud-i2s1-pins {
+		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s1_idle_pins: aud-i2s1-idle-pins {
+		samsung,pins = "gpb1-0", "gpb1-1", "gpb1-2", "gpb1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s2_pins: aud-i2s2-pins {
+		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s2_idle_pins: aud-i2s2-idle-pins {
+		samsung,pins = "gpb1-4", "gpb1-5", "gpb1-6", "gpb1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s3_pins: aud-i2s3-pins {
+		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s3_idle_pins: aud-i2s3-idle-pins {
+		samsung,pins = "gpb2-0", "gpb2-1", "gpb2-2", "gpb2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s4_pins: aud-i2s4-pins {
+		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s4_idle_pins: aud-i2s4-idle-pins {
+		samsung,pins = "gpb2-4", "gpb2-5", "gpb2-6", "gpb2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s5_pins: aud-i2s5-pins {
+		samsung,pins = "gpb3-0", "gpb3-1", "gpb3-2", "gpb3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s5_idle_pins: aaud-i2s5-idle-pins {
+		samsung,pins = "gpb3-0", "gpb3-1", "gpb3-2", "gpb3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s6_pins: aud-i2s6-pins {
+		samsung,pins = "gpb3-4", "gpb3-5", "gpb3-6", "gpb3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	aud_i2s6_idle_pins: aaud-i2s6-idle-pins {
+		samsung,pins = "gpb3-4", "gpb3-5", "gpb3-6", "gpb3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+};
+
+&pinctrl_fsys0 {
+	gpf0: gpf0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	pcie_clkreq0_pin: pcie-clkreq0-pin {
+		samsung,pins = "gpf0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie_perst0_out_pin: pcie-perst0-out-pin {
+		samsung,pins = "gpf0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_perst0_in_pin: pcie-perst0-in-pin {
+		samsung,pins = "gpf0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_clkreq1_pin: pcie-clkreq1-pin {
+		samsung,pins = "gpf0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie_perst1_out_pin: pcie-perst1-out-pin {
+		samsung,pins = "gpf0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_perst1_in_pin: pcie-perst1-in-pin {
+		samsung,pins = "gpf0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_clkreq2_pin: pcie-clkreq2-pin {
+		samsung,pins = "gpf0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie_perst2_out_pin: pcie-perst2-out-pin {
+		samsung,pins = "gpf0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_perst2_in_pin: pcie-perst2-in-pin {
+		samsung,pins = "gpf0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_clkreq3_pin: pcie-clkreq3-pin {
+		samsung,pins = "gpf1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie_perst3_out_pin: pcie-perst3-out-pin {
+		samsung,pins = "gpf1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_perst3_in_pin: pcie-perst3-in-pin {
+		samsung,pins = "gpf1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_clkreq4_pin: pcie-clkreq4-pin {
+		samsung,pins = "gpf1-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie_perst4_out_pin: pcie-perst4-out-pin {
+		samsung,pins = "gpf1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_perst4_in_pin: pcie-perst4-in-pin {
+		samsung,pins = "gpf1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_clkreq5_pin: pcie-clkreq5-pin {
+		samsung,pins = "gpf1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>;
+	};
+
+	pcie_perst5_out_pin: pcie-perst5-out-pin {
+		samsung,pins = "gpf1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	pcie_perst5_in_pin: pcie-perst5-in-pin {
+		samsung,pins = "gpf1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+};
+
+&pinctrl_fsys1 {
+	gpf8: gpf8 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	sd2_clk_pin: sd2-clk-pin {
+		samsung,pins = "gpf8-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <2>;	/* 2x drive strength */
+	};
+
+	sd2_cmd_pin: sd2-cmd-pin {
+		samsung,pins = "gpf8-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <2>;	/* 2x drive strength */
+	};
+
+	sd2_width1_pin: sd2-width1-pin {
+		samsung,pins = "gpf8-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <2>;	/* 2x drive strength */
+	};
+
+	sd2_width4_pins: sd2-width4-pins {
+		samsung,pins = "gpf8-3", "gpf8-4", "gpf8-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <2>;	/* 2x drive strength */
+	};
+};
+
+&pinctrl_fsys2 {
+	gpf2: gpf2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf3: gpf3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf4: gpf4 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf5: gpf5 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf6: gpf6 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	ufs_rst_n_pin: ufs-rst-n-pin {
+		samsung,pins = "gpf2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	ufs_refclk_out_pin: ufs-refclk-out-pin {
+		samsung,pins = "gpf2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	ufs_rst_n_1_pin: ufs-rst-n-1-pin {
+		samsung,pins = "gpf2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	ufs_refclk_out_1_pin: ufs-refclk-out-1-pin {
+		samsung,pins = "gpf2-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+	};
+
+	eth0_mdc_mdio_pins: eth0-mdc-mdio-pins {
+		samsung,pins = "gpf4-5", "gpf4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth0_rgmii_pins: eth0-rgmii-pins {
+		samsung,pins = "gpf3-1", "gpf3-2", "gpf3-3", "gpf3-4",
+			       "gpf3-5", "gpf3-6", "gpf3-7", "gpf4-0",
+			       "gpf4-1", "gpf4-2", "gpf4-3", "gpf4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth0_pps_out_pin: eth0-pps-out-pin {
+		samsung,pins = "gpf3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	eth1_mdc_mdio_pins: eth1-mdc-mdio-pins {
+		samsung,pins = "gpf6-5", "gpf6-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth1_rgmii_pins: eth1-rgmii-pins {
+		samsung,pins = "gpf5-1", "gpf5-2", "gpf5-3", "gpf5-4",
+			       "gpf5-5", "gpf5-6", "gpf5-7", "gpf6-0",
+			       "gpf6-1", "gpf6-2", "gpf6-3", "gpf6-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth1_pps_out_pin: eth1-pps-out-pin {
+		samsung,pins = "gpf5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_peric0 {
+	gpp0: gpp0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp1: gpp1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp2: gpp2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg0: gpg0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	pwm_tout0_pin: pwm-tout0-pin {
+		samsung,pins = "gpg0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	pwm_tout1_pin: pwm-tout1-pin {
+		samsung,pins = "gpg0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	pwm_tout2_pin: pwm-tout2-pin {
+		samsung,pins = "gpg0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	pwm_tout3_pin: pwm-tout3-pin {
+		samsung,pins = "gpg0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI00  */
+	hsi2c0_pins: hsi2c0-pins {
+		samsung,pins = "gpp0-0", "gpp0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI00_I2C */
+	hsi2c1_pins: hsi2c1-pins {
+		samsung,pins = "gpp0-2", "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI01 */
+	hsi2c2_pins: hsi2c2-pins {
+		samsung,pins = "gpp0-4", "gpp0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI01_I2C */
+	hsi2c3_pins: hsi2c3-pins {
+		samsung,pins = "gpp0-6", "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI02 */
+	hsi2c4_pins: hsi2c4-pins {
+		samsung,pins = "gpp1-0", "gpp1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI02_I2C */
+	hsi2c5_pins: hsi2c5-pins {
+		samsung,pins = "gpp1-2", "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI03 */
+	hsi2c6_pins: hsi2c6-pins {
+		samsung,pins = "gpp1-4", "gpp1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI03_I2C */
+	hsi2c7_pins: hsi2c7-pins {
+		samsung,pins = "gpp1-6", "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI04 */
+	hsi2c8_pins: hsi2c8-pins {
+		samsung,pins = "gpp2-0", "gpp2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI04_I2C */
+	hsi2c9_pins: hsi2c9-pins {
+		samsung,pins = "gpp2-2", "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI05 */
+	hsi2c10_pins: hsi2c10-pins {
+		samsung,pins = "gpp2-4", "gpp2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI05_I2C */
+	hsi2c11_pins: hsi2c11-pins {
+		samsung,pins = "gpp2-6", "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* SPI USI_PERIC0_USI00_SPI */
+	spi0_pins: spi0-pins {
+		samsung,pins = "gpp0-2", "gpp0-1", "gpp0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi0_cs_pin: spi0-cs-pin {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi0_cs_func_pin: spi0-cs-func-pin {
+		samsung,pins = "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI01_SPI */
+	spi1_pins: spi1-pins {
+		samsung,pins = "gpp0-6", "gpp0-5", "gpp0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi1_cs_pin: spi1-cs-pin {
+		samsung,pins = "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi1_cs_func_pin: spi1-cs-func-pin {
+		samsung,pins = "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI02_SPI */
+	spi2_pins: spi2-pins {
+		samsung,pins = "gpp1-2", "gpp1-1", "gpp1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi2_cs_pin: spi2-cs-pin {
+		samsung,pins = "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi2_cs_func_pin: spi2-cs-func-pin {
+		samsung,pins = "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI03_SPI */
+	spi3_pins: spi3-pins {
+		samsung,pins = "gpp1-6", "gpp1-5", "gpp1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi3_cs_pin: spi3-cs-pin {
+		samsung,pins = "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi3_cs_func_pin: spi3-cs-func-pin {
+		samsung,pins = "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI04_SPI */
+	spi4_pins: spi4-pins {
+		samsung,pins = "gpp2-2", "gpp2-1", "gpp2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi4_cs_pin: spi4-cs-pin {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi4_cs_func_pin: spi4-cs-func-pin {
+		samsung,pins = "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* PERIC0 USI05_SPI */
+	spi5_pins: spi5-pins {
+		samsung,pins = "gpp2-6", "gpp2-5", "gpp2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi5_cs_pin: spi5-cs-pin {
+		samsung,pins = "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	spi5_cs_func_pin: spi5-cs-func-pin {
+		samsung,pins = "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC0_USI00_UART */
+	uart0_pins: uart0-pins {
+		samsung,pins = "gpp0-0", "gpp0-1", "gpp0-2", "gpp0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart0_dual_pins: uart0-dual-pins {
+		samsung,pins = "gpp0-0", "gpp0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC0_USI01_UART */
+	uart1_pins: uart1-pins {
+		samsung,pins = "gpp0-4", "gpp0-5", "gpp0-6", "gpp0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart1_dual_pins: uart1-dual-pins {
+		samsung,pins = "gpp0-4", "gpp0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC0_USI02_UART */
+	uart2_pins: uart2-pins {
+		samsung,pins = "gpp1-0", "gpp1-1", "gpp1-2", "gpp1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart2_dual_pins: uart2-dual-pins {
+		samsung,pins = "gpp1-0", "gpp1-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC0_USI03_UART */
+	uart3_pins: uart3-pins {
+		samsung,pins = "gpp1-4", "gpp1-5", "gpp1-6", "gpp1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart3_dual_pins: uart3-dual-pins {
+		samsung,pins = "gpp1-4", "gpp1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC0_USI04_UART */
+	uart4_pins: uart4-pins {
+		samsung,pins = "gpp2-0", "gpp2-1", "gpp2-2", "gpp2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart4_dual_pins: uart4-dual-pins {
+		samsung,pins = "gpp2-0", "gpp2-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC0_USI05_UART */
+	uart5_pins: uart5-pins {
+		samsung,pins = "gpp2-4", "gpp2-5", "gpp2-6", "gpp2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart5_dual_pins: uart5-dual-pins {
+		samsung,pins = "gpp2-4", "gpp2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
+&pinctrl_peric1 {
+	gpp3: gpp3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp4: gpp4 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp5: gpp5 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg1: gpg1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg2: gpg2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg3: gpg3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	/* PERIC1 USI06 */
+	hsi2c12_pins: hsi2c12-pins {
+		samsung,pins = "gpp3-0", "gpp3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI06_I2C */
+	hsi2c13_pins: hsi2c13-pins {
+		samsung,pins = "gpp3-2", "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI07 */
+	hsi2c14_pins: hsi2c14-pins {
+		samsung,pins = "gpp3-4", "gpp3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI07_I2C */
+	hsi2c15_pins: hsi2c15-pins {
+		samsung,pins = "gpp3-6", "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI08 */
+	hsi2c16_pins: hsi2c16-pins {
+		samsung,pins = "gpp4-0", "gpp4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI08_I2C */
+	hsi2c17_pins: hsi2c17-pins {
+		samsung,pins = "gpp4-2", "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI09 */
+	hsi2c18_pins: hsi2c18-pins {
+		samsung,pins = "gpp4-4", "gpp4-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI09_I2C */
+	hsi2c19_pins: hsi2c19-pins {
+		samsung,pins = "gpp4-6", "gpp4-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI10 */
+	hsi2c20_pins: hsi2c20-pins {
+		samsung,pins = "gpp5-0", "gpp5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI10_I2C */
+	hsi2c21_pins: hsi2c21-pins {
+		samsung,pins = "gpp5-2", "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI11 */
+	hsi2c22_pins: hsi2c22-pins {
+		samsung,pins = "gpp5-4", "gpp5-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI11_I2C */
+	hsi2c23_pins: hsi2c23-pins {
+		samsung,pins = "gpp5-6", "gpp5-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI06_SPI */
+	spi6_pins: spi6-pins {
+		samsung,pins = "gpp3-2", "gpp3-1", "gpp3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi6_cs_pin: spi6-cs-pin {
+		samsung,pins = "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi6_cs_func_pin: spi6-cs-func-pin {
+		samsung,pins = "gpp3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI07_SPI */
+	spi7_pins: spi7-pins {
+		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi7_cs_pin: spi7-cs-pin {
+		samsung,pins = "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi7_cs_func_pin: spi7-cs-func-pin {
+		samsung,pins = "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI08_SPI */
+	spi8_pins: spi8-pins {
+		samsung,pins = "gpp4-2", "gpp4-1", "gpp4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi8_cs_pin: spi8-cs-pin {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi8_cs_func_pin: spi8-cs-func-pin {
+		samsung,pins = "gpp4-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI09_SPI */
+	spi9_pins: spi9-pins {
+		samsung,pins = "gpp4-6", "gpp4-5", "gpp4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi9_cs_pin: spi9-cs-pin {
+		samsung,pins = "gpp4-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi9_cs_func_pin: spi9-cs-func-pin {
+		samsung,pins = "gpp4-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI10_SPI */
+	spi10_pins: spi10-pins {
+		samsung,pins = "gpp5-2", "gpp5-1", "gpp5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi10_cs_pin: spi10-cs-pin {
+		samsung,pins = "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi10_cs_func_pin: spi10-cs-func-pin {
+		samsung,pins = "gpp5-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* PERIC1 USI11_SPI */
+	spi11_pins: spi11-pins {
+		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi11_cs_pin: spi11-cs-pin {
+		samsung,pins = "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	spi11_cs_func_pin: spi11-cs-func-pin {
+		samsung,pins = "gpp3-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	/* USI_PERIC1_USI06_UART */
+	uart6_pins: uart6-pins {
+		samsung,pins = "gpp3-3", "gpp3-2", "gpp3-1", "gpp3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart6_dual_pins: uart6-dual-pins {
+		samsung,pins = "gpp3-0", "gpp3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC1_USI07_UART */
+	uart7_pins: uart7-pins {
+		samsung,pins = "gpp3-7", "gpp3-6", "gpp3-5", "gpp3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart7_dual_pins: uart7-dual-pins {
+		samsung,pins = "gpp3-4", "gpp3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC1_USI08_UART */
+	uart8_pins: uart8-pins {
+		samsung,pins = "gpp4-3", "gpp4-2", "gpp4-1", "gpp4-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart8_dual_pins: uart8-dual-pins {
+		samsung,pins = "gpp4-0", "gpp4-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC1_USI09_UART */
+	uart9_pins: uart9-pins {
+		samsung,pins = "gpp4-7", "gpp4-6", "gpp4-5", "gpp4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart9_dual_pins: uart9-dual-pins {
+		samsung,pins = "gpp4-4", "gpp4-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC1_USI10_UART */
+	uart10_pins: uart10-pins {
+		samsung,pins = "gpp5-3", "gpp5-2", "gpp5-1", "gpp5-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart10_dual_pins: uart10-dual-pins {
+		samsung,pins = "gpp5-0", "gpp5-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	/* USI_PERIC1_USI11_UART */
+	uart11_pins: uart11-pins {
+		samsung,pins = "gpp5-7", "gpp5-6", "gpp5-5", "gpp5-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	uart11_dual_pins: uart11-dual-pins {
+		samsung,pins = "gpp5-4", "gpp5-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
new file mode 100644
index 000000000000..58ea392da5c3
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's ExynosAuto v9 SoC device tree source
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynosautov9";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_aud;
+		pinctrl2 = &pinctrl_fsys0;
+		pinctrl3 = &pinctrl_fsys1;
+		pinctrl4 = &pinctrl_fsys2;
+		pinctrl5 = &pinctrl_peric0;
+		pinctrl6 = &pinctrl_peric1;
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+				     <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@000000 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@000100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@000200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@000300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@10000 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x10000>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@10100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x10100>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@10200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x10200>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@10300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x10300>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+		cpu_suspend = <0xc4000001>;
+		cpu_off = <0x84000002>;
+		cpu_on = <0xc4000003>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	fixed-rate-clocks {
+		xtcxo: clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <26000000>;
+			clock-output-names = "oscclk";
+		};
+
+		/*
+		 * Keep the stub clock for serial driver, until proper clock
+		 * driver is implemented.
+		 */
+		uart_clock: uart-clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <133250000>;
+			clock-output-names = "uart";
+		};
+
+		/*
+		 * Keep the stub clock for ufs driver, until proper clock
+		 * driver is implemented.
+		 */
+		ufs_core_clock: uart-core-clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <166562500>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x20000000>;
+
+		gic: interrupt-controller@11001000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x10101000 0x1000>,
+			      <0x10102000 0x2000>,
+			      <0x10104000 0x2000>,
+			      <0x10106000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
+						 IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		pinctrl_alive: pinctrl@10450000 {
+			compatible = "samsung,exynosautov9-pinctrl";
+			reg = <0x10450000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pinctrl_aud: pinctrl@19c60000{
+			compatible = "samsung,exynosautov9-pinctrl";
+			reg = <0x19c60000 0x1000>;
+		};
+
+		pinctrl_fsys0: pinctrl@17740000 {
+			compatible = "samsung,exynosautov9-pinctrl";
+			reg = <0x17740000 0x1000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_fsys1: pinctrl@17060000 {
+			compatible = "samsung,exynosautov9-pinctrl";
+			reg = <0x17060000 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_fsys2: pinctrl@17c30000 {
+			compatible = "samsung,exynosautov9-pinctrl";
+			reg = <0x17c30000 0x1000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric0: pinctrl@10230000 {
+			compatible = "samsung,exynosautov9-pinctrl";
+			reg = <0x10230000 0x1000>;
+			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_peric1: pinctrl@10830000 {
+			compatible = "samsung,exynosautov9-pinctrl";
+			reg = <0x10830000 0x1000>;
+			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pmu_system_controller: system-controller@10460000 {
+			compatible = "samsung,exynos7-pmu", "syscon";
+			reg = <0x10460000 0x10000>;
+		};
+
+		syscon_fsys2: syscon@17c20000 {
+			compatible = "samsung,exynosautov9-sysreg", "syscon";
+			reg = <0x17c20000 0x1000>;
+		};
+
+		/* USI: UART */
+		serial_0: uart@103000000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10300000 0x100>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_dual_pins>;
+			clocks = <&uart_clock>, <&uart_clock>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		ufs_0_phy: ufs0-phy@17e04000 {
+			compatible = "samsung,exynosautov9-ufs-phy";
+			reg = <0x17e04000 0xc00>;
+			reg-names = "phy-pma";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			clocks = <&xtcxo>;
+			clock-names = "ref_clk";
+			status = "disabled";
+		};
+
+		ufs_0: ufs0@17e00000 {
+			compatible ="samsung,exynosautov9-ufs";
+
+			reg = <0x17e00000 0x100>,  /* 0: HCI standard */
+				<0x17e01100 0x410>,  /* 1: Vendor-specific */
+				<0x17e80000 0x8000>,  /* 2: UNIPRO */
+				<0x17dc0000 0x2200>;  /* 3: UFS protector */
+			reg-names = "hci", "vs_hci", "unipro", "ufsp";
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ufs_core_clock>,
+				<&ufs_core_clock>;
+			clock-names = "core_clk", "sclk_unipro_main";
+			freq-table-hz = <0 0>, <0 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ufs_rst_n_pin &ufs_refclk_out_pin>;
+			phys = <&ufs_0_phy>;
+			phy-names = "ufs-phy";
+			samsung,sysreg = <&syscon_fsys2>;
+			samsung,ufs-shareability-reg-offset = <0x710>;
+			status = "disabled";
+		};
+	};
+};
+
+#include "exynosautov9-pinctrl.dtsi"
-- 
2.33.0

