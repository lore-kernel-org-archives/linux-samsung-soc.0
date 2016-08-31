From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 3/7] ARM: dts: exynos: Remove skeleton.dtsi usage for Exynos4
Date: Wed, 31 Aug 2016 14:14:35 +0200
Message-ID: <1472645679-5696-4-git-send-email-javier@osg.samsung.com>
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

 arch/arm/boot/dts/exynos4.dtsi                  | 3 ++-
 arch/arm/boot/dts/exynos4210-origen.dts         | 1 +
 arch/arm/boot/dts/exynos4210-smdkv310.dts       | 1 +
 arch/arm/boot/dts/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/exynos4412-odroidu3.dts       | 1 +
 arch/arm/boot/dts/exynos4412-odroidx.dts        | 1 +
 arch/arm/boot/dts/exynos4412-odroidx2.dts       | 1 +
 arch/arm/boot/dts/exynos4412-origen.dts         | 1 +
 arch/arm/boot/dts/exynos4412-smdk4412.dts       | 1 +
 arch/arm/boot/dts/exynos4412-tiny4412.dts       | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
 arch/arm/boot/dts/exynos4415.dtsi               | 3 ++-
 13 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 32f22e12c70b..5f034eb5a5e2 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -21,11 +21,12 @@
 
 #include <dt-bindings/clock/exynos4.h>
 #include <dt-bindings/clock/exynos-audss-clk.h>
-#include "skeleton.dtsi"
 #include "exynos-syscon-restart.dtsi"
 
 / {
 	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	aliases {
 		spi0 = &spi_0;
diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index be2751eebaf8..6b2c41a87a3e 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -25,6 +25,7 @@
 	compatible = "insignal,origen", "samsung,exynos4210", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x10000000
 		       0x50000000 0x10000000
 		       0x60000000 0x10000000
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 847fae3dd1f1..3c759baeadcc 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -24,6 +24,7 @@
 	compatible = "samsung,smdkv310", "samsung,exynos4210", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 79d983036560..5f7ddb0627fb 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -21,6 +21,7 @@
 	compatible = "samsung,trats", "samsung,exynos4210", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg =  <0x40000000 0x10000000
 			0x50000000 0x10000000
 			0x60000000 0x10000000
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index cf95202fa310..30d938e17c9f 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -21,6 +21,7 @@
 	compatible = "samsung,universal_c210", "samsung,exynos4210", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg =  <0x40000000 0x10000000
 			0x50000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index d73aa6c58fe3..cc1b87e09534 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -19,6 +19,7 @@
 	compatible = "hardkernel,odroid-u3", "samsung,exynos4412", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x7FF00000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 2af235151301..518ca57837be 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -19,6 +19,7 @@
 	compatible = "hardkernel,odroid-x", "samsung,exynos4412", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x3FF00000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-odroidx2.dts b/arch/arm/boot/dts/exynos4412-odroidx2.dts
index 3e3584270e00..92cdeea1cfb3 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx2.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx2.dts
@@ -18,6 +18,7 @@
 	compatible = "hardkernel,odroid-x2", "samsung,exynos4412", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x7FF00000>;
 	};
 };
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 26a36fed9652..9156a35a6117 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -23,6 +23,7 @@
 	compatible = "insignal,origen4412", "samsung,exynos4412", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index 231ffbdbf9d0..2e868c4c307e 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -21,6 +21,7 @@
 	compatible = "samsung,smdk4412", "samsung,exynos4412", "samsung,exynos4";
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 4840bbdaa9ec..ad60f3840e24 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -24,6 +24,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 129e973a06a6..e1380bae8ee3 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -31,6 +31,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg =  <0x40000000 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4415.dtsi b/arch/arm/boot/dts/exynos4415.dtsi
index 28b04b6795c9..3c40f8a956dd 100644
--- a/arch/arm/boot/dts/exynos4415.dtsi
+++ b/arch/arm/boot/dts/exynos4415.dtsi
@@ -16,13 +16,14 @@
  * published by the Free Software Foundation.
  */
 
-#include "skeleton.dtsi"
 #include <dt-bindings/clock/exynos4415.h>
 #include <dt-bindings/clock/exynos-audss-clk.h>
 
 / {
 	compatible = "samsung,exynos4415";
 	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	aliases {
 		pinctrl0 = &pinctrl_0;
-- 
2.7.4
