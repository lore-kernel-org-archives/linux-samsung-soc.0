From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 1/5] ARM: dts: Add fimd display-timings for exynos5250-snow
Date: Tue,  1 Oct 2013 19:40:56 -0400
Message-ID: <1380670860-17621-2-git-send-email-seanpaul@chromium.org>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com
Cc: airlied@linux.ie, Sean Paul <seanpaul@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds the internal panel timings to the exynos5250-snow board
dts file.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index e79331d..e5af3f2 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -190,6 +190,23 @@
 		samsung,vbus-gpio = <&gpx1 1 0>;
 	};
 
+	fimd: fimd@14400000 {
+		display-timings {
+			native-mode = <&lcd_timing>;
+			lcd_timing: 1366x768 {
+				clock-frequency = <70589280>;
+				hactive = <1366>;
+				vactive = <768>;
+				hfront-porch = <40>;
+				hback-porch = <40>;
+				hsync-len = <32>;
+				vback-porch = <10>;
+				vfront-porch = <12>;
+				vsync-len = <6>;
+			};
+		};
+	};
+
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
-- 
1.8.4

