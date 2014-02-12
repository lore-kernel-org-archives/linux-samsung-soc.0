From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 03/21] exynos/dsim: add DT bindings
Date: Wed, 12 Feb 2014 12:31:10 +0100
Message-ID: <1392204688-4591-4-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19333 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752154AbaBLLcM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:12 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds DT bindings for Exynos DSI Master. DSIM follows rules
for DSI bus host bindings [1].
Properties describes its resources: memory, interrupt, clocks,
phy, regulators and frequencies of clocks.

[1]: Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v2
- added burst and esc clock frequency properties
- add samsung prefix to all frequency props
---
 .../devicetree/bindings/video/exynos_dsim.txt      | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
new file mode 100644
index 0000000..2a49704
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -0,0 +1,53 @@
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
+  - samsung,burst-clock-frequency: specifies DSI frequency in high-speed burst
+    mode
+  - samsung,esc-clock-frequency: specifies DSI frequency in escape mode
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
+		samsung,pll-clock-frequency = <24000000>;
+		samsung,burst-clock-frequency = <500000000>;
+		samsung,esc-clock-frequency = <20000000>;
+
+		panel@0 {
+			reg = <0>;
+			...
+		};
+	};
-- 
1.8.3.2
