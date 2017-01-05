From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/3] ARM64: dts: exynos5433-tm2: enable HDMI/TV path
Date: Thu, 05 Jan 2017 16:25:43 +0100
Message-ID: <1483629943-31183-3-git-send-email-a.hajda@samsung.com>
References: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
 <CGME20170105152604eucas1p12c1a964b5299a5a41305b00b80a09f36@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59103 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936329AbdAEP0K (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 10:26:10 -0500
In-reply-to: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org

TV path consist of following interconnected components:
- DECON_TV - display controller,
- HDMI - video signal converter RGB / HDMI,
- MHL - video signal converter HDMI / MHL,
- DDC - i2c slave device for EDID reading (on hsi2c_11 bus).

The same path/configuration is used by TM2E board and is
automatically applied thanks to dts file inclusion.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 71 +++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index 060adbf..0a87670 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -236,6 +236,22 @@
 	};
 };
 
+&decon_tv {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			tv_to_hdmi: endpoint {
+				remote-endpoint = <&hdmi_to_tv>;
+			};
+		};
+	};
+};
+
 &dsi {
 	status = "okay";
 	vddcore-supply = <&ldo6_reg>;
@@ -294,6 +310,33 @@
 	};
 };
 
+&hdmi {
+	hpd-gpio = <&gpa3 0 0>;
+	status = "okay";
+	vdd-supply = <&ldo6_reg>;
+	vdd_osc-supply = <&ldo7_reg>;
+	vdd_pll-supply = <&ldo6_reg>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			hdmi_to_tv: endpoint {
+				remote-endpoint = <&tv_to_hdmi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			hdmi_to_mhl: endpoint {
+				remote-endpoint = <&mhl_to_hdmi>;
+			};
+		};
+	};
+};
+
 &hsi2c_0 {
 	status = "okay";
 	clock-frequency = <2500000>;
@@ -708,6 +751,30 @@
 	};
 };
 
+&hsi2c_7 {
+	status = "okay";
+
+	sii8620@39 {
+		reg = <0x39>;
+		compatible = "sil,sii8620";
+		cvcc10-supply = <&ldo36_reg>;
+		iovcc18-supply = <&ldo34_reg>;
+		interrupt-parent = <&gpf0>;
+		interrupts = <2 0>;
+		reset-gpios = <&gpv7 0 GPIO_ACTIVE_LOW>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "xtal";
+		assigned-clocks = <&pmu_system_controller 0>;
+		assigned-clock-parents = <&xxti>;
+
+		port {
+			mhl_to_hdmi: endpoint {
+				remote-endpoint = <&hdmi_to_mhl>;
+			};
+		};
+	};
+};
+
 &hsi2c_8 {
 	status = "okay";
 
@@ -751,6 +818,10 @@
 	};
 };
 
+&hsi2c_11 {
+	status = "okay";
+};
+
 &i2s0 {
 	status = "okay";
 };
-- 
2.7.4
