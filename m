From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 8/8] ARM: dts: Add camera device nodes for Exynos4412 TRATS2
 board
Date: Fri, 21 Jun 2013 14:50:24 +0200
Message-ID: <1371819024-12596-9-git-send-email-s.nawrocki@samsung.com>
References: <1371819024-12596-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23576 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965550Ab3FUMw1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 08:52:27 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOQ008TRUFEEXA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Jun 2013 21:52:26 +0900 (KST)
In-reply-to: <1371819024-12596-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch enables the front camera using the internal
camera ISP (FIMC-IS).

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   91 +++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 826e42e..47c40df 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -58,6 +58,15 @@
 			enable-active-high;
 		};
 
+		cam_io_reg: voltage-regulator@3 {
+			compatible = "regulator-fixed";
+			regulator-name = "CAM_SENSOR_A";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpm0 2 0>;
+			enable-active-high;
+		};
+
 		/* More to come */
 	};
 
@@ -468,4 +477,86 @@
 			gpios = <&gpj0 7 0>;
 		};
 	};
+
+	camera {
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_port_b_clk_active>;
+		status = "okay";
+
+		fimc_0: fimc@11800000 {
+			clock-frequency = <160000000>;
+			status = "okay";
+		};
+
+		fimc_1: fimc@11810000 {
+			clock-frequency = <160000000>;
+			status = "okay";
+		};
+
+		fimc_2: fimc@11820000 {
+			clock-frequency = <160000000>;
+			status = "okay";
+		};
+
+		fimc_3: fimc@11830000 {
+			clock-frequency = <160000000>;
+			status = "okay";
+		};
+
+		csis_1: csis@11890000 {
+			vddcore-supply = <&ldo8_reg>;
+			vddio-supply = <&ldo10_reg>;
+			clock-frequency = <160000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+
+			/* Camera D (4) MIPI CSI-2 (CSIS1) */
+			port@4 {
+				reg = <4>;
+				csis1_ep: endpoint {
+					remote-endpoint = <&is_s5k6a3_ep>;
+					data-lanes = <1>;
+					samsung,csis-hs-settle = <18>;
+					samsung,csis-wclk;
+				};
+			};
+		};
+
+		fimc_lite_0: fimc-lite@12390000 {
+			status = "okay";
+		};
+
+		fimc_lite_1: fimc-lite@123A0000 {
+			status = "okay";
+		};
+
+		fimc-is@12000000 {
+			pinctrl-0 = <&fimc_is_uart>;
+			pinctrl-names = "default";
+			status = "okay";
+
+			i2c1_isp: i2c-isp@12140000 {
+				pinctrl-0 = <&fimc_is_i2c1>;
+				pinctrl-names = "default";
+
+				s5k6a3@10 {
+					compatible = "samsung,s5k6a3";
+					reg = <0x10>;
+					svdda-supply = <&cam_io_reg>;
+					svddio-supply = <&ldo19_reg>;
+					clock-frequency = <24000000>;
+					samsung,camclk-out = <1>;
+					gpios = <&gpm1 6 0>;
+
+					port {
+						is_s5k6a3_ep: endpoint {
+							remote-endpoint = <&csis1_ep>;
+							data-lanes = <1>;
+						};
+					};
+				};
+			};
+		};
+	};
 };
-- 
1.7.9.5
