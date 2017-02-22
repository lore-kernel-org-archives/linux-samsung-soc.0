From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v10 1/3] dt-bindings: Add support for samsung s6e3ha2 panel
 binding
Date: Wed, 22 Feb 2017 10:09:51 +0900
Message-ID: <8e5109d0-6e6f-8bf8-7f9b-b7a5ddcbcf1e@samsung.com>
References: <1487574582-15746-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170220071000epcas1p3fbc906fa085931b73b895b6724432cd3@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58192 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752951AbdBVBJy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Feb 2017 20:09:54 -0500
In-reply-to: <CGME20170220071000epcas1p3fbc906fa085931b73b895b6724432cd3@epcas1p3.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, inki.dae@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>

The Samsung s6e3ha2 is a 5.7" 1440x2560 AMOLED panel connected
using MIPI-DSI interfaces.

Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
  .../bindings/display/panel/samsung,s6e3ha2.txt     | 28 
++++++++++++++++++++++
  1 file changed, 28 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt

diff --git 
a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt 
b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
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
