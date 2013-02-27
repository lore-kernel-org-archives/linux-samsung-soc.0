From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Wed, 27 Feb 2013 14:13:40 +0530
Message-ID: <1361954620-20614-6-git-send-email-vikas.sajjan@linaro.org>
References: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:52041 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757014Ab3B0IoR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 03:44:17 -0500
Received: by mail-da0-f49.google.com with SMTP id t11so191195daj.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 00:44:17 -0800 (PST)
In-Reply-To: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, sachin.kamat@linaro.org, joshi@samsung.com

Adds FIMD DT binding documentation both SoC and Board, with an example

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 .../devicetree/bindings/video/exynos-fimd.txt      |   46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/exynos-fimd.txt

diff --git a/Documentation/devicetree/bindings/video/exynos-fimd.txt b/Documentation/devicetree/bindings/video/exynos-fimd.txt
new file mode 100644
index 0000000..b3542b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos-fimd.txt
@@ -0,0 +1,46 @@
+Device-Tree bindings for Exynos SoC display controller (FIMD)
+
+FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
+the Exynos series of SoCs which transfers the image data from a video buffer
+located in the system memory to an external LCD interface.
+
+Required properties:
+- compatible := value can be one these below
+		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
+		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
+		"samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
+		"samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
+		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
+		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
+		"samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
+- reg := physical base address of the fimd and length of memory mapped region
+- interrupt-parent := reference to the interrupt combiner node with phandle
+- interrupts := interrupt number from the combiner to the cpu
+		we have 3 interrupts and the Interrupt combiner order is
+		FIFO Level, VSYNC and LCD_SYSTEM. Make sure to mention order
+		as VSYNC, FIFO Level and LCD_SYSTEM as show in the example below.
+- pinctrl := property defining the pinctrl configurations with a phandle
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
