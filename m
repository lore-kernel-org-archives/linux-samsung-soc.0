From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Scaler to
 dt-schema
Date: Thu, 26 Sep 2019 14:56:14 +0200
Message-ID: <20190926125614.10408-1-m.szyprowski@samsung.com>
References: <CGME20190926125619eucas1p249ac149ef1e1a3eb975dae94b08cd7be@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Maciej Falkowski <m.falkowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Maciej Falkowski <m.falkowski@samsung.com>

Convert Samsung Image Scaler to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Removed quotation marks from string in 'compatible' property
- Added if-then statement for 'clocks' and 'clock-names' property
- Added include directive to example
- Added GIC_SPI macro to example

Best regards,
Maciej Falkowski
---
 .../bindings/gpu/samsung-scaler.txt           | 27 -------
 .../bindings/gpu/samsung-scaler.yaml          | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.yaml

diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.txt b/Documentation/devicetree/bindings/gpu/samsung-scaler.txt
deleted file mode 100644
index 9c3d98105dfd..000000000000
--- a/Documentation/devicetree/bindings/gpu/samsung-scaler.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Samsung Exynos Image Scaler
-
-Required properties:
-  - compatible : value should be one of the following:
-	(a) "samsung,exynos5420-scaler" for Scaler IP in Exynos5420
-	(b) "samsung,exynos5433-scaler" for Scaler IP in Exynos5433
-
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-
-  - interrupts : Interrupt specifier for scaler interrupt, according to format
-		 specific to interrupt parent.
-
-  - clocks : Clock specifier for scaler clock, according to generic clock
-	     bindings. (See Documentation/devicetree/bindings/clock/exynos*.txt)
-
-  - clock-names : Names of clocks. For exynos scaler, it should be "mscl"
-		  on 5420 and "pclk", "aclk" and "aclk_xiu" on 5433.
-
-Example:
-	scaler@12800000 {
-		compatible = "samsung,exynos5420-scaler";
-		reg = <0x12800000 0x1294>;
-		interrupts = <0 220 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clock CLK_MSCL0>;
-		clock-names = "mscl";
-	};
diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
new file mode 100644
index 000000000000..af19930d052e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/samsung-scaler.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC Image Scaler
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos5420-scaler
+      - samsung,exynos5433-scaler
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: samsung,exynos5420-scaler
+then:
+  properties:
+    clocks:
+      items:
+        - description: mscl clock
+
+    clock-names:
+      items:
+        - const: mscl
+else:
+  properties:
+    clocks:
+      items:
+        - description: mscl clock
+        - description: aclk clock
+        - description: aclk_xiu clock
+
+    clock-names:
+      items:
+        - const: pclk
+        - const: aclk
+        - const: aclk_xiu
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5420.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    scaler@12800000 {
+        compatible = "samsung,exynos5420-scaler";
+        reg = <0x12800000 0x1294>;
+        interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_MSCL0>;
+        clock-names = "mscl";
+    };
+
-- 
2.17.1
