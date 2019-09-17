From: Maciej Falkowski <m.falkowski@samsung.com>
Subject: [PATCH v2 2/2] dt-bindings: sound: Convert Samsung SMDK audio
 complex
Date: Tue, 17 Sep 2019 14:06:27 +0200
Message-ID: <20190917120627.28357-1-m.falkowski@samsung.com>
References: <20190917111413.22711-1-m.falkowski@samsung.com>
        <CGME20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917111413.22711-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: krzk@kernel.org, sbkim73@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com, m.szyprowski@samsung.com, m.falkowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Convert Samsung SMDK audio complex to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Added missing Signed-off-by certificate
---
 .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
 .../bindings/sound/samsung,smdk-wm8994.yaml   | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
deleted file mode 100644
index 4686646fb122..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Samsung SMDK audio complex
-
-Required properties:
-- compatible : "samsung,smdk-wm8994"
-- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
-- samsung,audio-codec: The phandle of the WM8994 audio codec
-Example:
-
-sound {
-		compatible = "samsung,smdk-wm8994";
-
-		samsung,i2s-controller = <&i2s0>;
-		samsung,audio-codec = <&wm8994>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
new file mode 100644
index 000000000000..a66c0dfdeb57
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,smdk-wm8994.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC SMDK audio complex
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sangbeom Kim <sbkim73@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: "samsung,smdk-wm8994"
+
+  samsung,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the Samsung I2S0 controller
+
+  samsung,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the WM8994 audio codec
+
+required:
+  - compatible
+  - samsung,i2s-controller
+  - samsung,audio-codec
+
+examples:
+  - |
+    sound {
+        compatible = "samsung,smdk-wm8994";
+        samsung,i2s-controller = <&i2s0>;
+        samsung,audio-codec = <&wm8994>;
+    };
+
-- 
2.17.1
