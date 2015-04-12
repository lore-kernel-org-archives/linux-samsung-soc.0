From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 3/7] ARM: dts: Remove duplicated I2C 7 nodes in Snow
Date: Sun, 12 Apr 2015 21:24:50 +0900
Message-ID: <1428841494-20769-4-git-send-email-k.kozlowski.k@gmail.com>
References: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428841494-20769-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

The i2c_7 node (i2c@12CD0000) with LVDS bridge child node was put in
Exynos5250 Snow DTS file twice.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 46 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 2657e842e5a5..7ecdad0517e7 100644
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
2.1.0
