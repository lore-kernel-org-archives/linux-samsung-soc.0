From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/5] ARM: dts: exynos: Remove regulators node container in Origen and N710x
Date: Tue, 24 Apr 2018 19:46:00 +0200
Message-ID: <20180424174602.3915-3-krzk@kernel.org>
References: <20180424174602.3915-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424174602.3915-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Consistently put fixed regulators directly below root node, instead of
artificial "regulators" node in Exynos4210 Origen and Exynos4412 N710x.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 21 +++++++--------------
 arch/arm/boot/dts/exynos4412-n710x.dts  | 16 +++++++---------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index a81714745820..2ab99f9f3d0a 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -34,20 +34,13 @@
 		stdout-path = &serial_2;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		mmc_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "VMEM_VDD_2.8V";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	mmc_reg: voltage-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VMEM_VDD_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	gpio_keys {
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index eb402a0d6651..36818b1697a4 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -13,15 +13,13 @@
 
 	/* bootargs are passed in by bootloader */
 
-	regulators {
-		cam_vdda_reg: voltage-regulator-9 {
-			compatible = "regulator-fixed";
-			regulator-name = "CAM_SENSOR_CORE_1.2V";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			gpio = <&gpm4 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	cam_vdda_reg: voltage-regulator-9 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_SENSOR_CORE_1.2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&gpm4 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 };
 
-- 
2.14.1
