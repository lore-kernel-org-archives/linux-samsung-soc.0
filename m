From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 06/12] panel/s6e8aa0: add DT bindings
Date: Fri, 28 Mar 2014 12:52:41 +0100
Message-ID: <1396007567-4015-7-git-send-email-a.hajda@samsung.com>
References: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds bindings for s6e8aa0 panel.
Bindings describes panel resources, boot delays,
display timings, orientation and physical size.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2
- removed samsung prefix from panel physical size props,
- renamed file to follow convention of panel bindings

v3
- reset-gpio renamed to reset-gpios
- added video interfaces bindings
---
 .../devicetree/bindings/panel/samsung,s6e8aa0.txt  | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt

diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
new file mode 100644
index 0000000..e7ee988
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/samsung,s6e8aa0.txt
@@ -0,0 +1,56 @@
+Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
+
+Required properties:
+  - compatible: "samsung,s6e8aa0"
+  - reg: the virtual channel number of a DSI peripheral
+  - vdd3-supply: core voltage supply
+  - vci-supply: voltage supply for analog circuits
+  - reset-gpios: a GPIO spec for the reset pin
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
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [2]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/video/display-timing.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	panel {
+		compatible = "samsung,s6e8aa0";
+		reg = <0>;
+		vdd3-supply = <&vcclcd_reg>;
+		vci-supply = <&vlcd_reg>;
+		reset-gpios = <&gpy4 5 0>;
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
