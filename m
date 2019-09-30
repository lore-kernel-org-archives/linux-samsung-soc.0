From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 2/2] dt-bindings: timer: Use defines instead of numbers in Exynos MCT examples
Date: Mon, 30 Sep 2019 17:44:18 +0200
Message-ID: <20190930154418.4884-2-krzk@kernel.org>
References: <20190930154418.4884-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930154418.4884-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Make the examples in Exynos Multi Core Timer bindings more readable and
bring them closer to real DTS by using defines for interrupt flags.
Fix also GIC interrupt type in example for Exynos4412 (from SPI to PPI).

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Use GIC_PPI where applicable.

Rebased on top of:
https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=177667&state=*
---
 .../timer/samsung,exynos4210-mct.yaml         | 37 ++++++++++++++-----
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 3e26fd5e235a..273e359854dd 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -57,51 +57,68 @@ examples:
     // In this example, the IP contains two local timers, using separate
     // interrupts, so two local timer interrupts have been specified,
     // in addition to four global timer interrupts.
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     timer@10050000 {
         compatible = "samsung,exynos4210-mct";
         reg = <0x10050000 0x800>;
-        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
-                     <0 42 0>, <0 48 0>;
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
     };
 
   - |
     // In this example, the timer interrupts are connected to two separate
     // interrupt controllers. Hence, an interrupts-extended is needed.
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     timer@101c0000 {
         compatible = "samsung,exynos4210-mct";
         reg = <0x101C0000 0x800>;
-        interrupts-extended = <&gic 0 57 0>,
-                              <&gic 0 69 0>,
+        interrupts-extended = <&gic GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                              <&gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
                               <&combiner 12 6>,
                               <&combiner 12 7>,
-                              <&gic 0 42 0>,
-                              <&gic 0 48 0>;
+                              <&gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                              <&gic GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
     };
 
   - |
     // In this example, the IP contains four local timers, but using
     // a per-processor interrupt to handle them. Only one first local
     // interrupt is specified.
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     timer@10050000 {
         compatible = "samsung,exynos4412-mct";
         reg = <0x10050000 0x800>;
 
-        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
-                     <0 42 0>;
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_PPI 42 IRQ_TYPE_LEVEL_HIGH>;
     };
 
   - |
     // In this example, the IP contains four local timers, but using
     // a per-processor interrupt to handle them. All the local timer
     // interrupts are specified.
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     timer@10050000 {
         compatible = "samsung,exynos4412-mct";
         reg = <0x10050000 0x800>;
 
-        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
-                     <0 42 0>, <0 42 0>, <0 42 0>, <0 42 0>;
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_PPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_PPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_PPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_PPI 42 IRQ_TYPE_LEVEL_HIGH>;
     };
-- 
2.17.1
