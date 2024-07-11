Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F5A8F66
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2024 01:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720660411; cv=none; b=agIn5cUwQp3yPgTF1i5TD3FItQoae6w3usMJ3vqrdizIOwqbMrcSTxKqftfZq/BxSilA0KlE6A5u+7RT9VMopjL21lEAQDEih/QI+BjgSyAetRMaqItmA4UZA6Crh5+As4NO8I6EEtco3JSYcXnm5pYCnxb23d6yjZu7juy2sZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720660411; c=relaxed/simple;
	bh=vEA3KXSIAhaD+zPw0CsEnqeejkEmDhNscB3wVGeIHyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mxLmfSk0uHUVAaHkd7OjQx9lxBROZIjR8W7PgpvmbtzZ3rbBz5okJzMbg0Go4Rvuxplq97mvw6sBSEGs75nG+FE214Y4PkzOxMzRWc5k+vAV/Q8G7/FT/JO2Nl4yi/HLbrqOtBMlvNTxnAMEh+JoXdpFWtIgXhHNPGUmG6qMV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vAuLPQr4; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vAuLPQr4"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240711011326epoutp03451387315f21e9478e0dec5774511baf~hA4XyUniS0989209892epoutp03e
	for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2024 01:13:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240711011326epoutp03451387315f21e9478e0dec5774511baf~hA4XyUniS0989209892epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720660406;
	bh=D5r1Rcdl8j5s7c0Hxhg9GSw1ryrOrFCSJgC2vioYM0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vAuLPQr4PhNXudP5Rm8jFbwFrmUJ0PJ9QkWYsyossbircXEDxC75D70d4RULSmwrC
	 IJKD0imetLtvAVmJS76+gxQzBQwzJ9ADSYbv2oXtqUuX87nI5OZcmJpVhcAbPyh046
	 4uhoDnaAeJyRGvcWTb/OFwDYP7E9BcY5aRi3YbwQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240711011325epcas2p340f9d86caf367dd5e88d6acc2ac1f7fd~hA4XNe6Q32919329193epcas2p3O;
	Thu, 11 Jul 2024 01:13:25 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WKGv91jMkz4x9Px; Thu, 11 Jul
	2024 01:13:25 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6B.55.09848.4B13F866; Thu, 11 Jul 2024 10:13:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240711011324epcas2p21d1f4da7cedcba4aaadbe7343a568aca~hA4V7OLrT3263832638epcas2p2G;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240711011324epsmtrp2e756d41868d2917da8ac4c238f8085f3~hA4V6Xo0b0825808258epsmtrp2m;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
X-AuditID: b6c32a45-1c7ff70000002678-64-668f31b4d668
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9B.35.19057.4B13F866; Thu, 11 Jul 2024 10:13:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240711011324epsmtip2cb8307c258dcbd8b78e5aea47f410255~hA4VpGqVU0294702947epsmtip2J;
	Thu, 11 Jul 2024 01:13:24 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v3 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
Date: Thu, 11 Jul 2024 10:13:14 +0900
Message-ID: <20240711011316.2713270-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711011316.2713270-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmme5Ww/40g0/vmSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGd0bv7FVHBbpOJTs0ID4xaB
	LkZODgkBE4lj2w+xdDFycQgJ7GCUeLnlGRuE84lR4sO0VVCZb4wSz77eYIJpmXiijRHEFhLY
	yyixYJIdRNFHRon/T2YAJTg42AR0Jf78cwCJiwjsYZLYcn4JE4jDLHCWUeLunAXsIN3CAjES
	L19eYQVpYBFQldh4OxwkzCtgL3Ft2TKoZfISF9c8ZwOxOQUcJDZdWcMMUSMocXLmExYQmxmo
	pnnrbGaQ+RICMzkkbpxcANXsItEy8zE7hC0s8er4FihbSuLzu71sEHa+xOTrb5kgmhsYJa79
	62aGSNhLLDrzkx3kOGYBTYn1u/RBTAkBZYkjt6D28kl0HP7LDhHmlehoE4JoVJP4dOUy1BAZ
	iWMnnkHZHhILNz6GBuhkRonGk9uYJzAqzELyziwk78xCWLyAkXkVo1hqQXFuemqxUYEhPIKT
	83M3MYKTrZbrDsbJbz/oHWJk4mA8xCjBwawkwjv/RneaEG9KYmVValF+fFFpTmrxIUZTYFhP
	ZJYSTc4Hpvu8knhDE0sDEzMzQ3MjUwNzJXHee61zU4QE0hNLUrNTUwtSi2D6mDg4pRqY9izZ
	r7Tt1Ym5izoKglkzuuYocP7emu3ceuBXWtp0aYeGaS7akp+n35l8r4mV8U9HeXGRw8YUm9Pm
	XfdFUspnSCqrLzd42sipNeWN/H/pXS+XVh2+usrjsVSA9A6v6bdPHpZjvG+5co3NP3E1PVdd
	sZ67lxNeyf/dqVHNLPGWd8Wqd673OB47sezyMp/dJBPod8LGeK82wxfmuv4Ey3chN8Oco2pm
	N6/feCF3X8yKieu2eu9pKVbzD5c+V3MwIuFzhHL8UXOlRW26C/59fr77zWL7085p2ppr/6z5
	XvSC+43O5gwX25JdrVHf99zQiFrT53B1dk4Zb/6KpRIfDI3ibvm3ievzr41c6vxDNSdEiaU4
	I9FQi7moOBEADDhwrj8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSvO4Ww/40g4f3RSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mjo3
	/2IquC1S8alZoYFxi0AXIyeHhICJxMQTbYxdjFwcQgK7GSV2Np9hg0jISGxs+M8OYQtL3G85
	wgpR9J5R4ubTCUAOBwebgK7En38OIHERgUNMEhM/P2UBcZgFLjNKHLs7mRmkW1ggSuJa826w
	BhYBVYmNt8NBwrwC9hLXli1jglggL3FxzXOwxZwCDhKbrqwBaxUCqtm08j0rRL2gxMmZT1hA
	bGag+uats5knMArMQpKahSS1gJFpFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcFxo
	ae1g3LPqg94hRiYOxkOMEhzMSiK88290pwnxpiRWVqUW5ccXleakFh9ilOZgURLn/fa6N0VI
	ID2xJDU7NbUgtQgmy8TBKdXAVL9XNVd53yGpLn8OlpOGUrfMdi5ITIjPdjt+0Z+D+5ckj++/
	xq+vmtZxld/j8uuOqg8QqEv8cUJSq3vVJO0z+iUtFu+eL2c/eJv5pqlA29y9Ly/6/s/zFxIv
	sq6o0lqoErXhRcMqv2//PTIC264utfflq+iLzgw90/VStvB1yL3OJ8bX7MJ6Z67ccTkkWnrR
	t6+cB+cGLDPO3ths6xfWXaJZfeyCYfuFJ3s2xV4I7v8nefj8t0kXo4LKvkiekQvTn5vVfHqP
	hNKHGO0n5Z6sm08bxnHeeLH5icrWhC3HsnyiO69MWWDxel3HCyXn66/cLGOC/yzK5WJ4HNS6
	fNrMbc1pK1d+mPxAsex/T9g8JZbijERDLeai4kQAzU9ZcvoCAAA=
X-CMS-MailID: 20240711011324epcas2p21d1f4da7cedcba4aaadbe7343a568aca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240711011324epcas2p21d1f4da7cedcba4aaadbe7343a568aca
References: <20240711011316.2713270-1-sunyeal.hong@samsung.com>
	<CGME20240711011324epcas2p21d1f4da7cedcba4aaadbe7343a568aca@epcas2p2.samsung.com>

Add cmu_top, cmu_peric0 clock nodes and
switch USI clocks instead of dummy fixed-rate-clock.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c1c8566d74f5..54fc32074379 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -6,6 +6,7 @@
  *
  */
 
+#include <dt-bindings/clock/samsung,exynosautov920.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
@@ -38,17 +39,6 @@ xtcxo: clock {
 		clock-output-names = "oscclk";
 	};
 
-	/*
-	 * FIXME: Keep the stub clock for serial driver, until proper clock
-	 * driver is implemented.
-	 */
-	clock_usi: clock-usi {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <200000000>;
-		clock-output-names = "usi";
-	};
-
 	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -182,6 +172,28 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		cmu_peric0: clock-controller@10800000 {
+			compatible = "samsung,exynosautov920-cmu-peric0";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
+				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ip";
+		};
+
+		cmu_top: clock-controller@11000000 {
+			compatible = "samsung,exynosautov920-cmu-top";
+			reg = <0x11000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>;
+			clock-names = "oscclk";
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -213,7 +225,8 @@ usi_0: usi@108800c0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			clocks = <&clock_usi>, <&clock_usi>;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
 
@@ -224,7 +237,8 @@ serial_0: serial@10880000 {
 				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart0_bus>;
-				clocks = <&clock_usi>, <&clock_usi>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
-- 
2.45.2

