From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v6 1/2] mfd: Add DT bindings documentation for
 Samsung Exynos LPASS
Date: Wed, 10 Aug 2016 16:48:19 +0200
Message-ID: <1470840500-2428-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: lee.jones@linaro.org
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, broonie@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds documentation of the DT bindings for the Samsung
Exynos SoC Low Power Audio Subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes since v5:
 - none.

Changes since v4:
 - text reformatting, added VIC to the list of sub-devices, relative
   paths used for the reference DT binding documentation files, added
   example dts.

Changes since v3:
 - moved to Documentation/devicetree/bindings/mfd,
 - added #address-cells, #size-cells, ranges as required
   properties,
 - added description of the IP block subnodes and links
   to their binding's documentation.

Changes since v2:
 - none.
---
 .../bindings/mfd/samsung,exynos5433-lpass.txt      | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt

diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
new file mode 100644
index 0000000..c110e11
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
@@ -0,0 +1,70 @@
+Samsung Exynos SoC Low Power Audio Subsystem (LPASS)
+
+Required properties:
+
+ - compatible		: "samsung,exynos5433-lpass"
+ - reg			: should contain the LPASS top SFR region location
+			  and size
+ - samsung,pmu-syscon	: the phandle to the Power Management Unit node
+ - #address-cells	: should be 1
+ - #size-cells		: should be 1
+ - ranges		: must be present
+
+Each IP block of the Low Power Audio Subsystem should be specified as
+an optional sub-node. For "samsung,exynos5433-lpass" compatible this includes:
+UART, SLIMBUS, PCM, I2S, DMAC, Timers 0...4, VIC, WDT 0...1 devices.
+
+Bindings of the sub-nodes are described in:
+  ../serial/samsung_uart.txt
+  ../sound/samsung-i2s.txt
+  ../dma/arm-pl330.txt
+
+
+Example:
+
+audio-subsystem {
+	compatible = "samsung,exynos5433-lpass";
+	reg = <0x11400000 0x100>, <0x11500000 0x08>;
+	samsung,pmu-syscon = <&pmu_system_controller>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	adma: adma@11420000 {
+		compatible = "arm,pl330", "arm,primecell";
+		reg = <0x11420000 0x1000>;
+		interrupts = <0 73 0>;
+		clocks = <&cmu_aud CLK_ACLK_DMAC>;
+		clock-names = "apb_pclk";
+		#dma-cells = <1>;
+		#dma-channels = <8>;
+		#dma-requests = <32>;
+	};
+
+	i2s0: i2s0@11440000 {
+		compatible = "samsung,exynos7-i2s";
+		reg = <0x11440000 0x100>;
+		dmas = <&adma 0 &adma 2>;
+		dma-names = "tx", "rx";
+		interrupts = <0 70 0>;
+		clocks = <&cmu_aud CLK_PCLK_AUD_I2S>,
+			 <&cmu_aud CLK_SCLK_AUD_I2S>,
+			 <&cmu_aud CLK_SCLK_I2S_BCLK>;
+		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s0_bus>;
+		status = "disabled";
+	};
+
+	serial_3: serial@11460000 {
+		compatible = "samsung,exynos5433-uart";
+		reg = <0x11460000 0x100>;
+		interrupts = <0 67 0>;
+		clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
+			 <&cmu_aud CLK_SCLK_AUD_UART>;
+		clock-names = "uart", "clk_uart_baud0";
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart_aud_bus>;
+		status = "disabled";
+	};
+ };
-- 
1.9.1
