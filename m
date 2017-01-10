From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 1/3] arm64: dts: exynos5433: add DECON_TV node
Date: Tue, 10 Jan 2017 09:24:22 +0100
Message-ID: <1484036664-15951-1-git-send-email-a.hajda@samsung.com>
References: <CGME20170110082433eucas1p2f7cb7b0974987e2c8294509960468fd3@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
or 2nd DSI path.

Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Tested-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

Hi Krzysztof,

These patches are based on latest patches separating tm2 and tm2e and
touchscreen patches. I hope this is good base.
Thanks all for quick response/review.

Regards
Andrzej

v2:
  - replaced magic numbers with macros,
  - removed power domains,
  - removed 0x prefixes from node names

v3:
  - order nodes by address
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 68f764e..8865fae 100644
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
 		sysmmu_gscl0: sysmmu@0x13C80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x13C80000 0x1000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
