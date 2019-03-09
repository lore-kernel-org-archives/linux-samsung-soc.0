From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] ARM: dts: exynos: Adjust ldo23 and ldo27 to lower levels on Arndale Octa
Date: Sat,  9 Mar 2019 16:00:37 +0100
Message-ID: <20190309150039.8705-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Although on the schematics of Insignal Arndale Octa board the
PVDD_MIFS_1V1 (ldo23) and PVDD_G3DS_1V0 (ldo27) are marked as 1.2 V, the
vendor v3.4 Android kernel sets them lower.  Also name suggests that
they should work on 1.1 V and 1.0 V respectively, not 1.2 V.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 6f5e6e2fde22..751e772b5710 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -504,8 +504,8 @@
 
 			ldo23_reg: LDO23 {
 				regulator-name = "PVDD_MIFS_1V1";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 			};
 
@@ -530,8 +530,8 @@
 
 			ldo27_reg: LDO27 {
 				regulator-name = "PVDD_G3DS_1V0";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1100000>;
 			};
 
 			ldo28_reg: LDO28 {
-- 
2.17.1
