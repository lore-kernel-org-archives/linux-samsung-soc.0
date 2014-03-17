From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/9] ARM: dts: exynos4210-universal: add exynos/fimd node
Date: Mon, 17 Mar 2014 11:27:22 +0100
Message-ID: <1395052045-23848-7-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Denis Carikli <denis@eukrea.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds fimd node with display timings for exynos4210-universal device.
It also makes LCD regulators always on. This allow to re-use panel initialized
by boot loader.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index d2e3f5f..21ca0b978 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -225,6 +225,7 @@
 					regulator-name = "VLCD+VMIPI_1.8V";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
 				};
 
 				ldo8_reg: LDO8 {
@@ -288,6 +289,7 @@
 					regulator-name = "VCC_3.0V_LCD";
 					regulator-min-microvolt = <3000000>;
 					regulator-max-microvolt = <3000000>;
+					regulator-always-on;
 				};
 
 				buck1_reg: BUCK1 {
@@ -345,6 +347,29 @@
 		};
 	};
 
+	fimd: fimd@11c00000 {
+		pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
+		pinctrl-names = "default";
+		status = "okay";
+		display-timings {
+			timing {
+				clock-frequency = <23492370>;
+				hactive = <480>;
+				vactive = <800>;
+				hback-porch = <16>;
+				hfront-porch = <16>;
+				vback-porch = <2>;
+				vfront-porch = <28>;
+				hsync-len = <2>;
+				vsync-len = <1>;
+				hsync-active = <0>;
+				vsync-active = <0>;
+				de-active = <0>;
+				pixelclk-active = <0>;
+			};
+		};
+	};
+
 	pwm@139D0000 {
 		compatible = "samsung,s5p6440-pwm";
 		status = "okay";
-- 
1.8.3.2
