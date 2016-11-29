From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Add support for s6e3ha2 panel device for
 TM2
Date: Tue, 29 Nov 2016 15:16:22 +0900
Message-ID: <1480400182-4485-1-git-send-email-hoegeun.kwon@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35992 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752706AbcK2GQ0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 01:16:26 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, hoegeun.kwon@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

From: Hyungwon Hwang <human.hwang@samsung.com>

This patch adds the Panel Device Tree node for s6e3ha2 display
controller to Exynos5433 SoC dts.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index db879f4..d27f27d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -252,11 +252,46 @@
 			reg = <1>;
 
 			dsi_out: endpoint {
+				remote-endpoint = <&dsi_in>;
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
+		reset-gpios = <&gpg0 0 0>;
+		panel-en-gpios = <&gpf1 5 0>;
+		te-gpios = <&gpf1 3 1>;
+		power-on-delay= <5>;
+		init-delay = <120>;
+		panel-width-mm = <71>;
+		panel-height-mm = <125>;
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
+			dsi_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
 };
 
 &hsi2c_0 {
-- 
1.9.1
