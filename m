Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E64189B99
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139926; cv=none; b=M28+LJUCQ5dhiDPsklwAHcHAJPSc4QQzBiuovmoz3d07YKdqtNRjzEo8HlMKRYgAF3hjSP707Gk4Yp5MNhKnMA4t9mnPDX6qoT5Xx7rQJatAnbom90f4oMUwhxsxTceUBHDoJnWBdrAi2us6m3evyT+uhACs5gs7A/MVz2c97+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139926; c=relaxed/simple;
	bh=AkyWJ9I6Hd2zktck1kauTocadzukvCDLU9FEN2IAB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LZEjRQjyPPmt7IlT7+NRZmtD5q6iWKceQLiqFiq0Fin6dkZNBIJ5tDa/P98UpHCPyxz0M0H2v8F/JjjyOEivlHpvgIa/HSdda1BF3RnL2ig0t4fTOpPr0Fl8NLyIZZZHJUyNsmHSO4FfbjGv3Kg1RFaKUcHwBThzIKmnw4apAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ouUeYRfb; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ouUeYRfb"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240820074521epoutp01a5e036bfba5249c41e3f4891ee41e1ac~tYB_2fbTw1313613136epoutp01g
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240820074521epoutp01a5e036bfba5249c41e3f4891ee41e1ac~tYB_2fbTw1313613136epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724139921;
	bh=bAiZEbXYaEhIP7FM2a6MyvX2CrU3Y1JE6JPzxHX7HAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ouUeYRfbHit3VdtkUvQcHiTKMSGWYFbsJTPBpQ2AkHCb5HsVdgzRjqvlsoztQvwkc
	 q8wKcB6tjBSth1oroUTfqRQ8VFobL4FXlRlSRO98z9qV8X4JPMPqr+IZrkpTIj1yPo
	 lkmaK+PS3sAA+CPGly1yOCU4bnIenEZCk88IUxk4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240820074521epcas2p411598422517fe491634aaa9c97ad423f~tYB_VwLCe2322523225epcas2p47;
	Tue, 20 Aug 2024 07:45:21 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Wp1hw3dZtz4x9Q2; Tue, 20 Aug
	2024 07:45:20 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.75.10066.09944C66; Tue, 20 Aug 2024 16:45:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240820074520epcas2p429e506579ea82e795b154286e8e86628~tYB9VBr422322523225epcas2p4z;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240820074520epsmtrp2e7c8864bccfca1042a88e2f8ce240c81~tYB9UDDox0592805928epsmtrp2c;
	Tue, 20 Aug 2024 07:45:20 +0000 (GMT)
X-AuditID: b6c32a46-4b7fa70000002752-4b-66c44990ebac
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	72.C4.07567.F8944C66; Tue, 20 Aug 2024 16:45:19 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240820074519epsmtip27898d51e340b042e7277167a418f9ee7~tYB9Hj7Mz2524825248epsmtip2L;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v7 3/5] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
Date: Tue, 20 Aug 2024 16:45:12 +0900
Message-ID: <20240820074514.3123767-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmqe4EzyNpBstXS1o8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7YuuYPW0GLeEXThk3sDYxL
	hboYOTgkBEwkds306GLk5BAS2MEoced+YhcjF5D9iVFiybafbBDON0aJnheHWUCqQBouTvvB
	DpHYyyjRubCLFcL5yCix99VeVpCxbAK6En/+OYDERQT2MElsOb+ECcRhFjjLKHF3zgJ2kFHC
	AjESt7qmgdksAqoSH+7/AGvmFbCXOLnfEGKbvMTFNc/ZQGxOAQeJGZ1HWEFsXgFBiZMzn4Bd
	xAxU07x1NjPIfAmBuRwSyxsaoE51kVh4YiMbhC0s8er4FnYIW0ri87u9UPF8icnX3zJBNDcw
	Slz7180MkbCXWHTmJzvIQcwCmhLrd+lDwktZ4sgtqL18Eh2H/7JDhHklOtqEIBrVJD5duQw1
	REbi2IlnULaHxKvdy6ABN5kRyLnOOIFRYRaSd2YheWcWwuIFjMyrGMVSC4pz01OLjQqM4BGc
	nJ+7iRGcbLXcdjBOeftB7xAjEwfjIUYJDmYlEd7ulwfThHhTEiurUovy44tKc1KLDzGaAsN6
	IrOUaHI+MN3nlcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXAJBxg
	scdCQ/z79vcZPSymmzZ/bNVgXRJ/+PJ3gRUlv31PS+67mD/tyYsXr6w4F79LCvg6z1bO8OiE
	zqMdfz3qd3+e+t3Z4LiBX+J5Rr8DFsL6pzZ8Vrs65aGA+Ue7D98e9kTGPfY6WOnez6yqlp0/
	kaWWf+H6osCg52xT9zgf6Xyzqv/ojCKPTxsfrJ403bi4/4vY8f+TPn8O2Lr/08vcJ2tuHnXj
	ULYyrV//c9Pr/S0/p3y7n7Akpr05oK7TbMbRwFz/mTOUgxi0q1MMeq6En33x9G251LMXV68c
	Wndwju3DF8djP1taCEncfOEuue1HAu/N9Wsjb2913/TtkGP2svd91+czqk1kKu0xOL8o4QSj
	EktxRqKhFnNRcSIAHiG0mj8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSvG6/55E0gxXzLC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mrau
	+cNW0CJe0bRhE3sD41KhLkZODgkBE4mL036wdzFycQgJ7GaU6LlwgQUiISOxseE/O4QtLHG/
	5QgrRNF7RokT3+cDJTg42AR0Jf78cwCJiwgcYpKY+PkpC4jDLHCZUeLY3cnMIN3CAlESG5uP
	sIHYLAKqEh/u/2AFaeYVsJc4ud8QYoG8xMU1z8FKOAUcJGZ0HgErEQIqebzUGCTMKyAocXLm
	E7DbmIHKm7fOZp7AKDALSWoWktQCRqZVjJKpBcW56bnJhgWGeanlesWJucWleel6yfm5mxjB
	caGlsYPx3vx/eocYmTgYDzFKcDArifB2vzyYJsSbklhZlVqUH19UmpNafIhRmoNFSZzXcMbs
	FCGB9MSS1OzU1ILUIpgsEwenVAPTyo2L1q8QO63pWTV9WeHiXNkf8jn5vOFMYjPvCvfpm1ma
	cQkWHHTzManWTEvQduAp2HP3Mc81i89cLFeu5Li18cys+XxoZrP6xnS27VbM2d0Sevsnu8sl
	sXIv+8t9Y/75zlq3GEujtxafKrZPmPxz5e0lNZW9rm8Mp97/p9nzU6jtrsTDqgtFx1U1fLTq
	1Z9dnNL3Tidsl+a0K9/CzzB+D6pptxVocLo57cuzw3mBbyZxGTBfXpAkPUXme7fcVLOXZ0VS
	rphpb1zFUrnhY7qF3Bf5a9s0uPfOc/16bNKSc3G/Y1Zfi+i59TR82YrlDJci1s7jdZX7bBv6
	yeSP4PyM4NVvys7VTBM1kbsdp/lViaU4I9FQi7moOBEAUIDVRfoCAAA=
X-CMS-MailID: 20240820074520epcas2p429e506579ea82e795b154286e8e86628
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820074520epcas2p429e506579ea82e795b154286e8e86628
References: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
	<CGME20240820074520epcas2p429e506579ea82e795b154286e8e86628@epcas2p4.samsung.com>

Add cmu_top, cmu_peric0 clock nodes and
switch USI clocks instead of dummy fixed-rate-clock.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c1c8566d74f5..91882b37fdb3 100644
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
@@ -192,6 +182,19 @@ gic: interrupt-controller@10400000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
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
 		syscon_peric0: syscon@10820000 {
 			compatible = "samsung,exynosautov920-peric0-sysreg",
 				     "syscon";
@@ -213,7 +216,8 @@ usi_0: usi@108800c0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-			clocks = <&clock_usi>, <&clock_usi>;
+			clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 			clock-names = "pclk", "ipclk";
 			status = "disabled";
 
@@ -224,7 +228,8 @@ serial_0: serial@10880000 {
 				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&uart0_bus>;
-				clocks = <&clock_usi>, <&clock_usi>;
+				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
+					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
@@ -254,6 +259,15 @@ pinctrl_peric1: pinctrl@10c30000 {
 			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_top: clock-controller@11000000 {
+			compatible = "samsung,exynosautov920-cmu-top";
+			reg = <0x11000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>;
+			clock-names = "oscclk";
+		};
+
 		pinctrl_alive: pinctrl@11850000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x11850000 0x10000>;
-- 
2.45.2

