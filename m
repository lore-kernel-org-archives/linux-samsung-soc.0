Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95D6C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7327604DC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 00:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbhJLA14 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Oct 2021 20:27:56 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:47575 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbhJLA1y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 20:27:54 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211012002550epoutp0480f410ab697a8948f174a56a4c99ca4e~tINeT_MEe1535515355epoutp04U
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 00:25:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211012002550epoutp0480f410ab697a8948f174a56a4c99ca4e~tINeT_MEe1535515355epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633998350;
        bh=L6NMxTUF4a1Urvf9vrvwYkd2ZglWGRkKNPGh+IcqlZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EaBlRtKGi33lM2E0oTOkXb32MFdXy3lrRtVDDW3asIYStRPlDb00Fbe6hQ75jk7xH
         wdxSY/Ws9K7uC8smbMO2hJRYIZifwIaTl1Uv3r/s5frxfK9apKd4j/yyhUOH/jMv7N
         P8dkVkhRhYxZMsTZSVH0Y7WuFLoqlGeqhrRCMwL8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211012002549epcas2p365135a5e5adcdf749da4fe2e5061a2e6~tINdkN2gt0637906379epcas2p3N;
        Tue, 12 Oct 2021 00:25:49 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HSxK20DgJz4x9Q1; Tue, 12 Oct
        2021 00:25:42 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        9E.84.09472.EF5D4616; Tue, 12 Oct 2021 09:25:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211012002533epcas2p10315d89423e02bf36a5e0c404268ca1f~tINPUk3vk1948819488epcas2p1-;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211012002533epsmtrp14652e588781fb5ad2aabed21bc2093d0~tINPTn0PS2356223562epsmtrp1N;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
X-AuditID: b6c32a48-d5fff70000002500-07-6164d5fe295a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8B.97.09091.DF5D4616; Tue, 12 Oct 2021 09:25:33 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211012002533epsmtip233d30217830f2a683acbccded4234fbd~tINPH1fyD0815908159epsmtip2K;
        Tue, 12 Oct 2021 00:25:33 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 3/3] arm64: dts: exynos: add minimal support for
 exynosautov9 sadk board
Date:   Tue, 12 Oct 2021 09:23:14 +0900
Message-Id: <20211012002314.38965-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012002314.38965-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmqe6/qymJBoeP61tc3q9tMf/IOVaL
        jW9/MFlM+bOcyWLG+X1MFq17j7BbHH7TzmqxatcfRgcOj1kNvWweO2fdZffYtKqTzePOtT1s
        Hn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk
        4hOg65aZA3SPkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8v
        tcTK0MDAyBSoMCE7Y+9ttYJGiYpfe++yNzAeEe5i5OSQEDCRuNBwgrWLkYtDSGAHo0Tv04Ns
        EM4nRolt12eyg1QJCXxjlDi1RRum43DLP3aIor2MEjNb90M5Hxkl5q/fwwxSxSagK7Hl+StG
        kISIQCejxMpv25hAEswCBxgltlywA7GFBWIlNqzdB9bAIqAqMff8W1YQm1fATmLx9i3MEOvk
        JY786gSzOQXsJVrWnGKBqBGUODnzCQvETHmJ5q2zmUGWSQh8ZZdY9P8JK0Szi8SRQxegBglL
        vDq+hR3ClpJ42d/GDtHQzSjR+ug/VGI1o0Rnow+EbS/xa/oWoEEcQBs0Jdbv0gcxJQSUJY7c
        gtrLJ9Fx+C87RJhXoqNNCKJRXeLA9uksELasRPecz1DXeEhc3D8bGliTGCVWLDjPNoFRYRaS
        d2YheWcWwuIFjMyrGMVSC4pz01OLjQpM4DGcnJ+7iRGcPrU8djDOfvtB7xAjEwfjIUYJDmYl
        Ed63HCmJQrwpiZVVqUX58UWlOanFhxhNgYE9kVlKNDkfmMDzSuINTSwNTMzMDM2NTA3MlcR5
        5/5zShQSSE8sSc1OTS1ILYLpY+LglGpg8ry1O31v6SIVn0MPTn1cwCfyg9O5w7q0sVjw+2mt
        v5bqupuq9pS+3cyjeuduwPrqKZ1LxU/IRm+5K20uvlKjrXLDG28h67Jc58elBU1ZSdfs1tlm
        dnEfW30kefvKC65KEe7f725SPv6c0bBh2vXnzxYa/q3u0o3yquNUb/n4bvOjY+9NOAKkLx/K
        EFU8098c9O74nuKrhms7o6Vex0/oUqza/7AqPuvb95aW5dN+fLk8623R9+0Sm1c1zXVYyi92
        7NZ8BeYZXkIzj3mHsq1emWuztXCaQMzDjCcct+M0ZeOa86SqivP/+XLNPHRkz+q1/19mq4jJ
        5Knc6vm/Wnbe+uNfc9v7ps7+dr1FaruIsRJLcUaioRZzUXEiAAau+5soBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSvO7fqymJBtM/m1pc3q9tMf/IOVaL
        jW9/MFlM+bOcyWLG+X1MFq17j7BbHH7TzmqxatcfRgcOj1kNvWweO2fdZffYtKqTzePOtT1s
        Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJWx97ZaQaNExa+9d9kbGI8IdzFyckgImEgcbvnH
        DmILCexmlJj1LQEiLivx7N0OdghbWOJ+yxHWLkYuoJr3jBJfpnWzgCTYBHQltjx/xQiSEBHo
        ZpTob+xlAnGYBY4wSvz//gusSlggWmLbmYVMIDaLgKrE3PNvWUFsXgE7icXbtzBDrJCXOPKr
        E8zmFLCXaFlzCqiXA2idnURvpxFEuaDEyZlPwEYyA5U3b53NPIFRYBaS1CwkqQWMTKsYJVML
        inPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYLDXEtzB+P2VR/0DjEycTAeYpTgYFYS4X3LkZIo
        xJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA9PBhAMBthuV
        su/GajW5X/44o9TC5n6FVEDbN8+Q32dik9quH4p1uNUQv91Hf4NW8rTTPIzSPsv9/a7peRZM
        zeDZkCPy6teF2LZzSpsPbKj3sHDoW2D4VEL8oYBT26OUGbOmJ/H/nf6gUu2iVF9UbuLpGQa9
        G9aqP5Y1k7Svka6Y49S766HI13hBBvvVzUrq60TLm3RYhK15z7scXK765GsTn9C7O4dDlk2a
        o92xd8aTk4Iny+ttNnr5vUxY5GUl3Pn05/WGDjaT1KDrbXEZOv9iTZ5Xua5e9jH5gn3qWq/7
        z1fHP3975d7bu45Hp3+J/7Wlwl/x4YOX//6b9Oi/Me5ZYMj+ftXqcp1SN+fAeCWW4oxEQy3m
        ouJEAD8nisjiAgAA
X-CMS-MailID: 20211012002533epcas2p10315d89423e02bf36a5e0c404268ca1f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211012002533epcas2p10315d89423e02bf36a5e0c404268ca1f
References: <20211012002314.38965-1-chanho61.park@samsung.com>
        <CGME20211012002533epcas2p10315d89423e02bf36a5e0c404268ca1f@epcas2p1.samsung.com>
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

