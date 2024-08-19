Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E714A4F7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724045068; cv=none; b=KDdC7gcjUmwuDMdhHz0qJDK36GjVaO8zmsth4oTRDxHBmW4msJjb4r/eqHyGDkzbndI+bZf0QrzK4b25+Irw35HoZINkfhA+TaW5ltS+gtpmRI7MaR/mU383etR8mYlmyDGXw9BHPTZ1GWK7dLlNzURcD4Dr3jtsYFXz7HKMNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724045068; c=relaxed/simple;
	bh=AkyWJ9I6Hd2zktck1kauTocadzukvCDLU9FEN2IAB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cNEI1e7zuxBujk89cvZ/pt0oyj/ZTYDLwm9r4VWF3o229LGApOqjaDuYQ/a5TgJub27h6HyI9W12Chmcp4VM+8TpO7tFQhzmzAInewVffLfBuiptxhlUgaOpu01rctcbFay3hJqhHp1pe9StQ+Qu1aZfmxcPZSLvH0IBEejgs/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y0Po6SJn; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y0Po6SJn"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240819052424epoutp022d15a9c1f87d57afe795c80dd3530edb~tCdoAgAXl0971309713epoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240819052424epoutp022d15a9c1f87d57afe795c80dd3530edb~tCdoAgAXl0971309713epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724045064;
	bh=bAiZEbXYaEhIP7FM2a6MyvX2CrU3Y1JE6JPzxHX7HAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0Po6SJnCNtN33a7Dp5XkFrUCg3tuRyybEw/aDNCHMIYAN/zlcCXdgzxzSbAI+SCu
	 m5ik8XQ4ZY6AZgps8d/VR2LYpmPiFazFlCzq8twHYEflO6AX82uVe1TfhMNv2QPVM0
	 QFDrRkYxuFA3WVbaF0OraW3v/dOKOnqPZmh+xxHo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240819052423epcas2p2cbedbda7effaae51b81ebcbae498de71~tCdng6sp30710607106epcas2p2g;
	Mon, 19 Aug 2024 05:24:23 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WnLck6xfjz4x9Px; Mon, 19 Aug
	2024 05:24:22 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	84.B2.08901.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epcas2p4f2ee384824a64e1b6f074de972ab3ffc~tCdmXWhvG2696526965epcas2p4K;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240819052422epsmtrp1edc7d232126eda390e105220902a74a3~tCdmWiqDf1581915819epsmtrp1h;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-69-66c2d7064af7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	35.EE.08456.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epsmtip1d769f6b163ea3e70a01967b7afe8d541~tCdmGB5P91811018110epsmtip11;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v6 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
Date: Mon, 19 Aug 2024 14:24:13 +0900
Message-ID: <20240819052416.2258976-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmmS7b9UNpBkfPm1g8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7YuuYPW0GLeEXThk3sDYxL
	hboYOTgkBEwkPjaEdTFycQgJ7GCUmN/8mRHC+cQosej6VijnG6PE0oM3WbsYOcE6fk4/ygKR
	2Mso8f7+Pqiqj4wS618tYQKZyyagK/HnnwNIXERgD5PElvMgcS4OZoGzjBJ35yxgBxklLBAj
	sff7QzYQm0VAVWLSxc3MIDavgL3EzMsPmSDWyUtcXPMcrIZTwEHizMtzLBA1ghInZz4Bs5mB
	apq3zmYGWSAhMJND4u/iLqhmF4mNDydA3S0s8er4FnYIW0riZX8blJ0vMfn6WyaI5gZGiWv/
	upkhEvYSi878ZAd5h1lAU2L9Ln1IiClLHLkFtZdPouPwX3aIMK9ER5sQRKOaxKcrl6GGyEgc
	O/EMyvaQePPoDBsksCYzSqyYcZFtAqPCLCTvzELyziyExQsYmVcxiqUWFOempyYbFRjCozg5
	P3cTIzjhajnvYLwy/5/eIUYmDsZDjBIczEoivN0vD6YJ8aYkVlalFuXHF5XmpBYfYjQFBvZE
	ZinR5Hxgys8riTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoHJx8dP
	tET9xI1Nk09W8MTdbfiRdHCb/ObzQRUbHy2w5665JdGouG7hs5VGX3s7ZZQPx9puEhNhU5gv
	JWSbuD790tFPvjrn/ULuppscWPC39QXXtsPG+f5KkhcZD+/vK1wRGLvW42rZpcecSQ/vlOx6
	IHh9i+WJl4bMvYX/QnMUGGrkGHW/CxgqebeK6rdsVFomwJ//ZfXMqx+2/svazecxYyO3RkSb
	/uIpWscf9C17NlNKav+bIywmYYlznnYlWnoGdwaHeSSsj9TnTvZ+LH6yYRLvD2XlRYZ2CoZL
	WDWmfL6zge1GsPqPLfy3/MTSarh6q7nZ68In/nWboS+/UEphs9VTsynHZxx64pbPtFuJpTgj
	0VCLuag4EQC9637vQQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnC7b9UNpBjP7xC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mrau
	+cNW0CJe0bRhE3sD41KhLkZODgkBE4mf04+ydDFycQgJ7GaUWLT6KzNEQkZiY8N/dghbWOJ+
	yxFWiKL3jBIHr7UBJTg42AR0Jf78cwCJiwgcYpKY+Pkp2CRmgcuMEsfuTgabJCwQJTG5YyXY
	JBYBVYlJFzeDxXkF7CVmXn7IBLFBXuLimudsIDangIPEmZfnWEBsIaCam9d+M0LUC0qcnPkE
	LM4MVN+8dTbzBEaBWUhSs5CkFjAyrWKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4N
	La0djHtWfdA7xMjEwXiIUYKDWUmEt/vlwTQh3pTEyqrUovz4otKc1OJDjNIcLErivN9e96YI
	CaQnlqRmp6YWpBbBZJk4OKUamHp8zlk9iVFdwqxn/0xa8twDi9N5fmuzEg8ovq1cySgnz1aW
	sm72pmXZv0I/5ertKPyR1DNVZU8ek9qLmhcy3hrbs+Z4bZgXGvds2ZwJiQI8oWoyXb4pYiK7
	plX1f4qPyNI5H+FWt/j59Qkb+z9abwpn/VElmd1cevXXM2e+VvvQtI0f25gVVhzyYF1sO7VQ
	58fme6uYuHyK3Of6bI/+fDS65UhgvtWvGY/a6h/271g14a6j5Xo9ZeEb++XUvwS1s9T+mPJK
	vVNq3smkLbH7Pu9gipdcXndz7acJEYa9HuKSN/hOml/zSZnr/sHxaehCqetZDPYvEsQuzQtV
	aar/eZkpqmiXv0F3UfVyRW9HJZbijERDLeai4kQA48vjXPwCAAA=
X-CMS-MailID: 20240819052422epcas2p4f2ee384824a64e1b6f074de972ab3ffc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p4f2ee384824a64e1b6f074de972ab3ffc
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p4f2ee384824a64e1b6f074de972ab3ffc@epcas2p4.samsung.com>

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

