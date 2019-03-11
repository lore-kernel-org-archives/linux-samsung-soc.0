From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Fix audio (microphone) routing on Odroid
 XU3
Date: Mon, 11 Mar 2019 16:50:12 +0100
Message-ID: <20190311155012.15797-1-s.nawrocki@samsung.com>
References: <CGME20190311155023epcas2p428a025925f6442554b50e14e328a6d04@epcas2p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable@vger.kernel.org
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
index e84544b220b9..b90cea8b7368 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
@@ -22,7 +22,7 @@
 			"Headphone Jack", "HPL",
 			"Headphone Jack", "HPR",
 			"Headphone Jack", "MICBIAS",
-			"IN1", "Headphone Jack",
+			"IN12", "Headphone Jack",
 			"Speakers", "SPKL",
 			"Speakers", "SPKR";
 
-- 
2.17.1
