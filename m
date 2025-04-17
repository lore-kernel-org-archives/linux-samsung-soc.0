Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07454A3C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2025 05:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213634; cv=none; b=JSGzQVPZ8gnTo8n0qPG1FyyVUM0Ga5h8TGtrV4kQgnHw42TzXfw514qMnCgL4ngT6sO5ZXn0Z2Nkn4/yIgpWOkMNeKsoRglZll+5TLl/eJ2JkYAkGuchfPOjTBRConFdRA4Ji4k2qPUOCVawxQ0jFpyEMbFCUUmknWAPLj1TblQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213634; c=relaxed/simple;
	bh=EMPv+30duUf3KGOxPc05W50hPK1XxmSoraJPPrs32Ss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=B+BPJ+GKHZN7zh9iQhCob/T14FHaTS58k0r1P/zXrIAcnjPL1QkW8LQ9Q5KIaLtjRGk3Kpbrbd23seATk04SObvw5qHhS82hFd5dNnPbrtdiOjWIWQ02ivHuvIRLsUxffYOu7cel9OMStWp7IfsDLWOAoHzHhLvxdQ80oh7ZOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DP3TaykK; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DP3TaykK"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250421053343epoutp02f592663a094d2d94d0f85e27d94eebc4~4PotaW0zu2563425634epoutp022
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2025 05:33:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250421053343epoutp02f592663a094d2d94d0f85e27d94eebc4~4PotaW0zu2563425634epoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745213623;
	bh=WoiUrPjEkbGJeW8Nii0RkhT1p/hJupnnhFGAZHhDwOc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=DP3TaykKvdIgILbwGaf5wLYlScHLrNXvftQlcUn87xP4oETbFp7jR2bKIiB87jH7n
	 ggi56HfBAbTlCAvpIsknvOGBFugI7HBt5MtQvqtjqfhXFa5npp+FKdtfefGVd3UC80
	 OocjLAEoO7CLRNKro23lcl07z9S47TaKoLWTGWJs=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250421053343epcas5p2d7b180ef8cb0bc8946be4f797f69fef6~4Pos6z4aU1662716627epcas5p2Z;
	Mon, 21 Apr 2025 05:33:43 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.176]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZgvDP0Zvyz2SSKZ; Mon, 21 Apr
	2025 05:33:41 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250417112513epcas5p2a44d0a4cfca2cccf97f1599af0e6b494~3F2dciK1c1820418204epcas5p24;
	Thu, 17 Apr 2025 11:25:13 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250417112513epsmtrp213925a8db26c54a45426e0c34c9c14f2~3F2db2LQ12679426794epsmtrp2Z;
	Thu, 17 Apr 2025 11:25:13 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-4e-6800e519774a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A9.6E.19478.915E0086; Thu, 17 Apr 2025 20:25:13 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250417112511epsmtip2265fe892b3c26916282c8f618f730079~3F2b6NQGT2796527965epsmtip2s;
	Thu, 17 Apr 2025 11:25:11 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: robh@kernel.org, alim.akhtar@samsung.com, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	dev.tailor@samsung.com, rosa.pila@samsung.com, faraz.ata@samsung.com
Subject: [PATCH v3] arm64: dts: exynos: Add DT node for all UART ports
Date: Thu, 17 Apr 2025 17:05:11 +0530
Message-Id: <20250417113511.759268-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWy7bCSvK7kU4YMgwuv+S0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BYvZ91js9j0+BqrxeVdc9gsZpzfx2Txf88OdosvPx8wO3B7bFrV
	yeaxeUm9R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGWc/d3LUvCnm7Fi/3K7BsaNuV2MnBwS
	AiYSv84eZe9i5OIQEtjOKDFhywEmiISkxOGnd1khbGGJlf+eQxW9ZZRY0rOQHSTBJqAuMfPG
	ERYQW0QgWqJx1gI2kCJmgeuMEvcv3wYrEhZwk5h+cQ2YzSKgKnFv704wm1fAWmLF5WeMEBvk
	JfYfPMsMEReUODnzCdhQZqB489bZzBMY+WYhSc1CklrAyLSKUTS1oDg3PTe5wFCvODG3uDQv
	XS85P3cTIzh4tYJ2MC5b/1fvECMTB+MhRgkOZiUR3nPm/9KFeFMSK6tSi/Lji0pzUosPMUpz
	sCiJ8yrndKYICaQnlqRmp6YWpBbBZJk4OKUamAQUS+5cmR9fz5yuqVjaF37d9PaqC5GnXydw
	FgpO4/3k8DommOeziYLH4+5H/ZV8yrtDUj/OaDxX+vXArndqtQzPX+n4X7h19KzD3bhPU0Q+
	BJ2P3xJfy9NrmZu7fcfMD9cmcF94oJXr0HmjuN5+9bfJP/UNivm+xwrl7bpY5HP/YZ2Xz/Jr
	bbtiOs8EFp9VOuh3cOpB+b3PEg6X+WxKqlQXdL0uVvo7sdG5Z+N30TNThZ8Y/OrK0CiuC55Q
	4z3zwseqPddOfb/v3OBz+uLFVTsFa3dl1xx9enzqwf69cdFyJ7Q5Vj1wW2I4a/Flw/ef9T3L
	gs/l3tfJ8o2PfaXZ55h7+bDGFokTbbXc7B63k5RYijMSDbWYi4oTAau4WK7NAgAA
X-CMS-MailID: 20250417112513epcas5p2a44d0a4cfca2cccf97f1599af0e6b494
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250417112513epcas5p2a44d0a4cfca2cccf97f1599af0e6b494
References: <CGME20250417112513epcas5p2a44d0a4cfca2cccf97f1599af0e6b494@epcas5p2.samsung.com>

Universal Serial Interface (USI) supports three serial protocol
like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
Add all the USI DT node and subsequent uart nodes for all the instances.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
Changes in v3:
- Sorted USI nodes by unit address.
- USI is spread across two blocks BLK_PERIC0 and BLK_PERIC1.
  USI00 to USI08 fall under BLK_PERIC0,
  USI09 to USI17 fall under BLK_PERIC1.
- Link to v2: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250318075635.3372599-1-faraz.ata@samsung.com/

Changes in v2:
- Fixed review comments from Krzysztof
- Removed extra blank line.
- Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250312061932.1797993-2-faraz.ata@samsung.com/

 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 493 ++++++++++++++++++
 1 file changed, 493 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index fc6ac531d597..86e699d5560b 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -457,6 +457,238 @@ serial_0: serial@10880000 {
 			};
 		};
 
+		usi_1: usi@108a00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108a00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1008>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_1: serial@108a0000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x108a0000 0xc0>;
+				interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart1_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI01_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
+		usi_2: usi@108c00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108c00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1010>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_2: serial@108c0000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x108c0000 0xc0>;
+				interrupts = <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart2_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI02_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_3: usi@108e00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x108e00c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1018>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_3: serial@108e0000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x108e0000 0xc0>;
+				interrupts = <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart3_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI03_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_4: usi@109000c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109000c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1020>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_4: serial@10900000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10900000 0xc0>;
+				interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart4_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI04_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_5: usi@109200c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109200c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1028>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_5: serial@10920000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10920000 0xc0>;
+				interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart5_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_6: usi@109400c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109400c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1030>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_6: serial@10940000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10940000 0xc0>;
+				interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart6_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI06_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_7: usi@109600c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109600c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1038>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_7: serial@10960000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10960000 0xc0>;
+				interrupts = <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart7_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI07_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_8: usi@109800c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109800c0 0x20>;
+			samsung,sysreg = <&syscon_peric0 0x1040>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_8: serial@10980000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10980000 0xc0>;
+				interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart8_bus>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI08_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
 		pwm: pwm@109b0000 {
 			compatible = "samsung,exynosautov920-pwm",
 				     "samsung,exynos4210-pwm";
@@ -493,6 +725,267 @@ pinctrl_peric1: pinctrl@10c30000 {
 			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi_9: usi@10c800c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10c800c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1000>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_9: serial@10c8000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10c80000 0xc0>;
+				interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart9_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI09_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <256>;
+				status = "disabled";
+			};
+		};
+
+		usi_10: usi@10ca00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10ca00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1008>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_10: serial@10ca0000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10ca0000 0xc0>;
+				interrupts = <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart10_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI10_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_11: usi@10cc00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10cc00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1010>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_11: serial@10cc0000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10cc0000 0xc0>;
+				interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart11_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI11_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_12: usi@10ce00c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10ce00c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1018>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_12: serial@10ce0000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10ce0000 0xc0>;
+				interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart12_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI12_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_13: usi@10d000c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d000c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1020>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_13: serial@10d00000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10d00000 0xc0>;
+				interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart13_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI13_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_14: usi@10d200c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d200c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1028>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_14: serial@10d20000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10d20000 0xc0>;
+				interrupts = <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart14_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI14_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_15: usi@10d400c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d400c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1030>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_15: serial@10d40000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10d40000 0xc0>;
+				interrupts = <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart15_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI15_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_16: usi@10d600c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d600c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1038>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_16: serial@10d60000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10d60000 0xc0>;
+				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart16_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI16_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
+		usi_17: usi@10d800c0 {
+			compatible = "samsung,exynosautov920-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x10d800c0 0x20>;
+			samsung,sysreg = <&syscon_peric1 0x1040>;
+			samsung,mode = <USI_V2_UART>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
+			clock-names = "pclk", "ipclk";
+			status = "disabled";
+
+			serial_17: serial@10d80000 {
+				compatible = "samsung,exynosautov920-uart",
+					     "samsung,exynos850-uart";
+				reg = <0x10d80000 0xc0>;
+				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart17_bus>;
+				clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+					 <&cmu_peric1 CLK_DOUT_PERIC1_USI17_USI>;
+				clock-names = "uart", "clk_uart_baud0";
+				samsung,uart-fifosize = <64>;
+				status = "disabled";
+			};
+		};
+
 		cmu_top: clock-controller@11000000 {
 			compatible = "samsung,exynosautov920-cmu-top";
 			reg = <0x11000000 0x8000>;
-- 
2.34.1

