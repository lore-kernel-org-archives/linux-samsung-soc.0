Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA918FDA3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323555; cv=none; b=ZxIAhNk96NAuOIbPQIHU2EiwlpqPl+PsasjU0C3J+c8zaaqX4vqlwXAaJTasRxT8VJpJ2uwf4dUsLh/gycUfMrfl9rCqv3NkS6yuEkvRg7wXhZ1O3cQ/g6sgmH70ngd0LI5CW0r0WpOrWrXNFfzzXivMxOjfOyQsQ0uI/ittjeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323555; c=relaxed/simple;
	bh=AkyWJ9I6Hd2zktck1kauTocadzukvCDLU9FEN2IAB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=owQQ9pCxkD/+EGhLwnO0LDg1p+D16ZCAiNZ+OdsvxEaBTaMDtsfnqTAdb0ffIfZUChgF3y+4ACu9mrNEN5LpqKbVg9/wz285hkKHQoW41+jnGKS4A3fnQtu2hxm7GkgZ0e6gmN8HzmF0+h/sSHjdgmr7scFhXy2M+vUjFL/LCVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XNnJsJfT; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XNnJsJfT"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240730071229epoutp03da4ed2dec653a52e328c8bbe6bec7bb7~m7CSrYba20936009360epoutp03k
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240730071229epoutp03da4ed2dec653a52e328c8bbe6bec7bb7~m7CSrYba20936009360epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722323549;
	bh=bAiZEbXYaEhIP7FM2a6MyvX2CrU3Y1JE6JPzxHX7HAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XNnJsJfTH17Hw4T4IezzSqLjh4r6YH59ul6Xqq4KqSM3F6PiVkMGgecXMa0sERRWL
	 3Nv50/MnVFQ6PSns3P9uJqCcSaBrGL8atA/mxLVk7SYLAhcHeb/42rES4I2wNnr7XR
	 THXYBfkc7xQr9U7rwC1H04LQADlwPPcG8D/f2V6k=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240730071229epcas2p32661a5be60b686d4b9beafada506b9ce~m7CSHZoBT0692706927epcas2p3F;
	Tue, 30 Jul 2024 07:12:29 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WY5yh39zqz4x9Q1; Tue, 30 Jul
	2024 07:12:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	7A.94.08901.C5298A66; Tue, 30 Jul 2024 16:12:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epcas2p1d1c0d9d1f40b045002ce0509f5168648~m7CQ-j7qt1604616046epcas2p1l;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240730071227epsmtrp2ac2a525d9120ba163e45175baae4a88d~m7CQ_sxLy1318313183epsmtrp2S;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-8a-66a8925c3475
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	63.FD.07567.B5298A66; Tue, 30 Jul 2024 16:12:27 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epsmtip2c1c5c64d8b961b6c53d0132430d44930~m7CQscqHo0507805078epsmtip2g;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v5 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
Date: Tue, 30 Jul 2024 16:12:19 +0900
Message-ID: <20240730071221.2590284-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmqW7MpBVpBuvahCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGdsXfOHraBFvKJpwyb2Bsal
	Ql2MnBwSAiYSc778Y+1i5OIQEtjBKNEx5QIjhPOJUWL+sodMEM43Romt3atZYVrWHrsEldjL
	KLGo/xiU85FR4sF3EIeDg01AV+LPPweQuIjAHiaJLeeXgBUxC5xllLg7ZwE7yChhgRiJbQ0T
	wWwWAVWJd6uPM4LYvAL2ElfezIFaJy9xcc1zNhCbU8BB4sDHeSwQNYISJ2c+AbOZgWqat85m
	hqhfyCFxahMfhO0i0fruJiOELSzx6vgWdghbSuLzu71sEHa+xOTrb8GOkxBoYJS49q8bapC9
	xKIzP9lBvmEW0JRYv0sfxJQQUJY4cgtqLZ9Ex+G/7BBhXomONmiYqkl8unIZaoiMxLETz5gh
	Sjwk9p3mhQTVZEaJmW/eMU1gVJiF5JlZSJ6ZhbB3ASPzKkax1ILi3PTUZKMCQ3gMJ+fnbmIE
	p1st5x2MV+b/0zvEyMTBeIhRgoNZSYQ3/srSNCHelMTKqtSi/Pii0pzU4kOMpsCgnsgsJZqc
	D0z4eSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1MAnt+vuHg4Pv
	SGqolPVs0RWbb0sIP2EIdsoR+nfQ+PZHvdLTXd/YfRy8jO0DFbde+Buq5VXydomJ09293tlr
	Vmfd6p++nWEy3/qWBSEP97psX7A2MuX8rVQ9m8OiNfXb42fYBu/UrNx8+v65qxt3ffZwvrFY
	JmLC+b3eWW37a9SSWaLnax84JjgrnKPrQtcS3cMvb10pWS93l0M7umrD8Yp5Nztf138WO7d0
	1bS9J/r2+Lqe+tLPfSn8tZtf46ZXhTP0ReK2Fz/IvFKt9DLnyN9CL0uXOslmm7Xfz7MVzD97
	VfRliuTuH82n+pwW6BoYBLdtd9Kdu3/xCZ/lHw65LmPlqf27/JPbH/nVOWZCMgxKLMUZiYZa
	zEXFiQB8himbQAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvG70pBVpBss+6lk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZWxd
	84etoEW8omnDJvYGxqVCXYycHBICJhJrj11i6mLk4hAS2M0o8XH6DCaIhIzExob/7BC2sMT9
	liOsILaQwHtGiXlXU7sYOTjYBHQl/vxzAOkVETjEJDHx81MWEIdZ4DKjxLG7k5lBGoQFoiSm
	fWphA7FZBFQl3q0+zghi8wrYS1x5M4cVYoG8xMU1z8FqOAUcJA58nMcCscxe4n3zRWaIekGJ
	kzOfgMWZgeqbt85mnsAoMAtJahaS1AJGplWMkqkFxbnpucmGBYZ5qeV6xYm5xaV56XrJ+bmb
	GMGRoaWxg/He/H96hxiZOBgPMUpwMCuJ8MZfWZomxJuSWFmVWpQfX1Sak1p8iFGag0VJnNdw
	xuwUIYH0xJLU7NTUgtQimCwTB6dUA1PL6a+rLjPIP/1eKLHVcUfiUrsS1mvsWx6U3L1uJbFd
	yq7gWdJH9jXlGVp6p+f9W2m+w/MJ65Mb1zsOrTv09Ffkuh3Hp7v56+ydfk/ul43zXqZLi/oP
	Jt+dY+D4S+Ld/MYfjDMFjhVbHsrc+ihZVzn2v4RrqJL+7qyzn45dCdKK/fmsvqL5zsoli+42
	MAbIP3urKu7L3JjcKfh2X6fmnHIRibsp0/uKls3UnV66cvX+Dd8ulAvPqm9edKPGQXv77Vh/
	6cKVIivW6jt+/3rorzbHZXVVxnVq2l9UEx77zj+SeMlRxnjqMs8Ss2A2rWKug9mWwXMezGV/
	m92oafh2zr2uZywTTj8v9E+6JX3sya44JZbijERDLeai4kQAiqBcqPsCAAA=
X-CMS-MailID: 20240730071227epcas2p1d1c0d9d1f40b045002ce0509f5168648
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730071227epcas2p1d1c0d9d1f40b045002ce0509f5168648
References: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
	<CGME20240730071227epcas2p1d1c0d9d1f40b045002ce0509f5168648@epcas2p1.samsung.com>

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

