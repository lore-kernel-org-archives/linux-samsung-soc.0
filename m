From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 1/3] arm64: dts: exynos: add DECON_TV node
Date: Wed, 11 Jan 2017 09:31:38 +0100
Message-ID: <1484123500-20488-1-git-send-email-a.hajda@samsung.com>
References: <20170110190916.k3tek4zuvhggbuc6@kozik-lap>
 <CGME20170111083153eucas1p2b11e7b64f976a21f59c141bf7b06fd84@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:53684 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753820AbdAKIb6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 03:31:58 -0500
In-reply-to: <20170110190916.k3tek4zuvhggbuc6@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
or 2nd DSI path.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
v4:
  - changed prefix
  - rebased on '68cb4b3 Merge branch 'next/dt64' into for-next'
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index abaf6b4..80dc0e8 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -751,6 +751,29 @@
 			};
 		};
 
+		decon_tv: decon@13880000 {
+			compatible = "samsung,exynos5433-decon-tv";
+			reg = <0x13880000 0x20b8>;
+			clocks = <&cmu_disp CLK_PCLK_DECON_TV>,
+				 <&cmu_disp CLK_ACLK_DECON_TV>,
+				 <&cmu_disp CLK_ACLK_SMMU_TV0X>,
+				 <&cmu_disp CLK_ACLK_XIU_TV0X>,
+				 <&cmu_disp CLK_PCLK_SMMU_TV0X>,
+				 <&cmu_disp CLK_SCLK_DECON_TV_VCLK>,
+				 <&cmu_disp CLK_SCLK_DECON_TV_ECLK>;
+			clock-names = "pclk", "aclk_decon", "aclk_smmu_decon0x",
+				      "aclk_xiu_decon0x", "pclk_smmu_decon0x",
+				      "sclk_decon_vclk", "sclk_decon_eclk";
+			samsung,disp-sysreg = <&syscon_disp>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			iommus = <&sysmmu_tv0x>, <&sysmmu_tv1x>;
+			iommu-names = "m0", "m1";
+		};
+
 		dsi: dsi@13900000 {
 			compatible = "samsung,exynos5433-mipi-dsi";
 			reg = <0x13900000 0xC0>;
@@ -912,6 +935,26 @@
 			#iommu-cells = <0>;
 		};
 
+		sysmmu_tv0x: sysmmu@13a20000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13a20000 0x1000>;
+			interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_disp CLK_PCLK_SMMU_TV0X>,
+				<&cmu_disp CLK_ACLK_SMMU_TV0X>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_tv1x: sysmmu@13a30000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13a30000 0x1000>;
+			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_disp CLK_PCLK_SMMU_TV1X>,
+				<&cmu_disp CLK_ACLK_SMMU_TV1X>;
+			#iommu-cells = <0>;
+		};
+
 		sysmmu_gscl0: sysmmu@13c80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13C80000 0x1000>;
-- 
2.7.4
