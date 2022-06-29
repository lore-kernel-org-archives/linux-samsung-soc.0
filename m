Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647C3CCA481
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 01:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiF2B7T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiF2B7S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 21:59:18 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60ECD2EA21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 18:59:17 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220629015915epoutp0408aacb0132d79798a2af81e7d206b65a~89NQwhU_B0716607166epoutp04E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:59:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220629015915epoutp0408aacb0132d79798a2af81e7d206b65a~89NQwhU_B0716607166epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656467955;
        bh=RwioUKvKTYhfgLBTlcew+rLf93t5REYcbsLHXDHDJnc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ntUZV2IQgEYYubm9MH1BO2uOxJRiGmyqWZJxyqyrfzWcOV6ywyovTcXUAZ76ggN0A
         iW3KlYOP+36fM8H1F4djvYvirfBLJqzMl2z16xzykACWLW6m0GR4LR/HgQa5sSNX22
         UTn2Alk9vCcSkj5y1f+eFhYXw8GCrxm9jOkUBjSE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220629015914epcas2p3ac571238fd5ff1160d570feb3a35d38d~89NQYV2Gw2548325483epcas2p3Y;
        Wed, 29 Jun 2022 01:59:14 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LXl4y1nzTz4x9Q6; Wed, 29 Jun
        2022 01:59:14 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        38.6D.09650.1F1BBB26; Wed, 29 Jun 2022 10:59:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220629015913epcas2p4b7839d1d66027cfa01cba73f7593902c~89NPChjJm1518315183epcas2p4W;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220629015913epsmtrp1d3dd3b3bbb6f7a4caa0d16c5e347b92b~89NPBmNJ42671026710epsmtrp1S;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
X-AuditID: b6c32a46-0a3ff700000025b2-6b-62bbb1f19060
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E6.C5.08802.1F1BBB26; Wed, 29 Jun 2022 10:59:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220629015913epsmtip1f3473dd7a9e39c41cd855b4c1858fc06~89NOxq1Z41166211662epsmtip1t;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynosautov9: include exynosautov9-usi.dtsi
Date:   Wed, 29 Jun 2022 10:56:50 +0900
Message-Id: <20220629015650.138527-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629015650.138527-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmme7HjbuTDL41mlg8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLx
        CdB1y8wBOkdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5da
        YmVoYGBkClSYkJ3RuPAmW8Fe4Yr/vZOZGxh/8HcxcnJICJhIzD3YwQxiCwnsYJT49je4i5EL
        yP7EKLF6/jYmiMRnRomFc/lgGv6/WMAEUbSLUaKt5RMrRNFHRokLN3VAbDYBXYktz18xgtgi
        AvESzy+8ZwFpYBaYxCRxvqMZbJ2wgI/E78ZvYDaLgKrEsx2rgYo4OHgF7CUefw+EWCYvsWF+
        L1gJp4CDxNt/28Fm8goISpyc+YQFxGYGqmneOpsZZL6EwFd2iSkzbzJCNLtIdPXcYIGwhSVe
        Hd/CDmFLSbzsb4OyiyWWzvrEBNHcwChxedsvNoiEscSsZ+2MIAcxC2hKrN+lD2JKCChLHLkF
        tZdPouPwX3aIMK9ER5sQRKO6xIHt06G2ykp0z/nMClHiITH3pRsk2CYzSvw8uYJtAqPCLCTf
        zELyzSyEvQsYmVcxiqUWFOempxYbFRjBozc5P3cTIzhtarntYJzy9oPeIUYmDsZDjBIczEoi
        vAvP7EwS4k1JrKxKLcqPLyrNSS0+xGgKDOqJzFKiyfnAxJ1XEm9oYmlgYmZmaG5kamCuJM7r
        lbIhUUggPbEkNTs1tSC1CKaPiYNTqoFpavOHFzv++NfvEHxpZHz8aWXIBsnDc/i4BOfU3jHS
        URP5NMW8XV055N3aw5svs/hevXXm9arrbIkb5jO+j3157/y/yPNGrjJLty3IP5hx+tTO6Qem
        3svYbnfF0K7a7jjT4n/bLMNmmlxu0WT+OVurzFV4t1r6K+PPUbU7L3X85NUtDHPZoFq2fpfz
        IWZRmwQRVYXnfC9nhdg3CqrY8yz57/Gra73YkePXTsloHmdkPCTz5+DcyVtMXPbNLL9aNW1n
        a0/qhR99mRFRq+qezs1TOzHHapZww4WHW29Peux0yP7WlPM79mV/9opZ8vZ+xs1bX/VlbP3Y
        1zsLfI9r+7HMbqrH5bizmbeZg8SMt81QWqHEUpyRaKjFXFScCAAFsvaHJAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWy7bCSnO7HjbuTDB7+4LB4MG8bm8Xl/doW
        84+cY7XY0XCE1aLvxUNmi02Pr7FazDi/j8mide8RdovnffuYHDg9Nq3qZPO4c20Pm8fmJfUe
        fVtWMXp83iQXwBrFZZOSmpNZllqkb5fAldG48CZbwV7hiv+9k5kbGH/wdzFyckgImEj8f7GA
        qYuRi0NIYAejxPLd8xkhErISz97tYIewhSXutxxhhSh6zyjx/sYhNpAEm4CuxJbnr8AaRATi
        JTZ/WcgCUsQsMI1JouPxDLBuYQEfid+N35hBbBYBVYlnO1YDFXFw8ArYSzz+HgixQF5iw/xe
        sBJOAQeJt/+2g80UAirZOWsVWJxXQFDi5MwnLCA2M1B989bZzBMYBWYhSc1CklrAyLSKUTK1
        oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4zLW0djDuWfVB7xAjEwfjIUYJDmYlEd6FZ3Ym
        CfGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cC0qHxPRqvK
        zzi7jBWrvVM36NkIWxp9O783ZJOxgG5BVvFWF42T1g7bxS8y8pU9vdTYdVPbcI9Abfd7Obm1
        024K3aj6PtmMm8d+VqJ+ObfDzTSnWo20wwX2n9g2u87Z6saQsvlBgvnCO1PPiVz0LZMx6Nid
        NHEWr1sBKyfrIwGVtmDuSderdS/OiRVovHXjoZ8qR1PCPA/WuldHNu+ZObF4lpLULb8QP6Y8
        Kdnj/BPjrBfV7hL3zgzuEZM3CT/SNXed6PfEdxPuqym57fijcsA9KeBuosuCqa08Z657Mvv1
        GpS8KFt9Pees7i59yX/Ru/U+fti0ttvvar3j0jIm9VN7FnqcPh3YGBmy/HbxWiWW4oxEQy3m
        ouJEAI9fLWLiAgAA
X-CMS-MailID: 20220629015913epcas2p4b7839d1d66027cfa01cba73f7593902c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220629015913epcas2p4b7839d1d66027cfa01cba73f7593902c
References: <20220629015650.138527-1-chanho61.park@samsung.com>
        <CGME20220629015913epcas2p4b7839d1d66027cfa01cba73f7593902c@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

By including exynosautov9-usi.dtsi, we can remove usi_0 definitions from
exynosautov9.dtsi. We also need to overide serial_0's pinctrl and
clkreq-on property in order to be used it as serial console.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../boot/dts/exynos/exynosautov9-sadk.dts     |  2 ++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 29 +------------------
 2 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index 2b30a7458297..eec3192c0631 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -50,6 +50,7 @@ ufs_1_fixed_vcc_reg: regulator-1 {
 };
 
 &serial_0 {
+	pinctrl-0 = <&uart0_bus_dual>;
 	status = "okay";
 };
 
@@ -74,6 +75,7 @@ &ufs_1 {
 };
 
 &usi_0 {
+	samsung,clkreq-on; /* needed for UART mode */
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 3217d5fed018..af0164204bb0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -351,34 +351,6 @@ syscon_peric0: syscon@10220000 {
 			reg = <0x10220000 0x2000>;
 		};
 
-		usi_0: usi@103000c0 {
-			compatible = "samsung,exynos850-usi";
-			reg = <0x103000c0 0x20>;
-			samsung,sysreg = <&syscon_peric0 0x1000>;
-			samsung,mode = <USI_V2_UART>;
-			samsung,clkreq-on; /* needed for UART mode */
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
-				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
-			clock-names = "pclk", "ipclk";
-			status = "disabled";
-
-			/* USI: UART */
-			serial_0: serial@10300000 {
-				compatible = "samsung,exynos850-uart";
-				reg = <0x10300000 0xc0>;
-				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&uart0_bus_dual>;
-				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
-					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
-				clock-names = "uart", "clk_uart_baud0";
-				status = "disabled";
-			};
-		};
-
 		ufs_0_phy: phy@17e04000 {
 			compatible = "samsung,exynosautov9-ufs-phy";
 			reg = <0x17e04000 0xc00>;
@@ -466,3 +438,4 @@ watchdog_cl1: watchdog@10060000 {
 };
 
 #include "exynosautov9-pinctrl.dtsi"
+#include "exynosautov9-usi.dtsi"
-- 
2.36.1

