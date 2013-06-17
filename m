From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] Documentation: Add examples to samsung-pinctrl device tree
 bindings documentation
Date: Mon, 17 Jun 2013 16:14:55 +0530
Message-ID: <1371465896-2762-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18550 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932566Ab3FQKVM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 06:21:12 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOJ001P98QRZIF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 19:21:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, dianders@chromium.org

This patch adds examples to samsung-pinctrl.txt documentaion file
on how to make gpio binding and gpio request

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
 .../bindings/pinctrl/samsung-pinctrl.txt           |   48 +++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index b2bc219..f1cf177 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -25,8 +25,18 @@ Required Properties:
 
   - gpio-controller: identifies the node as a gpio controller and pin bank.
   - #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
-    binding is used, the amount of cells must be specified as 2. See generic
-    GPIO binding documentation for description of particular cells.
+    binding is used, the amount of cells must be specified as 2. See the below
+    mentioned gpio binding representation for description of particular cells.
+
+	Eg: <&gpx2 6 0>
+	<[phandle of the gpio controller node]
+	[pin number within the gpio controller]
+	[flags]>
+
+	Values for gpio specifier:
+	- Pin number: is a value between 0 to 7.
+	- Flags: 0 - Active High
+		 1 - Active Low
 
 - Pin mux/config groups as child nodes: The pin mux (selecting pin function
   mode) and pin config (pull up/down, driver strength) settings are represented
@@ -274,3 +284,37 @@ Example 4: Set up the default pin state for uart controller.
 
 		pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
 	}
+
+Example 5: A display port client node that supports 'default' pinctrl state
+	   and gpio binding.
+
+	display-port-controller {
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x06>;
+		samsung,lane-count = <2>;
+		samsung,hpd-gpio = <&gpx2 6 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_hpd>;
+	};
+
+Example 6: Request the gpio for display port controller
+
+	static int exynos_dp_probe(struct platform_device *pdev)
+	{
+		int hpd_gpio, ret;
+		struct device *dev = &pdev->dev;
+		struct device_node *dp_node = dev->of_node;
+
+		/* ... */
+
+		hpd_gpio = of_get_named_gpio(dp_node, "samsung,hpd-gpio", 0);
+
+		/* ... */
+
+		ret = devm_gpio_request_one(&pdev->dev, hpd_gpio, GPIOF_IN,
+					    "hpd_gpio");
+		/* ... */
+	}
-- 
1.7.9.5
