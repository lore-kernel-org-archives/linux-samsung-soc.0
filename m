Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC4D3B52F6
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086300; cv=none; b=g3u+3N9A1o9bxFEKOLUIsYsKEiY6yyhpTp+0uVBQEo2cwMidFQwwT0NrAetG8JizBa1V7P3pF8bnyf7v/0jVF53cLJhaQtNV6FklNba0tA0K3vSZUTQLlZVWZYvk6uMXGradtN7IQ8gMD46UfCq/RL1UwYuubAb+YxanfchcPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086300; c=relaxed/simple;
	bh=xz2EPHBWVJdezG347TZCIbfjnTVUV9iyVSI7gh0Gtlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=V5DQUkaCoaytxRmUitFJX31orWQyAVucFlU38oiQqiuv9TtxlY1sOmNt9gvZd8dQ3FYzc67r6HwSy6M7loP/KeYZ5tIU++qB8GAmjEp0ro3A31VsxqKb4aIsebKIOE8HyMcPynvhPovFx5x/drb+On5G5/PG2gXXxpTbICn9mGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fJrTo6wf; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fJrTo6wf"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260122125134epoutp0345576fd8dc86af90867cf0a721cc34e6~NDpyxrXCe1177411774epoutp03u
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260122125134epoutp0345576fd8dc86af90867cf0a721cc34e6~NDpyxrXCe1177411774epoutp03u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086294;
	bh=AoUG/T5AIUKvYaQRsMkuZD7Lh5kCOolnvexdKu1KO+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fJrTo6wfBsSAvzr2dox8IdeR3KEukgDcZWvG8kTE8R1mCKIJSmdIrbmRJEwdOkVPO
	 bluPTL0uKRd32NKOAWVP6y+SrAVtOqC4NC7gL8ClrqpMGhGZbASiHHjZoOBRqk0JsX
	 9JedPCTtxD5LZz20lkGmqn0lUHuJBuEzB2BCVF40=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260122125133epcas5p2b4ebcb632607f8555debbbfdd4e686f8~NDpyB-kCf2606226062epcas5p2B;
	Thu, 22 Jan 2026 12:51:33 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dxgtF00d2z6B9m8; Thu, 22 Jan
	2026 12:51:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260122125132epcas5p32bb4d76dc0a08851d9acb77bfb005bdc~NDpwkS2ac1556515565epcas5p3F;
	Thu, 22 Jan 2026 12:51:32 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260122125130epsmtip13f02033c5180a88f7fe2feb7788ed812~NDpuxKaiC0713007130epsmtip1S;
	Thu, 22 Jan 2026 12:51:30 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 1/3] arm64: dts: exynos: ExynosAutov920: Add USB and
 USB-phy nodes
Date: Thu, 22 Jan 2026 18:37:19 +0530
Message-Id: <20260122130721.205664-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122130721.205664-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122125132epcas5p32bb4d76dc0a08851d9acb77bfb005bdc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125132epcas5p32bb4d76dc0a08851d9acb77bfb005bdc
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
	<CGME20260122125132epcas5p32bb4d76dc0a08851d9acb77bfb005bdc@epcas5p3.samsung.com>

Add USB and USB PHY controller nodes.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 02bf2ca52fdc..843f2aec3567 100644
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

