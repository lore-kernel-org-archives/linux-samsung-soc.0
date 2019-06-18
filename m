From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 06/10] arm64: dts: exynos: Add GPU/Mali T760 node to Exynos5433
Date: Tue, 18 Jun 2019 21:05:30 +0200
Message-ID: <20190618190534.4951-7-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add nodes for GPU (Mali T760) to Exynos5433.  Missing element is the
cooling device.  Not tested on HW.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../dts/exynos/exynos5433-tm2-common.dtsi     |  5 ++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 51 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index d2de16645e10..6f90b0e62cba 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -350,6 +350,11 @@
 	pinctrl-0 = <&te_irq>;
 };
 
+&gpu {
+	mali-supply = <&buck6_reg>;
+	status = "okay";
+};
+
 &hdmi {
 	hpd-gpios = <&gpa3 0 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index d29d13f4694f..a76f620f7f35 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -249,6 +249,57 @@
 		};
 	};
 
+	gpu: gpu@14ac0000 {
+		compatible = "samsung,exynos5433-mali", "arm,mali-t760";
+		reg = <0x14ac0000 0x5000>;
+		interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&cmu_g3d CLK_ACLK_G3D>;
+		clock-names = "core";
+		power-domains = <&pd_g3d>;
+		operating-points-v2 = <&gpu_opp_table>;
+		status = "disabled";
+
+		gpu_opp_table: opp_table {
+			compatible = "operating-points-v2";
+
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+				opp-microvolt = <1000000>;
+			};
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+				opp-microvolt = <1000000>;
+			};
+			opp-350000000 {
+				opp-hz = /bits/ 64 <350000000>;
+				opp-microvolt = <1025000>;
+			};
+			opp-420000000 {
+				opp-hz = /bits/ 64 <420000000>;
+				opp-microvolt = <1025000>;
+			};
+			opp-500000000 {
+				opp-hz = /bits/ 64 <500000000>;
+				opp-microvolt = <1075000>;
+			};
+			opp-550000000 {
+				opp-hz = /bits/ 64 <550000000>;
+				opp-microvolt = <1125000>;
+			};
+			opp-600000000 {
+				opp-hz = /bits/ 64 <600000000>;
+				opp-microvolt = <1150000>;
+			};
+			opp-700000000 {
+				opp-hz = /bits/ 64 <700000000>;
+				opp-microvolt = <1150000>;
+			};
+		};
+	};
+
 	psci {
 		compatible = "arm,psci";
 		method = "smc";
-- 
2.17.1
