From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT] arm64: ARM: dts: exynos: Remove double SD card detect pin inversion on TM2
Date: Fri, 21 Sep 2018 20:30:14 +0200
Message-ID: <20180921183014.20236-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The SDHCI standard, MMC host controller bindings and MMC core defines
card detect pin as active low.  Therefore there is no point to invert it
twice.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index a1e3194b7483..86d8ddc3288a 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -939,8 +939,7 @@
 	status = "okay";
 	cap-sd-highspeed;
 	disable-wp;
-	cd-gpios = <&gpa2 4 GPIO_ACTIVE_HIGH>;
-	cd-inverted;
+	cd-gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
 	card-detect-delay = <200>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
-- 
2.17.1
