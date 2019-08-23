From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 4/9] dt-bindings: arm: samsung: Convert Exynos Chipid bindings to json-schema
Date: Fri, 23 Aug 2019 16:53:51 +0200
Message-ID: <20190823145356.6341-4-krzk@kernel.org>
References: <20190823145356.6341-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823145356.6341-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: notify@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos Chipid bindings to DT schema format using
json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/arm/samsung/exynos-chipid.txt    | 12 ----------
 .../bindings/arm/samsung/exynos-chipid.yaml   | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
deleted file mode 100644
index 85c5dfd4a720..000000000000
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-SAMSUNG Exynos SoCs Chipid driver.
-
-Required properties:
-- compatible : Should at least contain "samsung,exynos4210-chipid".
-
-- reg: offset and length of the register set
-
-Example:
-	chipid@10000000 {
-		compatible = "samsung,exynos4210-chipid";
-		reg = <0x10000000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
new file mode 100644
index 000000000000..d22d5376a11e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/samsung/exynos-chipid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC series Chipid driver
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - const: samsung,exynos4210-chipid
+  reg:
+    maxItems: 1
+
+examples:
+  - |
+    chipid@10000000 {
+      compatible = "samsung,exynos4210-chipid";
+      reg = <0x10000000 0x100>;
+    };
-- 
2.17.1
