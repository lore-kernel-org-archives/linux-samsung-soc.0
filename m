From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Always enable necessary APIO_1V8 and ABB_1V8 regulators on Arndale Octa
Date: Thu, 14 Mar 2019 21:02:17 +0100
Message-ID: <20190314200217.6002-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The PVDD_APIO_1V8 (LDO2) and PVDD_ABB_1V8 (LDO8) regulators were turned
off by Linux kernel as unused.  However they supply critical parts of
SoC so they should be always on:

1. PVDD_APIO_1V8 supplies SYS pins (gpx[0-3], PSHOLD), HDMI level shift,
   RTC, VDD1_12 (DRAM internal 1.8 V logic), pull-up for PMIC interrupt
   lines, TTL/UARTR level shift, reset pins and SW-TACT1 button.
   It also supplies unused blocks like VDDQ_SRAM (for SROM controller) and
   VDDQ_GPIO (gpm7, gpy7).
   The LDO2 cannot be turned off (S2MPS11 keeps it on anyway) so
   marking it "always-on" only reflects its real status.

2. PVDD_ABB_1V8 supplies Adaptive Body Bias Generator for ARM cores,
   memory and Mali (G3D).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 3447160e1fbf..a0e27e1c0feb 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -107,6 +107,7 @@
 				regulator-name = "PVDD_APIO_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 			};
 
 			ldo3_reg: LDO3 {
@@ -145,6 +146,7 @@
 				regulator-name = "PVDD_ABB_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 			};
 
 			ldo9_reg: LDO9 {
-- 
2.17.1
