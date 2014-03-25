From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/3] panel/ld9040: add DT bindings
Date: Tue, 25 Mar 2014 13:10:34 +0100
Message-ID: <1395749436-24697-2-git-send-email-a.hajda@samsung.com>
References: <1395749436-24697-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53172 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753495AbaCYMLg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Mar 2014 08:11:36 -0400
In-reply-to: <1395749436-24697-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Thierry Reding <treding@nvidia.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM/SAMSUNG ARM A..." <linux-samsung-soc@vger.kernel.org>

The patch adds bindings for ld9040 panel.
Bindings describe panel resources, boot delays,
display timings and physical size.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 .../devicetree/bindings/panel/samsung,ld9040.txt   | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,ld9040.txt

diff --git a/Documentation/devicetree/bindings/panel/samsung,ld9040.txt b/Documentation/devicetree/bindings/panel/samsung,ld9040.txt
new file mode 100644
index 0000000..07c36c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/samsung,ld9040.txt
@@ -0,0 +1,66 @@
+Samsung LD9040 AMOLED LCD parallel RGB panel with SPI control bus
+
+Required properties:
+  - compatible: "samsung,ld9040"
+  - reg: address of the panel on SPI bus
+  - vdd3-supply: core voltage supply
+  - vci-supply: voltage supply for analog circuits
+  - reset-gpios: a GPIO spec for the reset pin
+  - display-timings: timings for the connected panel according to [1]
+
+The panel must obey rules for SPI slave device specified in document [2].
+
+Optional properties:
+  - power-on-delay: delay after turning regulators on [ms]
+  - reset-delay: delay after reset sequence [ms]
+  - panel-width-mm: physical panel width [mm]
+  - panel-height-mm: physical panel height [mm]
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [3]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/video/display-timing.txt
+[2]: Documentation/devicetree/bindings/spi/spi-bus.txt
+[3]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	lcd@0 {
+		compatible = "samsung,ld9040";
+		reg = <0>;
+		vdd3-supply = <&ldo7_reg>;
+		vci-supply = <&ldo17_reg>;
+		reset-gpios = <&gpy4 5 0>;
+		spi-max-frequency = <1200000>;
+		spi-cpol;
+		spi-cpha;
+		power-on-delay = <10>;
+		reset-delay = <10>;
+		panel-width-mm = <90>;
+		panel-height-mm = <154>;
+
+		display-timings {
+			timing {
+				clock-frequency = <23492370>;
+				hactive = <480>;
+				vactive = <800>;
+				hback-porch = <16>;
+				hfront-porch = <16>;
+				vback-porch = <2>;
+				vfront-porch = <28>;
+				hsync-len = <2>;
+				vsync-len = <1>;
+				hsync-active = <0>;
+				vsync-active = <0>;
+				de-active = <0>;
+				pixelclk-active = <0>;
+			};
+		};
+
+		port {
+			lcd_ep: endpoint {
+				remote-endpoint = <&fimd_dpi_ep>;
+			};
+		};
+	};
-- 
1.8.3.2
