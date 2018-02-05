From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: exynos: Add soc node to exynos4412
Date: Mon, 05 Feb 2018 12:25:36 +0100
Message-ID: <1517829936-26311-4-git-send-email-m.purski@samsung.com>
References: <1517829936-26311-1-git-send-email-m.purski@samsung.com>
        <CGME20180205112604eucas1p1a515fa6be4ba3149a036830920b51e9b@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1517829936-26311-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Soc nodes are used in other exynos DTS. Exynos4 boards should use them
as well.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412.dtsi | 954 +++++++++++++++++++-------------------
 1 file changed, 479 insertions(+), 475 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index a6f3f59..22873a1 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -69,487 +69,491 @@
 		};
 	};
 
-	cpu0_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-			opp-microvolt = <900000>;
-			clock-latency-ns = <200000>;
-		};
-		opp-300000000 {
-			opp-hz = /bits/ 64 <300000000>;
-			opp-microvolt = <900000>;
-			clock-latency-ns = <200000>;
-		};
-		opp-400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <925000>;
-			clock-latency-ns = <200000>;
-		};
-		opp-500000000 {
-			opp-hz = /bits/ 64 <500000000>;
-			opp-microvolt = <950000>;
-			clock-latency-ns = <200000>;
-		};
-		opp-600000000 {
-			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <975000>;
-			clock-latency-ns = <200000>;
-		};
-		opp-700000000 {
-			opp-hz = /bits/ 64 <700000000>;
-			opp-microvolt = <987500>;
-			clock-latency-ns = <200000>;
-		};
-		opp-800000000 {
-			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <1000000>;
-			clock-latency-ns = <200000>;
-			opp-suspend;
-		};
-		opp-900000000 {
-			opp-hz = /bits/ 64 <900000000>;
-			opp-microvolt = <1037500>;
-			clock-latency-ns = <200000>;
-		};
-		opp-1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <1087500>;
-			clock-latency-ns = <200000>;
-		};
-		opp-1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1137500>;
-			clock-latency-ns = <200000>;
-		};
-		opp-1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1187500>;
-			clock-latency-ns = <200000>;
-		};
-		opp-1300000000 {
-			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1250000>;
-			clock-latency-ns = <200000>;
-		};
-		opp-1400000000 {
-			opp-hz = /bits/ 64 <1400000000>;
-			opp-microvolt = <1287500>;
-			clock-latency-ns = <200000>;
-		};
-		cpu0_opp_1500: opp-1500000000 {
-			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <1350000>;
-			clock-latency-ns = <200000>;
-			turbo-mode;
-		};
-	};
-
-	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,exynos4x12-pinctrl";
-		reg = <0x11400000 0x1000>;
-		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	pinctrl_1: pinctrl@11000000 {
-		compatible = "samsung,exynos4x12-pinctrl";
-		reg = <0x11000000 0x1000>;
-		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-
-		wakup_eint: wakeup-interrupt-controller {
-			compatible = "samsung,exynos4210-wakeup-eint";
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
-
-	pinctrl_2: pinctrl@3860000 {
-		compatible = "samsung,exynos4x12-pinctrl";
-		reg = <0x03860000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <10 0>;
-	};
-
-	pinctrl_3: pinctrl@106e0000 {
-		compatible = "samsung,exynos4x12-pinctrl";
-		reg = <0x106E0000 0x1000>;
-		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	sysram@2020000 {
-		compatible = "mmio-sram";
-		reg = <0x02020000 0x40000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x02020000 0x40000>;
-
-		smp-sysram@0 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x0 0x1000>;
-		};
-
-		smp-sysram@2f000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x2f000 0x1000>;
-		};
-	};
-
-	pd_isp: isp-power-domain@10023ca0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10023CA0 0x20>;
-		#power-domain-cells = <0>;
-		label = "ISP";
-	};
-
-	l2c: l2-cache-controller@10502000 {
-		compatible = "arm,pl310-cache";
-		reg = <0x10502000 0x1000>;
-		cache-unified;
-		cache-level = <2>;
-		arm,tag-latency = <2 2 1>;
-		arm,data-latency = <3 2 1>;
-		arm,double-linefill = <1>;
-		arm,double-linefill-incr = <0>;
-		arm,double-linefill-wrap = <1>;
-		arm,prefetch-drop = <1>;
-		arm,prefetch-offset = <7>;
-	};
-
-	clock: clock-controller@10030000 {
-		compatible = "samsung,exynos4412-clock";
-		reg = <0x10030000 0x18000>;
-		#clock-cells = <1>;
-	};
-
-	isp_clock: clock-controller@10048000 {
-		compatible = "samsung,exynos4412-isp-clock";
-		reg = <0x10048000 0x1000>;
-		#clock-cells = <1>;
-		power-domains = <&pd_isp>;
-		clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
-		clock-names = "aclk200", "aclk400_mcuisp";
-	};
-
-	mct@10050000 {
-		compatible = "samsung,exynos4412-mct";
-		reg = <0x10050000 0x800>;
-		interrupt-parent = <&mct_map>;
-		interrupts = <0>, <1>, <2>, <3>, <4>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
-		clock-names = "fin_pll", "mct";
-
-		mct_map: mct-map {
-			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
+	soc: soc {
+		cpu0_opp_table: opp_table0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+				opp-microvolt = <900000>;
+				clock-latency-ns = <200000>;
+			};
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				opp-microvolt = <900000>;
+				clock-latency-ns = <200000>;
+			};
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+				opp-microvolt = <925000>;
+				clock-latency-ns = <200000>;
+			};
+			opp-500000000 {
+				opp-hz = /bits/ 64 <500000000>;
+				opp-microvolt = <950000>;
+				clock-latency-ns = <200000>;
+			};
+			opp-600000000 {
+				opp-hz = /bits/ 64 <600000000>;
+				opp-microvolt = <975000>;
+				clock-latency-ns = <200000>;
+			};
+			opp-700000000 {
+				opp-hz = /bits/ 64 <700000000>;
+				opp-microvolt = <987500>;
+				clock-latency-ns = <200000>;
+			};
+			opp-800000000 {
+				opp-hz = /bits/ 64 <800000000>;
+				opp-microvolt = <1000000>;
+				clock-latency-ns = <200000>;
+				opp-suspend;
+			};
+			opp-900000000 {
+				opp-hz = /bits/ 64 <900000000>;
+				opp-microvolt = <1037500>;
+				clock-latency-ns = <200000>;
+			};
+			opp-1000000000 {
+				opp-hz = /bits/ 64 <1000000000>;
+				opp-microvolt = <1087500>;
+				clock-latency-ns = <200000>;
+			};
+			opp-1100000000 {
+				opp-hz = /bits/ 64 <1100000000>;
+				opp-microvolt = <1137500>;
+				clock-latency-ns = <200000>;
+			};
+			opp-1200000000 {
+				opp-hz = /bits/ 64 <1200000000>;
+				opp-microvolt = <1187500>;
+				clock-latency-ns = <200000>;
+			};
+			opp-1300000000 {
+				opp-hz = /bits/ 64 <1300000000>;
+				opp-microvolt = <1250000>;
+				clock-latency-ns = <200000>;
+			};
+			opp-1400000000 {
+				opp-hz = /bits/ 64 <1400000000>;
+				opp-microvolt = <1287500>;
+				clock-latency-ns = <200000>;
+			};
+			cpu0_opp_1500: opp-1500000000 {
+				opp-hz = /bits/ 64 <1500000000>;
+				opp-microvolt = <1350000>;
+				clock-latency-ns = <200000>;
+				turbo-mode;
+			};
+		};
+
+		pinctrl_0: pinctrl@11400000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x11400000 0x1000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_1: pinctrl@11000000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x11000000 0x1000>;
+			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+
+			wakup_eint: wakeup-interrupt-controller {
+				compatible = "samsung,exynos4210-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		pinctrl_2: pinctrl@3860000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x03860000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <10 0>;
+		};
+
+		pinctrl_3: pinctrl@106e0000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x106E0000 0x1000>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		sysram@2020000 {
+			compatible = "mmio-sram";
+			reg = <0x02020000 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x02020000 0x40000>;
+
+			smp-sysram@0 {
+				compatible = "samsung,exynos4210-sysram";
+				reg = <0x0 0x1000>;
+			};
+
+			smp-sysram@2f000 {
+				compatible = "samsung,exynos4210-sysram-ns";
+				reg = <0x2f000 0x1000>;
+			};
+		};
+
+		pd_isp: isp-power-domain@10023ca0 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10023CA0 0x20>;
+			#power-domain-cells = <0>;
+			label = "ISP";
+		};
+
+		l2c: l2-cache-controller@10502000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x10502000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			arm,tag-latency = <2 2 1>;
+			arm,data-latency = <3 2 1>;
+			arm,double-linefill = <1>;
+			arm,double-linefill-incr = <0>;
+			arm,double-linefill-wrap = <1>;
+			arm,prefetch-drop = <1>;
+			arm,prefetch-offset = <7>;
+		};
+
+		clock: clock-controller@10030000 {
+			compatible = "samsung,exynos4412-clock";
+			reg = <0x10030000 0x18000>;
+			#clock-cells = <1>;
+		};
+
+		isp_clock: clock-controller@10048000 {
+			compatible = "samsung,exynos4412-isp-clock";
+			reg = <0x10048000 0x1000>;
+			#clock-cells = <1>;
+			power-domains = <&pd_isp>;
+			clocks = <&clock CLK_ACLK200>,
+				 <&clock CLK_ACLK400_MCUISP>;
+			clock-names = "aclk200", "aclk400_mcuisp";
+		};
+
+		mct@10050000 {
+			compatible = "samsung,exynos4412-mct";
+			reg = <0x10050000 0x800>;
+			interrupt-parent = <&mct_map>;
+			interrupts = <0>, <1>, <2>, <3>, <4>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
+			clock-names = "fin_pll", "mct";
+
+			mct_map: mct-map {
+				#interrupt-cells = <1>;
+				#address-cells = <0>;
+				#size-cells = <0>;
+				interrupt-map =
+					<0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
 					<1 &combiner 12 5>,
 					<2 &combiner 12 6>,
 					<3 &combiner 12 7>,
 					<4 &gic 1 12 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		watchdog: watchdog@10060000 {
+			compatible = "samsung,exynos5250-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_WDT>;
+			clock-names = "watchdog";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+		};
+
+		adc: adc@126c0000 {
+			compatible = "samsung,exynos-adc-v1";
+			reg = <0x126C0000 0x100>;
+			interrupt-parent = <&combiner>;
+			interrupts = <10 3>;
+			clocks = <&clock CLK_TSADC>;
+			clock-names = "adc";
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			status = "disabled";
+		};
+
+		g2d: g2d@10800000 {
+			compatible = "samsung,exynos4212-g2d";
+			reg = <0x10800000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
+			clock-names = "sclk_fimg2d", "fimg2d";
+			iommus = <&sysmmu_g2d>;
+		};
+
+		mshc_0: mmc@12550000 {
+			compatible = "samsung,exynos4412-dw-mshc";
+			reg = <0x12550000 0x1000>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			fifo-depth = <0x80>;
+			clocks = <&clock CLK_SDMMC4>, <&clock CLK_SCLK_MMC4>;
+			clock-names = "biu", "ciu";
+			status = "disabled";
+		};
+
+		sysmmu_g2d: sysmmu@10A40000{
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x10A40000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <4 7>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_fimc_isp: sysmmu@12260000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x12260000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <16 2>;
+			power-domains = <&pd_isp>;
+			clock-names = "sysmmu";
+			clocks = <&isp_clock CLK_ISP_SMMU_ISP>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_fimc_drc: sysmmu@12270000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x12270000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <16 3>;
+			power-domains = <&pd_isp>;
+			clock-names = "sysmmu";
+			clocks = <&isp_clock CLK_ISP_SMMU_DRC>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_fimc_fd: sysmmu@122a0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x122A0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <16 4>;
+			power-domains = <&pd_isp>;
+			clock-names = "sysmmu";
+			clocks = <&isp_clock CLK_ISP_SMMU_FD>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_fimc_mcuctl: sysmmu@122b0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x122B0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <16 5>;
+			power-domains = <&pd_isp>;
+			clock-names = "sysmmu";
+			clocks = <&isp_clock CLK_ISP_SMMU_ISPCX>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_fimc_lite0: sysmmu@123b0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x123B0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <16 0>;
+			power-domains = <&pd_isp>;
+			clock-names = "sysmmu", "master";
+			clocks = <&isp_clock CLK_ISP_SMMU_LITE0>,
+				 <&isp_clock CLK_ISP_FIMC_LITE0>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_fimc_lite1: sysmmu@123c0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x123C0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <16 1>;
+			power-domains = <&pd_isp>;
+			clock-names = "sysmmu", "master";
+			clocks = <&isp_clock CLK_ISP_SMMU_LITE1>,
+				 <&isp_clock CLK_ISP_FIMC_LITE1>;
+			#iommu-cells = <0>;
+		};
+
+		bus_dmc: bus_dmc {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_DMC>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_dmc_opp_table>;
+			status = "disabled";
+		};
+
+		bus_acp: bus_acp {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_ACP>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_acp_opp_table>;
+			status = "disabled";
+		};
+
+		bus_c2c: bus_c2c {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_C2C>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_dmc_opp_table>;
+			status = "disabled";
+		};
+
+		bus_dmc_opp_table: opp_table1 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				opp-microvolt = <900000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+				opp-microvolt = <900000>;
+			};
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+				opp-microvolt = <900000>;
+			};
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+				opp-microvolt = <950000>;
+			};
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+				opp-microvolt = <1050000>;
+			};
+		};
+
+		bus_acp_opp_table: opp_table2 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+			};
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+			};
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+			};
+		};
+
+		bus_leftbus: bus_leftbus {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_GDL>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_leftbus_opp_table>;
+			status = "disabled";
+		};
+
+		bus_rightbus: bus_rightbus {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_GDR>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_leftbus_opp_table>;
+			status = "disabled";
+		};
+
+		bus_display: bus_display {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_ACLK160>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_display_opp_table>;
+			status = "disabled";
+		};
+
+		bus_fsys: bus_fsys {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_ACLK133>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_fsys_opp_table>;
+			status = "disabled";
+		};
+
+		bus_peri: bus_peri {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_ACLK100>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_peri_opp_table>;
+			status = "disabled";
+		};
+
+		bus_mfc: bus_mfc {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_SCLK_MFC>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_leftbus_opp_table>;
+			status = "disabled";
+		};
+
+		bus_leftbus_opp_table: opp_table3 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				opp-microvolt = <900000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+				opp-microvolt = <925000>;
+			};
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+				opp-microvolt = <950000>;
+			};
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+				opp-microvolt = <1000000>;
+			};
+		};
+
+		bus_display_opp_table: opp_table4 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+			};
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+			};
+		};
+
+		bus_fsys_opp_table: opp_table5 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+			};
+		};
+
+		bus_peri_opp_table: opp_table6 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-50000000 {
+				opp-hz = /bits/ 64 <50000000>;
+			};
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+		};
+
+		pmu {
+			interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
 		};
 	};
-
-	watchdog: watchdog@10060000 {
-		compatible = "samsung,exynos5250-wdt";
-		reg = <0x10060000 0x100>;
-		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_WDT>;
-		clock-names = "watchdog";
-		samsung,syscon-phandle = <&pmu_system_controller>;
-	};
-
-	adc: adc@126c0000 {
-		compatible = "samsung,exynos-adc-v1";
-		reg = <0x126C0000 0x100>;
-		interrupt-parent = <&combiner>;
-		interrupts = <10 3>;
-		clocks = <&clock CLK_TSADC>;
-		clock-names = "adc";
-		#io-channel-cells = <1>;
-		io-channel-ranges;
-		samsung,syscon-phandle = <&pmu_system_controller>;
-		status = "disabled";
-	};
-
-	g2d: g2d@10800000 {
-		compatible = "samsung,exynos4212-g2d";
-		reg = <0x10800000 0x1000>;
-		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
-		clock-names = "sclk_fimg2d", "fimg2d";
-		iommus = <&sysmmu_g2d>;
-	};
-
-	mshc_0: mmc@12550000 {
-		compatible = "samsung,exynos4412-dw-mshc";
-		reg = <0x12550000 0x1000>;
-		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		fifo-depth = <0x80>;
-		clocks = <&clock CLK_SDMMC4>, <&clock CLK_SCLK_MMC4>;
-		clock-names = "biu", "ciu";
-		status = "disabled";
-	};
-
-	sysmmu_g2d: sysmmu@10A40000{
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x10A40000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <4 7>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_isp: sysmmu@12260000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x12260000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 2>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&isp_clock CLK_ISP_SMMU_ISP>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_drc: sysmmu@12270000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x12270000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 3>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&isp_clock CLK_ISP_SMMU_DRC>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_fd: sysmmu@122a0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x122A0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 4>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&isp_clock CLK_ISP_SMMU_FD>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_mcuctl: sysmmu@122b0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x122B0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 5>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu";
-		clocks = <&isp_clock CLK_ISP_SMMU_ISPCX>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_lite0: sysmmu@123b0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x123B0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 0>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu", "master";
-		clocks = <&isp_clock CLK_ISP_SMMU_LITE0>,
-			 <&isp_clock CLK_ISP_FIMC_LITE0>;
-		#iommu-cells = <0>;
-	};
-
-	sysmmu_fimc_lite1: sysmmu@123c0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x123C0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <16 1>;
-		power-domains = <&pd_isp>;
-		clock-names = "sysmmu", "master";
-		clocks = <&isp_clock CLK_ISP_SMMU_LITE1>,
-			 <&isp_clock CLK_ISP_FIMC_LITE1>;
-		#iommu-cells = <0>;
-	};
-
-	bus_dmc: bus_dmc {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_DMC>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_dmc_opp_table>;
-		status = "disabled";
-	};
-
-	bus_acp: bus_acp {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_ACP>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_acp_opp_table>;
-		status = "disabled";
-	};
-
-	bus_c2c: bus_c2c {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_C2C>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_dmc_opp_table>;
-		status = "disabled";
-	};
-
-	bus_dmc_opp_table: opp_table1 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <900000>;
-		};
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-			opp-microvolt = <900000>;
-		};
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-			opp-microvolt = <900000>;
-		};
-		opp-267000000 {
-			opp-hz = /bits/ 64 <267000000>;
-			opp-microvolt = <950000>;
-		};
-		opp-400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <1050000>;
-		};
-	};
-
-	bus_acp_opp_table: opp_table2 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-		};
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-		};
-		opp-267000000 {
-			opp-hz = /bits/ 64 <267000000>;
-		};
-	};
-
-	bus_leftbus: bus_leftbus {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_GDL>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
-
-	bus_rightbus: bus_rightbus {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_GDR>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
-
-	bus_display: bus_display {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK160>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_display_opp_table>;
-		status = "disabled";
-	};
-
-	bus_fsys: bus_fsys {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK133>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_fsys_opp_table>;
-		status = "disabled";
-	};
-
-	bus_peri: bus_peri {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK100>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_peri_opp_table>;
-		status = "disabled";
-	};
-
-	bus_mfc: bus_mfc {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_SCLK_MFC>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
-
-	bus_leftbus_opp_table: opp_table3 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-			opp-microvolt = <900000>;
-		};
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-			opp-microvolt = <925000>;
-		};
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-			opp-microvolt = <950000>;
-		};
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-			opp-microvolt = <1000000>;
-		};
-	};
-
-	bus_display_opp_table: opp_table4 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-		};
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
-		};
-	};
-
-	bus_fsys_opp_table: opp_table5 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-		};
-	};
-
-	bus_peri_opp_table: opp_table6 {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-50000000 {
-			opp-hz = /bits/ 64 <50000000>;
-		};
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-	};
-
-	pmu {
-		interrupts = <2 2>, <3 2>, <18 2>, <19 2>;
-	};
 };
 
 &combiner {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
