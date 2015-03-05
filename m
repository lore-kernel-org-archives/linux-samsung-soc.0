From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v5 4/9] arm64: dts: exynos: Add PMU dt node for Exynos5433
Date: Thu, 05 Mar 2015 14:38:26 +0900
Message-ID: <1425533911-14800-5-git-send-email-cw00.choi@samsung.com>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, cw00.choi@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds PMU (Power Management Unit) dt node for Exynos5433 SoC and
set the source clock for CLKOUT register as xxti .

Cc: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
[ideal.song: Add the setting of CLKOUT register]
Signed-off-by: Inha Song <ideal.song@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 67b2113..a87fc43 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -10,6 +10,7 @@ Properties:
 		   - "samsung,exynos5260-pmu" - for Exynos5260 SoC.
 		   - "samsung,exynos5410-pmu" - for Exynos5410 SoC,
 		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
+		   - "samsung,exynos5433-pmu" - for Exynos5433 SoC.
 		   - "samsung,exynos7-pmu" - for Exynos7 SoC.
 		second value must be always "syscon".
 
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 710566a..0cf8a02 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -808,6 +808,14 @@
 			status = "disabled";
 		};
 
+		pmu_system_controller: system-controller@105c0000 {
+			compatible = "samsung,exynos5433-pmu", "syscon";
+			reg = <0x105c0000 0x5008>;
+			#clock-cells = <1>;
+			clock-names = "clkout16";
+			clocks = <&xxti>;
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <1 13 0xff04>,
-- 
1.8.5.5
