From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/2] ARM: dts: fix compatible value for exynos pinctrl
Date: Wed, 02 Jan 2013 16:20:23 -0800
Message-ID: <1357172423-8217-2-git-send-email-kgene.kim@samsung.com>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55963 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753023Ab3ACA12 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 19:27:28 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000NJKX943B20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 09:27:27 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG000A0GX9LNY20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 09:27:26 +0900 (KST)
In-reply-to: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org

Fix the incorrect compatible property value of pinctrl for EXYNOS4 SoCs.

Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org
---
 .../devicetree/bindings/pinctrl/samsung-pinctrl.txt        |   12 ++++++------
 arch/arm/boot/dts/exynos4210.dtsi                          |    6 +++---
 arch/arm/boot/dts/exynos4x12.dtsi                          |    8 ++++----
 arch/arm/mach-exynos/common.c                              |    4 ++--
 drivers/gpio/gpio-samsung.c                                |    4 ++--
 drivers/pinctrl/pinctrl-samsung.c                          |    4 ++--
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index e97a278..4598a47 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -7,9 +7,9 @@ on-chip controllers onto these pads.
 
 Required Properties:
 - compatible: should be one of the following.
-  - "samsung,pinctrl-exynos4210": for Exynos4210 compatible pin-controller.
-  - "samsung,pinctrl-exynos4x12": for Exynos4x12 compatible pin-controller.
-  - "samsung,pinctrl-exynos5250": for Exynos5250 compatible pin-controller.
+  - "samsung,exynos4210-pinctrl": for Exynos4210 compatible pin-controller.
+  - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-controller.
+  - "samsung,exynos5250-pinctrl": for Exynos5250 compatible pin-controller.
 
 - reg: Base address of the pin controller hardware module and length of
   the address space it occupies.
@@ -142,7 +142,7 @@ the following format 'pinctrl{n}' where n is a unique number for the alias.
 Example: A pin-controller node with pin banks:
 
 	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,pinctrl-exynos4210";
+		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x11400000 0x1000>;
 		interrupts = <0 47 0>;
 
@@ -185,7 +185,7 @@ Example: A pin-controller node with pin banks:
 Example 1: A pin-controller node with pin groups.
 
 	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,pinctrl-exynos4210";
+		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x11400000 0x1000>;
 		interrupts = <0 47 0>;
 
@@ -230,7 +230,7 @@ Example 1: A pin-controller node with pin groups.
 Example 2: A pin-controller node with external wakeup interrupt controller node.
 
 	pinctrl_1: pinctrl@11000000 {
-		compatible = "samsung,pinctrl-exynos4210";
+		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x11000000 0x1000>;
 		interrupts = <0 46 0>
 
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index e31bfc4..2feffc7 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -48,13 +48,13 @@
 	};
 
 	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,pinctrl-exynos4210";
+		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x11400000 0x1000>;
 		interrupts = <0 47 0>;
 	};
 
 	pinctrl_1: pinctrl@11000000 {
-		compatible = "samsung,pinctrl-exynos4210";
+		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x11000000 0x1000>;
 		interrupts = <0 46 0>;
 
@@ -66,7 +66,7 @@
 	};
 
 	pinctrl_2: pinctrl@03860000 {
-		compatible = "samsung,pinctrl-exynos4210";
+		compatible = "samsung,exynos4210-pinctrl";
 		reg = <0x03860000 0x1000>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 179a62e..9a87806 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -37,13 +37,13 @@
 	};
 
 	pinctrl_0: pinctrl@11400000 {
-		compatible = "samsung,pinctrl-exynos4x12";
+		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x11400000 0x1000>;
 		interrupts = <0 47 0>;
 	};
 
 	pinctrl_1: pinctrl@11000000 {
-		compatible = "samsung,pinctrl-exynos4x12";
+		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x11000000 0x1000>;
 		interrupts = <0 46 0>;
 
@@ -55,14 +55,14 @@
 	};
 
 	pinctrl_2: pinctrl@03860000 {
-		compatible = "samsung,pinctrl-exynos4x12";
+		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x03860000 0x1000>;
 		interrupt-parent = <&combiner>;
 		interrupts = <10 0>;
 	};
 
 	pinctrl_3: pinctrl@106E0000 {
-		compatible = "samsung,pinctrl-exynos4x12";
+		compatible = "samsung,exynos4x12-pinctrl";
 		reg = <0x106E0000 0x1000>;
 		interrupts = <0 72 0>;
 	};
diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index d6d0dc6..3777a41 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -1024,8 +1024,8 @@ static int __init exynos_init_irq_eint(void)
 	 * interrupt support code here can be completely removed.
 	 */
 	static const struct of_device_id exynos_pinctrl_ids[] = {
-		{ .compatible = "samsung,pinctrl-exynos4210", },
-		{ .compatible = "samsung,pinctrl-exynos4x12", },
+		{ .compatible = "samsung,exynos4210-pinctrl", },
+		{ .compatible = "samsung,exynos4x12-pinctrl", },
 	};
 	struct device_node *pctrl_np, *wkup_np;
 	const char *wkup_compat = "samsung,exynos4210-wakeup-eint";
diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index cac4b45..8c00f7d 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -3024,8 +3024,8 @@ static __init int samsung_gpiolib_init(void)
 	*/
 	struct device_node *pctrl_np;
 	static const struct of_device_id exynos_pinctrl_ids[] = {
-		{ .compatible = "samsung,pinctrl-exynos4210", },
-		{ .compatible = "samsung,pinctrl-exynos4x12", },
+		{ .compatible = "samsung,exynos4210-pinctrl", },
+		{ .compatible = "samsung,exynos4x12-pinctrl", },
 		{ .compatible = "samsung,exynos5440-pinctrl", },
 	};
 	for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index 864fed8..602b30b 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -945,9 +945,9 @@ static int __devinit samsung_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id samsung_pinctrl_dt_match[] = {
-	{ .compatible = "samsung,pinctrl-exynos4210",
+	{ .compatible = "samsung,exynos4210-pinctrl",
 		.data = (void *)exynos4210_pin_ctrl },
-	{ .compatible = "samsung,pinctrl-exynos4x12",
+	{ .compatible = "samsung,exynos4x12-pinctrl",
 		.data = (void *)exynos4x12_pin_ctrl },
 	{},
 };
-- 
1.7.10.4
