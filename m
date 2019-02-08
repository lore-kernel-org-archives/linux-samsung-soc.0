From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: exynos: Enable ADC on Odroid HC1
Date: Sat,  9 Feb 2019 00:05:57 +0100
Message-ID: <20190208230557.9292-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Odroid HC1 uses the exynos5422-odroid-core.dtsi file as a base.  All
other Exynos5422 Odroids use the "common".  The ADC node was defined
only in the latter.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 5 +++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index bf09eab90f8a..9b0bccb77be5 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -36,6 +36,11 @@
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo4_reg>;
+	status = "okay";
+};
+
 &bus_wcore {
 	devfreq-events = <&nocp_mem0_0>, <&nocp_mem0_1>,
 			<&nocp_mem1_0>, <&nocp_mem1_1>;
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index b299e541cac0..5f195ad7e467 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -362,11 +362,6 @@
 	};
 };
 
-&adc {
-	vdd-supply = <&ldo4_reg>;
-	status = "okay";
-};
-
 &hdmi {
 	status = "okay";
 	ddc = <&i2c_2>;
-- 
2.17.1
