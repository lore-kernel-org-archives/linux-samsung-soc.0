From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 10/12] ARM: dts: exynos4412-trats2: add panel node
Date: Fri, 28 Mar 2014 12:52:45 +0100
Message-ID: <1396007567-4015-11-git-send-email-a.hajda@samsung.com>
References: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds s6e8aa0 panel node for trats2.
It adds also trats2 specific properties for DSI
and regulator required by panel.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 66 +++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 4f851cc..f7070e9 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -71,6 +71,15 @@
 			enable-active-high;
 		};
 
+		lcd_vdd3_reg: voltage-regulator-2 {
+			compatible = "regulator-fixed";
+			regulator-name = "LCD_VDD_2.2V";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			gpio = <&gpc0 1 0>;
+			enable-active-high;
+		};
+
 		/* More to come */
 	};
 
@@ -511,6 +520,63 @@
 		};
 	};
 
+	dsi_0: dsi@11C80000 {
+		vddcore-supply = <&ldo8_reg>;
+		vddio-supply = <&ldo10_reg>;
+		samsung,pll-clock-frequency = <24000000>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				dsi_out: endpoint {
+					remote-endpoint = <&dsi_in>;
+					samsung,burst-clock-frequency = <500000000>;
+					samsung,esc-clock-frequency = <20000000>;
+				};
+			};
+		};
+
+		panel@0 {
+			compatible = "samsung,s6e8aa0";
+			reg = <0>;
+			vdd3-supply = <&lcd_vdd3_reg>;
+			vci-supply = <&ldo25_reg>;
+			reset-gpios = <&gpy4 5 0>;
+			power-on-delay= <50>;
+			reset-delay = <100>;
+			init-delay = <100>;
+			flip-horizontal;
+			flip-vertical;
+			panel-width-mm = <58>;
+			panel-height-mm = <103>;
+
+			display-timings {
+				timing-0 {
+					clock-frequency = <0>;
+					hactive = <720>;
+					vactive = <1280>;
+					hfront-porch = <5>;
+					hback-porch = <5>;
+					hsync-len = <5>;
+					vfront-porch = <13>;
+					vback-porch = <1>;
+					vsync-len = <2>;
+				};
+			};
+
+			port {
+				dsi_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+		};
+	};
+
 	camera {
 		pinctrl-0 = <&cam_port_b_clk_active>;
 		pinctrl-names = "default";
-- 
1.8.3.2
