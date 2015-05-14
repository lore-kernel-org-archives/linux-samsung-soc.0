From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v3 3/8] ARM: dts: Remove duplicated I2C7 nodes in
 exynos5250-snow
Date: Thu, 14 May 2015 19:53:48 +0900
Message-ID: <1431600833-3361-4-git-send-email-k.kozlowski.k@gmail.com>
References: <1431600833-3361-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431600833-3361-1-git-send-email-k.kozlowski.k@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

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
