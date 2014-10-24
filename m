From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv2 2/2] clk: samsung: Document binding for Exynos4415 clock
 controller
Date: Fri, 24 Oct 2014 20:07:08 +0900
Message-ID: <1414148828-23719-3-git-send-email-cw00.choi@samsung.com>
References: <1414148828-23719-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1414148828-23719-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds DT binding documentation for Exynos4415 SoC system
clock controllers.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/clock/exynos4415-clock.txt | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos4415-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/exynos4415-clock.txt b/Documentation/devicetree/bindings/clock/exynos4415-clock.txt
new file mode 100644
index 0000000..847d98b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/exynos4415-clock.txt
@@ -0,0 +1,38 @@
+* Samsung Exynos4415 Clock Controller
+
+The Exynos4415 clock controller generates and supplies clock to various
+consumer devices within the Exynos4415 SoC.
+
+Required properties:
+
+- compatible: should be one of the following:
+  - "samsung,exynos4415-cmu" - for the main system clocks controller
+    (CMU_LEFTBUS, CMU_RIGHTBUS, CMU_TOP, CMU_CPU clock domains).
+  - "samsung,exynos4415-cmu-dmc" - for the Exynos4415 SoC DRAM Memory
+    Controller (DMC) domain clock controller.
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+- #clock-cells: should be 1.
+
+Each clock is assigned an identifier and client nodes can use this identifier
+to specify the clock which they consume.
+
+All available clocks are defined as preprocessor macros in
+dt-bindings/clock/exynos4415.h header and can be used in device
+tree sources.
+
+Example 1: An example of a clock controller node is listed below.
+
+	cmu: clock-controller@10030000 {
+		compatible = "samsung,exynos4415-cmu";
+		reg = <0x10030000 0x18000>;
+		#clock-cells = <1>;
+	};
+
+	cmu-dmc: clock-controller@105C0000 {
+		compatible = "samsung,exynos4415-cmu-dmc";
+		reg = <0x105C0000 0x3000>;
+		#clock-cells = <1>;
+	};
-- 
1.8.5.5
