From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos4210-universal_c210: add proper panel node
Date: Tue, 25 Mar 2014 13:10:36 +0100
Message-ID: <1395749436-24697-4-git-send-email-a.hajda@samsung.com>
References: <1395749436-24697-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395749436-24697-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM/SAMSUNG ARM A..." <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Thierry Reding <treding@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch replaces panel bindings for panel initialized by boot loader
with bindings to proper ld9040 panel.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 71 +++++++++++++++++++------
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 477208d..0a80a72 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -225,7 +225,6 @@
 					regulator-name = "VLCD+VMIPI_1.8V";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
-					regulator-always-on;
 				};
 
 				ldo8_reg: LDO8 {
@@ -289,7 +288,6 @@
 					regulator-name = "VCC_3.0V_LCD";
 					regulator-min-microvolt = <3000000>;
 					regulator-max-microvolt = <3000000>;
-					regulator-always-on;
 				};
 
 				buck1_reg: BUCK1 {
@@ -347,27 +345,66 @@
 		};
 	};
 
+	spi-lcd {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpy3 1 0>;
+		gpio-mosi = <&gpy3 3 0>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpy4 3 0>;
+
+		lcd@0 {
+			compatible = "samsung,ld9040";
+			reg = <0>;
+			vdd3-supply = <&ldo7_reg>;
+			vci-supply = <&ldo17_reg>;
+			reset-gpios = <&gpy4 5 0>;
+			spi-max-frequency = <1200000>;
+			spi-cpol;
+			spi-cpha;
+			power-on-delay = <10>;
+			reset-delay = <10>;
+			panel-width-mm = <90>;
+			panel-height-mm = <154>;
+			display-timings {
+				timing {
+					clock-frequency = <23492370>;
+					hactive = <480>;
+					vactive = <800>;
+					hback-porch = <16>;
+					hfront-porch = <16>;
+					vback-porch = <2>;
+					vfront-porch = <28>;
+					hsync-len = <2>;
+					vsync-len = <1>;
+					hsync-active = <0>;
+					vsync-active = <0>;
+					de-active = <0>;
+					pixelclk-active = <0>;
+				};
+			};
+			port {
+				lcd_ep: endpoint {
+					remote-endpoint = <&fimd_dpi_ep>;
+				};
+			};
+		};
+	};
+
 	fimd: fimd@11c00000 {
 		pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
 		pinctrl-names = "default";
 		status = "okay";
 		samsung,invert-vden;
 		samsung,invert-vclk;
-		display-timings {
-			timing {
-				clock-frequency = <23492370>;
-				hactive = <480>;
-				vactive = <800>;
-				hback-porch = <16>;
-				hfront-porch = <16>;
-				vback-porch = <2>;
-				vfront-porch = <28>;
-				hsync-len = <2>;
-				vsync-len = <1>;
-				hsync-active = <0>;
-				vsync-active = <0>;
-				de-active = <0>;
-				pixelclk-active = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@3 {
+			reg = <3>;
+			fimd_dpi_ep: endpoint {
+				remote-endpoint = <&lcd_ep>;
 			};
 		};
 	};
-- 
1.8.3.2
