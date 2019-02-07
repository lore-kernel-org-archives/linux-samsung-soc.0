From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 21/22] ARM: dts: exynos5422-odroidxu3: Add support for
 secondary DAI
Date: Thu, 07 Feb 2019 18:02:17 +0100
Message-ID: <20190207170218.851-1-s.nawrocki@samsung.com>
References: <CGME20190207170244epcas1p3f0037d3a98ed63b71e8daf14090befe3@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch extends DAPM routing and adds secondary CPU DAI entry
to support the secondary audio PCM interface on Odroid XU3.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
index e84544b220b9..51a843bd65ed 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
@@ -24,7 +24,9 @@
 			"Headphone Jack", "MICBIAS",
 			"IN1", "Headphone Jack",
 			"Speakers", "SPKL",
-			"Speakers", "SPKR";
+			"Speakers", "SPKR",
+			"I2S Playback", "Mixer DAI TX",
+			"HiFi Playback", "Mixer DAI TX";
 
 		assigned-clocks = <&clock CLK_MOUT_EPLL>,
 				<&clock CLK_MOUT_MAU_EPLL>,
@@ -51,7 +53,7 @@
 				<196608000>;
 
 		cpu {
-			sound-dai = <&i2s0 0>;
+			sound-dai = <&i2s0 0>, <&i2s0 1>;
 		};
 		codec {
 			sound-dai = <&hdmi>, <&max98090>;
-- 
2.20.1
