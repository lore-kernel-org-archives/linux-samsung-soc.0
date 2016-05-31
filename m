From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 6/6] ARM: dts: exynos: No need to enable TMU nodes on Odroid XU3 family
Date: Tue, 31 May 2016 20:39:05 +0200
Message-ID: <1464719945-3417-6-git-send-email-krzk@kernel.org>
References: <1464719945-3417-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464719945-3417-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The thermal nodes are not disabled in exynos5420.dtsi so there is no
need to manually enable them on Odroid XU3/XU3-Lite/XU4 boards.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 20fa7612080d..c08392b9e0dd 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -388,27 +388,22 @@
 
 &tmu_cpu0 {
 	vtmu-supply = <&ldo7_reg>;
-	status = "okay";
 };
 
 &tmu_cpu1 {
 	vtmu-supply = <&ldo7_reg>;
-	status = "okay";
 };
 
 &tmu_cpu2 {
 	vtmu-supply = <&ldo7_reg>;
-	status = "okay";
 };
 
 &tmu_cpu3 {
 	vtmu-supply = <&ldo7_reg>;
-	status = "okay";
 };
 
 &tmu_gpu {
 	vtmu-supply = <&ldo7_reg>;
-	status = "okay";
 };
 
 &rtc {
-- 
2.7.4
