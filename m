From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v6 5/5] ARM: dts: Add FIMD DT binding Documentation
Date: Thu, 28 Feb 2013 15:12:39 +0530
Message-ID: <1362044559-7496-6-git-send-email-vikas.sajjan@linaro.org>
References: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:38759 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058Ab3B1JnU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Feb 2013 04:43:20 -0500
Received: by mail-pb0-f52.google.com with SMTP id ma3so982837pbc.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Feb 2013 01:43:20 -0800 (PST)
In-Reply-To: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, jy0922.shim@samsung.com

Adds FIMD DT binding documentation both Samsung SoC and Board, with an example

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 .../devicetree/bindings/video/samsung-fimd.txt     |   54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/samsung-fimd.txt

diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
new file mode 100644
index 0000000..8d201e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -0,0 +1,54 @@
+Device-Tree bindings for Samsung SoC display controller (FIMD)
+
+FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
+the Samsung series of SoCs which transfers the image data from a video buffer
+located in the system memory to an external LCD interface.
+
+Required properties:
+- compatible := value should be one of the following
+		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
+		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
+		"samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
+		"samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
+		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
+		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
+		"samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
+
+- reg := physical base address of the fimd and length of memory mapped region
+
+- interrupt-parent := reference to the interrupt combiner node with phandle
+
+- interrupts := interrupt number from the combiner to the cpu.
+		We have 3 interrupts and the interrupt combiner order is
+		FIFO Level, VSYNC, and LCD_SYSTEM.
+		but since the driver expects VSYNC to be the first IRQ,
+		make sure to mention order as VSYNC, FIFO Level and LCD_SYSTEM
+		keeping VSYNC as first IRQ as shown below.
+		for example: interrupts = <11 1>, <11 0>, <11 2>;
+
+- pinctrl := property defining the pinctrl configurations with a phandle
+
+- pinctrl-names := name of the pinctrl
+
+Optional Properties:
+- samsung,power-domain := power domain property defined with a phandle
+
+Example:
+
+SoC specific DT Entry:
+
+	fimd@11c00000 {
+		compatible = "samsung,exynos4210-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x11c00000 0x20000>;
+		interrupts = <11 1>, <11 0>, <11 2>;
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
