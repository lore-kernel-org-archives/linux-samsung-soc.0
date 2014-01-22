From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 5/9] panel/s6e8aa0: add DT bindings
Date: Wed, 22 Jan 2014 15:35:31 +0100
Message-ID: <1390401336-22915-6-git-send-email-a.hajda@samsung.com>
References: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

The patch adds bindings for s6e8aa0 panel.
Bindings describes panel resources, boot delays,
display timings, orientation and physical size.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 .../devicetree/bindings/panel/samsung-s6e8aa0.txt  | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung-s6e8aa0.txt

diff --git a/Documentation/devicetree/bindings/panel/samsung-s6e8aa0.txt b/Documentation/devicetree/bindings/panel/samsung-s6e8aa0.txt
new file mode 100644
index 0000000..675e66e
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/samsung-s6e8aa0.txt
@@ -0,0 +1,53 @@
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
+  - samsung,panel-width-mm: physical panel width [mm]
+  - samsung,panel-height-mm: physical panel height [mm]
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
+		samsung,panel-width-mm = <58>;
+		samsung,panel-height-mm = <103>;
+		flip-horizontal;
+		flip-vertical;
+
+		display-timings {
+		        native-mode = <&timing0>;
+
+		        timing0: timing-0 {
+		                clock-frequency = <57153600>;
+		                hactive = <720>;
+		                vactive = <1280>;
+		                hfront-porch = <5>;
+		                hback-porch = <5>;
+		                hsync-len = <5>;
+		                vfront-porch = <13>;
+		                vback-porch = <1>;
+		                vsync-len = <2>;
+		        };
+		};
+	};
-- 
1.8.3.2
