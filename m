Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFDC2749ED
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798611; cv=none; b=Fk+BxDBWarlsv4sTB6SVXEvjlHSUkGkqlVLmue97277QWe8FRWtSnQzTUR5u1RAzZGiZpedaMeFleOju9qhZ4DrnD49a6QQlLSS2yVCPscQjqYtryiITRvf39oUVv5MrdpzDpZPobbi9/JNXtrRtJeJRraAUe3bIiw/dcIBh178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798611; c=relaxed/simple;
	bh=aNn818a3SP0rXsCHH7DUuIBr1/tWLE+QY8uTQtIQvMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=jkEdD4JyhG8KfaE0n0HFBn9ydFlthw7r7VZtNfs8OZ3okiad5Wp5wUumSFJaPfoPbwCXL2HY+mkAA6gi3jDV28BGWmDTzN3W7Y2yKAPHBbcauRh4+NVnP6jd6MqP8UNM5br/TL+zx2D5aLKu8o8HNs1PLSX7iEcicbVEm7hCkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OidYN1WD; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OidYN1WD"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250613071007epoutp0178dee5710bb1f3aba5a7c9fde74367b4~IiJAK5Oeg2937429374epoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:10:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250613071007epoutp0178dee5710bb1f3aba5a7c9fde74367b4~IiJAK5Oeg2937429374epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798607;
	bh=JYyLT9ij1kbOuzmlK+cSgWL3MSercwWUteIFKYV8bLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OidYN1WDuoAYps03SyL1lyAX7I3oaVh1xJyHy2CbDnhfa+y4Dup9xFdjPw4ksqsL3
	 nk5oVeWHN0VPnScyQduA5nzzzKurOgLp6vfRUDx+e9eA745uFSgJ7+XQnrTjU8VY+H
	 9cS2iT/cha6+kQ+S4myj3qDIVHWEn8NLkiSTRsXs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250613071006epcas5p40953007c90a7cc619665358c4714304b~IiI-adCQY1529115291epcas5p4c;
	Fri, 13 Jun 2025 07:10:06 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bJVs820Bzz3hhTJ; Fri, 13 Jun
	2025 07:10:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250613055047epcas5p220b1cd1e9b2819997a3d4747c395d13d~IhDupI1Ig2779327793epcas5p2o;
	Fri, 13 Jun 2025 05:50:47 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055044epsmtip1cb3d9cf1276384ed10bb4cc76c671d7c~IhDr5JafY0439404394epsmtip1Q;
	Fri, 13 Jun 2025 05:50:43 +0000 (GMT)
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
Subject: [PATCH v3 3/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB-phy nodes
Date: Fri, 13 Jun 2025 11:26:07 +0530
Message-Id: <20250613055613.866909-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055047epcas5p220b1cd1e9b2819997a3d4747c395d13d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055047epcas5p220b1cd1e9b2819997a3d4747c395d13d
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055047epcas5p220b1cd1e9b2819997a3d4747c395d13d@epcas5p2.samsung.com>

Add USB controller and USB PHY controller nodes for this SoC.

The USB controller has following features:
* Dual Role Device (DRD) controller
* DWC3 compatible
* Supports USB 3.0 host and USB 3.0 device interfaces but phy
  controller capability is limited to USB 2.0.
* Supports  full-speed (12 Mbps) and high-speed (480 Mbps) modes with
  USB device 2.0 interface
* Supports on-chip USB PHY transceiver
* Supports up to 16 bi-directional endpoints (that includes control
  endpoint 0)
* Complies with xHCI 1.1 specification

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   |  37 ++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 108 ++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a397f068ed53..984e899a2ebf 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -86,3 +86,40 @@ &usi_0 {
 &xtcxo {
 	clock-frequency = <38400000>;
 };
+
+/* usb */
+&usbdrd20_phy0 {
+	status = "okay";
+};
+
+&usbdrd20_dwc3_0 {
+	dr_mode = "peripheral";
+};
+
+&usbdrd20_0 {
+	status = "okay";
+};
+
+&usbdrd20_phy1 {
+	status = "okay";
+};
+
+&usbdrd20_dwc3_1 {
+	dr_mode = "peripheral";
+};
+
+&usbdrd20_1 {
+	status = "okay";
+};
+
+&usbdrd20_phy2 {
+	status = "okay";
+};
+
+&usbdrd20_dwc3_2 {
+	dr_mode = "peripheral";
+};
+
+&usbdrd20_2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..b1a9d1da47f6 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,114 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usbdrd20_phy0: phy@16500000 {
+			compatible = "samsung,exynosautov920-usbdrd-phy";
+			reg = <0x16500000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd20_phy1: phy@16510000 {
+			compatible = "samsung,exynosautov920-usbdrd-phy";
+			reg = <0x16510000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd20_phy2: phy@16520000 {
+			compatible = "samsung,exynosautov920-usbdrd-phy";
+			reg = <0x16520000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd20_0: usb@16700000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16700000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd20_dwc3_0: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd20_phy0 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
+		usbdrd20_1: usb@16800000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16800000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd20_dwc3_1: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd20_phy1 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
+		usbdrd20_2: usb@16900000 {
+			compatible = "samsung,exynosautov920-dwusb3";
+			ranges = <0x0 0x16900000 0x10000>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "ref", "susp_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd20_dwc3_2: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				clocks = <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>,
+					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+				clock-names = "ref", "susp_clk";
+				interrupts = <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd20_phy2 0>;
+				phy-names = "usb2-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
 		pinctrl_hsi2: pinctrl@16c10000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16c10000 0x10000>;
-- 
2.34.1

