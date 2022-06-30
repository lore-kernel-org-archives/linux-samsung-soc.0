Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573C5CCA481
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 02:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiF3CUE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 22:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbiF3CUB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 22:20:01 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14D939680
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 19:19:55 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220630021953epoutp026526144ac8de14bc21a6f161721a99c2~9RIkLKcSe0517205172epoutp02E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 02:19:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220630021953epoutp026526144ac8de14bc21a6f161721a99c2~9RIkLKcSe0517205172epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656555593;
        bh=n6R+EaBDGr3PMpyoD224JmogNqYMQ1om/71tV+Z0SB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PF9BY6oln1ANKuV0w+nsKviuChrPXEcy/QTkQB8Zja6QnXU+MGJrCSch1H3iBWSRg
         tTWGQfinUxM6LTbHViGwK+2uomhuiYuf67CuwrysKXQlIwYAxg6PcRExT8HBTkYURV
         j4tDuO2GQNgJflIPMoh3/Djf3EsO3fpXd1XVJNeE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220630021952epcas2p37d73e640b0e61f8d99949882612351e9~9RIjv_T701312413124epcas2p3Z;
        Thu, 30 Jun 2022 02:19:52 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4LYMVJ20lGz4x9Q2; Thu, 30 Jun
        2022 02:19:52 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        39.47.09662.8480DB26; Thu, 30 Jun 2022 11:19:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epcas2p27f839eead168052d03039c2e3efa3460~9RIisazIg0540905409epcas2p25;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220630021951epsmtrp2d60461ba03a8a07fd118d59dca640676~9RIiro0rj1696616966epsmtrp2p;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-28-62bd0848b63c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B8.06.08802.7480DB26; Thu, 30 Jun 2022 11:19:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epsmtip20422501e40d4bb493708fdd05b8948d1~9RIifHjDg3063230632epsmtip2B;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 4/4] arm64: dts: exynosautov9: add usi device tree nodes
Date:   Thu, 30 Jun 2022 11:16:56 +0900
Message-Id: <0588d46af06f9d932f4a526c3b04601079b4fde1.1656554759.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656554759.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmma4Hx94kg+XzOC0ezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4
        BOi6ZeYAnaOkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0st
        sTI0MDAyBSpMyM5Y/3YxU8GvVUwVU+5+ZGlg/PCMsYuRk0NCwERi1fsuJhBbSGAHo0TD0/ou
        Ri4g+xOjxPbXExkhnM+MEifbdrLDdHy/dIkFIrGLUeLL1j42COcjo8T0s6/BqtgEdCW2PH8F
        tkNEIF7i+YX3YB3MApOYJM53NDODJIQFvCUmXzjPCmKzCKhK3Hh9FayBF6jhzNdNLBDr5CU2
        zO8Fq+cUsJVoWvudGaJGUOLkzCdgNcxANc1bZzODLJAQ+Mou0db5FupWF4kLzzcyQdjCEq+O
        b4GKS0l8freXDcIullg66xMTRHMDo8Tlbb+gEsYSs561A13EAbRBU2L9Ln0QU0JAWeLILai9
        fBIdh/+yQ4R5JTrahCAa1SUObJ8Odb6sRPecz6wQJR4SazczQ4J6AqPE3hP5ExgVZiF5ZhaS
        Z2YhrF3AyLyKUSy1oDg3PbXYqMAEHsXJ+bmbGMHpU8tjB+Pstx/0DjEycTAeYpTgYFYS4V14
        ZmeSEG9KYmVValF+fFFpTmrxIUZTYFBPZJYSTc4HJvC8knhDE0sDEzMzQ3MjUwNzJXFer5QN
        iUIC6YklqdmpqQWpRTB9TBycUg1M25lmGX7akXBtngVTi+m5zO6bG3acEmsp2XjESYqT77bJ
        H42UhcfquyTsm/YEz7t9YvnHR+/vvr89+d/68DvJcgtflVoXvpsm8cnv3rwZwdfezo3KsNbn
        a1HSj7tl072zrN/kTuy3dymHhZcEPY2RErd4G3biZ7KO3Aq/91If8juFdb/NVWHjfGN1abYf
        c8R/Lv6z3RGRbgbK8qxsMVWS5x7frXm3bMv7LVJhFZV57h0GL3yv1Jl1n1JbNvVnWmFqopL9
        72I17Yb4JXs/pyp2Zrw5xTdvn0zQtVfv966ptd5vUHHg3d6nyimu54wKRCYfTf/qL9e4YTl3
        VWab6ELG25ceLdt7bjEbZ/UUPtv3SizFGYmGWsxFxYkA5WUpVigEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSvK47x94kg7Pf1C0ezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZax/u5ip4Ncqpoopdz+yNDB+eMbYxcjJISFgIvH9
        0iWWLkYuDiGBHYwS3WtXs0EkZCWevdvBDmELS9xvOcIKUfSeUWLhjdesIAk2AV2JLc9fgU0S
        EYiX2PxlIdgkZoFpTBIdj2eAdQsLeEtMvnAerIFFQFXixuurYA28QA1nvm5igdggL7Fhfi8z
        iM0pYCvRtPY7mC0kYCOxe8FSqHpBiZMzn4DVMwPVN2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz
        03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCg11LawfjnlUf9A4xMnEwHmKU4GBWEuFdeGZnkhBv
        SmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MQTrvcwzPFjN8
        mNa+PfavyItu29XX76V9LLnO9l2tuNHm+er+Ccnth189DfzgNr83UMnhC9+P80l9tbwXnmy8
        oj91XfYv+xz/+m+hAtNKpK8uv6vx94RVTC3/PvNQGwH1K9qRVmFaHhWTf7rdOnBfVaVnasCV
        Xxxs1THfy7hVd+6dNlu7+kvzhMILb632uJ59+EX6vte26HYp4937tKef+CLLtIWtdld44Inn
        HRO1Jjx9Y7H9adch7qqtdveu75Cu8bvIGbD39bYqzjrBGf1xslFs/1iKk86LLV6qPcX/04m3
        igtstq4UUBR9l+vIbn3idEnx7U/3TMVS1E+dMdCYFNO3kre265dK02mngD3LlViKMxINtZiL
        ihMBO9OR6+UCAAA=
X-CMS-MailID: 20220630021951epcas2p27f839eead168052d03039c2e3efa3460
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220630021951epcas2p27f839eead168052d03039c2e3efa3460
References: <cover.1656554759.git.chanho61.park@samsung.com>
        <CGME20220630021951epcas2p27f839eead168052d03039c2e3efa3460@epcas2p2.samsung.com>
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
 .../boot/dts/exynos/exynosautov9-sadk.dts     |    2 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 1077 ++++++++++++++++-
 2 files changed, 1074 insertions(+), 5 deletions(-)

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
index c4cfa93e4c2e..2013718532f3 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -351,12 +351,17 @@ syscon_peric0: syscon@10220000 {
 			reg = <0x10220000 0x2000>;
 		};
 
+		syscon_peric1: syscon@10820000 {
+			compatible = "samsung,exynosautov9-sysreg", "syscon";
+			reg = <0x10820000 0x2000>;
+		};
+
 		usi_0: usi@103000c0 {
-			compatible = "samsung,exynos850-usi";
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
 			reg = <0x103000c0 0x20>;
 			samsung,sysreg = <&syscon_peric0 0x1000>;
 			samsung,mode = <USI_V2_UART>;
-			samsung,clkreq-on; /* needed for UART mode */
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -365,16 +370,1078 @@ usi_0: usi@103000c0 {
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
 
-			/* USI: UART */
 			serial_0: serial@10300000 {
-				compatible = "samsung,exynos850-uart";
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
 				reg = <0x10300000 0xc0>;
 				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&uart0_bus_dual>;
+				pinctrl-0 = <&uart0_bus>;
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+
+			spi_0: spi@10300000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10300000 0x30>;
+				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi0_bus &spi0_cs_func>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 1>, <&pdma0 0>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_0: i2c@10300000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10300000 0xc0>;
+				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c0_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_0: usi@103100c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103100c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1004>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_1>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_1>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_1: i2c@10310000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10310000 0xc0>;
+				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c1_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_1>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_1>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_1: usi@103200c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103200c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1008>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_1: serial@10320000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10320000 0xc0>;
+				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart1_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+
+			spi_1: spi@10320000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10320000 0x30>;
+				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi1_bus &spi1_cs_func>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 3>, <&pdma0 2>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_2: i2c@10320000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10320000 0xc0>;
+				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c2_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_2>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_1: usi@103300c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103300c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x100c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_3>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_3: i2c@10330000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10330000 0xc0>;
+				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c3_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_3>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_2: usi@103400c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103400c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1010>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_2: serial@10340000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10340000 0xc0>;
+				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart2_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_2: spi@10340000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10340000 0x30>;
+				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi2_bus &spi2_cs_func>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 5>, <&pdma0 4>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_4: i2c@10340000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10340000 0xc0>;
+				interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c4_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_4>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_2: usi@103500c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103500c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1014>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_5: i2c@10350000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10350000 0xc0>;
+				interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c5_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_5>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_3: usi@103600c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103600c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1018>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_3: serial@10360000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10360000 0xc0>;
+				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart3_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_3: spi@10360000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10360000 0x30>;
+				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi3_bus &spi3_cs_func>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 7>, <&pdma0 6>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_6: i2c@10360000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10360000 0xc0>;
+				interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c6_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_6>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_3: usi@103700c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103700c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x101c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_7: i2c@10370000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10370000 0xc0>;
+				interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c7_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_4: usi@103800c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103800c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1020>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_4: serial@10380000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10380000 0xc0>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart4_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_4: spi@10380000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10380000 0x30>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi4_bus &spi4_cs_func>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 9>, <&pdma0 8>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_8: i2c@10380000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10380000 0xc0>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c8_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_8>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_4: usi@103900c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103900c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1024>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_9>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_9: i2c@10390000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10390000 0xc0>;
+				interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c9_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_9>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_5: usi@103a00c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103a00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1028>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_5: serial@103a0000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x103a0000 0xc0>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart5_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_5: spi@103a0000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x103a0000 0x30>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi5_bus &spi5_cs_func>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 11>, <&pdma0 10>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_10: i2c@103a0000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x103a0000 0xc0>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c10_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_10>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_5: usi@103b00c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x103b00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x102c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_11>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_11: i2c@103b0000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x103b0000 0xc0>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c11_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_11>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_6: usi@109000c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109000c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1000>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_6: serial@10900000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10900000 0xc0>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart6_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+
+			spi_6: spi@10900000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10900000 0x30>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi6_bus &spi6_cs_func>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI06_USI>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 13>, <&pdma0 12>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_12: i2c@10900000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10900000 0xc0>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c12_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_0>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_0>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_6: usi@109100c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109100c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1004>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_1>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_1>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_13: i2c@10910000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10910000 0xc0>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c13_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_1>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_1>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_7: usi@109200c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109200c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1008>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_7: serial@10920000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10920000 0xc0>;
+				interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart7_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_7: spi@10920000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10920000 0x30>;
+				interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi7_bus &spi7_cs_func>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI07_USI>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 15>, <&pdma0 14>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_14: i2c@10920000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10920000 0xc0>;
+				interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c14_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_2>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_2>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_7: usi@109300c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109300c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x100c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_3>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_15: i2c@10930000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10930000 0xc0>;
+				interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c15_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_3>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_3>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_8: usi@109400c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109400c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1010>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_8: serial@10940000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10940000 0xc0>;
+				interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart8_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_8: spi@10940000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10940000 0x30>;
+				interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi8_bus &spi8_cs_func>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI08_USI>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 17>, <&pdma0 16>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_16: i2c@10940000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10940000 0xc0>;
+				interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c16_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_4>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_4>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_8: usi@109500c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109500c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1014>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_5>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_17: i2c@10950000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10950000 0xc0>;
+				interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c17_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_5>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_5>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_9: usi@109600c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109600c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1018>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_9: serial@10960000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10960000 0xc0>;
+				interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart9_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_9: spi@10960000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10960000 0x30>;
+				interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi9_bus &spi9_cs_func>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 19>, <&pdma0 18>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_18: i2c@10960000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10960000 0xc0>;
+				interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c18_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_6>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_6>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_9: usi@109700c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x101c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_7>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_19: i2c@10970000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c19_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_7>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_7>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_10: usi@109800c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109800c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1020>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_10: serial@10980000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10980000 0xc0>;
+				interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart10_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_10: spi@10980000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x10980000 0x30>;
+				interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi10_bus &spi10_cs_func>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				dmas = <&pdma0 21>, <&pdma0 20>;
+				dma-names = "tx", "rx";
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_20: i2c@10980000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10980000 0xc0>;
+				interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c20_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_8>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_8>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_10: usi@109900c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109900c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1024>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_9>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_21: i2c@10990000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x10990000 0xc0>;
+				interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c21_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_9>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_9>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_11: usi@109a00c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109a00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1028>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_11: serial@109a0000 {
+				compatible = "samsung,exynosautov9-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x109a0000 0xc0>;
+				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart11_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+
+			spi_11: spi@109a0000 {
+				compatible = "samsung,exynosautov9-spi";
+				reg = <0x109a0000 0x30>;
+				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi11_bus &spi11_cs_func>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>;
+				clock-names = "spi", "spi_busclk0", "spi_ioclk";
+				samsung,spi-src-clk = <0>;
+				num-cs = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			hsi2c_22: i2c@109a0000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x109a0000 0xc0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c22_bus>;
+				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_10>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_10>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		usi_i2c_11: usi@109b00c0 {
+			compatible = "samsung,exynosautov9-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109b00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x102c>;
+			samsung,mode = <USI_V2_I2C>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_11>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			hsi2c_23: i2c@109b0000 {
+				compatible = "samsung,exynosautov9-hsi2c";
+				reg = <0x109b0000 0xc0>;
+				interrupts = <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c23_bus>;
+				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_IPCLK_11>,
+					 <&cmu_peric1 CLK_GOUT_PERIC1_PCLK_11>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
-- 
2.36.1

