From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 19/21] ARM: dts: exynos5250-arndale: add dsi and panel
 nodes
Date: Wed, 12 Feb 2014 12:31:26 +0100
Message-ID: <1392204688-4591-20-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19395 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752595AbaBLLcs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:48 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds bridge and panel nodes.
It adds also DSI properties specific for arndale board.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index a0a985d..7d666b1 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -584,6 +584,45 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "boe,hv070wsa-100";
+		power-supply = <&vcc_3v3_reg>;
+		enable-gpios = <&gpd1 3 0>;
+		port {
+			panel_ep: endpoint {
+				remote-endpoint = <&bridge_out_ep>;
+			};
+		};
+	};
+
+	dsi_0: dsi@14500000 {
+		vddcore-supply = <&ldo8_reg>;
+		vddio-supply = <&ldo10_reg>;
+		samsung,pll-clock-frequency = <24000000>;
+		samsung,burst-clock-frequency = <320000000>;
+		samsung,esc-clock-frequency = <10000000>;
+		status = "okay";
+
+		bridge@0 {
+			reg = <0>;
+			compatible = "toshiba,tc358764";
+			vddc-supply = <&vcc_1v2_reg>;
+			vddio-supply = <&vcc_1v8_reg>;
+			vddmipi-supply = <&vcc_1v2_reg>;
+			vddlvds133-supply = <&vcc_3v3_reg>;
+			vddlvds112-supply = <&vcc_1v2_reg>;
+			reset-gpio = <&gpd1 6 1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@1 {
+				reg = <1>;
+				bridge_out_ep: endpoint {
+					remote-endpoint = <&panel_ep>;
+				};
+			};
+		};
+	};
+
 	fimd: fimd@14400000 {
 		status = "okay";
 	};
-- 
1.8.3.2
