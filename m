Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0571974059
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Jul 2024 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720394099; cv=none; b=u+rnzjwFlJ9Sfbu7/hBH9TvUGtFLTQ+Mg+VNKYAtSfIWjpvjeLnIUCwnQq3rs2ksmLxSdwP/QPkfvo8Z7UxhzFvmYoUXhBYLBL14vH3znQJXrH+VLP3DTsrQn2H/b8kY3SV80E5CFBcccukwk2ZcmH5jRcyaCfZ9M8AmGgpaL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720394099; c=relaxed/simple;
	bh=vEA3KXSIAhaD+zPw0CsEnqeejkEmDhNscB3wVGeIHyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=e3hzqujyLjl+xe2oDfjFO3wAfLtY8yj4qYa6++1w9rt89Q4OAE55e5Y1O1foRcUK5uRzUQ9AxCn2EVq1KPI4IVa/IR8plI+XzwjT31pZMYLn6dpB6BwJseGhHKr0n1XMGXB/nt+ITXAoaQfSxSPg8b8NB7IN0RXEktHtZImYI3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OhE7ZNSZ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OhE7ZNSZ"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240707231446epoutp048ce4070f05ba8c32032b088c5487300c~gEU6IvZdU1041910419epoutp04J
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Jul 2024 23:14:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240707231446epoutp048ce4070f05ba8c32032b088c5487300c~gEU6IvZdU1041910419epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720394086;
	bh=D5r1Rcdl8j5s7c0Hxhg9GSw1ryrOrFCSJgC2vioYM0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OhE7ZNSZ9qMSMqOGwZ0zrDwMGFHDzJEth8/zQ3xm+GMTrBm+jmBK/vD/p8Dhc5QiS
	 Go73vWnnPrYNLcaPafLU3smfQHlYJ/GNfJCKCuvZBQ7J6nD4eqyp3tEVnt0PCsKtG8
	 rclBhE8ya2/+gvkdbNTgSjiJsSXjUhJdrLkG6RuI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240707231446epcas2p206b0b377229204771d1192ac7439183d~gEU5ob7Y_1661116611epcas2p2n;
	Sun,  7 Jul 2024 23:14:46 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.69]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WHNPd3lK5z4x9Pv; Sun,  7 Jul
	2024 23:14:45 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4E.E8.25328.5612B866; Mon,  8 Jul 2024 08:14:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216~gEU4pLJ9N1661116611epcas2p2h;
	Sun,  7 Jul 2024 23:14:45 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240707231445epsmtrp20605f5b292326aba57bc60ff55696cac~gEU4oWhr21206812068epsmtrp2s;
	Sun,  7 Jul 2024 23:14:45 +0000 (GMT)
X-AuditID: b6c32a4d-d53ff700000262f0-23-668b2165bbb9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BB.BD.07412.4612B866; Mon,  8 Jul 2024 08:14:44 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240707231444epsmtip14029683bffd6a71d16e08a9e64675177~gEU4XM2ao2495624956epsmtip1f;
	Sun,  7 Jul 2024 23:14:44 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v2 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 Exynos Auto v920
Date: Mon,  8 Jul 2024 08:13:29 +0900
Message-ID: <20240707231331.3433340-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmuW6qYneawfNf0hYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjM6N/9iKrgtUvGpWaGBcYtA
	FyMnh4SAicTuro9MXYxcHEICexglpn3dxwzhfGKUONawmxXC+cYo8fH0ZGaYltP7j0Il9jJK
	bD7bxw7hfGSUeLnqFUsXIwcHm4CuxJ9/DiBxEYE9TBJbzi8BW8IscJZR4u6cBewgRcICsRJN
	C7RAprIIqEo82PAQbAOvgL3E4akvmCC2yUtcXPOcDcTmFHCQuNNwhRGiRlDi5MwnLCA2M1BN
	89bZYHdLCMzlkPjz7BsbRLOLxKd/L1ghbGGJV8e3sEPYUhKf3+2FqsmXmHz9LRNEcwOjxLV/
	3VB/2kssOvMT7FBmAU2J9bv0QUwJAWWJI7eg9vJJdBz+yw4R5pXoaBOCaFST+HTlMtQQGYlj
	J55B2R4S3683QMNqMqPEw9/XWSYwKsxC8s4sJO/MQli8gJF5FaNUakFxbnpqslGBoW5eajk8
	lpPzczcxgtOulu8Oxtfr/+odYmTiYDzEKMHBrCTCe/pxe5oQb0piZVVqUX58UWlOavEhRlNg
	gE9klhJNzgcm/rySeEMTSwMTMzNDcyNTA3Mlcd57rXNThATSE0tSs1NTC1KLYPqYODilGpg2
	zGaZwqDj/vP/1gPmb69ovl0xRbxhpuDu45Jvb9ucOaAVOkdk/dPJL43atkw9GvfMP3Z13PeT
	dixh7t+a3a5ue2Mfdylt4YVpFq+XVEp0pVyeLqO+3/2Cc9vj10I+Nx3zTj/m0515YY3bZt11
	wvNnNq2JSz0m++vym7pM82P3E9MzF2/ZvCBQdfP1gvfmDy9fm7BAKeHGxpfddUU/rZcmvlST
	nR/v6xyy/f+d6hKzzBets9ZkCjC/lFvu9MyiYmpncega51uxydfVOC4fi1E53p9g88d05oP2
	mQE6vx+fFbo0eeJhjdTm6S/3iaQ6nnJojezKrlJXEbqrqTIvv8EobMnz0MPRpb38MyWPHIi1
	U2Ipzkg01GIuKk4EAMRD12xEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnG6KYneawZyllhYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFFcNimpOZllqUX6dglcGZ2b
	fzEV3Bap+NSs0MC4RaCLkZNDQsBE4vT+o6xdjFwcQgK7GSV6dj1jgUjISGxs+M8OYQtL3G85
	wgpiCwm8Z5Q4Mpeni5GDg01AV+LPPweQXhGBQ0wSEz8/ZQFxmAUuM0ocuzuZGaRBWCBaYuqW
	L2wgNouAqsSDDQ/B4rwC9hKHp75gglggL3FxzXOwGk4BB4k7DVcYIZbZS7z7Mp0Fol5Q4uTM
	J2A2M1B989bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PTfZsMAwL7Vcrzgxt7g0L10vOT93EyM4
	LrQ0djDem/9P7xAjEwfjIUYJDmYlEd7Tj9vThHhTEiurUovy44tKc1KLDzFKc7AoifMazpid
	IiSQnliSmp2aWpBaBJNl4uCUamDa7819Z15thmz0amFe710NE9ZlcDT++93LGPjxzavoo3NN
	VM+ftjr6f4P9+Ztf5t9y17t2zZ73dNjH4zuetLQsev67vMGJK7VzU8J79hf70m/L/jiacPur
	jcX8LDf9Nft65q0KTOCR/np/7w6ZjBPHyzcYcq3JnuDwtDIj40Kr8PZssXfZU5iOv1f1DZzx
	6H+NSnEk++zVIgL8W7fPKNxcbJlxVfHhHY/a8gSb3vdLTlYyzGtlD1faO1HdVcJp2fILjK4z
	S4Xefjx6/EW7yErGC9uTmu/+vXS0KPdTzcvXR/U8jp260diWHDP763IOk61v8s/ZP7Jxnzhx
	815f18V/z/DHXF6m3F+m1Fq3LOZInBJLcUaioRZzUXEiAMdi9i76AgAA
X-CMS-MailID: 20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231445epcas2p2cf78684e3cbcf8ed914a0d8e52115216@epcas2p2.samsung.com>

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

