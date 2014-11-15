From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V8 13/14] ARM: dts: snow: represent the connection between
 bridge and panel using videoport and endpoints
Date: Sat, 15 Nov 2014 15:25:08 +0530
Message-ID: <1416045309-13359-14-git-send-email-ajaykumar.rs@samsung.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28167 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752892AbaKOKC2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Nov 2014 05:02:28 -0500
In-reply-to: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, seanpaul@google.com, thierry.reding@gmail.com, daniel.vetter@ffwll.ch, ajaynumb@gmail.com, bhushan.r@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Define videoports and use endpoints to describe the connection between
the encoder, bridge and the panel, instead of using phandles.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index e51fcef..877117f 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -254,7 +254,20 @@
 			powerdown-gpios = <&gpy2 5 GPIO_ACTIVE_HIGH>;
 			reset-gpios = <&gpx1 5 GPIO_ACTIVE_HIGH>;
 			edid-emulation = <5>;
-			panel = <&panel>;
+
+			ports {
+				port@0 {
+					bridge_out: endpoint {
+						remote-endpoint = <&panel_in>;
+					};
+				};
+
+				port@1 {
+					bridge_in: endpoint {
+						remote-endpoint = <&dp_out>;
+					};
+				};
+			};
 		};
 	};
 
@@ -328,6 +341,12 @@
 		compatible = "auo,b116xw03";
 		power-supply = <&fet6>;
 		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
 	};
 
 	dp-controller@145B0000 {
@@ -341,7 +360,14 @@
 		samsung,link-rate = <0x0a>;
 		samsung,lane-count = <2>;
 		samsung,hpd-gpio = <&gpx0 7 0>;
-		bridge = <&ptn3460>;
+
+		ports {
+			port@0 {
+				dp_out: endpoint {
+					remote-endpoint = <&bridge_in>;
+				};
+			};
+		};
 	};
 };
 
-- 
1.7.9.5
