From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 05/21] panel/s6e8aa0: add DT bindings
Date: Wed, 12 Feb 2014 12:31:12 +0100
Message-ID: <1392204688-4591-6-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:13449 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622AbaBLLcS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:18 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds bindings for s6e8aa0 panel.
Bindings describes panel resources, boot delays,
display timings, orientation and physical size.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2
- removed samsung prefix from panel physical size props,
- renamed file to follow convention of panel bindings
---
 .../devicetree/bindings/panel/samsung,s6e8aa0.txt  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt

diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
new file mode 100644
index 0000000..75a64db
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
@@ -0,0 +1,51 @@
+Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
+
+Required properties:
+  - compatible: "samsung,s6e8aa0"
+  - reg: the virtual channel number of a DSI peripheral
+  - vdd3-supply: core voltage supply
+  - vci-supply: voltage supply for analog circuits
+  - reset-gpio: a GPIO spec for the reset pin
+  - display-timings: timings for the connected panel as described by [1]
+
+Optional properties:
+  - power-on-delay: delay after turning regulators on [ms]
+  - reset-delay: delay after reset sequence [ms]
+  - init-delay: delay after initialization sequence [ms]
+  - panel-width-mm: physical panel width [mm]
+  - panel-height-mm: physical panel height [mm]
+  - flip-horizontal: boolean to flip image horizontally
+  - flip-vertical: boolean to flip image vertically
+
+[1]: Documentation/devicetree/bindings/video/display-timing.txt
+
+Example:
+
+	panel {
+		compatible = "samsung,s6e8aa0";
+		reg = <0>;
+		vdd3-supply = <&vcclcd_reg>;
+		vci-supply = <&vlcd_reg>;
+		reset-gpio = <&gpy4 5 0>;
+		power-on-delay= <50>;
+		reset-delay = <100>;
+		init-delay = <100>;
+		panel-width-mm = <58>;
+		panel-height-mm = <103>;
+		flip-horizontal;
+		flip-vertical;
+
+		display-timings {
+			timing0: timing-0 {
+				clock-frequency = <57153600>;
+				hactive = <720>;
+				vactive = <1280>;
+				hfront-porch = <5>;
+				hback-porch = <5>;
+				hsync-len = <5>;
+				vfront-porch = <13>;
+				vback-porch = <1>;
+				vsync-len = <2>;
+			};
+		};
+	};
-- 
1.8.3.2
