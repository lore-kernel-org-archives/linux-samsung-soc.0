From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 3/3] ARM: dts: Add mclk entry for Peach Pit/Pi boards
Date: Thu, 26 Feb 2015 16:49:36 +0100
Message-ID: <1424965776-4381-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424965776-4381-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tushar Behera <tushar.b@samsung.com>, Kevin Hilman <khilman@linaro.org>, Andreas Faerber <afaerber@suse.de>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

From: Tushar Behera <tushar.b@samsung.com>

On Peach Pit and Pi boards, the Exynos SoC XCLKOUT pin provides
master clock (mclk) to the codec. So make it a clock consumer.

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 2 ++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 80db9137abdd..d0ee55f4d09f 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -601,6 +601,8 @@
 		interrupt-parent = <&gpx0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98090_irq>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	light-sensor@44 {
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 9db2b5927821..7ea1d66dd719 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -588,6 +588,8 @@
 		interrupt-parent = <&gpx0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98091_irq>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	light-sensor@44 {
-- 
2.1.3
