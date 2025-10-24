Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4C274FC1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306032; cv=none; b=mDV25bXNdvOuHh/3Bh7rrk0ox9GiwKqDV2yCCQqnIzLSKrKRQrqvgZJVRN2tqfF3twp8NGp3xYiv3shycs6JQpnxRsZ4Up0TG1WM9xfNlqK32CM9uyNOuwcrQbUa9m4Ls2qJqAm+/4oDgd/vjeQSZ0FL3539SZcn+UusSOunfSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306032; c=relaxed/simple;
	bh=/RLf8GoQia0hUpjRaB25wRGC2W/MjQzvqVSG9x98e7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=oQ6y5oK+4FxAIkDOvx/EIO1L1Xz3hGh4ZpMicUQGDuBk4GiY4V1VRrVHw8rYLWbXXkTgEL4AzrcECaK77bPPFO5LP/cKJ6NZwfU0F81qyeRr6SMeY4H0utGNUxnj+OW/SnIWSPjGV7rN68xpw9z63JfRqnPjg2xr22uwJX3B0qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ab1OVI2j; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ab1OVI2j"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251024114028epoutp0106e150f450ce5bbc4650ce1188f9825d~xaoAv9ERO0449104491epoutp01i
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251024114028epoutp0106e150f450ce5bbc4650ce1188f9825d~xaoAv9ERO0449104491epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761306028;
	bh=WA0BCBPk7HH5HqiR1AivgHwvu/Th3voX8A6OI9+0rQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ab1OVI2jN6C58nqUNiKEausu5hDpJzRgZb6YO4HOpBPfFoYZzgL/PP22WfsPEQJZu
	 C+Is+zl9n2NR8HMchHiQlCAoqGomz69LZcnbt1V6jxyA+MvcStGC/I5jiFO6Z2hnSz
	 ITPqmcDWGZoU1Wga/LgX7q7TDr0h/OFWZ5+bTWlk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251024114027epcas5p38c424d3678d235b10373744c6f675797~xaoADQiVz0754707547epcas5p34;
	Fri, 24 Oct 2025 11:40:27 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ctLYk4Wscz6B9m5; Fri, 24 Oct
	2025 11:40:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251024114026epcas5p33c612c143853daccf21dd9515418df58~xan_6pS9J1719017190epcas5p3B;
	Fri, 24 Oct 2025 11:40:26 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024114018epsmtip132fe219c1549bcc3f30c15d830f6e0b8~xan4Hm06j0284302843epsmtip1W;
	Fri, 24 Oct 2025 11:40:18 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH 1/3] arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy
 nodes
Date: Fri, 24 Oct 2025 17:18:43 +0530
Message-Id: <20251024114845.2395166-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024114845.2395166-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024114026epcas5p33c612c143853daccf21dd9515418df58
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114026epcas5p33c612c143853daccf21dd9515418df58
References: <20251024114845.2395166-1-pritam.sutar@samsung.com>
	<CGME20251024114026epcas5p33c612c143853daccf21dd9515418df58@epcas5p3.samsung.com>

Add USB and USB PHY controller nodes.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 6ee74d260776..6ff0e00fd901 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1409,6 +1409,168 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usbdrd31_ssphy: phy@16480000 {
+			compatible = "samsung,exynosautov920-usb31drd-combo-ssphy";
+			reg = <0x16480000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		usbdrd31_hsphy: phy@16490000 {
+			compatible = "samsung,exynosautov920-usbdrd-combo-hsphy";
+			reg = <0x16490000 0x0200>;
+			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
+				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
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
+		/* This usb port supports usb31 and usb20 speeds */
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
+				phys = <&usbdrd31_hsphy 0>, <&usbdrd31_ssphy 0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
+		/* This usb port supports only usb20 speeds */
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
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
+
+		/* This usb port supports only usb20 speeds */
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
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
+
+		/* This usb port supports only usb20 speeds */
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
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
+
 		cmu_hsi2: clock-controller@16b00000 {
 			compatible = "samsung,exynosautov920-cmu-hsi2";
 			reg = <0x16b00000 0x8000>;
-- 
2.34.1

