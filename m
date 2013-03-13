From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v7 5/5] ARM: dts: Add FIMD DT binding Documentation
Date: Wed, 13 Mar 2013 15:39:31 +0530
Message-ID: <1363169371-310-6-git-send-email-vikas.sajjan@linaro.org>
References: <1363169371-310-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:34060 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755022Ab3CMKKH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 06:10:07 -0400
Received: by mail-pb0-f51.google.com with SMTP id un15so860472pbc.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 03:10:07 -0700 (PDT)
In-Reply-To: <1363169371-310-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

Adds FIMD DT binding documentation both Samsung SoC and Board, with an example

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 .../devicetree/bindings/video/samsung-fimd.txt     |   58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/samsung-fimd.txt

diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
new file mode 100644
index 0000000..0bca1ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -0,0 +1,58 @@
+Device-Tree bindings for Samsung SoC display controller (FIMD)
+
+FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
+the Samsung series of SoCs which transfers the image data from a video buffer
+located in the system memory to an external LCD interface.
+
+Required properties:
+- compatible : value should be one of the following
+		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
+		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
+		"samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
+		"samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
+		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
+		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
+		"samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
+
+- reg : physical base address of the FIMD and length of memory mapped region
+
+- interrupt-parent : a phandle to the interrupt combiner node
+
+- interrupts : should contain a list of all FIMD IP block interrupts:
+  FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier format depends
+    on the interrupt controller used.
+
+- interrupt-names : should contain the interrupt names: "fifo", "vsync",
+	"lcd_sys", in the same order as they were listed in the interrupts
+        property.
+
+- pinctrl : property defining the pinctrl configurations with a phandle
+
+- pinctrl-names : "default" state needs to be specified in the fimd node
+		The pinctrl bindings defined in
+		../../../pinctrl/pinctrl-bindings.txt must be used to define a
+		pinctrl state named "default".
+
+Optional Properties:
+- samsung,power-domain := a phandle to FIMD power domain node
+
+Example:
+
+SoC specific DT Entry:
+
+	fimd@11c00000 {
+		compatible = "samsung,exynos4210-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x11c00000 0x20000>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <11 0>, <11 1>, <11 2>;
+	};
+
+Board specific DT Entry:
+
+	fimd@11c00000 {
+		samsung,power-domain = <&pd_lcd0>;
+		pinctrl-0 = <&lcd_sync &lcd_clk &lcd_en &lcd0_data &pwm1_out>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
-- 
1.7.9.5
