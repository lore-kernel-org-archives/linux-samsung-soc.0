Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A81275866
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798625; cv=none; b=J5op6KKnWSg5wJdLaCjM4Oa9wk/ljWzqgJYxMJZOhFvMPXmAeBOqkSnK2kkhRCtkDNyDv/w8rxpFWg5JVoCmX6wKciEgdV04sS3Ug7CJJeceF/K/suRT184VoXMNIysAunrFQV6jMvvIhJIROraIDYRX5OD5BWuHTP0G5jWy44Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798625; c=relaxed/simple;
	bh=y2BakADmDwJV3+aVhyXWZgnM7lmbL/Pt80RjjzanWvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=R19/t0CZqzss0hj90dgah5pK9Vo/EIIamwcxx+IOndz8MPP2xl+Dk8oI2TFvrmZ4kaqzsCyU5b79toVfAmaA0kUTybn4Effk1UxDPdRsit07FR5d/CMWYZVGCQmSdfde9hXu3oyqTobRxqmpiDyuo5f2Wv9l/RCYT4Nvvnb2/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lJRH1SkA; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lJRH1SkA"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250613071022epoutp012c35491bddd06e5bab6ebbbf68c495ac~IiJN6U9N22991129911epoutp015
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250613071022epoutp012c35491bddd06e5bab6ebbbf68c495ac~IiJN6U9N22991129911epoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798622;
	bh=wXrKoxN5FTLMOBvaJthOPs+x7BGc8lVrjBvn7GCOWhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJRH1SkAlTd9TvAnt+hksvwEtccrC9zQ1TNLMbnYbLLG1c14bAP5AXJxudj4JDnsD
	 4nB9Xd3C+/yMi3BxEP1LaRY2qsBdusOjS00es0xC5HMWzOpjK1c+fgMyEsQRebA9r6
	 NXPI7/8iOpJEBWeWtf4vb+ypUSzVNc0dh7llpAvA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250613071021epcas5p1892a5bf37a069767a3743eb23b5da978~IiJNQ3YuV1532515325epcas5p1s;
	Fri, 13 Jun 2025 07:10:21 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bJVsR5hHWz3hhTD; Fri, 13 Jun
	2025 07:10:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33~IhD3jMu_31695316953epcas5p2C;
	Fri, 13 Jun 2025 05:50:56 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055053epsmtip1470e899e4987d1436f6f028fcb03a9cc~IhD0zla9h0400204002epsmtip1S;
	Fri, 13 Jun 2025 05:50:53 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 6/9] arm64: dts: exynos: ExynosAutov920: add USB and USB
 HS combo phy nodes
Date: Fri, 13 Jun 2025 11:26:10 +0530
Message-Id: <20250613055613.866909-7-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055056epcas5p29790d8086c89b16441f4b0a9c2a4db33@epcas5p2.samsung.com>

Add the USB 3.1 DRD controller and USB31DRD HS combo phy nodes for
ExynosAutov920 soc.

The USB 3.1 DRD controller has the following features:
* DWC3 compatible
* compliant with both USB device 3.1 and USB device 2.0 standards
* compliant with USB host 3.1 and USB host 2.0 standards
* supports USB device 3.1 and USB device 2.0 interfaces
* supports USB host 3.1 and USB host 2.0 interfaces
* full-speed (12 Mbps) and high-speed (480 Mbps) modes with USB device
  2.0 interface
* super-speed (5 Gbps) mode with USB device 3.1 Gen1 interface
* super-speed plus (10 Gbps) mode with USB device 3.1 Gen2 interface
* single USB port which can be used for USB 3.1 or USB 2.0
* on-chip USB PHY transceiver
* supports up to 16 bi-directional endpoints
* compliant with xHCI 1.1 specification

Only UTMI+ is supported in this commit, so only UTMI+ PHY interface is
specified in "phys" property (index 0) and PIPE3 is omitted (index 1).

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   | 12 +++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 36 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index 984e899a2ebf..a21386bd9af3 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -88,6 +88,18 @@ &xtcxo {
 };
 
 /* usb */
+&usbdrd31_hsphy {
+	status = "okay";
+};
+
+&usbdrd31_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usbdrd31 {
+	status = "okay";
+};
+
 &usbdrd20_phy0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index b1a9d1da47f6..4efc005cae80 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,17 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usbdrd31_hsphy: phy@16490000 {
+			compatible = "samsung,exynosautov920-usbdrd-hsphy";
+			reg = <0x16490000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
 		usbdrd20_phy0: phy@16500000 {
 			compatible = "samsung,exynosautov920-usbdrd-phy";
 			reg = <0x16500000 0x0200>;
@@ -1081,6 +1092,31 @@ usbdrd20_phy2: phy@16520000 {
 			status = "disabled";
 		};
 
+		usbdrd31: usb@16600000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16600000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd31_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd31_hsphy 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
 		usbdrd20_0: usb@16700000 {
 			compatible = "samsung,exynosautov920-dwusb3";
 			ranges = <0x0 0x16700000 0x10000>;
-- 
2.34.1

