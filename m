From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 12/14] ARM: dts: exynos4412-trats: Switch max77686
 regulators to GPIO control
Date: Thu, 30 Oct 2014 12:20:51 +0100
Message-ID: <1414668053-31370-13-git-send-email-k.kozlowski@samsung.com>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Remove fixed regulators (duplicating what max77686 provides) and
add GPIO control to max77686 regulators. Add of_compatible to
voltage-regulators node.

This gives the system full control over those regulators. Previously
the state of such regulators was a mixture of what max77686 driver set
over I2C and what regulator-fixed set through GPIO.

Removal of 'regulator-always-on' from CAM_ISP_CORE_1.2V (buck9) allows
disabling it when it is not used. Previously this regulator was always
enabled because its enable state is a OR of:
 - ENB9 GPIO (turned by regulator-fixed),
 - BUCK9EN field in BUCK9CTRL register (max77686 through I2C).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 7a68e0832cd6..ebbd12d1fe9a 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -58,15 +58,6 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		vemmc_reg: regulator-0 {
-			compatible = "regulator-fixed";
-			regulator-name = "VMEM_VDD_2.8V";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpk0 2 0>;
-			enable-active-high;
-		};
-
 		cam_io_reg: voltage-regulator-1 {
 			compatible = "regulator-fixed";
 			regulator-name = "CAM_SENSOR_A";
@@ -94,16 +85,6 @@
 			enable-active-high;
 		};
 
-		cam_isp_core_reg: voltage-regulator-4 {
-			compatible = "regulator-fixed";
-			regulator-name = "CAM_ISP_CORE_1.2V_EN";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			gpio = <&gpm0 3 0>;
-			enable-active-high;
-			regulator-always-on;
-		};
-
 		ps_als_reg: voltage-regulator-5 {
 			compatible = "regulator-fixed";
 			regulator-name = "LED_A_3.0V";
@@ -221,6 +202,13 @@
 			#clock-cells = <1>;
 
 			voltage-regulators {
+				compatible = "maxim,max77686-pmic";
+
+				ldo21-gpio = <&gpy2 0 GPIO_ACTIVE_HIGH>;
+				ldo22-gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
+				buck8-gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
+				buck9-gpio = <&gpm0 3 GPIO_ACTIVE_HIGH>;
+
 				ldo1_reg: ldo1 {
 					regulator-compatible = "LDO1";
 					regulator-name = "VALIVE_1.0V_AP";
@@ -591,7 +579,7 @@
 		broken-cd;
 		non-removable;
 		card-detect-delay = <200>;
-		vmmc-supply = <&vemmc_reg>;
+		vmmc-supply = <&ldo22_reg>;
 		clock-frequency = <400000000>;
 		samsung,dw-mshc-ciu-div = <0>;
 		samsung,dw-mshc-sdr-timing = <2 3>;
-- 
1.9.1
