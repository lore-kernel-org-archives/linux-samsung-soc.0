Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B75B1EFFB7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741764984; cv=none; b=mQxlqwekKWexdQuAGQfbON9oK2RsL8W1S6AVw0ZjHYfCbJXL6p+vIQHjxzhhbw8cdclUngQcTqps8wsKwzMJNboTKoEnr9TcQOGyOyZ8+0Auol6td3xle0PbaQpaYkjCuC5uTtDaZTwkfhJn1+8RzHWMVuoyTDT1qichUO7ewjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741764984; c=relaxed/simple;
	bh=h93/GlqQ9dRDjXPQJMt/xksCn9PV5BLEez0/JraaG2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=G5smOCZLEcOuAy/vOH+NDsLnsazCshswb6rmMUAbUaZTxwqysWYbY9/D4lzBbDUd/B1taflni64+2ELMehjT4ZDJGx5DA68j49dPOh98D9wnDLLppee6vPKiOXudT590E6UO9YzmaX4/s/PwKvBDPnL6tcE1XKxEUw5cnVbGxek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TO76qTgE; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TO76qTgE"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250312073612epoutp03cf624fe089117d752f514cf90c8fb5fa~r-gOqak2L2913429134epoutp03D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 07:36:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250312073612epoutp03cf624fe089117d752f514cf90c8fb5fa~r-gOqak2L2913429134epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741764972;
	bh=lf4zQ7xRkzJCli5mzPs1fjTq37UVkgDjVAUZLCBEFiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TO76qTgEOeYdF8ztPRAhLxMmUO/fDCUmewLTeCgzU9a3cGUw0kJfSkQuxYi5RUfMw
	 6BZryPFPf2FKGv1eLDfIl0UukK/6KtAQbY0jSJxQSy9xhtPjZrIwC+CD9kKxSzMuE+
	 JBdriyu1q1Mgz1MLInx69CJ85YH0tDH9XPQRw0HA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250312073611epcas5p2d8a297f9a450c813939cc05162308b5c~r-gN4WBBp0141501415epcas5p2O;
	Wed, 12 Mar 2025 07:36:11 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4ZCMr95xvlz4x9QC; Wed, 12 Mar
	2025 07:36:09 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1C.B4.20052.96931D76; Wed, 12 Mar 2025 16:36:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250312061058epcas5p3ccf293213fe883129358833572b17d92~r_VzajMUy3187631876epcas5p3C;
	Wed, 12 Mar 2025 06:10:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250312061058epsmtrp2194f8e10fd56e9a8fa8c6ba0b95b5780~r_VzZoU7G0576305763epsmtrp2-;
	Wed, 12 Mar 2025 06:10:58 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-16-67d13969afad
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F3.47.18729.17521D76; Wed, 12 Mar 2025 15:10:57 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250312061056epsmtip1f3cc3f3522817fb9aca40d5266c629c9~r_Vxheyuu2848528485epsmtip1T;
	Wed, 12 Mar 2025 06:10:55 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: alim.akhtar@samsung.com, dev.tailor@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	faraz.ata@samsung.com, rosa.pila@samsung.com, suyash.bitti@samsung.com,
	abhijeet.s23@samsung.com
Subject: [PATCH 2/2] arm64: dts: exynos: Add DT node for all UART ports
Date: Wed, 12 Mar 2025 11:49:32 +0530
Message-Id: <20250312061932.1797993-2-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312061932.1797993-1-faraz.ata@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmhm6m5cV0gyNr9Sy+djhbPJi3jc1i
	zd5zTBb3dixjt5h/5ByrxbUbC9ktXs66x2ax6fE1VovLu+awWcw4v4/J4v+eHewWX34+YLaY
	Pb/Ggddj06pONo/NS+o9+rasYvT4vEkugCUq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzA
	UNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6DglhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFK
	ToFJgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG394dzAUnWxkr7r7+yd7A+Dm9i5GTQ0LARGLh
	6ZVsILaQwG5GiT+XI7sYuYDsT4wSU3veMUM43xglZh/4xwLT8WDteWaIjr2MEjfvC0IUvWeU
	uLP1B1iCTUBdYuaNI2ANIgL5EtdP7AKzmQXeMkq8XhkJYgsLuEv8uXCGCcRmEVCV2NqyGayX
	V8BGYtmbNVDL5CX2HzwLFucUsJVY8fEkI0SNoMTJmU+gZspLNG+dDXaphEAvh0Trsm/sEM0u
	Ess/P4eyhSVeHd8CZUtJfH63lw3C9pGYfPQb0FAOIDtD4s5aEYiwvcTqBWdYQcLMApoS63fp
	Q4RlJaaeWscEsZZPovf3EyaIOK/EjnkwtrLEyT17WCFsSYlDt19A2R4Su/reM0LCagKjxM9T
	nYwTGBVmIXlnFpJ3ZiGsXsDIvIpRMrWgODc9tdi0wDAvtRweycn5uZsYwelVy3MH490HH/QO
	MTJxMB5ilOBgVhLhXW17IV2INyWxsiq1KD++qDQntfgQoykwvCcyS4km5wMTfF5JvKGJpYGJ
	mZmZiaWxmaGSOG/zzpZ0IYH0xJLU7NTUgtQimD4mDk6pBiZ+14+aunUTV3Is3CXnybAt5+iz
	lp1KFQs+bQ9Om/77kYbjvN0vD99MXXtixZrjk7JXrY+0FdBc1zl5QVxo/9xDDDVcGcK/uD1S
	9/kWeF5e1Wrc/Ngw0+8WY4Zts+um5Uc1j6rdnrfl/qKv16ZEffZ8JvtpxwaBZ+Hzqpv6+yqt
	tu/QyHP9sbaVcWfYWwXrPbNj8retNzNa/ifnZx2L0lb525Fnv0ul/dKa3SMh37pywlu/+OOv
	sxtZJxmJ3HC8O4XfcFun+Qdt2fDkfJO5lZ9YxI7s1Wx4xKfw6ECfyqWY1wHz1lxrTzJ7sEYu
	w33r84uSQkXFKX76C2c94dj7Vr9dxI9FWlR8ucpyA07P8xuUWIozEg21mIuKEwG7PU8MOAQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWy7bCSnG6h6sV0g58LLC2+djhbPJi3jc1i
	zd5zTBb3dixjt5h/5ByrxbUbC9ktXs66x2ax6fE1VovLu+awWcw4v4/J4v+eHewWX34+YLaY
	Pb/Ggddj06pONo/NS+o9+rasYvT4vEkugCWKyyYlNSezLLVI3y6BK+Nv7w7mgpOtjBV3X/9k
	b2D8nN7FyMkhIWAi8WDteeYuRi4OIYHdjBJbt+9ihUhIShx+ehfKFpZY+e85O0TRW0aJ3y3X
	WEASbALqEjNvHAGyOThEBEolzj9MBKlhFvjKKHH4ylQmkBphAXeJPxfOgNksAqoSW1s2M4PY
	vAI2EsverGGBWCAvsf/gWbA4p4CtxIqPJxlBbCGgmre/LjNB1AtKnJz5BKyeGai+eets5gmM
	ArOQpGYhSS1gZFrFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcBVqaOxi3r/qgd4iR
	iYPxEKMEB7OSCO9q2wvpQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqemFqQW
	wWSZODilGpiWnn7wwnNVqV7BgURDY+YHcZ6sf1rF1rfMmHdm1ref+jeXmWjLr7yoIZYts9wl
	VKSX4eGlCU22f57Gz/1YoPP04WHDxPkVPcd+XxE+Na2Gt4X5bOc9rnX3BC9Htxc1Rsny6p2U
	+RRZO1X54/y5G78qaac/X7EhtuhE6ToBi1kTl51ki/HmfxJws0XR/xjDLu/NoZMNz7R6LyhZ
	aMDEtOnG5/KdCk+vax7/d6Lp0zHdx9OEXV9uZK6at2sRu7NfqM+MB1smbrb64LfOqfajaND2
	gK2xxyf6/Nz1NVIy3eXI+SVH928r2cApw7Dg3Y5bUtE3G+t7N0vl/Yr89f7irsudjl97WNxO
	3At50rU8Y/bag0osxRmJhlrMRcWJAHjf0DLxAgAA
X-CMS-MailID: 20250312061058epcas5p3ccf293213fe883129358833572b17d92
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250312061058epcas5p3ccf293213fe883129358833572b17d92
References: <20250312061932.1797993-1-faraz.ata@samsung.com>
	<CGME20250312061058epcas5p3ccf293213fe883129358833572b17d92@epcas5p3.samsung.com>

Universal Serial Interface (USI) supports three serial protocol
like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
Add all the USI DT node and subsequent uart nodes for all the instances.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 494 ++++++++++++++++++
 1 file changed, 494 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index eb446cdc4ab6..76b882187a7d 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -330,6 +330,500 @@ serial_0: serial@10880000 {
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
+			compatible = "samsung,exynosautov920-uart",
+				     "samsung,exynos850-uart";
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
+				compatible = "samsung,exynosautov920-usi",
+					     "samsung,exynos850-usi";
+				reg = <0x109200c0 0x20>;
+				samsung,sysreg = <&syscon_peric0 0x1028>;
+				samsung,mode = <USI_V2_UART>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI05_USI>;
+				clock-names = "pclk", "ipclk";
+				status = "disabled";
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
+				compatible = "samsung,exynosautov920-usi",
+					     "samsung,exynos850-usi";
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
+			compatible = "samsung,exynosautov920-uart",
+				     "samsung,exynos850-uart";
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
+
 		pwm: pwm@109b0000 {
 			compatible = "samsung,exynosautov920-pwm",
 				     "samsung,exynos4210-pwm";
-- 
2.34.1

