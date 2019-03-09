From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] ARM: dts: exynos: Extend the eMMC node on Arndale Octa
Date: Sat,  9 Mar 2019 16:00:39 +0100
Message-ID: <20190309150039.8705-3-krzk@kernel.org>
References: <20190309150039.8705-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190309150039.8705-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Describe properly the MMC0 node (with attached embedded MMC memory) on
Arndale Node by:
1. Adding the regulator for host interface (although it still has to be
   "always-on" so the board with Linaro U-Boot will boot;
2. Using "non-removable" instead of "broken-cd" property, because eMMC
   is embedded into the board;
3. Adding support for HS200 v1.8 to indicate support in host controller
   although this has no practical effect (embedded memory does not
   support it).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 96a0eb73a99b..56a42c68bc39 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -378,6 +378,12 @@
 				regulator-name = "PVDD_APIO_MMCON_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				/*
+				 * Must be always on, even though there is
+				 * a consumer (mmc_0).  Otherwise the board
+				 * does not reboot with vendor U-Boot
+				 * (Linaro for Arndale Octa, v2012.07).
+				 */
 				regulator-always-on;
 			};
 
@@ -685,7 +691,7 @@
 
 &mmc_0 {
 	status = "okay";
-	broken-cd;
+	non-removable;
 	card-detect-delay = <200>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;
@@ -693,8 +699,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
 	vmmc-supply = <&ldo10_reg>;
+	vqmmc-supply = <&ldo3_reg>;
 	bus-width = <8>;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
 };
 
 &mmc_2 {
-- 
2.17.1
