From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v11 3/3] ARM: dts: Add FIMD DT binding Documentation
Date: Fri,  5 Apr 2013 15:47:42 +0530
Message-ID: <1365157062-8669-4-git-send-email-vikas.sajjan@linaro.org>
References: <1365157062-8669-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:45971 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161142Ab3DEKSL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Apr 2013 06:18:11 -0400
Received: by mail-da0-f41.google.com with SMTP id w4so1545913dam.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2013 03:18:11 -0700 (PDT)
In-Reply-To: <1365157062-8669-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

Add DT binding documentation for the FIMD IP block found in Samsung SoCs.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/video/samsung-fimd.txt     |   65 ++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/samsung-fimd.txt

diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
new file mode 100644
index 0000000..1984dbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -0,0 +1,65 @@
+Device-Tree bindings for Samsung SoC display controller (FIMD)
+
+FIMD (Fully Interactive Mobile Display) is the Display Controller for the
+Samsung series of SoCs which transfers the image data from a video memory
+buffer to an external LCD interface.
+
+Required properties:
+- compatible: value should be one of the following
+		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
+		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
+		"samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
+		"samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
+		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
+		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
+		"samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
+
+- reg: physical base address and length of the FIMD registers set.
+
+- interrupt-parent: should be the phandle of the fimd controller's
+		parent interrupt controller.
+
+- interrupts: should contain a list of all FIMD IP block interrupts in the
+		 order: FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier
+		 format depends on the interrupt controller used.
+
+- interrupt-names: should contain the interrupt names: "fifo", "vsync",
+	"lcd_sys", in the same order as they were listed in the interrupts
+        property.
+
+- pinctrl-0: pin control group to be used for this controller.
+
+- pinctrl-names: must contain a "default" entry.
+
+- clocks: must include clock specifiers corresponding to entries in the
+         clock-names property.
+
+- clock-names: list of clock names sorted in the same order as the clocks
+               property. Must contain "sclk_fimd" and "fimd".
+
+Optional Properties:
+- samsung,power-domain: a phandle to FIMD power domain node.
+
+Example:
+
+SoC specific DT entry:
+
+	fimd@11c00000 {
+		compatible = "samsung,exynos4210-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x11c00000 0x20000>;
+		interrupt-names = "fifo", "vsync", "lcd_sys";
+		interrupts = <11 0>, <11 1>, <11 2>;
+		clocks = <&clock 140>, <&clock 283>;
+		clock-names = "sclk_fimd", "fimd";
+		samsung,power-domain = <&pd_lcd0>;
+		status = "disabled";
+	};
+
+Board specific DT entry:
+
+	fimd@11c00000 {
+		pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
-- 
1.7.9.5
