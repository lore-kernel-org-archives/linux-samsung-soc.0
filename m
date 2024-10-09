Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F255E53
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728447689; cv=none; b=RNzIa/MSvGuMNEfkCCRdzVsVFm7V++XC98tuA0+BuTEHMMJ52svXIUXO1nVnnU6E/wpohJXdlCirp1fNVq1syfDqH4xeI9WxUA1cZb1H6EcZnIyOEIEO1+rkCcfK6ujiuTRLHb7dK15pzFgXe3jRnEWb2LABjL2J5D0/+Vv9chA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728447689; c=relaxed/simple;
	bh=WRqjubW+I7cN3Hd71LqTLIqW6XSd4ucEaJXbUbMu5Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=FSLm8SdNiTIUoleuIuvOSOJPXEk4v+w+SWPE1Mql/5B70NUTH8xTSOOd80xjABuHxWJ2MrP81gqgBcASl4GY+yewf0FoZL+raus18AEIHGBZ56QoKoT5Eo0Q9P8FNRRj0NRpMIqOHtepZmbuczG1U1fceP/x110QLcgfjCYMeVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dwSpkauk; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dwSpkauk"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241009042119epoutp047e6f7d9fe4a3afa62612739356f17834~8rgG-IZnS3091430914epoutp04e
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241009042119epoutp047e6f7d9fe4a3afa62612739356f17834~8rgG-IZnS3091430914epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728447679;
	bh=ssRExWKD5A07LgoUhNw/tWVunYPb56F3kIxoBfoq3pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwSpkaukive1T+Nb+5SU/VgnzbCwhieZORLdDsCW65oo5DBorCzHiAmVKyBYx97ZD
	 1DCybyMMt2yveV+93hX6qnH6vDsP8/+7g6isCTvYwDo7NUCuI4pDZDzvr60xJ62YSI
	 Rys0Po4gBs4HtJIwmDmiDLMTyYqRBTccUGfX/5CU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241009042118epcas2p42e337425aa1a66fe1b959cfb250378ac~8rgGdOr6w0752207522epcas2p4M;
	Wed,  9 Oct 2024 04:21:18 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XNfpQ2ZlXz4x9Pr; Wed,  9 Oct
	2024 04:21:18 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	02.9D.09396.EB406076; Wed,  9 Oct 2024 13:21:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epcas2p2335311cae816f9c92b15fcd28b56e413~8rgFX6kga2939729397epcas2p2P;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241009042117epsmtrp2a182521d8308f8cc26da4f0b261b6800~8rgFXPCNI2533825338epsmtrp2C;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
X-AuditID: b6c32a45-6c5b7700000024b4-11-670604be74bf
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.F6.18937.DB406076; Wed,  9 Oct 2024 13:21:17 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epsmtip273c9ff915779c75f9bfb374324b94384~8rgFIlopM3166031660epsmtip2S;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v3 3/3] arm64: dts: exynosautov920: add peric1, misc and
 hsi0/1 clock DT nodes
Date: Wed,  9 Oct 2024 13:21:10 +0900
Message-ID: <20241009042110.2379903-4-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmue4+FrZ0g/9PuS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGdM+ficseCsaMWcQ3dYGhhf
	CXQxcnJICJhILH2+gqWLkYtDSGAHo0TDtA1MEM4nRoklM3eywjmflv1hh2k50d8FVbWTUaJ7
	2SpGCOcjo8Ty7R/Zuhg5ONgEdCX+/HMAiYsI7GGS2HJ+CVgHs8BZRom7cxaAjRIWSJA4MG89
	C4jNIqAqMXvSZDYQm1fAXqJ17XYWiHXyEtcfH2UCsTkFHCQ65l1hhKgRlDg58wlYDTNQTfPW
	2cwgCyQEpnJIrDv/E+pWF4ndHzsZIWxhiVfHt0DFpSQ+v9vLBmHnS0y+/pYJormBUeLav25m
	iIS9xKIzIIM4gDZoSqzfpQ9iSggoSxy5BbWXT6Lj8F92iDCvREebEESjmsSnK5ehhshIHDvx
	DMr2kDi7bTY0SCczSnQ8OMc8gVFhFpJ3ZiF5ZxbC4gWMzKsYxVILinPTU4uNCgzhcZycn7uJ
	EZxytVx3ME5++0HvECMTB+MhRgkOZiURXt2FrOlCvCmJlVWpRfnxRaU5qcWHGE2BgT2RWUo0
	OR+Y9PNK4g1NLA1MzMwMzY1MDcyVxHnvtc5NERJITyxJzU5NLUgtgulj4uCUamCaL/29pDVd
	fflizrYYnrMHNFr7c9ZOOhWV5tP5/2z9rlC2DYX66rdO7rH3+hQ149Vqd/VQ5o4/uq/SDfIf
	RPM/YJ/xVLzXYAPb1q2Tl+SdiJ32bF7A3BWcq6vypopcF+N8yF6cMTkhVYt5apD9yZ6ZP2KP
	7llusOuoxo+zSw8cd/kz7VUxv/qjWXKbvjYfD5mvIW36cvvUr7x9nyxYJbnevv2XtPxNMv8L
	Z+aQhVrrV9wJWuDY1R2Qtpbz1ZtCOd1l1yMfr7HM8D4l0e/88GVe/dO3W/5skjy20E710NaX
	Z9Wj899Pq/uVfIbXvu6uft6Reo2cZJ5JoYY+fI6uRtN7vBkWTjwZm3ND/OX1a8dllViKMxIN
	tZiLihMBuq9xnkIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSvO5eFrZ0gy0zNCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4MqZ8
	fM5YcFa0Ys6hOywNjK8Euhg5OSQETCRO9HcxdTFycQgJbGeUeHJ1IwtEQkZiY8N/dghbWOJ+
	yxFWiKL3jBIvHzUDORwcbAK6En/+OYDERQQOMUlM/PyUBcRhFrjMKHHs7mRmkCJhgTiJtQuL
	QAaxCKhKzJ40mQ3E5hWwl2hdux1qmbzE9cdHmUBsTgEHiY55VxhBbCGgmictU5kh6gUlTs58
	AlbPDFTfvHU28wRGgVlIUrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECI4IraAd
	jMvW/9U7xMjEwXiIUYKDWUmEV3cha7oQb0piZVVqUX58UWlOavEhRmkOFiVxXuWczhQhgfTE
	ktTs1NSC1CKYLBMHp1QDk87LzpCygIWFU59FtJbHXBCW3XjQK8EsqLoxfsniq12r5TgEKm6v
	cM+WnfHr1uUZGuLpubKLPRy+mpqJSzw/59qUspbRckXxgRsZkUkVL4Q3L36wKX7r+WsyMUm1
	CQdm7F3jGfj9A8+uRw07mkMs1gZH5sTKpJeUn3txretBVUUKz8wNPzambCs4sLzyZfeeAl6e
	9RF28c2Wf5Z0PwnlXLpQ83ruxlWbr62Za3Mr0yxWeG619bEmroPnHpTf/fyc898vdfP1/Yes
	tA9yPPhY49iYoxd3erb3dz3vxZemLdt2z36ZSsWDfqUTNxTvqUkcN5TZIdejHK3SrLxiymrl
	01E/n1lJFQrs4Iy4vvTpBiWW4oxEQy3mouJEAJR+xrT3AgAA
X-CMS-MailID: 20241009042117epcas2p2335311cae816f9c92b15fcd28b56e413
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241009042117epcas2p2335311cae816f9c92b15fcd28b56e413
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
	<CGME20241009042117epcas2p2335311cae816f9c92b15fcd28b56e413@epcas2p2.samsung.com>

Add cmu_peric1 for USI, I2C and I3C clocks respectively.
Add cmu_misc for MISC, GIC and OTP clocks respectively.
Add cmu_hsi0 for PCIE clocks respectively.
Add cmu_hsi1 for USB and MMC clocks respectively.

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 91882b37fdb3..c759134c909e 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -172,6 +172,17 @@ chipid@10000000 {
 			reg = <0x10000000 0x24>;
 		};
 
+		cmu_misc: clock-controller@10020000 {
+			compatible = "samsung,exynosautov920-cmu-misc";
+			reg = <0x10020000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
+			clock-names = "oscclk",
+				      "noc";
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -247,6 +258,19 @@ pwm: pwm@109b0000 {
 			status = "disabled";
 		};
 
+		cmu_peric1: clock-controller@10c00000 {
+			compatible = "samsung,exynosautov920-cmu-peric1";
+			reg = <0x10c00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_PERIC1_NOC>,
+				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ip";
+		};
+
 		syscon_peric1: syscon@10c20000 {
 			compatible = "samsung,exynosautov920-peric1-sysreg",
 				     "syscon";
@@ -283,12 +307,38 @@ pmu_system_controller: system-controller@11860000 {
 			reg = <0x11860000 0x10000>;
 		};
 
+		cmu_hsi0: clock-controller@16000000 {
+			compatible = "samsung,exynosautov920-cmu-hsi0";
+			reg = <0x16000000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI0_NOC>;
+			clock-names = "oscclk",
+				      "noc";
+		};
+
 		pinctrl_hsi0: pinctrl@16040000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16040000 0x10000>;
 			interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi1: clock-controller@16400000 {
+			compatible = "samsung,exynosautov920-cmu-hsi1";
+			reg = <0x16400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI1_NOC>,
+				 <&cmu_top DOUT_CLKCMU_HSI1_USBDRD>,
+				 <&cmu_top DOUT_CLKCMU_HSI1_MMC_CARD>;
+			clock-names = "oscclk",
+				      "noc",
+				      "usbdrd",
+				      "mmc_card";
+		};
+
 		pinctrl_hsi1: pinctrl@16450000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16450000 0x10000>;
-- 
2.46.0

