From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v3 10/15] ARM: dts: s6e3fa0: add DT bindings
Date: Mon, 02 Jun 2014 14:22:46 +0900
Message-ID: <1401686571-22148-11-git-send-email-yj44.cho@samsung.com>
References: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30914 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848AbaFBFW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 01:22:59 -0400
In-reply-to: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

This patch adds DT bindings for s6e3fa0 panel.
The bindings describes panel resources and display timings.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt

diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
new file mode 100644
index 0000000..2cd32f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
@@ -0,0 +1,46 @@
+Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
+
+Required properties:
+  - compatible: "samsung,s6e3fa0"
+  - reg: the virtual channel number of a DSI peripheral
+  - vdd3-supply: core voltage supply
+  - vci-supply: voltage supply for analog circuits
+  - reset-gpios: a GPIO spec for the reset pin
+  - det-gpios: a GPIO spec for the OLED detection pin
+  - te-gpios: a GPIO spec for the TE pin
+  - display-timings: timings for the connected panel as described by [1]
+
+Optional properties:
+
+The device node can contain one 'port' child node with one child 'endpoint'
+node, according to the bindings defined in [2]. This node should describe
+panel's video bus.
+
+[1]: Documentation/devicetree/bindings/video/display-timing.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	panel@0 {
+		compatible = "samsung,s6e3fa0";
+		reg = <0>;
+		vdd3-supply = <&vcclcd_reg>;
+		vci-supply = <&vlcd_reg>;
+		reset-gpios = <&gpy7 4 0>;
+		det-gpios = <&gpg0 6 0>;
+		te-gpios = <&gpd1 7 0>;
+
+		display-timings {
+			timings0 {
+				clock-frequency = <0>;
+				hactive = <1080>;
+				vactive = <1920>;
+				hfront-porch = <2>;
+				hback-porch = <2>;
+				hsync-len = <1>;
+				vfront-porch = <1>;
+				vback-porch = <4>;
+				vsync-len = <1>;
+			};
+		};
+	};
-- 
1.7.9.5
