From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC PATCH 10/12] ARM: dts: exynos: Move Exynos5250 and Exynos5420 nodes under soc
Date: Tue,  3 May 2016 19:52:27 +0200
Message-ID: <1462297949-13824-11-git-send-email-krzk@kernel.org>
References: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The conventions it to put SoC devices under 'soc' node. In fact other
our DTSes (like exynos3250.dtsi or exynos5410.dtsi) already follows it.
Adjust exynos5250 and exynos5420 DTSI to follow this convention. This is
also necessary for the upcoming change in exynos5410.dtsi to inherit
from common exynos5.dtsi.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |  201 ++--
 arch/arm/boot/dts/exynos5250.dtsi | 1699 +++++++++++++++---------------
 arch/arm/boot/dts/exynos5420.dtsi | 2039 +++++++++++++++++++------------------
 3 files changed, 1976 insertions(+), 1963 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 7c83dc6ef972..68820713b66e 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -26,103 +26,110 @@
 		serial3 = &serial_3;
 	};
 
-	chipid@10000000 {
-		compatible = "samsung,exynos4210-chipid";
-		reg = <0x10000000 0x100>;
-	};
-
-	sromc: memory-controller@12250000 {
-		compatible = "samsung,exynos4210-srom";
-		reg = <0x12250000 0x14>;
-	};
-
-	combiner: interrupt-controller@10440000 {
-		compatible = "samsung,exynos4210-combiner";
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		samsung,combiner-nr = <32>;
-		reg = <0x10440000 0x1000>;
-		interrupts =	<0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
-				<0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
-				<0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
-				<0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
-				<0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>,
-				<0 20 0>, <0 21 0>, <0 22 0>, <0 23 0>,
-				<0 24 0>, <0 25 0>, <0 26 0>, <0 27 0>,
-				<0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
-	};
-
-	gic: interrupt-controller@10481000 {
-		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		reg =	<0x10481000 0x1000>,
-			<0x10482000 0x1000>,
-			<0x10484000 0x2000>,
-			<0x10486000 0x2000>;
-		interrupts = <1 9 0xf04>;
-	};
-
-	sysreg_system_controller: syscon@10050000 {
-		compatible = "samsung,exynos5-sysreg", "syscon";
-		reg = <0x10050000 0x5000>;
-	};
-
-	serial_0: serial@12C00000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x12C00000 0x100>;
-		interrupts = <0 51 0>;
-	};
-
-	serial_1: serial@12C10000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x12C10000 0x100>;
-		interrupts = <0 52 0>;
-	};
-
-	serial_2: serial@12C20000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x12C20000 0x100>;
-		interrupts = <0 53 0>;
-	};
-
-	serial_3: serial@12C30000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x12C30000 0x100>;
-		interrupts = <0 54 0>;
-	};
-
-	pwm: pwm@12DD0000 {
-		compatible = "samsung,exynos4210-pwm";
-		reg = <0x12DD0000 0x100>;
-		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
-		#pwm-cells = <3>;
-	};
-
-	rtc: rtc@101E0000 {
-		compatible = "samsung,s3c6410-rtc";
-		reg = <0x101E0000 0x100>;
-		interrupts = <0 43 0>, <0 44 0>;
-		status = "disabled";
-	};
-
-	fimd: fimd@14400000 {
-		compatible = "samsung,exynos5250-fimd";
-		interrupt-parent = <&combiner>;
-		reg = <0x14400000 0x40000>;
-		interrupt-names = "fifo", "vsync", "lcd_sys";
-		interrupts = <18 4>, <18 5>, <18 6>;
-		samsung,sysreg = <&sysreg_system_controller>;
-		status = "disabled";
-	};
-
-	dp: dp-controller@145B0000 {
-		compatible = "samsung,exynos5-dp";
-		reg = <0x145B0000 0x1000>;
-		interrupts = <10 3>;
-		interrupt-parent = <&combiner>;
+	soc: soc {
+		compatible = "simple-bus";
 		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
+		#size-cells = <1>;
+		ranges;
+
+		chipid@10000000 {
+			compatible = "samsung,exynos4210-chipid";
+			reg = <0x10000000 0x100>;
+		};
+
+		sromc: memory-controller@12250000 {
+			compatible = "samsung,exynos4210-srom";
+			reg = <0x12250000 0x14>;
+		};
+
+		combiner: interrupt-controller@10440000 {
+			compatible = "samsung,exynos4210-combiner";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			samsung,combiner-nr = <32>;
+			reg = <0x10440000 0x1000>;
+			interrupts =	<0 0 0>, <0 1 0>, <0 2 0>, <0 3 0>,
+					<0 4 0>, <0 5 0>, <0 6 0>, <0 7 0>,
+					<0 8 0>, <0 9 0>, <0 10 0>, <0 11 0>,
+					<0 12 0>, <0 13 0>, <0 14 0>, <0 15 0>,
+					<0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>,
+					<0 20 0>, <0 21 0>, <0 22 0>, <0 23 0>,
+					<0 24 0>, <0 25 0>, <0 26 0>, <0 27 0>,
+					<0 28 0>, <0 29 0>, <0 30 0>, <0 31 0>;
+		};
+
+		gic: interrupt-controller@10481000 {
+			compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg =	<0x10481000 0x1000>,
+				<0x10482000 0x1000>,
+				<0x10484000 0x2000>,
+				<0x10486000 0x2000>;
+			interrupts = <1 9 0xf04>;
+		};
+
+		sysreg_system_controller: syscon@10050000 {
+			compatible = "samsung,exynos5-sysreg", "syscon";
+			reg = <0x10050000 0x5000>;
+		};
+
+		serial_0: serial@12C00000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x12C00000 0x100>;
+			interrupts = <0 51 0>;
+		};
+
+		serial_1: serial@12C10000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x12C10000 0x100>;
+			interrupts = <0 52 0>;
+		};
+
+		serial_2: serial@12C20000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x12C20000 0x100>;
+			interrupts = <0 53 0>;
+		};
+
+		serial_3: serial@12C30000 {
+			compatible = "samsung,exynos4210-uart";
+			reg = <0x12C30000 0x100>;
+			interrupts = <0 54 0>;
+		};
+
+		pwm: pwm@12DD0000 {
+			compatible = "samsung,exynos4210-pwm";
+			reg = <0x12DD0000 0x100>;
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+			#pwm-cells = <3>;
+		};
+
+		rtc: rtc@101E0000 {
+			compatible = "samsung,s3c6410-rtc";
+			reg = <0x101E0000 0x100>;
+			interrupts = <0 43 0>, <0 44 0>;
+			status = "disabled";
+		};
+
+		fimd: fimd@14400000 {
+			compatible = "samsung,exynos5250-fimd";
+			interrupt-parent = <&combiner>;
+			reg = <0x14400000 0x40000>;
+			interrupt-names = "fifo", "vsync", "lcd_sys";
+			interrupts = <18 4>, <18 5>, <18 6>;
+			samsung,sysreg = <&sysreg_system_controller>;
+			status = "disabled";
+		};
+
+		dp: dp-controller@145B0000 {
+			compatible = "samsung,exynos5-dp";
+			reg = <0x145B0000 0x1000>;
+			interrupts = <10 3>;
+			interrupt-parent = <&combiner>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 6762faaf12a8..cb1eb546a0f2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -96,948 +96,951 @@
 		};
 	};
 
-	sysram@02020000 {
-		compatible = "mmio-sram";
-		reg = <0x02020000 0x30000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x02020000 0x30000>;
-
-		smp-sysram@0 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x0 0x1000>;
+	soc: soc {
+		sysram@02020000 {
+			compatible = "mmio-sram";
+			reg = <0x02020000 0x30000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x02020000 0x30000>;
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
 		};
 
-		smp-sysram@2f000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x2f000 0x1000>;
+		pd_gsc: gsc-power-domain@10044000 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044000 0x20>;
+			#power-domain-cells = <0>;
 		};
-	};
-
-	pd_gsc: gsc-power-domain@10044000 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10044000 0x20>;
-		#power-domain-cells = <0>;
-	};
 
-	pd_mfc: mfc-power-domain@10044040 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10044040 0x20>;
-		#power-domain-cells = <0>;
-	};
+		pd_mfc: mfc-power-domain@10044040 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044040 0x20>;
+			#power-domain-cells = <0>;
+		};
 
-	pd_disp1: disp1-power-domain@100440A0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x100440A0 0x20>;
-		#power-domain-cells = <0>;
-		clocks = <&clock CLK_FIN_PLL>,
-			 <&clock CLK_MOUT_ACLK200_DISP1_SUB>,
-			 <&clock CLK_MOUT_ACLK300_DISP1_SUB>;
-		clock-names = "oscclk", "clk0", "clk1";
-	};
+		pd_disp1: disp1-power-domain@100440A0 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x100440A0 0x20>;
+			#power-domain-cells = <0>;
+			clocks = <&clock CLK_FIN_PLL>,
+				 <&clock CLK_MOUT_ACLK200_DISP1_SUB>,
+				 <&clock CLK_MOUT_ACLK300_DISP1_SUB>;
+			clock-names = "oscclk", "clk0", "clk1";
+		};
 
-	clock: clock-controller@10010000 {
-		compatible = "samsung,exynos5250-clock";
-		reg = <0x10010000 0x30000>;
-		#clock-cells = <1>;
-	};
+		clock: clock-controller@10010000 {
+			compatible = "samsung,exynos5250-clock";
+			reg = <0x10010000 0x30000>;
+			#clock-cells = <1>;
+		};
 
-	clock_audss: audss-clock-controller@3810000 {
-		compatible = "samsung,exynos5250-audss-clock";
-		reg = <0x03810000 0x0C>;
-		#clock-cells = <1>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_FOUT_EPLL>,
-			 <&clock CLK_SCLK_AUDIO0>, <&clock CLK_DIV_PCM0>;
-		clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
-	};
+		clock_audss: audss-clock-controller@3810000 {
+			compatible = "samsung,exynos5250-audss-clock";
+			reg = <0x03810000 0x0C>;
+			#clock-cells = <1>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_FOUT_EPLL>,
+				 <&clock CLK_SCLK_AUDIO0>, <&clock CLK_DIV_PCM0>;
+			clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
+		};
 
-	timer {
-		compatible = "arm,armv7-timer";
-		interrupts = <1 13 0xf08>,
-			     <1 14 0xf08>,
-			     <1 11 0xf08>,
-			     <1 10 0xf08>;
-		/* Unfortunately we need this since some versions of U-Boot
-		 * on Exynos don't set the CNTFRQ register, so we need the
-		 * value from DT.
-		 */
-		clock-frequency = <24000000>;
-	};
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <1 13 0xf08>,
+				     <1 14 0xf08>,
+				     <1 11 0xf08>,
+				     <1 10 0xf08>;
+			/*
+			 * Unfortunately we need this since some versions
+			 * of U-Boot on Exynos don't set the CNTFRQ register,
+			 * so we need the value from DT.
+			 */
+			clock-frequency = <24000000>;
+		};
 
-	mct@101C0000 {
-		compatible = "samsung,exynos4210-mct";
-		reg = <0x101C0000 0x800>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&mct_map>;
-		interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
-			     <4 0>, <5 0>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
-		clock-names = "fin_pll", "mct";
-
-		mct_map: mct-map {
+		mct@101C0000 {
+			compatible = "samsung,exynos4210-mct";
+			reg = <0x101C0000 0x800>;
+			interrupt-controller;
 			#interrupt-cells = <2>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0x0 0 &combiner 23 3>,
-					<0x1 0 &combiner 23 4>,
-					<0x2 0 &combiner 25 2>,
-					<0x3 0 &combiner 25 3>,
-					<0x4 0 &gic 0 120 0>,
-					<0x5 0 &gic 0 121 0>;
+			interrupt-parent = <&mct_map>;
+			interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
+				     <4 0>, <5 0>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
+			clock-names = "fin_pll", "mct";
+
+			mct_map: mct-map {
+				#interrupt-cells = <2>;
+				#address-cells = <0>;
+				#size-cells = <0>;
+				interrupt-map = <0x0 0 &combiner 23 3>,
+						<0x1 0 &combiner 23 4>,
+						<0x2 0 &combiner 25 2>,
+						<0x3 0 &combiner 25 3>,
+						<0x4 0 &gic 0 120 0>,
+						<0x5 0 &gic 0 121 0>;
+			};
 		};
-	};
 
-	pmu {
-		compatible = "arm,cortex-a15-pmu";
-		interrupt-parent = <&combiner>;
-		interrupts = <1 2>, <22 4>;
-	};
+		pmu {
+			compatible = "arm,cortex-a15-pmu";
+			interrupt-parent = <&combiner>;
+			interrupts = <1 2>, <22 4>;
+		};
 
-	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,exynos5250-pinctrl";
-		reg = <0x11400000 0x1000>;
-		interrupts = <0 46 0>;
+		pinctrl_0: pinctrl@11400000 {
+			compatible = "samsung,exynos5250-pinctrl";
+			reg = <0x11400000 0x1000>;
+			interrupts = <0 46 0>;
 
-		wakup_eint: wakeup-interrupt-controller {
-			compatible = "samsung,exynos4210-wakeup-eint";
-			interrupt-parent = <&gic>;
-			interrupts = <0 32 0>;
+			wakup_eint: wakeup-interrupt-controller {
+				compatible = "samsung,exynos4210-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <0 32 0>;
+			};
 		};
-	};
 
-	pinctrl_1: pinctrl@13400000 {
-		compatible = "samsung,exynos5250-pinctrl";
-		reg = <0x13400000 0x1000>;
-		interrupts = <0 45 0>;
-	};
+		pinctrl_1: pinctrl@13400000 {
+			compatible = "samsung,exynos5250-pinctrl";
+			reg = <0x13400000 0x1000>;
+			interrupts = <0 45 0>;
+		};
 
-	pinctrl_2: pinctrl@10d10000 {
-		compatible = "samsung,exynos5250-pinctrl";
-		reg = <0x10d10000 0x1000>;
-		interrupts = <0 50 0>;
-	};
+		pinctrl_2: pinctrl@10d10000 {
+			compatible = "samsung,exynos5250-pinctrl";
+			reg = <0x10d10000 0x1000>;
+			interrupts = <0 50 0>;
+		};
 
-	pinctrl_3: pinctrl@03860000 {
-		compatible = "samsung,exynos5250-pinctrl";
-		reg = <0x03860000 0x1000>;
-		interrupts = <0 47 0>;
-	};
+		pinctrl_3: pinctrl@03860000 {
+			compatible = "samsung,exynos5250-pinctrl";
+			reg = <0x03860000 0x1000>;
+			interrupts = <0 47 0>;
+		};
 
-	pmu_system_controller: system-controller@10040000 {
-		compatible = "samsung,exynos5250-pmu", "syscon";
-		reg = <0x10040000 0x5000>;
-		clock-names = "clkout16";
-		clocks = <&clock CLK_FIN_PLL>;
-		#clock-cells = <1>;
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&gic>;
-	};
+		pmu_system_controller: system-controller@10040000 {
+			compatible = "samsung,exynos5250-pmu", "syscon";
+			reg = <0x10040000 0x5000>;
+			clock-names = "clkout16";
+			clocks = <&clock CLK_FIN_PLL>;
+			#clock-cells = <1>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+		};
 
-	watchdog@101D0000 {
-		compatible = "samsung,exynos5250-wdt";
-		reg = <0x101D0000 0x100>;
-		interrupts = <0 42 0>;
-		clocks = <&clock CLK_WDT>;
-		clock-names = "watchdog";
-		samsung,syscon-phandle = <&pmu_system_controller>;
-	};
+		watchdog@101D0000 {
+			compatible = "samsung,exynos5250-wdt";
+			reg = <0x101D0000 0x100>;
+			interrupts = <0 42 0>;
+			clocks = <&clock CLK_WDT>;
+			clock-names = "watchdog";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+		};
 
-	g2d@10850000 {
-		compatible = "samsung,exynos5250-g2d";
-		reg = <0x10850000 0x1000>;
-		interrupts = <0 91 0>;
-		clocks = <&clock CLK_G2D>;
-		clock-names = "fimg2d";
-		iommus = <&sysmmu_g2d>;
-	};
+		g2d@10850000 {
+			compatible = "samsung,exynos5250-g2d";
+			reg = <0x10850000 0x1000>;
+			interrupts = <0 91 0>;
+			clocks = <&clock CLK_G2D>;
+			clock-names = "fimg2d";
+			iommus = <&sysmmu_g2d>;
+		};
 
-	mfc: codec@11000000 {
-		compatible = "samsung,mfc-v6";
-		reg = <0x11000000 0x10000>;
-		interrupts = <0 96 0>;
-		power-domains = <&pd_mfc>;
-		clocks = <&clock CLK_MFC>;
-		clock-names = "mfc";
-		iommus = <&sysmmu_mfc_l>, <&sysmmu_mfc_r>;
-		iommu-names = "left", "right";
-	};
+		mfc: codec@11000000 {
+			compatible = "samsung,mfc-v6";
+			reg = <0x11000000 0x10000>;
+			interrupts = <0 96 0>;
+			power-domains = <&pd_mfc>;
+			clocks = <&clock CLK_MFC>;
+			clock-names = "mfc";
+			iommus = <&sysmmu_mfc_l>, <&sysmmu_mfc_r>;
+			iommu-names = "left", "right";
+		};
 
-	rotator: rotator@11C00000 {
-		compatible = "samsung,exynos5250-rotator";
-		reg = <0x11C00000 0x64>;
-		interrupts = <0 84 0>;
-		clocks = <&clock CLK_ROTATOR>;
-		clock-names = "rotator";
-		iommus = <&sysmmu_rotator>;
-	};
+		rotator: rotator@11C00000 {
+			compatible = "samsung,exynos5250-rotator";
+			reg = <0x11C00000 0x64>;
+			interrupts = <0 84 0>;
+			clocks = <&clock CLK_ROTATOR>;
+			clock-names = "rotator";
+			iommus = <&sysmmu_rotator>;
+		};
 
-	tmu: tmu@10060000 {
-		compatible = "samsung,exynos5250-tmu";
-		reg = <0x10060000 0x100>;
-		interrupts = <0 65 0>;
-		clocks = <&clock CLK_TMU>;
-		clock-names = "tmu_apbif";
-		#include "exynos4412-tmu-sensor-conf.dtsi"
-	};
+		tmu: tmu@10060000 {
+			compatible = "samsung,exynos5250-tmu";
+			reg = <0x10060000 0x100>;
+			interrupts = <0 65 0>;
+			clocks = <&clock CLK_TMU>;
+			clock-names = "tmu_apbif";
+			#include "exynos4412-tmu-sensor-conf.dtsi"
+		};
 
-	thermal-zones {
-		cpu_thermal: cpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-			thermal-sensors = <&tmu 0>;
+		sata: sata@122F0000 {
+			compatible = "snps,dwc-ahci";
+			samsung,sata-freq = <66>;
+			reg = <0x122F0000 0x1ff>;
+			interrupts = <0 115 0>;
+			clocks = <&clock CLK_SATA>, <&clock CLK_SCLK_SATA>;
+			clock-names = "sata", "sclk_sata";
+			phys = <&sata_phy>;
+			phy-names = "sata-phy";
+			status = "disabled";
+		};
 
-			cooling-maps {
-				map0 {
-				     /* Corresponds to 800MHz at freq_table */
-				     cooling-device = <&cpu0 9 9>;
-				};
-				map1 {
-				     /* Corresponds to 200MHz at freq_table */
-				     cooling-device = <&cpu0 15 15>;
-			       };
-		       };
+		sata_phy: sata-phy@12170000 {
+			compatible = "samsung,exynos5250-sata-phy";
+			reg = <0x12170000 0x1ff>;
+			clocks = <&clock CLK_SATA_PHYCTRL>;
+			clock-names = "sata_phyctrl";
+			#phy-cells = <0>;
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			status = "disabled";
 		};
-	};
 
-	sata: sata@122F0000 {
-		compatible = "snps,dwc-ahci";
-		samsung,sata-freq = <66>;
-		reg = <0x122F0000 0x1ff>;
-		interrupts = <0 115 0>;
-		clocks = <&clock CLK_SATA>, <&clock CLK_SCLK_SATA>;
-		clock-names = "sata", "sclk_sata";
-		phys = <&sata_phy>;
-		phy-names = "sata-phy";
-		status = "disabled";
-	};
+		i2c_0: i2c@12C60000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C60000 0x100>;
+			interrupts = <0 56 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C0>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	sata_phy: sata-phy@12170000 {
-		compatible = "samsung,exynos5250-sata-phy";
-		reg = <0x12170000 0x1ff>;
-		clocks = <&clock CLK_SATA_PHYCTRL>;
-		clock-names = "sata_phyctrl";
-		#phy-cells = <0>;
-		samsung,syscon-phandle = <&pmu_system_controller>;
-		status = "disabled";
-	};
+		i2c_1: i2c@12C70000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C70000 0x100>;
+			interrupts = <0 57 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C1>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	i2c_0: i2c@12C60000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C60000 0x100>;
-		interrupts = <0 56 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C0>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c0_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		i2c_2: i2c@12C80000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C80000 0x100>;
+			interrupts = <0 58 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C2>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	i2c_1: i2c@12C70000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C70000 0x100>;
-		interrupts = <0 57 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C1>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c1_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		i2c_3: i2c@12C90000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C90000 0x100>;
+			interrupts = <0 59 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C3>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	i2c_2: i2c@12C80000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C80000 0x100>;
-		interrupts = <0 58 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C2>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c2_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		i2c_4: i2c@12CA0000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12CA0000 0x100>;
+			interrupts = <0 60 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C4>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_bus>;
+			status = "disabled";
+		};
 
-	i2c_3: i2c@12C90000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C90000 0x100>;
-		interrupts = <0 59 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C3>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c3_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		i2c_5: i2c@12CB0000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12CB0000 0x100>;
+			interrupts = <0 61 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C5>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c5_bus>;
+			status = "disabled";
+		};
 
-	i2c_4: i2c@12CA0000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12CA0000 0x100>;
-		interrupts = <0 60 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C4>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c4_bus>;
-		status = "disabled";
-	};
+		i2c_6: i2c@12CC0000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12CC0000 0x100>;
+			interrupts = <0 62 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C6>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c6_bus>;
+			status = "disabled";
+		};
 
-	i2c_5: i2c@12CB0000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12CB0000 0x100>;
-		interrupts = <0 61 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C5>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c5_bus>;
-		status = "disabled";
-	};
+		i2c_7: i2c@12CD0000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12CD0000 0x100>;
+			interrupts = <0 63 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C7>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c7_bus>;
+			status = "disabled";
+		};
 
-	i2c_6: i2c@12CC0000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12CC0000 0x100>;
-		interrupts = <0 62 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C6>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c6_bus>;
-		status = "disabled";
-	};
+		i2c_8: i2c@12CE0000 {
+			compatible = "samsung,s3c2440-hdmiphy-i2c";
+			reg = <0x12CE0000 0x1000>;
+			interrupts = <0 64 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C_HDMI>;
+			clock-names = "i2c";
+			status = "disabled";
+		};
 
-	i2c_7: i2c@12CD0000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12CD0000 0x100>;
-		interrupts = <0 63 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C7>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c7_bus>;
-		status = "disabled";
-	};
+		i2c_9: i2c@121D0000 {
+			compatible = "samsung,exynos5-sata-phy-i2c";
+			reg = <0x121D0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_SATA_PHYI2C>;
+			clock-names = "i2c";
+			status = "disabled";
+		};
 
-	i2c_8: i2c@12CE0000 {
-		compatible = "samsung,s3c2440-hdmiphy-i2c";
-		reg = <0x12CE0000 0x1000>;
-		interrupts = <0 64 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C_HDMI>;
-		clock-names = "i2c";
-		status = "disabled";
-	};
+		spi_0: spi@12d20000 {
+			compatible = "samsung,exynos4210-spi";
+			status = "disabled";
+			reg = <0x12d20000 0x100>;
+			interrupts = <0 66 0>;
+			dmas = <&pdma0 5
+				&pdma0 4>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
+			clock-names = "spi", "spi_busclk0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_bus>;
+		};
 
-	i2c_9: i2c@121D0000 {
-                compatible = "samsung,exynos5-sata-phy-i2c";
-                reg = <0x121D0000 0x100>;
-                #address-cells = <1>;
-                #size-cells = <0>;
-		clocks = <&clock CLK_SATA_PHYI2C>;
-		clock-names = "i2c";
-		status = "disabled";
-	};
+		spi_1: spi@12d30000 {
+			compatible = "samsung,exynos4210-spi";
+			status = "disabled";
+			reg = <0x12d30000 0x100>;
+			interrupts = <0 67 0>;
+			dmas = <&pdma1 5
+				&pdma1 4>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
+			clock-names = "spi", "spi_busclk0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_bus>;
+		};
 
-	spi_0: spi@12d20000 {
-		compatible = "samsung,exynos4210-spi";
-		status = "disabled";
-		reg = <0x12d20000 0x100>;
-		interrupts = <0 66 0>;
-		dmas = <&pdma0 5
-			&pdma0 4>;
-		dma-names = "tx", "rx";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
-		clock-names = "spi", "spi_busclk0";
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi0_bus>;
-	};
+		spi_2: spi@12d40000 {
+			compatible = "samsung,exynos4210-spi";
+			status = "disabled";
+			reg = <0x12d40000 0x100>;
+			interrupts = <0 68 0>;
+			dmas = <&pdma0 7
+				&pdma0 6>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
+			clock-names = "spi", "spi_busclk0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi2_bus>;
+		};
 
-	spi_1: spi@12d30000 {
-		compatible = "samsung,exynos4210-spi";
-		status = "disabled";
-		reg = <0x12d30000 0x100>;
-		interrupts = <0 67 0>;
-		dmas = <&pdma1 5
-			&pdma1 4>;
-		dma-names = "tx", "rx";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
-		clock-names = "spi", "spi_busclk0";
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi1_bus>;
-	};
+		mmc_0: mmc@12200000 {
+			compatible = "samsung,exynos5250-dw-mshc";
+			interrupts = <0 75 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x12200000 0x1000>;
+			clocks = <&clock CLK_SDMMC0>, <&clock CLK_SCLK_MMC0>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x80>;
+			status = "disabled";
+		};
 
-	spi_2: spi@12d40000 {
-		compatible = "samsung,exynos4210-spi";
-		status = "disabled";
-		reg = <0x12d40000 0x100>;
-		interrupts = <0 68 0>;
-		dmas = <&pdma0 7
-			&pdma0 6>;
-		dma-names = "tx", "rx";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
-		clock-names = "spi", "spi_busclk0";
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi2_bus>;
-	};
+		mmc_1: mmc@12210000 {
+			compatible = "samsung,exynos5250-dw-mshc";
+			interrupts = <0 76 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x12210000 0x1000>;
+			clocks = <&clock CLK_SDMMC1>, <&clock CLK_SCLK_MMC1>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x80>;
+			status = "disabled";
+		};
 
-	mmc_0: mmc@12200000 {
-		compatible = "samsung,exynos5250-dw-mshc";
-		interrupts = <0 75 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x12200000 0x1000>;
-		clocks = <&clock CLK_SDMMC0>, <&clock CLK_SCLK_MMC0>;
-		clock-names = "biu", "ciu";
-		fifo-depth = <0x80>;
-		status = "disabled";
-	};
+		mmc_2: mmc@12220000 {
+			compatible = "samsung,exynos5250-dw-mshc";
+			interrupts = <0 77 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x12220000 0x1000>;
+			clocks = <&clock CLK_SDMMC2>, <&clock CLK_SCLK_MMC2>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x80>;
+			status = "disabled";
+		};
 
-	mmc_1: mmc@12210000 {
-		compatible = "samsung,exynos5250-dw-mshc";
-		interrupts = <0 76 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x12210000 0x1000>;
-		clocks = <&clock CLK_SDMMC1>, <&clock CLK_SCLK_MMC1>;
-		clock-names = "biu", "ciu";
-		fifo-depth = <0x80>;
-		status = "disabled";
-	};
+		mmc_3: mmc@12230000 {
+			compatible = "samsung,exynos5250-dw-mshc";
+			reg = <0x12230000 0x1000>;
+			interrupts = <0 78 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_SDMMC3>, <&clock CLK_SCLK_MMC3>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x80>;
+			status = "disabled";
+		};
 
-	mmc_2: mmc@12220000 {
-		compatible = "samsung,exynos5250-dw-mshc";
-		interrupts = <0 77 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x12220000 0x1000>;
-		clocks = <&clock CLK_SDMMC2>, <&clock CLK_SCLK_MMC2>;
-		clock-names = "biu", "ciu";
-		fifo-depth = <0x80>;
-		status = "disabled";
-	};
+		i2s0: i2s@03830000 {
+			compatible = "samsung,s5pv210-i2s";
+			status = "disabled";
+			reg = <0x03830000 0x100>;
+			dmas = <&pdma0 10
+				&pdma0 9
+				&pdma0 8>;
+			dma-names = "tx", "rx", "tx-sec";
+			clocks = <&clock_audss EXYNOS_I2S_BUS>,
+				<&clock_audss EXYNOS_I2S_BUS>,
+				<&clock_audss EXYNOS_SCLK_I2S>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			samsung,idma-addr = <0x03000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s0_bus>;
+		};
 
-	mmc_3: mmc@12230000 {
-		compatible = "samsung,exynos5250-dw-mshc";
-		reg = <0x12230000 0x1000>;
-		interrupts = <0 78 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_SDMMC3>, <&clock CLK_SCLK_MMC3>;
-		clock-names = "biu", "ciu";
-		fifo-depth = <0x80>;
-		status = "disabled";
-	};
+		i2s1: i2s@12D60000 {
+			compatible = "samsung,s3c6410-i2s";
+			status = "disabled";
+			reg = <0x12D60000 0x100>;
+			dmas = <&pdma1 12
+				&pdma1 11>;
+			dma-names = "tx", "rx";
+			clocks = <&clock CLK_I2S1>, <&clock CLK_DIV_I2S1>;
+			clock-names = "iis", "i2s_opclk0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s1_bus>;
+		};
 
-	i2s0: i2s@03830000 {
-		compatible = "samsung,s5pv210-i2s";
-		status = "disabled";
-		reg = <0x03830000 0x100>;
-		dmas = <&pdma0 10
-			&pdma0 9
-			&pdma0 8>;
-		dma-names = "tx", "rx", "tx-sec";
-		clocks = <&clock_audss EXYNOS_I2S_BUS>,
-			<&clock_audss EXYNOS_I2S_BUS>,
-			<&clock_audss EXYNOS_SCLK_I2S>;
-		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-		samsung,idma-addr = <0x03000000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2s0_bus>;
-	};
+		i2s2: i2s@12D70000 {
+			compatible = "samsung,s3c6410-i2s";
+			status = "disabled";
+			reg = <0x12D70000 0x100>;
+			dmas = <&pdma0 12
+				&pdma0 11>;
+			dma-names = "tx", "rx";
+			clocks = <&clock CLK_I2S2>, <&clock CLK_DIV_I2S2>;
+			clock-names = "iis", "i2s_opclk0";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s2_bus>;
+		};
 
-	i2s1: i2s@12D60000 {
-		compatible = "samsung,s3c6410-i2s";
-		status = "disabled";
-		reg = <0x12D60000 0x100>;
-		dmas = <&pdma1 12
-			&pdma1 11>;
-		dma-names = "tx", "rx";
-		clocks = <&clock CLK_I2S1>, <&clock CLK_DIV_I2S1>;
-		clock-names = "iis", "i2s_opclk0";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2s1_bus>;
-	};
+		usb_dwc3 {
+			compatible = "samsung,exynos5250-dwusb3";
+			clocks = <&clock CLK_USB3>;
+			clock-names = "usbdrd30";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			usbdrd_dwc3: dwc3@12000000 {
+				compatible = "synopsys,dwc3";
+				reg = <0x12000000 0x10000>;
+				interrupts = <0 72 0>;
+				phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
 
-	i2s2: i2s@12D70000 {
-		compatible = "samsung,s3c6410-i2s";
-		status = "disabled";
-		reg = <0x12D70000 0x100>;
-		dmas = <&pdma0 12
-			&pdma0 11>;
-		dma-names = "tx", "rx";
-		clocks = <&clock CLK_I2S2>, <&clock CLK_DIV_I2S2>;
-		clock-names = "iis", "i2s_opclk0";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2s2_bus>;
-	};
+		usbdrd_phy: phy@12100000 {
+			compatible = "samsung,exynos5250-usbdrd-phy";
+			reg = <0x12100000 0x100>;
+			clocks = <&clock CLK_USB3>, <&clock CLK_FIN_PLL>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+		};
 
-	usb_dwc3 {
-		compatible = "samsung,exynos5250-dwusb3";
-		clocks = <&clock CLK_USB3>;
-		clock-names = "usbdrd30";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
+		ehci: usb@12110000 {
+			compatible = "samsung,exynos4210-ehci";
+			reg = <0x12110000 0x100>;
+			interrupts = <0 71 0>;
 
-		usbdrd_dwc3: dwc3@12000000 {
-			compatible = "synopsys,dwc3";
-			reg = <0x12000000 0x10000>;
-			interrupts = <0 72 0>;
-			phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
-			phy-names = "usb2-phy", "usb3-phy";
+			clocks = <&clock CLK_USB2>;
+			clock-names = "usbhost";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				phys = <&usb2_phy_gen 1>;
+			};
 		};
-	};
-
-	usbdrd_phy: phy@12100000 {
-		compatible = "samsung,exynos5250-usbdrd-phy";
-		reg = <0x12100000 0x100>;
-		clocks = <&clock CLK_USB3>, <&clock CLK_FIN_PLL>;
-		clock-names = "phy", "ref";
-		samsung,pmu-syscon = <&pmu_system_controller>;
-		#phy-cells = <1>;
-	};
 
-	ehci: usb@12110000 {
-		compatible = "samsung,exynos4210-ehci";
-		reg = <0x12110000 0x100>;
-		interrupts = <0 71 0>;
+		ohci: usb@12120000 {
+			compatible = "samsung,exynos4210-ohci";
+			reg = <0x12120000 0x100>;
+			interrupts = <0 71 0>;
 
-		clocks = <&clock CLK_USB2>;
-		clock-names = "usbhost";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-			reg = <0>;
-			phys = <&usb2_phy_gen 1>;
+			clocks = <&clock CLK_USB2>;
+			clock-names = "usbhost";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				phys = <&usb2_phy_gen 1>;
+			};
 		};
-	};
 
-	ohci: usb@12120000 {
-		compatible = "samsung,exynos4210-ohci";
-		reg = <0x12120000 0x100>;
-		interrupts = <0 71 0>;
+		usb2_phy_gen: phy@12130000 {
+			compatible = "samsung,exynos5250-usb2-phy";
+			reg = <0x12130000 0x100>;
+			clocks = <&clock CLK_USB2>, <&clock CLK_FIN_PLL>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
+		};
 
-		clocks = <&clock CLK_USB2>;
-		clock-names = "usbhost";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-			reg = <0>;
-			phys = <&usb2_phy_gen 1>;
+		amba {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges;
+
+			pdma0: pdma@121A0000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x121A0000 0x1000>;
+				interrupts = <0 34 0>;
+				clocks = <&clock CLK_PDMA0>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+
+			pdma1: pdma@121B0000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x121B0000 0x1000>;
+				interrupts = <0 35 0>;
+				clocks = <&clock CLK_PDMA1>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+
+			mdma0: mdma@10800000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x10800000 0x1000>;
+				interrupts = <0 33 0>;
+				clocks = <&clock CLK_MDMA0>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <1>;
+			};
+
+			mdma1: mdma@11C10000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x11C10000 0x1000>;
+				interrupts = <0 124 0>;
+				clocks = <&clock CLK_MDMA1>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <1>;
+			};
 		};
-	};
 
-	usb2_phy_gen: phy@12130000 {
-		compatible = "samsung,exynos5250-usb2-phy";
-		reg = <0x12130000 0x100>;
-		clocks = <&clock CLK_USB2>, <&clock CLK_FIN_PLL>;
-		clock-names = "phy", "ref";
-		#phy-cells = <1>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		samsung,pmureg-phandle = <&pmu_system_controller>;
-	};
+		gsc_0:  gsc@13e00000 {
+			compatible = "samsung,exynos5-gsc";
+			reg = <0x13e00000 0x1000>;
+			interrupts = <0 85 0>;
+			power-domains = <&pd_gsc>;
+			clocks = <&clock CLK_GSCL0>;
+			clock-names = "gscl";
+			iommu = <&sysmmu_gsc0>;
+		};
 
-	amba {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
-		ranges;
-
-		pdma0: pdma@121A0000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x121A0000 0x1000>;
-			interrupts = <0 34 0>;
-			clocks = <&clock CLK_PDMA0>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
-		};
-
-		pdma1: pdma@121B0000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x121B0000 0x1000>;
-			interrupts = <0 35 0>;
-			clocks = <&clock CLK_PDMA1>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
-		};
-
-		mdma0: mdma@10800000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x10800000 0x1000>;
-			interrupts = <0 33 0>;
-			clocks = <&clock CLK_MDMA0>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
-		};
-
-		mdma1: mdma@11C10000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x11C10000 0x1000>;
-			interrupts = <0 124 0>;
-			clocks = <&clock CLK_MDMA1>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
+		gsc_1:  gsc@13e10000 {
+			compatible = "samsung,exynos5-gsc";
+			reg = <0x13e10000 0x1000>;
+			interrupts = <0 86 0>;
+			power-domains = <&pd_gsc>;
+			clocks = <&clock CLK_GSCL1>;
+			clock-names = "gscl";
+			iommu = <&sysmmu_gsc1>;
 		};
-	};
 
-	gsc_0:  gsc@13e00000 {
-		compatible = "samsung,exynos5-gsc";
-		reg = <0x13e00000 0x1000>;
-		interrupts = <0 85 0>;
-		power-domains = <&pd_gsc>;
-		clocks = <&clock CLK_GSCL0>;
-		clock-names = "gscl";
-		iommu = <&sysmmu_gsc0>;
-	};
+		gsc_2:  gsc@13e20000 {
+			compatible = "samsung,exynos5-gsc";
+			reg = <0x13e20000 0x1000>;
+			interrupts = <0 87 0>;
+			power-domains = <&pd_gsc>;
+			clocks = <&clock CLK_GSCL2>;
+			clock-names = "gscl";
+			iommu = <&sysmmu_gsc2>;
+		};
 
-	gsc_1:  gsc@13e10000 {
-		compatible = "samsung,exynos5-gsc";
-		reg = <0x13e10000 0x1000>;
-		interrupts = <0 86 0>;
-		power-domains = <&pd_gsc>;
-		clocks = <&clock CLK_GSCL1>;
-		clock-names = "gscl";
-		iommu = <&sysmmu_gsc1>;
-	};
+		gsc_3:  gsc@13e30000 {
+			compatible = "samsung,exynos5-gsc";
+			reg = <0x13e30000 0x1000>;
+			interrupts = <0 88 0>;
+			power-domains = <&pd_gsc>;
+			clocks = <&clock CLK_GSCL3>;
+			clock-names = "gscl";
+			iommu = <&sysmmu_gsc3>;
+		};
 
-	gsc_2:  gsc@13e20000 {
-		compatible = "samsung,exynos5-gsc";
-		reg = <0x13e20000 0x1000>;
-		interrupts = <0 87 0>;
-		power-domains = <&pd_gsc>;
-		clocks = <&clock CLK_GSCL2>;
-		clock-names = "gscl";
-		iommu = <&sysmmu_gsc2>;
-	};
+		hdmi: hdmi@14530000 {
+			compatible = "samsung,exynos4212-hdmi";
+			reg = <0x14530000 0x70000>;
+			power-domains = <&pd_disp1>;
+			interrupts = <0 95 0>;
+			clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
+				 <&clock CLK_SCLK_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
+				 <&clock CLK_MOUT_HDMI>;
+			clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+					"sclk_hdmiphy", "mout_hdmi";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+		};
 
-	gsc_3:  gsc@13e30000 {
-		compatible = "samsung,exynos5-gsc";
-		reg = <0x13e30000 0x1000>;
-		interrupts = <0 88 0>;
-		power-domains = <&pd_gsc>;
-		clocks = <&clock CLK_GSCL3>;
-		clock-names = "gscl";
-		iommu = <&sysmmu_gsc3>;
-	};
+		mixer@14450000 {
+			compatible = "samsung,exynos5250-mixer";
+			reg = <0x14450000 0x10000>;
+			power-domains = <&pd_disp1>;
+			interrupts = <0 94 0>;
+			clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+				 <&clock CLK_SCLK_HDMI>;
+			clock-names = "mixer", "hdmi", "sclk_hdmi";
+			iommus = <&sysmmu_tv>;
+		};
 
-	hdmi: hdmi@14530000 {
-		compatible = "samsung,exynos4212-hdmi";
-		reg = <0x14530000 0x70000>;
-		power-domains = <&pd_disp1>;
-		interrupts = <0 95 0>;
-		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
-			 <&clock CLK_SCLK_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
-			 <&clock CLK_MOUT_HDMI>;
-		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
-				"sclk_hdmiphy", "mout_hdmi";
-		samsung,syscon-phandle = <&pmu_system_controller>;
-	};
+		dp_phy: video-phy {
+			compatible = "samsung,exynos5250-dp-video-phy";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+		};
 
-	mixer@14450000 {
-		compatible = "samsung,exynos5250-mixer";
-		reg = <0x14450000 0x10000>;
-		power-domains = <&pd_disp1>;
-		interrupts = <0 94 0>;
-		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
-			 <&clock CLK_SCLK_HDMI>;
-		clock-names = "mixer", "hdmi", "sclk_hdmi";
-		iommus = <&sysmmu_tv>;
-	};
+		adc: adc@12D10000 {
+			compatible = "samsung,exynos-adc-v1";
+			reg = <0x12D10000 0x100>;
+			interrupts = <0 106 0>;
+			clocks = <&clock CLK_ADC>;
+			clock-names = "adc";
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			status = "disabled";
+		};
 
-	dp_phy: video-phy {
-		compatible = "samsung,exynos5250-dp-video-phy";
-		samsung,pmu-syscon = <&pmu_system_controller>;
-		#phy-cells = <0>;
-	};
+		sss@10830000 {
+			compatible = "samsung,exynos4210-secss";
+			reg = <0x10830000 0x300>;
+			interrupts = <0 112 0>;
+			clocks = <&clock CLK_SSS>;
+			clock-names = "secss";
+		};
 
-	adc: adc@12D10000 {
-		compatible = "samsung,exynos-adc-v1";
-		reg = <0x12D10000 0x100>;
-		interrupts = <0 106 0>;
-		clocks = <&clock CLK_ADC>;
-		clock-names = "adc";
-		#io-channel-cells = <1>;
-		io-channel-ranges;
-		samsung,syscon-phandle = <&pmu_system_controller>;
-		status = "disabled";
-	};
+		sysmmu_g2d: sysmmu@10A60000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x10A60000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <24 5>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_2D>, <&clock CLK_G2D>;
+			#iommu-cells = <0>;
+		};
 
-	sss@10830000 {
-		compatible = "samsung,exynos4210-secss";
-		reg = <0x10830000 0x300>;
-		interrupts = <0 112 0>;
-		clocks = <&clock CLK_SSS>;
-		clock-names = "secss";
-	};
+		sysmmu_mfc_r: sysmmu@11200000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11200000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <6 2>;
+			power-domains = <&pd_mfc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MFCR>, <&clock CLK_MFC>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_g2d: sysmmu@10A60000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x10A60000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <24 5>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_2D>, <&clock CLK_G2D>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_mfc_l: sysmmu@11210000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11210000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <8 5>;
+			power-domains = <&pd_mfc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MFCL>, <&clock CLK_MFC>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_mfc_r: sysmmu@11200000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11200000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <6 2>;
-		power-domains = <&pd_mfc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MFCR>, <&clock CLK_MFC>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_rotator: sysmmu@11D40000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11D40000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <4 0>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_mfc_l: sysmmu@11210000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11210000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <8 5>;
-		power-domains = <&pd_mfc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MFCL>, <&clock CLK_MFC>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_jpeg: sysmmu@11F20000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11F20000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <4 2>;
+			power-domains = <&pd_gsc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_JPEG>, <&clock CLK_JPEG>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_rotator: sysmmu@11D40000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11D40000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <4 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_isp: sysmmu@13260000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13260000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <10 6>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_ISP>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_jpeg: sysmmu@11F20000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11F20000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <4 2>;
-		power-domains = <&pd_gsc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_JPEG>, <&clock CLK_JPEG>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_drc: sysmmu@13270000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13270000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <11 6>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_DRC>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_isp: sysmmu@13260000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13260000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <10 6>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_ISP>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_fd: sysmmu@132A0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x132A0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <5 0>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_FD>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_drc: sysmmu@13270000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13270000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <11 6>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_DRC>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_scc: sysmmu@13280000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13280000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <5 2>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_SCC>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_fd: sysmmu@132A0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x132A0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <5 0>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_FD>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_scp: sysmmu@13290000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13290000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <3 6>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_SCP>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_scc: sysmmu@13280000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13280000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <5 2>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_SCC>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_mcuctl: sysmmu@132B0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x132B0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <5 4>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_MCU>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_scp: sysmmu@13290000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13290000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <3 6>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_SCP>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_odc: sysmmu@132C0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x132C0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <11 0>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_ODC>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_mcuctl: sysmmu@132B0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x132B0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <5 4>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_MCU>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_dis0: sysmmu@132D0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x132D0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <10 4>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_DIS0>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_odc: sysmmu@132C0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x132C0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <11 0>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_ODC>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_dis1: sysmmu@132E0000{
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x132E0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <9 4>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_DIS1>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_dis0: sysmmu@132D0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x132D0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <10 4>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_DIS0>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_3dnr: sysmmu@132F0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x132F0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <5 6>;
+			clock-names = "sysmmu";
+			clocks = <&clock CLK_SMMU_FIMC_3DNR>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_dis1: sysmmu@132E0000{
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x132E0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <9 4>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_DIS1>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_lite0: sysmmu@13C40000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13C40000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <3 4>;
+			power-domains = <&pd_gsc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMC_LITE0>, <&clock CLK_CAMIF_TOP>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_3dnr: sysmmu@132F0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x132F0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <5 6>;
-		clock-names = "sysmmu";
-		clocks = <&clock CLK_SMMU_FIMC_3DNR>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimc_lite1: sysmmu@13C50000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13C50000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <24 1>;
+			power-domains = <&pd_gsc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMC_LITE1>, <&clock CLK_CAMIF_TOP>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_lite0: sysmmu@13C40000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13C40000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <3 4>;
-		power-domains = <&pd_gsc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_FIMC_LITE0>, <&clock CLK_CAMIF_TOP>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_gsc0: sysmmu@13E80000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13E80000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <2 0>;
+			power-domains = <&pd_gsc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_GSCL0>, <&clock CLK_GSCL0>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimc_lite1: sysmmu@13C50000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13C50000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <24 1>;
-		power-domains = <&pd_gsc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_FIMC_LITE1>, <&clock CLK_CAMIF_TOP>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_gsc1: sysmmu@13E90000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13E90000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <2 2>;
+			power-domains = <&pd_gsc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_GSCL1>, <&clock CLK_GSCL1>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_gsc0: sysmmu@13E80000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13E80000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <2 0>;
-		power-domains = <&pd_gsc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_GSCL0>, <&clock CLK_GSCL0>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_gsc2: sysmmu@13EA0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13EA0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <2 4>;
+			power-domains = <&pd_gsc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_GSCL2>, <&clock CLK_GSCL2>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_gsc1: sysmmu@13E90000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13E90000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <2 2>;
-		power-domains = <&pd_gsc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_GSCL1>, <&clock CLK_GSCL1>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_gsc3: sysmmu@13EB0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13EB0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <2 6>;
+			power-domains = <&pd_gsc>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_GSCL3>, <&clock CLK_GSCL3>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_gsc2: sysmmu@13EA0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13EA0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <2 4>;
-		power-domains = <&pd_gsc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_GSCL2>, <&clock CLK_GSCL2>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimd1: sysmmu@14640000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14640000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <3 2>;
+			power-domains = <&pd_disp1>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_gsc3: sysmmu@13EB0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13EB0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <2 6>;
-		power-domains = <&pd_gsc>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_GSCL3>, <&clock CLK_GSCL3>;
-		#iommu-cells = <0>;
+		sysmmu_tv: sysmmu@14650000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14650000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <7 4>;
+			power-domains = <&pd_disp1>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_TV>, <&clock CLK_MIXER>;
+			#iommu-cells = <0>;
+		};
 	};
 
-	sysmmu_fimd1: sysmmu@14640000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x14640000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <3 2>;
-		power-domains = <&pd_disp1>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
-		#iommu-cells = <0>;
-	};
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu 0>;
 
-	sysmmu_tv: sysmmu@14650000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x14650000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <7 4>;
-		power-domains = <&pd_disp1>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_TV>, <&clock CLK_MIXER>;
-		#iommu-cells = <0>;
+			cooling-maps {
+				map0 {
+				     /* Corresponds to 800MHz at freq_table */
+				     cooling-device = <&cpu0 9 9>;
+				};
+				map1 {
+				     /* Corresponds to 200MHz at freq_table */
+				     cooling-device = <&cpu0 15 15>;
+			       };
+		       };
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index f7322d87095f..3114cd6fb5d1 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -50,1129 +50,1132 @@
 		usbdrdphy1 = &usbdrd_phy1;
 	};
 
-	cluster_a15_opp_table: opp_table0 {
-		compatible = "operating-points-v2";
-		opp-shared;
-		opp@1800000000 {
-			opp-hz = /bits/ 64 <1800000000>;
-			opp-microvolt = <1250000>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1700000000 {
-			opp-hz = /bits/ 64 <1700000000>;
-			opp-microvolt = <1212500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1600000000 {
-			opp-hz = /bits/ 64 <1600000000>;
-			opp-microvolt = <1175000>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1500000000 {
-			opp-hz = /bits/ 64 <1500000000>;
-			opp-microvolt = <1137500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1400000000 {
-			opp-hz = /bits/ 64 <1400000000>;
-			opp-microvolt = <1112500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1300000000 {
-			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1062500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1037500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1012500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = < 987500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@900000000 {
-			opp-hz = /bits/ 64 <900000000>;
-			opp-microvolt = < 962500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@800000000 {
-			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = < 937500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@700000000 {
-			opp-hz = /bits/ 64 <700000000>;
-			opp-microvolt = < 912500>;
-			clock-latency-ns = <140000>;
-		};
-	};
-
-	cluster_a7_opp_table: opp_table1 {
-		compatible = "operating-points-v2";
-		opp-shared;
-		opp@1300000000 {
-			opp-hz = /bits/ 64 <1300000000>;
-			opp-microvolt = <1275000>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1200000000 {
-			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1212500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1100000000 {
-			opp-hz = /bits/ 64 <1100000000>;
-			opp-microvolt = <1162500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@1000000000 {
-			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <1112500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@900000000 {
-			opp-hz = /bits/ 64 <900000000>;
-			opp-microvolt = <1062500>;
-			clock-latency-ns = <140000>;
-		};
-		opp@800000000 {
-			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <1025000>;
-			clock-latency-ns = <140000>;
-		};
-		opp@700000000 {
-			opp-hz = /bits/ 64 <700000000>;
-			opp-microvolt = <975000>;
-			clock-latency-ns = <140000>;
-		};
-		opp@600000000 {
-			opp-hz = /bits/ 64 <600000000>;
-			opp-microvolt = <937500>;
-			clock-latency-ns = <140000>;
-		};
-	};
-
 	/*
 	 * The 'cpus' node is not present here but instead it is provided
 	 * by exynos5420-cpus.dtsi or exynos5422-cpus.dtsi.
 	 */
 
-	cci: cci@10d20000 {
-		compatible = "arm,cci-400";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0x10d20000 0x1000>;
-		ranges = <0x0 0x10d20000 0x6000>;
-
-		cci_control0: slave-if@4000 {
-			compatible = "arm,cci-400-ctrl-if";
-			interface-type = "ace";
-			reg = <0x4000 0x1000>;
-		};
-		cci_control1: slave-if@5000 {
-			compatible = "arm,cci-400-ctrl-if";
-			interface-type = "ace";
-			reg = <0x5000 0x1000>;
+	soc: soc {
+		cluster_a15_opp_table: opp_table0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+			opp@1800000000 {
+				opp-hz = /bits/ 64 <1800000000>;
+				opp-microvolt = <1250000>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1700000000 {
+				opp-hz = /bits/ 64 <1700000000>;
+				opp-microvolt = <1212500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1600000000 {
+				opp-hz = /bits/ 64 <1600000000>;
+				opp-microvolt = <1175000>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1500000000 {
+				opp-hz = /bits/ 64 <1500000000>;
+				opp-microvolt = <1137500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1400000000 {
+				opp-hz = /bits/ 64 <1400000000>;
+				opp-microvolt = <1112500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1300000000 {
+				opp-hz = /bits/ 64 <1300000000>;
+				opp-microvolt = <1062500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1200000000 {
+				opp-hz = /bits/ 64 <1200000000>;
+				opp-microvolt = <1037500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1100000000 {
+				opp-hz = /bits/ 64 <1100000000>;
+				opp-microvolt = <1012500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1000000000 {
+				opp-hz = /bits/ 64 <1000000000>;
+				opp-microvolt = < 987500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@900000000 {
+				opp-hz = /bits/ 64 <900000000>;
+				opp-microvolt = < 962500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@800000000 {
+				opp-hz = /bits/ 64 <800000000>;
+				opp-microvolt = < 937500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@700000000 {
+				opp-hz = /bits/ 64 <700000000>;
+				opp-microvolt = < 912500>;
+				clock-latency-ns = <140000>;
+			};
 		};
-	};
 
-	sysram@02020000 {
-		compatible = "mmio-sram";
-		reg = <0x02020000 0x54000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x02020000 0x54000>;
+		cluster_a7_opp_table: opp_table1 {
+			compatible = "operating-points-v2";
+			opp-shared;
+			opp@1300000000 {
+				opp-hz = /bits/ 64 <1300000000>;
+				opp-microvolt = <1275000>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1200000000 {
+				opp-hz = /bits/ 64 <1200000000>;
+				opp-microvolt = <1212500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1100000000 {
+				opp-hz = /bits/ 64 <1100000000>;
+				opp-microvolt = <1162500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@1000000000 {
+				opp-hz = /bits/ 64 <1000000000>;
+				opp-microvolt = <1112500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@900000000 {
+				opp-hz = /bits/ 64 <900000000>;
+				opp-microvolt = <1062500>;
+				clock-latency-ns = <140000>;
+			};
+			opp@800000000 {
+				opp-hz = /bits/ 64 <800000000>;
+				opp-microvolt = <1025000>;
+				clock-latency-ns = <140000>;
+			};
+			opp@700000000 {
+				opp-hz = /bits/ 64 <700000000>;
+				opp-microvolt = <975000>;
+				clock-latency-ns = <140000>;
+			};
+			opp@600000000 {
+				opp-hz = /bits/ 64 <600000000>;
+				opp-microvolt = <937500>;
+				clock-latency-ns = <140000>;
+			};
+		};
 
-		smp-sysram@0 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x0 0x1000>;
+		cci: cci@10d20000 {
+			compatible = "arm,cci-400";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x10d20000 0x1000>;
+			ranges = <0x0 0x10d20000 0x6000>;
+
+			cci_control0: slave-if@4000 {
+				compatible = "arm,cci-400-ctrl-if";
+				interface-type = "ace";
+				reg = <0x4000 0x1000>;
+			};
+			cci_control1: slave-if@5000 {
+				compatible = "arm,cci-400-ctrl-if";
+				interface-type = "ace";
+				reg = <0x5000 0x1000>;
+			};
 		};
 
-		smp-sysram@53000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x53000 0x1000>;
+		sysram@02020000 {
+			compatible = "mmio-sram";
+			reg = <0x02020000 0x54000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x02020000 0x54000>;
+
+			smp-sysram@0 {
+				compatible = "samsung,exynos4210-sysram";
+				reg = <0x0 0x1000>;
+			};
+
+			smp-sysram@53000 {
+				compatible = "samsung,exynos4210-sysram-ns";
+				reg = <0x53000 0x1000>;
+			};
 		};
-	};
 
-	clock: clock-controller@10010000 {
-		compatible = "samsung,exynos5420-clock";
-		reg = <0x10010000 0x30000>;
-		#clock-cells = <1>;
-	};
+		clock: clock-controller@10010000 {
+			compatible = "samsung,exynos5420-clock";
+			reg = <0x10010000 0x30000>;
+			#clock-cells = <1>;
+		};
 
-	clock_audss: audss-clock-controller@3810000 {
-		compatible = "samsung,exynos5420-audss-clock";
-		reg = <0x03810000 0x0C>;
-		#clock-cells = <1>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MAU_EPLL>,
-			 <&clock CLK_SCLK_MAUDIO0>, <&clock CLK_SCLK_MAUPCM0>;
-		clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
-	};
+		clock_audss: audss-clock-controller@3810000 {
+			compatible = "samsung,exynos5420-audss-clock";
+			reg = <0x03810000 0x0C>;
+			#clock-cells = <1>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MAU_EPLL>,
+				 <&clock CLK_SCLK_MAUDIO0>, <&clock CLK_SCLK_MAUPCM0>;
+			clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in";
+		};
 
-	mfc: codec@11000000 {
-		compatible = "samsung,mfc-v7";
-		reg = <0x11000000 0x10000>;
-		interrupts = <0 96 0>;
-		clocks = <&clock CLK_MFC>;
-		clock-names = "mfc";
-		power-domains = <&mfc_pd>;
-		iommus = <&sysmmu_mfc_l>, <&sysmmu_mfc_r>;
-		iommu-names = "left", "right";
-	};
+		mfc: codec@11000000 {
+			compatible = "samsung,mfc-v7";
+			reg = <0x11000000 0x10000>;
+			interrupts = <0 96 0>;
+			clocks = <&clock CLK_MFC>;
+			clock-names = "mfc";
+			power-domains = <&mfc_pd>;
+			iommus = <&sysmmu_mfc_l>, <&sysmmu_mfc_r>;
+			iommu-names = "left", "right";
+		};
 
-	mmc_0: mmc@12200000 {
-		compatible = "samsung,exynos5420-dw-mshc-smu";
-		interrupts = <0 75 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x12200000 0x2000>;
-		clocks = <&clock CLK_MMC0>, <&clock CLK_SCLK_MMC0>;
-		clock-names = "biu", "ciu";
-		fifo-depth = <0x40>;
-		status = "disabled";
-	};
+		mmc_0: mmc@12200000 {
+			compatible = "samsung,exynos5420-dw-mshc-smu";
+			interrupts = <0 75 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x12200000 0x2000>;
+			clocks = <&clock CLK_MMC0>, <&clock CLK_SCLK_MMC0>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x40>;
+			status = "disabled";
+		};
 
-	mmc_1: mmc@12210000 {
-		compatible = "samsung,exynos5420-dw-mshc-smu";
-		interrupts = <0 76 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x12210000 0x2000>;
-		clocks = <&clock CLK_MMC1>, <&clock CLK_SCLK_MMC1>;
-		clock-names = "biu", "ciu";
-		fifo-depth = <0x40>;
-		status = "disabled";
-	};
+		mmc_1: mmc@12210000 {
+			compatible = "samsung,exynos5420-dw-mshc-smu";
+			interrupts = <0 76 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x12210000 0x2000>;
+			clocks = <&clock CLK_MMC1>, <&clock CLK_SCLK_MMC1>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x40>;
+			status = "disabled";
+		};
 
-	mmc_2: mmc@12220000 {
-		compatible = "samsung,exynos5420-dw-mshc";
-		interrupts = <0 77 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x12220000 0x1000>;
-		clocks = <&clock CLK_MMC2>, <&clock CLK_SCLK_MMC2>;
-		clock-names = "biu", "ciu";
-		fifo-depth = <0x40>;
-		status = "disabled";
-	};
+		mmc_2: mmc@12220000 {
+			compatible = "samsung,exynos5420-dw-mshc";
+			interrupts = <0 77 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x12220000 0x1000>;
+			clocks = <&clock CLK_MMC2>, <&clock CLK_SCLK_MMC2>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x40>;
+			status = "disabled";
+		};
 
-	mct: mct@101C0000 {
-		compatible = "samsung,exynos4210-mct";
-		reg = <0x101C0000 0x800>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		interrupt-parent = <&mct_map>;
-		interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
-				<8>, <9>, <10>, <11>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
-		clock-names = "fin_pll", "mct";
-
-		mct_map: mct-map {
+		mct: mct@101C0000 {
+			compatible = "samsung,exynos4210-mct";
+			reg = <0x101C0000 0x800>;
+			interrupt-controller;
 			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0 &combiner 23 3>,
-					<1 &combiner 23 4>,
-					<2 &combiner 25 2>,
-					<3 &combiner 25 3>,
-					<4 &gic 0 120 0>,
-					<5 &gic 0 121 0>,
-					<6 &gic 0 122 0>,
-					<7 &gic 0 123 0>,
-					<8 &gic 0 128 0>,
-					<9 &gic 0 129 0>,
-					<10 &gic 0 130 0>,
-					<11 &gic 0 131 0>;
+			interrupt-parent = <&mct_map>;
+			interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
+					<8>, <9>, <10>, <11>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
+			clock-names = "fin_pll", "mct";
+
+			mct_map: mct-map {
+				#interrupt-cells = <1>;
+				#address-cells = <0>;
+				#size-cells = <0>;
+				interrupt-map = <0 &combiner 23 3>,
+						<1 &combiner 23 4>,
+						<2 &combiner 25 2>,
+						<3 &combiner 25 3>,
+						<4 &gic 0 120 0>,
+						<5 &gic 0 121 0>,
+						<6 &gic 0 122 0>,
+						<7 &gic 0 123 0>,
+						<8 &gic 0 128 0>,
+						<9 &gic 0 129 0>,
+						<10 &gic 0 130 0>,
+						<11 &gic 0 131 0>;
+			};
 		};
-	};
 
-	gsc_pd: power-domain@10044000 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10044000 0x20>;
-		#power-domain-cells = <0>;
-		clocks = <&clock CLK_FIN_PLL>,
-			 <&clock CLK_MOUT_USER_ACLK300_GSCL>,
-			 <&clock CLK_GSCL0>, <&clock CLK_GSCL1>;
-		clock-names = "oscclk", "clk0", "asb0", "asb1";
-	};
+		gsc_pd: power-domain@10044000 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044000 0x20>;
+			#power-domain-cells = <0>;
+			clocks = <&clock CLK_FIN_PLL>,
+				 <&clock CLK_MOUT_USER_ACLK300_GSCL>,
+				 <&clock CLK_GSCL0>, <&clock CLK_GSCL1>;
+			clock-names = "oscclk", "clk0", "asb0", "asb1";
+		};
 
-	isp_pd: power-domain@10044020 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10044020 0x20>;
-		#power-domain-cells = <0>;
-	};
+		isp_pd: power-domain@10044020 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044020 0x20>;
+			#power-domain-cells = <0>;
+		};
 
-	mfc_pd: power-domain@10044060 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10044060 0x20>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_USER_ACLK333>;
-		clock-names = "oscclk", "clk0";
-		#power-domain-cells = <0>;
-	};
+		mfc_pd: power-domain@10044060 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044060 0x20>;
+			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_USER_ACLK333>;
+			clock-names = "oscclk", "clk0";
+			#power-domain-cells = <0>;
+		};
 
-	msc_pd: power-domain@10044120 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x10044120 0x20>;
-		#power-domain-cells = <0>;
-	};
+		msc_pd: power-domain@10044120 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x10044120 0x20>;
+			#power-domain-cells = <0>;
+		};
 
-	disp_pd: power-domain@100440C0 {
-		compatible = "samsung,exynos4210-pd";
-		reg = <0x100440C0 0x20>;
-		#power-domain-cells = <0>;
-		clocks = <&clock CLK_FIN_PLL>,
-			 <&clock CLK_MOUT_USER_ACLK200_DISP1>,
-			 <&clock CLK_MOUT_USER_ACLK300_DISP1>,
-			 <&clock CLK_MOUT_USER_ACLK400_DISP1>,
-			 <&clock CLK_FIMD1>, <&clock CLK_MIXER>;
-		clock-names = "oscclk", "clk0", "clk1", "clk2", "asb0", "asb1";
-	};
+		disp_pd: power-domain@100440C0 {
+			compatible = "samsung,exynos4210-pd";
+			reg = <0x100440C0 0x20>;
+			#power-domain-cells = <0>;
+			clocks = <&clock CLK_FIN_PLL>,
+				 <&clock CLK_MOUT_USER_ACLK200_DISP1>,
+				 <&clock CLK_MOUT_USER_ACLK300_DISP1>,
+				 <&clock CLK_MOUT_USER_ACLK400_DISP1>,
+				 <&clock CLK_FIMD1>, <&clock CLK_MIXER>;
+			clock-names = "oscclk", "clk0", "clk1", "clk2", "asb0", "asb1";
+		};
 
-	pinctrl_0: pinctrl@13400000 {
-		compatible = "samsung,exynos5420-pinctrl";
-		reg = <0x13400000 0x1000>;
-		interrupts = <0 45 0>;
+		pinctrl_0: pinctrl@13400000 {
+			compatible = "samsung,exynos5420-pinctrl";
+			reg = <0x13400000 0x1000>;
+			interrupts = <0 45 0>;
 
-		wakeup-interrupt-controller {
-			compatible = "samsung,exynos4210-wakeup-eint";
-			interrupt-parent = <&gic>;
-			interrupts = <0 32 0>;
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos4210-wakeup-eint";
+				interrupt-parent = <&gic>;
+				interrupts = <0 32 0>;
+			};
 		};
-	};
-
-	pinctrl_1: pinctrl@13410000 {
-		compatible = "samsung,exynos5420-pinctrl";
-		reg = <0x13410000 0x1000>;
-		interrupts = <0 78 0>;
-	};
 
-	pinctrl_2: pinctrl@14000000 {
-		compatible = "samsung,exynos5420-pinctrl";
-		reg = <0x14000000 0x1000>;
-		interrupts = <0 46 0>;
-	};
+		pinctrl_1: pinctrl@13410000 {
+			compatible = "samsung,exynos5420-pinctrl";
+			reg = <0x13410000 0x1000>;
+			interrupts = <0 78 0>;
+		};
 
-	pinctrl_3: pinctrl@14010000 {
-		compatible = "samsung,exynos5420-pinctrl";
-		reg = <0x14010000 0x1000>;
-		interrupts = <0 50 0>;
-	};
+		pinctrl_2: pinctrl@14000000 {
+			compatible = "samsung,exynos5420-pinctrl";
+			reg = <0x14000000 0x1000>;
+			interrupts = <0 46 0>;
+		};
 
-	pinctrl_4: pinctrl@03860000 {
-		compatible = "samsung,exynos5420-pinctrl";
-		reg = <0x03860000 0x1000>;
-		interrupts = <0 47 0>;
-	};
+		pinctrl_3: pinctrl@14010000 {
+			compatible = "samsung,exynos5420-pinctrl";
+			reg = <0x14010000 0x1000>;
+			interrupts = <0 50 0>;
+		};
 
-	amba {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
-		ranges;
-
-		adma: adma@03880000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x03880000 0x1000>;
-			interrupts = <0 110 0>;
-			clocks = <&clock_audss EXYNOS_ADMA>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <6>;
-			#dma-requests = <16>;
-		};
-
-		pdma0: pdma@121A0000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x121A0000 0x1000>;
-			interrupts = <0 34 0>;
-			clocks = <&clock CLK_PDMA0>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
-		};
-
-		pdma1: pdma@121B0000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x121B0000 0x1000>;
-			interrupts = <0 35 0>;
-			clocks = <&clock CLK_PDMA1>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <32>;
-		};
-
-		mdma0: mdma@10800000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x10800000 0x1000>;
-			interrupts = <0 33 0>;
-			clocks = <&clock CLK_MDMA0>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
-		};
-
-		mdma1: mdma@11C10000 {
-			compatible = "arm,pl330", "arm,primecell";
-			reg = <0x11C10000 0x1000>;
-			interrupts = <0 124 0>;
-			clocks = <&clock CLK_MDMA1>;
-			clock-names = "apb_pclk";
-			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <1>;
-			/*
-			 * MDMA1 can support both secure and non-secure
-			 * AXI transactions. When this is enabled in the kernel
-			 * for boards that run in secure mode, we are getting
-			 * imprecise external aborts causing the kernel to oops.
-			 */
-			status = "disabled";
+		pinctrl_4: pinctrl@03860000 {
+			compatible = "samsung,exynos5420-pinctrl";
+			reg = <0x03860000 0x1000>;
+			interrupts = <0 47 0>;
 		};
-	};
 
-	i2s0: i2s@03830000 {
-		compatible = "samsung,exynos5420-i2s";
-		reg = <0x03830000 0x100>;
-		dmas = <&adma 0
-			&adma 2
-			&adma 1>;
-		dma-names = "tx", "rx", "tx-sec";
-		clocks = <&clock_audss EXYNOS_I2S_BUS>,
-			<&clock_audss EXYNOS_I2S_BUS>,
-			<&clock_audss EXYNOS_SCLK_I2S>;
-		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-		#clock-cells = <1>;
-		clock-output-names = "i2s_cdclk0";
-		#sound-dai-cells = <1>;
-		samsung,idma-addr = <0x03000000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2s0_bus>;
-		status = "disabled";
-	};
+		amba {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges;
+
+			adma: adma@03880000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x03880000 0x1000>;
+				interrupts = <0 110 0>;
+				clocks = <&clock_audss EXYNOS_ADMA>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <6>;
+				#dma-requests = <16>;
+			};
+
+			pdma0: pdma@121A0000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x121A0000 0x1000>;
+				interrupts = <0 34 0>;
+				clocks = <&clock CLK_PDMA0>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+
+			pdma1: pdma@121B0000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x121B0000 0x1000>;
+				interrupts = <0 35 0>;
+				clocks = <&clock CLK_PDMA1>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
+			};
+
+			mdma0: mdma@10800000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x10800000 0x1000>;
+				interrupts = <0 33 0>;
+				clocks = <&clock CLK_MDMA0>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <1>;
+			};
+
+			mdma1: mdma@11C10000 {
+				compatible = "arm,pl330", "arm,primecell";
+				reg = <0x11C10000 0x1000>;
+				interrupts = <0 124 0>;
+				clocks = <&clock CLK_MDMA1>;
+				clock-names = "apb_pclk";
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <1>;
+				/*
+				 * MDMA1 can support both secure and non-secure
+				 * AXI transactions. When this is enabled in
+				 * the kernel for boards that run in secure
+				 * mode, we are getting imprecise external
+				 * aborts causing the kernel to oops.
+				 */
+				status = "disabled";
+			};
+		};
 
-	i2s1: i2s@12D60000 {
-		compatible = "samsung,exynos5420-i2s";
-		reg = <0x12D60000 0x100>;
-		dmas = <&pdma1 12
-			&pdma1 11>;
-		dma-names = "tx", "rx";
-		clocks = <&clock CLK_I2S1>, <&clock CLK_SCLK_I2S1>;
-		clock-names = "iis", "i2s_opclk0";
-		#clock-cells = <1>;
-		clock-output-names = "i2s_cdclk1";
-		#sound-dai-cells = <1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2s1_bus>;
-		status = "disabled";
-	};
+		i2s0: i2s@03830000 {
+			compatible = "samsung,exynos5420-i2s";
+			reg = <0x03830000 0x100>;
+			dmas = <&adma 0
+				&adma 2
+				&adma 1>;
+			dma-names = "tx", "rx", "tx-sec";
+			clocks = <&clock_audss EXYNOS_I2S_BUS>,
+				<&clock_audss EXYNOS_I2S_BUS>,
+				<&clock_audss EXYNOS_SCLK_I2S>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			#clock-cells = <1>;
+			clock-output-names = "i2s_cdclk0";
+			#sound-dai-cells = <1>;
+			samsung,idma-addr = <0x03000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s0_bus>;
+			status = "disabled";
+		};
 
-	i2s2: i2s@12D70000 {
-		compatible = "samsung,exynos5420-i2s";
-		reg = <0x12D70000 0x100>;
-		dmas = <&pdma0 12
-			&pdma0 11>;
-		dma-names = "tx", "rx";
-		clocks = <&clock CLK_I2S2>, <&clock CLK_SCLK_I2S2>;
-		clock-names = "iis", "i2s_opclk0";
-		#clock-cells = <1>;
-		clock-output-names = "i2s_cdclk2";
-		#sound-dai-cells = <1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2s2_bus>;
-		status = "disabled";
-	};
+		i2s1: i2s@12D60000 {
+			compatible = "samsung,exynos5420-i2s";
+			reg = <0x12D60000 0x100>;
+			dmas = <&pdma1 12
+				&pdma1 11>;
+			dma-names = "tx", "rx";
+			clocks = <&clock CLK_I2S1>, <&clock CLK_SCLK_I2S1>;
+			clock-names = "iis", "i2s_opclk0";
+			#clock-cells = <1>;
+			clock-output-names = "i2s_cdclk1";
+			#sound-dai-cells = <1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s1_bus>;
+			status = "disabled";
+		};
 
-	spi_0: spi@12d20000 {
-		compatible = "samsung,exynos4210-spi";
-		reg = <0x12d20000 0x100>;
-		interrupts = <0 68 0>;
-		dmas = <&pdma0 5
-			&pdma0 4>;
-		dma-names = "tx", "rx";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi0_bus>;
-		clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
-		clock-names = "spi", "spi_busclk0";
-		status = "disabled";
-	};
+		i2s2: i2s@12D70000 {
+			compatible = "samsung,exynos5420-i2s";
+			reg = <0x12D70000 0x100>;
+			dmas = <&pdma0 12
+				&pdma0 11>;
+			dma-names = "tx", "rx";
+			clocks = <&clock CLK_I2S2>, <&clock CLK_SCLK_I2S2>;
+			clock-names = "iis", "i2s_opclk0";
+			#clock-cells = <1>;
+			clock-output-names = "i2s_cdclk2";
+			#sound-dai-cells = <1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s2_bus>;
+			status = "disabled";
+		};
 
-	spi_1: spi@12d30000 {
-		compatible = "samsung,exynos4210-spi";
-		reg = <0x12d30000 0x100>;
-		interrupts = <0 69 0>;
-		dmas = <&pdma1 5
-			&pdma1 4>;
-		dma-names = "tx", "rx";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi1_bus>;
-		clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
-		clock-names = "spi", "spi_busclk0";
-		status = "disabled";
-	};
+		spi_0: spi@12d20000 {
+			compatible = "samsung,exynos4210-spi";
+			reg = <0x12d20000 0x100>;
+			interrupts = <0 68 0>;
+			dmas = <&pdma0 5
+				&pdma0 4>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_bus>;
+			clocks = <&clock CLK_SPI0>, <&clock CLK_SCLK_SPI0>;
+			clock-names = "spi", "spi_busclk0";
+			status = "disabled";
+		};
 
-	spi_2: spi@12d40000 {
-		compatible = "samsung,exynos4210-spi";
-		reg = <0x12d40000 0x100>;
-		interrupts = <0 70 0>;
-		dmas = <&pdma0 7
-			&pdma0 6>;
-		dma-names = "tx", "rx";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&spi2_bus>;
-		clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
-		clock-names = "spi", "spi_busclk0";
-		status = "disabled";
-	};
+		spi_1: spi@12d30000 {
+			compatible = "samsung,exynos4210-spi";
+			reg = <0x12d30000 0x100>;
+			interrupts = <0 69 0>;
+			dmas = <&pdma1 5
+				&pdma1 4>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_bus>;
+			clocks = <&clock CLK_SPI1>, <&clock CLK_SCLK_SPI1>;
+			clock-names = "spi", "spi_busclk0";
+			status = "disabled";
+		};
 
-	dp_phy: dp-video-phy {
-		compatible = "samsung,exynos5420-dp-video-phy";
-		samsung,pmu-syscon = <&pmu_system_controller>;
-		#phy-cells = <0>;
-	};
+		spi_2: spi@12d40000 {
+			compatible = "samsung,exynos4210-spi";
+			reg = <0x12d40000 0x100>;
+			interrupts = <0 70 0>;
+			dmas = <&pdma0 7
+				&pdma0 6>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi2_bus>;
+			clocks = <&clock CLK_SPI2>, <&clock CLK_SCLK_SPI2>;
+			clock-names = "spi", "spi_busclk0";
+			status = "disabled";
+		};
 
-	mipi_phy: mipi-video-phy {
-		compatible = "samsung,s5pv210-mipi-video-phy";
-		syscon = <&pmu_system_controller>;
-		#phy-cells = <1>;
-	};
+		dp_phy: dp-video-phy {
+			compatible = "samsung,exynos5420-dp-video-phy";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+		};
 
-	dsi@14500000 {
-		compatible = "samsung,exynos5410-mipi-dsi";
-		reg = <0x14500000 0x10000>;
-		interrupts = <0 82 0>;
-		phys = <&mipi_phy 1>;
-		phy-names = "dsim";
-		clocks = <&clock CLK_DSIM1>, <&clock CLK_SCLK_MIPI1>;
-		clock-names = "bus_clk", "pll_clk";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
-	};
+		mipi_phy: mipi-video-phy {
+			compatible = "samsung,s5pv210-mipi-video-phy";
+			syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+		};
 
-	adc: adc@12D10000 {
-		compatible = "samsung,exynos-adc-v2";
-		reg = <0x12D10000 0x100>;
-		interrupts = <0 106 0>;
-		clocks = <&clock CLK_TSADC>;
-		clock-names = "adc";
-		#io-channel-cells = <1>;
-		io-channel-ranges;
-		samsung,syscon-phandle = <&pmu_system_controller>;
-		status = "disabled";
-	};
+		dsi@14500000 {
+			compatible = "samsung,exynos5410-mipi-dsi";
+			reg = <0x14500000 0x10000>;
+			interrupts = <0 82 0>;
+			phys = <&mipi_phy 1>;
+			phy-names = "dsim";
+			clocks = <&clock CLK_DSIM1>, <&clock CLK_SCLK_MIPI1>;
+			clock-names = "bus_clk", "pll_clk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 
-	i2c_0: i2c@12C60000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C60000 0x100>;
-		interrupts = <0 56 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C0>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c0_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		adc: adc@12D10000 {
+			compatible = "samsung,exynos-adc-v2";
+			reg = <0x12D10000 0x100>;
+			interrupts = <0 106 0>;
+			clocks = <&clock CLK_TSADC>;
+			clock-names = "adc";
+			#io-channel-cells = <1>;
+			io-channel-ranges;
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			status = "disabled";
+		};
 
-	i2c_1: i2c@12C70000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C70000 0x100>;
-		interrupts = <0 57 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C1>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c1_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		i2c_0: i2c@12C60000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C60000 0x100>;
+			interrupts = <0 56 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C0>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	i2c_2: i2c@12C80000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C80000 0x100>;
-		interrupts = <0 58 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C2>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c2_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		i2c_1: i2c@12C70000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C70000 0x100>;
+			interrupts = <0 57 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C1>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	i2c_3: i2c@12C90000 {
-		compatible = "samsung,s3c2440-i2c";
-		reg = <0x12C90000 0x100>;
-		interrupts = <0 59 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clock CLK_I2C3>;
-		clock-names = "i2c";
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c3_bus>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		status = "disabled";
-	};
+		i2c_2: i2c@12C80000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C80000 0x100>;
+			interrupts = <0 58 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C2>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	hsi2c_4: i2c@12CA0000 {
-		compatible = "samsung,exynos5-hsi2c";
-		reg = <0x12CA0000 0x1000>;
-		interrupts = <0 60 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c4_hs_bus>;
-		clocks = <&clock CLK_USI0>;
-		clock-names = "hsi2c";
-		status = "disabled";
-	};
+		i2c_3: i2c@12C90000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x12C90000 0x100>;
+			interrupts = <0 59 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clock CLK_I2C3>;
+			clock-names = "i2c";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_bus>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			status = "disabled";
+		};
 
-	hsi2c_5: i2c@12CB0000 {
-		compatible = "samsung,exynos5-hsi2c";
-		reg = <0x12CB0000 0x1000>;
-		interrupts = <0 61 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c5_hs_bus>;
-		clocks = <&clock CLK_USI1>;
-		clock-names = "hsi2c";
-		status = "disabled";
-	};
+		hsi2c_4: i2c@12CA0000 {
+			compatible = "samsung,exynos5-hsi2c";
+			reg = <0x12CA0000 0x1000>;
+			interrupts = <0 60 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4_hs_bus>;
+			clocks = <&clock CLK_USI0>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 
-	hsi2c_6: i2c@12CC0000 {
-		compatible = "samsung,exynos5-hsi2c";
-		reg = <0x12CC0000 0x1000>;
-		interrupts = <0 62 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c6_hs_bus>;
-		clocks = <&clock CLK_USI2>;
-		clock-names = "hsi2c";
-		status = "disabled";
-	};
+		hsi2c_5: i2c@12CB0000 {
+			compatible = "samsung,exynos5-hsi2c";
+			reg = <0x12CB0000 0x1000>;
+			interrupts = <0 61 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c5_hs_bus>;
+			clocks = <&clock CLK_USI1>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 
-	hsi2c_7: i2c@12CD0000 {
-		compatible = "samsung,exynos5-hsi2c";
-		reg = <0x12CD0000 0x1000>;
-		interrupts = <0 63 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c7_hs_bus>;
-		clocks = <&clock CLK_USI3>;
-		clock-names = "hsi2c";
-		status = "disabled";
-	};
+		hsi2c_6: i2c@12CC0000 {
+			compatible = "samsung,exynos5-hsi2c";
+			reg = <0x12CC0000 0x1000>;
+			interrupts = <0 62 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c6_hs_bus>;
+			clocks = <&clock CLK_USI2>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 
-	hsi2c_8: i2c@12E00000 {
-		compatible = "samsung,exynos5-hsi2c";
-		reg = <0x12E00000 0x1000>;
-		interrupts = <0 87 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c8_hs_bus>;
-		clocks = <&clock CLK_USI4>;
-		clock-names = "hsi2c";
-		status = "disabled";
-	};
+		hsi2c_7: i2c@12CD0000 {
+			compatible = "samsung,exynos5-hsi2c";
+			reg = <0x12CD0000 0x1000>;
+			interrupts = <0 63 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c7_hs_bus>;
+			clocks = <&clock CLK_USI3>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 
-	hsi2c_9: i2c@12E10000 {
-		compatible = "samsung,exynos5-hsi2c";
-		reg = <0x12E10000 0x1000>;
-		interrupts = <0 88 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c9_hs_bus>;
-		clocks = <&clock CLK_USI5>;
-		clock-names = "hsi2c";
-		status = "disabled";
-	};
+		hsi2c_8: i2c@12E00000 {
+			compatible = "samsung,exynos5-hsi2c";
+			reg = <0x12E00000 0x1000>;
+			interrupts = <0 87 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c8_hs_bus>;
+			clocks = <&clock CLK_USI4>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 
-	hsi2c_10: i2c@12E20000 {
-		compatible = "samsung,exynos5-hsi2c";
-		reg = <0x12E20000 0x1000>;
-		interrupts = <0 203 0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c10_hs_bus>;
-		clocks = <&clock CLK_USI6>;
-		clock-names = "hsi2c";
-		status = "disabled";
-	};
+		hsi2c_9: i2c@12E10000 {
+			compatible = "samsung,exynos5-hsi2c";
+			reg = <0x12E10000 0x1000>;
+			interrupts = <0 88 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c9_hs_bus>;
+			clocks = <&clock CLK_USI5>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 
-	hdmi: hdmi@14530000 {
-		compatible = "samsung,exynos5420-hdmi";
-		reg = <0x14530000 0x70000>;
-		interrupts = <0 95 0>;
-		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
-			 <&clock CLK_DOUT_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
-			 <&clock CLK_MOUT_HDMI>;
-		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
-			"sclk_hdmiphy", "mout_hdmi";
-		phy = <&hdmiphy>;
-		samsung,syscon-phandle = <&pmu_system_controller>;
-		status = "disabled";
-		power-domains = <&disp_pd>;
-	};
+		hsi2c_10: i2c@12E20000 {
+			compatible = "samsung,exynos5-hsi2c";
+			reg = <0x12E20000 0x1000>;
+			interrupts = <0 203 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c10_hs_bus>;
+			clocks = <&clock CLK_USI6>;
+			clock-names = "hsi2c";
+			status = "disabled";
+		};
 
-	hdmiphy: hdmiphy@145D0000 {
-		reg = <0x145D0000 0x20>;
-	};
+		hdmi: hdmi@14530000 {
+			compatible = "samsung,exynos5420-hdmi";
+			reg = <0x14530000 0x70000>;
+			interrupts = <0 95 0>;
+			clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
+				 <&clock CLK_DOUT_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
+				 <&clock CLK_MOUT_HDMI>;
+			clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
+				"sclk_hdmiphy", "mout_hdmi";
+			phy = <&hdmiphy>;
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			status = "disabled";
+			power-domains = <&disp_pd>;
+		};
 
-	mixer: mixer@14450000 {
-		compatible = "samsung,exynos5420-mixer";
-		reg = <0x14450000 0x10000>;
-		interrupts = <0 94 0>;
-		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
-			 <&clock CLK_SCLK_HDMI>;
-		clock-names = "mixer", "hdmi", "sclk_hdmi";
-		power-domains = <&disp_pd>;
-		iommus = <&sysmmu_tv>;
-	};
+		hdmiphy: hdmiphy@145D0000 {
+			reg = <0x145D0000 0x20>;
+		};
 
-	rotator: rotator@11C00000 {
-		compatible = "samsung,exynos5250-rotator";
-		reg = <0x11C00000 0x64>;
-		interrupts = <0 84 0>;
-		clocks = <&clock CLK_ROTATOR>;
-		clock-names = "rotator";
-		iommus = <&sysmmu_rotator>;
-	};
+		mixer: mixer@14450000 {
+			compatible = "samsung,exynos5420-mixer";
+			reg = <0x14450000 0x10000>;
+			interrupts = <0 94 0>;
+			clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+				 <&clock CLK_SCLK_HDMI>;
+			clock-names = "mixer", "hdmi", "sclk_hdmi";
+			power-domains = <&disp_pd>;
+			iommus = <&sysmmu_tv>;
+		};
 
-	gsc_0: video-scaler@13e00000 {
-		compatible = "samsung,exynos5-gsc";
-		reg = <0x13e00000 0x1000>;
-		interrupts = <0 85 0>;
-		clocks = <&clock CLK_GSCL0>;
-		clock-names = "gscl";
-		power-domains = <&gsc_pd>;
-		iommus = <&sysmmu_gscl0>;
-	};
+		rotator: rotator@11C00000 {
+			compatible = "samsung,exynos5250-rotator";
+			reg = <0x11C00000 0x64>;
+			interrupts = <0 84 0>;
+			clocks = <&clock CLK_ROTATOR>;
+			clock-names = "rotator";
+			iommus = <&sysmmu_rotator>;
+		};
 
-	gsc_1: video-scaler@13e10000 {
-		compatible = "samsung,exynos5-gsc";
-		reg = <0x13e10000 0x1000>;
-		interrupts = <0 86 0>;
-		clocks = <&clock CLK_GSCL1>;
-		clock-names = "gscl";
-		power-domains = <&gsc_pd>;
-		iommus = <&sysmmu_gscl1>;
-	};
+		gsc_0: video-scaler@13e00000 {
+			compatible = "samsung,exynos5-gsc";
+			reg = <0x13e00000 0x1000>;
+			interrupts = <0 85 0>;
+			clocks = <&clock CLK_GSCL0>;
+			clock-names = "gscl";
+			power-domains = <&gsc_pd>;
+			iommus = <&sysmmu_gscl0>;
+		};
 
-	jpeg_0: jpeg@11F50000 {
-		compatible = "samsung,exynos5420-jpeg";
-		reg = <0x11F50000 0x1000>;
-		interrupts = <0 89 0>;
-		clock-names = "jpeg";
-		clocks = <&clock CLK_JPEG>;
-		iommus = <&sysmmu_jpeg0>;
-	};
+		gsc_1: video-scaler@13e10000 {
+			compatible = "samsung,exynos5-gsc";
+			reg = <0x13e10000 0x1000>;
+			interrupts = <0 86 0>;
+			clocks = <&clock CLK_GSCL1>;
+			clock-names = "gscl";
+			power-domains = <&gsc_pd>;
+			iommus = <&sysmmu_gscl1>;
+		};
 
-	jpeg_1: jpeg@11F60000 {
-		compatible = "samsung,exynos5420-jpeg";
-		reg = <0x11F60000 0x1000>;
-		interrupts = <0 168 0>;
-		clock-names = "jpeg";
-		clocks = <&clock CLK_JPEG2>;
-		iommus = <&sysmmu_jpeg1>;
-	};
+		jpeg_0: jpeg@11F50000 {
+			compatible = "samsung,exynos5420-jpeg";
+			reg = <0x11F50000 0x1000>;
+			interrupts = <0 89 0>;
+			clock-names = "jpeg";
+			clocks = <&clock CLK_JPEG>;
+			iommus = <&sysmmu_jpeg0>;
+		};
 
-	pmu_system_controller: system-controller@10040000 {
-		compatible = "samsung,exynos5420-pmu", "syscon";
-		reg = <0x10040000 0x5000>;
-		clock-names = "clkout16";
-		clocks = <&clock CLK_FIN_PLL>;
-		#clock-cells = <1>;
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&gic>;
-	};
+		jpeg_1: jpeg@11F60000 {
+			compatible = "samsung,exynos5420-jpeg";
+			reg = <0x11F60000 0x1000>;
+			interrupts = <0 168 0>;
+			clock-names = "jpeg";
+			clocks = <&clock CLK_JPEG2>;
+			iommus = <&sysmmu_jpeg1>;
+		};
 
-	tmu_cpu0: tmu@10060000 {
-		compatible = "samsung,exynos5420-tmu";
-		reg = <0x10060000 0x100>;
-		interrupts = <0 65 0>;
-		clocks = <&clock CLK_TMU>;
-		clock-names = "tmu_apbif";
-		#include "exynos4412-tmu-sensor-conf.dtsi"
-	};
+		pmu_system_controller: system-controller@10040000 {
+			compatible = "samsung,exynos5420-pmu", "syscon";
+			reg = <0x10040000 0x5000>;
+			clock-names = "clkout16";
+			clocks = <&clock CLK_FIN_PLL>;
+			#clock-cells = <1>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+		};
 
-	tmu_cpu1: tmu@10064000 {
-		compatible = "samsung,exynos5420-tmu";
-		reg = <0x10064000 0x100>;
-		interrupts = <0 183 0>;
-		clocks = <&clock CLK_TMU>;
-		clock-names = "tmu_apbif";
-		#include "exynos4412-tmu-sensor-conf.dtsi"
-	};
+		tmu_cpu0: tmu@10060000 {
+			compatible = "samsung,exynos5420-tmu";
+			reg = <0x10060000 0x100>;
+			interrupts = <0 65 0>;
+			clocks = <&clock CLK_TMU>;
+			clock-names = "tmu_apbif";
+			#include "exynos4412-tmu-sensor-conf.dtsi"
+		};
 
-	tmu_cpu2: tmu@10068000 {
-		compatible = "samsung,exynos5420-tmu-ext-triminfo";
-		reg = <0x10068000 0x100>, <0x1006c000 0x4>;
-		interrupts = <0 184 0>;
-		clocks = <&clock CLK_TMU>, <&clock CLK_TMU>;
-		clock-names = "tmu_apbif", "tmu_triminfo_apbif";
-		#include "exynos4412-tmu-sensor-conf.dtsi"
-	};
+		tmu_cpu1: tmu@10064000 {
+			compatible = "samsung,exynos5420-tmu";
+			reg = <0x10064000 0x100>;
+			interrupts = <0 183 0>;
+			clocks = <&clock CLK_TMU>;
+			clock-names = "tmu_apbif";
+			#include "exynos4412-tmu-sensor-conf.dtsi"
+		};
 
-	tmu_cpu3: tmu@1006c000 {
-		compatible = "samsung,exynos5420-tmu-ext-triminfo";
-		reg = <0x1006c000 0x100>, <0x100a0000 0x4>;
-		interrupts = <0 185 0>;
-		clocks = <&clock CLK_TMU>, <&clock CLK_TMU_GPU>;
-		clock-names = "tmu_apbif", "tmu_triminfo_apbif";
-		#include "exynos4412-tmu-sensor-conf.dtsi"
-	};
+		tmu_cpu2: tmu@10068000 {
+			compatible = "samsung,exynos5420-tmu-ext-triminfo";
+			reg = <0x10068000 0x100>, <0x1006c000 0x4>;
+			interrupts = <0 184 0>;
+			clocks = <&clock CLK_TMU>, <&clock CLK_TMU>;
+			clock-names = "tmu_apbif", "tmu_triminfo_apbif";
+			#include "exynos4412-tmu-sensor-conf.dtsi"
+		};
 
-	tmu_gpu: tmu@100a0000 {
-		compatible = "samsung,exynos5420-tmu-ext-triminfo";
-		reg = <0x100a0000 0x100>, <0x10068000 0x4>;
-		interrupts = <0 215 0>;
-		clocks = <&clock CLK_TMU_GPU>, <&clock CLK_TMU>;
-		clock-names = "tmu_apbif", "tmu_triminfo_apbif";
-		#include "exynos4412-tmu-sensor-conf.dtsi"
-	};
+		tmu_cpu3: tmu@1006c000 {
+			compatible = "samsung,exynos5420-tmu-ext-triminfo";
+			reg = <0x1006c000 0x100>, <0x100a0000 0x4>;
+			interrupts = <0 185 0>;
+			clocks = <&clock CLK_TMU>, <&clock CLK_TMU_GPU>;
+			clock-names = "tmu_apbif", "tmu_triminfo_apbif";
+			#include "exynos4412-tmu-sensor-conf.dtsi"
+		};
 
-	thermal-zones {
-		cpu0_thermal: cpu0-thermal {
-			thermal-sensors = <&tmu_cpu0>;
-			#include "exynos5420-trip-points.dtsi"
+		tmu_gpu: tmu@100a0000 {
+			compatible = "samsung,exynos5420-tmu-ext-triminfo";
+			reg = <0x100a0000 0x100>, <0x10068000 0x4>;
+			interrupts = <0 215 0>;
+			clocks = <&clock CLK_TMU_GPU>, <&clock CLK_TMU>;
+			clock-names = "tmu_apbif", "tmu_triminfo_apbif";
+			#include "exynos4412-tmu-sensor-conf.dtsi"
 		};
-		cpu1_thermal: cpu1-thermal {
-		       thermal-sensors = <&tmu_cpu1>;
-		       #include "exynos5420-trip-points.dtsi"
+
+		watchdog: watchdog@101D0000 {
+			compatible = "samsung,exynos5420-wdt";
+			reg = <0x101D0000 0x100>;
+			interrupts = <0 42 0>;
+			clocks = <&clock CLK_WDT>;
+			clock-names = "watchdog";
+			samsung,syscon-phandle = <&pmu_system_controller>;
 		};
-		cpu2_thermal: cpu2-thermal {
-		       thermal-sensors = <&tmu_cpu2>;
-		       #include "exynos5420-trip-points.dtsi"
+
+		sss: sss@10830000 {
+			compatible = "samsung,exynos4210-secss";
+			reg = <0x10830000 0x300>;
+			interrupts = <0 112 0>;
+			clocks = <&clock CLK_SSS>;
+			clock-names = "secss";
 		};
-		cpu3_thermal: cpu3-thermal {
-		       thermal-sensors = <&tmu_cpu3>;
-		       #include "exynos5420-trip-points.dtsi"
+
+		usbdrd3_0: usb3-0 {
+			compatible = "samsung,exynos5250-dwusb3";
+			clocks = <&clock CLK_USBD300>;
+			clock-names = "usbdrd30";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			usbdrd_dwc3_0: dwc3@12000000 {
+				compatible = "snps,dwc3";
+				reg = <0x12000000 0x10000>;
+				interrupts = <0 72 0>;
+				phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
 		};
-		gpu_thermal: gpu-thermal {
-		       thermal-sensors = <&tmu_gpu>;
-		       #include "exynos5420-trip-points.dtsi"
+
+		usbdrd_phy0: phy@12100000 {
+			compatible = "samsung,exynos5420-usbdrd-phy";
+			reg = <0x12100000 0x100>;
+			clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
 		};
-	};
 
-        watchdog: watchdog@101D0000 {
-		compatible = "samsung,exynos5420-wdt";
-		reg = <0x101D0000 0x100>;
-		interrupts = <0 42 0>;
-		clocks = <&clock CLK_WDT>;
-		clock-names = "watchdog";
-		samsung,syscon-phandle = <&pmu_system_controller>;
-        };
-
-	sss: sss@10830000 {
-		compatible = "samsung,exynos4210-secss";
-		reg = <0x10830000 0x300>;
-		interrupts = <0 112 0>;
-		clocks = <&clock CLK_SSS>;
-		clock-names = "secss";
-	};
+		usbdrd3_1: usb3-1 {
+			compatible = "samsung,exynos5250-dwusb3";
+			clocks = <&clock CLK_USBD301>;
+			clock-names = "usbdrd30";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			usbdrd_dwc3_1: dwc3@12400000 {
+				compatible = "snps,dwc3";
+				reg = <0x12400000 0x10000>;
+				interrupts = <0 73 0>;
+				phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
 
-	usbdrd3_0: usb3-0 {
-		compatible = "samsung,exynos5250-dwusb3";
-		clocks = <&clock CLK_USBD300>;
-		clock-names = "usbdrd30";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		usbdrd_dwc3_0: dwc3@12000000 {
-			compatible = "snps,dwc3";
-			reg = <0x12000000 0x10000>;
-			interrupts = <0 72 0>;
-			phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
-			phy-names = "usb2-phy", "usb3-phy";
+		usbdrd_phy1: phy@12500000 {
+			compatible = "samsung,exynos5420-usbdrd-phy";
+			reg = <0x12500000 0x100>;
+			clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
 		};
-	};
 
-	usbdrd_phy0: phy@12100000 {
-		compatible = "samsung,exynos5420-usbdrd-phy";
-		reg = <0x12100000 0x100>;
-		clocks = <&clock CLK_USBD300>, <&clock CLK_SCLK_USBPHY300>;
-		clock-names = "phy", "ref";
-		samsung,pmu-syscon = <&pmu_system_controller>;
-		#phy-cells = <1>;
-	};
+		usbhost2: usb@12110000 {
+			compatible = "samsung,exynos4210-ehci";
+			reg = <0x12110000 0x100>;
+			interrupts = <0 71 0>;
 
-	usbdrd3_1: usb3-1 {
-		compatible = "samsung,exynos5250-dwusb3";
-		clocks = <&clock CLK_USBD301>;
-		clock-names = "usbdrd30";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		usbdrd_dwc3_1: dwc3@12400000 {
-			compatible = "snps,dwc3";
-			reg = <0x12400000 0x10000>;
-			interrupts = <0 73 0>;
-			phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
-			phy-names = "usb2-phy", "usb3-phy";
+			clocks = <&clock CLK_USBH20>;
+			clock-names = "usbhost";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				phys = <&usb2_phy 1>;
+			};
 		};
-	};
 
-	usbdrd_phy1: phy@12500000 {
-		compatible = "samsung,exynos5420-usbdrd-phy";
-		reg = <0x12500000 0x100>;
-		clocks = <&clock CLK_USBD301>, <&clock CLK_SCLK_USBPHY301>;
-		clock-names = "phy", "ref";
-		samsung,pmu-syscon = <&pmu_system_controller>;
-		#phy-cells = <1>;
-	};
-
-	usbhost2: usb@12110000 {
-		compatible = "samsung,exynos4210-ehci";
-		reg = <0x12110000 0x100>;
-		interrupts = <0 71 0>;
+		usbhost1: usb@12120000 {
+			compatible = "samsung,exynos4210-ohci";
+			reg = <0x12120000 0x100>;
+			interrupts = <0 71 0>;
 
-		clocks = <&clock CLK_USBH20>;
-		clock-names = "usbhost";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-			reg = <0>;
-			phys = <&usb2_phy 1>;
+			clocks = <&clock CLK_USBH20>;
+			clock-names = "usbhost";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				phys = <&usb2_phy 1>;
+			};
 		};
-	};
 
-	usbhost1: usb@12120000 {
-		compatible = "samsung,exynos4210-ohci";
-		reg = <0x12120000 0x100>;
-		interrupts = <0 71 0>;
-
-		clocks = <&clock CLK_USBH20>;
-		clock-names = "usbhost";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-			reg = <0>;
-			phys = <&usb2_phy 1>;
+		usb2_phy: phy@12130000 {
+			compatible = "samsung,exynos5250-usb2-phy";
+			reg = <0x12130000 0x100>;
+			clocks = <&clock CLK_USBH20>, <&clock CLK_SCLK_USBPHY300>;
+			clock-names = "phy", "ref";
+			#phy-cells = <1>;
+			samsung,sysreg-phandle = <&sysreg_system_controller>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
 		};
-	};
 
-	usb2_phy: phy@12130000 {
-		compatible = "samsung,exynos5250-usb2-phy";
-		reg = <0x12130000 0x100>;
-		clocks = <&clock CLK_USBH20>, <&clock CLK_SCLK_USBPHY300>;
-		clock-names = "phy", "ref";
-		#phy-cells = <1>;
-		samsung,sysreg-phandle = <&sysreg_system_controller>;
-		samsung,pmureg-phandle = <&pmu_system_controller>;
-	};
+		sysmmu_g2dr: sysmmu@0x10A60000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x10A60000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <24 5>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_g2dr: sysmmu@0x10A60000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x10A60000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <24 5>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_g2dw: sysmmu@0x10A70000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x10A70000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <22 2>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_g2dw: sysmmu@0x10A70000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x10A70000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <22 2>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_G2D>, <&clock CLK_G2D>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_tv: sysmmu@0x14650000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14650000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <7 4>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MIXER>, <&clock CLK_MIXER>;
+			power-domains = <&disp_pd>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_tv: sysmmu@0x14650000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x14650000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <7 4>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MIXER>, <&clock CLK_MIXER>;
-		power-domains = <&disp_pd>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_gscl0: sysmmu@0x13E80000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13E80000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <2 0>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_GSCL0>, <&clock CLK_GSCL0>;
+			power-domains = <&gsc_pd>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_gscl0: sysmmu@0x13E80000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13E80000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <2 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_GSCL0>, <&clock CLK_GSCL0>;
-		power-domains = <&gsc_pd>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_gscl1: sysmmu@0x13E90000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x13E90000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <2 2>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_GSCL1>, <&clock CLK_GSCL1>;
+			power-domains = <&gsc_pd>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_gscl1: sysmmu@0x13E90000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13E90000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <2 2>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_GSCL1>, <&clock CLK_GSCL1>;
-		power-domains = <&gsc_pd>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_scaler0r: sysmmu@0x12880000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x12880000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <22 4>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MSCL0>, <&clock CLK_MSCL0>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_scaler0r: sysmmu@0x12880000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x12880000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <22 4>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MSCL0>, <&clock CLK_MSCL0>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_scaler1r: sysmmu@0x12890000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x12890000 0x1000>;
+			interrupts = <0 186 0>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MSCL1>, <&clock CLK_MSCL1>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_scaler1r: sysmmu@0x12890000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x12890000 0x1000>;
-		interrupts = <0 186 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MSCL1>, <&clock CLK_MSCL1>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_scaler2r: sysmmu@0x128A0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x128A0000 0x1000>;
+			interrupts = <0 188 0>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MSCL2>, <&clock CLK_MSCL2>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_scaler2r: sysmmu@0x128A0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x128A0000 0x1000>;
-		interrupts = <0 188 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MSCL2>, <&clock CLK_MSCL2>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_scaler0w: sysmmu@0x128C0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x128C0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <27 2>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MSCL0>, <&clock CLK_MSCL0>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_scaler0w: sysmmu@0x128C0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x128C0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <27 2>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MSCL0>, <&clock CLK_MSCL0>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_scaler1w: sysmmu@0x128D0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x128D0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <22 6>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MSCL1>, <&clock CLK_MSCL1>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_scaler1w: sysmmu@0x128D0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x128D0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <22 6>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MSCL1>, <&clock CLK_MSCL1>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_scaler2w: sysmmu@0x128E0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x128E0000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <19 6>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MSCL2>, <&clock CLK_MSCL2>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_scaler2w: sysmmu@0x128E0000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x128E0000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <19 6>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MSCL2>, <&clock CLK_MSCL2>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_rotator: sysmmu@0x11D40000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11D40000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <4 0>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_rotator: sysmmu@0x11D40000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11D40000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <4 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_ROTATOR>, <&clock CLK_ROTATOR>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_jpeg0: sysmmu@0x11F10000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11F10000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <4 2>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_JPEG>, <&clock CLK_JPEG>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_jpeg0: sysmmu@0x11F10000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11F10000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <4 2>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_JPEG>, <&clock CLK_JPEG>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_jpeg1: sysmmu@0x11F20000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11F20000 0x1000>;
+			interrupts = <0 169 0>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_JPEG2>, <&clock CLK_JPEG2>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_jpeg1: sysmmu@0x11F20000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11F20000 0x1000>;
-		interrupts = <0 169 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_JPEG2>, <&clock CLK_JPEG2>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_mfc_l: sysmmu@0x11200000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11200000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <6 2>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MFCL>, <&clock CLK_MFC>;
+			power-domains = <&mfc_pd>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_mfc_l: sysmmu@0x11200000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11200000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <6 2>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MFCL>, <&clock CLK_MFC>;
-		power-domains = <&mfc_pd>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_mfc_r: sysmmu@0x11210000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x11210000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <8 5>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_MFCR>, <&clock CLK_MFC>;
+			power-domains = <&mfc_pd>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_mfc_r: sysmmu@0x11210000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x11210000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <8 5>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_MFCR>, <&clock CLK_MFC>;
-		power-domains = <&mfc_pd>;
-		#iommu-cells = <0>;
-	};
+		sysmmu_fimd1_0: sysmmu@0x14640000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14640000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <3 2>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMD1M0>, <&clock CLK_FIMD1>;
+			power-domains = <&disp_pd>;
+			#iommu-cells = <0>;
+		};
 
-	sysmmu_fimd1_0: sysmmu@0x14640000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x14640000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <3 2>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_FIMD1M0>, <&clock CLK_FIMD1>;
-		power-domains = <&disp_pd>;
-		#iommu-cells = <0>;
+		sysmmu_fimd1_1: sysmmu@0x14680000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14680000 0x1000>;
+			interrupt-parent = <&combiner>;
+			interrupts = <3 0>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMD1M1>, <&clock CLK_FIMD1>;
+			power-domains = <&disp_pd>;
+			#iommu-cells = <0>;
+		};
 	};
 
-	sysmmu_fimd1_1: sysmmu@0x14680000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x14680000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <3 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_FIMD1M1>, <&clock CLK_FIMD1>;
-		power-domains = <&disp_pd>;
-		#iommu-cells = <0>;
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			thermal-sensors = <&tmu_cpu0>;
+			#include "exynos5420-trip-points.dtsi"
+		};
+		cpu1_thermal: cpu1-thermal {
+		       thermal-sensors = <&tmu_cpu1>;
+		       #include "exynos5420-trip-points.dtsi"
+		};
+		cpu2_thermal: cpu2-thermal {
+		       thermal-sensors = <&tmu_cpu2>;
+		       #include "exynos5420-trip-points.dtsi"
+		};
+		cpu3_thermal: cpu3-thermal {
+		       thermal-sensors = <&tmu_cpu3>;
+		       #include "exynos5420-trip-points.dtsi"
+		};
+		gpu_thermal: gpu-thermal {
+		       thermal-sensors = <&tmu_gpu>;
+		       #include "exynos5420-trip-points.dtsi"
+		};
 	};
 };
 
-- 
2.5.0
