From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 07/21] panel/tc358764: add DT bindings
Date: Wed, 12 Feb 2014 12:31:14 +0100
Message-ID: <1392204688-4591-8-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25005 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622AbaBLLcV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:21 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch add bindings to Toshiba DSI/LVDS bridge TC358764.
Bindings describes power supplies, reset gpio and video interfaces.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 .../devicetree/bindings/panel/toshiba,tc358764.txt | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/toshiba,tc358764.txt

diff --git a/Documentation/devicetree/bindings/panel/toshiba,tc358764.txt b/Documentation/devicetree/bindings/panel/toshiba,tc358764.txt
new file mode 100644
index 0000000..fe3e2f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/toshiba,tc358764.txt
@@ -0,0 +1,41 @@
+TC358764 MIPI-DSI to LVDS panel bridge
+
+Required properties:
+  - compatible: "toshiba,tc358764"
+  - reg: the virtual channel number of a DSI peripheral
+  - vddc-supply: core voltage supply
+  - vddio-supply: I/O voltage supply
+  - vddmipi-supply: MIPI voltage supply
+  - vddlvds133-supply: LVDS1 3.3V voltage supply
+  - vddlvds112-supply: LVDS1 1.2V voltage supply
+  - reset-gpio: a GPIO spec for the reset pin
+
+The device node can contain zero to two 'port' child nodes, each with one child
+'endpoint' node, according to the bindings defined in [1].
+The following are properties specific to those nodes.
+
+port:
+  - reg: (required) can be 0 for DSI port or 1 for LVDS port;
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	bridge@0 {
+		reg = <0>;
+		compatible = "toshiba,tc358764";
+		vddc-supply = <&vcc_1v2_reg>;
+		vddio-supply = <&vcc_1v8_reg>;
+		vddmipi-supply = <&vcc_1v2_reg>;
+		vddlvds133-supply = <&vcc_3v3_reg>;
+		vddlvds112-supply = <&vcc_1v2_reg>;
+		reset-gpio = <&gpd1 6 1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@1 {
+			reg = <1>;
+			lvds_ep: endpoint {
+				remote-endpoint = <&panel_ep>;
+			};
+		};
+	};
-- 
1.8.3.2
