From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 4/7] ARM: dts: exynos: Remove skeleton.dtsi usage for Exynos5
Date: Wed, 31 Aug 2016 14:14:36 +0200
Message-ID: <1472645679-5696-5-git-send-email-javier@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The skeleton.dtsi file was removed in ARM64 for different reasons as
explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").

These also applies to ARM and it will also allow to get rid of the
following DTC warnings in the future:

"Node /memory has a reg or ranges property, but no unit name"

The disassembled DTB are almost the same besides an empty chosen
node being removed and nodes reordered, so it should not have
functional changes.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/boot/dts/exynos5.dtsi                     | 3 ++-
 arch/arm/boot/dts/exynos5250-arndale.dts           | 1 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts          | 1 +
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 1 +
 arch/arm/boot/dts/exynos5250-spring.dts            | 1 +
 arch/arm/boot/dts/exynos5260-xyref5260.dts         | 1 +
 arch/arm/boot/dts/exynos5260.dtsi                  | 4 ++--
 arch/arm/boot/dts/exynos5410-odroidxu.dts          | 1 +
 arch/arm/boot/dts/exynos5410-smdk5410.dts          | 1 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 1 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 1 +
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 +
 arch/arm/boot/dts/exynos5440.dtsi                  | 3 ++-
 arch/arm/boot/dts/exynos54xx.dtsi                  | 1 -
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 1 +
 16 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index cab91782e20c..8f06609879f5 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -13,11 +13,12 @@
  * published by the Free Software Foundation.
  */
 
-#include "skeleton.dtsi"
 #include "exynos-syscon-restart.dtsi"
 
 / {
 	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	aliases {
 		i2c0 = &i2c_0;
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 3d981f32874d..54397c7e8d7c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -21,6 +21,7 @@
 	compatible = "insignal,arndale", "samsung,exynos5250", "samsung,exynos5";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 7f27263728a1..b85b78a57299 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -23,6 +23,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index 1055d25c0ccc..5324eb488e30 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -20,6 +20,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index 1d52a79b2f18..bdc55fa7c576 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -21,6 +21,7 @@
 	compatible = "google,spring", "samsung,exynos5250", "samsung,exynos5";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5260-xyref5260.dts b/arch/arm/boot/dts/exynos5260-xyref5260.dts
index 3daef94bee38..d7f62918ed4b 100644
--- a/arch/arm/boot/dts/exynos5260-xyref5260.dts
+++ b/arch/arm/boot/dts/exynos5260-xyref5260.dts
@@ -17,6 +17,7 @@
 	compatible = "samsung,xyref5260", "samsung,exynos5260", "samsung,exynos5";
 
 	memory {
+		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 36da38e29000..a86a4898d077 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -9,13 +9,13 @@
  * published by the Free Software Foundation.
 */
 
-#include "skeleton.dtsi"
-
 #include <dt-bindings/clock/exynos5260-clk.h>
 
 / {
 	compatible = "samsung,exynos5260", "samsung,exynos5";
 	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	aliases {
 		pinctrl0 = &pinctrl_0;
diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index a5ae76c1838f..f1d831fe4ac0 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -22,6 +22,7 @@
 	compatible = "hardkernel,odroid-xu", "samsung,exynos5410", "samsung,exynos5";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x7ea00000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
index 777fcf2edd79..6ea1ac4cf1e7 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -17,6 +17,7 @@
 	compatible = "samsung,smdk5410", "samsung,exynos5410", "samsung,exynos5";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 39a3b81478fd..98138bd64fad 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -23,6 +23,7 @@
 	compatible = "insignal,arndale-octa", "samsung,exynos5420", "samsung,exynos5";
 
 	memory {
+		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index f6f256fd9b5e..cd0c44b0bfa5 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -80,6 +80,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 29546465d3da..3a744d5611ea 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -20,6 +20,7 @@
 	compatible = "samsung,smdk5420", "samsung,exynos5420", "samsung,exynos5";
 
 	memory {
+		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 7bb8a370072a..05ae7284bb1b 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -22,6 +22,7 @@
 
 / {
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x7EA00000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index fd176819b4bf..e6bffd13cedd 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -10,12 +10,13 @@
 */
 
 #include <dt-bindings/clock/exynos5440.h>
-#include "skeleton.dtsi"
 
 / {
 	compatible = "samsung,exynos5440", "samsung,exynos5";
 
 	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	aliases {
 		serial0 = &serial_0;
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 06a604911e87..9d31cdce1959 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -14,7 +14,6 @@
  * published by the Free Software Foundation.
  */
 
-#include "skeleton.dtsi"
 #include "exynos5.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 51a8bca4691c..72f89c8803d4 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -80,6 +80,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x20000000 0x80000000>;
 	};
 
-- 
2.7.4
