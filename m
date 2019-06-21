From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/7] arm64: dts: exynos: Add GPU/Mali T760 node to Exynos5433
Date: Fri, 21 Jun 2019 20:02:04 +0200
Message-ID: <20190621180208.25361-3-krzk@kernel.org>
References: <20190621180208.25361-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621180208.25361-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add nodes for GPU (Mali T760) to Exynos5433.  Missing element is the
cooling device.  Not tested on HW.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
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
