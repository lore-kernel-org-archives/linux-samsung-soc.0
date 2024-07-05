Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B017995
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145537; cv=none; b=fQgx8SAYrC2hKWIlfbVnt0USxH7u4uUQ2tL8RKggounDKgIm5d+nKrrj3lEaMMWIsW01az8DHXAG5KqB3GTVmepufis8u3vulEiSwl7O3I8mVXzMSDapvMdpecJsRLsDMIaMz3a+zJoqSzqmUGGvdwyPviGaG8T9gWjYq/CTjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145537; c=relaxed/simple;
	bh=evqOhEHE2upptAD7WRmbvkcFMuEpd4kQoDphWFl55Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=aSsaOHpJFk+4DIANm5c+xDf33lHFTCPV1ixUGBO0S78sRr+kbAfLjBNEoJVHETGEc/Cpnk3H5lzTuniOK+0UIJtObDaWOxrQluhW8TYtmirKiwN78dMPCX67K7ZZaHxrs1GyVqsVlKAW9irkXZzMQ4wtvIAXNxAVD2QztzOUhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BKk95aff; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BKk95aff"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240705021214epoutp01edbe4c7906884075bbf2c1e8c4214134~fLz-6Pdy12651326513epoutp014
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Jul 2024 02:12:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240705021214epoutp01edbe4c7906884075bbf2c1e8c4214134~fLz-6Pdy12651326513epoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720145534;
	bh=XVFZe/RlTfZ0gA3EWGc+8QPGSV5E3YUOmcVLqN695DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BKk95affS2SvBJt2LCqhsybAFCpCRauSnUImwAC5wI9B1BzFISx24lQJZYqBU5er+
	 kHadKTazlpXgCWQTd4C7CrBnKm8tWJ7cFGmTFU6e/cTdm/QAx15khW48xZJm1kWO5V
	 LVB/0p5bVAM3k5jUVrEVMUmXRfxEA+eRTUq62Hno=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240705021213epcas2p1ba53f91bba7521f9ba4ec70b3d945773~fLz__q9qV2928729287epcas2p1h;
	Fri,  5 Jul 2024 02:12:13 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WFcTm6N3Rz4x9QD; Fri,  5 Jul
	2024 02:12:12 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	09.51.56241.C7657866; Fri,  5 Jul 2024 11:12:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240705021212epcas2p169cdc84203e007c7a25bb53f41fc61a0~fLz9_0jrB2928729287epcas2p1a;
	Fri,  5 Jul 2024 02:12:12 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705021212epsmtrp2d463b6665f78ea6a8d670c4300094093~fLz9_DbLg0904509045epsmtrp2N;
	Fri,  5 Jul 2024 02:12:12 +0000 (GMT)
X-AuditID: b6c32a43-c03fd7000000dbb1-e7-6687567c2f68
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	49.39.19057.C7657866; Fri,  5 Jul 2024 11:12:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240705021212epsmtip268c0403006fd31fb69ccec8b5ce921a4~fLz9zMVTQ0030900309epsmtip28;
	Fri,  5 Jul 2024 02:12:12 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH 3/5] arm64: dts: exynos: add initial CMU clock nodes in
 Exynos Auto v920
Date: Fri,  5 Jul 2024 11:11:08 +0900
Message-ID: <20240705021110.2495344-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmqW5NWHuawcR5BhYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5
	+AToumXmAN2jpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L18tL
	LbEyNDAwMgUqTMjOeLHnFlNBo2hF+3bpBsZbAl2MnBwSAiYSc+ZfY+li5OIQEtjBKDFl82o2
	COcTo8TPKa1QzjdGidbD59lhWubdfAvVspdRYvrFjVDOR0aJUy92AbVwcLAJ6Er8+ecAEhcR
	+M4o0f92H1gRs0Ano8TVo9uZQEYJC0RJPOjoZgGxWQRUJZbd28kMYvMK2Evs272DCWKdvMTF
	Nc/ZQGxOAQeJ50cOsELUCEqcnPkErJcZqKZ562xmkAUSAj/ZJZpvT2aGaHaRaDh8CupuYYlX
	x7dA2VISn9/tZYOw8yUmX3/LBNHcwChx7V83VLO9xKIzP9lB3mEW0JRYv0sfxJQQUJY4cgtq
	L59Ex+G/7BBhXomONiGIRjWJT1cuQw2RkTh24hmU7SGxY8osZkhgTWaUmPpoAesERoVZSN6Z
	heSdWQiLFzAyr2IUSy0ozk1PTTYqMIRHcXJ+7iZGcALVct7BeGX+P71DjEwcjIcYJTiYlUR4
	pd43pwnxpiRWVqUW5ccXleakFh9iNAUG9kRmKdHkfGAKzyuJNzSxNDAxMzM0NzI1MFcS573X
	OjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgclwzeN1i2ouhLlPebNHNGW5C6dPxi5uYZ5bV2ReMJWq
	+3C+4I47VKhksleh5N/84pxHf/3TlcJS43LLrfOquTds2mK7Xjvsd+LtouVrZ5VNX5W/b6Xn
	S8E/u9oU2H6F2+9ZzmO5pGaN+dfpH1fKGDFZHPH/finFbpWBxV1xvSku9cHPZj/zeFHyT+J0
	opHa9kbD0l21yuslkxevmXcyuLO/6Yr2beetOyaf+sYc+Vvtp7/zSmdOhwusCybM6pUSZQqT
	Oi7Y2eq1ffGdAFfXTRxHy5bYFn0MzNBaHa9a9+fv55tXDHfzvbVztOn4tZxv+rLcUve+7ord
	u25unsezI7rozL7a5eea5T7ZyhbeclNiKc5INNRiLipOBADwcqSkKQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSvG5NWHuawbk/ohYP5m1js7j+5Tmr
	xfnzG9gtPvbcY7W4vGsOm8WM8/uYLC6ecrU4/Kad1eLftY0sFk3L1jM5cHm8v9HK7rFpVSeb
	R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGW82HOLqaBRtKJ9u3QD4y2BLkZODgkBE4l5N9+y
	dDFycQgJ7GaUWHzyEhtEQkZiY8N/dghbWOJ+yxFWiKL3jBJrNvxh7GLk4GAT0JX4888BJC4i
	8JtR4sfe74wgDrNAL6PEndv/mEC6hQUiJFZdWcEKYrMIqEosu7eTGcTmFbCX2Ld7BxPEBnmJ
	i2ueg23mFHCQeH7kAFi9EFBN17KbLBD1ghInZz4Bs5mB6pu3zmaewCgwC0lqFpLUAkamVYyS
	qQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwYGupbWDcc+qD3qHGJk4GA8xSnAwK4nwSr1v
	ThPiTUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2ampBahFMlomDU6qBKaW3hmcn
	Z73+PZv+86Enep5ndW4q7DyybpVy9cKUFrXXm6bemb6LWdaIT/L4rZbvcyvX/klb/1Xpp3fe
	6Y2TtLerPrsgm/dvucXRZXfyFmg2tj7yWyX0yT/TSG36LVO+rOenKj5JTml6L9geuJ5RTfTB
	f8spHO871r39ZGetpK11d6PSx0hO/a9fsp/8/xG+PtvZrrdQXtD6tNTnXa4PdzOUO0ypY9ut
	6GkrqbH7T6rrbpVH0kt/aYidFI0zvPJscc+X3nYr6bd1ZnGRX6fxnzYQv/tr7b8G/7q3qht8
	jTJi853Dzp1IYG98tHXdjQf6z3dUb1Kdombw0toj0i/P2C7ZuN172efPG6Xfdp9apMRSnJFo
	qMVcVJwIADvPNZfjAgAA
X-CMS-MailID: 20240705021212epcas2p169cdc84203e007c7a25bb53f41fc61a0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021212epcas2p169cdc84203e007c7a25bb53f41fc61a0
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021212epcas2p169cdc84203e007c7a25bb53f41fc61a0@epcas2p1.samsung.com>

Add cmu_top, cmu_peric0 clock nodes and
switch USI clocks instead of dummy fixed-rate-clock.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c1c8566d74f5..1659c0a375c9 100644
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
+				      "dout_clkcmu_peric0_noc",
+				      "dout_clkcmu_peric0_ip";
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
+			clocks = <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>,
+				 <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>;
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
2.43.2

