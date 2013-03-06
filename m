From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [RFC 12/12] ARM: dts: Add camera node to exynos5250-smdk5250.dts
Date: Wed,  6 Mar 2013 17:23:58 +0530
Message-ID: <1362570838-4737-13-git-send-email-shaik.ameer@samsung.com>
References: <1362570838-4737-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1362570838-4737-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, shaik.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   43 ++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 4b10744..7fbc236 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -85,9 +85,26 @@
 	};
 
 	i2c@12CA0000 {
-		status = "disabled";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <100000>;
 		pinctrl-0 = <&i2c4_bus>;
 		pinctrl-names = "default";
+
+		m5mols@1f {
+			compatible = "fujitsu,m-5mols";
+			reg = <0x1F>;
+			gpios = <&gpx3 3 0xf>, <&gpx1 2 1>;
+			clock-frequency = <24000000>;
+			pinctrl-0 = <&cam_port_a_clk_active>;
+			pinctrl-names = "default";
+
+			port {
+				m5mols_ep: endpoint {
+					remote-endpoint = <&csis0_ep>;
+				};
+			};
+
+		};
 	};
 
 	i2c@12CB0000 {
@@ -214,4 +231,28 @@
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
 	};
+
+	camera {
+		compatible = "samsung,exynos5-fimc", "simple-bus";
+		status = "okay";
+
+		csis_0: csis@13C20000 {
+			status = "okay";
+			clock-frequency = <166000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* Camera C (3) MIPI CSI-2 (CSIS0) */
+			port@3 {
+				reg = <3>;
+				csis0_ep: endpoint {
+					remote-endpoint = <&m5mols_ep>;
+					data-lanes = <1 2 3 4>;
+					samsung,csis-hs-settle = <12>;
+					samsung,csis-wclk;
+				};
+			};
+		};
+
+	};
 };
-- 
1.7.9.5
