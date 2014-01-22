From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 3/9] exynos/dsim: add DT bindings
Date: Wed, 22 Jan 2014 15:35:29 +0100
Message-ID: <1390401336-22915-4-git-send-email-a.hajda@samsung.com>
References: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22997 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755891AbaAVOgT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jan 2014 09:36:19 -0500
In-reply-to: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <t.figa@samsung.com>

The patch adds DT bindings for Exynos DSI Master. DSIM follows rules
for DSI bus host bindings [1].
Other properties describes its resources: memory, interrupt, clocks,
phy, regulators.
There is only one configuration property: pll-clock-frequency.

[1]: Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 .../devicetree/bindings/video/exynos_dsim.txt      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
new file mode 100644
index 0000000..0246e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -0,0 +1,48 @@
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
+  - pll-clock-frequency: specifies frequency of "pll_clk" clock
+  - #address-cells, #size-cells: should be set respectively to <1> and <0>
+    according to DSI host bindings (see MIPI DSI bindings [1])
+
+Optional properties:
+  - samsung,power-domain: a phandle to DSIM power domain node
+
+Child nodes:
+  Should contain DSI peripheral nodes (see DSI bindings [1])
+
+[1]: Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
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
+		pll-clock-frequency = <24000000>;
+
+		panel@0 {
+			reg = <0>;
+			...
+		};
+	};
-- 
1.8.3.2
