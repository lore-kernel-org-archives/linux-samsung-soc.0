From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 3/3] arm64: dts: exynos: enable HDMI/TV path
Date: Wed, 11 Jan 2017 09:31:40 +0100
Message-ID: <1484123500-20488-3-git-send-email-a.hajda@samsung.com>
References: <20170110190916.k3tek4zuvhggbuc6@kozik-lap>
 <1484123500-20488-1-git-send-email-a.hajda@samsung.com>
 <CGME20170111083155eucas1p28c9c49a619a31d33c2666f58bf22e7c0@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35927 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933204AbdAKIcB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 03:32:01 -0500
In-reply-to: <1484123500-20488-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

TV path consist of following interconnected components:
- DECON_TV - display controller,
- HDMI - video signal converter RGB / HDMI,
- MHL - video signal converter HDMI / MHL,
- DDC - i2c slave device for EDID reading (on hsi2c_11 bus).

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index cc6701b..a5c8669 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -278,6 +278,22 @@
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
@@ -301,6 +317,33 @@
 	};
 };
 
+&hdmi {
+	hpd-gpios = <&gpa3 0 GPIO_ACTIVE_HIGH>;
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
@@ -702,6 +745,28 @@
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
+		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+		reset-gpios = <&gpv7 0 GPIO_ACTIVE_LOW>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "xtal";
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
 
@@ -745,6 +810,10 @@
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
