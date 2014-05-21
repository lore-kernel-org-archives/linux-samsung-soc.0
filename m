From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH] Documentation: remove gpio-samsung device tree bindings
 documentation
Date: Wed, 21 May 2014 20:22:27 +0900
Message-ID: <537C8C73.8050606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14622 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbaEULWf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 07:22:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

This patch remove gpio-samsung device tree bindings documentation.
Already a pictrl driver used for exynos4 and 5. If want to know about
gpio pin control(e.g. mux function, confiugration), refer to samsung-pinctrl
device tree bindings documentation.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
---
 .../devicetree/bindings/gpio/gpio-samsung.txt      |   41 --------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-samsung.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt b/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
deleted file mode 100644
index 5375625..0000000
--- a/Documentation/devicetree/bindings/gpio/gpio-samsung.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Samsung Exynos4 GPIO Controller
-
-Required properties:
-- compatible: Compatible property value should be "samsung,exynos4-gpio>".
-
-- reg: Physical base address of the controller and length of memory mapped
-  region.
-
-- #gpio-cells: Should be 4. The syntax of the gpio specifier used by client nodes
-  should be the following with values derived from the SoC user manual.
-     <[phandle of the gpio controller node]
-      [pin number within the gpio controller]
-      [mux function]
-      [flags and pull up/down]
-      [drive strength]>
-
-  Values for gpio specifier:
-  - Pin number: is a value between 0 to 7.
-  - Flags and Pull Up/Down: 0 - Pull Up/Down Disabled.
-                            1 - Pull Down Enabled.
-                            3 - Pull Up Enabled.
-          Bit 16 (0x00010000) - Input is active low.
-  - Drive Strength: 0 - 1x,
-                    1 - 3x,
-                    2 - 2x,
-                    3 - 4x
-
-- gpio-controller: Specifies that the node is a gpio controller.
-- #address-cells: should be 1.
-- #size-cells: should be 1.
-
-Example:
-
-	gpa0: gpio-controller@11400000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "samsung,exynos4-gpio";
-		reg = <0x11400000 0x20>;
-		#gpio-cells = <4>;
-		gpio-controller;
-	};
-- 
1.7.9.5
