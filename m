From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v9 1/3] dt-bindings: Add support for samsung s6e3ha2 panel
 binding
Date: Wed, 01 Feb 2017 16:46:52 +0900
Message-ID: <1485935214-16210-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1485935214-16210-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170201074711epcas1p3c7f9542d5b6a4501dd7d440d866951ec@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56816 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751302AbdBAHrO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 02:47:14 -0500
In-reply-to: <1485935214-16210-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, Donghwa Lee <dh09.lee@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

The Samsung s6e3ha2 is a 5.7" 1440x2560 AMOLED panel connected
using MIPI-DSI interfaces.

Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/samsung,s6e3ha2.txt     | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
new file mode 100644
index 0000000..18854f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
@@ -0,0 +1,28 @@
+Samsung S6E3HA2 5.7" 1440x2560 AMOLED panel
+
+Required properties:
+  - compatible: "samsung,s6e3ha2"
+  - reg: the virtual channel number of a DSI peripheral
+  - vdd3-supply: I/O voltage supply
+  - vci-supply: voltage supply for analog circuits
+  - reset-gpios: a GPIO spec for the reset pin (active low)
+  - enable-gpios: a GPIO spec for the panel enable pin (active high)
+
+Optional properties:
+  - te-gpios: a GPIO spec for the tearing effect synchronization signal
+    gpio pin (active high)
+
+Example:
+&dsi {
+	...
+
+	panel@0 {
+		compatible = "samsung,s6e3ha2";
+		reg = <0>;
+		vdd3-supply = <&ldo27_reg>;
+		vci-supply = <&ldo28_reg>;
+		reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
+		te-gpios = <&gpf1 3 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
1.9.1
