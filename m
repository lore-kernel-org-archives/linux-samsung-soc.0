From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/7] ARM: dts: exynos: Remove skeleton.dtsi usage for Exynos3
Date: Wed, 31 Aug 2016 14:14:34 +0200
Message-ID: <1472645679-5696-3-git-send-email-javier@osg.samsung.com>
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

 arch/arm/boot/dts/exynos3250-artik5.dtsi | 1 +
 arch/arm/boot/dts/exynos3250-monk.dts    | 1 +
 arch/arm/boot/dts/exynos3250-rinato.dts  | 1 +
 arch/arm/boot/dts/exynos3250.dtsi        | 3 ++-
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 130e946f1414..bedc13bef5d9 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -25,6 +25,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg = <0x40000000 0x1ff00000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 8c8906266310..249fcfd5b297 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -28,6 +28,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg =  <0x40000000 0x1ff00000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index a92181368e5b..ae125ece061d 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -28,6 +28,7 @@
 	};
 
 	memory {
+		device_type = "memory";
 		reg =  <0x40000000 0x1ff00000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 70e3aceab3a9..e9d2556c0dfd 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -17,7 +17,6 @@
  * published by the Free Software Foundation.
  */
 
-#include "skeleton.dtsi"
 #include "exynos4-cpu-thermal.dtsi"
 #include "exynos-syscon-restart.dtsi"
 #include <dt-bindings/clock/exynos3250.h>
@@ -25,6 +24,8 @@
 / {
 	compatible = "samsung,exynos3250";
 	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	aliases {
 		pinctrl0 = &pinctrl_0;
-- 
2.7.4
