From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 2/2] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Fri, 30 Dec 2016 15:58:28 +0900
Message-ID: <1483081108-32055-3-git-send-email-hoegeun.kwon@samsung.com>
References: <1483081108-32055-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20161230065853epcas5p3e2056666d15fa2b132701bfaed3caea8@epcas5p3.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1483081108-32055-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Hyungwon Hwang <human.hwang@samsung.com>

This patch add the panel device tree node for S6E3HA2 display
controller to TM2 dts.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index db879f4..7434b22 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -252,11 +252,42 @@
 			reg = <1>;
 
 			dsi_out: endpoint {
+				remote-endpoint = <&panel_in>;
 				samsung,burst-clock-frequency = <512000000>;
 				samsung,esc-clock-frequency = <16000000>;
 			};
 		};
 	};
+
+	panel@0 {
+		compatible = "samsung,s6e3ha2";
+		reg = <0>;
+		vdd3-supply = <&ldo27_reg>;
+		vci-supply = <&ldo28_reg>;
+		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
+
+		display-timings {
+			timing-0 {
+				clock-frequency = <14874444>;
+				hactive = <1440>;
+				vactive = <2560>;
+				hfront-porch = <1>;
+				hback-porch = <1>;
+				hsync-len = <1>;
+				vfront-porch = <1>;
+				vback-porch = <15>;
+				vsync-len = <1>;
+			};
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
 };
 
 &hsi2c_0 {
-- 
1.9.1
