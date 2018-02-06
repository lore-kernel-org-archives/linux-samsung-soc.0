From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 2/3] ARM: dts: exynos: Add soc node to exynos4210
Date: Tue, 06 Feb 2018 12:29:41 +0100
Message-ID: <1517916582-13814-3-git-send-email-m.purski@samsung.com>
References: <1517916582-13814-1-git-send-email-m.purski@samsung.com>
        <CGME20180206113007eucas1p258ccf74144c41dc2d4000f59b59eefc9@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54788 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752388AbeBFLaK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 06:30:10 -0500
In-reply-to: <1517916582-13814-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Soc nodes are used in other exynos DTS. Exynos4 boards should use them
as well.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi | 513 +++++++++++++++++++-------------------
 1 file changed, 258 insertions(+), 255 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 645b976..80c1972 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -60,314 +60,317 @@
 		};
 	};
 
-	sysram: sysram@2020000 {
-		compatible = "mmio-sram";
-		reg = <0x02020000 0x20000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x02020000 0x20000>;
+	soc: soc {
+		sysram: sysram@2020000 {
+			compatible = "mmio-sram";
+			reg = <0x02020000 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x02020000 0x20000>;
+
+			smp-sysram@0 {
+				compatible = "samsung,exynos4210-sysram";
+				reg = <0x0 0x1000>;
+			};
 
-		smp-sysram@0 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x0 0x1000>;
+			smp-sysram@1f000 {
+				compatible = "samsung,exynos4210-sysram-ns";
+				reg = <0x1f000 0x1000>;
+			};
 		};
 
-		smp-sysram@1f000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x1f000 0x1000>;
+		pd_lcd1: lcd1-power-domain@10023ca0 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10023CA0 0x20>;
+			#power-domain-cells = <0>;
+			label = "LCD1";
 		};
-	};
-
-	pd_lcd1: lcd1-power-domain@10023ca0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10023CA0 0x20>;
-		#power-domain-cells = <0>;
-		label = "LCD1";
-	};
 
-	l2c: l2-cache-controller@10502000 {
-		compatible = "arm,pl310-cache";
-		reg = <0x10502000 0x1000>;
-		cache-unified;
-		cache-level = <2>;
-		arm,tag-latency = <2 2 1>;
-		arm,data-latency = <2 2 1>;
-	};
+		l2c: l2-cache-controller@10502000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x10502000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			arm,tag-latency = <2 2 1>;
+			arm,data-latency = <2 2 1>;
+		};
 
-	mct: mct@10050000 {
-		compatible = "samsung,exynos4210-mct";
-		reg = <0x10050000 0x800>;
-		interrupt-parent = <&mct_map>;
-		interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
-		clock-names = "fin_pll", "mct";
-
-		mct_map: mct-map {
-			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
+		mct: mct@10050000 {
+			compatible = "samsung,exynos4210-mct";
+			reg = <0x10050000 0x800>;
+			interrupt-parent = <&mct_map>;
+			interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
+			clock-names = "fin_pll", "mct";
+
+			mct_map: mct-map {
+				#interrupt-cells = <1>;
+				#address-cells = <0>;
+				#size-cells = <0>;
+				interrupt-map =
+					<0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
 					<1 &gic 0 69 IRQ_TYPE_LEVEL_HIGH>,
 					<2 &combiner 12 6>,
 					<3 &combiner 12 7>,
 					<4 &gic 0 42 IRQ_TYPE_LEVEL_HIGH>,
 					<5 &gic 0 48 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
-	};
 
-	watchdog: watchdog@10060000 {
-		compatible = "samsung,s3c6410-wdt";
-		reg = <0x10060000 0x100>;
-		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_WDT>;
-		clock-names = "watchdog";
-	};
+		watchdog: watchdog@10060000 {
+			compatible = "samsung,s3c6410-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_WDT>;
+			clock-names = "watchdog";
+		};
 
-	clock: clock-controller@10030000 {
-		compatible = "samsung,exynos4210-clock";
-		reg = <0x10030000 0x20000>;
-		#clock-cells = <1>;
-	};
+		clock: clock-controller@10030000 {
+			compatible = "samsung,exynos4210-clock";
+			reg = <0x10030000 0x20000>;
+			#clock-cells = <1>;
+		};
 
-	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,exynos4210-pinctrl";
-		reg = <0x11400000 0x1000>;
-		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-	};
+		pinctrl_0: pinctrl@11400000 {
+			compatible = "samsung,exynos4210-pinctrl";
+			reg = <0x11400000 0x1000>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+		};
 
-	pinctrl_1: pinctrl@11000000 {
-		compatible = "samsung,exynos4210-pinctrl";
-		reg = <0x11000000 0x1000>;
-		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl_1: pinctrl@11000000 {
+			compatible = "samsung,exynos4210-pinctrl";
+			reg = <0x11000000 0x1000>;
+			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 
-		wakup_eint: wakeup-interrupt-controller {
-			compatible = "samsung,exynos4210-wakeup-eint";
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			wakup_eint: wakeup-interrupt-controller {
+				compatible = "samsung,exynos4210-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
-	};
 
-	pinctrl_2: pinctrl@3860000 {
-		compatible = "samsung,exynos4210-pinctrl";
-		reg = <0x03860000 0x1000>;
-	};
+		pinctrl_2: pinctrl@3860000 {
+			compatible = "samsung,exynos4210-pinctrl";
+			reg = <0x03860000 0x1000>;
+		};
 
-	thermal-zones {
-		cpu_thermal: cpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-			thermal-sensors = <&tmu 0>;
+		g2d: g2d@12800000 {
+			compatible = "samsung,s5pv210-g2d";
+			reg = <0x12800000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
+			clock-names = "sclk_fimg2d", "fimg2d";
+			power-domains = <&pd_lcd0>;
+			iommus = <&sysmmu_g2d>;
+		};
 
-			trips {
-			      cpu_alert0: cpu-alert-0 {
-				      temperature = <85000>; /* millicelsius */
-			      };
-			      cpu_alert1: cpu-alert-1 {
-				      temperature = <100000>; /* millicelsius */
-			      };
-			      cpu_alert2: cpu-alert-2 {
-				      temperature = <110000>; /* millicelsius */
-			      };
-			};
+		ppmu_lcd1: ppmu_lcd1@12240000 {
+			compatible = "samsung,exynos-ppmu";
+			reg = <0x12240000 0x2000>;
+			clocks = <&clock CLK_PPMULCD1>;
+			clock-names = "ppmu";
+			status = "disabled";
 		};
-	};
 
-	g2d: g2d@12800000 {
-		compatible = "samsung,s5pv210-g2d";
-		reg = <0x12800000 0x1000>;
-		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
-		clock-names = "sclk_fimg2d", "fimg2d";
-		power-domains = <&pd_lcd0>;
-		iommus = <&sysmmu_g2d>;
-	};
+		sysmmu_g2d: sysmmu@12a20000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x12A20000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <4 7>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
+			power-domains = <&pd_lcd0>;
+			#iommu-cells = <0>;
+		};
 
-	ppmu_lcd1: ppmu_lcd1@12240000 {
-		compatible = "samsung,exynos-ppmu";
-		reg = <0x12240000 0x2000>;
-		clocks = <&clock CLK_PPMULCD1>;
-		clock-names = "ppmu";
-		status = "disabled";
-	};
+		sysmmu_fimd1: sysmmu@12220000 {
+			compatible = "samsung,exynos-sysmmu";
+			interrupt-parent = <&combiner>;
+			reg = <0x12220000 0x1000>;
+			interrupts = <5 3>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
+			power-domains = <&pd_lcd1>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_g2d: sysmmu@12a20000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x12A20000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <4 7>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
-		power-domains = <&pd_lcd0>;
-		#iommu-cells = <0>;
-	};
+		bus_dmc: bus_dmc {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_DMC>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_dmc_opp_table>;
+			status = "disabled";
+		};
 
-	sysmmu_fimd1: sysmmu@12220000 {
-		compatible = "samsung,exynos-sysmmu";
-		interrupt-parent = <&combiner>;
-		reg = <0x12220000 0x1000>;
-		interrupts = <5 3>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
-		power-domains = <&pd_lcd1>;
-		#iommu-cells = <0>;
-	};
+		bus_acp: bus_acp {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_ACP>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_acp_opp_table>;
+			status = "disabled";
+		};
 
-	bus_dmc: bus_dmc {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_DMC>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_dmc_opp_table>;
-		status = "disabled";
-	};
+		bus_peri: bus_peri {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_ACLK100>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_peri_opp_table>;
+			status = "disabled";
+		};
 
-	bus_acp: bus_acp {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_ACP>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_acp_opp_table>;
-		status = "disabled";
-	};
+		bus_fsys: bus_fsys {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_ACLK133>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_fsys_opp_table>;
+			status = "disabled";
+		};
 
-	bus_peri: bus_peri {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK100>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_peri_opp_table>;
-		status = "disabled";
-	};
+		bus_display: bus_display {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_ACLK160>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_display_opp_table>;
+			status = "disabled";
+		};
 
-	bus_fsys: bus_fsys {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK133>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_fsys_opp_table>;
-		status = "disabled";
-	};
+		bus_lcd0: bus_lcd0 {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_ACLK200>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_leftbus_opp_table>;
+			status = "disabled";
+		};
 
-	bus_display: bus_display {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK160>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_display_opp_table>;
-		status = "disabled";
-	};
+		bus_leftbus: bus_leftbus {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_GDL>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_leftbus_opp_table>;
+			status = "disabled";
+		};
 
-	bus_lcd0: bus_lcd0 {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_ACLK200>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
+		bus_rightbus: bus_rightbus {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DIV_GDR>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_leftbus_opp_table>;
+			status = "disabled";
+		};
 
-	bus_leftbus: bus_leftbus {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_GDL>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
+		bus_mfc: bus_mfc {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_SCLK_MFC>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_leftbus_opp_table>;
+			status = "disabled";
+		};
 
-	bus_rightbus: bus_rightbus {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_DIV_GDR>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
+		bus_dmc_opp_table: opp_table1 {
+			compatible = "operating-points-v2";
+			opp-shared;
 
-	bus_mfc: bus_mfc {
-		compatible = "samsung,exynos-bus";
-		clocks = <&clock CLK_SCLK_MFC>;
-		clock-names = "bus";
-		operating-points-v2 = <&bus_leftbus_opp_table>;
-		status = "disabled";
-	};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+				opp-microvolt = <1025000>;
+			};
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+				opp-microvolt = <1050000>;
+			};
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+				opp-microvolt = <1150000>;
+			};
+		};
 
-	bus_dmc_opp_table: opp_table1 {
-		compatible = "operating-points-v2";
-		opp-shared;
+		bus_acp_opp_table: opp_table2 {
+			compatible = "operating-points-v2";
+			opp-shared;
 
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-			opp-microvolt = <1025000>;
-		};
-		opp-267000000 {
-			opp-hz = /bits/ 64 <267000000>;
-			opp-microvolt = <1050000>;
-		};
-		opp-400000000 {
-			opp-hz = /bits/ 64 <400000000>;
-			opp-microvolt = <1150000>;
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+			};
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+			};
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+			};
 		};
-	};
 
-	bus_acp_opp_table: opp_table2 {
-		compatible = "operating-points-v2";
-		opp-shared;
+		bus_peri_opp_table: opp_table3 {
+			compatible = "operating-points-v2";
+			opp-shared;
 
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-		};
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-		};
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
+			opp-5000000 {
+				opp-hz = /bits/ 64 <5000000>;
+			};
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
 		};
-	};
 
-	bus_peri_opp_table: opp_table3 {
-		compatible = "operating-points-v2";
-		opp-shared;
+		bus_fsys_opp_table: opp_table4 {
+			compatible = "operating-points-v2";
+			opp-shared;
 
-		opp-5000000 {
-			opp-hz = /bits/ 64 <5000000>;
-		};
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
+			opp-10000000 {
+				opp-hz = /bits/ 64 <10000000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+			};
 		};
-	};
 
-	bus_fsys_opp_table: opp_table4 {
-		compatible = "operating-points-v2";
-		opp-shared;
+		bus_display_opp_table: opp_table5 {
+			compatible = "operating-points-v2";
+			opp-shared;
 
-		opp-10000000 {
-			opp-hz = /bits/ 64 <10000000>;
-		};
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+			};
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+			};
 		};
-	};
 
-	bus_display_opp_table: opp_table5 {
-		compatible = "operating-points-v2";
-		opp-shared;
+		bus_leftbus_opp_table: opp_table6 {
+			compatible = "operating-points-v2";
+			opp-shared;
 
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-		opp-134000000 {
-			opp-hz = /bits/ 64 <134000000>;
-		};
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+			};
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+			};
 		};
 	};
 
-	bus_leftbus_opp_table: opp_table6 {
-		compatible = "operating-points-v2";
-		opp-shared;
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu 0>;
 
-		opp-100000000 {
-			opp-hz = /bits/ 64 <100000000>;
-		};
-		opp-160000000 {
-			opp-hz = /bits/ 64 <160000000>;
-		};
-		opp-200000000 {
-			opp-hz = /bits/ 64 <200000000>;
+			trips {
+				cpu_alert0: cpu-alert-0 {
+				temperature = <85000>; /* millicelsius */
+				};
+				cpu_alert1: cpu-alert-1 {
+				temperature = <100000>; /* millicelsius */
+				};
+				cpu_alert2: cpu-alert-2 {
+				temperature = <110000>; /* millicelsius */
+				};
+			};
 		};
 	};
 };
-- 
2.7.4
