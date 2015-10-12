From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] arm: dts: Fix audio card detection on peach boards
Date: Mon, 12 Oct 2015 11:56:09 +0530
Message-ID: <1444631169-19468-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44326 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750705AbbJLGfW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 02:35:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, k.kozlowski@samsung.com, kgene@kernel.org, devicetree@vger.kernel.org, dianders@chromium.org, stable@vger.kernel.org

Since the merge of 2fad972 ("ARM: dts: Add mclk entry for Peach boards"),
sound card detection is broken on peach boards and gives below errors:

[    3.630457] max98090 7-0010: MAX98091 REVID=0x51
[    3.634233] max98090 7-0010: use default 2.8v micbias
[    3.640985] snow-audio sound: HiFi <-> 3830000.i2s mapping ok
[    3.645307] max98090 7-0010: Invalid master clock frequency
[    3.650824] snow-audio sound: ASoC: Peach-Pi-I2S-MAX98091 late_probe() failed: -22
[    3.658914] snow-audio sound: snd_soc_register_card failed (-22)
[    3.664366] snow-audio: probe of sound failed with error -22

This patch adds missing assigned-clocks and assigned-clock-parents for
pmu_system_controller node which is used as "mclk" for audio codec.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Fixes: 2fad972 ("ARM: dts: Add mclk entry for Peach boards")
Cc: <stable@vger.kernel.org>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |    5 +++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |    5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 8f4d76c..525a93a 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -1056,5 +1056,10 @@
 	timeout-sec = <32>;
 };
 
+&pmu_system_controller {
+	assigned-clocks = <&pmu_system_controller 0>;
+	assigned-clock-parents =  <&clock CLK_FIN_PLL>;
+};
+
 #include "cros-ec-keyboard.dtsi"
 #include "cros-adc-thermistors.dtsi"
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 7d5b386..411de8f 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -1019,5 +1019,10 @@
 	timeout-sec = <32>;
 };
 
+&pmu_system_controller {
+	assigned-clocks = <&pmu_system_controller 0>;
+	assigned-clock-parents =  <&clock CLK_FIN_PLL>;
+};
+
 #include "cros-ec-keyboard.dtsi"
 #include "cros-adc-thermistors.dtsi"
-- 
1.7.10.4
