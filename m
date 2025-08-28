Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E92BB13
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Aug 2025 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370390; cv=none; b=LzxnZnLLSkI8d9FxFgYZyZ8DfANB2RbyyqJIrMQXL5ZGR8Zh9uVbMp1+xfHHR4iWtOy/znKcFRcYyqF2M2pegyEmAlff+bMEt3uQ9pZSciLGLqvfSD6QZ4Qs0jD/2UcC3nebAuIkawCqllmhkoAR/pgsKNfnqdR0cv5zxG+3wlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370390; c=relaxed/simple;
	bh=RfExItHsHPu8D8FulhvugXdGpFPx7m7HpJLuoMR0nVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=eIBUMjwgZnNp7IQGOqM/RnwbKuIbdnTs4UEBrgrL3Z2kJl5BcsHbYEOJ7X9MvIzH0cefvMu4qCaxVuj+NZQwcKg/YR5/XmrqBsN+OD/PxQfUxRxGVSsUUYitcgesdzQ5cFZyOcQXF/dKF4dEwjfT71Iql8tBBm4B0MzRTdnISo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OD0KBnfJ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OD0KBnfJ"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250828083938epoutp036ce9834a14499440745010e9769d36ad~f4Y27TDR41507015070epoutp03m
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Aug 2025 08:39:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250828083938epoutp036ce9834a14499440745010e9769d36ad~f4Y27TDR41507015070epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756370378;
	bh=pImoRDS3pa3G80rNm7NY0vzMH0ovbewcwmQ3GzyNIJk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OD0KBnfJWEdjon3M/fuPM/DdXCaJ/RsSb56XaTzJL6qJOINn+DfQ31sAa1LY9ce9V
	 O7pdBh4bzTwUzbqL+v3K89E6TnR7vyroGeyakjhUWv0JjyCbEFnTtK6uCHQoCCFWRv
	 yb6vQh2YG+4VeEAytQXgL2s6OmIXaM9/cbO7BhNs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250828083937epcas5p2cfdc1ab63546f02b4b6ae3fe2022af4f~f4Y2WLuWH0455804558epcas5p2L;
	Thu, 28 Aug 2025 08:39:37 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cCFFN6t6Qz6B9mC; Thu, 28 Aug
	2025 08:39:36 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896~f4Y0o3laA0819308193epcas5p3p;
	Thu, 28 Aug 2025 08:39:36 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250828083934epsmtip1b1a947a422fa0d8fe1705a2a1c1dfec6~f4YzAy47L3118031180epsmtip1q;
	Thu, 28 Aug 2025 08:39:34 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: alim.akhtar@samsung.com, linux-fsd@tesla.com, krzk@kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com, shradha.t@samsung.com,
	Inbaraj E <inbaraj.e@samsung.com>
Subject: [v3] arm64: dts: fsd: Add CSIS nodes
Date: Thu, 28 Aug 2025 14:09:26 +0530
Message-ID: <20250828083926.16849-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896
References: <CGME20250828083936epcas5p3d2e5ec402bd00dae08c11d8cc7246896@epcas5p3.samsung.com>

The Tesla FSD SoC CSIS IP bundles MIPI CSI-2 link controller and video
capture interface. Add nodes describing the MIPI CSI-2 link controller
and video capture interface.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---

Changes since v2:
- Changed generic node name
- Fixed node ordering

Here is patch link for v2:
https://lore.kernel.org/linux-media/20250814140943.22531-1-inbaraj.e@samsung.com/

This patch is dependent on below patchset
https://lore.kernel.org/linux-media/20250822002734.23516-1-laurent.pinchart@ideasonboard.com/T/#t

 arch/arm64/boot/dts/tesla/fsd.dtsi | 540 +++++++++++++++++++++++++++++
 1 file changed, 540 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index a5ebb3f9b18f..22afcf5a5dda 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -485,6 +485,546 @@ sysreg_cam: system-controller@12630000 {
 			reg = <0x0 0x12630000 0x0 0x500>;
 		};
 
+		mipicsi0: csi@12640000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12640000 0x0 0x124>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_0_out: endpoint {
+						remote-endpoint = <&csis_in_0>;
+					};
+				};
+			};
+		};
+
+		csis0: csis@12641000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12641000 0x0 0x44c>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_0: endpoint {
+					remote-endpoint = <&mipi_csis_0_out>;
+				};
+			};
+		};
+
+		mipicsi1: csi@12650000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12650000 0x0 0x124>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_1_out: endpoint {
+						remote-endpoint = <&csis_in_1>;
+					};
+				};
+			};
+		};
+
+		csis1: csis@12651000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12651000 0x0 0x44c>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_1: endpoint {
+					remote-endpoint = <&mipi_csis_1_out>;
+				};
+			};
+		};
+
+		mipicsi2: csi@12660000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12660000 0x0 0x124>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_2_out: endpoint {
+						remote-endpoint = <&csis_in_2>;
+					};
+				};
+			};
+		};
+
+		csis2: csis@12661000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12661000 0x0 0x44c>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_2: endpoint {
+					remote-endpoint = <&mipi_csis_2_out>;
+				};
+			};
+		};
+
+		mipicsi3: csi@12670000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12670000 0x0 0x124>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_3_out: endpoint {
+						remote-endpoint = <&csis_in_3>;
+					};
+				};
+			};
+		};
+
+		csis3: csis@12671000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12671000 0x0 0x44c>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI0_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI0_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_3: endpoint {
+					remote-endpoint = <&mipi_csis_3_out>;
+				};
+			};
+		};
+
+		mipicsi4: csi@12680000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12680000 0x0 0x124>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_4_out: endpoint {
+						remote-endpoint = <&csis_in_4>;
+					};
+				};
+			};
+		};
+
+		csis4: csis@12681000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12681000 0x0 0x44c>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_4: endpoint {
+					remote-endpoint = <&mipi_csis_4_out>;
+				};
+			};
+		};
+
+		mipicsi5: csi@12690000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x12690000 0x0 0x124>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_5_out: endpoint {
+						remote-endpoint = <&csis_in_5>;
+					};
+				};
+			};
+		};
+
+		csis5: csis@12691000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x12691000 0x0 0x44c>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_5: endpoint {
+					remote-endpoint = <&mipi_csis_5_out>;
+				};
+			};
+		};
+
+		mipicsi6: csi@126a0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126a0000 0x0 0x124>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_6_out: endpoint {
+						remote-endpoint = <&csis_in_6>;
+					};
+				};
+			};
+		};
+
+		csis6: csis@126a1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126a1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_6: endpoint {
+					remote-endpoint = <&mipi_csis_6_out>;
+				};
+			};
+		};
+
+		mipicsi7: csi@126b0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126b0000 0x0 0x124>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_7_out: endpoint {
+						remote-endpoint = <&csis_in_7>;
+					};
+				};
+			};
+		};
+
+		csis7: csis@126b1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126b1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI1_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI1_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_7: endpoint {
+					remote-endpoint = <&mipi_csis_7_out>;
+				};
+			};
+		};
+
+		mipicsi8: csi@126c0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126c0000 0x0 0x124>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_0_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_8_out: endpoint {
+						remote-endpoint = <&csis_in_8>;
+					};
+				};
+			};
+		};
+
+		csis8: csis@126c1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126c1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_0_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_0_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_8: endpoint {
+					remote-endpoint = <&mipi_csis_8_out>;
+				};
+			};
+		};
+
+		mipicsi9: csi@126d0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126d0000 0x0 0x124>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_1_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_9_out: endpoint {
+						remote-endpoint = <&csis_in_9>;
+					};
+				};
+			};
+		};
+
+		csis9: csis@126d1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126d1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_1_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_1_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_9: endpoint {
+					remote-endpoint = <&mipi_csis_9_out>;
+				};
+			};
+		};
+
+		mipicsi10: csi@126e0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126e0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_2_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_10_out: endpoint {
+						remote-endpoint = <&csis_in_10>;
+					};
+				};
+			};
+		};
+
+		csis10: csis@126e1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126e1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_2_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_2_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_10: endpoint {
+					remote-endpoint = <&mipi_csis_10_out>;
+				};
+			};
+		};
+
+		mipicsi11: csi@126f0000 {
+			compatible = "tesla,fsd-mipi-csi2";
+			reg = <0x0 0x126f0000 0x0 0x124>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_3_IPCLKPORT_I_PCLK>;
+			clock-names = "aclk", "pclk";
+			tesla,syscon-csis = <&sysreg_cam 0x40c>;
+			fsl,num-channels = <4>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mipi_csis_11_out: endpoint {
+						remote-endpoint = <&csis_in_11>;
+					};
+				};
+			};
+		};
+
+		csis11: csis@126f1000 {
+			compatible = "tesla,fsd-csis-media";
+			reg = <0x0 0x126f1000 0x0 0x44c>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock_csi CAM_CSI2_3_IPCLKPORT_I_ACLK>,
+				<&clock_csi CAM_CSI2_3_IPCLKPORT_I_PCLK>,
+				<&clock_csi CAM_CSI_PLL>;
+			clock-names = "aclk", "pclk", "pll";
+			iommus = <&smmu_isp 0x0 0x0>;
+
+			port {
+				csis_in_11: endpoint {
+					remote-endpoint = <&mipi_csis_11_out>;
+				};
+			};
+		};
+
 		clock_mfc: clock-controller@12810000 {
 			compatible = "tesla,fsd-clock-mfc";
 			reg = <0x0 0x12810000 0x0 0x3000>;
-- 
2.49.0

