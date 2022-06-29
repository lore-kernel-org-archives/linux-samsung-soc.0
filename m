Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5325AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 01:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiF2B7U (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiF2B7U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jun 2022 21:59:20 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122802D1C3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2022 18:59:17 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220629015915epoutp03355baa438f984184d6a78479c9fe51fb~89NREzhjK0663106631epoutp03H
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 01:59:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220629015915epoutp03355baa438f984184d6a78479c9fe51fb~89NREzhjK0663106631epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656467955;
        bh=Z20Yan2Qq6S/AQNS4qyxBoP1AlSLY0GLzFRTUSwXgcg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KoEmisSlOAlW6PWr1VuJrynnpeoTdMcjh73faBukKI2B1BBQmAOSLyZmEQeWgKRuC
         a4w1c6tM8jsJ8EU/8f5TQSBrGV2PacIp0/xfGdRUrSBNWJGBLBKXFq6vz6LyH7oWlx
         PWHztmXHy4tbPL/3NBDlYDyGQc0eXluPQhc3nzRE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220629015914epcas2p1074a6a8d197d28c625b11abc3fff30ba~89NQcUKoc3136831368epcas2p1O;
        Wed, 29 Jun 2022 01:59:14 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LXl4y1vWbz4x9QH; Wed, 29 Jun
        2022 01:59:14 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        C6.E8.09666.1F1BBB26; Wed, 29 Jun 2022 10:59:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0~89NO8nfJR2911029110epcas2p1g;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220629015913epsmtrp107d1365f8d76f6f3e0ba2c93de455196~89NO75SzZ2671226712epsmtrp1a;
        Wed, 29 Jun 2022 01:59:13 +0000 (GMT)
X-AuditID: b6c32a45-471ff700000025c2-92-62bbb1f15446
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.3A.08905.1F1BBB26; Wed, 29 Jun 2022 10:59:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220629015912epsmtip1193bfa30dc1db4f4bc6b8548a3ed7b7f~89NOrqCpp1210012100epsmtip1W;
        Wed, 29 Jun 2022 01:59:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 2/3] arm64: dts: exynosautov9: add exynosautov9-usi.dtsi
Date:   Wed, 29 Jun 2022 10:56:49 +0900
Message-Id: <20220629015650.138527-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629015650.138527-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmqe7HjbuTDH7MVrd4MG8bm8Xl/doW
        84+cY7XY0XCE1aLvxUNmi02Pr7FazDi/j8mide8RdovnffuYHDg9Nq3qZPO4c20Pm8fmJfUe
        fVtWMXp83iQXwBqVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+Ti
        E6DrlpkDdI6SQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1
        xMrQwMDIFKgwITvj4vPJzAXr5jJVvPh9mbmBsfkRYxcjJ4eEgInEwv7XzF2MXBxCAjsYJf5f
        m8kC4XxilHjyoYEVwvnGKHHg1Ul2mJb1h35CtexllHj6+ROU85FRYt3KQ6wgVWwCuhJbnr8C
        WyIiEC/x/MJ7sLnMApOYJM53NDODJIQFPCTOLNgMVsQioCrRsW4yWJxXwF7i47cpzBDr5CU2
        zO8FszkFHCTe/tvOCFEjKHFy5hMWEJsZqKZ562ywKyQEfrJLPOndBNXsInFr8h4oW1ji1fEt
        UD9ISbzsb4OyiyWWzvrEBNHcwChxedsvNoiEscSsZ+1A2ziANmhKrN+lD2JKCChLHLkFtZdP
        ouPwX3aIMK9ER5sQRKO6xIHt01kgbFmJ7jmfWSFsD4lZH+8xQgJrMqPE3lvH2ScwKsxC8s4s
        JO/MQli8gJF5FaNYakFxbnpqsVGBITyWk/NzNzGCk6iW6w7GyW8/6B1iZOJgPMQowcGsJMK7
        8MzOJCHelMTKqtSi/Pii0pzU4kOMpsDAnsgsJZqcD0zjeSXxhiaWBiZmZobmRqYG5krivF4p
        GxKFBNITS1KzU1MLUotg+pg4OKUamDavbG1cFpNWrtvkOp/12Kp7r3oedlZ/XLu3SK917ntD
        o/dPN1W37szef41Z1efb17/ONQoxb8NnmEzquON+ts2st/CNXJaGJb9X0JRpfx0ntbrrT1hX
        W7l2bYjxupimg7mh/Ytf891aeGSb7vFlaw+t2X5LzN1Rac2lqstvVR3f5MYuevl0lsAizczt
        BkHvdlrI7peVfCthWjD7LYtS79+eqypHPLkWzJynI7HYZPOSkH+PijzdOYKawtPmGMvt/coa
        n9xy9EG1FEO83lqXvzdvLOK5bm6Rs2uW1c8ja1dcerJXYD/P56WhJ+QNr2ez7nAzUCk6ubMj
        R3bji/ub5VayJQT95Ctiz7ihwbjg4AQlluKMREMt5qLiRACAJWmgKwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnO7HjbuTDK6vYbF4MG8bm8Xl/doW
        84+cY7XY0XCE1aLvxUNmi02Pr7FazDi/j8mide8RdovnffuYHDg9Nq3qZPO4c20Pm8fmJfUe
        fVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlXHx+WTmgnVzmSpe/L7M3MDY/Iixi5GTQ0LARGL9
        oZ/MXYxcHEICuxklfr1dzAqRkJV49m4HO4QtLHG/5QgrRNF7Rokl39YwgSTYBHQltjx/BTZJ
        RCBeYvOXhSwgRcwC05gkOh7PAOsWFvCQOLNgM1gRi4CqRMe6ycwgNq+AvcTHb1OYITbIS2yY
        3wtmcwo4SLz9tx2sXgioZuesVVD1ghInZz5hAbGZgeqbt85mnsAoMAtJahaS1AJGplWMkqkF
        xbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMHBrqW5g3H7qg96hxiZOBgPMUpwMCuJ8C48szNJ
        iDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBqbLB1r/3Nd8
        z260uyBxxzab1JRcmX+H/bN+7Fql/+KnfoSj2aqVV1hP7C5O/ND1cOFff9Pp2wOb1s+Pub3z
        U4Epa4/uI97zHX1vFdb8CRSd/Sx8Op/i60O3VzRu/WtoUJrPx3VPWp9X++uhed+fWPKUxKac
        0FoVYrbY4deh24smHNm5g+ucyPTM/P13dix/ZBX7vPxc9/s6w5BZvn+4uSoc5h2cbp5ZMZOp
        sYP7/v83Ys9bSkSTJq164jBtorl3c/qLJybzhXeFmV/T72sSXfL2X2Oh+lVftuP191n9rWyZ
        U5tXxtb77JJ+uHFD7D4xETYO/5kFvV8/H5zE0b6pzYTl875flVM1w9y521zfVDEpsRRnJBpq
        MRcVJwIAhcGlduUCAAA=
X-CMS-MailID: 20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0
References: <20220629015650.138527-1-chanho61.park@samsung.com>
        <CGME20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Universal Serial Interface (USI) supports three types of serial interface
such as Universal Asynchronous Receiver and Transmitter (UART), Serial
Peripheral Interface (SPI), and Inter-Integrated Circuit (I2C).
Each protocols can be working independently and configured as one of
those using external configuration inputs.
Exynos Auto v9 SoC support 12 USIs. When a USI uses two pins such as i2c
and 3 wire uarts(RX/TX only), we can use remain two pins as i2c mode.
So, we can define one USI node that includes serial/spi and hsi2c.
usi_i2c nodes can be used only for i2c mode.

We can have below combinations for one USI.
1) The usi node is used either 4 pin uart or 4 pin spi
 -> No usi_i2c can be used
2) The usi node is used 2 pin uart(RX/TX) and i2c(SDA/SCL)
 -> usi_i2c should be enabled to use the latter i2c
3) The usi node is used i2c(SDA/SCL) and i2c(SDA/SCL)
 -> usi_i2c should be enabled to use the latter i2c

By default, all USIs are initially set to uart mode by below setting.
samsung,mode = <USI_V2_UART>;
You can change it either USI_V2_SPI or USI_V2_I2C.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../boot/dts/exynos/exynosautov9-usi.dtsi     | 1127 +++++++++++++++++
 1 file changed, 1127 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
new file mode 100644
index 000000000000..0e4c6332770b
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
@@ -0,0 +1,1127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's ExynosAutov9 SoC USI device tree source
+ *
+ * Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ *
+ * Samsung's ExynosAutov9 SoC USI(Universal Serial Interface, uart/spi/i2c)
+ * are listed as device tree nodes in this file.
+ */
+
+/* PERIC0 USIs */
+&soc {
+	syscon_peric0: syscon@10220000 {
+		compatible = "samsung,exynosautov9-sysreg", "syscon";
+		reg = <0x10220000 0x2000>;
+	};
+
+	usi_0: usi@103000c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103000c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1000>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_0: serial@10300000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10300000 0xc0>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_0: spi@10300000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10300000 0x30>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_bus &spi0_cs_func>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 1 &pdma0 0>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_0: hsi2c@10300000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10300000 0xc0>;
+			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c0_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_0: usi@103100c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103100c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1004>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_1>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_1>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_1: hsi2c@10310000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10310000 0xc0>;
+			interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c1_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_1>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_1>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_1: usi@103200c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103200c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1008>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_1: serial@10320000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10320000 0xc0>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_1: spi@10320000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10320000 0x30>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_bus &spi1_cs_func>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 3 &pdma0 2>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_2: hsi2c@10320000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10320000 0xc0>;
+			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c2_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_1: usi@103300c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103300c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x100c>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_3>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_3>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_3: hsi2c@10330000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10330000 0xc0>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c3_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_3>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_3>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_2: usi@103400c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103400c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1010>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_2: serial@10340000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10340000 0xc0>;
+			interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_2: spi@10340000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10340000 0x30>;
+			interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi2_bus &spi2_cs_func>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 5 &pdma0 4>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_4: hsi2c@10340000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10340000 0xc0>;
+			interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c4_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_2: usi@103500c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103500c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1014>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_5>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_5>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_5: hsi2c@10350000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10350000 0xc0>;
+			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c5_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_5>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_3: usi@103600c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103600c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1018>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_3: serial@10360000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10360000 0xc0>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart3_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_3: spi@10360000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10360000 0x30>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi3_bus &spi3_cs_func>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 7 &pdma0 6>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_6: hsi2c@10360000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10360000 0xc0>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c6_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_3: usi@103700c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103700c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x101c>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_7>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_7>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_7: hsi2c@10370000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10370000 0xc0>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c7_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_7>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_4: usi@103800c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103800c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1020>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_4: serial@10380000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10380000 0xc0>;
+			interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart4_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_4: spi@10380000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10380000 0x30>;
+			interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi4_bus &spi4_cs_func>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 9 &pdma0 8>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_8: hsi2c@10380000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10380000 0xc0>;
+			interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c8_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_4: usi@103900c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103900c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1024>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_9>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_9>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_9: hsi2c@10390000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10390000 0xc0>;
+			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c9_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_9>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_9>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_5: usi@103a00c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103a00c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x1028>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_5: serial@103a0000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x103a0000 0xc0>;
+			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart5_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_5: spi@103a0000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x103a0000 0x30>;
+			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi5_bus &spi5_cs_func>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 11 &pdma0 10>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_10: hsi2c@103a0000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x103a0000 0xc0>;
+			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c10_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_5: usi@103b00c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x103b00c0 0x20>;
+		samsung,sysreg = <&syscon_peric0 0x102c>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_11>,
+			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_11>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_11: hsi2c@103b0000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x103b0000 0xc0>;
+			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c11_bus>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_11>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_11>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
+
+/* PERIC1 USIs */
+&soc {
+	syscon_peric1: syscon@10820000 {
+		compatible = "samsung,exynosautov9-sysreg", "syscon";
+		reg = <0x10820000 0x2000>;
+	};
+
+	usi_6: usi@109000c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109000c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1000>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_6: serial@10900000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10900000 0xc0>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart6_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_6: spi@10900000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10900000 0x30>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi6_bus &spi6_cs_func>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI06_USI>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 13 &pdma0 12>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_12: hsi2c@10900000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10900000 0xc0>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c12_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_6: usi@109100c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109100c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1004>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_1>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_1>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_13: hsi2c@10910000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10910000 0xc0>;
+			interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c13_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_1>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_1>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_7: usi@109200c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109200c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1008>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_7: serial@10920000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10920000 0xc0>;
+			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart7_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_7: spi@10920000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10920000 0x30>;
+			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi7_bus &spi7_cs_func>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI07_USI>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 15 &pdma0 14>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_14: hsi2c@10920000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10920000 0xc0>;
+			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c14_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_7: usi@109300c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109300c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x100c>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_3>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_3>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_15: hsi2c@10930000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10930000 0xc0>;
+			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c15_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_3>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_3>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_8: usi@109400c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109400c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1010>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_8: serial@10940000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10940000 0xc0>;
+			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart8_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_8: spi@10940000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10940000 0x30>;
+			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi8_bus &spi8_cs_func>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI08_USI>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 17 &pdma0 16>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_16: hsi2c@10940000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10940000 0xc0>;
+			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c16_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_8: usi@109500c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109500c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1014>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_5>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_5>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_17: hsi2c@10950000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10950000 0xc0>;
+			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c17_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_5>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_9: usi@109600c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109600c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1018>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_9: serial@10960000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10960000 0xc0>;
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart9_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_9: spi@10960000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10960000 0x30>;
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi9_bus &spi9_cs_func>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 19 &pdma0 18>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_18: hsi2c@10960000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10960000 0xc0>;
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c18_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_9: usi@109700c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109700c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x101c>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_7>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_7>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_19: hsi2c@10970000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10970000 0xc0>;
+			interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c19_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_7>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_7>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_10: usi@109800c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109800c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1020>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_10: serial@10980000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x10980000 0xc0>;
+			interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart10_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_10: spi@10980000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x10980000 0x30>;
+			interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi10_bus &spi10_cs_func>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			dmas = <&pdma0 21 &pdma0 20>;
+			dma-names = "tx", "rx";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_20: hsi2c@10980000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10980000 0xc0>;
+			interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c20_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_10: usi@109900c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109900c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1024>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_9>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_9>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_21: hsi2c@10990000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x10990000 0xc0>;
+			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c21_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_9>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_9>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_11: usi@109a00c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109a00c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x1028>;
+		samsung,mode = <USI_V2_UART>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: UART */
+		serial_11: serial@109a0000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x109a0000 0xc0>;
+			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart11_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>;
+			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
+			status = "disabled";
+		};
+
+		/* USI: SPI */
+		spi_11: spi@109a0000 {
+			compatible = "samsung,exynosautov9-spi";
+			reg = <0x109a0000 0x30>;
+			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi11_bus &spi11_cs_func>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>;
+			clock-names = "spi", "spi_busclk0", "spi_ioclk";
+			samsung,spi-src-clk = <0>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		/* USI: I2C */
+		hsi2c_22: hsi2c@109a0000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x109a0000 0xc0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c22_bus>;
+			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+
+	usi_i2c_11: usi@109b00c0 {
+		compatible = "samsung,exynos850-usi";
+		reg = <0x109b00c0 0x20>;
+		samsung,sysreg = <&syscon_peric1 0x102c>;
+		samsung,mode = <USI_V2_I2C>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_11>,
+			 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_11>;
+		clock-names = "pclk", "ipclk";
+		status = "disabled";
+
+		/* USI: I2C */
+		hsi2c_23: hsi2c@109b0000 {
+			compatible = "samsung,exynosautov9-hsi2c";
+			reg = <0x109b0000 0xc0>;
+			interrupts = <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hsi2c23_bus>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_11>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_11>;
+			clock-names = "hsi2c", "hsi2c_pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.36.1

