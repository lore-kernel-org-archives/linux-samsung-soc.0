Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F92BF3DF;
	Thu, 12 Jun 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741859; cv=none; b=qNj+t7HiN+53VF+h1FPykeAdi8yc/hSoFEWFyIOZvxSQsivsdYCS9moFCMx0AQYQqjPxg75C2mMOYeA7C5CNzox9dxIHuoRZl7ZtYEruzuyOALcr6Gak8Dp1WmwDECmc3wSQE6ygOhMs2znTfY+mCcW4Vo3CipSB3qraYOn0VtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741859; c=relaxed/simple;
	bh=0tk46VOA66/3d6qEQYb+l0xO5AU5QMnPGgQyQYlF/vI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cm6NUTxFsVDhGmLyUXbfbBYRXf953BzRxw0w0pwnVZ7sqiMP00GRVDFQIPblNspY4rbENydvfRYbVq8d4MNiq8Fnqs0eWVjdZW9CXkXqIuE1+wv3IbzKXVbMlnIZNYeP1y2RcfKpnKuTLkKJ7wJjkh/kigaz8pVr4nYyxE4AS7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=c9oYCxm6; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="c9oYCxm6"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2ACBD25F65;
	Thu, 12 Jun 2025 17:24:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_qGc3chGkXr; Thu, 12 Jun 2025 17:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741854; bh=0tk46VOA66/3d6qEQYb+l0xO5AU5QMnPGgQyQYlF/vI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c9oYCxm6GzAKVUh3/hD8mUU1mPHM0GoTYBTH4HmJAG7VE7B9Y99P7sCDQ4qv2mpXx
	 I8J/8GjyUnSo/k7MtjpC7x8kTvlmsv9KK2FS3Zfkm1V513+FM9Z8Dqcd6HuZYqjovy
	 HhUzgxCBWHXOWpeue2JxAs4RM/zZAOJjI1TAty5yy1O5Q9Hn7FfqZMu7zzwS11l+x1
	 zdGcqg4Qu8fo+qUGXVr32YjbQ7AkCqr5qLgNRfZmufgvdYg81M89Ba/m8LdV1vNDKA
	 TTBX7bPAAXw25uss6vAddZLSB+sqGRZtUM3K8zf8JsgUIsJsC6LZxbE7o5Aq+O1E28
	 YDng7IvzQtrVQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:38 +0530
Subject: [PATCH 2/5] arch: arm64: dts: exynos7870: add DSI support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-2-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=3928;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=0tk46VOA66/3d6qEQYb+l0xO5AU5QMnPGgQyQYlF/vI=;
 b=oRITryE5Tj7D7uu58NlAzssxkZrSPl/+hx5ra3b5dMF7+F3JnWCYOkPxa54i02PCt9JRSE27b
 y2zBSY2wNGzAq1n4fhKlvF/f6nv1dv+t+9cUZNwVyvfGEOEVKeBGJr2
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add devicetree nodes for MIPI PHYs, Samsung's DECON and DSIM blocks, and
DECON IOMMU devicetree nodes. Enables SoC support for hardware to be
able to drive a MIPI DSI display.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870.dtsi | 94 ++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index 5cba8c9bb403405b2d9721ab8cf9d61e3d5faf95..fac92081fef389fe6084db3043614f0b276d0f19 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -178,6 +178,14 @@ pmu_system_controller: system-controller@10480000 {
 				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x10480000 0x10000>;
 
+			mipi_phy: mipi-phy {
+				compatible = "samsung,exynos7870-mipi-video-phy";
+				#phy-cells = <1>;
+
+				samsung,disp-sysreg = <&syscon_disp>;
+				samsung,cam-sysreg = <&syscon_cam>;
+			};
+
 			reboot-mode {
 				compatible = "syscon-reboot-mode";
 				offset = <0x080c>;
@@ -674,6 +682,86 @@ cmu_isp: clock-controller@144d0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
 		};
 
+		syscon_cam: syscon@144f1040 {
+			compatible = "samsung,exynos7870-cam-sysreg",
+				     "samsung,exynos7870-sysreg", "syscon";
+			reg = <0x144f1040 0x04>;
+		};
+
+		dsi: dsi@14800000 {
+			compatible = "samsung,exynos7870-mipi-dsi";
+			reg = <0x14800000 0x100>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+
+			clock-names = "bus_clk", "sclk_mipi",
+				      "phyclk_mipidphy0_rxclkesc0",
+				      "phyclk_mipidphy0_bitclkdiv8";
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_BUS_DISP>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_APB_DISP>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER>;
+
+			phy-names = "dsim";
+			phys = <&mipi_phy 1>;
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
+		decon: decon@14830000 {
+			compatible = "samsung,exynos7870-decon";
+			reg = <0x14830000 0x8000>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+
+			clock-names = "pclk_decon0", "aclk_decon0",
+				      "decon0_eclk", "decon0_vclk";
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_PLL>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_ECLK>,
+				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_VCLK>;
+
+			iommus = <&sysmmu_decon>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					decon_to_dsi: endpoint {
+						remote-endpoint = <&dsi_to_decon>;
+					};
+				};
+			};
+		};
+
+		sysmmu_decon: sysmmu@14860000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14860000 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <0>;
+
+			clock-names = "sysmmu";
+			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>;
+		};
+
 		pinctrl_dispaud: pinctrl@148c0000 {
 			compatible = "samsung,exynos7870-pinctrl";
 			reg = <0x148c0000 0x1000>;
@@ -691,6 +779,12 @@ cmu_dispaud: clock-controller@148d0000 {
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_ECLK>,
 				 <&cmu_mif CLK_GOUT_MIF_CMU_DISPAUD_DECON_VCLK>;
 		};
+
+		syscon_disp: syscon@148f100c {
+			compatible = "samsung,exynos7870-disp-sysreg",
+				     "samsung,exynos7870-sysreg", "syscon";
+			reg = <0x148f100c 0x04>;
+		};
 	};
 
 	timer {

-- 
2.49.0

