From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 04/12] exynos/dsim: add DT bindings
Date: Fri, 28 Mar 2014 12:52:39 +0100
Message-ID: <1396007567-4015-5-git-send-email-a.hajda@samsung.com>
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

The patch adds DT bindings for Exynos DSI Master. DSIM follows rules
for DSI bus host bindings [1].
Properties describes its resources: memory, interrupt, clocks,
phy, regulators, frequencies of clocks and video interfaces.

[1]: Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2
- added burst and esc clock frequency properties
- add samsung prefix to all frequency props

v3
- reset-gpio changed to reset-gpios property
- added video interface bindings
- properties related to video interface moved to endpoint node

dsim bindings
---
 .../devicetree/bindings/video/exynos_dsim.txt      | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
new file mode 100644
index 0000000..33b5730
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -0,0 +1,80 @@
+Exynos MIPI DSI Master
+
+Required properties:
+  - compatible: "samsung,exynos4210-mipi-dsi"
+  - reg: physical base address and length of the registers set for the device
+  - interrupts: should contain DSI interrupt
+  - clocks: list of clock specifiers, must contain an entry for each required
+    entry in clock-names
+  - clock-names: should include "bus_clk"and "pll_clk" entries
+  - phys: list of phy specifiers, must contain an entry for each required
+    entry in phy-names
+  - phy-names: should include "dsim" entry
+  - vddcore-supply: MIPI DSIM Core voltage supply (e.g. 1.1V)
+  - vddio-supply: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
+  - samsung,pll-clock-frequency: specifies frequency of the "pll_clk" clock
+  - #address-cells, #size-cells: should be set respectively to <1> and <0>
+    according to DSI host bindings (see MIPI DSI bindings [1])
+
+Optional properties:
+  - samsung,power-domain: a phandle to DSIM power domain node
+
+Child nodes:
+  Should contain DSI peripheral nodes (see MIPI DSI bindings [1]).
+
+Video interfaces:
+  Device node can contain video interface port nodes according to [2].
+  The following are properties specific to those nodes:
+
+  port node:
+    - reg: (required) can be 0 for input RGB/I80 port or 1 for DSI port;
+
+  endpoint node of DSI port (reg = 1):
+    - samsung,burst-clock-frequency: specifies DSI frequency in high-speed burst
+      mode
+    - samsung,esc-clock-frequency: specifies DSI frequency in escape mode
+
+[1]: Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	dsi@11C80000 {
+		compatible = "samsung,exynos4210-mipi-dsi";
+		reg = <0x11C80000 0x10000>;
+		interrupts = <0 79 0>;
+		clocks = <&clock 286>, <&clock 143>;
+		clock-names = "bus_clk", "pll_clk";
+		phys = <&mipi_phy 1>;
+		phy-names = "dsim";
+		vddcore-supply = <&vusb_reg>;
+		vddio-supply = <&vmipi_reg>;
+		samsung,power-domain = <&pd_lcd0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		samsung,pll-clock-frequency = <24000000>;
+
+		panel@1 {
+			reg = <0>;
+			...
+			port {
+				panel_ep: endpoint {
+					remote-endpoint = <&dsi_ep>;
+				};
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				dsi_ep: endpoint {
+					reg = <0>;
+					samsung,burst-clock-frequency = <500000000>;
+					samsung,esc-clock-frequency = <20000000>;
+					remote-endpoint = <&panel_ep>;
+				};
+			};
+		};
+	};
-- 
1.8.3.2
