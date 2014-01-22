From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 9/9] ARM: dts: exynos4412-trats2: add panel node
Date: Wed, 22 Jan 2014 15:35:35 +0100
Message-ID: <1390401336-22915-10-git-send-email-a.hajda@samsung.com>
References: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds s6e8aa0 panel node for trats2.
It adds also trats2 specific properties for DSI
and regulator required by panel.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 2867c4e..3243b76 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -442,6 +442,15 @@
 		};
 	};
 
+	lcd_vdd3_reg: voltage-regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD_VDD_2.2V";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <2200000>;
+		gpio = <&gpc0 1 0>;
+		enable-active-high;
+	};
+
 	sdhci@12510000 {
 		bus-width = <8>;
 		non-removable;
@@ -498,6 +507,42 @@
 		};
 	};
 
+	dsi_0: dsi@11C80000 {
+		vddcore-supply = <&ldo8_reg>;
+		vddio-supply = <&ldo10_reg>;
+		samsung,pll-clk-freq = <24000000>;
+		status = "okay";
+
+		panel@0 {
+			compatible = "samsung,s6e8aa0";
+			reg = <0>;
+			vdd3-supply = <&lcd_vdd3_reg>;
+			vci-supply = <&ldo25_reg>;
+			reset-gpio = <&gpy4 5 0>;
+			power-on-delay= <50>;
+			reset-delay = <100>;
+			init-delay = <100>;
+			flip-horizontal;
+			flip-vertical;
+			samsung,panel-width-mm = <58>;
+			samsung,panel-height-mm = <103>;
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
+		};
+	};
+
 	fimd@11c00000 {
 		samsung,fimd-vidout-rgb;
 		samsung,fimd-inv-vclk;
-- 
1.8.3.2
