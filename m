Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22018A955
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145313; cv=none; b=QxwMnJdjfiQBBjIkHpHGDLVULL/L5xkzoCI0yofuIqkxXFNQcHhZngx11sDksaotnb9wIVrPzNteNhfVTUsvSmmUzNtA0DTrqQrtN9sm8enlhdjPbV3HQkbOzznQEzHPk15xOB5jbYFMhMktffoYSwNauEnlagjF3uybtl6Tku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145313; c=relaxed/simple;
	bh=AkyWJ9I6Hd2zktck1kauTocadzukvCDLU9FEN2IAB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=f9dtrpe6UTGvJOfhAmguo1OWP/y93p/5XEfvoK1TBl+oYePkup1QI9fG4FuvbFYk/aznLash6Ptnp//G/O/EXJ0aGgU+kZrVCdn8y7p84qD2crJp+uFoVlGMIefUicMKZXIcc2PJM+FMa0YSWfCN2NfMKrY2D0yNk7rA45zYYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Kr2DtzW7; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kr2DtzW7"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240820091506epoutp01563652ee0574214c37db9718f8f0bf2e~tZQVl6imG0615306153epoutp01n
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240820091506epoutp01563652ee0574214c37db9718f8f0bf2e~tZQVl6imG0615306153epoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724145306;
	bh=bAiZEbXYaEhIP7FM2a6MyvX2CrU3Y1JE6JPzxHX7HAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kr2DtzW7q5IVSV3M049JqDOO+13RzUGWTQJHwT9qyqYqlQZcECI7jhl60PXfX3kW5
	 bBZ2qNOWjDT1/lPWuAmSkc7wwW66W+Y6LZSQY5iv7iRRYlfTgVbgr+GEFkdGoZclL2
	 wCDXJpsW7eY4UQvWT0keWS4Ts00G2+OnEPwyfFJ4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240820091505epcas2p1e14185317b2ee5adb10d80d498b39198~tZQVPKVr-2621826218epcas2p1W;
	Tue, 20 Aug 2024 09:15:05 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.69]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Wp3hT1n8dz4x9Pt; Tue, 20 Aug
	2024 09:15:05 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5A.34.19039.99E54C66; Tue, 20 Aug 2024 18:15:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epcas2p4ff8956894055698642951dfe7cedce2e~tZQUN2rsF2534225342epcas2p4V;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240820091504epsmtrp2da100e76dd715659577d250b9aef064e~tZQUMLQV62470624706epsmtrp2J;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
X-AuditID: b6c32a4d-305ff70000004a5f-ca-66c45e995bff
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4B.7F.07567.89E54C66; Tue, 20 Aug 2024 18:15:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epsmtip1624f34e7f1d62f7c4a8665ae149bcb26~tZQT7HN3j3033030330epsmtip1F;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v8 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
Date: Tue, 20 Aug 2024 18:14:58 +0900
Message-ID: <20240820091501.3395841-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820091501.3395841-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmqe7MuCNpBnPPs1o8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7YuuYPW0GLeEXThk3sDYxL
	hboYOTkkBEwkPkx8w9jFyMUhJLCHUeLcsdPMEM4nRom1X7cxglQJCXxjlJh1whymY9aj1ewQ
	RXsZJY7fXwjV/pFRYu6zHWxdjBwcbAK6En/+OYDERQT2MElsOb+ECcRhFjjLKHF3zgJ2kFHC
	AjES33e1s4HYLAKqEqs3vWQGaeYVsJdYPk8KYpu8xMU1z8FKOAUcJC6t/coEYvMKCEqcnPmE
	BcRmBqpp3job7GwJgYUcEn2XGtggml0klj06CmULS7w6voUdwpaS+PxuL1Q8X2Ly9bdMEM0N
	jBLX/nUzQyTsJRad+ckOchCzgKbE+l36IKaEgLLEkVtQe/kkOg7/ZYcI80p0tEGDVE3i05XL
	UENkJI6deAZle0ic/bkCGrqTGSVeP2xnnsCoMAvJO7OQvDMLYfECRuZVjFKpBcW56anJRgWG
	unmp5fBYTs7P3cQITrtavjsYX6//q3eIkYmD8RCjBAezkghv98uDaUK8KYmVValF+fFFpTmp
	xYcYTYHhPZFZSjQ5H5j480riDU0sDUzMzAzNjUwNzJXEee+1zk0REkhPLEnNTk0tSC2C6WPi
	4JRqYCqfftj8+bHNs6S0HCZ/9lC4ecdP9VjIBodF1xz/lj87f/BwzsoDT45586l153d4rNm/
	KuCKfe7lgzWrJlRta2rOWLxL88rTmBqxE5mHamQOrA+87f99y47zX0oWlx75dlNMZaHek6Ph
	m1sdJhapyS1mmXFjBveLgM6PVeeflR16Lyrq8eiY/8a7Nyao1DcsDWA4dDlx/yumOLmZghVb
	bh/wKMoWNdhx6vj2+5HBS8oO3j10fsfJwO4qyZQFa4X/Tb/E7JoibaTYw2/bmWexbGL4nsux
	SkduPpfZsXJ6//QouxvT7vzY2D0h+Lb3Vf6oiYE7E04vDg6NerVrw9vQt+smOfs0Mb/t5n6z
	5+9Wm6VX5yqxFGckGmoxFxUnAgAe7l7pRAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO6MuCNpBtePKFk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZWxd
	84etoEW8omnDJvYGxqVCXYycHBICJhKzHq1m72Lk4hAS2M0ocf/NDzaIhIzExob/7BC2sMT9
	liOsILaQwHtGia1rgWwODjYBXYk//xxAekUEDjFJTPz8lAXEYRa4zChx7O5kZpAGYYEoia1r
	DjCC2CwCqhKrN71kBmnmFbCXWD5PCmK+vMTFNc/B9nIKOEhcWvuVCWKXvcS8Bc1gY3gFBCVO
	znzCAmIzA9U3b53NPIFRYBaS1CwkqQWMTKsYJVMLinPTc5MNCwzzUsv1ihNzi0vz0vWS83M3
	MYLjQktjB+O9+f/0DjEycTAeYpTgYFYS4e1+eTBNiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/h
	jNkpQgLpiSWp2ampBalFMFkmDk6pBiZzucn7PmQuuXpyR1CP3l4ntfKrGVLq13aynjOuc71r
	w/f2tv/q/a9mlD5bXLCLb7eCX1er777q3hORyrzeJ7ori+dX2K02FLjgscVR8tKHOe1vOmry
	jjf/c/g0qVxlUtnCwgveR2bbGMn8jed6Lrz58Uw3HofdXnMnhlk1tz/+3z9zxfQV5dbb829t
	mT31Fp+D9fyQtd12SveeVLPEn2y9p/Tw9xyG9rKOg+brAzZsteD4aPQzT/TfDxX9V22KtYU5
	D/wNrs7sz5B9/et9ZuVXeT1XaYabjx4X6jirr/5iVND658/0a76xVypSr3lrpbjUzGna6vs2
	OSFpU5DIJNWPzDdVLt8vefJ50U2dhkIlluKMREMt5qLiRADYgW+V+gIAAA==
X-CMS-MailID: 20240820091504epcas2p4ff8956894055698642951dfe7cedce2e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820091504epcas2p4ff8956894055698642951dfe7cedce2e
References: <20240820091501.3395841-1-sunyeal.hong@samsung.com>
	<CGME20240820091504epcas2p4ff8956894055698642951dfe7cedce2e@epcas2p4.samsung.com>

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

