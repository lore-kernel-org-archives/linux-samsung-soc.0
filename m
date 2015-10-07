From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/5] ARM: dts: Use GPIO constants for flags cells in exynos3250 boards
Date: Wed,  7 Oct 2015 15:14:13 +0200
Message-ID: <1444223657-7248-2-git-send-email-javier@osg.samsung.com>
References: <1444223657-7248-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444223657-7248-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The board DTS are using numeric values instead of the defined GPIO
constanst to express polarity, use them to make the DTS more clear.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/exynos3250-monk.dts   |  8 ++++----
 arch/arm/boot/dts/exynos3250-rinato.dts | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 540a0adf2be6..c14129e0761d 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -52,13 +52,13 @@
 		regulator-name = "V_EMMC_2.8V-fixed";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk0 2 0>;
+		gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
 	i2c_max77836: i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&gpd0 2 0>, <&gpd0 3 0>;
+		gpios = <&gpd0 2 GPIO_ACTIVE_HIGH>, <&gpd0 3 GPIO_ACTIVE_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -266,14 +266,14 @@
 				regulator-name = "V_EMMC_1.8V";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				samsung,ext-control-gpios = <&gpk0 2 0>;
+				samsung,ext-control-gpios = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 			};
 
 			ldo12_reg: LDO12 {
 				regulator-name = "V_EMMC_2.8V";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
-				samsung,ext-control-gpios = <&gpk0 2 0>;
+				samsung,ext-control-gpios = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 			};
 
 			ldo13_reg: LDO13 {
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 41a5fafb9aa9..830e216f7e10 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -49,7 +49,7 @@
 
 	i2c_max77836: i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&gpd0 2 0>, <&gpd0 3 0>;
+		gpios = <&gpd0 2 GPIO_ACTIVE_HIGH>, <&gpd0 3 GPIO_ACTIVE_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -188,8 +188,8 @@
 		reg = <0>;
 		vdd3-supply = <&ldo16_reg>;
 		vci-supply = <&ldo20_reg>;
-		reset-gpios = <&gpe0 1 0>;
-		te-gpios = <&gpx0 6 0>;
+		reset-gpios = <&gpe0 1 GPIO_ACTIVE_HIGH>;
+		te-gpios = <&gpx0 6 GPIO_ACTIVE_HIGH>;
 		power-on-delay= <30>;
 		power-off-delay= <120>;
 		reset-delay = <5>;
@@ -368,14 +368,14 @@
 				regulator-name = "V_EMMC_1.8V";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				samsung,ext-control-gpios = <&gpk0 2 0>;
+				samsung,ext-control-gpios = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 			};
 
 			ldo12_reg: LDO12 {
 				regulator-name = "V_EMMC_2.8V";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
-				samsung,ext-control-gpios = <&gpk0 2 0>;
+				samsung,ext-control-gpios = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 			};
 
 			ldo13_reg: LDO13 {
-- 
2.4.3
