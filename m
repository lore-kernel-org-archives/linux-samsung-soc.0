Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC582868B0;
	Thu, 30 Oct 2025 19:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852051; cv=none; b=YMrC+7x6YrkpIav/e1UzdLk8ikkBfXM/EtxnCNM7043z3SZP+NKDgu2f7AvbE/hr3xHE4mTFY2nVo5lZWWLmrSk0faL5AnJvMjwjyGKt2Djz/6UJkJ93LIN39mdf1ZuDiWZcGwj9ooZNNZn84qMzQGheoPL2an4mY76BQPx+uxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852051; c=relaxed/simple;
	bh=8Le5undMMIXZ2z+XchUrK44jHybUGhOMO7w0eFDK2PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtUBj6Ec3ku6czFAyLWPyDCfAUzUZL3eK481HGJ20JbVFXUnsQmGkCvobPRxOCM1zGIq5BJzSVueQr6J6DKRNsEB7FYfTTkOA+ZchX4e4A1AqZwO+EjCb+uOkYswRUVfuI3w2CIytzPl4LJYrES7hMbcu7Kn5I3J4/+shbh+JEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=U0wBS5AY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="U0wBS5AY"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 356ED25C4A;
	Thu, 30 Oct 2025 20:20:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOxjjuOkuXg1; Thu, 30 Oct 2025 20:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852047; bh=8Le5undMMIXZ2z+XchUrK44jHybUGhOMO7w0eFDK2PE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=U0wBS5AYE2xtI/+slVvTPa7rjnQv1cVzlZdIWt7cSSjrm2UmzQ3ucgAjfDgNFNpDU
	 1YK3WwlkalUfoOhjZGPT6eeol3t936LTC85zsJB1tTVxhXsJ0Iu9YUs8K/7iIKIo+g
	 YW/33oUciM34E1/vMJfik3Yv05KG6+hyxTXwGfzPUibosJqRXXbHyooVEIg97hCj/V
	 E6XG0UAL1spcWPlykzl6H3tkbw/pnaFFvauVOPO4B7qeaGpiSjzWIAh0KZ7p+jl3PD
	 YX1HJZT66wx57Rb/ddLhPz4qSjExDnbC3LeDoKff41DSP2QYk9zyu4k33hq3LD9Zp5
	 j/2CR0ALxnvsg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:16 +0530
Subject: [PATCH v4 2/5] arm64: dts: exynos7870: add DSI support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-2-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=3704;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=8Le5undMMIXZ2z+XchUrK44jHybUGhOMO7w0eFDK2PE=;
 b=hDqLMiI0s1DaIIRkORJ5vOPp0OsxYNL+59Zn1xSpco2YyrlZ1/KoeZMgg4K/w89oWNLpmPfre
 Aql+70XVxphB2Pof9ASb89YcThlBNBMtzEAvQN2UfHCgzrTxFsNSZh4
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add devicetree nodes for MIPI PHYs, Samsung's DECON and DSIM blocks, and
DECON IOMMU devicetree nodes. Enables SoC support for hardware to be
able to drive a MIPI DSI display.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870.dtsi | 84 ++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index d5d347623b9038b71da55dccdc9084aeaf71618c..2827e10d69625a22328eb20183dc354c9acbfb8e 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -178,6 +178,14 @@ pmu_system_controller: system-controller@10480000 {
 				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x10480000 0x10000>;
 
+			mipi_phy: mipi-phy {
+				compatible = "samsung,exynos7870-mipi-video-phy";
+				#phy-cells = <1>;
+
+				samsung,cam0-sysreg = <&syscon_cam0>;
+				samsung,disp-sysreg = <&syscon_disp>;
+			};
+
 			reboot-mode {
 				compatible = "syscon-reboot-mode";
 				offset = <0x080c>;
@@ -675,6 +683,77 @@ cmu_isp: clock-controller@144d0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
 		};
 
+		syscon_cam0: system-controller@144f1040 {
+			compatible = "samsung,exynos7870-cam0-sysreg", "syscon";
+			reg = <0x144f1040 0x04>;
+		};
+
+		dsi: dsi@14800000 {
+			compatible = "samsung,exynos7870-mipi-dsi";
+			reg = <0x14800000 0x100>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_BUS_DISP>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_APB_DISP>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER>;
+			clock-names = "bus", "pll", "byte", "esc";
+
+			phys = <&mipi_phy 1>;
+			phy-names = "dsim";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dsi_to_decon: endpoint {
+						remote-endpoint = <&decon_to_dsi>;
+					};
+				};
+			};
+		};
+
+		decon: display-controller@14830000 {
+			compatible = "samsung,exynos7870-decon";
+			reg = <0x14830000 0x8000>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
+
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_PLL>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_ECLK>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_VCLK>;
+			clock-names = "pclk_decon0", "aclk_decon0",
+				      "decon0_eclk", "decon0_vclk";
+
+			iommus = <&sysmmu_decon>;
+
+			status = "disabled";
+
+			port {
+				decon_to_dsi: endpoint {
+					remote-endpoint = <&dsi_to_decon>;
+				};
+			};
+		};
+
+		sysmmu_decon: iommu@14860000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14860000 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>;
+			clock-names = "sysmmu";
+		};
+
 		pinctrl_dispaud: pinctrl@148c0000 {
 			compatible = "samsung,exynos7870-pinctrl";
 			reg = <0x148c0000 0x1000>;
@@ -692,6 +771,11 @@ cmu_dispaud: clock-controller@148d0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
 		};
+
+		syscon_disp: system-controller@148f100c {
+			compatible = "samsung,exynos7870-disp-sysreg", "syscon";
+			reg = <0x148f100c 0x04>;
+		};
 	};
 
 	timer {

-- 
2.51.0

