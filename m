From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RESEND] ARM: dts: exynos: Fix audio (microphone) routing on
 Odroid XU3
Date: Wed, 20 Mar 2019 10:59:50 +0100
Message-ID: <20190320095950.23566-1-s.nawrocki@samsung.com>
References: <20190319205522.GD16150@kozik-lap>
        <CGME20190320100002epcas2p2c85f13b20896f837aa5a48643b917680@epcas2p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190319205522.GD16150@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kgene@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The name of CODEC input widget to which microphone is connected through
the "Headphone" jack is "IN12" not "IN1". This fixes microphone support
on Odroid XU3.

Cc: <stable@vger.kernel.org> # v4.14+
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
index 3a37267e6134..c3c2d85267da 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
@@ -22,7 +22,7 @@
 			"Headphone Jack", "HPL",
 			"Headphone Jack", "HPR",
 			"Headphone Jack", "MICBIAS",
-			"IN1", "Headphone Jack",
+			"IN12", "Headphone Jack",
 			"Speakers", "SPKL",
 			"Speakers", "SPKR",
 			"I2S Playback", "Mixer DAI TX",
--
2.17.1
