Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D24438B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721687628; cv=none; b=F5b0KsZ2bdT3bgaDVtkVmgNBcgxFB6tAM4voXsnmLRyWrbEEvIGEqDq+Fgg8Sp5PN/lugKckQI5LEbDIog1RNRXfCHYxM6w+UhETqz+x8HDBKQTOZDSza3+bMO9jSQWsrscmIl1Bp678Nq3WQlhU/Bd6IGp2h/yrNDGaUJVU2oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721687628; c=relaxed/simple;
	bh=vEA3KXSIAhaD+zPw0CsEnqeejkEmDhNscB3wVGeIHyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=G7y0+uL1cpn6l46Vc3PJsdYPAfaARHSjGFjlw9GlguidNVQOspfyRCOqL1WaAoKcSn+MIGFDeDvPAiFRdk5CXn3ShAjC+ovlEXcSRGNH8WJ5/HXdT2xEjM51Y1ov8NRNEIRL6MlmMGpWCoKdtllgEVHw5EQvzvrygD3E/tW43fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LSkJFIs+; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LSkJFIs+"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240722223342epoutp04d0c57216092dd2dc81eb3acaedaeba9c~kqcVVFB1U1196511965epoutp04Q
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240722223342epoutp04d0c57216092dd2dc81eb3acaedaeba9c~kqcVVFB1U1196511965epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721687622;
	bh=D5r1Rcdl8j5s7c0Hxhg9GSw1ryrOrFCSJgC2vioYM0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LSkJFIs+TNn/u1nSnycnNTUEdoF9etRoNd5kmQoyZIg6cDoNAaVWcOP9kPITd9r88
	 mDT30nRC9Ks9EXGv8BepBHp3QuTwka15b3cXhfp3Y0XuIFZGQIsN8+LYuLVy2Mh4Xd
	 gWmpvHBhYOt6B3KyTgcqiM0mSG+QpSe56g73GvZ8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240722223342epcas2p390668a76cbfbce93af963fde41f1d33c~kqcU1l5sx0258902589epcas2p3J;
	Mon, 22 Jul 2024 22:33:42 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.99]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WSZnK3pHKz4x9Ps; Mon, 22 Jul
	2024 22:33:41 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.EF.19039.54EDE966; Tue, 23 Jul 2024 07:33:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64~kqcT592Jb1454814548epcas2p10;
	Mon, 22 Jul 2024 22:33:41 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240722223341epsmtrp1180928027a24a3c8da71783676101ea5~kqcT5HVUT2611526115epsmtrp1G;
	Mon, 22 Jul 2024 22:33:41 +0000 (GMT)
X-AuditID: b6c32a4d-305ff70000004a5f-58-669ede45731d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.79.08456.44EDE966; Tue, 23 Jul 2024 07:33:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240722223340epsmtip12d59f678cc86b38a4c85d4bfdddcb3f1~kqcToIrTi2133921339epsmtip1q;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v4 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
Date: Tue, 23 Jul 2024 07:33:31 +0900
Message-ID: <20240722223333.1137947-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmqa7rvXlpBncOSls8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7o3PyLqeC2SMWnZoUGxi0C
	XYycHBICJhKzjnSwgthCAnsYJf7eS+li5AKyPzFK/LyygQXC+cYosf3gPzaYjhcrWpkhEnsZ
	JU7NvQblfGSUePlvMtAsDg42AV2JP/8cQOIiAnuYJLacX8IE4jALnGWUuDtnATvIKGGBGIm2
	W3MZQRpYBFQl9v9hAjF5Bewl+ntMIJbJS1xc85wNJMwp4CAx+ZYCSJhXQFDi5MwnLCA2M1BJ
	89bZYCdICMzkkJh2r40dotdFYuuJ2SwQtrDEq+NboOJSEi/7YWryJSZff8sE0dzAKHHtXzcz
	RMJeYtGZn+wgi5kFNCXW79IHMSUElCWO3ILayyfRcfgvO0SYV6KjTQiiUU3i05XLUENkJI6d
	eAZle0jsOHWNFRJSkxklfv+5xTqBUWEWkndmIXlnFsLiBYzMqxilUguKc9NTk40KDHXzUsvh
	UZycn7uJEZxwtXx3ML5e/1fvECMTB+MhRgkOZiUR3iev5qYJ8aYkVlalFuXHF5XmpBYfYjQF
	hvZEZinR5Hxgys8riTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoFp
	XUffRGWJ5tCVakKhYh/tXd9Uninu6zVw2Pk564zPnbRj23+2S6dXfHVZ7thvr7WWf2rFleM2
	d+9LdKgc+RFxWclhQp7cQqlw4zLH34+0Np/vKpgtlrPi6KnTSVs0I2p4c3iLrofmzOpdtfT6
	U6X5+6ZkJtbVTZDoDdpX9H273xyhwxdnOK3X6lid9Et9o8ZOhnVnT7ELe5VO+Gb1qDjk26JV
	38snx5SttXwd9cEwStj5eOqX/kq2f0si569JZqvdfiQ4NCg2xDR6zw4nWdcdUtxrLdqO/RLU
	eK6Wu2J2SUAw+8Se3HWWz9ka2HyfXWZj/uGo+l6UQffPI+OlrP0rjDL+RR8IXfS78Fm7+X4l
	luKMREMt5qLiRADi2Hd3QQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWy7bCSnK7LvXlpBkffm1k8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZXRu
	/sVUcFuk4lOzQgPjFoEuRk4OCQETiRcrWpm7GLk4hAR2M0r0Petih0jISGxs+A9lC0vcbznC
	ClH0nlGia/0fpi5GDg42AV2JP/8cQOIiAoeYJCZ+fsoC4jALXGaUOHZ3MjNIt7BAlMT1Kz8Z
	QRpYBFQl9kP08grYS/T3mEDMl5e4uOY5G0iYU8BBYvItBZCwEFDFrJfXwIbwCghKnJz5hAXE
	ZgYqb946m3kCo8AsJKlZSFILGJlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIEx4SW
	1g7GPas+6B1iZOJgPMQowcGsJML75NXcNCHelMTKqtSi/Pii0pzU4kOM0hwsSuK83173pggJ
	pCeWpGanphakFsFkmTg4pRqYoh5f4fspyTqdg6dz1/qF66pCxYTZ/S5o9x8QdAwOuP8iI2+x
	62nzaaW7SxqOXeX99fDih5c/NzPY/7yZJbeCIYlP+t9q55muciI52kXPj0lV7Lfomv+gkaso
	3r6xqlmSc1/48qwlf9SaZj61XmLdrv9l67cPx6wqj/puOVN+9XfZbfcV5+UlI+Ye9b/++kNT
	TJ2U7aakmYcSd3wK4e0TfcJzuc/kbormk6i5r0K4G6IYvvipXlqs2vGWX1pAvmBlh5KijOGG
	t8EljyY8OeLm4Gm7YM2xHx08lp8K3mx5lM8fbyn/Zv6Xa7qemekuycqSse4LDq38phdgfGOB
	4g+562L5UziqSzI1JBKfvH+mxFKckWioxVxUnAgAJEhdlfgCAAA=
X-CMS-MailID: 20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
	<CGME20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64@epcas2p1.samsung.com>

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

