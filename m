From: Maciej Falkowski <m.falkowski@samsung.com>
Subject: [PATCH v2 1/2] dt-bindings: sound: Convert Samsung I2S controller
 to dt-schema
Date: Tue, 17 Sep 2019 14:04:52 +0200
Message-ID: <20190917120452.28135-1-m.falkowski@samsung.com>
References: <20190917111413.22711-1-m.falkowski@samsung.com>
        <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917111413.22711-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: krzk@kernel.org, sbkim73@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com, m.szyprowski@samsung.com, m.falkowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Convert Samsung I2S controller to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Added missing Signed-off-by certificate
---
 .../devicetree/bindings/sound/samsung-i2s.txt |  84 -------------
 .../bindings/sound/samsung-i2s.yaml           | 119 ++++++++++++++++++
 2 files changed, 119 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
deleted file mode 100644
index a88cb00fa096..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-* Samsung I2S controller
-
-Required SoC Specific Properties:
-
-- compatible : should be one of the following.
-   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
-   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
-     secondary fifo, s/w reset control and internal mux for root clk src.
-   - samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
-     playback, stereo channel capture, secondary fifo using internal
-     or external dma, s/w reset control, internal mux for root clk src
-     and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
-     is to allow transfer of multiple channel audio data on single data line.
-   - samsung,exynos7-i2s: with all the available features of exynos5 i2s,
-     exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
-     with only external dma and more no.of root clk sampling frequencies.
-   - samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
-     stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
-     slightly modified bit offsets.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- dmas: list of DMA controller phandle and DMA request line ordered pairs.
-- dma-names: identifier string for each DMA request line in the dmas property.
-  These strings correspond 1:1 with the ordered pairs in dmas.
-- clocks: Handle to iis clock and RCLK source clk.
-- clock-names:
-  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
-  clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
-  "i2s_opclk1" as shown in the example below.
-  i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
-  be "iis" and "i2s_opclk0".
-  "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources of the root
-  clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
-  doesn't have any such mux.
-- #clock-cells: should be 1, this property must be present if the I2S device
-  is a clock provider in terms of the common clock bindings, described in
-  ../clock/clock-bindings.txt.
-- clock-output-names (deprecated): from the common clock bindings, names of
-  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
-  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices respectively.
-
-There are following clocks available at the I2S device nodes:
- CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
- CLK_I2S_RCLK_PSR - the RCLK prescaler divider clock (corresponding to the
-		    IISPSR register),
- CLK_I2S_RCLK_SRC - the RCLKSRC mux clock (corresponding to RCLKSRC bit in
-		    IISMOD register).
-
-Refer to the SoC datasheet for availability of the above clocks.
-The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
-in the IIS Multi Audio Interface.
-
-Note: Old DTs may not have the #clock-cells property and then not use the I2S
-node as a clock supplier.
-
-Optional SoC Specific Properties:
-
-- samsung,idma-addr: Internal DMA register base address of the audio
-  sub system(used in secondary sound source).
-- pinctrl-0: Should specify pin control groups used for this controller.
-- pinctrl-names: Should contain only one value - "default".
-- #sound-dai-cells: should be 1.
-
-
-Example:
-
-i2s0: i2s@3830000 {
-	compatible = "samsung,s5pv210-i2s";
-	reg = <0x03830000 0x100>;
-	dmas = <&pdma0 10
-		&pdma0 9
-		&pdma0 8>;
-	dma-names = "tx", "rx", "tx-sec";
-	clocks = <&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_SCLK_I2S>;
-	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-	#clock-cells = <1>;
-	samsung,idma-addr = <0x03000000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s0_bus>;
-	#sound-dai-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
new file mode 100644
index 000000000000..59dc76035cb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC I2S controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sangbeom Kim <sbkim73@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    description: |
+      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
+
+      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
+      secondary fifo, s/w reset control and internal mux for root clk src.
+
+      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
+      playback, stereo channel capture, secondary fifo using internal
+      or external dma, s/w reset control, internal mux for root clk src
+      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
+      is to allow transfer of multiple channel audio data on single data line.
+
+      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
+
+      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
+      with only external dma and more no.of root clk sampling frequencies.
+
+      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
+      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
+      slightly modified bit offsets.
+    enum:
+      - "samsung,s3c6410-i2s"
+      - "samsung,s5pv210-i2s"
+      - "samsung,exynos5420-i2s"
+      - "samsung,exynos7-i2s"
+      - "samsung,exynos7-i2s1"
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    description: list of DMA controller phandle and DMA request line ordered pairs.
+
+  dma-names:
+    description: |
+      identifier string for each DMA request line in the dmas property.
+      These strings correspond 1:1 with the ordered pairs in dmas.
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: iis
+      - items:
+          - const: iis
+          - const: i2s_opclk0
+      - items:
+          - const: iis
+          - const: i2s_opclk0
+          - const: i2s_opclk1
+    description: |
+      "iis" is the i2s bus clock.
+      For i2s1 and i2s2 - "iis", "i2s_opclk0"
+      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"
+
+  "#clock-cells":
+    const: 1
+
+  samsung,idma-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Internal DMA register base address of the audio
+      sub system(used in secondary sound source).
+
+  pinctrl-0:
+    description: Should specify pin control groups used for this controller.
+
+  pinctrl-names:
+    const: default
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    i2s0: i2s@3830000 {
+        compatible = "samsung,s5pv210-i2s";
+        reg = <0x03830000 0x100>;
+        dmas = <&pdma0 10
+                &pdma0 9
+                &pdma0 8>;
+        dma-names = "tx", "rx", "tx-sec";
+        clocks = <&clock_audss 0>, // EXYNOS_I2S_BUS
+                <&clock_audss 0>, // EXYNOS_I2S_BUS
+                <&clock_audss 0>; // EXYNOS_SCLK_I2S
+        clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+        #clock-cells = <1>;
+        samsung,idma-addr = <0x03000000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2s0_bus>;
+        #sound-dai-cells = <1>;
+    };
+
-- 
2.17.1
