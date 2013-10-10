From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v3 5/5] ARM: dts: Add ptn3460 to exynos5250-snow
Date: Thu, 10 Oct 2013 18:26:18 -0400
Message-ID: <1381443978-5654-6-git-send-email-seanpaul@chromium.org>
References: <1380839303-4834-1-git-send-email-seanpaul@chromium.org>
 <1381443978-5654-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381443978-5654-1-git-send-email-seanpaul@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com
Cc: airlied@linux.ie, Sean Paul <seanpaul@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds a node for the ptn3460 DP-LVDS chip in the
exynos5250-snow board dts file.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---

v2: Changed node name to lvds-bridge
v3: No changes

 arch/arm/boot/dts/exynos5250-snow.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index f813644..8c92df8 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -33,6 +33,13 @@
 		sd3_bus4: sd3-bus-width4 {
 			samsung,pin-drv = <0>;
 		};
+
+		ptn3460_gpios: ptn3460-gpios {
+			samsung,pins = "gpy2-5", "gpx1-5";
+			samsung,pin-function = <1>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	gpio-keys {
@@ -186,6 +193,18 @@
 		samsung,vbus-gpio = <&gpx1 1 0>;
 	};
 
+	i2c@12CD0000 {
+		lvds-bridge@20 {
+			compatible = "nxp,ptn3460";
+			reg = <0x20>;
+			powerdown-gpio = <&gpy2 5 0>;
+			reset-gpio = <&gpx1 5 0>;
+			edid-emulation = <5>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ptn3460_gpios>;
+		};
+	};
+
 	dp-controller@145B0000 {
 		samsung,color-space = <0>;
 		samsung,dynamic-range = <0>;
-- 
1.8.4
