From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2] ARM: dts: exynos: Add TMU nodes regulator supply for Peach boards
Date: Wed,  1 Jun 2016 09:20:35 -0400
Message-ID: <1464787235-8400-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5800 Peach Pi and Exynos5420 Peach Pit Chromebooks have the
LDO10 1.8V output connected to the VDD18_TS{01,23,4} Exynos SoC pins.

Add this regulator as the input supply of the Thermal Management Unit
channels and also remove the always-on property since all the devices
using LDO10 as input supply are now defined.

Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v2:
- Sorted nodes in alphabetical order (Krzysztof Kozlowski).
- Added Krzysztof's Suggested-by tag since he mentioned in other
  thread that the TMU supplies were missing.

 arch/arm/boot/dts/exynos5420-peach-pit.dts | 21 ++++++++++++++++++++-
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 21 ++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index c1247402cb17..f3078430d866 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -425,7 +425,6 @@
 				regulator-name = "vdd_ldo10";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -1041,6 +1040,26 @@
 	status = "okay";
 };
 
+&tmu_cpu0 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_cpu1 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_cpu2 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_cpu3 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_gpu {
+	vtmu-supply = <&ldo10_reg>;
+};
+
 &usbdrd_dwc3_0 {
 	dr_mode = "host";
 };
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index af1c9b9a63f9..203c8da4d58e 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -425,7 +425,6 @@
 				regulator-name = "vdd_ldo10";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -1017,6 +1016,26 @@
 	status = "okay";
 };
 
+&tmu_cpu0 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_cpu1 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_cpu2 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_cpu3 {
+	vtmu-supply = <&ldo10_reg>;
+};
+
+&tmu_gpu {
+	vtmu-supply = <&ldo10_reg>;
+};
+
 &usbdrd_dwc3_0 {
 	dr_mode = "host";
 };
-- 
2.5.5
