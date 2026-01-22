Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99F38E134
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086301; cv=none; b=L7jpyyX9p43vyrsmtivNCWJVmUwbt7nsi2+u6KkNv+M6X2MilPUgIC4cKdG2mfb1tqFmXRx5HDo4YDsg/+WDCzJyXcD23okQmMBxxrhwsvOTvGtBJ7TH6ctebTqO6CxMNP6sqe1FHGGPiLSNrhAbq8WyawpKDB3H8ZHc3ZKsDug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086301; c=relaxed/simple;
	bh=CnnXymbrGRT3V83nY1QVU7QG5QZ1k7N+tOMBfIOkrt0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=r3U/s3S1EhSbjZpy18bfUJ/5psjJRT+4LAuz/W/95kibdioFPvEN3zpcNbaiUi9XQaeMQYSCkUPzh76fZSHxc91iFm1O9Lw+x6Pr42vCUX4qClml5xOmVx7Qddfti73QcLVpfUhHH+kvW4A4Mf0MWLZiivEQeEJtZ1FHL/tFEes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IEfhFXMQ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IEfhFXMQ"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260122125136epoutp04c6f78b753aa95181ab7736ddc919a2aa~NDp0kIZoM2518825188epoutp04o
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260122125136epoutp04c6f78b753aa95181ab7736ddc919a2aa~NDp0kIZoM2518825188epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086296;
	bh=eqqqBR9sIrPPiLooRmVHGEoq/jEmm2fgDXa+UvCsZgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEfhFXMQEG+/e7hWwPytiLk1wfLM52tVgZVeOa4Pla+Vqp2N7P7hBO6U4hOO/rUsg
	 pHUTQL30OJrcqbHHs3dYaseFTwrKKJ4QCFD9t3vJC9UCA0BbW2d9Lx9DgmOiG9FlNR
	 jEa+EjlODHCA1Vqq1KYPN3AoWlmTDBZAYyIKMb58=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122125136epcas5p445cb6799dca47e130e8e4763f7671a18~NDpz9MGGu1352113521epcas5p4m;
	Thu, 22 Jan 2026 12:51:36 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dxgtH0gd8z6B9m9; Thu, 22 Jan
	2026 12:51:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260122125134epcas5p36625b7ac70b8dfba9430831a11955682~NDpynkwiU1556515565epcas5p3K;
	Thu, 22 Jan 2026 12:51:34 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260122125132epsmtip1e50006feabe8a79c690c5e08e5b397b4~NDpwzYlNb0713007130epsmtip1T;
	Thu, 22 Jan 2026 12:51:32 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators
 for the USB
Date: Thu, 22 Jan 2026 18:37:20 +0530
Message-Id: <20260122130721.205664-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122130721.205664-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122125134epcas5p36625b7ac70b8dfba9430831a11955682
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125134epcas5p36625b7ac70b8dfba9430831a11955682
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125134epcas5p36625b7ac70b8dfba9430831a11955682@epcas5p3.samsung.com>

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

