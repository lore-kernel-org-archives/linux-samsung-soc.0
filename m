From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 20/21] ARM: dts: exynos5422-odroidxu3: Add support for
 secondary DAI
Date: Tue, 12 Feb 2019 19:03:41 +0100
Message-ID: <20190212180342.32040-21-s.nawrocki@samsung.com>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
        <CGME20190212180549epcas1p20b5cc51ba13fb934056196d1b89d67ab@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212180342.32040-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
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
