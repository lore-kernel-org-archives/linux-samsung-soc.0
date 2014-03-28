From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 09/12] ARM: dts: exynos4210-trats: add panel node
Date: Fri, 28 Mar 2014 12:52:44 +0100
Message-ID: <1396007567-4015-10-git-send-email-a.hajda@samsung.com>
References: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56967 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053AbaC1Lxh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 07:53:37 -0400
In-reply-to: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds s6e8aa0 panel node for trats.
It adds also trats specific properties for DSI.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 57 ++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 63cc571..996c7e3 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -353,6 +353,63 @@
 		};
 	};
 
+	dsi_0: dsi@11C80000 {
+		vddcore-supply = <&vusb_reg>;
+		vddio-supply = <&vmipi_reg>;
+		samsung,pll-clock-frequency = <24000000>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				dsi_out: endpoint {
+					remote-endpoint = <&dsi_in>;
+					samsung,burst-clock-frequency = <500000000>;
+					samsung,esc-clock-frequency = <20000000>;
+				};
+			};
+		};
+
+		panel@0 {
+			reg = <0>;
+			compatible = "samsung,s6e8aa0";
+			vdd3-supply = <&vcclcd_reg>;
+			vci-supply = <&vlcd_reg>;
+			reset-gpios = <&gpy4 5 0>;
+			power-on-delay= <50>;
+			reset-delay = <100>;
+			init-delay = <100>;
+			flip-horizontal;
+			flip-vertical;
+			panel-width-mm = <58>;
+			panel-height-mm = <103>;
+
+			display-timings {
+				timing-0 {
+					clock-frequency = <57153600>;
+					hactive = <720>;
+					vactive = <1280>;
+					hfront-porch = <5>;
+					hback-porch = <5>;
+					hsync-len = <5>;
+					vfront-porch = <13>;
+					vback-porch = <1>;
+					vsync-len = <2>;
+				};
+			};
+
+			port {
+				dsi_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+		};
+	};
+
 	camera {
 		pinctrl-names = "default";
 		pinctrl-0 = <>;
-- 
1.8.3.2
