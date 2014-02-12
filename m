From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 14/21] ARM: dts: exynos4412-trats2: add panel node
Date: Wed, 12 Feb 2014 12:31:21 +0100
Message-ID: <1392204688-4591-15-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13481 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752656AbaBLLci (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:38 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds s6e8aa0 panel node for trats2.
It adds also trats2 specific properties for DSI
and regulator required by panel.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index fb7b9ae..0986d08 100644
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
@@ -498,6 +507,44 @@
 		};
 	};
 
+	dsi_0: dsi@11C80000 {
+		vddcore-supply = <&ldo8_reg>;
+		vddio-supply = <&ldo10_reg>;
+		samsung,pll-clock-frequency = <24000000>;
+		samsung,burst-clock-frequency = <500000000>;
+		samsung,esc-clock-frequency = <20000000>;
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
+		};
+	};
+
 	camera {
 		pinctrl-0 = <&cam_port_b_clk_active>;
 		pinctrl-names = "default";
-- 
1.8.3.2
