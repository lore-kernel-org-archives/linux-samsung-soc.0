From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] ARM: dts: Add mclk entry for Snow and Peach Pit/Pi boards
Date: Fri,  6 Feb 2015 17:55:47 +0100
Message-ID: <1423241747-15032-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59831 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504AbbBFQ4A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 11:56:00 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Tushar Behera <tushar.b@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

From: Tushar Behera <tushar.b@samsung.com>

On Snow, Peach Pit and Peach Pi boards, the Exynos SoC XCLKOUT output pin
provides the master clock (mclk) to codecs. So make them a clock consumer.

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5250-snow.dts      | 2 ++
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 2 ++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index fc64a0066325..ece8bdb40c0a 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -191,6 +191,8 @@
 		samsung,model = "DAISYI2S";
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98095>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	usb3_vbus_reg: regulator-usb3 {
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index c9a0e170a0f0..30014e6c6799 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -491,6 +491,8 @@
 		interrupt-parent = <&gpx0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98090_irq>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	light-sensor@44 {
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index a80ceeac4ec8..a415ad88bc0c 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -490,6 +490,8 @@
 		interrupt-parent = <&gpx0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98091_irq>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	light-sensor@44 {
-- 
2.1.3
