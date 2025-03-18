Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CF21DE4C9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284725; cv=none; b=egropQKtk7fBbaNVi8jE9HPzXBRKDx6pOdmtT6kl5ZEmOD9GmHO7A9jBhxAVDx9pxRoBmtsmVLIkzLHal59gfYzBivaZwCtdAIoBYT7W+vyO7GNnlkljvnkpGoKn8W6ccEqE8syOc0BwK7VjCW1bYCViWBHVnNNlvBSbdWeDmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284725; c=relaxed/simple;
	bh=TvNcs0lI/B1Jf/RtrDkX2aU0sX7LqAQqY73Vs4a3g+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=DrGFfsAWoAB0fyMoaa9EOrnel7Dz8T1ge9xZKHL+/Qm1bQyRFYWxz0g1LK9pyjAh4rhCdLNf+GHGXpWKBXGhWxaOQlAm5iBF0eX7nZ3Ck8JkcagaSCaDNbdTwYV/P5AR8W+fq0hH0nL/t7qs87OPm0ynj0oXNXY26aAc+Em33kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BlIrfa7s; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BlIrfa7s"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250318075838epoutp03cdaceb66e0a6c672506fa1092effc389~t1riBjIh61572615726epoutp03L
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 07:58:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250318075838epoutp03cdaceb66e0a6c672506fa1092effc389~t1riBjIh61572615726epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742284718;
	bh=7qwcPFV5Rg7MF4eQvNKqLddBiXG0kcSHlrA2IAxvWJQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=BlIrfa7sYaPS0RfovEJIshF/PZf7+xgURZBSZWHJLUV0NT5A+t8fAZSOXvxSGjZWS
	 3kSpMtFMFRS0WavEM9w7gFYRtCo51p7qtg+CDYdrw6PgWRZgdbYFKa39UxLZASYkR5
	 v3PVnyowwcZAwxY04xTRA3e6NRd5s3YEeLmTEHmA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20250318075838epcas5p36fe5adef46c96a5f9daafb7b9f8d8ec0~t1rhYSm720066600666epcas5p3S;
	Tue, 18 Mar 2025 07:58:38 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4ZH43H4xgJz4x9Pv; Tue, 18 Mar
	2025 07:58:35 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7E.02.19956.BA729D76; Tue, 18 Mar 2025 16:58:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80~t1iQCjjUP2608126081epcas5p3e;
	Tue, 18 Mar 2025 07:48:01 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250318074800epsmtrp1968f3aa34a196424b3f4fd93dc54e200~t1iQBQwfm0331403314epsmtrp1W;
	Tue, 18 Mar 2025 07:48:00 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-8a-67d927ab63cd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.D7.23488.03529D76; Tue, 18 Mar 2025 16:48:00 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250318074758epsmtip1df55d9652c82ee578c5f04a45a1691ad~t1iOGE7Nb2807028070epsmtip1F;
	Tue, 18 Mar 2025 07:47:58 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: alim.akhtar@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	faraz.ata@samsung.com, rosa.pila@samsung.com, dev.tailor@samsung.com,
	suyash.bitti@samsung.com
Subject: [PATCH v2] arm64: dts: exynos: Add DT node for all UART ports
Date: Tue, 18 Mar 2025 13:26:35 +0530
Message-Id: <20250318075635.3372599-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmpu5q9ZvpBs8Wqls8mLeNzWLN3nNM
	Fvd2LGO3mH/kHKvFtRsL2S1ezrrHZrHp8TVWi8u75rBZzDi/j8ni/54d7BZffj5gtpg9v8aB
	x2PTqk42j81L6j36tqxi9Pi8SS6AJSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DS
	wlxJIS8xN9VWycUnQNctMwfoMCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgUmB
	XnFibnFpXrpeXmqJlaGBgZEpUGFCdkZj5wLWgv9tjBUbz85hb2CckdnFyMkhIWAi0X9vO3sX
	IxeHkMBuRol/vW+ZIJxPjBI3LjZDOd8YJZ6e2c0K0zJt6i9GiMReRomZ0y6yQDjvgarmzGAG
	qWITUJeYeeMIUIKDQ0QgXOLsYnGQGmaB14wSn+9vYAKpERZwk7jXcJ4dpIZFQFXi5xsXkDCv
	gI3E+TsHoZbJS+w/eJYZIi4ocXLmExYQmxko3rx1NjPITAmBt+wSa7b+Y4ZocJFYOfsRE4Qt
	LPHq+BZ2CFtK4mV/G5TtIzH56DdGkL0SAhkSd9aKQITtJVYvOMMKEmYW0JRYv0sfIiwrMfXU
	OiaItXwSvb+fQE3nldgxD8ZWlji5Zw/UyZISh26/gLI9JG6+2Q+2VUggVmJvZwv7BEb5WUi+
	mYXkm1kImxcwMq9ilEwtKM5NTy02LTDOSy2HR2xyfu4mRnD61PLewfjowQe9Q4xMHIyHGCU4
	mJVEeN2fXE8X4k1JrKxKLcqPLyrNSS0+xGgKDOGJzFKiyfnABJ5XEm9oYmlgYmZmZmJpbGao
	JM7bvLMlXUggPbEkNTs1tSC1CKaPiYNTqoGpf130v3jbB6o/GTS1XHcFvex+sux1w/y9XYLy
	G1tW7mBaaLXsZvnJk+L7p/x1+uUgbNYnmTFpzuL0P/UsPkrvHzO67FkhPPdYhTDPXx6rg9//
	bth4zPvcS8fYMP0MPuYPjD9iWBitslXWBE6RYNESTNymvoYz/BK/bM17Z8+UqqMbd7RuTn/y
	IvkYM9+0+QIL+m9WeaQGJ615MIeR+aVsc6gfR+3pD247lPxX5026NY136W4rD31z48qah3I3
	PoQleKbEdd5lbs3Rnrerd13q9dMeuZftqlpex0ZN+CPB0L+sxJ5T27Dpxy63o1KtH2JWMi54
	0ZNccNxlssNSP5vWr5G/tLMDig47hSkoyCqxFGckGmoxFxUnAgAQSfO9KAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrELMWRmVeSWpSXmKPExsWy7bCSnK6B6s10g+nfzC0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BYvZ91js9j0+BqrxeVdc9gsZpzfx2Txf88OdosvPx8wW8yeX+PA
	47FpVSebx+Yl9R59W1YxenzeJBfAEsVlk5Kak1mWWqRvl8CV0di5gLXgfxtjxcazc9gbGGdk
	djFyckgImEhMm/qLsYuRi0NIYDejxOv5jUwQCUmJw0/vskLYwhIr/z1nhyh6yyhx89QDsASb
	gLrEzBtHWEBsEYFoia8vzoNNYhb4zCixs+8YG0hCWMBN4l7DeaBuDg4WAVWJn29cQMK8AjYS
	5+8chFogL7H/4FlmiLigxMmZT8BmMgPFm7fOZp7AyDcLSWoWktQCRqZVjJKpBcW56bnJhgWG
	eanlesWJucWleel6yfm5mxjBwaylsYPx3bcm/UOMTByMhxglOJiVRHjdn1xPF+JNSaysSi3K
	jy8qzUktPsQozcGiJM670jAiXUggPbEkNTs1tSC1CCbLxMEp1cA02emL5X7FE98ieYuUnKXU
	GHsn3n1yd/2paYs0pNLNtgasuvxp4vorydsk8n9JGb/YfzNTi3HB1mvslv8L+/8Vmm4285Cq
	FuefXrotflnR056GbrsLi0Uanj/+z36jZALX5tJpF1aXnhNrq/0aZPDOR3lD3t/TZrtc91f9
	ZWMS4L90xdWl1OhwxNGT11OvLk9SPnWx18ty5hG2g50vvAO2Scp1nw4PP8741LotVuirUfP0
	c4bXZPJ53+d8ifJ955Sc8qL4/enGmp/zNNY2RqdbRDqv2acmtUfp6sP68v55JofWneBXmfh5
	oYPxp5w5edycTOtq3A33ZIYf8zSO3hhs81t1Raek8o8+zQ1f9ZYosRRnJBpqMRcVJwIAdKSa
	MtUCAAA=
X-CMS-MailID: 20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80
References: <CGME20250318074801epcas5p3de68627a3e64ebc2a95ed33a3f485e80@epcas5p3.samsung.com>

Universal Serial Interface (USI) supports three serial protocol
like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
Add all the USI DT node and subsequent uart nodes for all the instances.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
Changes in v2:
- Fixed review comments from Krzysztof
- Link to v1: https://patchwork.kernel.org/project/linux-samsung-soc/patch/20250312061932.1797993-2-faraz.ata@samsung.com/
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 493 ++++++++++++++++++
 1 file changed, 493 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index eb446cdc4ab6..9e2887fa51a7 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -330,6 +330,499 @@ serial_0: serial@10880000 {
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
 		pwm: pwm@109b0000 {
 			compatible = "samsung,exynosautov920-pwm",
 				     "samsung,exynos4210-pwm";
-- 
2.34.1

