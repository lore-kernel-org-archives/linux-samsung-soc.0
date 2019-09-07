From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 08/11] dt-bindings: arm: samsung: Convert Exynos System Registers bindings to json-schema
Date: Sat,  7 Sep 2019 11:20:04 +0200
Message-ID: <20190907092007.9946-8-krzk@kernel.org>
References: <20190907092007.9946-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190907092007.9946-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos System Registers (SYSREG) bindings to DT schema
format using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Example somehow fails:
Documentation/devicetree/bindings/arm/samsung/pmu.example.dt.yaml:
system-controller@10040000: compatible:0: 'samsung,exynos5250-pmu' is
not one of ['samsung,exynos4-sysreg', 'samsung,exynos5-sysreg']

It seems that PMU schema is applied to sysreq nodes (and vice-versa).
---
 .../bindings/arm/samsung/sysreg.txt           | 19 -----------
 .../bindings/arm/samsung/sysreg.yaml          | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.yaml

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
deleted file mode 100644
index 4fced6e9d5e4..000000000000
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
-
-Properties:
- - compatible : should contain two values. First value must be one from following list:
-		- "samsung,exynos4-sysreg" - for Exynos4 based SoCs,
-		- "samsung,exynos5-sysreg" - for Exynos5 based SoCs.
-		second value must be always "syscon".
- - reg : offset and length of the register set.
-
-Example:
-	syscon@10010000 {
-		compatible = "samsung,exynos4-sysreg", "syscon";
-		reg = <0x10010000 0x400>;
-	};
-
-	syscon@10050000 {
-		compatible = "samsung,exynos5-sysreg", "syscon";
-		reg = <0x10050000 0x5000>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml b/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
new file mode 100644
index 000000000000..a3d44646e441
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/samsung/sysreg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5P/Exynos SoC series System Registers (SYSREG)
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - samsung,exynos4-sysreg
+          - samsung,exynos5-sysreg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+examples:
+  - |
+    syscon@10010000 {
+      compatible = "samsung,exynos4-sysreg", "syscon";
+      reg = <0x10010000 0x400>;
+    };
+
+    syscon@10050000 {
+      compatible = "samsung,exynos5-sysreg", "syscon";
+      reg = <0x10050000 0x5000>;
+    };
-- 
2.17.1
