From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v4 3/8] ARM: dts: Remove duplicated I2C7 nodes in exynos5250-snow
Date: Sun, 17 May 2015 17:26:10 +0900
Message-ID: <1431851175-32624-4-git-send-email-k.kozlowski.k@gmail.com>
References: <1431851175-32624-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:34561 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207AbbEQI0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 May 2015 04:26:37 -0400
In-Reply-To: <1431851175-32624-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

The i2c_7 node (i2c@12CD0000) with LVDS bridge child node was put in
Exynos5250 Snow DTS file twice. Move the LVDS bridge to proper existing
i2c_7 node.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 46 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1eca97ee4bd6..b7f4122df456 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -177,30 +177,6 @@
 		};
 	};
 
-	i2c@12CD0000 {
-		ptn3460: lvds-bridge@20 {
-			compatible = "nxp,ptn3460";
-			reg = <0x20>;
-			powerdown-gpios = <&gpy2 5 GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpx1 5 GPIO_ACTIVE_HIGH>;
-			edid-emulation = <5>;
-
-			ports {
-				port@0 {
-					bridge_out: endpoint {
-						remote-endpoint = <&panel_in>;
-					};
-				};
-
-				port@1 {
-					bridge_in: endpoint {
-						remote-endpoint = <&dp_out>;
-					};
-				};
-			};
-		};
-	};
-
 	sound {
 		compatible = "google,snow-audio-max98095";
 
@@ -507,6 +483,28 @@
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <66000>;
 
+	ptn3460: lvds-bridge@20 {
+		compatible = "nxp,ptn3460";
+		reg = <0x20>;
+		powerdown-gpios = <&gpy2 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpx1 5 GPIO_ACTIVE_HIGH>;
+		edid-emulation = <5>;
+
+		ports {
+			port@0 {
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+
+			port@1 {
+				bridge_in: endpoint {
+					remote-endpoint = <&dp_out>;
+				};
+			};
+		};
+	};
+
 	max98095: codec@11 {
 		compatible = "maxim,max98095";
 		reg = <0x11>;
-- 
2.1.4
