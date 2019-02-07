From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 22/22] ARM: dts: exynos5422-odroidxu4: Add support for
 secondary DAI
Date: Thu, 07 Feb 2019 18:02:18 +0100
Message-ID: <20190207170218.851-2-s.nawrocki@samsung.com>
References: <20190207170218.851-1-s.nawrocki@samsung.com>
        <CGME20190207170249epcas2p3ece5f4f132365051527cb0d3a5d80b02@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207170218.851-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch extends DAPM routing and adds secondary CPU DAI entry
to support the secondary audio PCM interface on Odroid XU4.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu4.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index 122174ea9e0a..892d389d6d09 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -33,6 +33,8 @@
 		compatible = "samsung,odroid-xu3-audio";
 		model = "Odroid-XU4";
 
+		samsung,audio-routing = "I2S Playback", "Mixer DAI TX";
+
 		assigned-clocks = <&clock CLK_MOUT_EPLL>,
 				<&clock CLK_MOUT_MAU_EPLL>,
 				<&clock CLK_MOUT_USER_MAU_EPLL>,
@@ -58,7 +60,7 @@
 				<196608000>;
 
 		cpu {
-			sound-dai = <&i2s0 0>;
+			sound-dai = <&i2s0 0>, <&i2s0 1>;
 		};
 
 		codec {
-- 
2.20.1
