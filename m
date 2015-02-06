From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 1/1] ARM: dts: Add mclk entry for Snow and Peach Pit/Pi boards
Date: Fri,  6 Feb 2015 18:52:51 +0100
Message-ID: <1423245171-25485-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59969 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753015AbbBFRxG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 12:53:06 -0500
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

Changes since v1:
 - Rebased on top of Kukjin's for-next branch since v1 made on top of
   3.19-rc7 doesn't apply cleanly on that branch. Sorry for the noise.

 arch/arm/boot/dts/exynos5250-snow.dts      | 2 ++
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 2 ++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 5be966df7603..6096d6b02dd8 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -206,6 +206,8 @@
 		samsung,model = "Snow-I2S-MAX98095";
 		samsung,i2s-controller = <&i2s0>;
 		samsung,audio-codec = <&max98095>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	usb3_vbus_reg: regulator-usb3 {
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index ec86d9523935..1d4db3b0676e 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -594,6 +594,8 @@
 		interrupt-parent = <&gpx0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98090_irq>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	light-sensor@44 {
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 06737c60d333..6f2fc3445bd5 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -581,6 +581,8 @@
 		interrupt-parent = <&gpx0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max98091_irq>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "mclk";
 	};
 
 	light-sensor@44 {
-- 
2.1.3
