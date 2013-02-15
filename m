From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Fri, 15 Feb 2013 12:40:00 +0530
Message-ID: <1360912200-26377-6-git-send-email-vikas.sajjan@linaro.org>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:56226 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753482Ab3BOHKd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 02:10:33 -0500
Received: by mail-pb0-f50.google.com with SMTP id up1so511024pbc.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Feb 2013 23:10:33 -0800 (PST)
In-Reply-To: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds FIMD DT binding documentation both SoC and Board, with an example

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 .../devicetree/bindings/drm/exynos/fimd.txt        |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
new file mode 100644
index 0000000..bec9d07
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
@@ -0,0 +1,37 @@
+Device-Tree bindings for fimd driver
+
+FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
+the Exynos series of SoCs which transfers the image data from a video buffer
+located in the system memory to an external LCD interface.
+
+Required properties:
+- compatible := value should be "samsung,exynos5-fimd" or "samsung,exynos4-fimd"
+- reg := physical base address of the fimd and length of memory mapped region
+- interrupt-parent := reference to the interrupt combiner node with phandle
+- interrupts := interrupt number from the combiner to the cpu
+- pinctrl := property defining the pinctrl configurations with a phandle
+- pinctrl-names := name of the pinctrl
+
+Optional Properties:
+- samsung,power-domain := power domain property defined with a phandle
+- status := property defining the status of the node
+
+Example:
+
+SoC specific DT Entry:
+
+	fimd@11c00000 {
+		compatible = "samsung,exynos4-fimd";
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
