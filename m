From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Fix audio routing on exynos5422-odroidxu3
Date: Wed, 06 Mar 2019 11:40:56 +0100
Message-ID: <20190306104056.7603-1-s.nawrocki@samsung.com>
References: <CGME20190306104113epcas1p4a12ebf1aac63883cbd80b2750be76d06@epcas1p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing audio routing entry for the capture stream, this change
is required to fix audio recording on Odroid XU3.

Fixes: 885b005d232c ("ARM: dts: exynos: Add support for secondary DAI to Odroid XU3")
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
index 51a843bd65ed..3a37267e6134 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
@@ -26,7 +26,8 @@
 			"Speakers", "SPKL",
 			"Speakers", "SPKR",
 			"I2S Playback", "Mixer DAI TX",
-			"HiFi Playback", "Mixer DAI TX";
+			"HiFi Playback", "Mixer DAI TX",
+			"Mixer DAI RX", "HiFi Capture";
 
 		assigned-clocks = <&clock CLK_MOUT_EPLL>,
 				<&clock CLK_MOUT_MAU_EPLL>,
-- 
2.17.1
