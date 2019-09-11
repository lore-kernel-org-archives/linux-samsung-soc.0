From: Maciej Falkowski <m.falkowski@samsung.com>
Subject: [PATCH v3] dt-bindings: arm: samsung: Convert Samsung Exynos IOMMU
 H/W, System MMU to dt-schema
Date: Wed, 11 Sep 2019 13:04:46 +0200
Message-ID: <20190911110446.32058-1-m.falkowski@samsung.com>
References: <CAJKOXPeojuk1UrYo9Wakaaq4VJt3Ts22Vi-V5xzwAXoFU5+tcA@mail.gmail.com>
        <CGME20190911110500eucas1p2e1304a19e2e75ee43d80fcdc3b871237@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPeojuk1UrYo9Wakaaq4VJt3Ts22Vi-V5xzwAXoFU5+tcA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, robh+dt@kernel.org, m.falkowski@samsung.com, mark.rutland@arm.com, m.szyprowski@samsung.com, a.hajda@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos IOMMU H/W, System Memory Management Unit
to newer dt-schema format.

Update clock description.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Krzysztof,

Thank you for feedback.

v3:

- remove obsolete interrupts description and
set its maxItems to one. There are some incompatible
files which will be fixed with another patch.

- clock-names pattern is changed to your more precise 
version. I also added option "pclk" + "aclk" as some
bindings are also using it.

Best regards,
Maciej Falkowski
---
 .../bindings/iommu/samsung,sysmmu.txt         |  67 -----------
 .../bindings/iommu/samsung,sysmmu.yaml        | 112 ++++++++++++++++++
 2 files changed, 112 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
deleted file mode 100644
index 525ec82615a6..000000000000
--- a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Samsung Exynos IOMMU H/W, System MMU (System Memory Management Unit)
-
-Samsung's Exynos architecture contains System MMUs that enables scattered
-physical memory chunks visible as a contiguous region to DMA-capable peripheral
-devices like MFC, FIMC, FIMD, GScaler, FIMC-IS and so forth.
-
-System MMU is an IOMMU and supports identical translation table format to
-ARMv7 translation tables with minimum set of page properties including access
-permissions, shareability and security protection. In addition, System MMU has
-another capabilities like L2 TLB or block-fetch buffers to minimize translation
-latency.
-
-System MMUs are in many to one relation with peripheral devices, i.e. single
-peripheral device might have multiple System MMUs (usually one for each bus
-master), but one System MMU can handle transactions from only one peripheral
-device. The relation between a System MMU and the peripheral device needs to be
-defined in device node of the peripheral device.
-
-MFC in all Exynos SoCs and FIMD, M2M Scalers and G2D in Exynos5420 has 2 System
-MMUs.
-* MFC has one System MMU on its left and right bus.
-* FIMD in Exynos5420 has one System MMU for window 0 and 4, the other system MMU
-  for window 1, 2 and 3.
-* M2M Scalers and G2D in Exynos5420 has one System MMU on the read channel and
-  the other System MMU on the write channel.
-
-For information on assigning System MMU controller to its peripheral devices,
-see generic IOMMU bindings.
-
-Required properties:
-- compatible: Should be "samsung,exynos-sysmmu"
-- reg: A tuple of base address and size of System MMU registers.
-- #iommu-cells: Should be <0>.
-- interrupts: An interrupt specifier for interrupt signal of System MMU,
-	      according to the format defined by a particular interrupt
-	      controller.
-- clock-names: Should be "sysmmu" or a pair of "aclk" and "pclk" to gate
-	       SYSMMU core clocks.
-	       Optional "master" if the clock to the System MMU is gated by
-	       another gate clock other core  (usually main gate clock
-	       of peripheral device this SYSMMU belongs to).
-- clocks: Phandles for respective clocks described by clock-names.
-- power-domains: Required if the System MMU is needed to gate its power.
-	  Please refer to the following document:
-	  Documentation/devicetree/bindings/power/pd-samsung.txt
-
-Examples:
-	gsc_0: gsc@13e00000 {
-		compatible = "samsung,exynos5-gsc";
-		reg = <0x13e00000 0x1000>;
-		interrupts = <0 85 0>;
-		power-domains = <&pd_gsc>;
-		clocks = <&clock CLK_GSCL0>;
-		clock-names = "gscl";
-		iommus = <&sysmmu_gsc0>;
-	};
-
-	sysmmu_gsc0: sysmmu@13e80000 {
-		compatible = "samsung,exynos-sysmmu";
-		reg = <0x13E80000 0x1000>;
-		interrupt-parent = <&combiner>;
-		interrupts = <2 0>;
-		clock-names = "sysmmu", "master";
-		clocks = <&clock CLK_SMMU_GSCL0>, <&clock CLK_GSCL0>;
-		power-domains = <&pd_gsc>;
-		#iommu-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml
new file mode 100644
index 000000000000..a8141d6c326a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/samsung,sysmmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos IOMMU H/W, System MMU (System Memory Management Unit)
+
+maintainers:
+  - Marek Szyprowski <m.szyprowski@samsung.com>
+
+description: |+
+  Samsung's Exynos architecture contains System MMUs that enables scattered
+  physical memory chunks visible as a contiguous region to DMA-capable peripheral
+  devices like MFC, FIMC, FIMD, GScaler, FIMC-IS and so forth.
+
+  System MMU is an IOMMU and supports identical translation table format to
+  ARMv7 translation tables with minimum set of page properties including access
+  permissions, shareability and security protection. In addition, System MMU has
+  another capabilities like L2 TLB or block-fetch buffers to minimize translation
+  latency.
+
+  System MMUs are in many to one relation with peripheral devices, i.e. single
+  peripheral device might have multiple System MMUs (usually one for each bus
+  master), but one System MMU can handle transactions from only one peripheral
+  device. The relation between a System MMU and the peripheral device needs to be
+  defined in device node of the peripheral device.
+
+  MFC in all Exynos SoCs and FIMD, M2M Scalers and G2D in Exynos5420 has 2 System
+  MMUs.
+  * MFC has one System MMU on its left and right bus.
+  * FIMD in Exynos5420 has one System MMU for window 0 and 4, the other system MMU
+    for window 1, 2 and 3.
+  * M2M Scalers and G2D in Exynos5420 has one System MMU on the read channel and
+    the other System MMU on the write channel.
+
+  For information on assigning System MMU controller to its peripheral devices,
+  see generic IOMMU bindings.
+
+properties:
+  compatible:
+    const: samsung,exynos-sysmmu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    oneOf:
+      - items:
+        - const: sysmmu
+      - items:
+        - const: sysmmu
+        - const: master
+      - items:
+        - const: aclk
+        - const: pclk
+      - items:
+        - const: pclk
+        - const: aclk
+    description: |
+      Should be "sysmmu" with optional "master"
+      or a pair "aclk" with "pclk".
+
+  "#iommu-cells":
+    const: 0
+
+  power-domains:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Required if the System MMU is needed to gate its power.
+      Please refer to the following document:
+      Documentation/devicetree/bindings/power/pd-samsung.txt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#iommu-cells"
+
+examples:
+  - |
+    gsc_0: gsc@13e00000 {
+      compatible = "samsung,exynos5-gsc";
+      reg = <0x13e00000 0x1000>;
+      interrupts = <0 85 0>;
+      power-domains = <&pd_gsc>;
+      clocks = <&clock 0>; // CLK_GSCL0
+      clock-names = "gscl";
+      iommus = <&sysmmu_gsc0>;
+    };
+
+    sysmmu_gsc0: sysmmu@13e80000 {
+      compatible = "samsung,exynos-sysmmu";
+      reg = <0x13E80000 0x1000>;
+      interrupt-parent = <&combiner>;
+      interrupts = <2 0>;
+      clock-names = "sysmmu", "master";
+      clocks = <&clock 0>, // CLK_SMMU_GSCL0
+               <&clock 0>; // CLK_GSCL0
+      power-domains = <&pd_gsc>;
+      #iommu-cells = <0>;
+    };
+
-- 
2.17.1
