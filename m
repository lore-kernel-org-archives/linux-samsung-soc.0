From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v2 13/18] ARM: dts: s6e3fa0: add DT bindings
Date: Wed, 21 May 2014 13:43:05 +0900
Message-ID: <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds DT bindings for s6e3fa0 panel.
The bindings describes panel resources, display timings and cpu mode timings.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt

diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
new file mode 100644
index 0000000..c9a3fbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
@@ -0,0 +1,45 @@
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
+  - cmdmode-display-timings: command mode interface timings for the connected
+      panel as described by [1]
+
+Optional properties:
+
+The device node can contain one 'port' child node with one child 'endpoint'
+node, according to the bindings defined in [2]. This node should describe
+panel's video bus.
+
+[1]: Documentation/devicetree/bindings/video/cmdmode-display-timing.txt
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
+		cmdmode-display-timings {
+			timing-0 {
+				clock-frequency = <0>;
+				hactive = <1080>;
+				vactive = <1920>;
+				cs-setup = <0>;
+				wr-setup = <0>;
+				wr-active = <1>;
+				wr-hold = <0>;
+			};
+		};
+	};
-- 
1.7.9.5
