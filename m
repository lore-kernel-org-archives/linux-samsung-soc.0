From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 4/7] arm64: dts: exynos: Add GPU/Mali T760 node to Exynos7
Date: Fri, 21 Jun 2019 20:02:05 +0200
Message-ID: <20190621180208.25361-4-krzk@kernel.org>
References: <20190621180208.25361-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621180208.25361-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add nodes for GPU (Mali T760) to Exynos7.  Current support for Exynos7
misses a lot, including proper clocks, power domains, frequency and
voltage scaling and cooling.  However this still can provide basic GPU
description.  Not tested on HW.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts |  5 +++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 00dd89b92b42..080e0f56e108 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -59,6 +59,11 @@
 	clock-frequency = <24000000>;
 };
 
+&gpu {
+	mali-supply = <&buck6_reg>;
+	status = "okay";
+};
+
 &serial_2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 077d23478901..bcb9d8cee267 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -78,6 +78,17 @@
 		};
 	};
 
+	gpu: gpu@14ac0000 {
+		compatible = "samsung,exynos5433-mali", "arm,mali-t760";
+		reg = <0x14ac0000 0x5000>;
+		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		status = "disabled";
+		/* TODO: operating points for DVFS, cooling device */
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
-- 
2.17.1
