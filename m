Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4955D311968
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306036; cv=none; b=gVQU4OuNnQ+tZ8IlLWyYakR9OTWAlNK9dFbxIPzQURwCUE9c8dnT/Pc9WbKKMp++tmXnp4nEAR/vw72sz6q120NXFUYu5idxNvsknVEsqIFjmGlFFs0S7QzNhYiDN3FqcaD2ohGF0/9OqdtOv+7imvG3/RBqsq8QEI5WiBanLuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306036; c=relaxed/simple;
	bh=CnnXymbrGRT3V83nY1QVU7QG5QZ1k7N+tOMBfIOkrt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=kbQI12OE3hP3vxSdnaq88810E8rzn6X6nIzgSAwrdfEq/dzYXKRLgmg3WMNdJ72N4P8yJezm5jXVD2btiaDVtynbDZuV1S7199n8l1BuG0QT4bEfPOyRF/DzyIfocCZtgeoqXhF8r6pHKh9Qj4EEqVU8rgCEjRu/5RmYauAakpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cb91Zw9G; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cb91Zw9G"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251024114032epoutp02b79af9eb0d6262f8f28f4ce936fc0582~xaoE5eHO-1354413544epoutp02e
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251024114032epoutp02b79af9eb0d6262f8f28f4ce936fc0582~xaoE5eHO-1354413544epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761306032;
	bh=eqqqBR9sIrPPiLooRmVHGEoq/jEmm2fgDXa+UvCsZgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cb91Zw9G0Y/Sxl3R6OKtPaCU1w/zCF+cyJB+jmRaYV/hwh1v3frjzkOuv3zRNmc1N
	 djXCb0V6Q6exCloX7esl5j+iDtd16aaO7ME3McL2v4WQHpIAxgvZOwkUfDHAKzW6Q+
	 tDQjUphouTUBjCXWHusoawpGNBme4MBmdmAXlMsU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251024114031epcas5p3c8d3994671155ab96f87b85a6d0e04c9~xaoEHRrAV0754707547epcas5p3C;
	Fri, 24 Oct 2025 11:40:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ctLYq02NZz6B9m8; Fri, 24 Oct
	2025 11:40:31 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251024114030epcas5p2c9ba90eaa354440873b73263746fa148~xaoCqAUjO2192421924epcas5p2A;
	Fri, 24 Oct 2025 11:40:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024114027epsmtip1731237c9e8e3cf096f552d07c9ad3608~xaoACMBML0283702837epsmtip1J;
	Fri, 24 Oct 2025 11:40:26 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators for
 the USB
Date: Fri, 24 Oct 2025 17:18:44 +0530
Message-Id: <20251024114845.2395166-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024114845.2395166-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024114030epcas5p2c9ba90eaa354440873b73263746fa148
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114030epcas5p2c9ba90eaa354440873b73263746fa148
References: <20251024114845.2395166-1-pritam.sutar@samsung.com>
	<CGME20251024114030epcas5p2c9ba90eaa354440873b73263746fa148@epcas5p2.samsung.com>

Add dummy regulator for USB and PHY supplies.

Add vbus regulator that is enabled by GPIO pin.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a397f068ed53..f90f7704597c 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -52,6 +52,76 @@ memory@80000000 {
 		      <0x8 0x80000000 0x1 0xfba00000>,
 		      <0xa 0x00000000 0x2 0x00000000>;
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	dummy_regulator: regulator-0 {
+		 compatible = "regulator-fixed";
+		 regulator-name = "dummy_regulator";
+	};
+
+	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd31_dwc3-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 0 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy0: usb-phy0 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd31_dwc3_vbus>;
+	};
+
+	usbdrd20_dwc3_0_vbus: usbdrd20_dwc3_0-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd20_dwc3_0-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy1: usb-phy1 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd20_dwc3_0_vbus>;
+	};
+
+	usbdrd20_dwc3_1_vbus: usbdrd20_dwc3_1-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd20_dwc3_1-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy2: usb-phy2 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd20_dwc3_1_vbus>;
+	};
+
+	usbdrd20_dwc3_2_vbus: usbdrd20_dwc3_2-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "usbdrd20_dwc3_2-vbus";
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       enable-active-high;
+	       regulator-always-on;
+	       gpio = <&gpp2 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	/* Use gpio for enabling vbus regulator */
+	usb_phy3: usb-phy3 {
+		compatible = "usb-nop-xceiv";
+		vbus-supply = <&usbdrd20_dwc3_2_vbus>;
+	};
 };
 
 &pinctrl_alive {
@@ -86,3 +156,72 @@ &usi_0 {
 &xtcxo {
 	clock-frequency = <38400000>;
 };
+
+&usbdrd31_ssphy {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+};
+
+&usbdrd31_hsphy {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd31_dwc3 {
+	maximum-speed = "super-speed-plus";
+	usb-phy = <&usb_phy0>;
+};
+
+&usbdrd31 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_phy0 {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_dwc3_0 {
+	maximum-speed = "high-speed";
+	usb-phy = <&usb_phy1>;
+};
+
+&usbdrd20_0 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_phy1 {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_dwc3_1 {
+	maximum-speed = "high-speed";
+	usb-phy = <&usb_phy2>;
+};
+
+&usbdrd20_1 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_phy2 {
+	dvdd-supply = <&dummy_regulator>;
+	vdd18-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
+
+&usbdrd20_dwc3_2 {
+	maximum-speed = "high-speed";
+	usb-phy = <&usb_phy3>;
+};
+
+&usbdrd20_2 {
+	vdd10-supply = <&dummy_regulator>;
+	vdd33-supply = <&dummy_regulator>;
+};
-- 
2.34.1

