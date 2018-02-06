From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 3/3] ARM: dts: exynos: Add soc node to exynos4412
Date: Tue, 06 Feb 2018 12:29:42 +0100
Message-ID: <1517916582-13814-4-git-send-email-m.purski@samsung.com>
References: <1517916582-13814-1-git-send-email-m.purski@samsung.com>
        <CGME20180206113007eucas1p261abf16de0e52e2722441d4abb559c13@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33891 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752488AbeBFLaL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 06:30:11 -0500
In-reply-to: <1517916582-13814-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Soc nodes are used in other exynos DTS. Exynos4 boards should use them
as well.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4412.dtsi | 772 +++++++++++++++++++-------------------
 1 file changed, 389 insertions(+), 383 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index e012cda..b765c09 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -147,403 +147,409 @@
 		};
 	};
 
-	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,exynos4x12-pinctrl";
-		reg = <0x11400000 0x1000>;
-		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-	};
 
-	pinctrl_1: pinctrl@11000000 {
-		compatible = "samsung,exynos4x12-pinctrl";
-		reg = <0x11000000 0x1000>;
-		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+	soc: soc {
 
-		wakup_eint: wakeup-interrupt-controller {
-			compatible = "samsung,exynos4210-wakeup-eint";
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl_0: pinctrl@11400000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x11400000 0x1000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 		};
-	};
 
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
+		pinctrl_1: pinctrl@11000000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x11000000 0x1000>;
+			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 
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
+			wakup_eint: wakeup-interrupt-controller {
+				compatible = "samsung,exynos4210-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
-		smp-sysram@2f000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x2f000 0x1000>;
+		pinctrl_2: pinctrl@3860000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x03860000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <10 0>;
 		};
-	};
 
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
+		pinctrl_3: pinctrl@106e0000 {
+			compatible = "samsung,exynos4x12-pinctrl";
+			reg = <0x106E0000 0x1000>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		};
 
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
-		};
-	};
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
 		};
 	};
 };
-- 
2.7.4
